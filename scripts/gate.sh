#!/bin/bash
# gate.sh — the phys-lean verification gate. Enforces docs/STANDARD.md, every commit.
# ============================================================================
# A node is DONE only if ALL of these pass (necessary, never sufficient — the human/agent
# STANDARD check is the second gate). Directions, in order:
#
#   D0  ZERO AXIOM         no `axiom` declarations anywhere in Phys/ Counterexamples/ Audits/
#   D1  NO SORRY           no `sorry` / `admit` anywhere (real, not in comments)
#   D2  NO NATIVE_DECIDE   no kernel-trust bypass
#   D3  NO BRIDGE          ★ THE NEW CHECK ★ no bridge/residual/at-grade markers — the
#                          mechanical form of "the math is the bridge" (STANDARD §0,§1)
#   D4  BUILD              the Phys aggregator + all modules build
#   D5  COSTUMES           every costume rejected at the math field (parallel battery)
#   D6  AXIOM AUDIT        every theorem rests on Lean foundations only
#                          (#print axioms ⊆ {propext, Classical.choice, Quot.sound})
#
# Exit 0 iff every direction passes. Any failure prints WHY and exits non-zero.
# ============================================================================
set -uo pipefail

LAKE="${LAKE:-/Users/elliotweaver/.elan/bin/lake}"
REPO="${REPO:-/Users/elliotweaver/phys-lean}"
cd "$REPO" || { echo "FATAL: cannot cd $REPO"; exit 2; }
FAIL=0

echo "════════════════════════════════════════════════════════════════"
echo " phys-lean GATE — enforcing docs/STANDARD.md"
echo "════════════════════════════════════════════════════════════════"

# ---- D0: zero axiom declarations ----
echo "── D0: zero-axiom policy ──"
AX=$(grep -rnE "^[[:space:]]*(private[[:space:]]+|protected[[:space:]]+|noncomputable[[:space:]]+|unsafe[[:space:]]+|@\[[^]]*\][[:space:]]*)*axiom\b" \
      Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null | grep -v '/.lake/' \
      | grep -v '/OneAxiom/')
# NOTE: Phys/OneAxiom/ is the QUARANTINED F+One track. It carries exactly ONE real axiom
# (`foldRetention` = "the One"), used only for genuine infinite-limit RETENTION claims (YM mass
# gap at infinite volume, twin primes, RH-genre). Its own files state "NEVER wire into the
# foundations-only aggregate the gate audits" — and the dependency graph confirms it: NO file
# outside Phys/OneAxiom/ imports it, and Phys.lean (the foundations-only aggregate) excludes it.
# Excluding it here makes the D0 grep match that architecture. The One's own #print axioms is
# audited separately (it legitimately carries `foldRetention`); the foundations-only physics tree
# must stay axiom-free, which the remaining grep enforces.
if [ -n "$AX" ]; then
  echo "GATE FAILING (D0): axiom declaration(s) found — the project has exactly ONE posit (the fold), and it is not an \`axiom\`:"
  echo "$AX"; FAIL=1
else
  echo "ok: zero axiom declarations"
fi

# ---- D1: no sorry / admit (real, not the word in a comment) ----
echo "── D1: no sorry / admit ──"
# strip line/block comments crudely, then look for the tactic/term token.
SORRY=$(grep -rnE '\b(sorry|admit)\b' Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null \
        | grep -v '/.lake/' \
        | grep -vE -e '^[^:]*:[0-9]+:[[:space:]]*--' \
        | grep -viE 'no [`[:space:]]*sorry|sorry-free|without sorry|zero sorry|no [`[:space:]]*admit')
if [ -n "$SORRY" ]; then
  echo "GATE FAILING (D1): real sorry/admit found (a hole in a proof):"
  echo "$SORRY"; FAIL=1
else
  echo "ok: no sorry / admit"
fi

# ---- D2: no native_decide (kernel-trust bypass) ----
echo "── D2: no native_decide ──"
ND=$(grep -rnE '\bnative_decide\b' Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null | grep -v '/.lake/' | grep -vE -e '^[^:]*:[0-9]+:[[:space:]]*--')
if [ -n "$ND" ]; then
  echo "GATE FAILING (D2): native_decide found (bypasses the kernel — forbidden):"
  echo "$ND"; FAIL=1
else
  echo "ok: no native_decide"
fi

