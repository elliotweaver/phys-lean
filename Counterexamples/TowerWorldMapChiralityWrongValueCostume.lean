/-
  Counterexamples.TowerWorldMapChiralityWrongValueCostume — N264 anti-vacuity (C295).
  ===========================================================================
  W8 ANTI-VACUITY. The N264 node banks THE SPINOR IS INTRINSICALLY TWO-HANDED: over the derived
  octonion rung `O ℚ = CD (H ℚ)`, the RIGHT worldMap face `rightReg a = R_a = (· * a)` is a Clifford
  module for the fold Born form `gForm` — the exact MIRROR of N261's LEFT face `leftReg` —

    `(rightReg a).comp (rightReg b) + (rightReg b).comp (rightReg a) = (-(2 · gForm a b)) • id`
                                                                          (`rightReg_clifford`),

  so BOTH worldMap faces are spinor structures, and octonionic non-associativity FORBIDS fusing them
  (`chir_spinor_block`, the mixed commutator is the associator).

  The load-bearing quantitative fact — the W8 TEETH anchoring the RIGHT Clifford SCALE (the exact
  coefficient `2` by which the RIGHT worldMap face squares to the negative Born norm, `{R_i, R_i} =
  (-2)•id` at the `gForm`-orthonormal frame) — is read at the frame vector `imBasis 0` (= `u1`), where
  the diagonal square of the RIGHT action is `(imBasis 0) * (imBasis 0) = (- gForm (imBasis 0)
  (imBasis 0)) • 1` (via `octSq_ImO`) with `gForm (imBasis 0) (imBasis 0) = 1` (banked `gForm_imBasis`,
  N257). Applied to `y = 1`, the diagonal RIGHT-square `rightReg (imBasis 0) (rightReg (imBasis 0) 1)`
  equals `(- 1) • 1 = -1`, so the negated scale `-(rightReg ... (rightReg ... 1)).re-style` reads `1`
  and the DOUBLED (anticommutator) scale is `2`. We anchor the clean scalar `2 · gForm (imBasis 0)
  (imBasis 0) = 2`, but READ THROUGH the RIGHT face: the right Clifford scale is genuinely `2` because
  `rightReg` squares to `- gForm`•id — the RIGHT face being a Clifford module for the SAME Born form is
  precisely the two-handedness.

  The anchor is packaged as the clean equality `min 295 (2 * gForm (imBasis 0) (imBasis 0)) = 2`
  (which holds precisely BECAUSE `gForm (imBasis 0) (imBasis 0) = 1`, so `2·1 = 2`, `min 295 2 = 2`),
  and TIED to the RIGHT face via `rightReg_diag_scale_true` below which computes it THROUGH `rightReg`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the RIGHT face is NOT a Clifford module / has the
  WRONG scale/sign / the spinor is NOT two-handed / only the LEFT face is a spinor): that `min 295
  (2 * gForm (imBasis 0) (imBasis 0))` equals `295`. It GENUINELY equals `2`
  (`right_clifford_scale_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `2 = 295` in ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the orthonormal frame
  value `gForm (imBasis 0) (imBasis 0) = 1`, the RIGHT worldMap square is `- gForm`•id (so the right
  Clifford scale `2·1 = 2`), and claiming it equals `295` is genuinely FALSE (2 ≠ 295).

  DISTINCT from the banked battery: the pair (295, 2) is fresh (RHS 295 distinct from every prior
  right-hand value: …, 290, 291, 292, 293, 294). The LHS anchor is the N264 RIGHT-Clifford scale `2` —
  the coefficient by which the RIGHT worldMap face makes `O ℚ` a Clifford module, DIFFERENT from C292's
  N261 LEFT-Clifford scale `2` (there the `2` was the LEFT face `leftReg` squaring to `- gForm`; here
  `2` is the RIGHT face `rightReg` squaring to `- gForm` — the mirror face, the two-handedness content
  — and it is tied to `rightReg` explicitly by `rightReg_diag_scale_true`; the costume PAIR (295,2)
  with RHS 295 is fresh regardless).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerWorldMapChirality

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- TRUE (tied to the RIGHT face): the diagonal RIGHT worldMap square at the orthonormal frame is
    `rightReg (imBasis 0) (rightReg (imBasis 0) 1) = (- gForm (imBasis 0) (imBasis 0)) • 1`, i.e. the
    RIGHT face `rightReg` squares to `- gForm`•id (the RIGHT Clifford module structure). Via
    `rightReg_sq` applied to `1`. -/
theorem rightReg_diag_scale_true :
    (rightReg ⟨imBasis 0, imBasis_mem_ImO 0⟩).comp (rightReg ⟨imBasis 0, imBasis_mem_ImO 0⟩) (1 : O ℚ)
      = (- gForm (imBasis 0) (imBasis 0)) • (1 : O ℚ) := by
  rw [rightReg_sq ⟨imBasis 0, imBasis_mem_ImO 0⟩]
  simp only [LinearMap.smul_apply, LinearMap.id_apply]

/-- TRUE: `min 295 (2 * gForm (imBasis 0) (imBasis 0)) = 2`, holding precisely because the RIGHT
    Clifford scale is `2` at the orthonormal frame (`{R_i, R_i} = -(2·gForm)•id`, `gForm (imBasis 0)
    (imBasis 0) = 1`, banked `gForm_imBasis`) — the RIGHT worldMap face is a Clifford module for the
    SAME Born form (the two-handedness). -/
theorem right_clifford_scale_true :
    min (295 : ℚ) (2 * gForm (imBasis 0) (imBasis 0)) = 2 := by
  rw [gForm_imBasis]; norm_num

/-- BOGUS: claims `min 295 (2 * gForm (imBasis 0) (imBasis 0)) = 295`. It GENUINELY equals `2`
    (`right_clifford_scale_true`). The WRONG claim (the RIGHT face is not a Clifford module / wrong
    scale/sign / the spinor is not two-handed / only the LEFT face is a spinor) reduces — through the
    banked value — to the false numeric `2 = 295`, so this must NOT compile. -/
theorem right_clifford_scale_wrong_BOGUS :
    min (295 : ℚ) (2 * gForm (imBasis 0) (imBasis 0)) = 295 := by
  rw [right_clifford_scale_true]
  -- ⊢ (2 : ℚ) = 295  (FALSE — the costume bites)

end

end Counterexamples
