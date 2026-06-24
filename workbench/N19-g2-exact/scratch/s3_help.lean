import Phys.Algebra.DerivationTraceFree
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Defs

namespace Phys.Algebra.ScratchHelp
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- helper smul-mul compatibility on O ℚ, componentwise
theorem qsmul_mul_left (c : ℚ) (x y : O ℚ) : (c • x) * y = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

theorem qsmul_mul_right (c : ℚ) (x y : O ℚ) : x * (c • y) = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

-- the lift of an ℤ-endo to a ℚ-endo via ℚ-linearity (map_rat_smul)
noncomputable def toEndQ (D : Module.End ℤ (O ℚ)) : Module.End ℚ (O ℚ) where
  toFun := D
  map_add' := D.map_add
  map_smul' := fun q x => map_rat_smul D q x

@[simp] theorem toEndQ_apply (D : Module.End ℤ (O ℚ)) (x : O ℚ) : toEndQ D x = D x := rfl

end Phys.Algebra.ScratchHelp
