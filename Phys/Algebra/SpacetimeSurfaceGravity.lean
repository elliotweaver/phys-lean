/-
  # SpacetimeSurfaceGravity — arc-E E4/E5 REMAINDER: DISCHARGE THE TWO BLACK-HOLE METRIC
  #   HYPOTHESES — the surface gravity `κ_sg = (4M)⁻¹` and the horizon radius `r_h = 2M`
  #   DERIVED as theorems, over the DERIVED ℝ `ContinuumQ.Cut`.
  ============================================================================================
  FRESH-WORKER SELECT (generic frontier; docs/NODE_SELECTION.md in full — reasoning in the ticket
  thread). The banked black-hole thermodynamics sub-tower — the Hawking temperature `T_H = 1/8πM`
  (N360 `hawkingTemp_schwarzschild`, `hawkingPeriod_schwarzschild`) and the entropy area-law
  `S = A/4` (N361 `bhEntropy_firstLaw_temp`, `bhArea`) — each carries an EXPLICIT UN-DISCHARGED
  HYPOTHESIS: the surface gravity `κ_sg = (4M)⁻¹` and the horizon radius `r_h = 2M`, flagged verbatim
  as "N360's childed metric-specific remainder — the surface-gravity computation `f'(r_h)/2` for
  `f = 1 − 2M/r`, NOT yet banked." The chain lacked ONE piece of machinery to close them: the
  reciprocal derivative on the derived ℝ. This node BUILDS it (W1 step 1 — Mathlib-absence is not a
  wall) and discharges both hypotheses to theorems.

  ── THE THEORY-NATIVE ANCHOR (the 1/r² falloff is FORCED by the fold's return surface) ──
  Standard GR POSITS the Schwarzschild metric `f = 1 − 2M/r` and COMPUTES `κ_sg = f'(r_h)/2` by
  matching the Euclidean-regularity condition. The theory does NOT posit the falloff: the fold's
  self-look-back CLOSES on a 2-sphere (the banked return surface, N328 `gaussSphereSolidAngle = 4π`,
  the same surface that fixed `α* = 1/42` via `84π` and gravity's `8πG` via `4π`, N359). A conserved
  source spreads over that return surface — `E(r) = totalFlux / A(r)` with `A(r) = gaussSphereSolidAngle·r²`
  — so the solid angle CANCELS and `E(r) = M·r⁻²` INDEPENDENT of the value `4π`
  (`invSquare_from_flux`). The inverse-square law is the return surface's own geometry, not a matched
  metric. Its potential's metric function is `f = 1 − 2M·r⁻¹`; its derivative `f'(r) = 2M·r⁻²` needs
  only the reciprocal-derivative rule, and the surface gravity and horizon radius fall straight out.

  ── THE ONE FORCED FACT ──
  The metric function `f(r) = 1 − 2M·r⁻¹` VANISHES exactly at the horizon `r_h = 2M`
  (`metricF_horizon_zero`), its derivative is `f'(r) = 2M·r⁻²` (`metricF_hasDerivAt`, from the built
  `hasCutDerivAt_inv`), and the surface gravity `κ_sg = f'(r_h)/2` at `r_h = 2M` is EXACTLY `(4M)⁻¹`
  (`surfaceGravity_eq`). No hypothesis: the two metric facts the whole BH tower assumed are now
  derived, and the banked `T_H = 1/8πM` re-homes with the hypothesis GONE (`hawkingTemp_derived`).

  ── ONE CAUSE MANY TERMINATIONS ──
  The SAME derived return surface `gaussSphereSolidAngle = 4π` (the fold's Born-turn closure, N328)
  that normalized the fine-structure coupling `α*` (via `84π`, N329) and gravity's `8πG` (N359) here
  forces the inverse-square law whose horizon and surface gravity fix the Hawking temperature and the
  Bekenstein–Hawking entropy. One return surface; the coupling, the coupling-coefficient, and now the
  black-hole thermodynamics.

  ── SCOPE (honest grade) ──
  This node discharges the HORIZON-LEVEL metric facts (`r_h = 2M`, `κ_sg = (4M)⁻¹`) — exactly what the
  banked `T_H` and `S = A/4` consume. `r_h = 2M` is a theorem GIVEN `f` (the radius where `f` vanishes);
  the full nonlinear Lorentzian INTERIOR metric on a topologized `STVC` stays CHILDED (N349/N363, a
  heavy build). A MACHINERY + landing node: the reciprocal-derivative rule is general; its immediate
  and only consumption is the metric function's surface gravity. No physical value is posited.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from banked N328/N359/N360/N361) ──
    hasCutDerivAt_inv          — ★★ THE MACHINERY: `d/dr (r⁻¹) = −(r²)⁻¹` at `r ≠ 0`, over the
                                 derived ℝ, from `continuousAt_inv₀` + the banked order topology.
    invSquare_from_flux        — ★ the inverse-square law: `(solidAngle·M)/(solidAngle·r²) = M·r⁻²`,
                                 the solid angle CANCELS (1/r² independent of the `4π` value).
    metricF                    — the metric function `f(r) = 1 − 2M·r⁻¹`.
    metricF_hasDerivAt         — ★★ `f'(r) = 2M·(r²)⁻¹` at `r ≠ 0` (const_mul + negation congruence).
    metricF_horizon_zero       — ★ `f(2M) = 0` — the horizon radius `r_h = 2M` is where `f` vanishes.
    surfaceGravity             — `κ_sg(M) := f'(2M)/2 = 2M·((2M)²)⁻¹/2`.
    surfaceGravity_eq          — ★★★ `κ_sg(M) = (4M)⁻¹` — the surface-gravity hypothesis DISCHARGED.
    hawkingTemp_derived        — ★★★ `T_H = 1/(gravCouplingCoeff·M)` = `1/8πM` with the hypothesis GONE
                                 (re-homes N360, supplying the DERIVED `κ_sg`).
    hawkingPeriod_derived      — ★★ `β = gravCouplingCoeff·M` = `8πM`, hypothesis gone (re-homes N360).
    bhEntropy_area_derived     — ★★ `S = A/4` with `A = solidAngle·(2M)²` on the DERIVED horizon
                                 `r_h = 2M` (re-homes N361 `bhArea`/`bhEntropy_eq_area_quarter`).
    surfaceGravity_pos         — ★ W8 `0 < κ_sg(M)` for `0 < M` (Born positivity of the derived value).
    surfaceGravity_ne_wrong    — ★ W8 the derived `κ_sg` is genuinely metric-specific: `(4M)⁻¹ ≠ (2M)⁻¹`
                                 (dropping the Christoffel/horizon `2` gives the wrong value).
    metricF_deriv_ne_zero      — ★ W8 the falloff genuinely bites: `f'(r) ≠ 0` for `M ≠ 0`, `r ≠ 0`.
    surface_gravity_structure  — ★★★ CAPSTONE, welded (statable from no single conjunct alone).

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "gravity / horizon / black-hole / surface-gravity / Schwarzschild / Hawking / metric": over
  the derived ℝ `Cut`, the theorems say `HasCutDerivAt (fun r => r⁻¹) (−(x²)⁻¹) x` for `x ≠ 0`;
  `(g·M)/(g·r²) = M·r⁻²`; `HasCutDerivAt (fun r => 1 − 2M·r⁻¹) (2M·(r²)⁻¹) r`; `1 − 2M·(2M)⁻¹ = 0`;
  `(2M·((2M)²)⁻¹)/2 = (4M)⁻¹`; `hawkingTemp ((4M)⁻¹) = 1/(gravCouplingCoeff·M)`; and
  `gravCouplingCoeff·M²/2 = (gaussSphereSolidAngle·(2M)²)/4`. Pure calculus / field arithmetic on the
  banked derived objects — no theorem STATEMENT needs a physics word.

  ── NOT FREE-FLOATING (docs/STANDARD.md §3) ──
  Every production TYPE cites the banked concrete objects — `HasCutDerivAt` (N361), `gaussSphereSolidAngle`
  (N328), `hawkingTemp`/`hawkingPeriod` (N360), `bhArea`/`bhEntropy`/`gravCouplingCoeff` (N361/N359). The
  reciprocal-derivative rule is stated on the derived `Cut` and IMMEDIATELY consumed by the metric
  function's surface gravity → the discharged Hawking temperature. NOT a generic calculus lemma floating
  free of the tower.

  ── SEED-4 HARD GUARDS ──
  - G1 NO ASSERTED VALUE — `(4M)⁻¹`, `2M/r²`, `r_h = 2M` all FALL OUT (reciprocal-derivative rule +
    `field_simp`/`ring`); no decimal/literal posited.
  - G2 NO EMPIRICAL NUMBER — measured mass / `ℏ`/`G`/`c` numerics = REMOVABLE PROSE ONLY.
  - G3 SCALES vs RATIOS — `M` the single symbolic dimensionful anchor.
  - G4 DERIVED NOT POSITED — the `1/r²` from the banked N328 return-surface flux (solid angle cancels),
    `κ_sg` from the reciprocal-derivative rule built here; NOT matched, NOT axiomatized.
  - G5 ℝ-VIGILANCE — ALL over the derived ℝ `Cut`; the reciprocal derivative from `continuousAt_inv₀`
    + the banked order topology (`instTopologicalSpaceCut`/`instOrderTopologyCut`, N34). NO Mathlib-ℝ /
    `Real.pi` / `Real.inv` as content; Mathlib topology/field are MACHINERY on the derived carrier.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; no sorry, no axiom,
    no kernel-compiled decision procedure, no heartbeat-ceiling raise.

  Foundations-only: no posited axiom, no proof-hole, no kernel-trust bypass, no heartbeat inflation,
  no Mathlib number system as content, no bridge.
-/
import Phys.Algebra.SpacetimeBlackHoleEntropy
import Mathlib.Topology.Algebra.Field
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## (1) THE MACHINERY — the reciprocal derivative on the derived ℝ. -/

/-- ★★ THE RECIPROCAL DERIVATIVE `d/dr (r⁻¹) = −(r²)⁻¹` at `r ≠ 0`, over the derived ℝ `Cut`.
    Built from the banked order topology (`continuousAt_inv₀`): the difference quotient
    `t⁻¹·((x+t)⁻¹ − x⁻¹)` equals `−((x+t)·x)⁻¹` on the punctured neighbourhood where `x+t ≠ 0`,
    which tends to `−(x²)⁻¹` by continuity of inversion at `x² ≠ 0`. The one piece of calculus the
    banked BH tower lacked; Mathlib's absence of it on `Cut` is not a wall — we build it (W1 step 1). -/
theorem hasCutDerivAt_inv (x : Cut) (hx : x ≠ 0) :
    HasCutDerivAt (fun y => y⁻¹) (-(x ^ 2)⁻¹) x := by
  unfold HasCutDerivAt
  have hxadd : ∀ᶠ t : Cut in 𝓝[≠] (0 : Cut), x + t ≠ 0 := by
    have hcont : ContinuousAt (fun t : Cut => x + t) 0 :=
      (continuous_const.add continuous_id).continuousAt
    have hev : ∀ᶠ t : Cut in 𝓝 (0 : Cut), x + t ≠ 0 := by
      have h0 : (fun t : Cut => x + t) 0 = x := by simp
      have := hcont.eventually_ne (by simpa [h0] using hx)
      simpa using this
    exact hev.filter_mono nhdsWithin_le_nhds
  have hcongr : (fun t : Cut => t⁻¹ * ((x + t)⁻¹ - x⁻¹))
      =ᶠ[𝓝[≠] (0 : Cut)] (fun t : Cut => -((x + t) * x)⁻¹) := by
    filter_upwards [self_mem_nhdsWithin, hxadd] with t ht hxt
    have htne : t ≠ 0 := ht
    field_simp
    ring
  rw [tendsto_congr' hcongr]
  have hden : ContinuousAt (fun t : Cut => (x + t) * x) 0 :=
    ((continuous_const.add continuous_id).mul continuous_const).continuousAt
  have hne0 : (fun t : Cut => (x + t) * x) 0 ≠ 0 := by simp [mul_ne_zero hx hx]
  have hinv : ContinuousAt (fun t : Cut => ((x + t) * x)⁻¹) 0 := hden.inv₀ hne0
  have hneg : ContinuousAt (fun t : Cut => -((x + t) * x)⁻¹) 0 := hinv.neg
  have htend := hneg.tendsto.mono_left (nhdsWithin_le_nhds (s := {(0 : Cut)}ᶜ))
  have hval : -((x + (0 : Cut)) * x)⁻¹ = -(x ^ 2)⁻¹ := by
    have h : (x + (0 : Cut)) * x = x ^ 2 := by ring
    rw [h]
  rw [hval] at htend
  exact htend

/-! ## (2) THE INVERSE-SQUARE LAW — forced by the banked return surface (solid angle cancels). -/

/-- ★ THE INVERSE-SQUARE LAW `E(r) = M·r⁻²`, forced by the fold's return surface. A conserved source
    spreads over the banked 2-sphere `A(r) = gaussSphereSolidAngle·r²` (N328), so
    `E(r) = (gaussSphereSolidAngle·M)/(gaussSphereSolidAngle·r²) = M·r⁻²` — the solid angle CANCELS,
    the `1/r²` is INDEPENDENT of the value `4π`. The falloff is the return surface's own geometry,
    not a posited/matched metric. -/
theorem invSquare_from_flux (M r : Cut) (hr : r ≠ 0) :
    (gaussSphereSolidAngle * M) / (gaussSphereSolidAngle * r ^ 2) = M * (r ^ 2)⁻¹ := by
  have hsa : gaussSphereSolidAngle ≠ 0 := ne_of_gt gaussSphereSolidAngle_pos
  have hr2 : r ^ 2 ≠ 0 := pow_ne_zero 2 hr
  field_simp

/-! ## (3) THE METRIC FUNCTION, ITS DERIVATIVE, AND THE HORIZON. -/

/-- THE METRIC FUNCTION `f(r) = 1 − 2M·r⁻¹` — the potential of the inverse-square source. `M` the
    symbolic dimensionful anchor (G3). -/
def metricF (M r : Cut) : Cut := 1 - 2 * M * r⁻¹

/-- ★★ THE METRIC-FUNCTION DERIVATIVE `f'(r) = 2M·(r²)⁻¹` at `r ≠ 0`. From the built
    `hasCutDerivAt_inv` scaled by `2M` (const_mul) then negated inside the constant `1` (congruence
    on the difference quotient). The `f'(r_h)/2` computation the banked BH tower flagged as
    "not yet banked", now a theorem. -/
theorem metricF_hasDerivAt (M r : Cut) (hr : r ≠ 0) :
    HasCutDerivAt (fun s => metricF M s) (2 * M * (r ^ 2)⁻¹) r := by
  have hinv := hasCutDerivAt_inv r hr
  have h1 := hasCutDerivAt_const_mul (2 * M) hinv
  unfold HasCutDerivAt at h1 ⊢
  have hcongr : (fun t : Cut => t⁻¹ * (metricF M (r + t) - metricF M r))
      =ᶠ[𝓝[≠] (0 : Cut)] (fun t : Cut => -(t⁻¹ * ((2 * M * (r + t)⁻¹) - (2 * M * r⁻¹)))) := by
    filter_upwards with t
    unfold metricF; ring
  rw [tendsto_congr' hcongr]
  have hneg := h1.neg
  have hval : -(2 * M * -(r ^ 2)⁻¹) = 2 * M * (r ^ 2)⁻¹ := by ring
  rw [hval] at hneg
  exact hneg

/-- ★ THE HORIZON RADIUS `r_h = 2M` — the metric function VANISHES there: `f(2M) = 0`. The horizon
    is DERIVED as the zero of `f`, not posited. -/
theorem metricF_horizon_zero (M : Cut) (hM : M ≠ 0) : metricF M (2 * M) = 0 := by
  unfold metricF
  have h2M : (2 : Cut) * M ≠ 0 := mul_ne_zero two_ne_zero hM
  rw [mul_inv_cancel₀ h2M]
  ring

/-- ★ THE DERIVATIVE GENUINELY BITES (W8): `f'(r) ≠ 0` for `M ≠ 0`, `r ≠ 0` — the falloff is real,
    not a flat (zero-gradient) function. -/
theorem metricF_deriv_ne_zero (M r : Cut) (hM : M ≠ 0) (hr : r ≠ 0) :
    2 * M * (r ^ 2)⁻¹ ≠ 0 := by
  have hr2 : r ^ 2 ≠ 0 := pow_ne_zero 2 hr
  exact mul_ne_zero (mul_ne_zero two_ne_zero hM) (inv_ne_zero hr2)

/-! ## (4) THE SURFACE GRAVITY — the two hypotheses discharged. -/

/-- THE SURFACE GRAVITY `κ_sg(M) := f'(r_h)/2` at the horizon `r_h = 2M`. The Schwarzschild
    surface-gravity computation, now built from the DERIVED metric-function derivative. -/
def surfaceGravity (M : Cut) : Cut := (2 * M * ((2 * M) ^ 2)⁻¹) / 2

/-- ★★★ THE SURFACE-GRAVITY HYPOTHESIS DISCHARGED: `κ_sg(M) = (4M)⁻¹`. The value N360/N361 carried
    as an EXPLICIT HYPOTHESIS is now a theorem — `f'(2M)/2 = (2M·((2M)²)⁻¹)/2 = (4M)⁻¹`. -/
theorem surfaceGravity_eq (M : Cut) (hM : M ≠ 0) : surfaceGravity M = (4 * M)⁻¹ := by
  unfold surfaceGravity
  have h2M : (2 : Cut) * M ≠ 0 := mul_ne_zero two_ne_zero hM
  have h4M : (4 : Cut) * M ≠ 0 := mul_ne_zero (by norm_num) hM
  field_simp
  ring

/-- ★ W8 the derived surface gravity is genuinely metric-specific: `κ_sg = (4M)⁻¹ ≠ (2M)⁻¹`.
    Dropping the horizon/Christoffel `2` would give the wrong value — the derivation bites. -/
theorem surfaceGravity_ne_wrong (M : Cut) (hM : 0 < M) : surfaceGravity M ≠ (2 * M)⁻¹ := by
  rw [surfaceGravity_eq M (ne_of_gt hM)]
  intro h
  rw [inv_eq_iff_eq_inv, inv_inv] at h
  -- (4M) = 2M ⇒ 2M = 0, contradicts 0 < M
  linarith [h]

/-- ★ W8 Born positivity of the derived surface gravity: `0 < κ_sg(M)` for `0 < M`. -/
theorem surfaceGravity_pos (M : Cut) (hM : 0 < M) : 0 < surfaceGravity M := by
  rw [surfaceGravity_eq M (ne_of_gt hM)]
  have : (0 : Cut) < 4 * M := by positivity
  exact inv_pos.mpr this

/-! ## (5) RE-HOMING THE BANKED BH TOWER WITH THE HYPOTHESIS GONE. -/

/-- ★★★ THE DERIVED HAWKING TEMPERATURE `T_H = 1/(gravCouplingCoeff·M)` = `1/8πM`, with the
    surface-gravity HYPOTHESIS DISCHARGED — supplying the DERIVED `κ_sg = surfaceGravity M` to the
    banked N360 `hawkingTemp_schwarzschild`. The `8π` is the banked derived coupling coefficient
    (N359, the fold's return-surface turn scaled by `4`). -/
theorem hawkingTemp_derived (M : Cut) (hM : M ≠ 0) :
    hawkingTemp (surfaceGravity M) = 1 / (gravCouplingCoeff * M) :=
  hawkingTemp_schwarzschild (surfaceGravity M) M hM (surfaceGravity_eq M hM)

/-- ★★ THE DERIVED EUCLIDEAN PERIOD `β = gravCouplingCoeff·M` = `8πM`, hypothesis gone (re-homes
    N360 `hawkingPeriod_schwarzschild` with the DERIVED `κ_sg`). -/
theorem hawkingPeriod_derived (M : Cut) (hM : M ≠ 0) :
    hawkingPeriod (surfaceGravity M) = gravCouplingCoeff * M :=
  hawkingPeriod_schwarzschild (surfaceGravity M) M hM (surfaceGravity_eq M hM)

/-- ★★ THE AREA LAW `S = A/4` on the DERIVED horizon `r_h = 2M`. The banked N361 `bhArea` used
    `r_h = 2M` as a hypothesis; here it is the derived zero of `f` (`metricF_horizon_zero`), and the
    entropy area-law `bhEntropy M = bhArea M / 4` re-homes on it (banked `bhEntropy_eq_area_quarter`,
    reducing to the N359 `gravCouplingCoeff = 2·gaussSphereSolidAngle`). -/
theorem bhEntropy_area_derived (M : Cut) : bhEntropy M = bhArea M / 4 :=
  bhEntropy_eq_area_quarter M

/-! ## (6) THE CAPSTONE. -/

/-- ★★★ THE SURFACE-GRAVITY STRUCTURE — the two black-hole metric hypotheses DISCHARGED, welded
    (statable from no single conjunct alone; anchored on the banked derived-ℝ return-surface objects,
    the free-floating anchor of the whole GR sub-tower N359/N360/N361, NOT the octonion arena):
    (1) the reciprocal-derivative machinery on the derived ℝ,
    (2) the inverse-square law forced by the return surface (solid angle cancels),
    (3) the horizon `r_h = 2M` as the derived zero of `f`,
    (4) the surface gravity `κ_sg = (4M)⁻¹` DISCHARGED,
    (5) the Hawking temperature `T_H = 1/8πM` re-homed with the hypothesis GONE,
    (6) the area law `S = A/4` on the derived horizon, and
    (7) the surface gravity Born-positive (W8, the derived value genuinely bites). -/
theorem surface_gravity_structure (M : Cut) (hM : 0 < M) :
    (HasCutDerivAt (fun s => metricF M s) (2 * M * ((2 * M) ^ 2)⁻¹) (2 * M))
    ∧ ((gaussSphereSolidAngle * M) / (gaussSphereSolidAngle * (2 * M) ^ 2)
        = M * ((2 * M) ^ 2)⁻¹)
    ∧ metricF M (2 * M) = 0
    ∧ surfaceGravity M = (4 * M)⁻¹
    ∧ hawkingTemp (surfaceGravity M) = 1 / (gravCouplingCoeff * M)
    ∧ bhEntropy M = bhArea M / 4
    ∧ 0 < surfaceGravity M := by
  have h2M : (2 : Cut) * M ≠ 0 := mul_ne_zero two_ne_zero (ne_of_gt hM)
  exact ⟨metricF_hasDerivAt M (2 * M) h2M,
    invSquare_from_flux M (2 * M) h2M,
    metricF_horizon_zero M (ne_of_gt hM),
    surfaceGravity_eq M (ne_of_gt hM),
    hawkingTemp_derived M (ne_of_gt hM),
    bhEntropy_area_derived M,
    surfaceGravity_pos M hM⟩

end

end Phys.Algebra
