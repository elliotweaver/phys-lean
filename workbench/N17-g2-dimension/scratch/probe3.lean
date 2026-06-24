import Phys.Algebra.DerivationDim
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

section ModuleProbe
variable {A : Type*}

instance cdSmulQ [SMul ℚ A] : SMul ℚ (CD A) := ⟨fun q z => ⟨q • z.re, q • z.im⟩⟩

@[simp] theorem cd_qsmul_re [SMul ℚ A] (q : ℚ) (z : CD A) : (q • z).re = q • z.re := rfl
@[simp] theorem cd_qsmul_im [SMul ℚ A] (q : ℚ) (z : CD A) : (q • z).im = q • z.im := rfl

@[reducible] def cdModuleQ [NonAssocRing A] [StarRing A] [Module ℚ A] :
    @Module ℚ (CD A) _ (by letI := CD.narCD (A := A); infer_instance) := by
  letI := CD.narCD (A := A)
  exact {
    one_smul := by intro z; ext <;> simp
    mul_smul := by intro a b z; ext <;> simp [mul_smul]
    smul_zero := by intro a; ext <;> simp
    smul_add := by intro a x y; ext <;> simp [smul_add]
    add_smul := by intro a b z; ext <;> simp [add_smul]
    zero_smul := by intro z; ext <;> simp }

end ModuleProbe

-- Now over the concrete O ℚ. Need Module ℚ (Dbl ℚ) first, then up the tower.
section Tower
-- Dbl ℚ : CommRing, has SMul ℚ. Build Module ℚ (Dbl ℚ).
@[reducible] def dblModuleQ : Module ℚ (Dbl ℚ) := by
  exact {
    one_smul := by intro z; ext <;> simp
    mul_smul := by intro a b z; ext <;> simp [mul_assoc]
    smul_zero := by intro a; ext <;> simp
    smul_add := by intro a x y; ext <;> simp [mul_add]
    add_smul := by intro a b z; ext <;> simp [add_mul]
    zero_smul := by intro z; ext <;> simp }

attribute [local instance] dblModuleQ cdModuleQ

-- Module ℚ (H ℚ) = Module ℚ (CD (Dbl ℚ))
example : True := by
  letI : Module ℚ (H ℚ) := cdModuleQ (A := Dbl ℚ)
  letI : Module ℚ (O ℚ) := cdModuleQ (A := H ℚ)
  trivial

end Tower

end Phys.Algebra
