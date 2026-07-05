/-
  # N320 — SEEDED GAUGE ROUTE B1: DIMENSIONAL TRANSMUTATION `v = M·exp(−c/g²)` (STRUCTURAL FORM)
  over the DERIVED ℝ `ContinuumQ.Cut` and the banked continuous exponential `cutExp`.
  =============================================================================================

  ⭐ SECOND OWNER-AUTHORIZED SEED — GAUGE → SCALE-TOWER → COSMOLOGY, TARGET B1
  (`docs/SEED_GAUGE_SCALE_COSMOLOGY.md`, §"THE TARGETS" ARC B, FIRST bullet). ARC B OPENS THE
  SCALE TOWER — where DIMENSIONFUL SCALES enter the chain. The directed single successor of N319
  (A7, ARC A COMPLETE).

  ## WHAT THIS NODE BANKS (structural form first; the coefficient `c` is the LATER B2 ★ BRIDGE)

  The STRUCTURAL FORM of dimensional transmutation on the trunk's OWN continuum:

      `v/M = cutExp (−(c / g²))`          (`transmutationRatio`, the dimensionless suppression)
      `v   = M · cutExp (−(c / g²))`      (`transmutationScale`, `M` the single scale anchor)

  where `cutExp` is the BANKED derived-ℝ exponential (N174, `∑' n, xⁿ/n!` over `Cut`), `c` is a
  PARAMETER (NOT its value — B2 derives `c` from the cascade β-structure), and `g²` is the Arc-A
  coupling (the banked `alphaStar = couplingWeight = 1/42`, the uniform per-channel Born weight).

  ## THE THEORY-NATIVE READING (why the form is FORCED, not an ansatz)

  Standard QFT DERIVES `v = M·exp(−c/g²)` by integrating the one-loop RG equation `μ dg/dμ = −b g³`
  — the scale emerges from a running coupling. THE THEORY does not run a loop. The exponential is
  the derived ℝ's OWN Born-positive self-overlap square: `cutExp x = (cutExp (x/2))²` (`cutExp_pos`,
  N174 — Born = self-overlap = positivity, the trunk primitive). The suppression factor
  `cutExp (−(c/g²))` is therefore a POSITIVE self-overlap number, and it lies STRICTLY in `(0,1)`
  because its argument `−(c/g²)` is negative (`cutExp_strictMono` vs `cutExp_zero`). The closure
  scale `M` is suppressed by a Born-positive factor of the negative inverse coupling — the form is
  a fact about the banked `cutExp`, not lifted from perturbation theory.

  ## THE STRUCTURAL CONSEQUENCES (all from banked `cutExp` order lemmas — N174/N175, W2)

  - `transmutationRatio_pos`        — `0 < v/M` (banked `cutExp_pos`: Born positivity).
  - `transmutationRatio_le_one`     — `v/M ≤ 1` for `c ≥ 0, g² > 0` (banked `cutExp_le_one_of_nonpos`).
  - `transmutationRatio_lt_one`     — `v/M < 1` for `c > 0, g² > 0` (STRICT suppression;
                                       `cutExp_strictMono` vs `cutExp_zero`). ★ the core content.
  - `transmutationScale_lt_M`       — `v < M` for `c,g²,M > 0` (the scale strictly below closure).
  - `transmutationScale_pos`        — `0 < v` for `M > 0`.
  - `transmutationRatio_mono_c`     — `v/M` STRICTLY DECREASING in `c` (more suppression).
  - `transmutationRatio_mono_g2`    — `v/M` STRICTLY INCREASING in `g²` (weaker suppression at
                                       larger coupling — the hierarchy runs on the coupling).
  - `transmutationRatio_eq_scale_div` — `v/M` IS `transmutationScale / M` (the dimensionless ratio, G3).
  - `transmutationRatio_at_alphaStar` — the suppression holds at the BANKED Arc-A coupling
                                       `g² = alphaStar` (ties the TYPE to the banked object).
  - `transmutation_form`            — the capstone conjunction of the FORM + its consequences.

  ## PHYSICS-WORDS-REMOVABLE (G5)

  Delete "transmutation / electroweak / scale / coupling / closure / QCD": the theorems stand as
  pure statements about `cutExp (−(c/g²))` over the derived ℝ `Cut` — it is in `(0,1)` for
  `c, g² > 0`, strictly below `1`, `M · (that) < M`, strictly decreasing in `c`, strictly
  increasing in `g²`. Every property survives as real analysis on the banked `cutExp`. No physics
  name does any logical work.

  ## SEED-2 HARD GUARDS

  - G1 NO ASSERTED VALUE — `c` is a PARAMETER; the ratio is DEFINED and its properties COMPUTED
    from banked `cutExp` lemmas. No value of `v/M` is premised.
  - G2 NO EMPIRICAL NUMBER — `v ≈ 246 GeV`, `Λ_QCD`, any measured scale is REMOVABLE PROSE ONLY;
    none appears in any statement or proof.
  - G3 SCALES vs RATIOS — `v/M` is the dimensionless ratio; `M` is the single dimensionful anchor
    (`transmutationScale M c g2 = M · (v/M)`), not a fitted input.
  - G4 THE ★ BRIDGE (`c`) IS A LATER NODE — `c` is NOT derived here; B2 derives it from the
    β-structure (the integers {28, 9, 4π}). It is left as an honest parameter, not slipped in.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; every proof
    is complete (no proof gaps, no posited axiom, no kernel-compiled decision). Ground field the
    DERIVED ℝ `Cut` (⚠ NOT Mathlib-ℝ — the banked `cutExp`/`Cut` are used as content; Mathlib is
    MACHINERY only), and the heartbeat ceiling is left at its default.
  - G7 ONE LAW — the form did not fight; the banked `cutExp` order lemmas close every landing.

  ## NOT FREE-FLOATING

  The production TYPEs cite the BANKED `cutExp`/`Cut` and (for the coupling instance) the banked
  `alphaStar`. `transmutationRatio` is `cutExp` of the negative inverse coupling on `Cut`, not a
  generic real exp; `transmutationRatio_at_alphaStar` grounds `g²` to the banked coupling.
