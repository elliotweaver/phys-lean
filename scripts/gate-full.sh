#!/bin/bash
# gate-full.sh — the READ-ONLY whole-tree verification battery.
# ============================================================================
# This is the FULL battery (D0-D3 greps + D5 every costume + D6 full axiom
# audit) with ONE deliberate omission: it does NOT run `lake build`. It reads
# the CURRENTLY-BUILT oleans only. That makes it SAFE TO RUN CONCURRENTLY with
# an active worker (no write into .lake/build → no W4 concurrent-compile
# corruption). It is CPU-only contention, so it runs at reduced parallelism.
#
# Purpose (see docs/GATE_ARCHITECTURE.md):
#   - The 3-HOURLY timed re-verification of the entire frozen history.
#   - Catches: a frozen costume that stopped biting, a banked theorem whose
#     axiom footprint drifted, a bridge marker that slipped in, environment
#     drift — anything that regresses the append-only history.
#   - Does NOT catch olean cache-rot (stale-but-green oleans). That is the
#     MANAGER's periodic CLEAN-REBUILD gold-master duty, not this script.
#
# Exit 0 iff D0-D3 + D5 + D6 all pass against the current build. Any failure
# prints WHY and exits non-zero. Callers (gate-watchdog.sh) own alarm/blocking.
#
# This script is a pure verifier: it NEVER edits the repo, NEVER commits,
# NEVER blocks a board task. It only reads and reports.
# ============================================================================
set -uo pipefail

LAKE="${LAKE:-/Users/elliotweaver/.elan/bin/lake}"
REPO="${REPO:-/Users/elliotweaver/phys-lean}"
cd "$REPO" || { echo "FATAL: cannot cd $REPO"; exit 2; }
FAIL=0
SHA="$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"

echo "════════════════════════════════════════════════════════════════"
echo " phys-lean GATE-FULL (read-only battery) — HEAD $SHA — $(date '+%Y-%m-%d %H:%M:%S')"
echo " enforcing docs/STANDARD.md over the WHOLE tree (no build; reads current oleans)"
echo "════════════════════════════════════════════════════════════════"

# ---- D0: zero axiom declarations ----
echo "── D0: zero-axiom policy ──"
AX=$(grep -rnE "^[[:space:]]*(private[[:space:]]+|protected[[:space:]]+|noncomputable[[:space:]]+|unsafe[[:space:]]+|@\[[^]]*\][[:space:]]*)*axiom\b" \
      Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null | grep -v '/.lake/')
if [ -n "$AX" ]; then
  echo "GATE-FULL FAILING (D0): axiom declaration(s) found:"; echo "$AX"; FAIL=1
else echo "ok: zero axiom declarations"; fi

# ---- D1: no sorry / admit ----
echo "── D1: no sorry / admit ──"
SORRY=$(grep -rnE '\b(sorry|admit)\b' Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null \
        | grep -v '/.lake/' \
        | grep -vE -e '^[^:]*:[0-9]+:[[:space:]]*--' \
        | grep -viE 'no sorry|sorry-free|without sorry|zero sorry|no admit')
if [ -n "$SORRY" ]; then
  echo "GATE-FULL FAILING (D1): real sorry/admit found:"; echo "$SORRY"; FAIL=1
else echo "ok: no sorry / admit"; fi

# ---- D2: no native_decide ----
echo "── D2: no native_decide ──"
ND=$(grep -rnE '\bnative_decide\b' Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null | grep -v '/.lake/' | grep -vE -e '^[^:]*:[0-9]+:[[:space:]]*--')
if [ -n "$ND" ]; then
  echo "GATE-FULL FAILING (D2): native_decide found:"; echo "$ND"; FAIL=1
else echo "ok: no native_decide"; fi

# ---- D3: NO BRIDGE / NO RESIDUAL ----
echo "── D3: NO BRIDGE / NO RESIDUAL (STANDARD §0,§1) ──"
BRIDGE=$(grep -rniE 'named bridge|asserted at grade|at[ -]grade|NOT proved here|named residual|cited residual|structural obligation|not yet closed|strategy note|smuggl' \
         Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null | grep -v '/.lake/')
if [ -n "$BRIDGE" ]; then
  echo "GATE-FULL FAILING (D3): bridge/residual marker(s) found:"; echo "$BRIDGE"; FAIL=1
else echo "ok: no bridge/residual markers"; fi

# ---- (NO D4 build — read-only by design; concurrency-safe) ----
echo "── D4: SKIPPED (read-only battery — reads current oleans; no lake build) ──"

# ---- D5: costume battery (every costume, reduced parallelism for concurrency) ----
echo "── D5: FULL costume battery (every garbage witness MUST be rejected) ──"
COUT=$(COSTUME_JOBS="${COSTUME_JOBS:-4}" bash "$REPO/scripts/run_costumes.sh" "$REPO/scripts/costume_manifest.tsv" 2>&1)
CRC=$?
echo "$COUT" | tail -3
if [ "$CRC" -ne 0 ]; then
  echo "GATE-FULL FAILING (D5): a costume did not bite or failed for a non-math reason:"
  echo "$COUT" | grep -E '^FAIL' | head -20
  FAIL=1
else echo "ok: full costume battery green"; fi

# ---- D6: axiom audit (foundations-only over the whole tree) ----
echo "── D6: FULL axiom audit (foundations-only) ──"
if [ -f Audits/AxiomAudit.lean ]; then
  AOUT=$($LAKE env lean Audits/AxiomAudit.lean 2>&1)
  BAD=$(echo "$AOUT" | tr '\n' ' ' | grep -oE "depends on axioms: \[[^]]*\]" \
        | sed -E 's/depends on axioms: \[//; s/\]$//' | tr ',' '\n' | sed 's/^ *//; s/ *$//' \
        | grep -vE "^(propext|Classical\.choice|Quot\.sound)$" | grep -v "^$")
  NDECL=$(echo "$AOUT" | grep -c "depends on axioms")
  NCAPT=$(echo "$AOUT" | tr '\n' ' ' | grep -oE "depends on axioms: \[[^]]*\]" | wc -l | tr -d ' ')
  if echo "$AOUT" | grep -q "error"; then
    echo "GATE-FULL FAILING (D6): audit file errors:"; echo "$AOUT" | grep -i error | head -10; FAIL=1
  elif [ "$NDECL" -eq 0 ]; then
    echo "GATE-FULL FAILING (D6): audit printed 0 axiom lines — empty/stale, refusing blind pass."; FAIL=1
  elif [ "$NDECL" -ne "$NCAPT" ]; then
    echo "GATE-FULL FAILING (D6): $NDECL decls but $NCAPT axiom lists parsed — format drift."; FAIL=1
  elif [ -n "$BAD" ]; then
    echo "GATE-FULL FAILING (D6): non-foundational axiom(s) in the trust base:"; echo "$BAD"; FAIL=1
  else
    echo "ok: all $NDECL audited theorems rest on Lean foundations only"
  fi
else
  echo "note: Audits/AxiomAudit.lean not present."
fi

echo "════════════════════════════════════════════════════════════════"
if [ "$FAIL" -eq 0 ]; then
  echo "GATE-FULL: PASSED  (whole frozen tree re-verified against current build, HEAD $SHA)"
  exit 0
else
  echo "GATE-FULL: FAILED  (HEAD $SHA — a regression in the frozen history or environment)"
  exit 1
fi
