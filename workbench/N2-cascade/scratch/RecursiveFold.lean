import Mathlib.Algebra.Order.Ring.Defs
import Mathlib.Algebra.Ring.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

/-! Scratch: N2 rung 1 — the forced complex unit on the double of the ordered line. -/

namespace Scratch

variable {R : Type*}

/-- The double: the minimal 2-dimensional carrier where a square root of the fold lives. -/
structure Dbl (R : Type*) where
  re : R
  im : R

namespace Dbl

@[ext] theorem ext : ∀ {z w : Dbl R}, z.re = w.re → z.im = w.im → z = w
  | ⟨_,_⟩, ⟨_,_⟩, rfl, rfl => rfl

variable [CommRing R]

instance : Zero (Dbl R) := ⟨⟨0,0⟩⟩
instance : One (Dbl R) := ⟨⟨1,0⟩⟩
instance : Add (Dbl R) := ⟨fun z w => ⟨z.re+w.re, z.im+w.im⟩⟩
instance : Neg (Dbl R) := ⟨fun z => ⟨-z.re, -z.im⟩⟩
instance : SMul R (Dbl R) := ⟨fun r z => ⟨r*z.re, r*z.im⟩⟩
/-- The Cayley–Dickson product on the double. -/
instance : Mul (Dbl R) := ⟨fun z w => ⟨z.re*w.re - z.im*w.im, z.re*w.im + z.im*w.re⟩⟩

@[simp] theorem zero_re : (0 : Dbl R).re = 0 := rfl
@[simp] theorem zero_im : (0 : Dbl R).im = 0 := rfl
@[simp] theorem one_re : (1 : Dbl R).re = 1 := rfl
@[simp] theorem one_im : (1 : Dbl R).im = 0 := rfl
@[simp] theorem add_re (z w : Dbl R) : (z+w).re = z.re+w.re := rfl
@[simp] theorem add_im (z w : Dbl R) : (z+w).im = z.im+w.im := rfl
@[simp] theorem neg_re (z : Dbl R) : (-z).re = -z.re := rfl
@[simp] theorem neg_im (z : Dbl R) : (-z).im = -z.im := rfl
@[simp] theorem smul_re (r : R) (z : Dbl R) : (r • z).re = r*z.re := rfl
@[simp] theorem smul_im (r : R) (z : Dbl R) : (r • z).im = r*z.im := rfl
@[simp] theorem mul_re (z w : Dbl R) : (z*w).re = z.re*w.re - z.im*w.im := rfl
@[simp] theorem mul_im (z w : Dbl R) : (z*w).im = z.re*w.im + z.im*w.re := rfl

instance : CommRing (Dbl R) where
  add_assoc a b c := by ext <;> simp <;> ring
  zero_add a := by ext <;> simp
  add_zero a := by ext <;> simp
  add_comm a b := by ext <;> simp <;> ring
  left_distrib a b c := by ext <;> simp <;> ring
  right_distrib a b c := by ext <;> simp <;> ring
  zero_mul a := by ext <;> simp
  mul_zero a := by ext <;> simp
  mul_assoc a b c := by ext <;> simp <;> ring
  one_mul a := by ext <;> simp
  mul_one a := by ext <;> simp
  mul_comm a b := by ext <;> simp <;> ring
  neg_add_cancel a := by ext <;> simp
  nsmul := nsmulRec
  zsmul := zsmulRec

/-- The square root of the fold on the double: `J = (0,1)`, the quarter-turn. -/
def J : Dbl R := ⟨0, 1⟩

/-- ★ THE COMPLEX UNIT, DERIVED: `J * J = -1`. -/
theorem J_mul_J : (J : Dbl R) * J = -1 := by ext <;> simp [J]

/-- Basis decomposition: every element is `re•1 + im•J`. -/
theorem decomp (z : Dbl R) : z = z.re • (1 : Dbl R) + z.im • J := by ext <;> simp [J]

/-- The line embeds as the `im = 0` slice. -/
def ι (a : R) : Dbl R := ⟨a, 0⟩

@[simp] theorem ι_re (a : R) : (ι a : Dbl R).re = a := rfl
@[simp] theorem ι_im (a : R) : (ι a : Dbl R).im = 0 := rfl

theorem ι_injective : Function.Injective (ι : R → Dbl R) := by
  intro a b h; have h2 := congrArg Dbl.re h; simpa using h2

theorem J_not_scalar [Nontrivial R] : ∀ a : R, (J : Dbl R) ≠ ι a := by
  intro a h
  have h2 : (1 : R) = 0 := by have := congrArg Dbl.im h; simpa [J] using this
  exact one_ne_zero h2

/-- ★ THE PRODUCT IS FORCED. A binary operation on the double that is R-bilinear, unital,
    and sends `J*J ↦ -1` is UNIQUELY the Cayley–Dickson product. The product is not chosen;
    `J² = -1` plus bilinearity determines it. -/
structure IsAdmissible (m : Dbl R → Dbl R → Dbl R) : Prop where
  unit_left  : ∀ z, m 1 z = z
  unit_right : ∀ z, m z 1 = z
  add_left   : ∀ x y z, m (x + y) z = m x z + m y z
  add_right  : ∀ x y z, m x (y + z) = m x y + m x z
  smul_left  : ∀ (a : R) x z, m (a • x) z = a • m x z
  smul_right : ∀ (a : R) x z, m x (a • z) = a • m x z
  J_sq       : m J J = -1

theorem mul_forced {m : Dbl R → Dbl R → Dbl R} (h : IsAdmissible m) (z w : Dbl R) :
    m z w = z * w := by
  have e11 : m 1 1 = 1 := h.unit_left 1
  have e1J : m 1 J = J := h.unit_left J
  have eJ1 : m J 1 = J := h.unit_right J
  have eJJ : m J J = -1 := h.J_sq
  conv_lhs => rw [decomp z, decomp w]
  rw [h.add_left, h.smul_left, h.smul_left,
      h.add_right, h.add_right, h.smul_right, h.smul_right, h.smul_right, h.smul_right,
      e11, e1J, eJ1, eJJ]
  -- now everything is in terms of • , 1 , J on the RHS basis values
  ext <;> simp [J] <;> ring

end Dbl

/-- THE OBSTRUCTION: positivity forbids the scalar square root of the fold on the line. -/
theorem sqrt_fold_not_on_line {R : Type*} [CommRing R] [LinearOrder R] [IsStrictOrderedRing R]
    (j : R) : j * j ≠ -1 := by
  intro h
  have hpos : (0:R) ≤ j * j := mul_self_nonneg j
  rw [h] at hpos
  have hle : (1:R) ≤ 0 := neg_nonneg.mp hpos
  exact absurd (lt_of_lt_of_le zero_lt_one hle) (lt_irrefl 0)

/-- TIGHTNESS: drop order and the square root of the fold DOES live on the line (`ZMod 5`). -/
theorem sqrt_fold_on_unordered_line : ∃ j : ZMod 5, j * j = -1 := ⟨2, by decide⟩

/-- Non-vacuity over `ℚ`. -/
theorem obstruction_nonvacuous : ∀ j : ℚ, j * j ≠ -1 := sqrt_fold_not_on_line

end Scratch

#print axioms Scratch.Dbl.J_mul_J
#print axioms Scratch.Dbl.mul_forced
#print axioms Scratch.sqrt_fold_not_on_line
#print axioms Scratch.Dbl.J_not_scalar
#print axioms Scratch.sqrt_fold_on_unordered_line
