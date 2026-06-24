import Phys.Algebra.DerivationTraceFree
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Defs

namespace Phys.Algebra.ScratchFinrank
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- The base rung-1 equiv: Dbl ℚ ≃ₗ[ℚ] ℚ × ℚ.
def dblProdEquiv : Dbl ℚ ≃ₗ[ℚ] ℚ × ℚ where
  toFun z := (z.re, z.im)
  invFun p := ⟨p.1, p.2⟩
  map_add' a b := by ext <;> simp [Dbl.add_re, Dbl.add_im]
  map_smul' q z := by ext <;> simp [Dbl.smul_re, Dbl.smul_im]
  left_inv z := by cases z; rfl
  right_inv p := by cases p; rfl

-- The generic CD equiv: CD A ≃ₗ[ℚ] A × A (componentwise).
def cdProdEquiv (A : Type*) [NonAssocRing A] [StarRing A] [Module ℚ A] :
    CD A ≃ₗ[ℚ] A × A where
  toFun z := (z.re, z.im)
  invFun p := ⟨p.1, p.2⟩
  map_add' a b := by ext <;> simp [CD.add_re, CD.add_im]
  map_smul' q z := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]
  left_inv z := by cases z; rfl
  right_inv p := by cases p; rfl

-- finrank ℚ (Dbl ℚ) = 2
example : Module.finrank ℚ (Dbl ℚ) = 2 := by
  rw [dblProdEquiv.finrank_eq, Module.finrank_prod, Module.finrank_self]

-- FiniteDimensional propagation
instance : Module.Finite ℚ (Dbl ℚ) := Module.Finite.equiv dblProdEquiv.symm
instance : Module.Finite ℚ (H ℚ) :=
  Module.Finite.equiv (cdProdEquiv (Dbl ℚ)).symm
instance : Module.Finite ℚ (O ℚ) :=
  Module.Finite.equiv (cdProdEquiv (H ℚ)).symm

example : Module.finrank ℚ (H ℚ) = 4 := by
  rw [(cdProdEquiv (Dbl ℚ)).finrank_eq, Module.finrank_prod]
  show Module.finrank ℚ (Dbl ℚ) + Module.finrank ℚ (Dbl ℚ) = 4
  rw [dblProdEquiv.finrank_eq, Module.finrank_prod, Module.finrank_self]

example : Module.finrank ℚ (O ℚ) = 8 := by
  rw [(cdProdEquiv (H ℚ)).finrank_eq, Module.finrank_prod]
  have h : Module.finrank ℚ (H ℚ) = 4 := by
    rw [(cdProdEquiv (Dbl ℚ)).finrank_eq, Module.finrank_prod]
    show Module.finrank ℚ (Dbl ℚ) + Module.finrank ℚ (Dbl ℚ) = 4
    rw [dblProdEquiv.finrank_eq, Module.finrank_prod, Module.finrank_self]
  rw [h]

end Phys.Algebra.ScratchFinrank
