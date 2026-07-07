/-
  Phys.Algebra.CosmicFateEternalApproach — N383 (arc-H H5).
  ============================================================================================
  THE FATE OF THE UNIVERSE / THE ETERNAL APPROACH — theorem-grade.

  The universe never reaches heat death. This is NOT posited as an arrow of time — it is a
  THEOREM about the fold's own dynamical engine C6 (best coherence is NOT a fixed point; the
  eternal approach), deployed at the cosmic scale. TWO banked faces, one conclusion.

  ── FACE 1: THE KL / SELF-COINCIDENCE FACE (N375) ──
  "Heat death" = completed totalization = the fold seeing ALL of itself = completed
  self-coincidence. At the state level this is the relative self-information (the KL divergence
  to equilibrium) reaching 0. Banked (N375 `MaxEntArrowOfTime`): `relInfo p q` is a Born
  SELF-OVERLAP with a UNIQUE zero — `relInfo_zero_iff : relInfo p q = 0 ↔ p = q` — so the datum
  vanishes at EXACTLY the coincidence `p = q`, and `gibbs_pos` gives `relInfo p q > 0` for any
  off-coincidence start `p ≠ q`. Completed coincidence is the state-level fixed point the fold's
  self-blindness (C6) forbids: a nonzero self-datum is a partial self-coincidence, forbidden, so
  the approach is eternal and the coincidence is never attained.

  ── FACE 2: THE DYNAMICAL / ANALYTIC-FOLD FACE (N174/N369) ──
  The coherence gap `g(t) = g₀ · cutExp(−λ·t)` relaxes under the fold's OWN Born-positive
  exponential `cutExp` (N174) — the SAME object that drives the de Sitter scale factor (N382).
  Two banked facts force no-arrival:
    · `cutExp_pos` (N174): `cutExp` is STRICTLY POSITIVE everywhere, so `g(t) > 0` at every
      finite `t` — the gap NEVER reaches 0 (`heat_death_never_reached`). The completed state
      (gap 0) is unreachable.
    · the analytic fold `cutExp' = cutExp` (N369 `cutExp_scale_hasDerivAt`) makes the flow
      velocity `g'(t) = −λ·g(t)`, which is NONZERO while `g > 0` (`flow_velocity_ne_zero`): the
      flow never stops — there is no finite-time fixed point. This is a CONCRETE realization of
      the Picard–Lindelöf conclusion (a smooth flow with a unique fixed point cannot reach it in
      finite time): the explicit fold-exponential solution exhibits the non-arrival directly,
      needing no abstract uniqueness theorem.
  The gap is STRICTLY DECREASING in `t` for `λ > 0` (`gap_strictly_decreasing`, via
  `cutExp_strictMono`) — this monotone relaxation IS the arrow, restated: not posited, derived.
  The past end is a BOUNDARY (the banked `S_init = 0` at finite look-back — the blank slate); the
  future end is an ASYMPTOTE with no ceiling. Finite-past / infinite-future IS the arrow.

  ── THE J-H5 JOINT (DERIVED, not posited) ──
  "completed totalization = completed self-coincidence = C6-forbidden." Face 1 identifies the
  completed state as `relInfo = 0` (the unique coincidence, `relInfo_zero_iff`); Face 2 exhibits
  the relaxation toward it as the fold's own exponential, which stays `> 0` (`cutExp_pos`) with a
  nonzero velocity (`cutExp' = cutExp`) — so the coincidence is approached forever and never
  reached. The eternal approach is a COROLLARY of Born positivity + the analytic fold, NOT an
  assumed second law and NOT an assumed arrow of time.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from banked N174/N369/N375) ──
    cutHasDerivAt_const_mul          — MACHINERY: the const-mul rule for `CutHasDerivAt` (N369).
    heat_death_never_reached         — ★★ `0 < g(t)` for all `t` (`cutExp_pos`): gap never 0.
    gap_ne_zero                      — `g(t) ≠ 0` for all `t`.
    gap_strictly_decreasing          — ★ the arrow: `g` strictly decreasing in `t` (λ > 0).
    flow_velocity_eq                 — ★ `g'(t) = −λ·g(t)` (the analytic fold, N369).
    flow_velocity_ne_zero            — ★ the flow never stops: `g'(t) ≠ 0` while `g > 0`.
    fixed_point_iff_gap_zero         — the flow's fixed point (velocity 0) is EXACTLY gap 0.
    fixed_point_unreachable          — ★★ the no-arrival theorem: velocity `≠ 0` for all `t`.
    kl_gap_never_reaches_coincidence — ★★ FACE-1 tie: an off-coincidence KL datum, relaxing,
                                        stays `> 0` — the coincidence `relInfo = 0` is never met.
    coincidence_iff                  — re-export of `relInfo_zero_iff` (the unique coincidence).
    cosmic_fate_eternal_approach     — ★★★ the capstone bundle (both faces).
    gap_concrete_ne_zero             — W8 tie for C408.

  ── GRADE ──
  THEOREM-GRADE. Every leg is a foundations-only theorem over the derived ℝ `Cut`. The
  "eternal approach / heat death / arrow of time" reading is the physics-word-removable
  interpretation; the theorem CONTENT is a pure `Cut` fact (a positive constant times `cutExp`
  of a real argument is positive and never 0 at every argument; strictly decreasing for a
  negative rate; its derivative is minus the rate times itself, nonzero while positive; a KL
  divergence with a unique zero at coincidence, relaxing, stays positive). NO empirical number
  (no cosmic time, no temperature, no `Λ`) enters any statement or proof.

  ── PHYSICS-WORDS-REMOVABLE ──
  Delete "heat death / universe / arrow of time / entropy / equilibrium / coherence / fate":
  every theorem stands as a pure statement about `g₀ · cutExp(−λ·t)` on the derived complete
  ordered field `Cut` — positive everywhere, strictly decreasing for `λ > 0`, with derivative
  `−λ` times itself (nonzero while positive), and about a nonnegative `relInfo` sum with a unique
  zero. No name is load-bearing.

  ── UNBROKEN ──
  Built entirely on banked objects: `relInfo`/`relInfo_zero_iff`/`gibbs_pos` (N375), `cutExp`/
  `cutExp_pos` (N174), `CutHasDerivAt`/`cutExp_scale_hasDerivAt` (N369), `cutExp_strictMono`
  (ContinuumLog), all over the derived ℝ `Cut`. NO Mathlib `Real` analysis / number-system as
  content. NO posited arrow of time; NO posited second law; NO assumed ODE — the flow is the
  fold's own exponential and the positivity/velocity are `cutExp_pos` / `cutExp' = cutExp`.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import, NO `Real`/`Real.log`/`Real.exp`.
-/
import Phys.Algebra.MaxEntArrowOfTime
import Phys.Foundation.ContinuumExpDeriv
import Phys.Foundation.ContinuumLog

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.MaxEnt
open Filter Set
open scoped Topology

noncomputable section

/-! ## MACHINERY — the const-mul rule for the derived-ℝ derivative (N369 extension). -/

/-- The CONST-MUL RULE for `CutHasDerivAt`: `(c·f)' = c·f'` at a point, from the scalar
    multiplicativity of `Tendsto`. Mathlib lacks this ON the derived ℝ `Cut` (no `NormedField`);
    build it directly like the banked `CutHasDerivAt.add` (N369). -/
theorem cutHasDerivAt_const_mul {f : Cut → Cut} {df x : Cut} (c : Cut)
    (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => c * f y) (c * df) x := by
  unfold CutHasDerivAt at *
  have hsum := hf.const_mul c
  have hcongr : (fun h : Cut => c * (h⁻¹ * (f (x + h) - f x)))
      = (fun h : Cut => h⁻¹ * ((fun y => c * f y) (x + h) - (fun y => c * f y) x)) := by
    funext h; ring
  rw [hcongr] at hsum; exact hsum

/-! ## THE COHERENCE GAP and its no-arrival properties. -/

/-- THE RELAXING COHERENCE GAP `g(t) = g₀ · cutExp(−λ·t)`: the fold's distance from completed
    self-coincidence, driven down by the fold's OWN Born-positive exponential `cutExp` (N174) at
    rate `λ`. The SAME `cutExp` that drives the de Sitter scale factor (N382). -/
noncomputable def coherenceGap (g₀ lam t : Cut) : Cut := g₀ * cutExp (-lam * t)

/-- ★★ HEAT DEATH IS NEVER REACHED: the coherence gap is STRICTLY POSITIVE at every finite `t`.
    Because `cutExp` is strictly positive everywhere (`cutExp_pos`, N174 — Born positivity of the
    fold's exponential), `g₀ · cutExp(−λ·t) > 0` for any positive initial gap `g₀`. The completed
    state (gap 0 = completed self-coincidence) is NEVER attained — the approach is eternal. -/
theorem heat_death_never_reached (g₀ lam t : Cut) (hg : 0 < g₀) :
    0 < coherenceGap g₀ lam t := by
  unfold coherenceGap
  exact mul_pos hg (cutExp_pos _)

/-- The coherence gap is nonzero at every finite `t`. -/
theorem gap_ne_zero (g₀ lam t : Cut) (hg : 0 < g₀) : coherenceGap g₀ lam t ≠ 0 :=
  ne_of_gt (heat_death_never_reached g₀ lam t hg)

/-- ★ THE ARROW (restated, DERIVED not posited): the coherence gap is STRICTLY DECREASING in `t`
    for `λ > 0`. `−λ·t` strictly decreases and `cutExp` is strictly monotone (`cutExp_strictMono`,
    ContinuumLog), so `g` strictly relaxes. This monotone one-way relaxation IS the arrow of time —
    a corollary of the fold's exponential, not an assumed direction. -/
theorem gap_strictly_decreasing (g₀ lam t₁ t₂ : Cut)
    (hg : 0 < g₀) (hl : 0 < lam) (ht : t₁ < t₂) :
    coherenceGap g₀ lam t₂ < coherenceGap g₀ lam t₁ := by
  unfold coherenceGap
  apply mul_lt_mul_of_pos_left _ hg
  apply cutExp_strictMono
  have hneg : -lam < 0 := by linarith
  exact mul_lt_mul_of_neg_left ht hneg

/-- ★ THE FLOW VELOCITY `g'(t) = −λ·g(t)`. The analytic fold `cutExp' = cutExp` (N369
    `cutExp_scale_hasDerivAt`) pushed through the const-mul rule: the coherence gap satisfies its
    own relaxation law. This is the fold's dynamical engine C6 read at the cosmic scale — the flow
    is exactly the fold's exponential, NOT a posited ODE. -/
theorem flow_velocity_eq (g₀ lam t : Cut) (hl : lam ≠ 0) :
    CutHasDerivAt (coherenceGap g₀ lam) (g₀ * (-lam * cutExp (-lam * t))) t := by
  have hneg : (-lam) ≠ 0 := neg_ne_zero.mpr hl
  have hbase : CutHasDerivAt (fun y => cutExp (-lam * y)) (-lam * cutExp (-lam * t)) t :=
    cutExp_scale_hasDerivAt (-lam) t hneg
  have := cutHasDerivAt_const_mul (f := fun y => cutExp (-lam * y)) g₀ hbase
  unfold coherenceGap
  exact this

/-- ★ THE FLOW NEVER STOPS: the velocity `g'(t) = −λ·g(t)` is NONZERO at every finite `t` while
    the gap is positive (`g₀ > 0`, `λ > 0`). The rate `−λ < 0` times the positive gap is strictly
    negative — the flow keeps moving, so there is NO finite-time fixed point. -/
