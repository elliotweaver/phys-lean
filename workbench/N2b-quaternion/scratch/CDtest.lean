/- SCRATCH — testing the generic Cayley-Dickson double `CD` and the hard mul_assoc.
   NOT imported by Phys.lean. -/
import Mathlib.Algebra.Star.Basic
import Mathlib.Algebra.Ring.Defs
import Mathlib.Tactic

namespace Scratch

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
/-- The Cayley–Dickson product: `(a,b)(c,d) = (ac − d* b, d a + b c*)`. -/
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
@[simp] theorem star_re [Star A] [Neg A] (z : CD A) : (star z).re = star z.re := rfl
@[simp] theorem star_im [Star A] [Neg A] (z : CD A) : (star z).im = -z.im := rfl
@[simp] theorem mul_re [Mul A] [Add A] [Neg A] [Star A] (z w : CD A) :
    (z * w).re = z.re * w.re + -(star w.im * z.im) := rfl
@[simp] theorem mul_im [Mul A] [Add A] [Neg A] [Star A] (z w : CD A) :
    (z * w).im = w.im * z.re + z.im * star w.re := rfl

section CommBase
variable [CommRing A] [StarRing A]

-- test mul_assoc generically
example (x y z : CD A) : (x * y) * z = x * (y * z) := by
  ext <;> simp [star_mul', star_add, star_star, mul_add, add_mul] <;> ring

example (z : CD A) : (1 : CD A) * z = z := by
  ext <;> simp

example (z : CD A) : z * (1 : CD A) = z := by
  ext <;> simp

example (a b c : CD A) : a * (b + c) = a * b + a * c := by
  ext <;> simp <;> ring

example (a b c : CD A) : (a + b) * c = a * c + b * c := by
  ext <;> simp <;> ring

end CommBase

end CD
end Scratch
