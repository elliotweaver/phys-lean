#!/bin/bash
# gate-watchdog.sh — the TIMED full-battery watchdog + FAILURE VALVE.
# ============================================================================
# Runs the read-only full battery (scripts/gate-full.sh) against current HEAD.
# This is the SAFETY VALVE that re-verifies the entire frozen history on a
# wall-clock cadence (every 3 hours via cron), independent of node flow.
#
#   - On PASS  → SILENT (writes a PASS sentinel log; says nothing to anyone).
#                A watchdog that cries every 3h is noise; green is the norm.
#   - On FAIL  → this should be a RARE, UNEXPECTED exception. It means the
#                frozen history or the environment regressed. Then:
#                  (1) create a TRIAGE ticket on the phys-novelty board with
#                      the failing directions + log path + HEAD sha, and
#                  (2) BLOCK the currently-running node (--kind capability →
#                      goes to `blocked` for a HUMAN), so the chain halts and
#                      a human decides how to handle the exception.
#                A human sees the block + the ticket and takes it from there.
#
# CONCURRENCY: gate-full.sh does NOT build (read-only), so running it while a
# worker develops the next node is W4-safe. A lock prevents overlapping
# watchdog runs (a slow battery must not stack on the next 3h tick).
#
# This script IS allowed to touch the board (that is its job). It never edits
# repo source and never commits.
# ============================================================================
set -uo pipefail

REPO="${REPO:-/Users/elliotweaver/phys-lean}"
BOARD="${BOARD:-phys-novelty}"
HERMES="${HERMES:-hermes}"
LOGDIR="$REPO/docs/gate-logs"
LOCK="/tmp/phys-gate-watchdog.lock"
TRIGGER="${1:-timed}"   # 'timed' (cron) or 'escalation' (manual)
cd "$REPO" || { echo "FATAL: cannot cd $REPO"; exit 2; }
mkdir -p "$LOGDIR"

# ---- single-flight lock (don't stack watchdog runs) ----
if [ -d "$LOCK" ]; then
  # stale-lock guard: if older than 40 min, assume dead and reclaim
  if [ -n "$(find "$LOCK" -maxdepth 0 -mmin +40 2>/dev/null)" ]; then
    rmdir "$LOCK" 2>/dev/null || true
  else
    echo "watchdog: a prior run still holds the lock ($LOCK) — skipping this tick."
    exit 0
  fi
fi
mkdir "$LOCK" 2>/dev/null || { echo "watchdog: could not acquire lock — skipping."; exit 0; }
trap 'rmdir "$LOCK" 2>/dev/null || true' EXIT

SHA="$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"
STAMP="$(date '+%Y%m%d-%H%M%S')"
LOG="$LOGDIR/full-$SHA-$STAMP.log"

echo "watchdog[$TRIGGER]: running read-only full battery vs HEAD $SHA → $LOG"
bash "$REPO/scripts/gate-full.sh" > "$LOG" 2>&1
RC=$?

if [ "$RC" -eq 0 ]; then
  # PASS → silent. Keep a rolling PASS sentinel; prune old logs.
  ln -sf "$(basename "$LOG")" "$LOGDIR/LAST-FULL-PASS.log" 2>/dev/null || true
  # keep last 30 full logs
  ls -1t "$LOGDIR"/full-*.log 2>/dev/null | tail -n +31 | xargs rm -f 2>/dev/null || true
  echo "watchdog[$TRIGGER]: GATE-FULL PASSED (HEAD $SHA) — silent."
  exit 0
fi

# ---- FAIL: the safety valve fires ----
echo "watchdog[$TRIGGER]: GATE-FULL FAILED (HEAD $SHA) — firing safety valve."
ln -sf "$(basename "$LOG")" "$LOGDIR/LAST-FULL-FAIL.log" 2>/dev/null || true
FAILLINES="$(grep -E 'FAILING|FAILED' "$LOG" | head -20)"

# (1) create a TRIAGE ticket (parked; NOT dispatched to the worker)
TITLE="⛔ GATE-FULL REGRESSION @ $SHA ($TRIGGER $STAMP) — frozen history / env regressed"
BODY="The read-only full battery (scripts/gate-full.sh) FAILED against HEAD $SHA.
This is an UNEXPECTED exception: the append-only frozen history or the build
environment regressed (a costume stopped biting, a banked theorem's axiom
footprint drifted, a bridge marker slipped in, or environment/olean drift).

Trigger: $TRIGGER at $STAMP
Full log: $LOG

Failing directions:
$FAILLINES

HUMAN ACTION REQUIRED — do not auto-dispatch. Diagnose the regression:
  - Re-read the full log above.
  - If env/olean drift is suspected, run the MANAGER clean-rebuild gold-master
    (blow away .lake/build, rebuild, re-run gate-full) to confirm.
  - The active node has been BLOCKED (--kind capability) pending your decision.
See docs/GATE_ARCHITECTURE.md (Failure valve)."

$HERMES kanban --board "$BOARD" create "$TITLE" --body "$BODY" --triage 2>&1 | head -5 || \
  echo "watchdog: WARNING — failed to create triage ticket (still blocking active node)."

# (2) block the currently-running node(s) so the chain halts for a human
RUNNING_IDS="$($HERMES kanban --board "$BOARD" list --status running --json 2>/dev/null \
  | python3 -c "import sys,json
try:
    d=json.load(sys.stdin); d=d if isinstance(d,list) else list(d.values())
    print(' '.join(t['id'] for t in d))
except Exception: pass" 2>/dev/null)"

if [ -n "$RUNNING_IDS" ]; then
  for tid in $RUNNING_IDS; do
    $HERMES kanban --board "$BOARD" block "$tid" \
      --kind capability \
      "GATE-FULL regression @ $SHA ($TRIGGER $STAMP). Frozen history/env failed the read-only full battery. Chain halted for human review. Log: $LOG" 2>&1 | head -3 \
      && echo "watchdog: blocked running node $tid"
  done
else
  echo "watchdog: no running node to block (chain idle) — triage ticket stands."
fi

echo "watchdog[$TRIGGER]: safety valve fired. Human review required."
exit 1