theorem flow_velocity_ne_zero (g₀ lam t : Cut) (hg : 0 < g₀) (hl : 0 < lam) :
    g₀ * (-lam * cutExp (-lam * t)) ≠ 0 := by
  have hexp : 0 < cutExp (-lam * t) := cutExp_pos _
  have hneg : -lam < 0 := by linarith
  have hlt : g₀ * (-lam * cutExp (-lam * t)) < 0 :=
    mul_neg_of_pos_of_neg hg (mul_neg_of_neg_of_pos hneg hexp)
  exact ne_of_lt hlt

/-- The flow's FIXED POINT (velocity 0) is EXACTLY the completed state (gap 0): for `λ ≠ 0`,
    `−λ·g(t) = 0 ↔ g(t) = 0`. So "the flow arrives at a fixed point" is EQUIVALENT to "the gap
    reaches 0" — and the latter never happens (`heat_death_never_reached`). -/
theorem fixed_point_iff_gap_zero (g₀ lam t : Cut) (hl : lam ≠ 0) :
    (-lam * coherenceGap g₀ lam t = 0) ↔ (coherenceGap g₀ lam t = 0) := by
  constructor
  · intro h
    rcases mul_eq_zero.mp h with h1 | h2
    · exact absurd (neg_eq_zero.mp h1) hl
    · exact h2
  · intro h; rw [h, mul_zero]

