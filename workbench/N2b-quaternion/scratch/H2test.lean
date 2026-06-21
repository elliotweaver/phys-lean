/- SCRATCH 2 — rung 2: H R := CD (Dbl R). Star on Dbl, ring on H, non-commutativity. -/
import Mathlib.Algebra.Star.Basic
import Mathlib.Algebra.Ring.Defs
import Mathlib.Tactic
import Phys.Cascade.ComplexUnit

namespace Scratch2
open Phys.Cascade

-- Star on the banked Dbl R: complex conjugation (negate the new dimension).
instance {R : Type*} [CommRing R] : Star (Dbl R) := ⟨fun z => ⟨z.re, -z.im⟩⟩

@[simp] theorem star_dbl_re {R : Type*} [CommRing R] (z : Dbl R) : (star z).re = z.re := rfl
@[simp] theorem star_dbl_im {R : Type*} [CommRing R] (z : Dbl R) : (star z).im = -z.im := rfl

instance {R : Type*} [CommRing R] : StarRing (Dbl R) where
  star_involutive z := by ext <;> simp
  star_mul z w := by ext <;> simp [Dbl.mul_re, Dbl.mul_im] <;> ring
  star_add z w := by ext <;> simp <;> ring

-- The cause: J has star J = -J ≠ J on a nontrivial base.
example {R : Type*} [CommRing R] : star (Dbl.J : Dbl R) = -Dbl.J := by
  ext <;> simp [Dbl.J]

example : star (Dbl.J : Dbl ℚ) ≠ Dbl.J := by
  intro h
  have : (-1:ℚ) = 1 := by have := congrArg Dbl.im h; simpa [Dbl.J] using this
  norm_num at this

-- Now CD (Dbl R)
structure CD (A : Type*) where
  re : A
  im : A

namespace CD
@[ext] theorem ext {A : Type*} : ∀ {z w : CD A}, z.re = w.re → z.im = w.im → z = w
  | ⟨_, _⟩, ⟨_, _⟩, rfl, rfl => rfl
variable {A : Type*}
instance [Zero A] : Zero (CD A) := ⟨⟨0, 0⟩⟩
instance [Zero A] [One A] : One (CD A) := ⟨⟨1, 0⟩⟩
instance [Add A] : Add (CD A) := ⟨fun z w => ⟨z.re + w.re, z.im + w.im⟩⟩
instance [Neg A] : Neg (CD A) := ⟨fun z => ⟨-z.re, -z.im⟩⟩
instance [Star A] [Neg A] : Star (CD A) := ⟨fun z => ⟨star z.re, -z.im⟩⟩
instance [Mul A] [Add A] [Neg A] [Star A] : Mul (CD A) :=
  ⟨fun z w => ⟨z.re * w.re + -(star w.im * z.im), w.im * z.re + z.im * star w.re⟩⟩
@[simp] theorem zero_re [Zero A] : (0 : CD A).re = 0 := rfl
@[simp] theorem zero_im [Zero A] : (0 : CD A).im = 0 := rfl
@[simp] theorem one_re [Zero A] [One A] : (1 : CD A).re = 1 := rfl
@[simp] theorem one_im [Zero A] [One A] : (1 : CD A).im = 0 := rfl
@[simp] theorem add_re [Add A] (z w : CD A) : (z + w).re = z.re + w.re := rfl
@[simp] theorem add_im [Add A] (z w : CD A) : (z + w).im = z.im + w.im := rfl
@[simp] theorem neg_re [Neg A] (z : CD A) : (-z).re = -z.re := rfl
@[simp] theorem neg_im [Neg A] (z : CD A) : (-z).im = -z.im := rfl
@[simp] theorem mul_re [Mul A] [Add A] [Neg A] [Star A] (z w : CD A) :
    (z * w).re = z.re * w.re + -(star w.im * z.im) := rfl
@[simp] theorem mul_im [Mul A] [Add A] [Neg A] [Star A] (z w : CD A) :
    (z * w).im = w.im * z.re + z.im * star w.re := rfl

instance [CommRing A] [StarRing A] : Ring (CD A) where
  add_assoc a b c := by ext <;> simp <;> ring
  zero_add a := by ext <;> simp
  add_zero a := by ext <;> simp
  add_comm a b := by ext <;> simp <;> ring
  left_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> ring
  right_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> ring
  zero_mul a := by ext <;> simp
  mul_zero a := by ext <;> simp
  mul_assoc a b c := by ext <;> simp [star_mul', star_add, star_star, mul_add, add_mul] <;> ring
  one_mul a := by ext <;> simp
  mul_one a := by ext <;> simp
  neg_add_cancel a := by ext <;> simp
  nsmul := nsmulRec
  zsmul := zsmulRec

end CD

-- rung 2 object
abbrev H (R : Type*) [CommRing R] := CD (Dbl R)

-- the canonical non-commuting pair: ι(J) := (J,0) and e₂ := (0,1)
def iotaJ {R : Type*} [CommRing R] : H R := ⟨Dbl.J, 0⟩
def e2 {R : Type*} [CommRing R] : H R := ⟨0, 1⟩

example : (iotaJ : H ℚ) * e2 ≠ e2 * iotaJ := by
  intro h
  -- im of (iotaJ*e2) = J ; im of (e2*iotaJ) = star J = -J ; J ≠ -J over ℚ
  have h2 := congrArg CD.im h
  simp only [iotaJ, e2, CD.mul_im] at h2
  -- h2 : (1:Dbl ℚ) * Dbl.J + 0 * star 0 = 0 * 0 + 1 * star Dbl.J  (shapes)
  -- reduce to J = star J = -J, then im: 1 = -1
  have h3 := congrArg Dbl.im h2
  simp only [Dbl.J] at h3
  norm_num at h3

-- explicit values check
example : (iotaJ : H ℚ) * e2 = ⟨0, Dbl.J⟩ := by
  ext <;> simp [iotaJ, e2, CD.mul_re, CD.mul_im]

example : (e2 : H ℚ) * iotaJ = ⟨0, star Dbl.J⟩ := by
  ext <;> simp [iotaJ, e2, CD.mul_re, CD.mul_im]

end Scratch2
