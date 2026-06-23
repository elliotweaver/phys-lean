import Phys.Foundation.IntegerTower
import Mathlib.Algebra.Ring.Defs
import Mathlib.Algebra.Field.Basic
import Mathlib.Tactic

namespace Phys.Foundation
namespace Z
-- assume the domain core is banked (from domain.lean); restate minimal needs:
theorem mk_eq_zero {a b : Re} : mk a b = 0 ↔ a = b := by
  rw [zero_def, mk_eq, add_zero, zero_add]
theorem one_ne_zero' : (1 : Z) ≠ (0 : Z) := by
  rw [one_def]; intro h; rw [mk_eq_zero] at h; exact Re.step_ne_void Re.void h
-- mul_ne_zero', add_comparable, sub_exists_of_ne, add_cancel_zero, mul_cross_ne assumed in domain.lean
theorem mul_ne_zero' {a b : Re} (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0 := by
  cases b with
  | void => exact (hb rfl).elim
  | step b' => cases a with
    | void => exact (ha rfl).elim
    | step a' => rw [Re.mul_step, Re.add_step]; exact Re.step_ne_void _
theorem add_comparable (a b : Re) : (∃ s, b = a + s) ∨ (∃ s, a = b + s) := by
  induction a with
  | void => left; exact ⟨b, by rw [Re.void_add]⟩
  | step a' ih => cases ih with
    | inl h => obtain ⟨s, hs⟩ := h; cases s with
      | void => right; exact ⟨Re.step Re.void, by rw [hs, Re.add_void, Re.add_step, Re.add_void]⟩
      | step s' => left; exact ⟨s', by rw [hs, Re.step_add, Re.add_step]⟩
    | inr h => obtain ⟨s, hs⟩ := h; right; exact ⟨Re.step s, by rw [hs, Re.add_step]⟩
theorem sub_exists_of_ne {a b : Re} (h : a ≠ b) :
    (∃ s, s ≠ 0 ∧ b = a + s) ∨ (∃ s, s ≠ 0 ∧ a = b + s) := by
  cases add_comparable a b with
  | inl hc => obtain ⟨s, hs⟩ := hc; left; refine ⟨s, ?_, hs⟩
              rintro rfl; rw [add_zero] at hs; exact h hs.symm
  | inr hc => obtain ⟨s, hs⟩ := hc; right; refine ⟨s, ?_, hs⟩
              rintro rfl; rw [add_zero] at hs; exact h hs
theorem add_cancel_zero {x y : Re} (h : x = x + y) : y = 0 := by
  have h2 : x + 0 = x + y := by rwa [add_zero]
  exact (Re.add_left_cancel h2).symm
theorem mul_cross_ne {a b c d : Re} (hab : a ≠ b) (hcd : c ≠ d) :
    a * c + b * d ≠ a * d + b * c := by
  rcases sub_exists_of_ne hab with ⟨s, hs, rfl⟩ | ⟨s, hs, rfl⟩
  · rcases sub_exists_of_ne hcd with ⟨t, ht, rfl⟩ | ⟨t, ht, rfl⟩
    · intro heq; have hr : a*c + (a+s)*(c+t) = (a*(c+t) + (a+s)*c) + s*t := by ring
      rw [heq] at hr; exact mul_ne_zero' hs ht (add_cancel_zero hr)
    · intro heq; have hr : a*d + (a+s)*(d+t) = (a*(d+t) + (a+s)*d) + s*t := by ring
      rw [← heq] at hr; exact mul_ne_zero' hs ht (add_cancel_zero hr)
  · rcases sub_exists_of_ne hcd with ⟨t, ht, rfl⟩ | ⟨t, ht, rfl⟩
    · intro heq; have hr : (b+s)*(c+t) + b*c = ((b+s)*c + b*(c+t)) + s*t := by ring
      rw [← heq] at hr; exact mul_ne_zero' hs ht (add_cancel_zero hr)
    · intro heq; have hr : (b+s)*(d+t) + b*d = ((b+s)*d + b*(d+t)) + s*t := by ring
      rw [heq] at hr; exact mul_ne_zero' hs ht (add_cancel_zero hr)
instance : Nontrivial Z := ⟨1, 0, one_ne_zero'⟩
instance : NoZeroDivisors Z where
  eq_zero_or_eq_zero_of_mul_eq_zero := by
    intro x y; refine Z.ind (fun a b => ?_) x; refine Z.ind (fun c d => ?_) y
    intro hxy; rw [mk_mul_mk, mk_eq_zero] at hxy
    by_contra hcon; push_neg at hcon; obtain ⟨hx, hy⟩ := hcon
    exact mul_cross_ne ((not_congr mk_eq_zero).mp hx) ((not_congr mk_eq_zero).mp hy) hxy
end Z

/-! ## ℚ = field of fractions of the derived ℤ. -/

