import Phys.Foundation.RationalTower
import Mathlib.Algebra.Order.Ring.Defs
import Mathlib.Algebra.Order.Ring.Unbundled.Basic
import Mathlib.Tactic

namespace Phys.Foundation

/-! ## R1: order on Re (assume banked elsewhere — minimal copy for scratch). -/
namespace Re
theorem add_eq_zero {a b : Re} (h : a + b = 0) : a = 0 ∧ b = 0 := by
  cases b with
  | void => rw [add_void] at h; exact ⟨h, rfl⟩
  | step b' => rw [add_step] at h; exact absurd h (Re.step_ne_void _)
protected def le (a b : Re) : Prop := ∃ c, b = a + c
instance : LE Re := ⟨Re.le⟩
protected theorem le_refl (a : Re) : a ≤ a := ⟨0, (add_void a).symm⟩
protected theorem le_trans {a b c : Re} (hab : a ≤ b) (hbc : b ≤ c) : a ≤ c := by
  obtain ⟨x, hx⟩ := hab; obtain ⟨y, hy⟩ := hbc; exact ⟨x + y, by rw [hy, hx, Re.add_assoc]⟩
protected theorem le_antisymm {a b : Re} (hab : a ≤ b) (hba : b ≤ a) : a = b := by
  obtain ⟨x, hx⟩ := hab; obtain ⟨y, hy⟩ := hba
  have : a + (x + y) = a + 0 := by rw [← Re.add_assoc, ← hx, ← hy, add_zero]
  have hxy : x + y = 0 := Re.add_left_cancel this
  rw [hx, (add_eq_zero hxy).1, add_zero]
protected theorem le_total (a b : Re) : a ≤ b ∨ b ≤ a := by
  rcases add_comparable a b with ⟨s, hs⟩ | ⟨s, hs⟩
  · exact Or.inl ⟨s, hs⟩
  · exact Or.inr ⟨s, hs⟩
noncomputable instance linearOrder : LinearOrder Re where
  le := Re.le; le_refl := Re.le_refl; le_trans := fun _ _ _ => Re.le_trans
  le_antisymm := fun _ _ => Re.le_antisymm; le_total := Re.le_total
  toDecidableLE := Classical.decRel _
end Re