/-- ★★ THE NO-ARRIVAL THEOREM: for a positive initial gap and nonzero rate, the flow's velocity
    is NONZERO at every finite `t`, so the flow's fixed point (gap 0 = completed self-coincidence =
    heat death) is UNREACHABLE. The ending is always AHEAD — for every probe, by theorem. This is
    the concrete Picard–Lindelöf conclusion realized by the fold's own exponential: no abstract
    uniqueness theorem is invoked; the explicit solution never arrives. -/
theorem fixed_point_unreachable (g₀ lam t : Cut) (hg : 0 < g₀) (hl : 0 < lam) :
    -lam * coherenceGap g₀ lam t ≠ 0 := by
  have hgap : 0 < coherenceGap g₀ lam t := heat_death_never_reached g₀ lam t hg
  have hneg : -lam < 0 := by linarith
  exact ne_of_lt (mul_neg_of_neg_of_pos hneg hgap)

/-! ## FACE 1 — the KL / self-coincidence tie (N375). -/

/-- ★★ THE KL FACE: an off-coincidence state, relaxing, NEVER reaches coincidence. Take the
    initial gap to be the relative self-information `relInfo p q` of an off-coincidence start
    `p ≠ q`; it is STRICTLY POSITIVE (`gibbs_pos`, N375 — the state-level Born self-overlap), so
    the relaxing gap `relInfo p q · cutExp(−λ·t)` stays STRICTLY POSITIVE at every `t`. The
    completed self-coincidence (`relInfo = 0`, i.e. `p = q` by `relInfo_zero_iff`) is the fixed
    point the fold's self-blindness forbids — approached forever, never attained. -/
