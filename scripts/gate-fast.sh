#!/bin/bash
# gate-fast.sh — the PER-NODE BLOCKING gate (the fast path that banks a node).
# ============================================================================
# The chain is an APPEND-ONLY DAG: a normal node ADDS one new Phys/**.lean leaf
# module + one new costume, and APPENDS to Phys.lean / Audits/AxiomAudit.lean /
# scripts/costume_manifest.tsv. It never MODIFIES a banked module. Therefore,
# for a normal leaf commit, the ONLY things that can newly fail are the new
# module's own decls and its own costume — everything else is provably
# unchanged (see docs/GATE_ARCHITECTURE.md for the equivalence argument).
#
# So this fast gate verifies:
#   D0-D3  the FULL greps (instant; the no-bridge checks are NEVER trimmed)
#   D4     lake build Phys (native-incremental; only the new leaf compiles)
#   D5-fast  ONLY the costume(s) whose target module is newly ADDED in the diff
#   D6-fast  the axiom audit of ONLY the newly ADDED module's decls
#
# FROZEN-TOUCH ESCALATION (mechanical, git-driven): if the commit MODIFIED
# (M/D/R, not a pure A add) any existing Phys/**.lean module, OR changed
# lean-toolchain / lake-manifest.json / scripts/gate*.sh / scripts/run_costumes.sh,
# then the fast path is NOT equivalent to full — this run EXECS the canonical
# full building gate (scripts/gate.sh) instead. This is safe here because it is
# the worker's own single-flight turn (no other build is running).
#
# Diff basis: HEAD~1..HEAD (the worker commits production BEFORE running this).
# Override with GATE_DIFF_BASE=<ref> if needed.
#
# Exit 0 iff the fast path (or the escalated full gate) passes. Pure verifier:
# never edits the repo, never commits, never touches the board.
# ============================================================================
set -uo pipefail

LAKE="${LAKE:-/Users/elliotweaver/.elan/bin/lake}"
REPO="${REPO:-/Users/elliotweaver/phys-lean}"
cd "$REPO" || { echo "FATAL: cannot cd $REPO"; exit 2; }
FAIL=0
SHA="$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"

# Diff base: default = parent of the MOST RECENT commit that touched a Phys/**.lean
# module. This spans the node's production commit regardless of how many docs/child
# commits followed it (the worker commits production, then docs, then child), so the
# gate can run at any point in the finalize sequence. Override with GATE_DIFF_BASE.
if [ -n "${GATE_DIFF_BASE:-}" ]; then
  BASE="$GATE_DIFF_BASE"
else
  PRODCOMMIT="$(git log -n 30 --format='%H' -- 'Phys/*.lean' 2>/dev/null | head -1)"
  if [ -n "$PRODCOMMIT" ]; then
    BASE="$(git rev-parse --short "${PRODCOMMIT}~1" 2>/dev/null || echo HEAD~1)"
  else
    BASE="HEAD~1"
  fi
fi

echo "════════════════════════════════════════════════════════════════"
echo " phys-lean GATE-FAST (per-node) — HEAD $SHA — diff base $BASE"
echo "════════════════════════════════════════════════════════════════"

# ---- diff analysis ----
DIFF="$(git diff --name-status "$BASE" HEAD 2>/dev/null)"
if [ -z "$DIFF" ]; then
  echo "note: empty diff vs $BASE — nothing to fast-check; deferring to full gate for safety."
  exec bash "$REPO/scripts/gate.sh"
fi
echo "── diff vs $BASE ──"; echo "$DIFF" | sed 's/^/    /'

# frozen-touch: a MODIFIED/DELETED/RENAMED existing Phys module, or a change to
# a toolchain-pin / gate-infra file. (Appends to Phys.lean / AxiomAudit.lean /
# manifest are the NORMAL per-node append points — NOT a frozen touch.)
FROZEN_TOUCH=$(echo "$DIFF" | grep -E '^(M|D|R[0-9]*)[[:space:]]+Phys/.*\.lean$' ; \
               echo "$DIFF" | grep -E '[[:space:]](lean-toolchain|lake-manifest\.json|scripts/gate\.sh|scripts/gate-fast\.sh|scripts/gate-full\.sh|scripts/gate-watchdog\.sh|scripts/run_costumes\.sh)$')
if [ -n "$(echo "$FROZEN_TOUCH" | grep -v '^$')" ]; then
  echo "════════════════════════════════════════════════════════════════"
  echo " ⚠ FROZEN-TOUCH DETECTED — fast path is NOT equivalent to full."
  echo " Escalating to the canonical FULL building gate (scripts/gate.sh)."
  echo " Trigger:"; echo "$FROZEN_TOUCH" | grep -v '^$' | sed 's/^/    /'
  echo "════════════════════════════════════════════════════════════════"
  exec bash "$REPO/scripts/gate.sh"
