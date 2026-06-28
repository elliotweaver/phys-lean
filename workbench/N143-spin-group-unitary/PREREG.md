# N143 PREREG — THE ABSTRACT SPIN GROUP via the UNITARY condition

Frozen before compute (W9 / discipline). KILL classifies a fight as INSTRUMENT failure, not theory.

## TARGET (forward frontier priority i)
THE ABSTRACT SPIN GROUP `spinGroup QvCQuad = pinGroup QvCQuad ⊓ even QvCQuad` (Mathlib `Submonoid`),
with the cascade's even covering units LANDING in it. The genuine NEW content beyond N142
(which banked lipschitzGroup + even-subalgebra membership) is the **UNITARY condition**
`star x * x = 1` over the DERIVED `Cut`.

## THE FORCED MATH (measured, not guessed)
- Mathlib: `pinGroup Q = (lipschitzGroup Q).map(coeHom) ⊓ unitary`; `spinGroup Q = pinGroup Q ⊓ even Q`.
  `pinGroup.units_mem_iff : ↑x ∈ pinGroup Q ↔ x ∈ lipschitzGroup Q ∧ ↑x ∈ unitary`.
  `spinGroup.mem_iff : x ∈ spinGroup Q ↔ x ∈ pinGroup Q ∧ x ∈ even Q`.
- `star` on CliffC = `reverse ∘ involute`; `star (ι m) = -ι m` (CliffordAlgebra.star_ι).
- For the even unit value `x = ι a · ι b`:
  `star x = star(ι b)·star(ι a) = (-ι b)(-ι a) = ι b · ι a`, and
  `star x · x = (ι b · ι a)(ι a · ι b) = ι b · (QvC a • 1) · ι b = (QvC a · QvC b) • 1`
  = `algebraMap Cut CliffC (QvC a · QvC b)`.
  Likewise `x · star x = algebraMap (QvC a · QvC b)`. (the central star-mul-self identity)
- Banked signature facts: `QvC mTimeUnit = 1`, `QvC mSpaceUnit = -1` (BvC_mTimeUnit_self/BvC_mSpaceUnit_self + BvC_self).
- UNITARY ⟺ `QvC a · QvC b = 1`:
   • two timelike (1·1=1)  → unitary → spinGroup  (a rotation rotor)
   • two spacelike (−1·−1=1) → unitary → spinGroup
   • mixed timelike·spacelike (1·−1=−1) → `star x · x = −1 ≠ 1` → NOT unitary (pseudo-unitary boost rotor). W8 teeth.

## WHAT THIS NODE BANKS (planned)
- cliffEvenUnit_star_mul_self    : star(↑(u_a·u_b))·↑(u_a·u_b) = algebraMap (QvC a · QvC b)  [the new identity]
- cliffEvenUnit_mul_star_self    : ↑(u_a·u_b)·star(↑(u_a·u_b)) = algebraMap (QvC a · QvC b)
- cliffEvenUnit_mem_unitary      : QvC a·QvC b = 1 → ↑(u_a·u_b) ∈ unitary CliffC      [the unitary condition]
- cliffEvenUnit_mem_pinGroup     : QvC a·QvC b = 1 → ↑(u_a·u_b) ∈ pinGroup QvCQuad      [lipschitz ∧ unitary]
- ★★ cliffEvenUnit_mem_spinGroup : QvC a·QvC b = 1 → ↑(u_a·u_b) ∈ spinGroup QvCQuad     [THE HEADLINE: pin ∧ even]
- cover_proper_spin              : the proper isometry (houseHolderM a ∘ houseHolderM b) is covered by a
                                   spinGroup-landing unit (when like-signature)  [the Spin↠SO⁺ half, group-level]
- cover_spin_timelike_double_mem_spinGroup : the double-timelike even unit ∈ spinGroup (concrete witness)
- ★ W8 teeth: cover_boost_even_star_mul_self_eq_neg_one : the timelike·spacelike (boost) even unit has
                                   star x · x = -1 (NOT 1) — pseudo-unitary, the genuinely-indefinite read-off.

## GO / NO-GO / KILL
- GO  : spinGroup membership PROVED + the unitary star-mul-self identity + the concrete double-timelike
        witness in spinGroup + W8 indefinite teeth (boost rotor star·x = -1), all foundations-only.
- NO-GO: the unitary computation resists / spinGroup membership doesn't typecheck after the trunk reframe.
- KILL : 90s / obligation. NO tsum, NO exponential, NO coordinate brute. Pure grading + star algebra over
         the derived Cut. If a single obligation exceeds 90s → INSTRUMENT failure → measure/decompose, not grind.

## COSTUME (C175)
A WRONG Spin-group / unitary / pin-group / even-subalgebra / parity / signature claim reducing to a false
numeric DISTINCT from C115 1=7 … C174 1=142. Candidate anchor: the boost even unit's star-mul-self value
is -1 (cover_boost_even_star_mul_self_eq_neg_one) OR the double-timelike value is 1; a bogus 143 forces
(1 : CliffC) = 143 or (-1 : CliffC) = 143.

## W4.5 SUFFICIENCY CHECK
N142 banked: cliffEvenUnit_mem_even (even-subalgebra membership) + cliffUnitMul_mem_lipschitzGroup
(lipschitz membership). It did NOT bank the unitary condition, and so could NOT land the unit in the
abstract pinGroup/spinGroup. This node ADVANCES to the actual GROUP membership (spinGroup) — NEW structure,
the genuine new content the §N143(i) frontier names — NOT a lateral re-pin of the even-grade fact.
