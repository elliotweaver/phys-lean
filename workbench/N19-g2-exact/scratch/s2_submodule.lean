import Phys.Algebra.DerivationTraceFree
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Matrix.ToLin

namespace Phys.Algebra.ScratchFinrank2
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def cdProdEquiv (A : Type*) [NonAssocRing A] [StarRing A] [Module ℚ A] :
    CD A ≃ₗ[ℚ] A × A where
  toFun z := (z.re, z.im)
  invFun p := ⟨p.1, p.2⟩
  map_add' a b := by ext <;> simp [CD.add_re, CD.add_im]
  map_smul' q z := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]
  left_inv z := by cases z; rfl
  right_inv p := by cases p; rfl

def dblProdEquiv : Dbl ℚ ≃ₗ[ℚ] ℚ × ℚ where
  toFun z := (z.re, z.im)
  invFun p := ⟨p.1, p.2⟩
  map_add' a b := by ext <;> simp [Dbl.add_re, Dbl.add_im]
  map_smul' q z := by ext <;> simp [Dbl.smul_re, Dbl.smul_im]
  left_inv z := by cases z; rfl
  right_inv p := by cases p; rfl

instance : Module.Finite ℚ (Dbl ℚ) := Module.Finite.equiv dblProdEquiv.symm
instance : Module.Finite ℚ (H ℚ) := Module.Finite.equiv (cdProdEquiv (Dbl ℚ)).symm
instance : Module.Finite ℚ (O ℚ) := Module.Finite.equiv (cdProdEquiv (H ℚ)).symm

-- finrank of the endomorphism ring
example : Module.finrank ℚ (Module.End ℚ (O ℚ)) = 64 := by
  have hO : Module.finrank ℚ (O ℚ) = 8 := by
    rw [(cdProdEquiv (H ℚ)).finrank_eq, Module.finrank_prod]
    have h : Module.finrank ℚ (H ℚ) = 4 := by
      rw [(cdProdEquiv (Dbl ℚ)).finrank_eq, Module.finrank_prod]
      show Module.finrank ℚ (Dbl ℚ) + Module.finrank ℚ (Dbl ℚ) = 4
      rw [dblProdEquiv.finrank_eq, Module.finrank_prod, Module.finrank_self]
    rw [h]
  rw [Module.finrank_linearMap, hO]

-- IsDerivQ predicate over ℚ
def IsDerivQ (D : Module.End ℚ (O ℚ)) : Prop :=
  ∀ x y, D (x * y) = D x * y + x * D y

def derivationQ : Submodule ℚ (Module.End ℚ (O ℚ)) where
  carrier := { D | IsDerivQ D }
  add_mem' := by
    intro f g hf hg x y
    simp only [LinearMap.add_apply]
    rw [hf x y, hg x y]; simp only [add_mul, mul_add]; abel
  zero_mem' := by intro x y; simp
  smul_mem' := by
    intro c f hf x y
    simp only [LinearMap.smul_apply]
    rw [hf x y, smul_add, smul_mul_assoc, mul_smul_comm]

-- derivationQ is finite-dimensional (submodule of a finite-dim space)
instance : Module.Finite ℚ (Module.End ℚ (O ℚ)) := by
  have hO : Module.Finite ℚ (O ℚ) := inferInstance
  infer_instance

noncomputable instance : Module.Finite ℚ derivationQ := inferInstance

-- finrank of the submodule ≤ 64 (well-typed!)
example : Module.finrank ℚ derivationQ ≤ 64 := by
  have h1 : Module.finrank ℚ derivationQ ≤ Module.finrank ℚ (Module.End ℚ (O ℚ)) :=
    Submodule.finrank_le derivationQ
  have h2 : Module.finrank ℚ (Module.End ℚ (O ℚ)) = 64 := by
    have hO : Module.finrank ℚ (O ℚ) = 8 := by
      rw [(cdProdEquiv (H ℚ)).finrank_eq, Module.finrank_prod]
      have h : Module.finrank ℚ (H ℚ) = 4 := by
        rw [(cdProdEquiv (Dbl ℚ)).finrank_eq, Module.finrank_prod]
        show Module.finrank ℚ (Dbl ℚ) + Module.finrank ℚ (Dbl ℚ) = 4
        rw [dblProdEquiv.finrank_eq, Module.finrank_prod, Module.finrank_self]
      rw [h]
    rw [Module.finrank_linearMap, hO]
  omega

-- the ℚ witness from the ℤ witness
noncomputable def witnessDerivQ : Module.End ℚ (O ℚ) :=
  (witnessDeriv.toAddMonoidHom).toRatLinearMap

example (x : O ℚ) : witnessDerivQ x = witnessDeriv x := rfl

example : IsDerivQ witnessDerivQ := by
  intro x y
  show witnessDeriv (x * y) = witnessDeriv x * y + x * witnessDeriv y
  exact witnessDeriv_isDeriv x y

example : witnessDerivQ ≠ 0 := by
  intro h
  apply witnessDeriv_ne_zero
  ext x
  have := congrArg (fun (D : Module.End ℚ (O ℚ)) => D x) h
  simpa [witnessDerivQ] using this

end Phys.Algebra.ScratchFinrank2
