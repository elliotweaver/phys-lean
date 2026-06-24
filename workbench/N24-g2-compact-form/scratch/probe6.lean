import Phys.Algebra.DerivationPerfect
import Mathlib.Algebra.Lie.TraceForm
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def coordO : O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ) where
  toFun z := ![c0 z, c1 z, c2 z, c3 z, c4 z, c5 z, c6 z, c7 z]
  invFun v := ⟨⟨⟨v 0, v 1⟩, ⟨v 2, v 3⟩⟩, ⟨⟨v 4, v 5⟩, ⟨v 6, v 7⟩⟩⟩
  map_add' a b := by
    funext i; fin_cases i <;>
      simp [c0,c1,c2,c3,c4,c5,c6,c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  map_smul' q z := by
    funext i; fin_cases i <;>
      simp [c0,c1,c2,c3,c4,c5,c6,c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]
  left_inv z := by
    obtain ⟨⟨⟨a,b⟩,⟨c,d⟩⟩,⟨⟨e,f⟩,⟨g,h⟩⟩⟩ := z; rfl
  right_inv v := by funext i; fin_cases i <;> simp [c0,c1,c2,c3,c4,c5,c6,c7]

def bO : Module.Basis (Fin 8) ℚ (O ℚ) := Module.Basis.ofEquivFun coordO

def gForm (v w : O ℚ) : ℚ := reQ (v * star w)

/-- ORTHONORMALITY BRIDGE: coordO z j = gForm z (bO j) for all j. -/
theorem coord_eq_gForm (z : O ℚ) (j : Fin 8) : coordO z j = gForm z (bO j) := by
  fin_cases j <;>
  · simp only [bO, Module.Basis.coe_ofEquivFun, gForm, coordO,
      LinearEquiv.coe_symm_mk, LinearEquiv.coe_mk, Matrix.cons_val]
    simp [reQ, c0,c1,c2,c3,c4,c5,c6,c7, CD.mul_re, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, Pi.single_apply]

/-- trace via bO = sum of diagonal repr coords = sum over coordO. -/
theorem trace_eq_sum_coord (f : Module.End ℚ (O ℚ)) :
    LinearMap.trace ℚ (O ℚ) f = ∑ j, coordO (f (bO j)) j := by
  rw [LinearMap.trace_eq_matrix_trace ℚ bO, Matrix.trace]
  congr 1; funext j
  simp only [Matrix.diag_apply, LinearMap.toMatrix_apply, bO,
    Module.Basis.ofEquivFun_repr_apply]

end

end Phys.Algebra
