# N240 — PREREG (frozen BEFORE production compute)

## The node (owner-authorized gather-side hypercharge front, under the lock)
Derive a FORCED, distinguished, covariant charge DIRECTION out of the ATOMIZED GATHER
OBSTRUCTION object — read on the banked branching `7 = 3 ⊕ 3̄ ⊕ 1` (N42c) — never posited,
never normalized by hand.

## THE FRONT (chosen autonomously; ONE target, no menu)
The gather obstruction is the associator/cross-product tear, made explicit as the
g₂-equivariant embedding of the fundamental 7 INTO so(7):
  `crossOp a : ImO → ImO`, `y ↦ octCross a y`  (N223, `TowerGatherObstructionAdjointSo7`),
skew-adjoint for the Born form, with the g₂-intertwiner `⁅imRep D, crossOp a⁆ = crossOp (D a)`.

The branching `7 = 3 ⊕ 3̄ ⊕ 1` (N42c) SINGLES OUT exactly one element of the 7: the singlet
generator `u1` (the fold's distinguished square-root of −1, the axis of the whole colour
complex structure `J = L_{u1}`). Feed THAT distinguished singlet element into the gather
obstruction operator:

  ★ THE FORCED CHARGE OPERATOR:  `chargeOp := crossOp u1 ∈ so(7) ⊂ End ℚ ImO`.

This is NOT a posited u(1); it is the value of the gather tear on the ONE element the branching
distinguishes. Its eigen-structure on the 7 IS the branching, and its g₂-stabilizer IS the
already-banked colour `su(3)`. The FORCED direction is `chargeOp`; there is no normalization
choice (the OPERATOR is what the gather produces, canonically).

## WHAT I WILL PROVE (magnitude theorem, TYPE mentions banked tower objects)
File `Phys/Algebra/TowerGatherForcedChargeDirection.lean`, over derived ℚ, `O ℚ = CD (H ℚ)`,
`ImO`, `crossOp`/`imRep` (N223), `u1`/`JO`/`Uhol`/`Uah`/`singlet` (N42c), `colourCentralizer`
(N201):

1. `chargeOp := crossOp u1`  — the forced charge operator, DEFINED as the gather tear on the
   branching's distinguished singlet generator. NON-VACUITY: `chargeOp ≠ 0` (banked
   `crossOp_ne_zero`).
2. `chargeOp_mem_so7 : chargeOp ∈ skewAdjointLieSubalgebra bornBil` — the charge operator is a
   genuine element of the gather arena so(7) (banked `crossOp_mem_so7` at u1).
3. ★ `chargeOp_kills_singlet : chargeOp ⟨u1,·⟩ = 0` — the charge operator ANNIHILATES the
   branching singlet `⟨u1⟩` (via banked `octCross_self`: `octCross u1 u1 = 0`). The singlet
   `1` is the CHARGE-ZERO / neutral direction — DERIVED, not assigned.
4. ★★ `chargeOp_sq : (chargeOp (chargeOp y) : O ℚ) = gForm u1 (y:O) • u1 − (y:O)` for y ∈ ImO;
   restricted to the branching complement `V = 3 ⊕ 3̄` (where `gForm u1 (y:O) = 0`, because V ⟂ u1),
   this is `chargeOp² = −id on V` (banked `octCross_contraction` + `gForm_u1`). So `chargeOp`
   is a COMPLEX STRUCTURE on the `6 = 3 ⊕ 3̄` and ZERO on the `1` — the charge operator's
   eigen-grading REPRODUCES the branching `7 = 1 ⊕ (3 ⊕ 3̄)`, the singlet at eigenvalue 0 and
   the triplet/antitriplet as the ±i eigenspaces of `chargeOp|_V`. (This is the SAME split
   N42c's `JO=L_{u1}` produces, now realized inside the GATHER obstruction so(7), not on the
   whole algebra — the gather singles out the charge direction covariantly.)
