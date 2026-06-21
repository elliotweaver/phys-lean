#!/bin/bash
# run_costumes.sh — PARALLEL costume runner (ported from phys-clay, proven 46/46).
# ============================================================================
# Runs the whole costume battery in PARALLEL, each a `lake env lean` on a
# Counterexamples/*.lean that the kernel MUST reject. Three-way verdict per costume:
#   - empty output                → it COMPILED → the garbage claim was accepted → VACUOUS → FAIL
#   - output matches PASS_SIGNATURE → rejected AT THE MATH FIELD → ok
#   - non-empty, no match          → technical noise (typo/build) → FAIL
# Each costume keeps its OWN exact signature in the manifest. No shared classifier.
# EXIT 0 iff every costume passed its own three-way test.
# To ADD a costume: append ONE row to costume_manifest.tsv (BID<TAB>file<TAB>signature).
# ============================================================================
set -uo pipefail

LAKE="${LAKE:-/Users/elliotweaver/.elan/bin/lake}"
REPO="${REPO:-/Users/elliotweaver/phys-lean}"
MANIFEST="${1:-$REPO/scripts/costume_manifest.tsv}"
JOBS="${COSTUME_JOBS:-8}"

cd "$REPO" || { echo "FATAL: cannot cd $REPO"; exit 2; }
[ -f "$MANIFEST" ] || { echo "FATAL: manifest not found: $MANIFEST"; exit 2; }

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
export WORK LAKE

worker() {
  local line="$1"
  local bid file sig out sig_ere
  bid="$(printf '%s' "$line" | cut -f1)"
  file="$(printf '%s' "$line" | cut -f2)"
  sig="$(printf '%s' "$line" | cut -f3-)"
  out="$($LAKE env lean "$file" 2>&1)"
  sig_ere="$(printf '%s' "$sig" | sed 's/\\|/|/g')"
  if [ -z "$out" ]; then
    printf 'FAIL  %s  %s  COMPILED (costume is vacuous — its garbage claim was accepted)\n' "$bid" "$file" > "$WORK/out.$bid"
    echo FAIL > "$WORK/rc.$bid"
  elif printf '%s' "$out" | grep -qE "$sig_ere"; then
    printf 'ok    %s  %s  rejected at the math field\n' "$bid" "$file" > "$WORK/out.$bid"
    echo PASS > "$WORK/rc.$bid"
  else
    { printf 'FAIL  %s  %s  NON-MATH failure (technical noise):\n' "$bid" "$file"
      printf '%s' "$out" | head -3 | sed 's/^/        /'; } > "$WORK/out.$bid"
    echo FAIL > "$WORK/rc.$bid"
  fi
}
export -f worker

JOBLIST="$WORK/jobs.tsv"
grep -vE '^[[:space:]]*#|^[[:space:]]*$' "$MANIFEST" > "$JOBLIST"
TOTAL=$(wc -l < "$JOBLIST" | tr -d ' ')

if [ "$TOTAL" -eq 0 ]; then
  echo "costume battery: 0/0 (no costumes registered yet)"
  exit 0
fi

tr '\n' '\0' < "$JOBLIST" | xargs -0 -P "$JOBS" -I{} bash -c 'worker "$1"' _ {}

GATE_FAIL=0; PASS_N=0; FAIL_N=0
while IFS= read -r line; do
  bid="$(printf '%s' "$line" | cut -f1)"
  [ -f "$WORK/out.$bid" ] && cat "$WORK/out.$bid"
  if [ "$(cat "$WORK/rc.$bid" 2>/dev/null)" = "PASS" ]; then
    PASS_N=$((PASS_N+1))
  else
    FAIL_N=$((FAIL_N+1)); GATE_FAIL=1
  fi
done < "$JOBLIST"

echo "---"
echo "costume battery: $PASS_N/$TOTAL passed, $FAIL_N failed (parallel x$JOBS)"
exit "$GATE_FAIL"
