/-
  Phys.Foundation.DerivedSqrtTwo — THE GROUND CANNOT SOLVE THE SQUARE, OVER THE
  DERIVED ℚ (the analytic obstruction that forces the continuum, re-grounded).
  ===========================================================================
  N6-pre's continuum work (`Continuum.lean`) proved, over Mathlib's IMPORTED ℚ, that
  the ground cannot solve `x² = 2` (`no_rat_sq_two`) — the analytic-order analogue of
  N2's `sqrt_fold_not_on_line` (the ordered ground cannot solve a square the structure
  demands). That proof used `Rat.den_pow` / `Rat.num_pow` — Mathlib's `Rat` internals,
  which the DERIVED ℚ (`Phys.Foundation.Q`, N9) does not carry. This file RE-GROUNDS
  that obstruction onto the derived ℚ, with NO `import Mathlib.Data.{Nat,Int,Rat,Real}`
  used to GET it, NO posited ℝ.

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; §2 below) ──
  The obstruction is the SAME shape at every level of the derived tower: counting
  (`Re`) is built from the fold's re-entry, and re-entry forces PARITY (an even count
  never equals an odd count — banked `Re.add_self_ne_step_add_self`, the engine of
  N9's `1/2 ∉ ℤ`). That parity drives an INFINITE DESCENT: a count solving `a² = 2b²`
  would force `a` even, then `b` even, then a strictly smaller solution — but counting
  is well-founded (re-entry has a least element, the void), so no nontrivial solution
  exists. The descent is run as a BOUNDED induction on the larger count (NO well-founded
  recursion, NO Mathlib `Rat.den`): every level of the tower lifts the obstruction by
  the ring homs already banked (`Re ↪ Z ↪ Q`), the sign squared away.

  ── WHAT THIS BANKS ──
    Re.even_or_odd            — counting's parity (every count is even or odd).
    Re.sq_lt_sq / lt_of_sq_lt_sq — squaring is strictly monotone on counting.
    Re.lt_succ_iff_le         — nothing strictly between `n` and `step n`.
    Re.no_sq_two_bounded      — ★ THE DESCENT: no count `a ≤ n` solves `a² = 2b²`
                                (b ≠ 0), by bounded induction on the bound + parity.
    Re.no_sq_two              — ★ the count core of √2's irrationality.
    Z.eq_ofRe_or_neg          — every derived integer is ± a count's image (sign).
    Z.no_sq_two_Z             — ★ no derived INTEGER pair solves `x² = 2y²` (y ≠ 0),
                                lifted from counting by squaring away the sign.
    Q.two_eq_ofZ              — `(2 : Q) = ofZ 2`.
    Q.no_q_sq_two             — ★★ THE OBSTRUCTION OVER THE DERIVED ℚ: no derived
                                rational squares to `2`. The exact analytic gap N6's
                                continuum is built to fill, now over the derived ground.

  ── CONTENT vs. METALANGUAGE (STANDARD §3) ──
  Every object here is the DERIVED `Re`/`Z`/`Q`; the order is the DERIVED order
  (`OrderedTower`, itself from `Re` comparability). `ring`/`omega`/`induction` are
  MACHINERY on those derived objects. NO Mathlib number-system content import.

  §2. PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "fold / re-entry / counting /
  parity": what remains is that the free commutative monoid on one generator, its
  Grothendieck completion, and its field of fractions admit no nontrivial solution to
  `x² = 2y²` — the irrationality of √2 over the field of fractions, by infinite descent.
  No theorem STATEMENT needs a trunk or physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system import as content.
-/
import Phys.Foundation.OrderedTower
import Mathlib.Tactic

namespace Phys.Foundation

/-! ## The descent over counting (`Re`). -/

namespace Re

theorem step_eq_add_one (x : Re) : step x = x + 1 := by
  show step x = x + step void
  rw [add_step, add_void]

theorem two_eq : (2 : Re) = step (step 0) := by
  rw [show (2:Re) = 1 + 1 from (one_add_one_eq_two).symm]
  show step 0 + step 0 = step (step 0)
  rw [add_step, add_zero]

theorem two_ne_zero : (2 : Re) ≠ 0 := by
  rw [two_eq]; exact step_ne_void _

