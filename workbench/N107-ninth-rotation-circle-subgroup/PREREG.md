# N107 PREREG — THE NINTH-ROTATION CIRCLE SUBGROUP (the abelian A-factor of SO(9)=SO(8)·A·SO(8))

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure, not theory failure.

## THE TARGET (ROADMAP §N107 priority (i), the immediately-bankable structural piece)

N106 banked the ENLARGED alphabet `genIsomMonoidLinPlus = closure(biMulGenSetLin ∪ ninthGenSetLin)`,
its soundness, strict enlargement, and ONE concrete SO(8)·ninth witness (`enlargedTwoPlaneNinth`).
N107 banks the next critical-path structural leg: the ninth-direction rotations `planeRotLin c s`
of the 2-plane span{x, 1} form a CLOSED 1-PARAMETER ABELIAN SUBGROUP ≅ SO(2) inside
`genIsomMonoidLinPlus` — the maximal-torus / abelian A-factor of the KAK decomposition
SO(9) = SO(8)·A·SO(8). This is the "multi-ninth factorization" the ROADMAP names: a product of
two ninth-rotations IS again a ninth-rotation (angle addition).

## THE STRUCTURAL FACT (verified by hand)

`planeRotLin c s` acts as the rotation matrix [[c,-s],[s,c]] on the (x, r) plane (r := reQC v),
identity on the imaginary octonion part (v - r•1). Proof: x' = c·x − s·r; new r' = reQC(v') =
r + s·x + (c−1)·r = c·r + s·x; imaginary part v' − r'•1 = v − r•1 unchanged.

THE COMPOSITION LAW (holds UNCONDITIONALLY — pure matrix product, no circle constraint):
  planeRotLin c₁ s₁ * planeRotLin c₂ s₂ = planeRotLin (c₁·c₂ − s₁·s₂) (c₁·s₂ + s₁·c₂).
Verified by hand: the x-coord composes as (c₁c₂−s₁s₂)x − (c₁s₂+s₁c₂)r ✓, and the •1 increment
composes to (S·x + (C−1)·r)•1 with C=c₁c₂−s₁s₂, S=c₁s₂+s₁c₂ ✓ (algebra checked in handoff).

## DECLS TO BANK (production: Phys/Algebra/LorentzContinuumGenerationNinthRotationCircle.lean)

1. planeRotLin_one        : planeRotLin 1 0 = 1   (the trivial rotation = identity; 0•1=0).
2. planeRotLin_mul        : planeRotLin c₁ s₁ * planeRotLin c₂ s₂
                              = planeRotLin (c₁*c₂ - s₁*s₂) (c₁*s₂ + s₁*c₂)  (UNCONDITIONAL).
3. circlePoint_mul        : c₁²+s₁²=1 → c₂²+s₂²=1 → (c₁c₂−s₁s₂)²+(c₁s₂+s₁c₂)²=1  (composite on circle).
4. planeRotLin_mul_inv    : c²+s²=1 → planeRotLin c s * planeRotLin c (-s) = 1  (the inverse rotation).
5. ninthRot_mul_mem_ninthGenSetLin : product of two circle-point ninth-rotations is again a ninth
                              generator (closure of ninthGenSetLin under *).
6. planeRotLin_mul_mem_genIsomMonoidLinPlus : the composite ninth-rotation ∈ enlarged submonoid.
7. planeRotLin_mul_isQvIsomC : the composite is a QvC-isometry (via circlePoint_mul + N105).
8. W8 teeth — planeRotDouble_moves_x : the concrete double-angle of (3/5,4/5):
     planeRotLin (3/5)(4/5) * planeRotLin (3/5)(4/5) = planeRotLin (-7/25) (24/25),
     moving x of (0,1,0) to −7/25 (NOT 1, NOT the bogus +1 of a wrong cos = c₁c₂+s₁s₂ law).

## GO / NO-GO

GO if: planeRotLin_mul compiles foundations-only with bounded cost (the heaviest lemma — a
coordinate operator equality with reQC_* and smul arithmetic). Then bank the chain.

NO-GO / DECOMPOSE if: planeRotLin_mul resists the bounded budget (W9) — measure the smallest
sub-obligation, decompose into the (x,r)-coordinate lemma + the imaginary-part lemma, bank what
compiles, child the rest.

## KILL (W9 instrument budget)

KILL planeRotLin_mul at > 90s single-lemma compile or > 2 GB. If hit: this is INSTRUMENT failure
(coordinate brute too heavy), NOT theory failure — decompose into the two coordinate projections
(x-slot via a small reQC computation; v-slot via the •1 add_smul collection), each banked
separately. The composition law is TRUE (verified by hand); only its packaging needs structuring.

## SCOPE / THE HEAVY REMAINDER (child N108)

The FULL compact-SO(9) surjectivity needs THREE legs: (a) SO(8) ⊆ words [the octonion
bimultiplications generate SO(8) — the Moufang/triality question, HEAVY]; (b) the A-torus [THIS
NODE]; (c) the KAK assembly SO(9)=SO(8)·A·SO(8) + operator topology over Cut [HEAVY, Mathlib lacks
it over Cut]. N107 banks leg (b); legs (a)+(c) + operator topology are the childed heavy remainder.

## ANTI-DRIFT / THE ONE LAW

No posited Lorentz group, no SO⁺(1,9), no Mathlib ℝ/ℂ as content (the field IS the derived Cut),
no operator topology posited, no bridge. The circle group law is theory-native — it is the SO(2)
structure the ninth-direction generators already carry, read out of their coordinate action.
