/- SCRATCH 3 — does StarRing (CD A) hold over a commutative star-ring base?
   The child N2c needs H R to be a StarRing to double it again. Also the generic
   "one cause" theorem: ι a * e₂ = e₂ * ι a ↔ a = star a. -/
import Mathlib.Algebra.Star.Basic
import Mathlib.Algebra.Ring.Defs
import Mathlib.Tactic

namespace Scratch3

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
@[simp] theorem star_re [Star A] [Neg A] (z : CD A) : (star z).re = star z.re := rfl
@[simp] theorem star_im [Star A] [Neg A] (z : CD A) : (star z).im = -z.im := rfl
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

instance [CommRing A] [StarRing A] : StarRing (CD A) where
  star_involutive z := by ext <;> simp
  star_mul z w := by ext <;> simp [star_mul', star_add, star_star] <;> ring
  star_add z w := by ext <;> simp <;> ring

-- the "one cause" theorem, generic
def iota [Zero A] (a : A) : CD A := ⟨a, 0⟩
def e2 [Zero A] [One A] : CD A := ⟨0, 1⟩

theorem iota_e2_comm_iff [CommRing A] [StarRing A] (a : A) :
    iota a * (e2 : CD A) = e2 * iota a ↔ a = star a := by
  constructor
  · intro h
    have hi := congrArg CD.im h
    simp only [iota, e2, mul_im, mul_zero, zero_mul, add_zero, zero_add,
      star_zero, one_mul] at hi
    exact hi
  · intro h
    ext
    · simp only [iota, e2, mul_re, mul_zero, zero_mul, add_zero, neg_zero,
        star_zero, mul_one]
    · simp only [iota, e2, mul_im, mul_zero, zero_mul, add_zero, zero_add,
        star_zero, one_mul]
      exact h

end CD
end Scratch3
