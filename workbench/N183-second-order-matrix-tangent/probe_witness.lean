import Phys.Algebra.DerivationOTangent

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- witness: M = single 0 1 1 + single 1 0 2.  M² has (0,0) entry = M 0 1 * M 1 0 = 1*2 = 2.
-- expTerm M 2 0 0 = (1/2)*(M²)₀₀ = (1/2)*2 = 1.  First-order coeff M 0 0 = 0.  Genuine 2nd order.
def cwM : Matrix (Fin 8) (Fin 8) Cut := Matrix.single 0 1 1 + Matrix.single 1 0 2

theorem cw_2nd_coeff : expTerm cwM 2 0 0 = (1 : Cut) := by
  unfold expTerm cwM
  simp only [Nat.factorial, Matrix.smul_apply, smul_eq_mul, pow_two, Matrix.mul_apply,
    Matrix.add_apply, Matrix.single, Matrix.of_apply]
  norm_num [Finset.sum_add_distrib, Finset.sum_ite_eq, Finset.sum_ite_eq', Fin.sum_univ_succ]

theorem cw_1st_coeff : cwM 0 0 = (0 : Cut) := by
  unfold cwM
  simp [Matrix.single, Matrix.add_apply, Matrix.of_apply]

end
end Phys.Algebra

#print axioms Phys.Algebra.cw_2nd_coeff
#print axioms Phys.Algebra.cw_1st_coeff