/-- Counting's PARITY: every count is even or odd. -/
theorem even_or_odd (a : Re) : (∃ c, a = 2 * c) ∨ (∃ c, a = 2 * c + 1) := by
  induction a with
  | void => exact Or.inl ⟨void, rfl⟩
  | step a' ih =>
    rcases ih with ⟨c, hc⟩ | ⟨c, hc⟩
    · right; exact ⟨c, by rw [step_eq_add_one, hc]⟩
    · left; refine ⟨c + 1, ?_⟩
      rw [step_eq_add_one, hc]; ring

theorem lt_add_of_ne {a c : Re} (hc : c ≠ 0) : a < a + c := by
  refine lt_of_le_of_ne ⟨c, rfl⟩ ?_
  intro h
  have : a + 0 = a + c := by rw [add_zero]; exact h
  exact hc (Re.add_left_cancel this).symm

theorem pos_iff_ne_zero {a : Re} : 0 < a ↔ a ≠ 0 := by
  constructor
  · intro h; exact (ne_of_lt h).symm
  · intro h
    rcases lt_or_eq_of_le (zero_le a) with h' | h'
    · exact h'
    · exact absurd h'.symm h

theorem mul_pos_of_ne {a b : Re} (ha : a ≠ 0) (hb : b ≠ 0) : 0 < a * b :=
  pos_iff_ne_zero.mpr (mul_ne_zero' ha hb)

/-- `a * b = 0 → a = 0 ∨ b = 0` over counting (contrapositive of `mul_ne_zero'`). -/
theorem mul_eq_zero' {a b : Re} (h : a * b = 0) : a = 0 ∨ b = 0 := by
  by_contra hc
  rw [not_or] at hc
  exact mul_ne_zero' hc.1 hc.2 h

/-- `x + x = y + y → x = y` (cancel the doubling). -/
theorem add_self_cancel {x y : Re} (h : x + x = y + y) : x = y := by
  rcases add_comparable x y with ⟨s, hs⟩ | ⟨s, hs⟩
  · rw [hs] at h
    have key : x + x + (s + s) = x + x + 0 := by
      rw [add_zero]
      calc x + x + (s + s) = (x + s) + (x + s) := by ring
        _ = x + x := h.symm
    have hss : s + s = 0 := Re.add_left_cancel key
    rw [hs, (add_eq_zero hss).1, add_zero]
  · rw [hs] at h
    have key : y + y + (s + s) = y + y + 0 := by
      rw [add_zero]
      calc y + y + (s + s) = (y + s) + (y + s) := by ring
        _ = y + y := h
    have hss : s + s = 0 := Re.add_left_cancel key
    rw [hs, (add_eq_zero hss).1, add_zero]

/-- `2*x = 2*y → x = y`. -/
theorem two_mul_cancel {x y : Re} (h : 2 * x = 2 * y) : x = y := by
  apply add_self_cancel
  have e1 : (2:Re) * x = x + x := by ring
  have e2 : (2:Re) * y = y + y := by ring
  rw [e1, e2] at h; exact h

/-- Squaring is strictly monotone on counting. -/
theorem sq_lt_sq {a b : Re} (h : b < a) : b * b < a * a := by
  obtain ⟨c, hc⟩ := le_of_lt h
  have hc0 : c ≠ 0 := by
    rintro rfl; rw [add_zero] at hc; exact (ne_of_lt h) hc.symm
  rw [hc]
  have hexp : (b + c) * (b + c) = (b * b) + (2 * (b * c) + c * c) := by ring
  rw [hexp]
  have hpos : 2 * (b * c) + c * c ≠ 0 := by
    have hcc : c * c ≠ 0 := mul_ne_zero' hc0 hc0
    intro hz; exact hcc (add_eq_zero hz).2
  exact lt_add_of_ne hpos

theorem lt_of_sq_lt_sq {a b : Re} (h : b * b < a * a) : b < a := by
  rcases lt_trichotomy b a with hlt | heq | hgt
  · exact hlt
  · rw [heq] at h; exact absurd h (lt_irrefl _)
  · exact absurd (sq_lt_sq hgt) (not_lt.mpr (le_of_lt h))

theorem add_one_ne_zero (c : Re) : c + 1 ≠ 0 := by
  show c + step void ≠ 0
  rw [add_step, add_void]
  exact step_ne_void _

/-- Nothing strictly between `n` and `step n`. -/
theorem lt_succ_iff_le {b n : Re} : b < step n ↔ b ≤ n := by
  constructor
  · intro h
    obtain ⟨c, hc⟩ := le_of_lt h
    have hc0 : c ≠ 0 := by
      rintro rfl; rw [add_zero] at hc; exact (ne_of_lt h) hc.symm
    cases c with
    | void => exact absurd rfl hc0
    | step c' =>
      rw [add_step] at hc
      exact ⟨c', step_inj hc⟩
  · intro h
    obtain ⟨c, hc⟩ := h
    rw [step_eq_add_one]
    have hle : b ≤ n + 1 := ⟨c + 1, by rw [hc]; ring⟩
    refine lt_of_le_of_ne hle ?_
    intro heq
    rw [hc] at heq
    have h2 : b + (c + 1) = b + 0 := by
      rw [add_zero]
      calc b + (c + 1) = b + c + 1 := by ring
        _ = b := heq.symm
    exact add_one_ne_zero c (Re.add_left_cancel h2)

/-- ★ THE DESCENT (bounded form): no count `a ≤ n` has `a² = 2b²` with `b ≠ 0`.
    Induction on the bound `n`. The descent step: `a² = 2b²` forces `a` even (parity),
    `a = 2a'`, hence `b² = 2a'²` with `b < a` and `a' ≠ 0` — a smaller instance, killed
    by the inductive hypothesis. The odd case is excluded because an odd square is odd
    while `2b²` is even (banked `add_self_ne_step_add_self`). -/
theorem no_sq_two_bounded :
    ∀ n a : Re, a ≤ n → ∀ b, b ≠ 0 → a * a = 2 * (b * b) → False := by
  intro n
  induction n with
  | void =>
    intro a ha b hb heq
    have ha0 : a = 0 := le_antisymm ha (zero_le a)
    rw [ha0] at heq
    have hz : (2 : Re) * (b * b) = 0 := by rw [← heq]; ring
    rcases mul_eq_zero' hz with h | h
    · exact two_ne_zero h
    · exact hb ((mul_eq_zero' h).resolve_left hb)
  | step n ih =>
    intro a ha b hb heq
    rcases lt_or_eq_of_le ha with hlt | heqn
    · exact ih a (lt_succ_iff_le.mp hlt) b hb heq
    · rcases even_or_odd a with ⟨a', ha'⟩ | ⟨a', ha'⟩
      · -- a = 2a' even
        have hb2 : b * b = 2 * (a' * a') := by
          have h4 : 2 * (2 * (a' * a')) = 2 * (b * b) := by rw [← heq, ha']; ring
          exact (two_mul_cancel h4).symm
        have ha'0 : a' ≠ 0 := by
          rintro rfl
          rw [mul_zero, mul_zero] at hb2
          rcases mul_eq_zero' hb2 with h | h
          · exact hb h
          · exact hb h
        have hba : b < a := by
          apply lt_of_sq_lt_sq
          rw [heq]
          have hbb : 0 < b * b := mul_pos_of_ne hb hb
          calc b * b < b * b + b * b := lt_add_of_ne (ne_of_gt hbb)
            _ = 2 * (b * b) := by ring
        have hbn : b ≤ n := lt_succ_iff_le.mp (by rw [← heqn]; exact hba)
        exact ih b hbn a' ha'0 hb2
      · -- a = 2a'+1 odd: a² odd ≠ 2b² even
        exfalso
        rw [ha'] at heq
        have hodd : (2 * a' + 1) * (2 * a' + 1) = step (2 * (2 * a' * a' + 2 * a')) := by
          rw [step_eq_add_one]; ring
        rw [hodd] at heq
        have hL : step (2 * (2 * a' * a' + 2 * a'))
            = step ((2*a'*a'+2*a') + (2*a'*a'+2*a')) := by congr 1; ring
        have hR : (2:Re) * (b * b) = (b * b) + (b * b) := by ring
        rw [hL, hR] at heq
        exact Re.add_self_ne_step_add_self (b*b) (2*a'*a'+2*a') heq.symm

/-- ★ NO COUNT-PAIR SOLVES `a² = 2b²` NONTRIVIALLY (the `Re` core of √2's
    irrationality, by bounded infinite descent — no well-founded recursion, no
    Mathlib `Rat.den`). -/
theorem no_sq_two {a b : Re} (hb : b ≠ 0) : a * a ≠ 2 * (b * b) :=
  fun h => no_sq_two_bounded a a (le_refl a) b hb h

end Re

/-! ## Lift to the derived ℤ (`Z`) — square away the sign. -/

namespace Z

/-- Every derived integer is `±` the image of a count (the sign decomposition the
    Grothendieck completion provides). -/
theorem eq_ofRe_or_neg (x : Z) : (∃ a : Re, x = ofRe a) ∨ (∃ a : Re, x = - ofRe a) := by
  refine Z.ind (fun a b => ?_) x
  rcases Re.add_comparable b a with ⟨s, hs⟩ | ⟨s, hs⟩
  · left; exact ⟨s, by rw [ofRe_def]; apply sound; rw [add_zero, hs]; ring⟩
  · right; refine ⟨s, ?_⟩
    rw [ofRe_def, neg_mk]; apply sound; rw [zero_add, hs]

/-- ★ NO DERIVED INTEGER PAIR SOLVES `x² = 2y²` (y ≠ 0). Squaring kills the sign, so the
    obstruction lifts from counting (`Re.no_sq_two`) by the ring hom `ofRe`. -/
theorem no_sq_two_Z {x y : Z} (hy : y ≠ 0) : x * x ≠ 2 * (y * y) := by
  intro heq
  obtain ⟨a, ha⟩ : ∃ a : Re, x * x = ofRe (a * a) := by
    rcases eq_ofRe_or_neg x with ⟨a, ha⟩ | ⟨a, ha⟩
    · exact ⟨a, by rw [ha, ofRe_mul]⟩
    · exact ⟨a, by rw [ha, neg_mul_neg, ofRe_mul]⟩
  obtain ⟨b, hb, hbne⟩ : ∃ b : Re, y * y = ofRe (b * b) ∧ b ≠ 0 := by
    rcases eq_ofRe_or_neg y with ⟨b, hb⟩ | ⟨b, hb⟩
    · refine ⟨b, by rw [hb, ofRe_mul], ?_⟩
      rintro rfl; rw [ofRe_zero] at hb; exact hy hb
    · refine ⟨b, by rw [hb, neg_mul_neg, ofRe_mul], ?_⟩
      rintro rfl; rw [ofRe_zero, neg_zero] at hb; exact hy hb
  rw [ha, hb] at heq
  have h2 : (2 : Z) = ofRe 2 := by
    rw [show (2:Z) = 1 + 1 from by ring, show (2:Re) = 1 + 1 from by ring, ofRe_add, ofRe_one]
  rw [h2, ← ofRe_mul] at heq
  have hre : a * a = 2 * (b * b) := ofRe_injective heq
  exact Re.no_sq_two hbne hre

end Z

/-! ## The obstruction over the derived ℚ (`Q`). -/

namespace Q

theorem two_eq_ofZ : (2 : Q) = ofZ 2 := by
  rw [show (2:Q) = 1 + 1 from by ring, show (2:Z) = 1 + 1 from by ring, ofZ_add, ofZ_one]

/-- ★★ THE GROUND CANNOT SOLVE THE SQUARE, OVER THE DERIVED ℚ: no derived rational
    squares to `2`. A fraction `p/d` with `(p/d)² = 2` cross-multiplies to `p² = 2·d²`
    over the derived ℤ with `d ≠ 0` — impossible by `no_sq_two_Z`. This is the
    re-grounded analogue of N6's `no_rat_sq_two` (and of N2's `sqrt_fold_not_on_line`):
    the analytic gap the continuum is built to fill, now resting on the derived ℚ. -/
theorem no_q_sq_two : ¬ ∃ q : Q, q * q = 2 := by
  rintro ⟨q, hq⟩
  revert hq
  refine Q.ind (fun p d => ?_) q
  intro hq
  rw [mk_mul_mk, two_eq_ofZ, ofZ_def] at hq
  have hcross := exact' hq
  simp only [NZ.mul_val, NZ.one_val, mul_one] at hcross
  exact Z.no_sq_two_Z d.2 hcross

end Q
end Phys.Foundation
