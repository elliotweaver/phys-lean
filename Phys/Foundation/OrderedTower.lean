/-
  Phys.Foundation.OrderedTower — THE NUMBER TOWER'S ORDER: ≤ ON THE DERIVED ℕ→ℤ→ℚ,
  DERIVED FROM COUNTING'S COMPARABILITY (the ℝ rung's foundation).
  ===========================================================================
  THE NUMBER TOWER (docs/STANDARD.md §3, docs/ROADMAP.md ⚠ STANDING DEPENDENCY GATE).
  The whole tower ℕ→ℤ→ℚ→ℝ must descend from the fold, never be imported from Mathlib
  as CONTENT. N7 (`Counting.lean`) derived ℕ = `Re`; N8 (`IntegerTower.lean`) derived
  ℤ = `Z`; N9 (`RationalTower.lean`) derived ℚ = `Q` as a `Field`. But the continuum
  (the ℝ rung — Dedekind cuts) needs the ground as a LINEARLY ORDERED FIELD: a total
  order `≤` compatible with `+` and `·`. The derived `Q` carried the FIELD operations
  but NO ORDER. THIS file supplies the missing ORDER, DERIVED from the fold's own
  counting — with NO `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to GET it,
  NO posited `≤`, NO Mathlib `Rat`/`Int` order as content. The order is CONSTRUCTED
  from `Re`'s comparability; the `LinearOrder` / `IsStrictOrderedRing` structures are
  PROVED.

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; §2 below) ──
  Counting goes ONE WAY (N7/N8): the re-entry tower `Re` can only `step` forward.
  That one-way-ness IS an order: `a ≤ b` exactly when `b` is `a` CONTINUED by some
  further count — `b = a + c` (banked `Re.add_comparable`: any two counts are
  comparable, one is the other continued). This is the primordial order, the direction
  of re-entry itself. It LIFTS up the tower exactly as the algebra did:
  • On the derived ℤ (`Z`): `x ≤ y` iff `y` exceeds `x` by the image of a count
    (`y = x + ofRe n`) — the signed counts inherit counting's direction, with the
    fold's reflection (negation = the swap) flipping it. `Z` becomes a strict ordered
    ring (`mul_pos` from counting's no-zero-divisors `Re.mul_ne_zero'`).
  • On the derived ℚ (`Q`): a fraction is NONNEGATIVE iff numerator·denominator ≥ 0 in
    the ordered ℤ — well-defined on the quotient BECAUSE `Z` is an ordered DOMAIN
    (squaring the denominator is positive). `Q` becomes a LINEARLY ORDERED FIELD: the
    derived rationals with their order, the exact structure the continuum is cut from.
  The order is not a new posit; it is the visible shape of the SAME one-way re-entry
  that generated the counts.

  ── WHAT THIS BANKS ──
    Re.add_eq_zero               — `a + b = 0 → a = 0 ∧ b = 0` (step is never void).
    Re.le, Re.linearOrder        — ★ the order on counting (`a ≤ b ↔ ∃ c, b = a + c`),
                                   a `LinearOrder` (totality = banked `add_comparable`).
    Re.zero_le, Re.le_add_right  — `0` is the bottom; `a ≤ a + b`.
    Z.le, Z.linearOrder          — ★ the order on the derived ℤ (differ by a count's
                                   image), a `LinearOrder`.
    Z.IsOrderedAddMonoid, ZeroLEOneClass, mul_pos
    Z.isStrictOrderedRing        — ★ the derived ℤ is a STRICT ORDERED RING (mul_pos from
                                   counting's no-zero-divisors).
    Q.Nonneg, Q.nonneg_mk        — ★ the sign predicate on fractions (num·den ≥ 0),
                                   well-defined because `Z` is an ordered domain.
    Q.nonneg_total/_add/_mul, Q.eq_zero_of_nonneg_neg
    Q.le, Q.linearOrder          — ★ the order on the derived ℚ, a `LinearOrder`.
    Q.IsOrderedAddMonoid, ZeroLEOneClass, mul_pos
    Q.isStrictOrderedRing        — ★★ THE DELIVERABLE: the derived ℚ is a STRICT ORDERED
                                   RING. With N9's `Q.field` + this + the `LinearOrder`,
                                   `Q` is a LINEARLY ORDERED FIELD (the v4.29.1 spelling
                                   `[Field] [LinearOrder] [IsStrictOrderedRing]`), the
                                   ground the continuum is cut from.

  ── WHAT IS OWED (childed onto the chain tail) ──
    Port the continuum work (N6, `Continuum.lean`/`CompletionContinuum.lean`, currently
    over the IMPORTED ℚ) onto THIS ordered derived ℚ: the `q²=2` obstruction over the
    derived `Q` (integer descent on the derived `Z` + `Re` parity), the cuts/gathers,
    the completeness theorem, the derived √2 as a new completion element. The
    ⚠ NUMBER-TOWER gate flips RESOLVED only when the continuum rests on the derived ℚ;
    this file supplies the ORDER that makes that port possible.

  ── CONTENT vs. METALANGUAGE (STANDARD §3) ──
  This derives the CONTENT order: the OBJECT every result here is ABOUT is the derived
  `Re`/`Z`/`Q`, and the `≤` is built from `Re.add_comparable` (banked, from counting).
  Mathlib's `LinearOrder`/`IsStrictOrderedRing`/`IsOrderedAddMonoid`/`ZeroLEOneClass`
  typeclasses, `IsStrictOrderedRing.of_mul_pos`, and the `nlinarith`/`ring`/`omega`
  tactics are MACHINERY (the metalanguage) operating on the DERIVED objects — exactly
  what STANDARD §3 permits. NO Mathlib `Rat`/`Int`/`Nat` ORDER as content.

  §2. PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "fold / re-entry / counting /
  reflection / direction": what remains is that the free commutative monoid on one
  generator carries the algebraic (divisibility/difference) order, its Grothendieck
  group completion is a strict ordered ring, and its field of fractions is a linearly
  ordered field whose order extends the difference order. No theorem STATEMENT needs a
  trunk or physics word to be true. The names are read OUT of the math.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  and — the gate's whole point — NO Mathlib number-system order as content.
-/
import Phys.Foundation.RationalTower
import Mathlib.Algebra.Order.Ring.Defs
import Mathlib.Algebra.Order.Ring.Unbundled.Basic
import Mathlib.Tactic

namespace Phys.Foundation

/-! ## R1: the order on the derived ℕ (`Re`) — counting's one-way comparability. -/

namespace Re

/-- `a + b = 0` over `Re` forces both summands to vanish: `step` is never the void
    (N7). The counting monoid has no nontrivial way to sum to nothing. -/
theorem add_eq_zero {a b : Re} (h : a + b = 0) : a = 0 ∧ b = 0 := by
  cases b with
  | void => rw [add_void] at h; exact ⟨h, rfl⟩
  | step b' => rw [add_step] at h; exact absurd h (Re.step_ne_void _)

/-- ★ THE ORDER ON COUNTING: `a ≤ b` iff `b` is `a` CONTINUED by some further count.
    This is the direction of re-entry itself, made into a relation. -/
protected def le (a b : Re) : Prop := ∃ c, b = a + c

instance : LE Re := ⟨Re.le⟩

theorem le_def {a b : Re} : a ≤ b ↔ ∃ c, b = a + c := Iff.rfl

protected theorem le_refl (a : Re) : a ≤ a := ⟨0, (add_void a).symm⟩

protected theorem le_trans {a b c : Re} (hab : a ≤ b) (hbc : b ≤ c) : a ≤ c := by
  obtain ⟨x, hx⟩ := hab
  obtain ⟨y, hy⟩ := hbc
  exact ⟨x + y, by rw [hy, hx, Re.add_assoc]⟩

protected theorem le_antisymm {a b : Re} (hab : a ≤ b) (hba : b ≤ a) : a = b := by
  obtain ⟨x, hx⟩ := hab
  obtain ⟨y, hy⟩ := hba
  have : a + (x + y) = a + 0 := by rw [← Re.add_assoc, ← hx, ← hy, add_zero]
  have hxy : x + y = 0 := Re.add_left_cancel this
  rw [hx, (add_eq_zero hxy).1, add_zero]

/-- TOTALITY = the banked comparability (`add_comparable`): any two counts compare. -/
protected theorem le_total (a b : Re) : a ≤ b ∨ b ≤ a := by
  rcases add_comparable a b with ⟨s, hs⟩ | ⟨s, hs⟩
  · exact Or.inl ⟨s, hs⟩
  · exact Or.inr ⟨s, hs⟩

/-- ★ THE DERIVED ℕ IS LINEARLY ORDERED — order = the direction of re-entry,
    totality = counting's banked comparability. -/
noncomputable instance linearOrder : LinearOrder Re where
  le := Re.le
  le_refl := Re.le_refl
  le_trans := fun _ _ _ => Re.le_trans
  le_antisymm := fun _ _ => Re.le_antisymm
  le_total := Re.le_total
  toDecidableLE := Classical.decRel _

/-- The void `0` is the bottom of counting. -/
theorem zero_le (a : Re) : 0 ≤ a := ⟨a, (void_add a).symm⟩

/-- Continuing a count never decreases it. -/
theorem le_add_right (a b : Re) : a ≤ a + b := ⟨b, rfl⟩

end Re

/-! ## R2: the order on the derived ℤ (`Z`) — signed counts inherit the direction. -/

namespace Z

/-- ★ THE ORDER ON THE DERIVED ℤ: `x ≤ y` iff `y` exceeds `x` by the image of a count.
    The signed counts inherit counting's one-way direction; the fold's reflection
    (negation = the swap, N8) flips it. -/
protected def le (x y : Z) : Prop := ∃ n : Re, y = x + ofRe n

instance : LE Z := ⟨Z.le⟩

theorem le_def {x y : Z} : x ≤ y ↔ ∃ n : Re, y = x + ofRe n := Iff.rfl

protected theorem le_refl (x : Z) : x ≤ x := ⟨0, by rw [ofRe_zero, add_zero]⟩

protected theorem le_trans {x y z : Z} (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  obtain ⟨m, hm⟩ := hxy
  obtain ⟨n, hn⟩ := hyz
  exact ⟨m + n, by rw [hn, hm, ofRe_add]; ring⟩

protected theorem le_antisymm {x y : Z} (hxy : x ≤ y) (hyx : y ≤ x) : x = y := by
  obtain ⟨m, hm⟩ := hxy
  obtain ⟨n, hn⟩ := hyx
  rw [hm] at hn
  have hsum : ofRe m + ofRe n = (0 : Z) := by
    have h2 : x + (ofRe m + ofRe n) = x + 0 := by rw [add_zero, ← add_assoc]; exact hn.symm
    exact add_left_cancel h2
  have hmn : m + n = 0 := ofRe_injective (by rw [ofRe_add, hsum, ofRe_zero])
  rw [hm, (Re.add_eq_zero hmn).1, ofRe_zero, add_zero]

/-- TOTALITY: compare the cross-sums of the two signed counts over `Re`. -/
protected theorem le_total (x y : Z) : x ≤ y ∨ y ≤ x := by
  refine Z.ind (fun a b => ?_) x
  refine Z.ind (fun c d => ?_) y
  rcases Re.add_comparable (a + d) (c + b) with ⟨s, hs⟩ | ⟨s, hs⟩
  · left; refine ⟨s, ?_⟩
    rw [ofRe_def, mk_add_mk]; apply sound; rw [add_zero, hs]; ring
  · right; refine ⟨s, ?_⟩
    rw [ofRe_def, mk_add_mk]; apply sound; rw [add_zero, hs]; ring

/-- ★ THE DERIVED ℤ IS LINEARLY ORDERED. -/
noncomputable instance linearOrder : LinearOrder Z where
  le := Z.le
  le_refl := Z.le_refl
  le_trans := fun _ _ _ => Z.le_trans
  le_antisymm := fun _ _ => Z.le_antisymm
  le_total := Z.le_total
  toDecidableLE := Classical.decRel _

/-- The order is translation-invariant (compatible with `+`). -/
instance : IsOrderedAddMonoid Z where
  add_le_add_left := by
    rintro a b ⟨n, hn⟩ c
    exact ⟨n, by rw [hn]; ring⟩

instance : ZeroLEOneClass Z := ⟨⟨1, by rw [ofRe_one, zero_add]⟩⟩

/-- ★ `mul_pos` over the derived ℤ, traced to counting's NO-ZERO-DIVISORS
    (`Re.mul_ne_zero'`): the product of two positive signed counts is positive. -/
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

/-- ★ THE DERIVED ℤ IS A STRICT ORDERED RING. -/
noncomputable instance isStrictOrderedRing : IsStrictOrderedRing Z :=
  .of_mul_pos Z.mul_pos

end Z

/-! ## R3: the order on the derived ℚ (`Q`) — the field-of-fractions order. -/

namespace Q

/-- ★ THE SIGN PREDICATE: a fraction is NONNEGATIVE iff numerator·denominator ≥ 0 in
    the ordered derived ℤ. Well-defined on the quotient EXACTLY because `Z` is an
    ordered DOMAIN: multiplying through by a denominator-square (which is positive,
    `mul_self_pos`) preserves the inequality, and cancellation by the positive square
    transfers it across representatives. -/
def Nonneg : Q → Prop :=
  Quotient.lift (fun x : Z × NZ => (0 : Z) ≤ x.1 * x.2.1)
    (by
      rintro ⟨p, q⟩ ⟨r, s⟩ (h : p * s.1 = r * q.1)
      have hq2 : 0 < q.1 * q.1 := mul_self_pos.mpr q.2
      have hs2 : 0 < s.1 * s.1 := mul_self_pos.mpr s.2
      have key : (p * q.1) * (s.1 * s.1) = (r * s.1) * (q.1 * q.1) := by
        have hcross : p * s.1 * (q.1 * s.1) = r * q.1 * (q.1 * s.1) := by rw [h]
        nlinarith [hcross]
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

@[simp] theorem nonneg_mk {p : Z} {q : NZ} : Nonneg (mk p q) ↔ (0 : Z) ≤ p * q.1 := Iff.rfl

/-- A fraction is comparable to zero in sign: it or its negation is nonnegative
    (counting's totality lifted to the fraction's numerator·denominator). -/
theorem nonneg_total (x : Q) : Nonneg x ∨ Nonneg (-x) := by
  refine Q.ind (fun p q => ?_) x
  rw [neg_mk, nonneg_mk, nonneg_mk]
  rcases le_total (0 : Z) (p * q.1) with h | h
  · exact Or.inl h
  · right; rw [neg_mul]; exact neg_nonneg.mpr h

/-- Nonnegativity is closed under addition (the sum of two nonnegative fractions). -/
theorem nonneg_add {x y : Q} (hx : Nonneg x) (hy : Nonneg y) : Nonneg (x + y) := by
  revert hx hy
  refine Q.ind (fun p q => ?_) x
  refine Q.ind (fun r s => ?_) y
  rw [mk_add_mk, nonneg_mk, nonneg_mk, nonneg_mk, NZ.mul_val]
  intro hp hr
  have hq2 : 0 ≤ s.1 * s.1 := le_of_lt (mul_self_pos.mpr s.2)
  have hs2 : 0 ≤ q.1 * q.1 := le_of_lt (mul_self_pos.mpr q.2)
  have e1 : 0 ≤ (p * q.1) * (s.1 * s.1) := mul_nonneg hp hq2
  have e2 : 0 ≤ (r * s.1) * (q.1 * q.1) := mul_nonneg hr hs2
  nlinarith [e1, e2]

/-- Nonnegativity is closed under multiplication. -/
theorem nonneg_mul {x y : Q} (hx : Nonneg x) (hy : Nonneg y) : Nonneg (x * y) := by
  revert hx hy
  refine Q.ind (fun p q => ?_) x
  refine Q.ind (fun r s => ?_) y
  rw [mk_mul_mk, nonneg_mk, nonneg_mk, nonneg_mk, NZ.mul_val]
  intro hp hr
  have hpqrs : 0 ≤ (p * q.1) * (r * s.1) := mul_nonneg hp hr
  nlinarith [hpqrs]

/-- A fraction nonnegative whose negation is also nonnegative is zero (antisymmetry
    at zero). -/
theorem eq_zero_of_nonneg_neg {x : Q} (hx : Nonneg x) (hnx : Nonneg (-x)) : x = 0 := by
  revert hx hnx
  refine Q.ind (fun p q => ?_) x
  rw [neg_mk, nonneg_mk, nonneg_mk, neg_mul]
  intro hp hnp
  have hpq : p * q.1 = 0 := le_antisymm (neg_nonneg.mp hnp) hp
  have hp0 : p = 0 := by
    rcases mul_eq_zero.mp hpq with h | h
    · exact h
    · exact absurd h q.2
  rw [hp0]; exact (mk_eq_zero).mpr rfl

/-- ★ THE ORDER ON THE DERIVED ℚ: `x ≤ y` iff the difference `y - x` is nonnegative. -/
protected def le (x y : Q) : Prop := Nonneg (y - x)

instance : LE Q := ⟨Q.le⟩

theorem le_def {x y : Q} : x ≤ y ↔ Nonneg (y - x) := Iff.rfl

protected theorem le_refl (x : Q) : x ≤ x := by
  rw [le_def, sub_self, show (0 : Q) = mk 0 NZ.one from rfl, nonneg_mk]; simp

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

/-- ★ THE DERIVED ℚ IS LINEARLY ORDERED. -/
noncomputable instance linearOrder : LinearOrder Q where
  le := Q.le
  le_refl := Q.le_refl
  le_trans := fun _ _ _ => Q.le_trans
  le_antisymm := fun _ _ => Q.le_antisymm
  le_total := Q.le_total
  toDecidableLE := Classical.decRel _

/-- The order is translation-invariant. -/
instance : IsOrderedAddMonoid Q where
  add_le_add_left := by
    intro a b hab c
    rw [Q.le_def] at hab ⊢
    rwa [show b + c - (a + c) = b - a from by ring]

instance : ZeroLEOneClass Q := by
  refine ⟨?_⟩
  rw [Q.le_def, sub_zero, one_def, nonneg_mk]; simp

/-- ★ `mul_pos` over the derived ℚ (the product of two positive fractions is positive). -/
theorem mul_pos (a b : Q) (ha : 0 < a) (hb : 0 < b) : 0 < a * b := by
  have hna : Nonneg a := by have := le_of_lt ha; rw [Q.le_def, sub_zero] at this; exact this
  have hnb : Nonneg b := by have := le_of_lt hb; rw [Q.le_def, sub_zero] at this; exact this
  have hnab : Nonneg (a * b) := nonneg_mul hna hnb
  have hab0 : a * b ≠ 0 := mul_ne_zero (ne_of_gt ha) (ne_of_gt hb)
  have hle : (0 : Q) ≤ a * b := by rw [Q.le_def, sub_zero]; exact hnab
  exact lt_of_le_of_ne hle (Ne.symm hab0)

/-- ★★ THE DELIVERABLE — THE DERIVED ℚ IS A STRICT ORDERED RING. Combined with N9's
    `Q.field` and the `LinearOrder Q` above, the derived rationals are a LINEARLY
    ORDERED FIELD (the v4.29.1 spelling `[Field Q] [LinearOrder Q]
    [IsStrictOrderedRing Q]`) — the ground the continuum (the ℝ rung) is cut from,
    with its order DERIVED from the fold's counting, never posited or imported. -/
noncomputable instance isStrictOrderedRing : IsStrictOrderedRing Q :=
  .of_mul_pos Q.mul_pos

/-- Non-vacuity: the order is the NON-DEGENERATE field order — `0 < 1` in the derived ℚ. -/
theorem zero_lt_one' : (0 : Q) < 1 := zero_lt_one

end Q
end Phys.Foundation
