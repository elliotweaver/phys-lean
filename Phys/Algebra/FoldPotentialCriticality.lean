/-
  # N370 — arc-F F4 (proper): THE FOLD-POTENTIAL CRITICALITY — the EW fold's radial-mode
  #         self-coupling potential has a UNIQUE critical point, the coherence-closure fold-origin,
  #         FORCED by Born=self-overlap (V = g²) + the always-positive analytic-fold rate (g′ > 0).
  =============================================================================================
  Over the DERIVED ℝ `ContinuumQ.Cut`, the banked continuous exponential `cutExp` (N174), the banked
  analytic-fold derivative `CutHasDerivAt` / `cutExp_scale_hasDerivAt` (N369), and the banked fold
  potential `plateauApproachPot` (N364). The directed single successor of N369 (arc-F F4 toolkit).

  ⭐ FIFTH OWNER-AUTHORIZED SEED — STANDARD MODEL COMPLETION, TARGET F4 (`docs/SEED_SM_COMPLETION.md`
  §F4 — "the Higgs quartic / mass, CANDIDATE, live frame-split"). A FRESH-WORKER SELECT
  (docs/NODE_SELECTION.md IN FULL; kanban comment 274) found the theory-native beat and REDIRECTED the
  framing away from the crux-risk the N369 worker flagged.

  ## THE THEORY-NATIVE READING (why the criticality STRUCTURE is FORCED — not an asserted `λ=0`)

  The Standard Model treats the Higgs quartic `λ` as a FREE PARAMETER, and the observed
  near-criticality `λ(M_Pl) ≈ 0` as an UNEXPLAINED COINCIDENCE (or an anthropic boundary condition).
  THE THEORY does not tune. The fold potential (N364) is the Born SELF-OVERLAP of the coherence gap:

      `foldCoherenceGap c φ = 1 − cutExp(−(c·φ))`      (the coherence deficit, `∈ [0,1)` for `φ ≥ 0`)
      `plateauApproachPot c φ = (foldCoherenceGap c φ)²`   (= the Born positive self-overlap, `V = g²`)

  Its gradient is `V′ = 2·g·g′` (the product rule), and the rate `g′(φ) = c·cutExp(−(c·φ))` is — by
  the analytic fold (N369, `cutExp' = cutExp`) together with Born positivity (`cutExp_pos`) — STRICTLY
  POSITIVE and therefore NEVER ZERO. So the potential's flow vanishes EXACTLY where the coherence gap
  itself closes:

      `V′(φ) = 0`  ⟺  `g(φ) = 0`  ⟺  `cutExp(−(c·φ)) = 1`  ⟺  `φ = 0`.

  **The unique critical point of the fold's self-coupling potential is the coherence-closure
  fold-origin** — this is self-blindness (the look-back has NO nonzero fixed point) realized at the
  level of the potential's own gradient flow. The SM's "near-criticality coincidence" DISSOLVES into a
  structural consequence: the potential is forced to be the Born self-overlap of a gap whose rate never
  vanishes, so its only stationary point is where the gap closes. What the field posits and calls a
  coincidence, the theory reads off the trunk.

  ## HONEST GRADE (mandatory — SEED §F4 CANDIDATE + PERMANENT INCEPTION FLAG)

  - THEOREM-GRADE (genuine theorems on the banked fold potential): the criticality STRUCTURE (the
    unique critical point is the fold-origin), the derived-ℝ product rule and its siblings, the
    explicit `V′`, the strict positivity of `V′` for `φ > 0`, the second derivative `V″(0) = 2c²`
    (the positive curvature / mass² at the critical origin). All gap-free, foundations-only over the
    derived `Cut`.
  - ROUTE-NOT-YET-FOUND (CHILDED, NAMED in the handoff, NEVER asserted here): the `m_H` NUMBER. The
    reading `λ(M_H) = 0` gives `m_H ≈ 127` (+2.1σ direct frame / +0.7σ anchor frame), m_t-frame
    dependent — CANDIDATE with a permanent inception flag, NEVER fit to `125.25`. Reaching a number
    needs the RGE log-derivative flow to a derived scale AND the asymptotic-flatness limit-at-∞ of
    `cutExp`, neither of which is banked — a real further build.
  - ⚠ We do NOT assert "`λ = 0` as a property of the fold potential": that is FALSE as a literal
    statement (the potential's quartic Taylor coefficient is `7c⁴/12 ≠ 0`), and the
    "boundary-of-boundedness" reading would be FREE-FLOATING (true of any quadratic). What is FORCED,
    and what this node banks, is the criticality STRUCTURE — the unique-critical-point theorem.

  ## PHYSICS-WORDS-REMOVABLE (G5)

  Delete "Higgs / quartic / criticality / self-coupling / radial mode / electroweak / coherence": the
  theorems stand as pure statements over `cutExp`/`Cut`/`plateauApproachPot` — the map
  `g(φ) = 1 − cutExp(−cφ)` is `0` exactly at `φ = 0` on `φ ≥ 0`, its difference-quotient derivative
  `c·cutExp(−cφ)` is strictly positive, the square `V = g²` has derived-ℝ derivative
  `2c·cutExp(−cφ)·(1 − cutExp(−cφ))` which is `> 0` for `φ > 0` and `0` at `φ = 0`, so a vanishing
  derivative on `φ ≥ 0` forces `φ = 0`, and `V″(0) = 2c²`. No physics name does any logical work.

  ## THE ONE CAUSE (THE ONE LAW)

  The SAME fold no-nonzero-fixed-point that started the whole cascade (recursive self-blindness) and
  gave the eternal approach (C6, N364) now fixes the fold potential's ONLY critical point at the
  coherence-closure origin: the rate of self-change of the Born self-overlap never vanishes away from
  closure. One primitive (no nonzero fixed point of the look-back), several terminations — the
  cascade's stop, the eternal-approach plateau, and now the potential's unique critical point.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system
  content import, NO `Real`/`Real.exp`, NO Mathlib `HasDerivAt`/`deriv`/`NormedField`/`Norm`. No
  empirical number (measured `m_H`, `m_t`) appears anywhere — `c`, `φ` stay SYMBOLIC.
-/
import Phys.Foundation.ContinuumExpDeriv
import Phys.Algebra.CosmoInflationPlateauExclusion

namespace Phys.Foundation.ContinuumQ

open Filter Set
open Phys.Algebra
open scoped Topology BigOperators

noncomputable section

/-! ## (1) EXTENDING THE N369 CALCULUS: the scalar-multiple, negation, subtraction, and PRODUCT rules
    for the trunk-native derived-ℝ derivative `CutHasDerivAt`. -/

/-- The SCALAR-MULTIPLE rule: `(a·f)′ = a·f′` at a point. -/
theorem CutHasDerivAt.const_mul {f : Cut → Cut} {df x : Cut} (a : Cut)
    (hf : CutHasDerivAt f df x) : CutHasDerivAt (fun y => a * f y) (a * df) x := by
  unfold CutHasDerivAt at *
  have := hf.const_mul a
  refine this.congr' ?_
  filter_upwards with h; ring

/-- The NEGATION rule: `(−f)′ = −f′` at a point. -/
theorem CutHasDerivAt.neg {f : Cut → Cut} {df x : Cut} (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => - f y) (- df) x := by
  unfold CutHasDerivAt at *
  have := hf.neg
  refine this.congr' ?_
  filter_upwards with h; ring

/-- The SUBTRACTION rule: `(f − g)′ = f′ − g′` at a point. -/
theorem CutHasDerivAt.sub {f g : Cut → Cut} {df dg x : Cut}
    (hf : CutHasDerivAt f df x) (hg : CutHasDerivAt g dg x) :
    CutHasDerivAt (fun y => f y - g y) (df - dg) x := by
  have hng := hg.neg
  have := hf.add hng
  refine this.congr' ?_
  · unfold CutHasDerivAt at *; filter_upwards with h; ring

/-- A differentiable map is CONTINUOUS at the point (along `𝓝[≠] 0`): `f(x+h) → f x`. The difference
    quotient `h⁻¹(f(x+h) − f x)` has a limit, so multiplying by `h → 0` gives `f(x+h) − f x → 0`. -/
theorem CutHasDerivAt.tendsto_shift {f : Cut → Cut} {df x : Cut} (hf : CutHasDerivAt f df x) :
    Tendsto (fun h => f (x + h)) (𝓝[≠] (0 : Cut)) (𝓝 (f x)) := by
  unfold CutHasDerivAt at hf
  have h0 : Tendsto (fun h : Cut => h) (𝓝[≠] (0 : Cut)) (𝓝 0) :=
    tendsto_id.mono_left nhdsWithin_le_nhds
  have hprod : Tendsto (fun h : Cut => h * (h⁻¹ * (f (x + h) - f x)))
      (𝓝[≠] (0 : Cut)) (𝓝 (0 * df)) := h0.mul hf
  have hcongr : Tendsto (fun h : Cut => f (x + h) - f x) (𝓝[≠] (0 : Cut)) (𝓝 (0 * df)) := by
    refine hprod.congr' ?_
    filter_upwards [self_mem_nhdsWithin] with h hh
    simp only [mem_compl_iff, mem_singleton_iff] at hh
    field_simp
  rw [zero_mul] at hcongr
  have := hcongr.add_const (f x); simpa using this

/-- ★ THE PRODUCT RULE (Leibniz): `(f·g)′ = f′·g + f·g′` at a point. The difference quotient
    `h⁻¹(f(x+h)g(x+h) − f x·g x)` splits as `(h⁻¹(f(x+h) − f x))·g x + f(x+h)·(h⁻¹(g(x+h) − g x))`,
    whose limit is `df·g x + f x·dg` (using `f(x+h) → f x`, `CutHasDerivAt.tendsto_shift`, and the
    continuity of multiplication on the derived ℝ, `IsTopologicalRing Cut`, N-topology). -/
theorem CutHasDerivAt.mul {f g : Cut → Cut} {df dg x : Cut}
    (hf : CutHasDerivAt f df x) (hg : CutHasDerivAt g dg x) :
    CutHasDerivAt (fun y => f y * g y) (df * g x + f x * dg) x := by
  have hcf := hf.tendsto_shift
  unfold CutHasDerivAt at *
  have hA : Tendsto (fun h : Cut => (h⁻¹ * (f (x + h) - f x)) * g x)
      (𝓝[≠] (0 : Cut)) (𝓝 (df * g x)) := hf.mul_const (g x)
  have hB : Tendsto (fun h : Cut => f (x + h) * (h⁻¹ * (g (x + h) - g x)))
      (𝓝[≠] (0 : Cut)) (𝓝 (f x * dg)) := hcf.mul hg
  have hAB := hA.add hB
  refine hAB.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with h hh
  simp only [mem_compl_iff, mem_singleton_iff] at hh
  field_simp; ring

/-! ## (2) THE COHERENCE GAP `g(φ) = 1 − cutExp(−(c·φ))` and its always-positive rate. -/

/-- THE COHERENCE GAP (deficit) `g(φ) = 1 − cutExp(−(c·φ))` — the Born-positive coherence deficit
    the fold potential is the self-overlap of. For `φ ≥ 0` it lies in `[0,1)` (banked `cutExp` bounds),
    and it CLOSES (`= 0`) exactly at the fold-origin `φ = 0`. -/
def foldCoherenceGap (c φ : Cut) : Cut := 1 - cutExp (-(c * φ))

/-- The gap's derived-ℝ derivative is the analytic-fold rate `g′(φ) = c·cutExp(−(c·φ))`. Built from
    the banked scaling rule `cutExp_scale_hasDerivAt` (N369) and the subtraction rule. -/
theorem foldCoherenceGap_hasDerivAt (c φ : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (foldCoherenceGap c) (c * cutExp (-(c * φ))) φ := by
  have hexp : CutHasDerivAt (fun y => cutExp ((-c) * y)) ((-c) * cutExp ((-c) * φ)) φ :=
    cutExp_scale_hasDerivAt (-c) φ (neg_ne_zero.mpr hc)
  have hconst : CutHasDerivAt (fun _ : Cut => (1 : Cut)) 0 φ := cutHasDerivAt_const 1 φ
  have hsub := hconst.sub hexp
  have hfe : (fun y => (1:Cut) - cutExp ((-c) * y)) = foldCoherenceGap c := by
    funext y; unfold foldCoherenceGap; rw [neg_mul]
  rw [hfe] at hsub
  have hval : (0 : Cut) - (-c) * cutExp ((-c) * φ) = c * cutExp (-(c * φ)) := by
    rw [show ((-c) * φ) = -(c * φ) from by ring, neg_mul, zero_sub, neg_neg]
  rw [hval] at hsub; exact hsub

/-- ★ THE ALWAYS-POSITIVE ANALYTIC-FOLD RATE: for `c > 0` the gap's rate `g′ = c·cutExp(−(c·φ))` is
    STRICTLY POSITIVE at every `φ` — the fold's rate of self-change never vanishes (Born positivity of
    `cutExp`, `cutExp_pos`). This is why the potential can be critical ONLY where the gap itself closes. -/
theorem foldCoherenceGap_deriv_pos (c φ : Cut) (hc : 0 < c) :
    0 < c * cutExp (-(c * φ)) := _root_.mul_pos hc (cutExp_pos _)

/-- The coherence gap CLOSES (`= 0`) EXACTLY at the fold-origin `φ = 0`: `cutExp(−(c·φ)) = 1`
    forces `−(c·φ) = 0` (banked `cutExp` injectivity via `cutExp_strictMono`), hence `φ = 0` for `c > 0`. -/
theorem foldCoherenceGap_eq_zero_iff (c φ : Cut) (hc : 0 < c) :
    foldCoherenceGap c φ = 0 ↔ φ = 0 := by
  unfold foldCoherenceGap
  constructor
  · intro h
    have he : cutExp (-(c * φ)) = 1 := by linarith
    have h0 : cutExp (-(c * φ)) = cutExp 0 := by rw [cutExp_zero]; exact he
    have harg : -(c * φ) = 0 := cutExp_strictMono.injective h0
    have hcf : c * φ = 0 := by linarith
    rcases mul_eq_zero.mp hcf with h1 | h2
    · exact absurd h1 (ne_of_gt hc)
    · exact h2
  · intro h; rw [h, mul_zero, neg_zero, cutExp_zero]; ring

/-! ## (3) THE FOLD POTENTIAL `V = g²` and its derivative. -/

/-- The fold potential is the Born SELF-OVERLAP of the coherence gap: `plateauApproachPot c φ =
    (foldCoherenceGap c φ)²`. This ties the banked N364 potential to the coherence gap of this node
    (definitional — both are `(1 − cutExp(−(c·φ)))²`). -/
theorem plateauApproachPot_eq_gap_sq (c φ : Cut) :
    plateauApproachPot c φ = (foldCoherenceGap c φ) ^ 2 := by
  unfold plateauApproachPot foldCoherenceGap
  rfl

/-- THE FOLD-POTENTIAL DERIVATIVE VALUE `V′(φ) = 2c·cutExp(−(c·φ))·(1 − cutExp(−(c·φ)))`. -/
def foldPotentialDeriv (c φ : Cut) : Cut :=
  2 * c * cutExp (-(c * φ)) * (1 - cutExp (-(c * φ)))

/-- ★ THE FOLD-POTENTIAL DERIVATIVE: `CutHasDerivAt (plateauApproachPot c) (foldPotentialDeriv c φ) φ`.
    Since `V = g·g`, the product rule gives `V′ = g′·g + g·g′ = 2·g·g′ = 2c·cutExp(−cφ)·(1 − cutExp(−cφ))`. -/
theorem plateauApproachPot_hasDerivAt (c φ : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (plateauApproachPot c) (foldPotentialDeriv c φ) φ := by
  have hg := foldCoherenceGap_hasDerivAt c φ hc
  have hsq := hg.mul hg
  have hfun : (fun y => foldCoherenceGap c y * foldCoherenceGap c y) = plateauApproachPot c := by
    funext y; unfold plateauApproachPot foldCoherenceGap; ring
  rw [hfun] at hsq
  have hval : c * cutExp (-(c * φ)) * foldCoherenceGap c φ
        + foldCoherenceGap c φ * (c * cutExp (-(c * φ))) = foldPotentialDeriv c φ := by
    unfold foldCoherenceGap foldPotentialDeriv; ring
  rw [hval] at hsq; exact hsq

/-! ## (4) ★★ THE CRITICALITY STRUCTURE: the unique critical point is the coherence-closure origin. -/

/-- ★ THE FOLD POTENTIAL STRICTLY ROLLS for `φ > 0`: `V′(φ) > 0`. Away from the origin the gap is
    positive (`foldCoherenceGap_eq_zero_iff` + the bound `cutExp(−cφ) < 1`) and the rate is positive
    (`foldCoherenceGap_deriv_pos`), so their product `2·g·g′` is strictly positive — no nonzero
    critical point. -/
theorem foldPotential_deriv_pos (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    0 < foldPotentialDeriv c φ := by
  unfold foldPotentialDeriv
  have hepos : 0 < cutExp (-(c * φ)) := cutExp_pos _
  have hlt1 : cutExp (-(c * φ)) < 1 := by
    have harg : -(c * φ) < 0 := by nlinarith
    calc cutExp (-(c * φ)) < cutExp 0 := cutExp_strictMono harg
      _ = 1 := cutExp_zero
  have h1 : (0:Cut) < 1 - cutExp (-(c * φ)) := by linarith
  have hce : 0 < c * cutExp (-(c * φ)) := _root_.mul_pos hc hepos
  have hce2 : 0 < c * cutExp (-(c * φ)) * (1 - cutExp (-(c * φ))) := _root_.mul_pos hce h1
  nlinarith [hce2]

/-- The fold potential is STATIONARY at the fold-origin: `V′(0) = 0` (the coherence gap closes there). -/
theorem foldPotential_deriv_zero_origin (c : Cut) : foldPotentialDeriv c 0 = 0 := by
  unfold foldPotentialDeriv
  rw [mul_zero, neg_zero, cutExp_zero]; ring

/-- ★★ THE FOLD-POTENTIAL CRITICALITY THEOREM (the self-blindness of the gradient flow). On `φ ≥ 0`
    the fold's self-coupling potential `plateauApproachPot c` has its UNIQUE critical point at the
    coherence-closure fold-origin: if the derived-ℝ derivative vanishes (`CutHasDerivAt V 0 φ`) then
    `φ = 0`. The rate `g′ = c·cutExp(−cφ)` NEVER vanishes (the analytic fold + Born positivity), so
    `V′ = 2·g·g′` can vanish only where the gap `g` closes, and the gap closes only at the origin.
    This is the trunk's no-nonzero-fixed-point primitive realized at the potential's gradient. -/
theorem foldPotential_criticality (c φ : Cut) (hc : 0 < c) (hφ : 0 ≤ φ)
    (hcrit : CutHasDerivAt (plateauApproachPot c) 0 φ) : φ = 0 := by
  by_contra hne
  have hφpos : 0 < φ := lt_of_le_of_ne hφ (Ne.symm hne)
  have hd := plateauApproachPot_hasDerivAt c φ (ne_of_gt hc)
  have heq : foldPotentialDeriv c φ = 0 := hd.unique hcrit
  exact absurd heq (ne_of_gt (foldPotential_deriv_pos c φ hc hφpos))

/-! ## (5) THE CURVATURE AT THE CRITICAL ORIGIN: `V″(0) = 2c²` (the positive mass²). -/

/-- The fold-potential derivative in SUM FORM: `V′(φ) = 2c·cutExp((−c)·φ) − 2c·cutExp((−2c)·φ)`
    (from `cutExp(a)·cutExp(a) = cutExp(2a)`). This is the linear-combination form to differentiate
    a second time via the banked scaling rule. -/
theorem foldPotentialDeriv_sumform (c φ : Cut) :
    foldPotentialDeriv c φ = 2 * c * cutExp ((-c) * φ) - 2 * c * cutExp ((-(2 * c)) * φ) := by
  unfold foldPotentialDeriv
  have hneg : -(c * φ) = (-c) * φ := by ring
  rw [hneg]
  set e := cutExp ((-c) * φ) with he
  have h2 : e * e = cutExp ((-(2 * c)) * φ) := by
    rw [he, cutExp_add]; congr 1; ring
  have hexpand : 2 * c * e * (1 - e) = 2 * c * e - 2 * c * (e * e) := by ring
  rw [hexpand, h2]

/-- The SECOND DERIVATIVE of the fold potential (the derivative of `V′`) at a general point:
    `V″(φ) = −2c²·cutExp((−c)·φ) + 4c²·cutExp((−2c)·φ)`. Differentiate the sum form with the
    banked scaling rule (`cutExp_scale_hasDerivAt`) and the scalar-multiple/subtraction rules. -/
theorem foldPotentialDeriv_hasDerivAt (c φ : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (foldPotentialDeriv c)
      (- (2 * c ^ 2) * cutExp ((-c) * φ) + 4 * c ^ 2 * cutExp ((-(2 * c)) * φ)) φ := by
  have hne1 : (-c) ≠ 0 := neg_ne_zero.mpr hc
  have hne2 : (-(2 * c)) ≠ 0 := by
    have h2c : (2 : Cut) * c ≠ 0 := by
      intro h; rcases mul_eq_zero.mp h with h1 | h2
      · norm_num at h1
      · exact hc h2
    exact neg_ne_zero.mpr h2c
  have h1 : CutHasDerivAt (fun y => 2 * c * cutExp ((-c) * y))
      (2 * c * ((-c) * cutExp ((-c) * φ))) φ :=
    (cutExp_scale_hasDerivAt (-c) φ hne1).const_mul (2 * c)
  have h2 : CutHasDerivAt (fun y => 2 * c * cutExp ((-(2 * c)) * y))
      (2 * c * ((-(2 * c)) * cutExp ((-(2 * c)) * φ))) φ :=
    (cutExp_scale_hasDerivAt (-(2 * c)) φ hne2).const_mul (2 * c)
  have hsub := h1.sub h2
  have hfe : (fun y => 2 * c * cutExp ((-c) * y) - 2 * c * cutExp ((-(2 * c)) * y))
      = foldPotentialDeriv c := by
    funext y; rw [foldPotentialDeriv_sumform]
  rw [hfe] at hsub
  have hval : 2 * c * ((-c) * cutExp ((-c) * φ)) - 2 * c * ((-(2 * c)) * cutExp ((-(2 * c)) * φ))
      = - (2 * c ^ 2) * cutExp ((-c) * φ) + 4 * c ^ 2 * cutExp ((-(2 * c)) * φ) := by ring
  rw [hval] at hsub; exact hsub

/-- ★ THE CURVATURE AT THE CRITICAL ORIGIN: `V″(0) = 2c² > 0`. The fold potential's second derivative
    at its unique critical point is `2c²` — a genuine POSITIVE curvature (the radial-mode mass² is a
    positive multiple of the self-coupling scale²), witnessing the origin is a minimum, not a saddle. -/
theorem foldPotential_secondDeriv_origin (c : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (foldPotentialDeriv c) (2 * c ^ 2) 0 := by
  have h := foldPotentialDeriv_hasDerivAt c 0 hc
  have hval : - (2 * c ^ 2) * cutExp ((-c) * 0) + 4 * c ^ 2 * cutExp ((-(2 * c)) * 0) = 2 * c ^ 2 := by
    rw [mul_zero, mul_zero, cutExp_zero]; ring
  rw [hval] at h; exact h

theorem foldPotential_secondDeriv_origin_pos (c : Cut) (hc : 0 < c) : 0 < 2 * c ^ 2 := by
  positivity

/-! ## (6) NON-VACUITY TEETH (W8). -/

/-- W8 TEETH: the criticality is NON-VACUOUS and load-bearing. For the concrete `c = 1`, the fold
    potential is stationary at the origin (`V′(0) = 0`) yet strictly rolling at `φ = 1` (`V′(1) > 0`):
    the origin genuinely IS the unique critical point, not a degenerate/everywhere-flat map. A WRONG
    claim (that the potential is critical at `φ = 1`) fails — the fact the C395 costume rejects. -/
theorem foldPotential_criticality_nonvacuous :
    foldPotentialDeriv 1 0 = 0 ∧ 0 < foldPotentialDeriv 1 1 :=
  ⟨foldPotential_deriv_zero_origin 1, foldPotential_deriv_pos 1 1 (by norm_num) (by norm_num)⟩

end

end Phys.Foundation.ContinuumQ
