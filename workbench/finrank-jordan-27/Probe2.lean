import Phys.Algebra.HermitianJordan.Setup
import Phys.Algebra.DerivationSkew
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Defs

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

theorem reQ_add' (x y : O ℚ) : reQ (x+y) = reQ x + reQ y := by
  simp only [reQ, CD.add_re, Dbl.add_re]
theorem reQ_smul' (q:ℚ) (x:O ℚ) : reQ (q • x) = q * reQ x := by
  simp only [reQ]; simp [cd_qsmul_re]

/-- The real-trace functional on the Hermitian arena. -/
noncomputable def hermTrace : hermSub →ₗ[ℚ] ℚ where
  toFun M := reQ ((M:Matrix (Fin 3) (Fin 3) (O ℚ)) 0 0)
             + reQ ((M:Matrix (Fin 3) (Fin 3) (O ℚ)) 1 1)
             + reQ ((M:Matrix (Fin 3) (Fin 3) (O ℚ)) 2 2)
  map_add' M N := by
    simp only [Submodule.coe_add, Matrix.add_apply, reQ_add']; ring
  map_smul' q M := by
    simp only [SetLike.val_smul, Matrix.smul_apply, reQ_smul', RingHom.id_apply, smul_eq_mul]; ring

/-- The functional is surjective (nonzero): it hits 1. -/
theorem hermTrace_surj : Function.Surjective hermTrace := by
  intro r
  refine ⟨⟨Hm r 0 0 0 0 0, ?_⟩, ?_⟩
  · rw [mem_hermSub]; apply Matrix.ext; intro i j
    simp only [Matrix.conjTranspose_apply, Hm]
    fin_cases i <;> fin_cases j <;> simp [Matrix.of_apply, ocR_star, star_zero, star_star]
  · simp only [hermTrace, LinearMap.coe_mk, AddHom.coe_mk, Hm]
    simp [Matrix.of_apply, reQ, ocR]

end Phys.Algebra.HJ
