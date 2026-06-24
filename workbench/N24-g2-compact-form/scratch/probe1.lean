import Phys.Algebra.DerivationPerfect
import Mathlib.Algebra.Lie.TraceForm
import Mathlib.Algebra.Lie.InvariantForm
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- The 8 coordinate functionals packaged as a linear equiv `O ℚ ≃ₗ (Fin 8 → ℚ)`. -/
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
    apply (cdProdEquiv (H ℚ)).injective
    sorry
  right_inv v := by funext i; fin_cases i <;> simp [c0,c1,c2,c3,c4,c5,c6,c7]

def bO : Module.Basis (Fin 8) ℚ (O ℚ) := Module.Basis.ofEquivFun coordO

/-- φ x = x.val for the trace form's representation map. -/
example (x : derivationLieQ) (m : O ℚ) :
    (LieModule.toEnd ℚ derivationLieQ (O ℚ) x) m = (x : Module.End ℚ (O ℚ)) m := by
  rfl

/-- THE TRACE REDUCTION: trace of a composite over bO = sum of diagonal repr coords. -/
example (f : Module.End ℚ (O ℚ)) :
    LinearMap.trace ℚ (O ℚ) f = ∑ i, bO.repr (f (bO i)) i := by
  rw [LinearMap.trace_eq_matrix_trace ℚ bO, Matrix.trace]
  simp only [Matrix.diag_apply, LinearMap.toMatrix_apply]

end

end Phys.Algebra
