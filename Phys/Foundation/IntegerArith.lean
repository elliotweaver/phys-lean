/-
  # THE INTEGER ARITHMETIC OF THE FOLD — division, well-ordering, gcd, Bézout

  ## What this file proves (GQ campaign, production node L0)

  The arithmetic spine on the DERIVED number tower — `Re` (the fold's ℕ,
  `Counting.lean`) and `Z` (the fold's ℤ, `IntegerTower.lean`) — with NO
  Mathlib number-system content: every induction is the fold's own recursion.

  * `sub` — truncated subtraction on `Re`, with `sub_add_cancel`.
  * `lt_iff_step_le` — the strict order IS the re-entry order.
  * `strong_induction` — complete induction from structural induction.
  * `least_element` — the WELL-ORDERING of the derived ℕ.
  * `div_mod_exists` — ★ EUCLIDEAN DIVISION: ∀ b > 0, ∀ a, ∃ q r, a = b·q + r, r < b.
  * `z_trichotomy` — every derived integer is a count or its reflection.
  * `gcd_bezout_exists` — ★ GCD + BÉZOUT: for x ≠ 0, ∃ g > 0 dividing x and y
    with g = a·x + b·y — the gather coefficient theorem of the campaign.

  ## Why it matters for the chain
  The Gauss-cycle law (GQ campaign) runs entirely on this spine: the branch
  gather (CRT) is Bézout; the fold-Newton lift divides by these theorems; the
  reduction geometry terminates by `strong_induction`. The continuum needed
  ℕ→ℝ; the arithmetic law needs ℕ→gcd. Same trunk, next branch.

  ## Standard
  Foundations-only (`#print axioms` ⊆ {propext, Classical.choice, Quot.sound});
  no sorry; no Mathlib Nat/Int/Rat content — `Mathlib.Tactic` grammar only,
  identical to the trunk files this extends.
-/
import Phys.Foundation.OrderedTower

namespace Phys.Foundation
namespace IntegerArith

open Re


/-! ### L0b/L0d inventory (restated; consolidates at production) -/

def pred : Re → Re
  | .void => .void
  | .step a => a

def sub : Re → Re → Re
  | a, .void => a
  | a, .step b => pred (sub a b)

theorem sub_step_step (a b : Re) : sub (.step a) (.step b) = sub a b := by
  induction b with
  | void => rfl
  | step b ih => show pred (sub (.step a) (.step b)) = pred (sub a b); rw [ih]

theorem add_step_swap (a c : Re) : a + Re.step c = Re.step a + c := by
  calc a + Re.step c = Re.step c + a := add_comm _ _
    _ = Re.step (c + a) := Re.step_add c a
    _ = Re.step (a + c) := by rw [add_comm c a]
    _ = Re.step a + c := (Re.step_add a c).symm

theorem sub_add_cancel (a b : Re) : sub (a + b) b = a := by
  induction b with
  | void => rfl
  | step b ih =>
      have h : a + Re.step b = Re.step (a + b) := by rw [add_step_swap, Re.step_add]
      rw [h]
      show pred (sub (Re.step (a + b)) b) = a
      have hd : pred (sub (Re.step (a + b)) b) = sub (Re.step (a + b)) (Re.step b) := rfl
      rw [hd, sub_step_step, ih]

theorem add_sub_of_le {a b : Re} (h : a ≤ b) : b = a + sub b a := by
  obtain ⟨c, rfl⟩ := h
  rw [add_comm a c, sub_add_cancel, add_comm a c]

theorem lt_iff_step_le {a b : Re} : a < b ↔ Re.step a ≤ b := by
  constructor
  · intro h
    obtain ⟨c, rfl⟩ := le_of_lt h
    match c with
    | .void =>
        exfalso
        have hv : a + Re.void = a := Re.add_void a
        rw [hv] at h
        exact lt_irrefl a h
    | .step c => exact ⟨c, add_step_swap a c⟩
  · intro ⟨c, hc⟩
    subst hc
    have hle : a ≤ Re.step a + c := ⟨Re.step c, (add_step_swap a c).symm⟩
    refine lt_of_le_of_ne hle ?_
    intro heq
    have h2 : a + Re.step c = a := by rw [add_step_swap]; exact heq.symm
    have h3 : a + Re.step c = a + Re.void := by rw [Re.add_void]; exact h2
    exact Re.step_ne_void c (Re.add_left_cancel h3)

theorem strong_induction {P : Re → Prop}
    (ih : ∀ n, (∀ m, m < n → P m) → P n) : ∀ n, P n := by
  have key : ∀ n, ∀ m, m ≤ n → P m := by
    intro n
    induction n with
    | void =>
        intro m hm
        have hm0 : m = Re.void := by
          obtain ⟨c, hc⟩ := hm
          rcases Re.add_eq_zero (a := m) (b := c) hc.symm with ⟨h1, _⟩
          exact h1
        subst hm0
        refine ih Re.void (fun k hk => ?_)
        exfalso
        obtain ⟨c, hc⟩ := lt_iff_step_le.mp hk
        have : Re.step (k + c) = Re.void := by rw [← Re.step_add]; exact hc.symm
        exact Re.step_ne_void _ this
    | step n ihn =>
        intro m hm
        rcases lt_or_ge n m with h | h
        · have hms : Re.step n ≤ m := lt_iff_step_le.mp h
          have hmeq : m = Re.step n := le_antisymm hm hms
          subst hmeq
          refine ih (Re.step n) (fun k hk => ihn k ?_)
          obtain ⟨c, hc⟩ := lt_iff_step_le.mp hk
          have h2 : Re.step (k + c) = Re.step n := by rw [← Re.step_add]; exact hc.symm
          exact ⟨c, (Re.step_inj h2).symm⟩
        · exact ihn m h
  exact fun n => key n n le_rfl

theorem least_element {P : Re → Prop} (hex : ∃ n, P n) :
    ∃ n, P n ∧ ∀ m, P m → n ≤ m := by
  by_contra hno
  have hsmaller : ∀ n, P n → ∃ m, P m ∧ m < n := by
    intro n hPn
    by_contra hnos
    apply hno
    refine ⟨n, hPn, fun m hPm => ?_⟩
    rcases le_or_gt n m with h | h
    · exact h
    · exact absurd ⟨m, hPm, h⟩ hnos
  have hnone : ∀ n, ¬ P n := by
    refine strong_induction (P := fun n => ¬ P n) ?_
    intro n ihn hPn
    obtain ⟨m, hPm, hmn⟩ := hsmaller n hPn
    exact ihn m hmn hPm
  obtain ⟨n, hPn⟩ := hex
  exact hnone n hPn

theorem div_mod_exists (b : Re) (hb : Re.void < b) :
    ∀ a, ∃ q r, a = b * q + r ∧ r < b := by
  refine strong_induction (P := fun a => ∃ q r, a = b * q + r ∧ r < b) ?_
  intro a ih
  rcases lt_or_ge a b with hab | hba
  · exact ⟨0, a, by rw [mul_zero, zero_add], hab⟩
  · have hsplit : a = b + sub a b := add_sub_of_le hba
    have hlt : sub a b < a := by
      obtain ⟨d, hd⟩ := lt_iff_step_le.mp hb
      have hbd : b = Re.step d := by
        rw [hd]
        show Re.step Re.void + d = Re.step d
        rw [Re.step_add, Re.void_add]
      rw [lt_iff_step_le]
      refine ⟨d, ?_⟩
      calc a = b + sub a b := hsplit
        _ = Re.step d + sub a b := by rw [hbd]
        _ = Re.step (d + sub a b) := Re.step_add _ _
        _ = Re.step (sub a b + d) := by rw [add_comm d _]
        _ = Re.step (sub a b) + d := (Re.step_add _ _).symm
    obtain ⟨q, r, hqr, hr⟩ := ih (sub a b) hlt
    refine ⟨Re.step q, r, ?_, hr⟩
    calc a = b + sub a b := hsplit
      _ = b + (b * q + r) := by rw [← hqr]
      _ = (b + b * q) + r := (add_assoc b (b * q) r).symm
      _ = (b * 1 + b * q) + r := by rw [mul_one]
      _ = b * (1 + q) + r := by rw [← mul_add]
      _ = b * Re.step q + r := by
            have h1q : (1 : Re) + q = Re.step q := by
              show Re.step Re.void + q = Re.step q
              rw [Re.step_add, Re.void_add]
            rw [h1q]

/-! ### The ℤ-side bridge -/

/-- Every derived integer is a count or the negative of a count. -/
theorem z_trichotomy (z : Z) : ∃ n : Re, z = Z.ofRe n ∨ z = -(Z.ofRe n) := by
  refine Z.ind (motive := fun z => ∃ n : Re, z = Z.ofRe n ∨ z = -(Z.ofRe n)) ?_ z
  intro a b
  rcases Re.le_total b a with h | h
  · refine ⟨sub a b, Or.inl ?_⟩
    show Z.mk a b = Z.mk (sub a b) 0
    apply Z.sound
    -- a + 0 = sub a b + b
    rw [add_zero]
    calc a = b + sub a b := add_sub_of_le h
      _ = sub a b + b := add_comm _ _
  · refine ⟨sub b a, Or.inr ?_⟩
    have hneg : -(Z.ofRe (sub b a)) = Z.mk 0 (sub b a) := rfl
    rw [hneg]
    apply Z.sound
    -- a + sub b a = 0 + b
    rw [zero_add]
    exact (add_sub_of_le h).symm

theorem ofRe_nonneg (n : Re) : (0 : Z) ≤ Z.ofRe n := ⟨n, by rw [zero_add]⟩

theorem ofRe_pos {n : Re} (hn : n ≠ 0) : (0 : Z) < Z.ofRe n := by
  refine lt_of_le_of_ne (ofRe_nonneg n) ?_
  intro h
  exact hn (Z.ofRe_injective (by rw [← h, Z.ofRe_zero]))

/-! ### GCD with Bézout witness -/

/-- Bézout membership (positive count side): ofRe n is a Z-combination of x,y. -/
def Bez (x y : Z) (n : Re) : Prop := n ≠ 0 ∧ ∃ a b : Z, Z.ofRe n = a * x + b * y

/-- ★ GCD EXISTENCE + BÉZOUT (the arithmetic heart of the campaign):
    for x ≠ 0, there is g > 0 dividing x and y, a Z-combination of x and y. -/
theorem gcd_bezout_exists (x y : Z) (hx : x ≠ 0) :
    ∃ g : Z, 0 < g ∧ (∃ c, x = g * c) ∧ (∃ c, y = g * c) ∧
      (∃ a b : Z, g = a * x + b * y) := by
  -- the Bézout set is inhabited on the count side
  have hex : ∃ n, Bez x y n := by
    obtain ⟨n, hn | hn⟩ := z_trichotomy x
    · refine ⟨n, ?_, 1, 0, by rw [one_mul, zero_mul, add_zero, hn]⟩
      intro h0; subst h0; exact hx (by rw [hn, Z.ofRe_zero])
    · refine ⟨n, ?_, -1, 0, ?_⟩
      · intro h0; subst h0
        apply hx
        rw [hn, Z.ofRe_zero, neg_zero]
      · rw [zero_mul, add_zero, neg_one_mul, hn, neg_neg]
  obtain ⟨n₀, ⟨hn0, A, B, hAB⟩, hleast⟩ := least_element hex
  set g : Z := Z.ofRe n₀ with hg
  have hgpos : (0 : Z) < g := ofRe_pos hn0
  have hn0pos : Re.void < n₀ :=
    lt_of_le_of_ne (Re.zero_le n₀) (fun h => hn0 h.symm)
  -- THE DESCENT: g divides any z whose class is a Z-combination of x,y.
  have hdiv : ∀ z : Z, (∃ a b : Z, z = a * x + b * y) → ∃ c, z = g * c := by
    intro z ⟨az, bz, hz⟩
    obtain ⟨m, hm | hm⟩ := z_trichotomy z
    · -- z = ofRe m
      obtain ⟨q, r, hqr, hrlt⟩ := div_mod_exists n₀ hn0pos m
      have hofm : Z.ofRe m = g * Z.ofRe q + Z.ofRe r := by
        rw [hqr, Z.ofRe_add, Z.ofRe_mul, hg]
      have hr0 : r = 0 := by
        by_contra hrne
        have hbez : Bez x y r := by
          refine ⟨hrne, az - A * Z.ofRe q, bz - B * Z.ofRe q, ?_⟩
          have h1 : Z.ofRe r = Z.ofRe m - g * Z.ofRe q := by
            rw [hofm]; ring
          rw [h1, ← hm, hz, hAB]; ring
        exact absurd (hleast r hbez) (not_le.mpr hrlt)
      subst hr0
      have hofm0 : Z.ofRe m = g * Z.ofRe q := by
        rw [hofm, Z.ofRe_zero, add_zero]
      exact ⟨Z.ofRe q, by rw [hm, hofm0]⟩
    · -- z = -(ofRe m)
      obtain ⟨q, r, hqr, hrlt⟩ := div_mod_exists n₀ hn0pos m
      have hofm : Z.ofRe m = g * Z.ofRe q + Z.ofRe r := by
        rw [hqr, Z.ofRe_add, Z.ofRe_mul, hg]
      have hr0 : r = 0 := by
        by_contra hrne
        have hbez : Bez x y r := by
          refine ⟨hrne, -az - A * Z.ofRe q, -bz - B * Z.ofRe q, ?_⟩
          have h1 : Z.ofRe r = Z.ofRe m - g * Z.ofRe q := by
            rw [hofm]; ring
          have hzm : Z.ofRe m = -z := by rw [hm, neg_neg]
          rw [h1, hzm, hz, hAB]; ring
        exact absurd (hleast r hbez) (not_le.mpr hrlt)
      subst hr0
      have hofm0 : Z.ofRe m = g * Z.ofRe q := by
        rw [hofm, Z.ofRe_zero, add_zero]
      refine ⟨-(Z.ofRe q), ?_⟩
      rw [hm, hofm0]; ring
  refine ⟨g, hgpos, hdiv x ⟨1, 0, by ring⟩, hdiv y ⟨0, 1, by ring⟩, A, B, hAB⟩


end IntegerArith
end Phys.Foundation
