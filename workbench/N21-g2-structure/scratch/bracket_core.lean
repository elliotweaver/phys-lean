import Phys.Algebra.DerivationUpperBound
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## (1) Bracket closure over ℚ. -/

theorem isDerivQ_bracket (f g : Module.End ℚ (O ℚ))
    (hf : IsDerivQ f) (hg : IsDerivQ g) : IsDerivQ ⁅f, g⁆ := by
  intro x y
  show (f * g - g * f) (x * y) = (f * g - g * f) x * y + x * (f * g - g * f) y
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [hg x y, hf x y]
  simp only [map_add]
  rw [hf (g x) y, hf x (g y), hg (f x) y, hg x (f y)]
  simp only [sub_mul, mul_sub]; abel

/-! ## (2) The 14-dim Lie algebra. -/

def derivationLieQ : LieSubalgebra ℚ (Module.End ℚ (O ℚ)) where
  carrier := { D | IsDerivQ D }
  add_mem' := by
    intro f g hf hg x y
    simp only [LinearMap.add_apply]
    rw [hf x y, hg x y]; simp only [add_mul, mul_add]; abel
  zero_mem' := by intro x y; simp
  smul_mem' := by
    intro c f hf x y
    show (c • f) (x * y) = (c • f) x * y + x * (c • f) y
    simp only [LinearMap.smul_apply]
    rw [hf x y, smul_add, qsmul_mul_left, qsmul_mul_right]
  lie_mem' := by
    intro f g hf hg
    exact isDerivQ_bracket f g hf hg

@[simp] theorem mem_derivationLieQ {D : Module.End ℚ (O ℚ)} :
    D ∈ derivationLieQ ↔ IsDerivQ D := Iff.rfl

noncomputable instance : LieRing derivationLieQ := inferInstance
noncomputable instance : LieAlgebra ℚ derivationLieQ := inferInstance

theorem derivLieQ_add_left (x y z : derivationLieQ) :
    ⁅x + y, z⁆ = ⁅x, z⁆ + ⁅y, z⁆ := add_lie x y z
theorem derivLieQ_add_right (x y z : derivationLieQ) :
    ⁅x, y + z⁆ = ⁅x, y⁆ + ⁅x, z⁆ := lie_add x y z
theorem derivLieQ_self (x : derivationLieQ) : ⁅x, x⁆ = 0 := lie_self x
theorem derivLieQ_jacobi (x y z : derivationLieQ) :
    ⁅x, ⁅y, z⁆⁆ + ⁅y, ⁅z, x⁆⁆ + ⁅z, ⁅x, y⁆⁆ = 0 := lie_jacobi x y z

/-! ## (3) The explicit 14-element basis. -/

noncomputable section

def Dsub : Fin 14 → derivationQ := fun i =>
  ⟨![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] i,
   Dvec_mem i⟩

theorem subtype_comp_Dsub :
    (Submodule.subtype derivationQ) ∘ Dsub
      = ![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] := rfl

theorem Dsub_indep : LinearIndependent ℚ Dsub := by
  have h : LinearIndependent ℚ ((Submodule.subtype derivationQ) ∘ Dsub) := by
    rw [subtype_comp_Dsub]; exact Dvec_linearIndependent
  exact h.of_comp _

def derivBasis : Module.Basis (Fin 14) ℚ derivationQ :=
  basisOfLinearIndependentOfCardEqFinrank Dsub_indep (by
    rw [finrank_derivationQ_eq_14]; rfl)

@[simp] theorem derivBasis_apply (i : Fin 14) : (derivBasis i : Module.End ℚ (O ℚ)) = Dsub i := by
  simp only [derivBasis, coe_basisOfLinearIndependentOfCardEqFinrank]

end

end Phys.Algebra