/-- A NONZERO derived integer — a legal denominator. -/
def NZ : Type := {d : Z // d ≠ 0}

namespace NZ
/-- The unit denominator `1`. -/
def one : NZ := ⟨1, Z.one_ne_zero'⟩
/-- Product of denominators stays a legal denominator (no zero divisors). -/
def mul (q s : NZ) : NZ := ⟨q.1 * s.1, mul_ne_zero q.2 s.2⟩
@[simp] theorem mul_val (q s : NZ) : (mul q s).1 = q.1 * s.1 := rfl
@[simp] theorem one_val : (one : NZ).1 = 1 := rfl
end NZ

/-- THE FRACTION RELATION: `(p,q) ~ (r,s) ↔ p*s = r*q` (cross-multiplication). -/
def ratRel (x y : Z × NZ) : Prop := x.1 * y.2.1 = y.1 * x.2.1

theorem ratRel_refl (x : Z × NZ) : ratRel x x := rfl
theorem ratRel_symm {x y : Z × NZ} (h : ratRel x y) : ratRel y x := h.symm
/-- Transitivity USES domain cancellation (cancel the nonzero middle denominator). -/
theorem ratRel_trans {x y z : Z × NZ} (h1 : ratRel x y) (h2 : ratRel y z) : ratRel x z := by
  unfold ratRel at *
  apply mul_right_cancel₀ y.2.2
  calc x.1 * z.2.1 * y.2.1
      = (x.1 * y.2.1) * z.2.1 := by ring
    _ = (y.1 * x.2.1) * z.2.1 := by rw [h1]
    _ = (y.1 * z.2.1) * x.2.1 := by ring
    _ = (z.1 * y.2.1) * x.2.1 := by rw [h2]
    _ = z.1 * x.2.1 * y.2.1 := by ring

instance ratSetoid : Setoid (Z × NZ) where
  r := ratRel
  iseqv := ⟨ratRel_refl, ratRel_symm, ratRel_trans⟩

/-- ★ THE DERIVED RATIONALS: the field-of-fractions closure of the derived ℤ. -/
def Q : Type := Quotient ratSetoid

namespace Q

def mk (p : Z) (q : NZ) : Q := Quotient.mk ratSetoid (p, q)

theorem sound {p : Z} {q : NZ} {r : Z} {s : NZ} (h : p * s.val = r * q.val) :
    mk p q = mk r s := Quotient.sound h
theorem exact' {p : Z} {q : NZ} {r : Z} {s : NZ} (h : mk p q = mk r s) :
    p * s.val = r * q.val := Quotient.exact h

@[simp] theorem mk_eq {p : Z} {q : NZ} {r : Z} {s : NZ} :
    mk p q = mk r s ↔ p * s.val = r * q.val := ⟨exact', sound⟩

@[elab_as_elim] theorem ind {motive : Q → Prop} (h : ∀ p q, motive (mk p q)) :
    ∀ z, motive z := fun z => Quotient.ind (fun p => h p.1 p.2) z

instance : Zero Q := ⟨mk 0 NZ.one⟩
instance : One Q := ⟨mk 1 NZ.one⟩
theorem zero_def : (0 : Q) = mk 0 NZ.one := rfl
theorem one_def : (1 : Q) = mk 1 NZ.one := rfl

/-! ## Operations — each PROVED to descend (via `linear_combination` over `Z`). -/

def add : Q → Q → Q :=
  Quotient.lift₂ (fun x y => mk (x.1 * y.2.val + y.1 * x.2.val) (NZ.mul x.2 y.2))
    (by
      rintro ⟨p, q⟩ ⟨r, s⟩ ⟨p', q'⟩ ⟨r', s'⟩ (h1 : p * q'.val = p' * q.val)
        (h2 : r * s'.val = r' * s.val)
      show mk (p * s.val + r * q.val) (NZ.mul q s) = mk (p' * s'.val + r' * q'.val) (NZ.mul q' s')
      apply sound
      simp only [NZ.mul_val]
      linear_combination (s.val * s'.val) * h1 + (q.val * q'.val) * h2)

instance : Add Q := ⟨add⟩
@[simp] theorem mk_add_mk (p : Z) (q : NZ) (r : Z) (s : NZ) :
    mk p q + mk r s = mk (p * s.val + r * q.val) (NZ.mul q s) := rfl

def neg : Q → Q :=
  Quotient.lift (fun x => mk (-x.1) x.2)
    (by
      rintro ⟨p, q⟩ ⟨p', q'⟩ (h : p * q'.val = p' * q.val)
      show mk (-p) q = mk (-p') q'
      apply sound; linear_combination -h)

instance : Neg Q := ⟨neg⟩
@[simp] theorem neg_mk (p : Z) (q : NZ) : -mk p q = mk (-p) q := rfl

def mul : Q → Q → Q :=
  Quotient.lift₂ (fun x y => mk (x.1 * y.1) (NZ.mul x.2 y.2))
    (by
      rintro ⟨p, q⟩ ⟨r, s⟩ ⟨p', q'⟩ ⟨r', s'⟩ (h1 : p * q'.val = p' * q.val)
        (h2 : r * s'.val = r' * s.val)
      show mk (p * r) (NZ.mul q s) = mk (p' * r') (NZ.mul q' s')
      apply sound
      simp only [NZ.mul_val]
      linear_combination (r * s'.val) * h1 + (p' * q.val) * h2)

instance : Mul Q := ⟨mul⟩
@[simp] theorem mk_mul_mk (p : Z) (q : NZ) (r : Z) (s : NZ) :
    mk p q * mk r s = mk (p * r) (NZ.mul q s) := rfl

/-- ★ THE DERIVED RATIONALS CARRY A COMMUTATIVE RING. Every law reduces, after
    `ind` + the reduction lemmas, to a `Z`-ring identity discharged by `ring`. -/
instance commRing : CommRing Q where
  add := add
  add_assoc := by
    refine ind fun p q => ind fun r s => ind fun u v => ?_
    simp only [mk_add_mk]; apply sound; simp only [NZ.mul_val]; ring
  zero := mk 0 NZ.one
  zero_add := by
    refine ind fun p q => ?_
    show mk 0 NZ.one + mk p q = mk p q
    simp only [mk_add_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  add_zero := by
    refine ind fun p q => ?_
    show mk p q + mk 0 NZ.one = mk p q
    simp only [mk_add_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  add_comm := by
    refine ind fun p q => ind fun r s => ?_
    simp only [mk_add_mk]; apply sound; simp only [NZ.mul_val]; ring
  neg := neg
  mul := mul
  left_distrib := by
    refine ind fun p q => ind fun r s => ind fun u v => ?_
    show mk p q * (mk r s + mk u v) = mk p q * mk r s + mk p q * mk u v
    simp only [mk_add_mk, mk_mul_mk]; apply sound; simp only [NZ.mul_val]; ring
  right_distrib := by
    refine ind fun p q => ind fun r s => ind fun u v => ?_
    show (mk p q + mk r s) * mk u v = mk p q * mk u v + mk r s * mk u v
    simp only [mk_add_mk, mk_mul_mk]; apply sound; simp only [NZ.mul_val]; ring
  zero_mul := by
    refine ind fun p q => ?_
    show mk 0 NZ.one * mk p q = mk 0 NZ.one
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  mul_zero := by
    refine ind fun p q => ?_
    show mk p q * mk 0 NZ.one = mk 0 NZ.one
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  mul_assoc := by
    refine ind fun p q => ind fun r s => ind fun u v => ?_
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val]; ring
  one := mk 1 NZ.one
  one_mul := by
    refine ind fun p q => ?_
    show mk 1 NZ.one * mk p q = mk p q
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  mul_one := by
    refine ind fun p q => ?_
    show mk p q * mk 1 NZ.one = mk p q
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  neg_add_cancel := by
    refine ind fun p q => ?_
    show -mk p q + mk p q = mk 0 NZ.one
    simp only [neg_mk, mk_add_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  mul_comm := by
    refine ind fun p q => ind fun r s => ?_
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val]; ring
  nsmul := nsmulRec
  zsmul := zsmulRec

/-! ## The field structure: the multiplicative inverse is THE SWAP. -/

/-- `mk p q = 0 ↔ p = 0`. -/
theorem mk_eq_zero {p : Z} {q : NZ} : mk p q = 0 ↔ p = 0 := by
  rw [zero_def, mk_eq, NZ.one_val, mul_one, zero_mul]

/-- ★ THE FIELD: the derived rationals form a field. The multiplicative inverse of a
    nonzero fraction `p/q` is THE SWAP `q/p` — the fold's reflection realized on the
    multiplicative pairs (numerator ↔ denominator), the mirror of N8's additive swap. -/
theorem isField : IsField Q where
  exists_pair_ne := ⟨0, 1, by
    rw [zero_def, one_def, Ne, mk_eq, NZ.one_val, mul_one, mul_one]
    exact fun h => Z.one_ne_zero' h.symm⟩
  mul_comm := mul_comm
  mul_inv_cancel := by
    intro a ha
    refine Q.ind (motive := fun z => z ≠ 0 → ∃ b, z * b = 1) (fun p q hpq => ?_) a ha
    -- p/q ≠ 0 ⟹ p ≠ 0; the inverse is q/p (THE SWAP).
    have hp : p ≠ 0 := fun h => hpq (by rw [h]; exact mk_eq_zero.mpr rfl)
    refine ⟨mk q.val ⟨p, hp⟩, ?_⟩
    show mk p q * mk q.val ⟨p, hp⟩ = 1
    rw [mk_mul_mk, one_def]
    apply sound
    simp only [NZ.mul_val, NZ.one_val]
    ring

noncomputable instance field : Field Q := isField.toField

end Q
end Phys.Foundation
