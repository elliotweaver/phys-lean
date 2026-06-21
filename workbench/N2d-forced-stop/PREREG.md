# N2d — PREREG (frozen before production Lean)

Node: THE FORCED STOP (generic) — upgrade N2c's concrete stop (a witness breaks the
Born/composition law in S) toward the forced impossibility on every base. Derived
FORWARD from the banked `CD` product + `star` (Double.lean). No Mathlib
Octonion/Hurwitz/CompositionAlgebra import.

## What the numerics SETTLED (workbench/N2d-forced-stop/*.py, exact rational)

1. selfMul identity (probe + witness6): for z=(a,b) in CD A, (z·star z).im = 0
   GENERICALLY (any involutive `*`-base) ⇒ z·star z = ι(Nrm z), Nrm z = a·star a +
   star b·b. The Born self-overlap is "real" — the trunk's positivity, structural.
2. The composition law is governed by base ASSOCIATIVITY, not commutativity
   (probe.py): the A-valued norm Nrm and scalar norm q are BOTH multiplicative on
   CD A through O (base ℍ associative-noncommutative) and DIE at S (base 𝕆 the first
   NON-associative base). 168/2401 pure-unit witnesses bite at S, == #non-assoc
   octonion triples.
3. EASY direction (verify_easy.py): COMMUTATIVE associative base ⇒ Nrm multiplicative
   on CD A (symbolic defect = 0). Covers rungs ℂ (base ℝ) and ℍ (base ℂ).
4. ★ THE FULL FORCED LINK IS HURWITZ-DEPTH (verify_easy H, hard_statement,
   reframe2): over a BARE associative noncommutative `*`-ring the defect is NONZERO
   (12 terms) — it vanishes on the cascade ONLY because the cascade's self-overlaps
   are CENTRAL (the Born property). So "Nrm mult on CD A ⟹ A associative" is FALSE
   as a bare-`*`-ring statement; the TRUE forced link needs the trunk's central-
   self-overlap (composition-algebra) structure as a hypothesis and is genuinely the
   Hurwitz obstruction. There is NO simple associator-witness over a bare base
   (hard_statement: 0 pure-obstruction witnesses) — the reframe through the trunk
   (THE ONE LAW, W5) dissolved the EASY direction to "associativity governs" but the
   hard direction remains genuinely hard after the reframe.

## SCOPE DECISION (W3 decompose + W1 step 3 dissolution child) — frozen

BANK THIS RUN (Phys/Cascade/ForcedStop.lean), all foundations-only, verified in
scratch (Scratch.lean / Scratch2.lean / Scratch4.lean / Scratch5.lean compile):
  - CD.Nrm                : generic self-overlap norm on CD A (derived from CD/star)
  - CD.Nrm_def           : Nrm z = z.re·star z.re + star z.im·z.im
  - CD.selfMul           : ★ z·star z = ι(Nrm z) — Born self-overlap is REAL, generic
  - CD.Nrm_iota / Nrm_one: norm restricts to base self-overlap; Nrm 1 = 1
  - CD.Nrm_mul_of_comm   : ★ EASY DIRECTION (commutative base) — Nrm multiplicative on
                           CD A. A GENERIC theorem (the law HOLDS), covers ℂ, ℍ.
  - N_eq_proj            : generic Nrm specializes to N2c's concrete N on S ℚ
  - genNrm_not_mul_at_S  : ★ the generic Nrm DIES at the stop S (via N2c zero divisors)

CHILD (immediate next node, dissolution ticket, linked onto the tail):
  N2d-hard — the forced link "Nrm multiplicative on CD A ⟹ A associative" via the
  trunk's central-self-overlap (composition-algebra) structure: build the
  conjugation/Born-scalar API on CD (a + star a, a·star a scalar; propagation up the
  cascade) and prove multiplicativity ⟺ associativity, making the loss past 𝕆 forced
  for EVERY base. This is the W1(a) "build the composition-algebra obstruction on CD"
  upgrade. It is genuinely Hurwitz-depth, hence a dedicated theory-native attack.

## GO / NO-GO (frozen)
GO to bank iff all of the scratch theorems compile foundations-only AND the costume
(a wrong generic claim) BITES. Confirmed in scratch.

## KILL (a fight = INSTRUMENT failure, return to trunk; never patch)
  K1. If selfMul or Nrm_mul_of_comm needs a hypothesis BEYOND what the cascade base
      provides, the norm is mis-derived — re-read off banked z·star z. (Did not fire:
      selfMul needs only involutive star; Nrm_mul_of_comm needs only commutativity.)
  K2. Do NOT state the bare-`*`-ring "A assoc ⟹ Nrm mult" (FALSE) or a vacuous
      one-directional shell. The hard direction is HONESTLY childed, never bridged,
      never weakened to a vacuous claim banked as "done".
  K3. The stop stays a PROVED loss; step count never hardcoded.

## Costume that BITES (one row, scripts/costume_manifest.tsv)
  A wrong generic claim must FAIL to compile, e.g. "the generic Nrm STAYS
  multiplicative at the stop S" — N(zdX·zdY) = N zdX · N zdY through the generic Nrm,
  which reduces to 0 = 4. (C11.)
