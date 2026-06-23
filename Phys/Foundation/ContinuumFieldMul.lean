/-
  Phys.Foundation.ContinuumFieldMul — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 2:
  THE POSITIVE-CONE MULTIPLICATION on the DERIVED-ℚ completion `ContinuumQ.Cut`
  and THE CAPSTONE `√2 · √2 = 2`.
  ===========================================================================
  N10 banked the ℝ rung's ORDER half over the DERIVED ℚ (`Cut` + total order +
  Dedekind order-completeness). N11 (`ContinuumField.lean`) banked INCREMENT 1 —
  the ADDITIVE ORDERED GROUP (`AddCommGroup Cut` + `LinearOrder Cut` +
  `IsOrderedAddMonoid Cut`, with `Archimedean Q` derived from counting). THIS file
  banks INCREMENT 2: the MULTIPLICATION, with NO posited ℝ, NO `import
  Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to GET it.

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; §2 below) ──
  THE POSITIVE CONE is where Born = self-overlap = POSITIVITY lives — the trunk's
  recurring positive form, one level up on the completion. The product of two
  approached points is approached by the products of their nonnegative
  approximants:
  • `pmul x y` = the gather of pairwise products of NONNEGATIVE approximants
    (together with the whole negative ray, for downward-closure): `q ∈ x⊙y` iff
    `q < 0` or `∃ a ∈ x, b ∈ y` with `a,b ≥ 0` and `q < a·b`. A genuine cut for
    ALL x,y; it computes the correct product on the nonnegative cone.
  • The SIGN EXTENSION (`Mul Cut`) reduces any product to the cone via the banked
    NEGATION (the fold's reflection, N11) and the banked `LinearOrder Cut`.
  • THE CAPSTONE `√2 · √2 = 2`: the analytic gap N6 forced — `x² = 2` has NO
    solution in the derived ℚ (banked `Q.no_q_sq_two`) — is SOLVED in the
    completion. The derived √2 cut, multiplied by itself, IS the rational cut of 2.
    This is the C6 ETERNAL APPROACH made load-bearing a second time: the
    density-of-squares lemma `sq_dense` iterates the HERON mediant step (the same
    `nomax` up-step the banked `sqrtTwoGather_isGather` uses), whose gap CONTRACTS
    geometrically; the derived ℚ being ARCHIMEDEAN (banked `Q.instArchimedean`,
    itself derived from counting) closes the approach. The completion strictly
    extends the derived ℚ AND closes the square the ground could not — the exact
    mirror of the banked obstruction.

  ── WHAT THIS BANKS (all over the DERIVED ℚ; NO posited ℝ) ──
    mulNonnegS / mulNonnegGather / pmul / pmul_S  — the positive-cone product.
    pmul_comm                                     — it is commutative.
    Mul Cut / One Cut / mul_of_nonneg             — sign extension + the unit cut.
    sqrt2_S_nonneg                                — √2-membership on the cone (a²<2).
    heron / heron_inv / heron_gap                 — the Heron approach + its
                                                    geometric gap contraction.
    sq_dense                                      — ★ DENSITY OF SQUARES (Archimedean
                                                    eternal approach made load-bearing).
    pmul_sqrt2_sqrt2 / sqrt2_mul_sqrt2            — ★★ THE CAPSTONE: √2·√2 = 2 in the
                                                    completion (cone form + field form).

  §2. PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "fold / reflection / gather /
  miss / completion / continuum / eternal approach / counting / Born / positivity":
  what remains is that the type of lower Dedekind cuts of a derived linearly ordered
  ARCHIMEDEAN field carries a commutative multiplication on its nonnegative cone
  (the cut of pairwise products of nonnegative members), sign-extended to all cuts,
  under which the cut for √2 squares to the cut for 2 — a square the ground field has
  not, by density of rational squares below 2 (a geometrically contracting Heron
  iteration closed by the Archimedean property). Pure order theory over a derived
  ordered field; no theorem STATEMENT needs a trunk or physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system content import, NO posited ℝ. (The full `CommRing Cut`
  / `Field Cut` / `IsStrictOrderedRing Cut` — whose hard law is sign-cased cone
  distributivity — is the next increment, childed onto the chain tail.)
-/
import Phys.Foundation.ContinuumField
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation ContinuumQ

/-! ## THE POSITIVE-CONE PRODUCT. -/

/-- POSITIVE-CONE MULTIPLICATION: `q ∈ x⊙y` iff `q < 0`, or there are NONNEGATIVE
    approximants `a ∈ x`, `b ∈ y` with `q < a·b`. The gather of pairwise products
    of nonnegative members, together with the whole negative ray (for
    downward-closure / inhabitedness). Computes the correct product on the
    nonnegative cone; a genuine cut for ALL `x, y`. -/
def mulNonnegS (x y : Cut) (q : Q) : Prop :=
  q < 0 ∨ ∃ a b, 0 ≤ a ∧ 0 ≤ b ∧ x.S a ∧ y.S b ∧ q < a * b

/-- The positive-cone product set is again a gather. Positivity of the bound `P·R`
    uses the derived ℚ's strict ordered-ring structure (banked `Q.isStrictOrderedRing`);
    the `nomax` up-step is the midpoint, exactly as for cut addition. -/
theorem mulNonnegGather (x y : Cut) : IsGather (mulNonnegS x y) := by
  refine ⟨⟨-1, Or.inl (by norm_num)⟩, ?_, ?_, ?_⟩
  · -- proper: a positive upper bound `P·R` (with `P, R ≥ 1` above `x, y`) is not in the set.
    obtain ⟨p, hp⟩ := x.isG.proper
    obtain ⟨r, hr⟩ := y.isG.proper
    set P : Q := max p 1 with hP
    set R : Q := max r 1 with hR
    have hP1 : (1:Q) ≤ P := le_max_right _ _
    have hR1 : (1:Q) ≤ R := le_max_right _ _
    have hPx : ¬ x.S P := fun h => hp (x.isG.down h (le_max_left _ _))
    have hRy : ¬ y.S R := fun h => hr (y.isG.down h (le_max_left _ _))
    refine ⟨P * R, ?_⟩
    rintro (hneg | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · nlinarith [hP1, hR1]
    · have haP : a < P := by
        rcases le_or_gt P a with h | h
        · exact absurd (x.isG.down hxa h) hPx
        · exact h
      have hbR : b < R := by
        rcases le_or_gt R b with h | h
        · exact absurd (y.isG.down hyb h) hRy
        · exact h
      nlinarith [ha, hb, haP, hbR, hP1, hR1]
  · rintro p q (hneg | ⟨a, b, ha, hb, hxa, hyb, hq⟩) hpq
    · exact Or.inl (lt_of_le_of_lt hpq hneg)
    · exact Or.inr ⟨a, b, ha, hb, hxa, hyb, lt_of_le_of_lt hpq hq⟩
  · rintro q (hneg | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · exact ⟨q / 2, Or.inl (by linarith), by linarith⟩
    · exact ⟨(q + a * b) / 2, Or.inr ⟨a, b, ha, hb, hxa, hyb, by linarith⟩, by linarith⟩

/-- The positive-cone product, as a `Cut`. -/
noncomputable def pmul (x y : Cut) : Cut := ⟨mulNonnegS x y, mulNonnegGather x y⟩

@[simp] theorem pmul_S (x y : Cut) (q : Q) :
    (pmul x y).S q ↔ q < 0 ∨ ∃ a b, 0 ≤ a ∧ 0 ≤ b ∧ x.S a ∧ y.S b ∧ q < a * b := Iff.rfl

/-- The positive-cone product is COMMUTATIVE (the pairwise-product set is symmetric). -/
theorem pmul_comm (x y : Cut) : pmul x y = pmul y x := by
  apply Cut.ext'; intro q
  rw [pmul_S, pmul_S]
  constructor
  · rintro (h | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · exact Or.inl h
    · exact Or.inr ⟨b, a, hb, ha, hyb, hxa, by rw [mul_comm]; exact hq⟩
  · rintro (h | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · exact Or.inl h
    · exact Or.inr ⟨b, a, hb, ha, hyb, hxa, by rw [mul_comm]; exact hq⟩

/-! ## THE SIGN EXTENSION: `Mul Cut` and the unit cut `One Cut`. -/

/-- SIGN-EXTENDED multiplication: reduce any product to the positive cone via the
    banked NEGATION (the fold's reflection, N11) and the banked `LinearOrder Cut`. -/
noncomputable instance instMul : Mul Cut := ⟨fun x y =>
  if 0 ≤ x then (if 0 ≤ y then pmul x y else -(pmul x (-y)))
  else (if 0 ≤ y then -(pmul (-x) y) else pmul (-x) (-y))⟩

/-- ONE = the (derived) rational cut of `1`. -/
noncomputable instance instOne : One Cut := ⟨Qcut 1⟩

/-- On the nonnegative cone the sign-extended product IS the positive-cone product. -/
theorem mul_of_nonneg {x y : Cut} (hx : 0 ≤ x) (hy : 0 ≤ y) : x * y = pmul x y := by
  show (if 0 ≤ x then (if 0 ≤ y then pmul x y else -(pmul x (-y)))
    else (if 0 ≤ y then -(pmul (-x) y) else pmul (-x) (-y))) = pmul x y
  rw [if_pos hx, if_pos hy]

/-! ## THE CAPSTONE: `√2 · √2 = 2` in the completion. -/

/-- For a NONNEGATIVE rational, membership in `sqrt2` is exactly `a² < 2`. -/
theorem sqrt2_S_nonneg {a : Q} (ha : 0 ≤ a) : sqrt2.S a ↔ a ^ 2 < 2 := by
  show sqrtTwoGather a ↔ a ^ 2 < 2
  unfold sqrtTwoGather
  constructor
  · rintro (h | h)
    · have : a = 0 := le_antisymm h ha
      rw [this]; norm_num
    · exact h
  · exact fun h => Or.inr h

/-- THE HERON APPROACH SEQUENCE to √2 from below: `c₀ = 1`, `cₙ₊₁ = (2cₙ+2)/(cₙ+2)`.
    The same mediant step the banked `sqrtTwoGather_isGather` uses for its `nomax`
    up-step (the trunk's C6 eternal approach), now ITERATED. -/
noncomputable def heron : ℕ → Q
  | 0 => 1
  | n + 1 => (2 * heron n + 2) / (heron n + 2)

/-- THE INVARIANT: each Heron approximant is `≥ 1` and squares to `< 2` (interior). -/
theorem heron_inv (n : ℕ) : 1 ≤ heron n ∧ heron n ^ 2 < 2 := by
  induction n with
  | zero => constructor <;> norm_num [heron]
  | succ k ih =>
    obtain ⟨hk1, hk2⟩ := ih
    have hpos : 0 < heron k + 2 := by linarith
    rw [heron]
    refine ⟨?_, ?_⟩
    · rw [le_div_iff₀ hpos]; nlinarith [hk1]
    · rw [div_pow, div_lt_iff₀ (by positivity)]; nlinarith [hk2, hk1]

/-- THE GAP CONTRACTS GEOMETRICALLY: `2 - cₙ² ≤ (2/9)ⁿ`. The Heron step multiplies
    the gap by `2/(cₙ+2)² ≤ 2/9` (since `cₙ ≥ 1`) — the eternal approach made
    quantitative. -/
theorem heron_gap (n : ℕ) : 2 - heron n ^ 2 ≤ (2 / 9) ^ n := by
  induction n with
  | zero => norm_num [heron]
  | succ k ih =>
    obtain ⟨hk1, hk2⟩ := heron_inv k
    have hpos : 0 < heron k + 2 := by linarith
    have hsq : (9 : Q) ≤ (heron k + 2) ^ 2 := by nlinarith [hk1]
    have hgap0 : 0 ≤ 2 - heron k ^ 2 := by linarith [hk2]
    have hstep : 2 - heron (k + 1) ^ 2 = 2 * (2 - heron k ^ 2) / (heron k + 2) ^ 2 := by
      rw [heron, div_pow]; field_simp; ring
    have hps : (2 / 9 : Q) ^ (k + 1) = (2 / 9) ^ k * (2 / 9) := pow_succ _ _
    rw [hstep]
    have h1 : 2 * (2 - heron k ^ 2) / (heron k + 2) ^ 2 ≤ (2 / 9) * (2 - heron k ^ 2) := by
      rw [div_le_iff₀ (by positivity)]
      nlinarith [hgap0, hsq, mul_nonneg hgap0 (le_of_lt hpos)]
    have h2 : (2 / 9 : Q) * (2 - heron k ^ 2) ≤ (2 / 9) ^ k * (2 / 9) := by
      rw [mul_comm ((2/9:Q)^k) (2/9)]
      exact mul_le_mul_of_nonneg_left ih (by norm_num)
    rw [hps]; linarith [h1, h2]

/-- ★ THE DENSITY OF SQUARES (the eternal approach, ARCHIMEDEAN made load-bearing):
    for any `0 ≤ q < 2` there is a nonnegative rational `c` with `q < c² < 2`. The
    Heron gap contracts geometrically (`(2/9)ⁿ`); the derived ℚ being ARCHIMEDEAN
    (`exists_pow_lt_of_lt_one`, banked `Q.instArchimedean`) closes the approach. -/
theorem sq_dense {q : Q} (hq0 : 0 ≤ q) (hq2 : q < 2) :
    ∃ c, 0 ≤ c ∧ c ^ 2 < 2 ∧ q < c ^ 2 := by
  obtain ⟨n, hn⟩ := exists_pow_lt_of_lt_one (show (0:Q) < 2 - q by linarith)
    (show (2/9:Q) < 1 by norm_num)
  obtain ⟨hc1, hc2⟩ := heron_inv n
  exact ⟨heron n, by linarith, hc2, by linarith [hn, heron_gap n]⟩

/-- ★★ THE CAPSTONE (positive-cone form) — `pmul √2 √2 = Qcut 2`. The analytic gap
    N6 forced — `x² = 2` has NO solution in the derived ℚ (banked `Q.no_q_sq_two`) —
    is SOLVED in the completion: the derived √2 cut, multiplied by itself, IS the
    rational cut of `2`. Forward (≤): two members `a,b ≥ 0` with `a²<2`, `b²<2` have
    `a·b < 2` (AM–GM, `2ab ≤ a²+b² < 4`). Reverse (≥): every `0 ≤ q < 2` lies below
    some `c² < 2` (`sq_dense`), placing `q ∈ pmul √2 √2` with witness `c, c`. -/
theorem pmul_sqrt2_sqrt2 : pmul sqrt2 sqrt2 = Qcut 2 := by
  apply Cut.ext'; intro q
  rw [pmul_S]
  show (q < 0 ∨ ∃ a b, 0 ≤ a ∧ 0 ≤ b ∧ sqrt2.S a ∧ sqrt2.S b ∧ q < a * b) ↔ q < 2
  constructor
  · rintro (hneg | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · linarith
    · rw [sqrt2_S_nonneg ha] at hxa
      rw [sqrt2_S_nonneg hb] at hyb
      nlinarith [hq, hxa, hyb, ha, hb, sq_nonneg (a - b)]
  · intro hq
    rcases lt_or_ge q 0 with hq0 | hq0
    · exact Or.inl hq0
    · obtain ⟨c, hc0, hc2, hqc⟩ := sq_dense hq0 hq
      refine Or.inr ⟨c, c, hc0, hc0, ?_, ?_, by rw [← pow_two]; exact hqc⟩
      · rw [sqrt2_S_nonneg hc0]; exact hc2
      · rw [sqrt2_S_nonneg hc0]; exact hc2

/-- ★★ THE CAPSTONE (field form) — `√2 · √2 = 2` for the sign-extended multiplication.
    Since `√2 > 0` (banked `zero_lt_sqrt2`), the product is its positive-cone value. -/
theorem sqrt2_mul_sqrt2 : sqrt2 * sqrt2 = Qcut 2 := by
  rw [mul_of_nonneg (le_of_lt zero_lt_sqrt2) (le_of_lt zero_lt_sqrt2)]
  exact pmul_sqrt2_sqrt2

end ContinuumQ
end Phys.Foundation