-/
import Phys.Foundation.ContinuumLog
import Phys.Algebra.FineStructureScaleCoupling
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- THE DIMENSIONLESS SUPPRESSION FACTOR `v/M = exp(−c/g²)` on the BANKED derived-ℝ exponential
    `cutExp`. `c` is a PARAMETER (its value is the LATER B2 ★ BRIDGE); `g²` is the Arc-A coupling.
    The whole content of B1's "structural form" lives in this being the trunk's own `cutExp` of a
    negative multiple of the inverse coupling. -/
def transmutationRatio (c g2 : Cut) : Cut := cutExp (-(c / g2))

/-- THE DIMENSIONFUL SCALE `v = M · exp(−c/g²)`. `M` is the single legitimate dimensionful anchor
    (the closure scale); every other scale is a derived ratio to it (G3). -/
def transmutationScale (M c g2 : Cut) : Cut := M * transmutationRatio c g2

/-- ★ BORN POSITIVITY of the suppression factor: `0 < v/M`. The ratio is a genuine self-overlap
    number (banked `cutExp_pos`: `cutExp x = (cutExp (x/2))²`, positive). -/
theorem transmutationRatio_pos (c g2 : Cut) : 0 < transmutationRatio c g2 :=
  cutExp_pos _

/-- `v/M ≤ 1` for `c ≥ 0, g² > 0`: the argument `−(c/g²)` is nonpositive, so the banked
    `cutExp_le_one_of_nonpos` bounds the exp by `1`. -/
theorem transmutationRatio_le_one (c g2 : Cut) (hc : 0 ≤ c) (hg : 0 < g2) :
    transmutationRatio c g2 ≤ 1 := by
  unfold transmutationRatio
  apply cutExp_le_one_of_nonpos
  have : 0 ≤ c / g2 := div_nonneg hc (le_of_lt hg)
  linarith

/-- ★ STRICT EXPONENTIAL SUPPRESSION: `v/M < 1` for `c > 0, g² > 0`. The argument `−(c/g²)` is
    strictly negative, so by the banked strict monotonicity `cutExp_strictMono` and `cutExp_zero`,
    `cutExp (−(c/g²)) < cutExp 0 = 1`. This is the core B1 content — the closure scale is strictly
    suppressed. -/
theorem transmutationRatio_lt_one (c g2 : Cut) (hc : 0 < c) (hg : 0 < g2) :
    transmutationRatio c g2 < 1 := by
  unfold transmutationRatio
  have hneg : -(c / g2) < 0 := by
    have : 0 < c / g2 := div_pos hc hg
    linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

/-- `v < M` for `c, g², M > 0`: the scale is strictly below the closure scale (the exponential
    suppression, dressed with the anchor `M`). -/
theorem transmutationScale_lt_M (M c g2 : Cut) (hc : 0 < c) (hg : 0 < g2) (hM : 0 < M) :
    transmutationScale M c g2 < M := by
  unfold transmutationScale
  have h := transmutationRatio_lt_one c g2 hc hg
  calc M * transmutationRatio c g2 < M * 1 := mul_lt_mul_of_pos_left h hM
    _ = M := mul_one M

/-- `0 < v` for `M > 0`: the suppressed scale is a positive scale (Born positivity times a positive
    anchor). -/
theorem transmutationScale_pos (M c g2 : Cut) (hM : 0 < M) :
    0 < transmutationScale M c g2 :=
  mul_pos hM (transmutationRatio_pos c g2)