fi

echo "── (leaf commit: append-only; fast path is equivalent to full for HEAD $SHA) ──"

# ---- D0-D3: FULL greps (instant; never trimmed) ----
echo "── D0: zero-axiom policy ──"
AX=$(grep -rnE "^[[:space:]]*(private[[:space:]]+|protected[[:space:]]+|noncomputable[[:space:]]+|unsafe[[:space:]]+|@\[[^]]*\][[:space:]]*)*axiom\b" \
      Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null | grep -v '/.lake/' | grep -v '/OneAxiom/')
[ -n "$AX" ] && { echo "GATE-FAST FAILING (D0): axiom decl(s):"; echo "$AX"; FAIL=1; } || echo "ok: zero axiom declarations"

echo "── D1: no sorry / admit ──"
SORRY=$(grep -rnE '\b(sorry|admit)\b' Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null \
        | grep -v '/.lake/' | grep -vE -e '^[^:]*:[0-9]+:[[:space:]]*--' \
        | grep -viE 'no [`[:space:]]*sorry|sorry-free|without sorry|zero sorry|no [`[:space:]]*admit')
[ -n "$SORRY" ] && { echo "GATE-FAST FAILING (D1): sorry/admit:"; echo "$SORRY"; FAIL=1; } || echo "ok: no sorry / admit"

echo "── D2: no native_decide ──"
ND=$(grep -rnE '\bnative_decide\b' Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null | grep -v '/.lake/' | grep -vE -e '^[^:]*:[0-9]+:[[:space:]]*--')
[ -n "$ND" ] && { echo "GATE-FAST FAILING (D2): native_decide:"; echo "$ND"; FAIL=1; } || echo "ok: no native_decide"

echo "── D3: NO BRIDGE / NO RESIDUAL (STANDARD §0,§1) ──"
BRIDGE=$(grep -rniE 'named bridge|asserted at grade|at[ -]grade|NOT proved here|named residual|cited residual|structural obligation|not yet closed|strategy note|smuggl' \
         Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null | grep -v '/.lake/')
[ -n "$BRIDGE" ] && { echo "GATE-FAST FAILING (D3): bridge/residual marker(s):"; echo "$BRIDGE"; FAIL=1; } || echo "ok: no bridge/residual markers"

# ---- D7: POSIT CENSUS (owner-commissioned): every Prop-valued trunk def must be
#      inhabited by a theorem — the mechanical defense against the vacuous-predicate
#      exploit (a def can never create truth, but an unsatisfiable def can make
#      hypothesis-form theorems claim nothing; the witness proves the class non-empty).
echo "── D7: posit census (trunk Prop-defs inhabited) ──"
if python scripts/posit_census.py > /tmp/posit_census_out.txt 2>&1; then
  echo "ok: $(tail -1 /tmp/posit_census_out.txt)"
else
  echo "GATE FAILING (D7): posit census:"; cat /tmp/posit_census_out.txt; FAIL=1
fi


# ---- D4: build (native-incremental; the new leaf compiles) ----
echo "── D4: build ──"
if $LAKE build Phys >/dev/null 2>&1; then echo "ok: Phys builds"; else
  echo "GATE-FAST FAILING (D4): the tree does not build:"; $LAKE build Phys 2>&1 | tail -15; FAIL=1; fi

# ---- D5-fast: only the NEWLY-ADDED costume(s) ----
echo "── D5-fast: newly-added costume(s) must bite ──"
NEWCOST=$(echo "$DIFF" | grep -E '^A[[:space:]]+Counterexamples/.*\.lean$' | awk '{print $2}')
if [ -z "$NEWCOST" ]; then
  echo "note: no new costume added in this commit — verifying via full costume battery for safety."
  COUT=$(COSTUME_JOBS="${COSTUME_JOBS:-8}" bash "$REPO/scripts/run_costumes.sh" 2>&1); CRC=$?
  echo "$COUT" | tail -2
  [ "$CRC" -ne 0 ] && { echo "GATE-FAST FAILING (D5): $(echo "$COUT" | grep -E '^FAIL' | head -5)"; FAIL=1; }
