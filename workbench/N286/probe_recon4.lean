import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
set_option synthInstance.maxSize 400000

theorem self_adjoint_ocR (z : O ℚ) (hz : star z = z) : z = ocR (reQ z) := by
  obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := z
  have hstar : star (⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ : O ℚ)
      = ⟨⟨⟨a, -b⟩, ⟨-c, -d⟩⟩, ⟨⟨-e, -f⟩, ⟨-g, -h⟩⟩⟩ := rfl
  rw [hstar] at hz
  simp only [CD.mk.injEq, Dbl.mk.injEq] at hz
  simp only [ocR, reQ]
  obtain ⟨⟨⟨_, hb⟩, hc, hd⟩, ⟨he, hf⟩, hg, hh⟩ := hz
  have hb0 : b = 0 := by linarith
  have hc0 : c = 0 := by linarith
  have hd0 : d = 0 := by linarith
  have he0 : e = 0 := by linarith
  have hf0 : f = 0 := by linarith
  have hg0 : g = 0 := by linarith
  have hh0 : h = 0 := by linarith
  subst hb0 hc0 hd0 he0 hf0 hg0 hh0
  rfl

-- matrix reconstruction: Aᴴ = A → A = Hm (reQ (A00)) (reQ (A11)) (reQ (A22)) (A01) (A02) (A12)
theorem herm_eq_Hm (A : Matrix (Fin 3) (Fin 3) (O ℚ)) (hA : Aᴴ = A) :
    A = Hm (reQ (A 0 0)) (reQ (A 1 1)) (reQ (A 2 2)) (A 0 1) (A 0 2) (A 1 2) := by
  -- entrywise: A i j = star (A j i) from hA
  have hentry : ∀ i j, star (A j i) = A i j := fun i j => congrFun (congrFun hA i) j
  apply Matrix.ext
  intro i j
  fin_cases i <;> fin_cases j <;> simp only [Hm, of_apply, cons_val', cons_val_zero,
      cons_val_one, head_cons, cons_val_two, tail_cons, head_fin_const, empty_val',
      cons_val_fin_one, cons_val]
  · -- (0,0): A 0 0 = ocR (reQ (A 0 0)), from self-adjoint diagonal
    exact self_adjoint_ocR (A 0 0) (hentry 0 0)
  · -- (0,1): A 0 1 = A 0 1
    rfl
  · rfl -- (0,2)
  · -- (1,0): A 1 0 = star (A 0 1)
    exact (hentry 1 0).symm
  · exact self_adjoint_ocR (A 1 1) (hentry 1 1)
  · rfl -- (1,2)
  · exact (hentry 2 0).symm -- (2,0): A 2 0 = star (A 0 2)
  · exact (hentry 2 1).symm -- (2,1): A 2 1 = star (A 1 2)
  · exact self_adjoint_ocR (A 2 2) (hentry 2 2)

end Phys.Algebra.HJ
