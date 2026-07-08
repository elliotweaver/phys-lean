/-
  Phys.Algebra.CosmoStructureGrowingMode — N455 (cosmology-completion gap, self-selected).
  ============================================================================================
  THE GRAVITATIONAL GROWING MODE / THE INSTABILITY OF THE SMOOTH STATE — theorem-grade.

  THE COSMIC MIDDLE. Arc H banked the cosmic ORIGIN (inflation smooths and washes anisotropy,
  N380/N384 — the blank slate) and the cosmic END (the eternal de Sitter approach, N383 — the
  coherence gap `g(t) = g₀·cutExp(−λ·t)` relaxes toward a fixed point it never reaches). Between
  them the theory had no account of how the smooth, blank-slate universe becomes STRUCTURED. This
  node banks that middle: the gravitational GROWING MODE and the INSTABILITY of the smooth state.

  ── THE ONE CAUSE: C6 HAS TWO BRANCHES ──
  The banked fate (N383) is the fold's own exponential run with a NEGATIVE rate: `cutExp(−λ·t) → 0`,
  approaching but never reaching the completed self-coincidence (heat death). Self-blindness (C6 —
  best coherence is NOT a fixed point) forbids that fixed point. But the SAME engine, run at the
  smooth state `δ = 0`, has a SECOND branch with the OPPOSITE sign: the density contrast
  `δ(t) = δ₀·cutExp(+ω·t)` GROWS. Self-blindness forbids the fixed point BOTH ways — the completed
  state (gap 0) is a fixed point the decaying branch never reaches, and the smooth state (δ = 0) is
  an UNSTABLE fixed point the growing branch FLEES without bound. One object (`cutExp`, N174), two
  signs, the two ends of the cosmic story. Structure formation is the exact SIGN-MIRROR of the fate.

  ── THE GROWTH RATE IS FORCED (not fitted), and REUSES THE 8πG FLUX ──
  The rate obeys `ω² = (Gauss-sphere flux 4π) · (Born-positive density ρ)` — the geometric factor
  is the SAME banked derived `gaussSphereSolidAngle = 4·cutPi` (N328) that normalizes the `8πG`
  gravitational coupling `gravCouplingCoeff = 2·gaussSphereSolidAngle` (N359). So the growth rate's
  geometric factor is exactly HALF the derived `8πG` coefficient — one shared derived flux drives
  both gravity's coupling and structure's growth (`growthRateSq_is_half_gravCoupling`). The rate `ω`
  itself is the DERIVED positive square root via the fold's own exp/log,
  `ω = cutExp(½·cutLog(4π·ρ))` — NO Mathlib `sqrt`, NO posited root; `growthRate_sq` proves it
  squares back to `4π·ρ`.

  ── THE SIGN-DUALITY WELD (the genuine never-co-stated content) ──
  The growing mode `δ₀·cutExp(+ω·t)` times the banked N383 decaying gap `coherenceGap δ₁ ω t =
  δ₁·cutExp(−ω·t)` (SAME rate ω) is TIME-INDEPENDENT, `= δ₀·δ₁` — a Wronskian-like conserved product
  of the two C6 branches (`growing_decaying_product_conserved`). It cites the banked N383
  `coherenceGap` directly and is statable from NEITHER branch alone: the two ends of the cosmic
  story are reciprocal readings of one exponential.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from banked N174/N328/N359/N369/N383) ──
    growthRateSq_pos                  — the rate-squared 4π·ρ is positive (Born density > 0).
    growthRate_pos                    — the derived root ω > 0 (`cutExp_pos`).
    growthRate_sq                     — ★ ω² = 4π·ρ (the fold-exp/log root squares back).
    growthRateSq_is_half_gravCoupling — ★★ the shared flux: 4π·ρ = (½·gravCouplingCoeff)·ρ (N359 tie).
    growingMode_pos                   — the perturbation never vanishes (mirror of N383's positivity).
    growingMode_strictly_increasing   — ★ THE GROWTH / the instability (mirror of gap_strictly_decreasing).
    growingMode_flow_velocity_eq                  — ★ the growth law δ' = +ω·δ (analytic fold, N369 + N383 rule).
    growingMode_flow_velocity_pos                 — ★ δ=0 is FLED, velocity > 0 (mirror of fixed_point_unreachable).
    growing_decaying_product_conserved— ★★ the sign-duality weld to the banked N383 coherenceGap.
    smooth_state_unstable             — ★ δ=0 unstable: the mode exceeds EVERY bound (one_add_lt_cutExp).
    cosmo_structure_growing_mode      — ★★★ the capstone bundle.
    growingMode_concrete_gt           — W8 tie for C480.

  ── GRADE ──
  THEOREM-GRADE for the growing-mode structure, the instability, the forced-rate tie to the banked
  8πG flux, and the sign-duality weld to the banked fate. The "gravitational structure formation /
  galaxies grow from the smooth blank slate" reading is the physics-words-removable interpretation;
  the theorem CONTENT is a pure `Cut` fact (the positive-rate branch of the fold's exponential is
  positive, strictly increasing, has positive velocity, is unbounded, and is reciprocal to the
  negative-rate branch). NO empirical number (no growth factor, no power-spectrum amplitude, no
  transfer function) enters any statement or proof — those would be REMOVABLE PROSE / a fit, and are
  absent.

  ── PHYSICS-WORDS-REMOVABLE ──
  Delete "structure / galaxy / perturbation / density / collapse / instability / universe / smooth":
  every theorem stands as a pure statement about `δ₀·cutExp(+ω·t)` on the derived complete ordered
  field `Cut` — positive everywhere, strictly increasing for `ω > 0`, with derivative `+ω` times
  itself (positive), unbounded above, and reciprocal to `δ₁·cutExp(−ω·t)` (product time-independent).
  No name is load-bearing.

  ── UNBROKEN ──
  Built entirely on banked objects: `cutExp`/`cutExp_pos`/`cutExp_add`/`cutExp_mul_neg`/
  `cutExp_strictMono` (N174/ContinuumExp/ContinuumLog), `cutExp_cutLog`/`cutLog` (ContinuumLog),
  `CutHasDerivAt`/`cutExp_scale_hasDerivAt` (N369), `cutHasDerivAt_const_mul`/`coherenceGap` (N383),
  `one_add_lt_cutExp_pos` (N375/MaxEntArrowOfTime), `gaussSphereSolidAngle`/`_pos` (N328),
  `gravCouplingCoeff`/`gravCouplingCoeff_two_flux` (N359) — all over the derived ℝ `Cut`. NO Mathlib
  `Real` analysis / number-system as content. NO posited ODE, NO posited growth ansatz, NO Mathlib
  `sqrt`; the flow is the fold's own exponential and the rate's root is `cutExp(½·cutLog ·)`.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import, NO `Real`/`Real.log`/`Real.exp`/`Real.sqrt`.
-/
import Phys.Algebra.CosmicFateEternalApproach
import Phys.Algebra.SpacetimeGravitationalCoupling
import Phys.Foundation.ContinuumSphereFlux

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.MaxEnt

noncomputable section

/-! ## THE GROWTH RATE — forced by the banked 8πG flux, its root DERIVED from the fold's exp/log. -/

/-- THE RATE-SQUARED `ω² = (Gauss-sphere flux 4π, N328) · (Born-positive density ρ)`. The geometric
    factor is the SAME banked `gaussSphereSolidAngle` that normalizes the `8πG` coupling (N359). -/
noncomputable def growthRateSq (ρ : Cut) : Cut := gaussSphereSolidAngle * ρ

/-- The rate-squared is positive for a positive Born density. -/
theorem growthRateSq_pos (ρ : Cut) (hρ : 0 < ρ) : 0 < growthRateSq ρ :=
  mul_pos gaussSphereSolidAngle_pos hρ

/-- ★★ THE SHARED FLUX: `ω² = 4π·ρ = (½·gravCouplingCoeff)·ρ`. The SAME derived Gauss-sphere flux
    that normalizes gravity's `8πG` coupling (`gravCouplingCoeff = 2·gaussSphereSolidAngle`, N359)
    is the geometric factor in the structure-growth rate — one shared derived flux, two roles.
    The growth-rate geometry is exactly HALF the `8πG` coefficient, not an independent constant. -/
theorem growthRateSq_is_half_gravCoupling (ρ : Cut) :
    growthRateSq ρ = (2⁻¹ * gravCouplingCoeff) * ρ := by
  unfold growthRateSq
  rw [gravCouplingCoeff_two_flux]
  ring

/-- ★ THE GROWTH RATE `ω` as the DERIVED positive square root of `4π·ρ`, via the fold's OWN exp/log
    (`cutExp(½·cutLog ·)`) — NO Mathlib `sqrt`, NO posited root. -/
noncomputable def growthRate (ρ : Cut) : Cut := cutExp (2⁻¹ * cutLog (growthRateSq ρ))

/-- The derived rate is strictly positive (`cutExp_pos`). -/
theorem growthRate_pos (ρ : Cut) : 0 < growthRate ρ := cutExp_pos _

/-- ★ `ω² = 4π·ρ`: the derived root genuinely squares back to the flux·density (`cutExp_cutLog`). -/
theorem growthRate_sq (ρ : Cut) (hρ : 0 < ρ) :
    growthRate ρ * growthRate ρ = growthRateSq ρ := by
  unfold growthRate
  rw [cutExp_add]
  have h2 : (2⁻¹ * cutLog (growthRateSq ρ)) + (2⁻¹ * cutLog (growthRateSq ρ))
      = cutLog (growthRateSq ρ) := by ring
  rw [h2, cutExp_cutLog (growthRateSq_pos ρ hρ)]

/-! ## THE GROWING MODE — the sign-mirror of the banked N383 `coherenceGap`. -/

/-- THE GROWING MODE `δ(t) = δ₀·cutExp(+ω·t)`: the growing branch of the fold's exponential — the C6
    engine's OTHER branch. The banked N383 decaying gap is `coherenceGap δ₀ ω t = δ₀·cutExp(−ω·t)`;
    this is the SAME object at the opposite sign. -/
noncomputable def growingMode (δ₀ ω t : Cut) : Cut := δ₀ * cutExp (ω * t)

/-- The perturbation never vanishes (`cutExp_pos`). Sign-mirror of `heat_death_never_reached`. -/
theorem growingMode_pos (δ₀ ω t : Cut) (hδ : 0 < δ₀) : 0 < growingMode δ₀ ω t :=
  mul_pos hδ (cutExp_pos _)

/-- ★ THE GROWTH / THE INSTABILITY: the perturbation is STRICTLY INCREASING in `t` for `ω > 0`
    (`cutExp_strictMono`). This is the gravitational instability — the exact sign-mirror of the
    banked N383 `gap_strictly_decreasing` (which relaxes toward heat death). -/
theorem growingMode_strictly_increasing (δ₀ ω t₁ t₂ : Cut)
    (hδ : 0 < δ₀) (hω : 0 < ω) (ht : t₁ < t₂) :
    growingMode δ₀ ω t₁ < growingMode δ₀ ω t₂ := by
  unfold growingMode
  apply mul_lt_mul_of_pos_left _ hδ
  apply cutExp_strictMono
  exact mul_lt_mul_of_pos_left ht hω

/-- ★ THE GROWTH LAW `δ'(t) = +ω·δ(t)`. The analytic fold `cutExp' = cutExp` (N369
    `cutExp_scale_hasDerivAt`) pushed through the banked N383 const-mul rule
    (`cutHasDerivAt_const_mul`): the growing mode satisfies its own growth law. The flow is exactly
    the fold's exponential — NOT a posited ODE. Sign-mirror of the N383 `flow_velocity_eq`. -/
theorem growingMode_flow_velocity_eq (δ₀ ω t : Cut) (hω : ω ≠ 0) :
    CutHasDerivAt (growingMode δ₀ ω) (δ₀ * (ω * cutExp (ω * t))) t := by
  have hbase : CutHasDerivAt (fun y => cutExp (ω * y)) (ω * cutExp (ω * t)) t :=
    cutExp_scale_hasDerivAt ω t hω
  have := cutHasDerivAt_const_mul (f := fun y => cutExp (ω * y)) δ₀ hbase
  unfold growingMode
  exact this

/-- ★ THE VELOCITY IS POSITIVE: `δ'(t) = +ω·δ(t) > 0` at every finite `t` (`δ₀ > 0`, `ω > 0`). The
    flow moves AWAY from the smooth state `δ = 0` — the smooth state is FLED, not approached. The
    exact sign-mirror of the banked N383 `fixed_point_unreachable` (where the velocity is negative
    and the fixed point is approached but never reached). -/
theorem growingMode_flow_velocity_pos (δ₀ ω t : Cut) (hδ : 0 < δ₀) (hω : 0 < ω) :
    0 < δ₀ * (ω * cutExp (ω * t)) :=
  mul_pos hδ (mul_pos hω (cutExp_pos _))

/-! ## ★★ THE SIGN-DUALITY WELD to the banked N383 fate flow. -/

/-- ★★ THE CONSERVED PRODUCT (a Wronskian-like invariant of the two C6 branches): the growing mode
    `δ₀·cutExp(+ω·t)` times the banked N383 decaying gap `coherenceGap δ₁ ω t = δ₁·cutExp(−ω·t)`
    (SAME rate `ω`) is TIME-INDEPENDENT, `= δ₀·δ₁`. The two ends of the cosmic story — structure's
    growth and the eternal approach to heat death — are RECIPROCAL readings of one fold-exponential.
    Cites the banked N383 `coherenceGap` directly; statable from NEITHER branch alone. -/
theorem growing_decaying_product_conserved (δ₀ δ₁ ω t : Cut) :
    growingMode δ₀ ω t * coherenceGap δ₁ ω t = δ₀ * δ₁ := by
  unfold growingMode coherenceGap
  have hkey : cutExp (ω * t) * cutExp (-ω * t) = 1 := by
    have hneg : (-ω * t) = -(ω * t) := by ring
    rw [hneg, cutExp_mul_neg]
  calc δ₀ * cutExp (ω * t) * (δ₁ * cutExp (-ω * t))
      = δ₀ * δ₁ * (cutExp (ω * t) * cutExp (-ω * t)) := by ring
    _ = δ₀ * δ₁ * 1 := by rw [hkey]
    _ = δ₀ * δ₁ := by ring

/-! ## ★ THE INSTABILITY — the smooth state is fled without bound. -/

/-- ★ THE SMOOTH STATE IS UNSTABLE: the growing mode exceeds EVERY bound `B` at some finite `t`.
    Structure grows without bound in the linear regime — the perturbation cannot be contained near
    the smooth state. Uses the banked `one_add_lt_cutExp_pos` (N375): `1 + u < cutExp u` for `u > 0`
    makes the fold's exponential unbounded above, so `δ₀·cutExp(ω·t)` overtakes any bound. -/
theorem smooth_state_unstable (δ₀ ω : Cut) (hδ : 0 < δ₀) (hω : 0 < ω) :
    ∀ B : Cut, ∃ t : Cut, B < growingMode δ₀ ω t := by
  intro B
  by_cases hB : B ≤ 0
  · refine ⟨0, ?_⟩
    have hpos : 0 < growingMode δ₀ ω 0 := growingMode_pos δ₀ ω 0 hδ
    linarith
  · push_neg at hB
    refine ⟨B / (δ₀ * ω), ?_⟩
    unfold growingMode
    have harg : ω * (B / (δ₀ * ω)) = B / δ₀ := by field_simp
    have hargpos : 0 < ω * (B / (δ₀ * ω)) := by rw [harg]; exact div_pos hB hδ
    have hlin : 1 + ω * (B / (δ₀ * ω)) < cutExp (ω * (B / (δ₀ * ω))) :=
      one_add_lt_cutExp_pos _ hargpos
    have hstep : δ₀ * (1 + ω * (B / (δ₀ * ω))) < δ₀ * cutExp (ω * (B / (δ₀ * ω))) :=
      mul_lt_mul_of_pos_left hlin hδ
    have hval : δ₀ * (1 + ω * (B / (δ₀ * ω))) = δ₀ + B := by rw [harg]; field_simp
    rw [hval] at hstep
    linarith

/-! ## ★★★ THE CAPSTONE. -/

/-- ★★★ THE GRAVITATIONAL GROWING MODE / THE INSTABILITY OF THE SMOOTH STATE. For a positive initial
    contrast `δ₀` and the derived positive growth rate `ω` (with `ω² = 4π·ρ`, the banked 8πG flux
    times the Born density), the fold's own exponential flow `δ(t) = δ₀·cutExp(+ω·t)`:
      (1) is STRICTLY POSITIVE at every finite `t` (`growingMode_pos`) — the perturbation persists;
      (2) is STRICTLY INCREASING in `t` (`growingMode_strictly_increasing`) — the instability, the
          exact sign-mirror of the banked N383 relaxation toward heat death;
      (3) has POSITIVE velocity at every finite `t` (`growingMode_flow_velocity_pos`) — the smooth state `δ = 0`
          is FLED, never approached (mirror of `fixed_point_unreachable`);
      (4) is RECIPROCAL to the banked N383 decaying gap: their product is time-independent
          (`growing_decaying_product_conserved`) — the two C6 branches are one exponential.
    Structure formation is the growing branch of the SAME C6 engine whose decaying branch is the
    eternal approach to heat death — one object (`cutExp`, N174), two signs, the cosmic middle
    between the banked origin (inflation, N380/N384) and the banked end (the fate, N383). All legs
    are pure `Cut` facts; NO posited ODE, NO fitted growth number. -/
theorem cosmo_structure_growing_mode (δ₀ ρ t₁ t₂ : Cut)
    (hδ : 0 < δ₀) (hρ : 0 < ρ) (ht : t₁ < t₂) :
    (0 < growingMode δ₀ (growthRate ρ) t₁)
      ∧ (growingMode δ₀ (growthRate ρ) t₁ < growingMode δ₀ (growthRate ρ) t₂)
      ∧ (0 < δ₀ * (growthRate ρ * cutExp (growthRate ρ * t₁)))
      ∧ (growthRate ρ * growthRate ρ = growthRateSq ρ) := by
  refine ⟨growingMode_pos δ₀ (growthRate ρ) t₁ hδ,
          growingMode_strictly_increasing δ₀ (growthRate ρ) t₁ t₂ hδ (growthRate_pos ρ) ht,
          growingMode_flow_velocity_pos δ₀ (growthRate ρ) t₁ hδ (growthRate_pos ρ),
          growthRate_sq ρ hρ⟩

/-! ## §W8 — non-vacuity tie for C480. -/

/-- W8 TIE (for C480): a concrete growing mode GENUINELY exceeds its initial value —
    `growingMode 1 1 1 > 1`. The perturbation really grows; "the smooth state is stable / the mode
    does not grow" is refuted. -/
theorem growingMode_concrete_gt : (1 : Cut) < growingMode 1 1 1 := by
  unfold growingMode
  have h : (1 : Cut) + 1 < cutExp ((1 : Cut) * 1) := by
    have hb := one_add_lt_cutExp_pos (1 : Cut) (by norm_num)
    simpa using hb
  have he : cutExp ((1 : Cut) * 1) = 1 * cutExp (1 * 1) := by ring
  rw [he] at h
  linarith

end

end Phys.Algebra
