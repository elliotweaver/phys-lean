import Phys.Algebra.Operator
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

namespace ProbeN6
section Carrier
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

def IsDeriv (D : Module.End ℤ (CD (CD B))) : Prop :=
  ∀ x y, D (x * y) = D x * y + x * D y

theorem isDeriv_zero : IsDeriv (0 : Module.End ℤ (CD (CD B))) := by
  intro x y; simp

theorem isDeriv_add (f g : Module.End ℤ (CD (CD B))) (hf : IsDeriv f) (hg : IsDeriv g) :
    IsDeriv (f + g) := by
  intro x y
  simp only [LinearMap.add_apply]
  rw [hf x y, hg x y]; simp only [add_mul, mul_add]; abel

theorem isDeriv_neg (f : Module.End ℤ (CD (CD B))) (hf : IsDeriv f) : IsDeriv (-f) := by
  intro x y
  simp only [LinearMap.neg_apply]
  rw [hf x y]; simp only [neg_mul, mul_neg]; abel

theorem isDeriv_smul (n : ℤ) (f : Module.End ℤ (CD (CD B))) (hf : IsDeriv f) :
    IsDeriv (n • f) := by
  intro x y
  simp only [LinearMap.smul_apply]
  rw [hf x y, smul_add, smul_mul_assoc, mul_smul_comm]

theorem isDeriv_bracket (f g : Module.End ℤ (CD (CD B)))
    (hf : IsDeriv f) (hg : IsDeriv g) : IsDeriv ⁅f, g⁆ := by
  intro x y
  show (f * g - g * f) (x * y) = (f * g - g * f) x * y + x * (f * g - g * f) y
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [hg x y, hf x y]
  simp only [map_add]
  rw [hf (g x) y, hf x (g y), hg (f x) y, hg x (f y)]
  simp only [sub_mul, mul_sub]; abel

def derivation : LieSubalgebra ℤ (Module.End ℤ (CD (CD B))) where
  carrier := { D | IsDeriv D }
  add_mem' := isDeriv_add _ _
  zero_mem' := isDeriv_zero
  smul_mem' := isDeriv_smul
  lie_mem' := isDeriv_bracket _ _

example : LieRing (derivation (B := B)) := inferInstance
example : LieAlgebra ℤ (derivation (B := B)) := inferInstance
example (x y z : derivation (B := B)) : ⁅x + y, z⁆ = ⁅x, z⁆ + ⁅y, z⁆ := add_lie x y z
example (x y z : derivation (B := B)) : ⁅x, y + z⁆ = ⁅x, y⁆ + ⁅x, z⁆ := lie_add x y z
example (x : derivation (B := B)) : ⁅x, x⁆ = 0 := lie_self x
example (x y z : derivation (B := B)) : ⁅⁅x, y⁆, z⁆ + ⁅⁅y, z⁆, x⁆ + ⁅⁅z, x⁆, y⁆ = 0 :=
  lie_jacobi x y z

end Carrier
end ProbeN6
