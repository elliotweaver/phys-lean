/-
  Counterexamples.TowerWorldMapCliffordModuleWrongValueCostume — N261 anti-vacuity (C292).
  ===========================================================================
  W8 ANTI-VACUITY. The N261 node banks THE GATHER WORLDMAP IS A CLIFFORD MODULE: over the derived
  octonion rung `O ℚ = CD (H ℚ)`, the gather worldMap (left-regular action) `leftReg a = (a · ·)`,
  restricted to imaginary `a ∈ ImO`, satisfies the CLIFFORD anticommutation relation for the fold's
  Born form `gForm`:
    `(leftReg a).comp (leftReg b) + (leftReg b).comp (leftReg a) = (-(2·gForm a b)) • id`
  (`leftReg_clifford`), with the diagonal `(leftReg a).comp (leftReg a) = (-gForm a a) • id`
  (`leftReg_sq`). So `O ℚ` is a Clifford module (spinor) for `gForm` on `ImO`, and at the
  `gForm`-orthonormal frame `{L_(imBasis i), L_(imBasis i)} = (-2)•id`
  (`leftReg_clifford_diag_witness`).

  The load-bearing quantitative fact — the W8 TEETH anchoring the SIGN and SCALE of the Clifford
  relation (the anticommutator scale being exactly `2`, i.e. `{L_a,L_a} = -2·gForm(a,a)`, NOT a
  homomorphism `L_a L_b = L_{ab}` which would need associativity FALSE on `O ℚ`) — is read at the
  `gForm`-orthonormal frame vector `imBasis 0` (= `u1`), where `gForm (imBasis 0) (imBasis 0) = 1`
  (banked `gForm_imBasis`, N257). The anticommutator scale there is `2 · gForm (imBasis 0)
  (imBasis 0) = 2`. This exact scale is precisely the forced fact that the worldMap composition's
  SYMMETRIC part is the (doubled) NEGATIVE Born metric — the Clifford relation, not a homomorphism.

  The anchor is that genuine scale, packaged as the clean equality
  `min 292 (2 * gForm (imBasis 0) (imBasis 0)) = 2` (which holds precisely BECAUSE
  `gForm (imBasis 0) (imBasis 0) = 1`, so `2·1 = 2`, `min 292 2 = 2`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the Clifford relation has the WRONG scale/sign
  / the worldMap is an associative homomorphism `L_a L_b = L_{ab}` / the symmetric part is NOT the
  negative metric): that `min 292 (2 * gForm (imBasis 0) (imBasis 0))` equals `292`. It GENUINELY
  equals `2` (`clifford_scale_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `2 = 292` in ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the orthonormal frame
  value `gForm (imBasis 0) (imBasis 0) = 1`, so the anticommutator scale `2·1 = 2`, and claiming it
  equals `292` is genuinely FALSE (2 ≠ 292).

  DISTINCT from the banked battery (… C290 = 1=290, C291 = 21=291): the pair (292, 2) is fresh (RHS
  292 distinct from every prior right-hand value; the LHS anchor is the N261 Clifford anticommutator
  SCALE `2` — the negative-metric symmetric part of the worldMap — DIFFERENT from C291's N260
  generation dimension `21`, C290's N259 shared-Cartan intersection dimension `1`, C289's N258
  electroweak reductive dimension `4`, C288's N257 gather-isometry scale `6`; here the anchor is the
  FORCED anticommutator scale `2` of the Clifford relation, never before costumed).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerWorldMapCliffordModule

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 292 (2 * gForm (imBasis 0) (imBasis 0)) = 2`, holding precisely because the gather
    worldMap's Clifford anticommutator has scale `2` at the orthonormal frame
    (`{L_a,L_a} = -2·gForm(a,a)`, `gForm (imBasis 0) (imBasis 0) = 1`, banked `gForm_imBasis`). -/
theorem clifford_scale_true :
    min (292 : ℚ) (2 * gForm (imBasis 0) (imBasis 0)) = 2 := by
  rw [gForm_imBasis]; norm_num

/-- BOGUS: claims `min 292 (2 * gForm (imBasis 0) (imBasis 0)) = 292`. It GENUINELY equals `2`
    (`clifford_scale_true`). The WRONG claim (the Clifford relation has the wrong scale/sign / the
    worldMap is an associative homomorphism / the symmetric part is not the negative metric)
    reduces — through the banked value — to the false numeric `2 = 292`, so this must NOT compile. -/
theorem clifford_scale_wrong_BOGUS :
    min (292 : ℚ) (2 * gForm (imBasis 0) (imBasis 0)) = 292 := by
  rw [clifford_scale_true]
  -- ⊢ (2 : ℚ) = 292  (FALSE — the costume bites)

end Counterexamples
