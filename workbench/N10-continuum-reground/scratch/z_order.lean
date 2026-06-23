import Phys.Foundation.RationalTower
import Mathlib.Algebra.Order.Ring.Defs
import Mathlib.Tactic

namespace Phys.Foundation

/-! ## R1: order on the derived ℕ (`Re`). -/
namespace Re

theorem add_eq_zero {a b : Re} (h : a + b = 0) : a = 0 ∧ b = 0 := by
  cases b with
  | void => rw [add_void] at h; exact ⟨h, rfl⟩
  | step b' => rw [add_step] at h; exact absurd h (Re.step_ne_void _)

protected def le (a b : Re) : Prop := ∃ c, b = a + c
instance : LE Re := ⟨Re.le⟩
theorem le_def {a b : Re} : a ≤ b ↔ ∃ c, b = a + c := Iff.rfl

protected theorem le_refl (a : Re) : a ≤ a := ⟨0, (add_void a).symm⟩
protected theorem le_trans {a b c : Re} (hab : a ≤ b) (hbc : b ≤ c) : a ≤ c := by
  obtain ⟨x, hx⟩ := hab; obtain ⟨y, hy⟩ := hbc
  exact ⟨x + y, by rw [hy, hx, Re.add_assoc]⟩
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
  le := Re.le
  le_refl := Re.le_refl
  le_trans := fun _ _ _ => Re.le_trans
  le_antisymm := fun _ _ => Re.le_antisymm
  le_total := Re.le_total
  toDecidableLE := Classical.decRel _

theorem zero_le (a : Re) : 0 ≤ a := ⟨a, (void_add a).symm⟩
theorem le_add_right (a b : Re) : a ≤ a + b := ⟨b, rfl⟩

end Re

/-! ## R2: order on the derived ℤ (`Z`) — differ by a count. -/
namespace Z

/-- `x ≤ y` iff `y` exceeds `x` by the image of a count. -/
protected def le (x y : Z) : Prop := ∃ n : Re, y = x + ofRe n
instance : LE Z := ⟨Z.le⟩
theorem le_def {x y : Z} : x ≤ y ↔ ∃ n : Re, y = x + ofRe n := Iff.rfl

protected theorem le_refl (x : Z) : x ≤ x := ⟨0, by rw [ofRe_zero, add_zero]⟩
protected theorem le_trans {x y z : Z} (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  obtain ⟨m, hm⟩ := hxy; obtain ⟨n, hn⟩ := hyz
  exact ⟨m + n, by rw [hn, hm, ofRe_add]; ring⟩
protected theorem le_antisymm {x y : Z} (hxy : x ≤ y) (hyx : y ≤ x) : x = y := by
  obtain ⟨m, hm⟩ := hxy; obtain ⟨n, hn⟩ := hyx
  -- x = x + ofRe m + ofRe n ⟹ ofRe (m+n) = 0 ⟹ m+n = 0 ⟹ m = 0
  rw [hm] at hn
  have hsum : ofRe m + ofRe n = (0 : Z) := by
    have h2 : x + (ofRe m + ofRe n) = x + 0 := by rw [add_zero, ← add_assoc]; exact hn.symm
    exact add_left_cancel h2
  have hmn : m + n = 0 := ofRe_injective (by rw [ofRe_add, hsum, ofRe_zero])
  rw [hm, (Re.add_eq_zero hmn).1, ofRe_zero, add_zero]
protected theorem le_total (x y : Z) : x ≤ y ∨ y ≤ x := by
  refine Z.ind (fun a b => ?_) x
  refine Z.ind (fun c d => ?_) y
  -- compare (c+b) vs (a+d) over Re
  rcases Re.add_comparable (a + d) (c + b) with ⟨s, hs⟩ | ⟨s, hs⟩
  · -- c+b = (a+d)+s ⟹ mk c d = mk a b + ofRe s
    left; refine ⟨s, ?_⟩
    rw [ofRe_def, mk_add_mk]
    apply sound
    rw [add_zero, hs]; ring
  · -- a+d = (c+b)+s ⟹ mk a b = mk c d + ofRe s
    right; refine ⟨s, ?_⟩
    rw [ofRe_def, mk_add_mk]
    apply sound
    rw [add_zero, hs]; ring

noncomputable instance linearOrder : LinearOrder Z where
  le := Z.le
  le_refl := Z.le_refl
  le_trans := fun _ _ _ => Z.le_trans
  le_antisymm := fun _ _ => Z.le_antisymm
  le_total := Z.le_total
  toDecidableLE := Classical.decRel _

instance : IsOrderedAddMonoid Z where
  add_le_add_left := by
    rintro a b ⟨n, hn⟩ c
    exact ⟨n, by rw [hn]; ring⟩

instance : ZeroLEOneClass Z := ⟨⟨1, by rw [ofRe_one, zero_add]⟩⟩

/-- mul_pos over Z, from `Re.mul_ne_zero'`. -/
theorem mul_pos (a b : Z) (ha : 0 < a) (hb : 0 < b) : 0 < a * b := by
  obtain ⟨m, hm⟩ := le_of_lt ha
  obtain ⟨n, hn⟩ := le_of_lt hb
  rw [zero_add] at hm hn
  have ham : m ≠ 0 := by rintro rfl; rw [ofRe_zero] at hm; exact (ne_of_lt ha) hm.symm
  have hbn : n ≠ 0 := by rintro rfl; rw [ofRe_zero] at hn; exact (ne_of_lt hb) hn.symm
  have hmn : m * n ≠ 0 := Re.mul_ne_zero' ham hbn
  refine lt_of_le_of_ne ⟨m * n, by rw [hm, hn, ofRe_mul, zero_add]⟩ ?_
  intro h
  rw [hm, hn, ← ofRe_mul] at h
  exact hmn (ofRe_injective (by rw [← h, ofRe_zero]))

noncomputable instance isStrictOrderedRing : IsStrictOrderedRing Z :=
  .of_mul_pos Z.mul_pos

example : (0 : Z) < 1 := zero_lt_one

end Z
end Phys.Foundation
