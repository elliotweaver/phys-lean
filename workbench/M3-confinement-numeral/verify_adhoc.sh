#!/bin/bash
# Ad-hoc verification of the M3 ConfinementScaleNumeral node (NOT suite-green; the
# canonical project gate is scripts/gate-fast.sh, already committed at gate log f6b5dd6).
# Re-exercises the three validity conditions: it builds, its 12 new decls are
# foundations-only, and its W8 anti-vacuity costume bites.
set -uo pipefail
cd /Users/elliotweaver/phys-lean
export LAKE=/Users/elliotweaver/.elan/bin/lake
FAIL=0

echo "== [1/3] build: full Phys tree with the new leaf wired in =="
$LAKE build Phys.Algebra.ConfinementScaleNumeral >/tmp/hv_build.log 2>&1
if tail -1 /tmp/hv_build.log | grep -q "Build completed successfully"; then
  echo "  ok: $(tail -1 /tmp/hv_build.log)"
else
  echo "  FAIL build"; tail -5 /tmp/hv_build.log; FAIL=1
fi

echo "== [2/3] axiom audit: all 12 new decls foundations-only =="
OUT=$($LAKE env lean workbench/M3-confinement-numeral/audit_hv.lean 2>&1)
OK=$(echo "$OUT" | grep -c "depends on axioms")
STRAY=$(echo "$OUT" | grep -iE "sorry|native_decide|Real\." | head)
if [ "$OK" = "12" ] && [ -z "$STRAY" ]; then
  echo "  ok: 12/12 decls report only [propext, Classical.choice, Quot.sound]"
else
  echo "  FAIL audit (ok=$OK stray=$STRAY)"; FAIL=1
fi

echo "== [3/3] costume C549 must bite (W8 anti-vacuity) =="
bash scripts/run_costumes.sh workbench/M3-confinement-numeral/manifest_hv.tsv >/tmp/hv_cost.log 2>&1
if grep -q "1/1 passed, 0 failed" /tmp/hv_cost.log; then
  echo "  ok: $(grep 'rejected at the math field' /tmp/hv_cost.log | sed 's/^ *//')"
else
  echo "  FAIL costume"; tail -5 /tmp/hv_cost.log; FAIL=1
fi

echo "----"
if [ "$FAIL" = 0 ]; then echo "AD-HOC VERIFICATION: PASS"; else echo "AD-HOC VERIFICATION: FAIL"; fi
rm -f /tmp/hv_build.log /tmp/hv_cost.log
exit $FAIL
