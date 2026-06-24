import Phys.Algebra.DerivationDim
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- Build Module ℚ on CD A when the base A has Module ℚ, componentwise.
-- Dbl ℚ: need Module ℚ (Dbl ℚ). Dbl ℚ has SMul ℚ already (instance : SMul R (Dbl R)).
-- We need the full Module instance.

section ModuleProbe
variable {A : Type*}

-- Componentwise ℚ-smul on CD A given SMul ℚ A
instance cdSmulQ [SMul ℚ A] : SMul ℚ (CD A) := ⟨fun q z => ⟨q • z.re, q • z.im⟩⟩

@[simp] theorem cd_qsmul_re [SMul ℚ A] (q : ℚ) (z : CD A) : (q • z).re = q • z.re := rfl
@[simp] theorem cd_qsmul_im [SMul ℚ A] (q : ℚ) (z : CD A) : (q • z).im = q • z.im := rfl

-- Module ℚ (CD A) given Module ℚ A and narCD's AddCommGroup
def cdModuleQ [NonAssocRing A] [StarRing A] [Module ℚ A] :
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

end Phys.Algebra
