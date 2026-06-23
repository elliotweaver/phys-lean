/-
  Phys.Foundation.ContinuumFieldInverse — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 4:
  THE MULTIPLICATIVE INVERSE → `Field Cut` + `IsStrictOrderedRing Cut` on the
  DERIVED-ℚ completion `ContinuumQ.Cut`.
  ===========================================================================
  N10 banked the ORDER half over the DERIVED ℚ; N11 the ADDITIVE ORDERED GROUP
  (`AddCommGroup Cut` + `LinearOrder Cut` + `IsOrderedAddMonoid Cut`); N12 the
  POSITIVE-CONE MULTIPLICATION `pmul`, sign-extended to `Mul Cut`, `One = Qcut 1`,
  and the CAPSTONE `√2 · √2 = 2`; N13/INC-3 the RING LAWS (`CommRing Cut`). THIS file
  banks INCREMENT 4 — the MULTIPLICATIVE INVERSE → `Field Cut`, and the order
  compatibility (`mul_pos`) → `IsStrictOrderedRing Cut`. With the banked Dedekind
  completeness (`completion_coherence_closed`), the completion is now a LINEARLY ORDERED
  FIELD WITH THE LEAST-UPPER-BOUND PROPERTY — the ℝ rung, over the derived ℚ, with NO
  posited ℝ, NO `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to GET it.

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; §2 below) ──
  THE INVERSE is the MULTIPLICATIVE SWAP one level up. At the ℚ rung (N9) the
  multiplicative inverse of `p/q` was THE SWAP `q/p` (numerator↔denominator) — the
  fold's reflection on the multiplicative pairs. Here, on the completion, the inverse
  of a positive cut `x` is the REFLECT-AND-RECIPROCATE set `x⁻¹ = {q ≤ 0} ∪ {q > 0 :
  ∃ r ∉ x, 0 < r, q < 1/r}` — reflect the upper complement of `x` (the points NOT
  approached) and reciprocate. The cancellation `x · x⁻¹ = 1` is where the C6 ETERNAL
  APPROACH becomes load-bearing a THIRD time: the multiplicative approximation
  `mul_approx` (the ratio `a/r` of an interior point `a ∈ x` to an exterior bound
  `r ∉ x` approaches `1` from below, forced past any `t < 1` by the banked
  Archimedean `approx` lever) makes the product cut reach every `q < 1`. This is the
  multiplicative analogue of N11's additive inverse `add_neg_self`. The sign extension
  (the banked negation = the fold's reflection) carries the inverse to all nonzero cuts.

  `mul_pos` (the positive cone is closed under the product — two strictly positive cuts
  have a strictly positive product) is Born = self-overlap = POSITIVITY made an ORDER
  fact, giving `IsStrictOrderedRing Cut`.

  §2. PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "fold / reflection / gather / Born /
  positivity / cone / eternal-approach / completion / continuum / counting": what remains
  is that the type of lower Dedekind cuts of a derived linearly ordered Archimedean field
  is a FIELD (every nonzero cut has a multiplicative inverse, the reflect-and-reciprocate
  cut) and a STRICT ORDERED RING (the product of two positive cuts is positive), hence a
  linearly ordered field with the least-upper-bound property. Pure order theory over a
  derived ordered field; no theorem STATEMENT needs a trunk or physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system content import, NO posited ℝ.
-/
import Phys.Foundation.ContinuumFieldRing
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation ContinuumQ

/-! ## THE POSITIVE-CUT INVERSE — the multiplicative SWAP one level up. -/

/-- THE INVERSE of a positive cut: the reflect-and-reciprocate set. `q ∈ x⁻¹` iff
    `q ≤ 0`, or `q > 0` and some upper bound `r ∉ x` (with `r > 0`) has `q < 1/r`.
    The multiplicative analogue of the additive reflection `negS`. -/
def pinvS (x : Cut) (q : Q) : Prop :=
  q ≤ 0 ∨ ∃ r, 0 < r ∧ ¬ x.S r ∧ q < 1 / r

theorem one_div_lt_one_div_of_lt' {a b : Q} (ha : 0 < a) (h : a < b) : 1 / b < 1 / a :=
  one_div_lt_one_div_of_lt ha h

/-- For `x > 0`, the reflect-and-reciprocate set is a genuine gather. -/
theorem pinvGather {x : Cut} (hx0 : (0:Cut) < x) : IsGather (pinvS x) := by
  have hxne : x ≠ 0 := ne_of_gt hx0
  have hxnn : (0:Cut) ≤ x := le_of_lt hx0
  obtain ⟨a0, ha0, hxa0⟩ := exists_pos_mem hxnn hxne
  -- a fixed upper bound R > 0
  obtain ⟨p, hp⟩ := x.isG.proper
  set R : Q := max p (a0 + 1) with hR
  have hxR : ¬ x.S R := fun h => hp (x.isG.down h (le_max_left _ _))
  have hR0 : 0 < R := lt_of_lt_of_le (by linarith) (le_max_right _ _)
  refine ⟨⟨0, Or.inl le_rfl⟩, ?_, ?_, ?_⟩
  · -- proper: 1/a0 ∉ pinvS
    refine ⟨1 / a0, ?_⟩
    rintro (hle | ⟨r, hr0, hxr, hlt⟩)
    · have : 0 < 1 / a0 := by positivity
      linarith
    · have har : a0 < r := by
        rcases le_or_gt r a0 with h | h
        · exact absurd (x.isG.down hxa0 h) hxr
        · exact h
      have : 1 / r < 1 / a0 := one_div_lt_one_div_of_lt' ha0 har
      linarith
  · rintro p' q (hle | ⟨r, hr0, hxr, hlt⟩) hpq
    · exact Or.inl (le_trans hpq hle)
    · rcases le_or_gt p' 0 with hp0 | hp0
      · exact Or.inl hp0
      · exact Or.inr ⟨r, hr0, hxr, lt_of_le_of_lt hpq hlt⟩
  · rintro q (hle | ⟨r, hr0, hxr, hlt⟩)
    · -- q ≤ 0: step up to 1/(2R) > 0
      have h2R : 0 < 1 / (2 * R) := by positivity
      have hstep : 1 / (2 * R) < 1 / R := one_div_lt_one_div_of_lt' hR0 (by linarith)
      exact ⟨1 / (2 * R), Or.inr ⟨R, hR0, hxR, hstep⟩, by linarith⟩
    · -- q > 0 with witness r: midpoint up-step toward 1/r
      refine ⟨(q + 1 / r) / 2, Or.inr ⟨r, hr0, hxr, by linarith⟩, by linarith⟩

/-- The positive-cut inverse, as a `Cut` (for `x > 0`). -/
noncomputable def pinv {x : Cut} (hx0 : (0:Cut) < x) : Cut := ⟨pinvS x, pinvGather hx0⟩

@[simp] theorem pinv_S {x : Cut} (hx0 : (0:Cut) < x) (q : Q) :
    (pinv hx0).S q ↔ q ≤ 0 ∨ ∃ r, 0 < r ∧ ¬ x.S r ∧ q < 1 / r := Iff.rfl

/-- `0 ≤ pinv x` (the inverse cut contains the whole nonpositive ray). -/
theorem zero_le_pinv {x : Cut} (hx0 : (0:Cut) < x) : (0:Cut) ≤ pinv hx0 := by
  rw [nonneg_iff]; intro q hq; rw [pinv_S]; exact Or.inl (le_of_lt hq)

/-! ## THE MULTIPLICATIVE APPROXIMATION LEMMA (the C6 eternal approach, ratio form). -/

/-- For `x > 0` and `0 < t < 1`, there are `a ∈ x`, `r ∉ x` with `0 < a`, `0 < r`,
    and `t * r < a` (i.e. `a/r > t`). The ratio `a/r` approaches `1` from below; the
    Archimedean `approx` lever makes the gap `r - a` arbitrarily small relative to a
    positive interior point, forcing the ratio past any `t < 1`. -/
theorem mul_approx {x : Cut} (hx0 : (0:Cut) < x) {t : Q} (ht0 : 0 < t) (ht1 : t < 1) :
    ∃ a r, x.S a ∧ ¬ x.S r ∧ 0 < a ∧ 0 < r ∧ t * r < a := by
  have hxne : x ≠ 0 := ne_of_gt hx0
  have hxnn : (0:Cut) ≤ x := le_of_lt hx0
  obtain ⟨a0, ha0, hxa0⟩ := exists_pos_mem hxnn hxne
  -- choose ε = a0 * (1 - t) > 0; approx gives a ∈ x, r ∉ x with r - a < ε and a ≥ a0
  -- (use the down-closure: replace a by max a a0 to keep a ≥ a0 > 0).
  set ε : Q := a0 * (1 - t) with hε
  have hεpos : 0 < ε := by rw [hε]; apply mul_pos ha0 (by linarith)
  obtain ⟨a, r, hxa, hxr, hgap⟩ := approx x ε hεpos
  -- a may be < a0; take A = max a a0 (still in x, still ≥ a0); r still ∉ x and A < r.
  set A : Q := max a a0 with hA
  have hxA : x.S A := by
    rcases le_total a a0 with h | h
    · rw [hA, max_eq_right h]; exact hxa0
    · rw [hA, max_eq_left h]; exact hxa
  have hA0 : 0 < A := lt_of_lt_of_le ha0 (le_max_right _ _)
  have hAr : A < r := by
    rcases le_or_gt r A with h | h
    · exact absurd (x.isG.down hxA h) hxr
    · exact h
  have hr0 : 0 < r := lt_trans hA0 hAr
  have ha0A : a0 ≤ A := le_max_right _ _
  -- r - A ≤ r - a < ε = a0*(1-t) ≤ A*(1-t); so t*r < A.
  have hgapA : r - A < ε := by
    have : r - A ≤ r - a := by
      have : a ≤ A := le_max_left _ _
      linarith
    linarith
  refine ⟨A, r, hxA, hxr, hA0, hr0, ?_⟩
  -- t*r < A: r < A + ε ≤ A + A(1-t) = A(2-t), then t*r < t*A*(2-t) = A*(1-(1-t)²) < A.
  have hrlt : r < A * (2 - t) := by
    have hεA : ε ≤ A * (1 - t) := by
      rw [hε]; apply mul_le_mul_of_nonneg_right ha0A (by linarith)
    have : r < A + A * (1 - t) := by linarith
    nlinarith [this]
  nlinarith [hrlt, ht0, ht1, hA0, sq_nonneg (1 - t)]

/-! ## THE INVERSE LAW: `pmul x (pinv x) = 1` for `x > 0`. -/

/-- ★★ THE MULTIPLICATIVE INVERSE: `pmul x (pinv x) = 1` for `x > 0`. The reverse
    inclusion is where the C6 eternal approach (the multiplicative approximation
    `mul_approx`) is load-bearing: for `0 ≤ q < 1` pick `a ∈ x`, `r ∉ x` with
    `q·r < a` (ratio past `q`), then `b := (q/a + 1/r)/2` lies in `pinv x`
    (`b < 1/r`) and has `q < a·b`. -/
theorem pmul_pinv_cancel {x : Cut} (hx0 : (0:Cut) < x) : pmul x (pinv hx0) = 1 := by
  apply Cut.ext'; intro q
  rw [pmul_S, show (1:Cut) = Qcut 1 from rfl]
  show (q < 0 ∨ ∃ a b, 0 ≤ a ∧ 0 ≤ b ∧ x.S a ∧ (pinv hx0).S b ∧ q < a * b) ↔ q < 1
  constructor
  · rintro (hneg | ⟨a, b, ha, hb, hxa, hbmem, hq⟩)
    · linarith
    · rw [pinv_S] at hbmem
      rcases hbmem with hble | ⟨r, hr0, hxr, hblt⟩
      · -- b ≤ 0, a ≥ 0 ⟹ a*b ≤ 0 < 1
        have : a * b ≤ 0 := mul_nonpos_of_nonneg_of_nonpos ha hble
        linarith
      · -- a ∈ x, r ∉ x ⟹ a < r ; a*b < r*(1/r) = 1
        have har : a < r := by
          rcases le_or_gt r a with h | h
          · exact absurd (x.isG.down hxa h) hxr
          · exact h
        have hab : a * b < 1 := by
          have hb1r : b < 1 / r := hblt
          have h1 : a * b ≤ a * (1 / r) := mul_le_mul_of_nonneg_left (le_of_lt hb1r) ha
          have h2 : a * (1 / r) < 1 := by
            rw [mul_one_div, div_lt_one hr0]; exact har
          linarith
        linarith
  · intro hq
    rcases lt_or_ge q 0 with hq0 | hq0
    · exact Or.inl hq0
    · -- 0 ≤ q < 1
      rcases eq_or_lt_of_le hq0 with hq00 | hqpos
      · -- q = 0: need a positive product. Pick any a ∈ x (>0) and small b>0 in pinv.
        right
        have hxne : x ≠ 0 := ne_of_gt hx0
        obtain ⟨a, ha0, hxa⟩ := exists_pos_mem (le_of_lt hx0) hxne
        obtain ⟨p, hp⟩ := x.isG.proper
        set R : Q := max p (a + 1) with hR
        have hxR : ¬ x.S R := fun h => hp (x.isG.down h (le_max_left _ _))
        have hR0 : 0 < R := lt_of_lt_of_le (by linarith) (le_max_right _ _)
        refine ⟨a, 1 / (2 * R), le_of_lt ha0, by positivity, hxa, ?_, ?_⟩
        · rw [pinv_S]; right
          exact ⟨R, hR0, hxR, one_div_lt_one_div_of_lt' hR0 (by linarith)⟩
        · rw [← hq00]; positivity
      · -- 0 < q < 1
        right
        obtain ⟨a, r, hxa, hxr, ha0, hr0, hqr⟩ := mul_approx hx0 hqpos hq
        -- choose b with q/a < b < 1/r ; exists since q/a < 1/r ⟺ q*r < a
        have hqa_lt : q / a < 1 / r := by
          rw [div_lt_div_iff₀ ha0 hr0]; linarith [hqr]
        set b : Q := (q / a + 1 / r) / 2 with hb
        have hb_lt : b < 1 / r := by rw [hb]; linarith
        have hqa_b : q / a < b := by rw [hb]; linarith
        have hb0 : 0 ≤ b := by
          rw [hb]; have : 0 ≤ q / a := by positivity
          have : 0 < 1 / r := by positivity
          linarith [div_nonneg (le_of_lt hqpos) (le_of_lt ha0)]
        refine ⟨a, b, le_of_lt ha0, hb0, hxa, ?_, ?_⟩
        · rw [pinv_S]; right; exact ⟨r, hr0, hxr, hb_lt⟩
        · -- q < a * b: from q/a < b
          rw [div_lt_iff₀ ha0] at hqa_b
          linarith [hqa_b]

/-! ## THE FIELD: `IsField Cut` via the positive-cut inverse + sign extension. -/

/-- `pmul (pinv x) x = 1` (commuted form). -/
theorem pinv_pmul_cancel {x : Cut} (hx0 : (0:Cut) < x) : pmul (pinv hx0) x = 1 := by
  rw [pmul_comm]; exact pmul_pinv_cancel hx0

/-- For `x > 0`, `x * (pinv x) = 1` in the sign-extended ring (the product is the
    positive-cone product, since both factors are nonnegative). -/
theorem mul_pinv_cancel {x : Cut} (hx0 : (0:Cut) < x) : x * (pinv hx0) = 1 := by
  rw [mul_pp (le_of_lt hx0) (zero_le_pinv hx0)]; exact pmul_pinv_cancel hx0

/-- ★★ THE DERIVED ℝ IS A FIELD. For nonzero `x`, the multiplicative inverse exists:
    if `x > 0` it is `pinv x` (reflect-and-reciprocate); if `x < 0` it is `-(pinv (-x))`
    (the sign carried through by the banked `neg_mul`/`mul_neg`). The C6 eternal approach
    (`mul_approx`) makes `x · x⁻¹ = 1` exact — the multiplicative analogue of the additive
    inverse `add_neg_self`. NO posited ℝ, NO Mathlib number-system content import. -/
theorem isField : IsField Cut where
  exists_pair_ne := ⟨0, 1, zero_ne_one'⟩
  mul_comm := mul_comm'
  mul_inv_cancel := by
    intro x hx
    rcases lt_trichotomy x 0 with hneg | hzero | hpos
    · -- x < 0: 0 < -x; inverse is -(pinv (-x))
      have hnx0 : (0:Cut) < -x := by rw [lt_neg, neg_zero]; exact hneg
      refine ⟨-(pinv hnx0), ?_⟩
      -- x * (-(pinv (-x))) = -(x * pinv(-x)); and x*pinv(-x) = -((-x)*pinv(-x)) = -1
      have hxpinv : x * (pinv hnx0) = -1 := by
        have : (-x) * (pinv hnx0) = 1 := mul_pinv_cancel hnx0
        have h2 : -((-x) * (pinv hnx0)) = -(1:Cut) := by rw [this]
        rwa [neg_mul, neg_neg] at h2
      rw [mul_neg, hxpinv, neg_neg]
    · exact absurd hzero hx
    · exact ⟨pinv hpos, mul_pinv_cancel hpos⟩

/-- The derived ℝ (the completion) as a `Field`. -/
noncomputable instance field : Field Cut := isField.toField

/-! ## THE STRICT ORDER COMPATIBILITY: `mul_pos` (positive-cone product positivity). -/

/-- ★ `mul_pos`: the positive cone is closed under the product — `0 < x`, `0 < y` ⟹
    `0 < x * y`. The Born = self-overlap = positivity made an ORDER fact: two strictly
    positive cuts have a strictly positive product (a positive `a·b/2` member). -/
theorem mul_pos (x y : Cut) (hx : (0:Cut) < x) (hy : (0:Cut) < y) : (0:Cut) < x * y := by
  rw [mul_pp (le_of_lt hx) (le_of_lt hy)]
  obtain ⟨a, ha0, hxa⟩ := exists_pos_mem (le_of_lt hx) (ne_of_gt hx)
  obtain ⟨b, hb0, hyb⟩ := exists_pos_mem (le_of_lt hy) (ne_of_gt hy)
  rw [lt_iff_le_and_ne]
  refine ⟨zero_le_pmul x y, ?_⟩
  intro h
  have hab : 0 < a * b := _root_.mul_pos ha0 hb0
  have hmem : (pmul x y).S (a * b / 2) := by
    rw [pmul_S]; right
    exact ⟨a, b, le_of_lt ha0, le_of_lt hb0, hxa, hyb, by linarith⟩
  rw [← h, zero_S] at hmem
  linarith

/-- `Cut` is nontrivial (`0 ≠ 1`) — instance form of the banked `zero_ne_one'`. -/
instance instNontrivial : Nontrivial Cut := ⟨⟨0, 1, zero_ne_one'⟩⟩