else
  # build a one-shot manifest of just the new costume rows and run it
  TMPMAN="$(mktemp)"; trap 'rm -f "$TMPMAN"' EXIT
  for f in $NEWCOST; do
    row=$(grep -F "	$f	" "$REPO/scripts/costume_manifest.tsv" 2>/dev/null)
    if [ -z "$row" ]; then
      echo "GATE-FAST FAILING (D5): new costume $f has NO manifest row (unregistered garbage-witness)."; FAIL=1
    else echo "$row" >> "$TMPMAN"; fi
  done
  if [ -s "$TMPMAN" ]; then
    COUT=$(COSTUME_JOBS="${COSTUME_JOBS:-8}" bash "$REPO/scripts/run_costumes.sh" "$TMPMAN" 2>&1); CRC=$?
    echo "$COUT" | sed 's/^/    /'
    [ "$CRC" -ne 0 ] && { echo "GATE-FAST FAILING (D5): a new costume did not bite."; FAIL=1; } || echo "ok: new costume(s) bite at the math field"
  fi
fi

# ---- D6-fast: axiom audit of EXACTLY the audit lines this commit ADDED ----
# The worker appends the new module's canonical `#print axioms` lines (defs AND
# theorems) to Audits/AxiomAudit.lean every node. Those ADDED lines ARE the
# canonical audit for the new module — running them is drift-free and covers
# exactly what the full D6 covers for this module (not a source re-derivation
# that would miss `def`s).
echo "── D6-fast: newly-added AxiomAudit lines foundations-only ──"
ADDED_IMPORTS=$(git diff "$BASE" HEAD -- Audits/AxiomAudit.lean 2>/dev/null | grep -E '^\+import ' | sed 's/^\+//')
ADDED_PRINTS=$(git diff "$BASE" HEAD -- Audits/AxiomAudit.lean 2>/dev/null | grep -E '^\+' | grep '#print axioms' | sed 's/^\+//')
NADD=$(echo "$ADDED_PRINTS" | grep -c '#print axioms')
if [ -z "$ADDED_PRINTS" ] || [ "$NADD" -eq 0 ]; then
  # No new audit lines. If a new Phys module was added, that is a FAILURE
  # (unaudited banked module). Otherwise nothing to audit here.
  NEWMOD=$(echo "$DIFF" | grep -E '^A[[:space:]]+Phys/.*\.lean$' | awk '{print $2}')
  if [ -n "$NEWMOD" ]; then
    echo "GATE-FAST FAILING (D6-fast): new module(s) added but NO #print axioms lines"
    echo "were appended to Audits/AxiomAudit.lean — the banked module is UNAUDITED:"; echo "$NEWMOD" | sed 's/^/    /'; FAIL=1
  else
    echo "note: no new audit lines and no new module — D6 covered by the 3-hourly full battery."
  fi
else
  TMPA="workbench/gatefast_audit_$$.lean"  # relative: portable for Windows lean.exe
  { echo "$ADDED_IMPORTS"; echo "$ADDED_PRINTS"; } > "$TMPA"
  AOUT=$($LAKE env lean "$TMPA" 2>&1); rm -f "$TMPA"
  BAD=$(echo "$AOUT" | tr '\n' ' ' | grep -oE "depends on axioms: \[[^]]*\]" \
        | sed -E 's/depends on axioms: \[//; s/\]$//' | tr ',' '\n' | sed 's/^ *//; s/ *$//' \
        | grep -vE "^(propext|Classical\.choice|Quot\.sound)$" | grep -v "^$")
  NCAPT=$(echo "$AOUT" | grep -c "depends on axioms")
  if echo "$AOUT" | grep -qi "error"; then
    echo "GATE-FAST FAILING (D6-fast): audit errored:"; echo "$AOUT" | grep -i error | head -5; FAIL=1
  elif [ "$NCAPT" -ne "$NADD" ]; then
    echo "GATE-FAST FAILING (D6-fast): $NADD audit lines added but $NCAPT parsed — format drift, refusing blind pass."; FAIL=1
  elif [ -n "$BAD" ]; then
    echo "GATE-FAST FAILING (D6-fast): non-foundational axiom(s) in the new decls:"; echo "$BAD"; FAIL=1
  else
    echo "ok: $NCAPT newly-banked decls foundations-only"
  fi
fi

echo "════════════════════════════════════════════════════════════════"
if [ "$FAIL" -eq 0 ]; then
  echo "GATE-FAST: PASSED  (necessary, NOT sufficient — now apply docs/STANDARD.md:"
  echo "           unbroken / complete / physics-words-removable. Gate-green ≠ done.)"
  echo "           The frozen history is re-verified async by the 3-hourly gate-full."
  exit 0
else
  echo "GATE-FAST: FAILED"
  exit 1
fi
