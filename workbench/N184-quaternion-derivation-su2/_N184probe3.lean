import Phys.Algebra.Derivation

/-! N184 PROBE3 — IsDerivH predicate + Lie subalgebra + ad ∈ Der + independence. -/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

section QuatLie

attribute [local instance] CD.narCD CD.srCD

/-- THE LEIBNIZ-DERIVATION PREDICATE on the associative quaternion algebra `H ℚ = CD (Dbl ℚ)`. -/
def IsDerivH (D : Module.End ℤ (H ℚ)) : Prop := ∀ x y, D (x * y) = D x * y + x * D y

theorem isDerivH_zero : IsDerivH 0 := by intro x y; simp
theorem isDerivH_add (f g : Module.End ℤ (H ℚ)) (hf : IsDerivH f) (hg : IsDerivH g) :
    IsDerivH (f + g) := by
  intro x y; simp only [LinearMap.add_apply]; rw [hf x y, hg x y]
  simp only [add_mul, mul_add]; abel
theorem isDerivH_smul (n : ℤ) (f : Module.End ℤ (H ℚ)) (hf : IsDerivH f) :
    IsDerivH (n • f) := by
  intro x y; simp only [LinearMap.smul_apply]
  rw [hf x y, smul_add, smul_mul_assoc, mul_smul_comm]
theorem isDerivH_bracket (f g : Module.End ℤ (H ℚ)) (hf : IsDerivH f) (hg : IsDerivH g) :
    IsDerivH ⁅f, g⁆ := by
  intro x y
  show (f * g - g * f) (x * y) = (f * g - g * f) x * y + x * (f * g - g * f) y
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [hg x y, hf x y]; simp only [map_add]
  rw [hf (g x) y, hf x (g y), hg (f x) y, hg x (f y)]
  simp only [sub_mul, mul_sub]; abel

/-- `Der(H ℚ)` as a `LieSubalgebra`. -/
def derivationH : LieSubalgebra ℤ (Module.End ℤ (H ℚ)) where
  carrier := { D | IsDerivH D }
  add_mem' := isDerivH_add _ _
  zero_mem' := isDerivH_zero
  smul_mem' := isDerivH_smul
  lie_mem' := isDerivH_bracket _ _

/-- The inner map `ad_q` IS a Leibniz-derivation of `H ℚ` (the base is associative). -/
def adM (q : H ℚ) : Module.End ℤ (H ℚ) := (adHom q).toIntLinearMap
@[simp] theorem adM_apply (q x : H ℚ) : adM q x = q * x - x * q := rfl

theorem adM_isDerivH (q : H ℚ) : IsDerivH (adM q) := by
  intro x y; simp only [adM_apply]; noncomm_ring

theorem adM_mem (q : H ℚ) : adM q ∈ derivationH := adM_isDerivH q

end QuatLie

end Phys.Algebra

#print axioms Phys.Algebra.isDerivH_bracket
#print axioms Phys.Algebra.adM_isDerivH
#print axioms Phys.Algebra.derivationH