theorem kl_gap_never_reaches_coincidence {n : ℕ} (p q : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1) (hpq : p ≠ q)
    (lam t : Cut) :
    0 < coherenceGap (relInfo p q) lam t :=
  heat_death_never_reached (relInfo p q) lam t (gibbs_pos p q hp hq hsp hsq hpq)

/-- Re-export of the unique-coincidence fact (N375 `relInfo_zero_iff`): the completed
    self-coincidence `relInfo p q = 0` holds IFF `p = q` — a UNIQUE zero, no second coincidence to
    slide into. This is what makes "completed totalization = completed self-coincidence" a genuine
    identification, not a naming. -/
theorem coincidence_iff {n : ℕ} (p q : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1) :
    relInfo p q = 0 ↔ p = q :=
  relInfo_zero_iff p q hp hq hsp hsq

/-! ## ★★★ THE H5 CAPSTONE: the eternal approach, both faces. -/

/-- ★★★ THE FATE OF THE UNIVERSE — THE ETERNAL APPROACH. For a positive initial coherence gap and
    a positive relaxation rate, the fold's own exponential flow `g(t) = g₀·cutExp(−λ·t)`:
      (1) is STRICTLY POSITIVE at every finite `t` (`heat_death_never_reached`) — the completed
          state (heat death = completed self-coincidence) is NEVER reached;
      (2) is STRICTLY DECREASING in `t` (`gap_strictly_decreasing`) — the arrow of time, restated
          as monotone relaxation, DERIVED not posited;
      (3) has NONZERO velocity at every finite `t` (`fixed_point_unreachable`) — the flow never
          stops, so the fixed point (gap 0) is unreachable in finite time.
    The ending is always AHEAD, by theorem. The past is a BOUNDARY (banked `S_init = 0`); the
    future is an ASYMPTOTE — finite-past / infinite-future IS the arrow. All three legs are pure
    `Cut` facts; the eternal approach is a corollary of Born positivity (`cutExp_pos`, N174) + the
    analytic fold (`cutExp' = cutExp`, N369), the C6 engine at the cosmic scale — no second law,
    no assumed arrow. -/
theorem cosmic_fate_eternal_approach (g₀ lam t₁ t₂ : Cut)
    (hg : 0 < g₀) (hl : 0 < lam) (ht : t₁ < t₂) :
    (0 < coherenceGap g₀ lam t₁)
      ∧ (coherenceGap g₀ lam t₂ < coherenceGap g₀ lam t₁)
      ∧ (-lam * coherenceGap g₀ lam t₁ ≠ 0)
      ∧ ((-lam * coherenceGap g₀ lam t₁ = 0) ↔ (coherenceGap g₀ lam t₁ = 0)) :=
  ⟨heat_death_never_reached g₀ lam t₁ hg,
   gap_strictly_decreasing g₀ lam t₁ t₂ hg hl ht,
   fixed_point_unreachable g₀ lam t₁ hg hl,
   fixed_point_iff_gap_zero g₀ lam t₁ (ne_of_gt hl)⟩

/-! ## §W8 — non-vacuity tie for C408. -/

/-- W8 TIE (for C408): a concrete coherence gap is GENUINELY nonzero — `coherenceGap 1 1 1 ≠ 0`.
    The gap really stays positive; "heat death is reached in finite time (gap = 0)" is refuted. -/
theorem gap_concrete_ne_zero : coherenceGap 1 1 1 ≠ 0 :=
  gap_ne_zero 1 1 1 (by norm_num)

end

end Phys.Algebra