/-- `0 ≤ 1` in `Cut` — instance form of the banked `zero_le_one'`. -/
instance instZeroLEOneClass : ZeroLEOneClass Cut := ⟨zero_le_one'⟩

/-- ★★ THE DERIVED ℝ IS A STRICT ORDERED RING. With `[Field Cut]` + `[LinearOrder Cut]`
    + the banked Dedekind completeness (`completion_coherence_closed`), the completion is
    a LINEARLY ORDERED FIELD WITH THE LEAST-UPPER-BOUND PROPERTY — the ℝ rung, over the
    derived ℚ, with NO posited ℝ. -/
noncomputable instance isStrictOrderedRing : IsStrictOrderedRing Cut :=
  .of_mul_pos mul_pos

/-! ## Non-vacuity (W8): the inverse is genuine on the derived √2 — `√2⁻¹ · √2 = 1`
    where `√2` is the NEW completion element (`sqrt2 ∉ Qcut '' Q`) whose square the
    derived ℚ could not realize (banked `Q.no_q_sq_two`). The field structure is no
    formality: it inverts the very irrational the ground was forced to miss. -/

/-- THE FIELD-LEVEL NON-VACUITY WITNESS: `√2⁻¹ · √2 = 1` for the derived √2. The
    multiplicative inverse of the NEW completion element `sqrt2` (the cut whose square
    is `Qcut 2`, banked `sqrt2_mul_sqrt2`) exists and cancels — the field genuinely
    inverts the irrational the derived ℚ could not realize. -/
theorem sqrt2_inv_mul_sqrt2 : (pinv zero_lt_sqrt2) * sqrt2 = 1 := by
  rw [mul_pp (zero_le_pinv zero_lt_sqrt2) (le_of_lt zero_lt_sqrt2)]
  exact pinv_pmul_cancel zero_lt_sqrt2

end ContinuumQ
end Phys.Foundation