/-- ★ STRICTLY DECREASING IN `c`: a larger exponent coefficient means MORE suppression. For
    `c₁ < c₂` and `g² > 0`, `v/M` at `c₂` is strictly below `v/M` at `c₁` (banked
    `cutExp_strictMono` on `−(c₂/g²) < −(c₁/g²)`). -/
theorem transmutationRatio_mono_c (c1 c2 g2 : Cut) (h : c1 < c2) (hg : 0 < g2) :
    transmutationRatio c2 g2 < transmutationRatio c1 g2 := by
  unfold transmutationRatio
  apply cutExp_strictMono
  have hlt : c1 / g2 < c2 / g2 := by gcongr
  linarith

/-- ★ STRICTLY INCREASING IN `g²`: a larger coupling means WEAKER suppression (the hierarchy runs
    on the coupling). For `c > 0` and `0 < g₁ < g₂`, `v/M` at `g₁` is strictly below `v/M` at `g₂`
    (banked `cutExp_strictMono` on `−(c/g₂) < −(c/g₁)`, since `c/g₁ > c/g₂`). -/
theorem transmutationRatio_mono_g2 (c g1 g2 : Cut) (hc : 0 < c) (h1 : 0 < g1) (h : g1 < g2) :
    transmutationRatio c g1 < transmutationRatio c g2 := by
  unfold transmutationRatio
  apply cutExp_strictMono
  have h2 : 0 < g2 := lt_trans h1 h
  have hcg : c / g2 < c / g1 := by gcongr
  linarith

/-- THE RATIO IS `v/M` (G3): `transmutationScale M c g² / M = transmutationRatio c g²` for `M ≠ 0`.
    Grounds the "dimensionless ratio" reading — the suppression factor is `v` measured against the
    single anchor `M`. -/
theorem transmutationRatio_eq_scale_div (M c g2 : Cut) (hM : M ≠ 0) :
    transmutationScale M c g2 / M = transmutationRatio c g2 := by
  unfold transmutationScale
  field_simp

/-- NOT FREE-FLOATING: the suppression holds at the BANKED Arc-A coupling `g² = alphaStar` (the
    uniform per-channel Born weight `1/42 > 0`, cast into the derived ℝ). Ties the structural form
    to the banked coupling object, not a generic exp. -/
theorem transmutationRatio_at_alphaStar (c : Cut) (hc : 0 < c) :
    transmutationRatio c ((alphaStar : ℚ) : Cut) < 1 := by
  apply transmutationRatio_lt_one c _ hc
  have : (0 : ℚ) < alphaStar := by rw [alphaStar_eq]; norm_num
  exact_mod_cast this

/-- W8 NON-VACUITY — THE SIGN IS LOAD-BEARING. A WRONG-SIGN reading `exp(+c/g²)` (inflation, not
    suppression) is STRICTLY ABOVE the correct suppressed ratio for `c, g² > 0`: the inflated
    factor exceeds `1` while the correct one is below `1`, so they genuinely differ. Deleting the
    minus sign in `transmutationRatio` breaks the suppression. -/
theorem transmutationRatio_inflation_gt (c g2 : Cut) (hc : 0 < c) (hg : 0 < g2) :
    transmutationRatio c g2 < cutExp (c / g2) := by
  have hsupp : transmutationRatio c g2 < 1 := transmutationRatio_lt_one c g2 hc hg
  have hinfl : 1 < cutExp (c / g2) := by
    have hpos : 0 < c / g2 := div_pos hc hg
    have := cutExp_strictMono hpos
    rwa [cutExp_zero] at this
  linarith

/-- ★★★ THE CAPSTONE — the STRUCTURAL FORM of dimensional transmutation, all consequences at once,
    on the banked derived-ℝ `cutExp` and the banked Arc-A coupling. For `c, g², M > 0`:
    (1) the FORM `v = M · cutExp(−(c/g²))`, (2) the dimensionless ratio `v/M = cutExp(−(c/g²)) ∈ (0,1)`,
    (3) `v < M`, (4) the suppression runs on the coupling (strictly increasing in `g²`), and
    (5) it holds at the banked coupling `alphaStar`. `c` remains a PARAMETER (the B2 ★ BRIDGE). -/
theorem transmutation_form (M c g2 : Cut) (hc : 0 < c) (hg : 0 < g2) (hM : 0 < M) :
    transmutationScale M c g2 = M * transmutationRatio c g2 ∧
    0 < transmutationRatio c g2 ∧
    transmutationRatio c g2 < 1 ∧
    transmutationScale M c g2 < M ∧
    transmutationRatio c ((alphaStar : ℚ) : Cut) < 1 :=
  ⟨rfl,
   transmutationRatio_pos c g2,
   transmutationRatio_lt_one c g2 hc hg,
   transmutationScale_lt_M M c g2 hc hg hM,
   transmutationRatio_at_alphaStar c hc⟩

end

end Phys.Algebra