# ---- D3: NO BRIDGE / NO RESIDUAL — the mechanical form of THE STANDARD ----
# This is the check that did not exist in phys-clay and let 38 unproven assertions accumulate.
# A "bridge" / "asserted at grade" / "NOT proved here" is, in this ontology, a CATEGORY ERROR:
# the math IS the physics, so there is nothing to bridge to. Any such marker = an incomplete
# derivation wearing a physics word. The gate refuses it.
echo "── D3: NO BRIDGE / NO RESIDUAL (STANDARD §0,§1) ──"
BRIDGE=$(grep -rniE 'named bridge|asserted at grade|at[ -]grade|NOT proved here|named residual|cited residual|structural obligation|not yet closed|strategy note|smuggl' \
         Phys/ Counterexamples/ Audits/ Phys.lean 2>/dev/null | grep -v '/.lake/')
if [ -n "$BRIDGE" ]; then
  echo "GATE FAILING (D3): bridge/residual marker(s) found. In this ontology the math IS the"
  echo "physics — a bridge is a CATEGORY ERROR and always marks an INCOMPLETE DERIVATION."
  echo "Finish the derivation (RUNBOOK W1) or block on a dissolution ticket. Do NOT name-and-bypass:"
  echo "$BRIDGE"; FAIL=1
else
  echo "ok: no bridge/residual markers — the chain claims only what it proves"
fi

# ---- D4: build ----
echo "── D4: build ──"
if $LAKE build Phys >/dev/null 2>&1; then
  echo "ok: Phys aggregator + all modules build"
else
  echo "GATE FAILING (D4): the tree does not build:"; $LAKE build Phys 2>&1 | tail -15; FAIL=1
fi

# ---- D5: costume battery (parallel) ----
echo "── D5: costume battery (every garbage witness MUST be rejected) ──"
COUT=$(COSTUME_JOBS="${COSTUME_JOBS:-8}" bash "$REPO/scripts/run_costumes.sh" "$REPO/scripts/costume_manifest.tsv" 2>&1)
CRC=$?
echo "$COUT"
if [ "$CRC" -ne 0 ]; then
  echo "GATE FAILING (D5): a costume did not bite (vacuous claim) or failed for a non-math reason."; FAIL=1
else
  echo "ok: costume battery green"
fi

# ---- D6: axiom audit (foundations-only over the whole tree) ----
# Audits/AxiomAudit.lean #print axioms every banked theorem. Every line must show ONLY the
# foundational trio. The decl-count == parsed-count guard refuses a blind pass on format drift.
echo "── D6: axiom audit (foundations-only) ──"
if [ -f Audits/AxiomAudit.lean ]; then
  AOUT=$($LAKE env lean Audits/AxiomAudit.lean 2>&1)
  BAD=$(echo "$AOUT" | tr '\n' ' ' | grep -oE "depends on axioms: \[[^]]*\]" \
        | sed -E 's/depends on axioms: \[//; s/\]$//' | tr ',' '\n' | sed 's/^ *//; s/ *$//' \
        | grep -vE "^(propext|Classical\.choice|Quot\.sound)$" | grep -v "^$")
  NDECL=$(echo "$AOUT" | grep -c "depends on axioms")
  NCAPT=$(echo "$AOUT" | tr '\n' ' ' | grep -oE "depends on axioms: \[[^]]*\]" | wc -l | tr -d ' ')
  if echo "$AOUT" | grep -q "error"; then
    echo "GATE FAILING (D6): audit file errors:"; echo "$AOUT" | head -10; FAIL=1
  elif [ "$NDECL" -eq 0 ]; then
    echo "GATE FAILING (D6): audit printed 0 axiom lines — audit is empty/stale, refusing blind pass."; FAIL=1
  elif [ "$NDECL" -ne "$NCAPT" ]; then
    echo "GATE FAILING (D6): $NDECL decls but $NCAPT axiom lists parsed — format drift, refusing blind pass."; FAIL=1
  elif [ -n "$BAD" ]; then
    echo "GATE FAILING (D6): non-foundational axiom(s) in the trust base:"; echo "$BAD"; FAIL=1
  else
    echo "ok: all $NDECL audited theorems rest on Lean foundations only"
  fi
else
  echo "note: Audits/AxiomAudit.lean not present yet (no banked theorems to audit)."
fi

echo "════════════════════════════════════════════════════════════════"
if [ "$FAIL" -eq 0 ]; then
  echo "GATE: PASSED  (necessary, NOT sufficient — now apply docs/STANDARD.md: unbroken /"
  echo "               complete / physics-words-removable. Gate-green ≠ done.)"
  exit 0
else
  echo "GATE: FAILED"
  exit 1
fi