/-! ## R2: order on Z (minimal copy for scratch). -/
namespace Z
protected def le (x y : Z) : Prop := ∃ n : Re, y = x + ofRe n
instance : LE Z := ⟨Z.le⟩
protected theorem le_refl (x : Z) : x ≤ x := ⟨0, by rw [ofRe_zero, add_zero]⟩
protected theorem le_trans {x y z : Z} (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  obtain ⟨m, hm⟩ := hxy; obtain ⟨n, hn⟩ := hyz; exact ⟨m + n, by rw [hn, hm, ofRe_add]; ring⟩
protected theorem le_antisymm {x y : Z} (hxy : x ≤ y) (hyx : y ≤ x) : x = y := by
  obtain ⟨m, hm⟩ := hxy; obtain ⟨n, hn⟩ := hyx; rw [hm] at hn
  have hsum : ofRe m + ofRe n = (0 : Z) := by
    have h2 : x + (ofRe m + ofRe n) = x + 0 := by rw [add_zero, ← add_assoc]; exact hn.symm
    exact add_left_cancel h2
  have hmn : m + n = 0 := ofRe_injective (by rw [ofRe_add, hsum, ofRe_zero])
  rw [hm, (Re.add_eq_zero hmn).1, ofRe_zero, add_zero]
protected theorem le_total (x y : Z) : x ≤ y ∨ y ≤ x := by
  refine Z.ind (fun a b => ?_) x; refine Z.ind (fun c d => ?_) y
  rcases Re.add_comparable (a + d) (c + b) with ⟨s, hs⟩ | ⟨s, hs⟩
  · left; refine ⟨s, ?_⟩; rw [ofRe_def, mk_add_mk]; apply sound; rw [add_zero, hs]; ring
  · right; refine ⟨s, ?_⟩; rw [ofRe_def, mk_add_mk]; apply sound; rw [add_zero, hs]; ring
noncomputable instance linearOrder : LinearOrder Z where
  le := Z.le; le_refl := Z.le_refl; le_trans := fun _ _ _ => Z.le_trans
  le_antisymm := fun _ _ => Z.le_antisymm; le_total := Z.le_total
  toDecidableLE := Classical.decRel _
instance : IsOrderedAddMonoid Z where
  add_le_add_left := by rintro a b ⟨n, hn⟩ c; exact ⟨n, by rw [hn]; ring⟩
instance : ZeroLEOneClass Z := ⟨⟨1, by rw [ofRe_one, zero_add]⟩⟩
theorem mul_pos (a b : Z) (ha : 0 < a) (hb : 0 < b) : 0 < a * b := by
  obtain ⟨m, hm⟩ := le_of_lt ha; obtain ⟨n, hn⟩ := le_of_lt hb
  rw [zero_add] at hm hn
  have ham : m ≠ 0 := by rintro rfl; rw [ofRe_zero] at hm; exact (ne_of_lt ha) hm.symm
  have hbn : n ≠ 0 := by rintro rfl; rw [ofRe_zero] at hn; exact (ne_of_lt hb) hn.symm
  have hmn : m * n ≠ 0 := Re.mul_ne_zero' ham hbn
  refine lt_of_le_of_ne ⟨m * n, by rw [hm, hn, ofRe_mul, zero_add]⟩ ?_
  intro h; rw [hm, hn, ← ofRe_mul] at h
  exact hmn (ofRe_injective (by rw [← h, ofRe_zero]))
noncomputable instance isStrictOrderedRing : IsStrictOrderedRing Z := .of_mul_pos Z.mul_pos
end Z

/-! ## R3: order on the derived ℚ (`Q`) — the field-of-fractions order. -/
namespace Q

/-- A fraction is NONNEGATIVE iff numerator·denominator ≥ 0 in the derived ℤ.
    Well-defined on the quotient because Z is an ordered domain. -/
def Nonneg : Q → Prop :=
  Quotient.lift (fun x : Z × NZ => (0 : Z) ≤ x.1 * x.2.1)
    (by
      rintro ⟨p, q⟩ ⟨r, s⟩ (h : p * s.1 = r * q.1)
      -- 0 ≤ p*q ↔ 0 ≤ r*s, via multiplying by the positive squares s² and q².
      have hq2 : 0 < q.1 * q.1 := mul_self_pos.mpr q.2
      have hs2 : 0 < s.1 * s.1 := mul_self_pos.mpr s.2
      have key : (p * q.1) * (s.1 * s.1) = (r * s.1) * (q.1 * q.1) := by
        have : p * s.1 * (q.1 * s.1) = r * q.1 * (q.1 * s.1) := by rw [h]
        nlinarith [this]
      simp only [eq_iff_iff]
      constructor
      · intro hpq
        have h1 : 0 ≤ (p * q.1) * (s.1 * s.1) := mul_nonneg hpq (le_of_lt hs2)
        rw [key] at h1
        exact (mul_nonneg_iff_of_pos_right hq2).mp h1
      · intro hrs
        have h1 : 0 ≤ (r * s.1) * (q.1 * q.1) := mul_nonneg hrs (le_of_lt hq2)
        rw [← key] at h1
        exact (mul_nonneg_iff_of_pos_right hs2).mp h1)

theorem nonneg_mk {p : Z} {q : NZ} : Nonneg (mk p q) ↔ (0 : Z) ≤ p * q.1 := Iff.rfl

/-- Every fraction is comparable to zero in sign: nonneg or its negation is. -/
theorem nonneg_total (x : Q) : Nonneg x ∨ Nonneg (-x) := by
  refine Q.ind (fun p q => ?_) x
  rw [neg_mk, nonneg_mk, nonneg_mk]
  rcases le_total (0 : Z) (p * q.1) with h | h
  · exact Or.inl h
  · right; rw [neg_mul]; exact neg_nonneg.mpr h

/-- Nonneg is closed under addition. -/
theorem nonneg_add {x y : Q} (hx : Nonneg x) (hy : Nonneg y) : Nonneg (x + y) := by
  revert hx hy
  refine Q.ind (fun p q => ?_) x
  refine Q.ind (fun r s => ?_) y
  rw [mk_add_mk, nonneg_mk, nonneg_mk, nonneg_mk, NZ.mul_val]
  intro hp hr
  -- 0 ≤ (p*s + r*q)*(q*s);  expand = p*q*s² + r*s*q²
  have hq2 : 0 ≤ s.1 * s.1 := le_of_lt (mul_self_pos.mpr s.2)
  have hs2 : 0 ≤ q.1 * q.1 := le_of_lt (mul_self_pos.mpr q.2)
  have e1 : 0 ≤ (p * q.1) * (s.1 * s.1) := mul_nonneg hp hq2
  have e2 : 0 ≤ (r * s.1) * (q.1 * q.1) := mul_nonneg hr hs2
  nlinarith [e1, e2]

/-- Nonneg is closed under multiplication. -/
theorem nonneg_mul {x y : Q} (hx : Nonneg x) (hy : Nonneg y) : Nonneg (x * y) := by
  revert hx hy
  refine Q.ind (fun p q => ?_) x
  refine Q.ind (fun r s => ?_) y
  rw [mk_mul_mk, nonneg_mk, nonneg_mk, nonneg_mk, NZ.mul_val]
  intro hp hr
  -- 0 ≤ (p*r)*(q*s) = (p*q)*(r*s)
  have : 0 ≤ (p * q.1) * (r * s.1) := mul_nonneg hp hr
  nlinarith [this]

/-- A fraction and its negation both nonneg forces it to be zero. -/
theorem eq_zero_of_nonneg_neg {x : Q} (hx : Nonneg x) (hnx : Nonneg (-x)) : x = 0 := by
  revert hx hnx
  refine Q.ind (fun p q => ?_) x
  rw [neg_mk, nonneg_mk, nonneg_mk, neg_mul]
  intro hp hnp
  have hpq : p * q.1 = 0 := le_antisymm (neg_nonneg.mp hnp) hp
  -- p*q = 0, q ≠ 0 ⟹ p = 0 ⟹ mk p q = 0
  have hp0 : p = 0 := by
    rcases mul_eq_zero.mp hpq with h | h
    · exact h
    · exact absurd h q.2
  rw [hp0]; exact (mk_eq_zero).mpr rfl

/-! ### The order from Nonneg. -/

protected def le (x y : Q) : Prop := Nonneg (y - x)
instance : LE Q := ⟨Q.le⟩
theorem le_def {x y : Q} : x ≤ y ↔ Nonneg (y - x) := Iff.rfl

protected theorem le_refl (x : Q) : x ≤ x := by
  rw [le_def, sub_self]
  rw [show (0 : Q) = mk 0 NZ.one from rfl, nonneg_mk]
  simp

protected theorem le_trans {x y z : Q} (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  rw [le_def] at *
  have := nonneg_add hxy hyz
  rwa [show y - x + (z - y) = z - x from by ring] at this

protected theorem le_antisymm {x y : Q} (hxy : x ≤ y) (hyx : y ≤ x) : x = y := by
  rw [le_def] at hxy hyx
  have hneg : Nonneg (-(y - x)) := by rwa [neg_sub]
  have hyx0 : y - x = 0 := eq_zero_of_nonneg_neg hxy hneg
  exact (sub_eq_zero.mp hyx0).symm

protected theorem le_total (x y : Q) : x ≤ y ∨ y ≤ x := by
  rw [le_def, le_def]
  rcases nonneg_total (y - x) with h | h
  · exact Or.inl h
  · right; rwa [neg_sub] at h

noncomputable instance linearOrder : LinearOrder Q where
  le := Q.le
  le_refl := Q.le_refl
  le_trans := fun _ _ _ => Q.le_trans
  le_antisymm := fun _ _ => Q.le_antisymm
  le_total := Q.le_total
  toDecidableLE := Classical.decRel _

instance : IsOrderedAddMonoid Q where
  add_le_add_left := by
    intro a b hab c
    rw [Q.le_def] at hab ⊢
    rwa [show b + c - (a + c) = b - a from by ring]

instance : ZeroLEOneClass Q := by
  refine ⟨?_⟩
  rw [Q.le_def, sub_zero, one_def, nonneg_mk]
  simp

theorem mul_pos (a b : Q) (ha : 0 < a) (hb : 0 < b) : 0 < a * b := by
  have hna : Nonneg a := by have := le_of_lt ha; rw [Q.le_def, sub_zero] at this; exact this
  have hnb : Nonneg b := by have := le_of_lt hb; rw [Q.le_def, sub_zero] at this; exact this
  have hnab : Nonneg (a * b) := nonneg_mul hna hnb
  have hab0 : a * b ≠ 0 := mul_ne_zero (ne_of_gt ha) (ne_of_gt hb)
  have hle : (0 : Q) ≤ a * b := by rw [Q.le_def, sub_zero]; exact hnab
  exact lt_of_le_of_ne hle (Ne.symm hab0)

noncomputable instance isStrictOrderedRing : IsStrictOrderedRing Q := .of_mul_pos Q.mul_pos

example : (0 : Q) < 1 := zero_lt_one

end Q
end Phys.Foundation