5. ★★★ THE FORCED-DIRECTION / COVARIANCE HEADLINE: the g₂-stabilizer of `chargeOp` inside
   `g₂ = derivationLieQ` — `{D | ⁅imRep D, chargeOp⁆ = 0}` — is EXACTLY the banked colour
   `su(3) = colourCentralizer`, dimension 8 (proper: `0 ⊊ su(3) ⊊ g₂`). Via the banked
   intertwiner `⁅imRep D, crossOp u1⁆ = crossOp (D u1)` (N223) + faithfulness of `crossEmb`
   (N224, `crossOp a = 0 ⟹ a = 0` on ImO), `⁅imRep D, chargeOp⁆ = 0 ⟺ crossOp (D u1) = 0
   ⟺ D u1 = 0 ⟺ D ∈ colourCentralizer` (N201 `commutes_JO_iff`). So the charge direction is
   COVARIANT: its unbroken symmetry is a forced, dimension-8, PROPER reduction of the ambient
   g₂ — NOT symmetric under the whole group (an invariant object could not do this; a covariant
   one can — the manager's weighing). NON-VACUITY WITH TEETH: some derivation (the off-Cartan
   isospin `DJ`) does NOT stabilize chargeOp (`⁅imRep DJ, chargeOp⁆ ≠ 0`, via banked
   `DJ_u1 = iotaO(−2•hK) ≠ 0` + faithfulness) — the charge direction is genuinely NOT central,
   so the reduction is proper.
6. Capstone `forced_charge_direction_structure` bundling (2)+(3)+(4-on-V)+(5)+non-vacuity.

## GO / NO-GO
- GO iff: chargeOp is a nonzero element of the gather so(7) (2), it grades the 7 exactly as the
  branching (3)+(4), and its g₂-stabilizer is the banked colour su(3) of dim 8 and PROPER (5),
  ALL foundations-only, costume C271 biting, physics-words-removable.
- NO-GO / BLOCK iff: (a) the stabilizer-equals-su(3) needs a not-yet-banked gather fact I cannot
  build cheaply → NAME it, child a gather-side route-finding node, BLOCK (do NOT fork to ascent);
  (b) any obligation hits a W9 instrument wall → measure, decompose, child.

## KILL CLASSES (declared up front)
- KILL-1 (drift to ascent): if I find myself in `End ℚ (End ℚ ImO)` (the 2401-dim two-level
  arena) or reaching for J₃(O) trace forms / invariant towers — STOP, reframe. The arena here is
  `ImO` (dim 7) / `End ℚ ImO` (dim 49) / `derivationLieQ` — NOT the instance-diamond space.
- KILL-2 (posited/normalized u(1)): if the "charge" requires choosing a normalization, a
  convention, or weakening to "a charge exists" without the forced OPERATOR — STOP, that is the
  11× deferral trap; the OPERATOR `crossOp u1` is forced with no choice, so this must not arise.
- KILL-3 (free-floating): if the magnitude theorem's TYPE stops mentioning `crossOp`/`imRep`/
  `u1`/`ImO`/`colourCentralizer`/`bornBil` — reframe onto the banked objects.
- COMPILE BUDGET / W9 KILL: each obligation is a short trunk lever (octCross_self,
  octCross_contraction, the intertwiner, faithfulness — all banked, all pointwise). If ANY
  single obligation exceeds ~60s in a bounded probe, declare instrument-wall, measure/decompose.
  NO maxHeartbeats raise. NO monolithic ring/decide on coordinates.

## RECON WITH TEETH (a garbage direction MUST fail to be forced)
- `chargeOp = crossOp u1` is forced by the branching (u1 is THE distinguished element). A garbage
  element `a` with `gForm a a = 0` would give `crossOp a` NOT injective-relevant — but u1 has
  `gForm u1 u1 = 1 ≠ 0`, so the operator is genuine. The costume will anchor the dim-8 stabilizer
  (a wrong value, e.g. 80, must fail to compile).
- The non-vacuity `⁅imRep DJ, chargeOp⁆ ≠ 0` is the teeth: the stabilizer is PROPER, not all of g₂.

## THE MOAT (why this is the crown-jewel front, for the record)
The field POSITS hypercharge assignments (Baez: "nobody knows why"). Here the charge OPERATOR
falls out of the gather obstruction evaluated on the branching's own distinguished element, and
its symmetry is FORCED to be the banked colour su(3). An INVARIANT object (trace form) is
symmetric under everything and cannot force a direction; the COVARIANT gather obstruction CAN,
and does. One cause (u1 = the fold's √−1 = the gather-tear input = the colour axis), many faces
(the branching grading AND the colour stabilizer), derived, not asserted.
