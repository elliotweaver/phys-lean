import Phys.Algebra.OctonionJordanSpectrumMovingSectorGrading
import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.DerivationAutGroup
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def rtr (M : Matrix (Fin 3) (Fin 3) (O ℚ)) : ℚ := reQ (jTr M)

theorem rtr_expand (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr M = reQ (M 0 0) + reQ (M 1 1) + reQ (M 2 2) := by
  unfold rtr jTr
  rw [Matrix.trace]; simp only [Fin.sum_univ_three, Matrix.diag_apply]; rw [reQ_add, reQ_add]

-- reality bridge: for Hermitian H, jTr H = ocR (rtr H).
theorem herm_jTr_eq_ocR_rtr {H : Matrix (Fin 3) (Fin 3) (O ℚ)} (hH : Hᴴ = H) :
    jTr H = ocR (rtr H) := by
  have hd : ∀ i, star (H i i) = H i i := by
    intro i
    have := congrFun (congrFun hH i) i
    rwa [conjTranspose_apply] at this
  have hsc : ∀ i, H i i = ocR (reQ (H i i)) := by
    intro i
    have h1 := selfconj_eq_smul (hd i)
    have h2 : ocR (reQ (H i i)) = (reQ (H i i)) • (1 : O ℚ) := by ext <;> simp [ocR]
    rw [h2, ← h1]
  unfold jTr
  rw [Matrix.trace]
  simp only [Fin.sum_univ_three, Matrix.diag_apply]
  rw [hsc 0, hsc 1, hsc 2, rtr_expand, ocR_add, ocR_add]

end Phys.Algebra.HJ
