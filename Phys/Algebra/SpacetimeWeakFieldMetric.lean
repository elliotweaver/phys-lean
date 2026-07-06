/-
  Phys.Algebra.SpacetimeWeakFieldMetric — N346 (arc-E E1a): THE WEAK-FIELD METRIC `g = η + h`
  AND THE EXACT LINEARIZED-INVERSE RESIDUAL `g·(η − ηhη) = 1 − (hη)²`, over the DERIVED ℝ `Cut`.
  ===========================================================================
  ARC E OPENS HERE (per docs/SEED_GR_BLACKHOLE_COSMOLOGY.md §E1). Gravity ENTERS the chain not as
  a new posit but as the LOCAL DISTORTION of the fold's look-back transport. This node builds the
  FIRST, SMALLEST forced object of the general-relativity machinery on the banked derived ℝ: the
  metric operator, its flat reference `η`, the weak-field split `g = η + h`, and the EXACT
  linearized inverse together with its residual.

  ── THE THEORY-NATIVE ANCHOR (the metric IS the Born self-overlap) ──
  The trunk primitive Born = self-overlap = positivity is the metric. The banked flat reference is
  the continuum Born/Minkowski form `EvC`/`BvC` on the derived-ℝ carrier `STVC = Cut × Cut × O Cut`
  (N49–N90), whose signature `(1,9)` is DERIVED from Born positivity (`gForm` = a sum of 8 squares,
  N43 `signature_one_nine`) — NEVER a posited `(1,3)`/`(1,9)`. The reference metric OPERATOR is the
  banked SIGNATURE INVOLUTION `η := sigOpC : (t,x,v) ↦ (t,-x,-v)` (N90), which relates the positive
  reference form to the indefinite one by `BvC p q = EvC p (η q)` and is INVOLUTIVE
  (`sigOpC_comp_self`: `η∘η = id`, i.e. `η·η = 1` in the endomorphism ring). Gravity is the local
  distortion: `g := η + h` for an operator perturbation `h`.

  ── THE ONE FORCED FIRST OBJECT: the exact linearized inverse and its residual ──
  Because the flat self-overlap `η` UNDOES ITSELF exactly (`η·η = 1`), the natural raise/lower
  inverse of `g = η + h` is the linearized `ǧ := η − η h η`. The EXACT product is NOT `1`:
      `g · ǧ = (η + h)(η − ηhη) = 1 − (hη)²`.
  The residual `(hη)²` is the FIRST appearance of the look-back's NON-CLOSURE — the self-overlap
  fails to undo at second order in the field `h`. Standard GR truncates the linearized inverse to
  `O(h²)` and discards this term; the theory KEEPS the identity exact and names the residual as the
  algebraic seed the DERIVATIVE-level curvature (childed to E1b/E1c) will carry. This is a MACHINERY
  node: it asserts NO physical value; it builds the operator identity and its non-vacuity.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects) ──
    eta_mul_self              — ★ `η·η = 1` in `Module.End Cut STVC` (from banked `sigOpC_comp_self`).
    residual_identity         — the GENERAL RING lemma `(η+h)(η−ηhη) = 1 − (hη)²` for any `η·η = 1`.
    weakMetric / linInv       — the weak-field metric `g = η + h` and its linearized inverse `ǧ`.
    metric_linearized_inverse — ★★★ THE EXACT RESIDUAL `g·ǧ = 1 − (hη)²` on the derived-ℝ carrier.
    flat_limit                — `h = 0 ⟹ g·ǧ = 1` EXACTLY (no field, no residual, no curvature).
    weakMetric_selfAdjoint    — `g` is EvC-self-adjoint when `h` is (η is banked self-adjoint): the
                                metric is symmetric, `g = gᵀ`.
    timeProj / timeProj_*      — a CONCRETE nonzero perturbation (projection onto the time line).
    residual_ne_zero          — ★ `(timeProj·η)² ≠ 0`: the residual is genuinely nonzero.
    metric_inverse_not_exact  — ★★ NON-VACUITY (W8): for the concrete nonzero field, `g·ǧ ≠ 1` —
                                the linearized inverse is genuinely NOT exact; the residual bites.
    residual_time_zero        — the residual, applied to the time axis `e₀`, kills the time
                                component (a concrete witness of the non-closure defect).

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N43/N49–N90 Lorentz-continuum objects over the
  derived ℝ `Cut` ← the order-completeness of `Cut` ← the fold; `Module.End`/`noncomm_ring` are
  Mathlib MACHINERY on the DERIVED carrier. Complete: `#print axioms ⊆ {propext, Classical.choice,
  Quot.sound}` for every declaration. Words-removable: delete "gravity / metric / spacetime /
  curvature / field": over the derived complete ordered field `Cut`, for the involution
  `η : (t,x,v) ↦ (t,-x,-v)` (`η² = 1`) and any endomorphism `h`, `(η+h)(η−ηhη) = 1 − (hη)²`, and
  for the concrete `h : (t,x,v) ↦ (t,0,0)` the residual `(hη)² = h ≠ 0`, so the product `≠ 1`;
  pure noncommutative-ring algebra. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node). NO empirical number. NO Mathlib number-system content import
  (the field is the DERIVED `Cut`), NO Mathlib manifold/Riemannian API as content, NO posited
  metric. NO kernel-trust bypass, NO `maxHeartbeats` raise, NO coordinate bash (the residual
  identity is a dimension-free ring identity from `η² = 1`).
-/
import Phys.Algebra.LorentzContinuumMetricCondition

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- The endomorphism ring of the derived-ℝ spacetime carrier `STVC = Cut × Cut × O Cut`. The
    "metric operators" live here; `η := sigOpC` is the flat reference. -/
abbrev MetricEnd : Type := Module.End Cut STVC

/-! ## (1) The flat reference metric `η = sigOpC` is involutive: `η·η = 1`. -/

/-- ★ THE FLAT METRIC IS INVOLUTIVE: `η·η = 1` in `Module.End Cut STVC`, from the banked
    `sigOpC_comp_self` (`η∘η = id`, N90). The flat self-overlap undoes itself exactly — this is
    what makes `η` its own raise/lower inverse. -/
theorem eta_mul_self : (sigOpC * sigOpC : MetricEnd) = 1 := by
  rw [Module.End.mul_eq_comp, sigOpC_comp_self, Module.End.one_eq_id]

/-! ## (2) The general ring residual identity, and the weak-field metric on the derived carrier. -/

/-- THE GENERAL RESIDUAL IDENTITY: in ANY ring, if `η·η = 1` then
    `(η + h)·(η − η h η) = 1 − (h η)·(h η)`. Pure noncommutative-ring algebra — no order, no
    coordinates, no dimension. This is the algebraic heart; the metric application instantiates it
    at the banked `η = sigOpC`. -/
theorem residual_identity {R : Type} [Ring R] (η h : R) (hη : η * η = 1) :
    (η + h) * (η - η * h * η) = 1 - (h * η) * (h * η) := by
  have e1 : (η + h) * (η - η * h * η)
      = η * η - η * η * h * η + h * η - h * η * h * η := by noncomm_ring
  rw [e1, hη]; noncomm_ring

/-- THE WEAK-FIELD METRIC `g = η + h`: the flat reference `η = sigOpC` distorted by the operator
    field `h`. -/
def weakMetric (h : MetricEnd) : MetricEnd := sigOpC + h

/-- THE LINEARIZED INVERSE `ǧ = η − η h η`: the natural raise/lower inverse of `g` to first order
    in the field, built from the involution `η`. -/
def linInv (h : MetricEnd) : MetricEnd := sigOpC - sigOpC * h * sigOpC

/-- ★★★ THE EXACT LINEARIZED-INVERSE RESIDUAL over the derived ℝ `Cut`:
    `g · ǧ = 1 − (h η)²`. The product of the weak-field metric and its linearized inverse is NOT
    `1`; the exact residual `(h η)²` is the FIRST appearance of the look-back's non-closure (the
    self-overlap failing to undo at second order in the field). Kept EXACT (not truncated) — the
    algebraic seed the derivative-level curvature carries. -/
theorem metric_linearized_inverse (h : MetricEnd) :
    weakMetric h * linInv h = 1 - (h * sigOpC) * (h * sigOpC) := by
  unfold weakMetric linInv
  exact residual_identity sigOpC h eta_mul_self

/-- THE FLAT LIMIT: with no field (`h = 0`), the metric is the flat reference and its linearized
    inverse is EXACT — `g · ǧ = 1`, residual `0`. No field, no non-closure, no curvature. -/
theorem flat_limit : weakMetric 0 * linInv 0 = 1 := by
  rw [metric_linearized_inverse]; simp

/-- THE METRIC IS SYMMETRIC (EvC-self-adjoint) when the field is: since the flat reference `η` is
    banked EvC-self-adjoint (`sigOpC_isEvCAdjoint_self`) and `EvC` is bilinear, `g = η + h` is
    EvC-self-adjoint whenever `h` is. `g = gᵀ`, the metric's defining symmetry. -/
theorem weakMetric_selfAdjoint {h : MetricEnd} (hh : IsEvCAdjoint h h) :
    IsEvCAdjoint (weakMetric h) (weakMetric h) := by
  intro p q
  unfold weakMetric
  simp only [LinearMap.add_apply]
  rw [EvC_add_left, EvC_add_right]
  rw [sigOpC_isEvCAdjoint_self p q, hh p q]

/-! ## (3) NON-VACUITY (W8): a concrete nonzero field makes the linearized inverse genuinely
    INEXACT — the residual bites. -/

/-- A CONCRETE nonzero symmetric perturbation: the projection onto the time line
    `h : (t,x,v) ↦ (t,0,0)`. A genuine operator field witnessing the residual is nonzero. -/
def timeProj : MetricEnd where
  toFun p := (p.1, 0, 0)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show (0:Cut) = 0 + 0; ring
    · show (0:O Cut) = 0 + 0; rw [add_zero]
  map_smul' c p := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show (0:Cut) = c • 0; rw [smul_zero]
    · show (0:O Cut) = c • 0; rw [smul_zero]

theorem timeProj_apply (p : STVC) : timeProj p = (p.1, 0, 0) := rfl

/-- `η` preserves the time component, so `timeProj·η = timeProj`. -/
theorem timeProj_comp_sigOpC : (timeProj * sigOpC : MetricEnd) = timeProj := by
  rw [Module.End.mul_eq_comp]; apply LinearMap.ext; intro p
  simp only [LinearMap.comp_apply, sigOpC_apply, timeProj_apply]

/-- `timeProj` is idempotent. -/
theorem timeProj_idem : (timeProj * timeProj : MetricEnd) = timeProj := by
  rw [Module.End.mul_eq_comp]; apply LinearMap.ext; intro p
  simp only [LinearMap.comp_apply, timeProj_apply]

/-- `timeProj ≠ 0`: it fixes the time axis `(1,0,0) ↦ (1,0,0)`, whose time component is `1 ≠ 0`. -/
theorem timeProj_ne_zero : (timeProj : MetricEnd) ≠ 0 := by
  intro hcon
  have h := congrArg (fun (f : MetricEnd) => (f ((1:Cut),0,0)).1) hcon
  simp only [timeProj_apply, LinearMap.zero_apply] at h
  exact one_ne_zero h

/-- ★ THE RESIDUAL IS GENUINELY NONZERO: `(timeProj·η)² = timeProj ≠ 0`. -/
theorem residual_ne_zero : (timeProj * sigOpC : MetricEnd) * (timeProj * sigOpC) ≠ 0 := by
  rw [timeProj_comp_sigOpC, timeProj_idem]
  exact timeProj_ne_zero

/-- ★★ NON-VACUITY (W8): for the concrete nonzero field `timeProj`, the weak-field metric and its
    linearized inverse do NOT compose to the identity — `g · ǧ ≠ 1`. The linearized inverse is
    genuinely INEXACT for a nonzero field; the non-closure residual bites. A vacuous "the inverse is
    always exact" reading is refuted. -/
theorem metric_inverse_not_exact :
    weakMetric timeProj * linInv timeProj ≠ 1 := by
  rw [metric_linearized_inverse]
  intro hcon
  exact residual_ne_zero (sub_eq_self.mp hcon)

/-- A CONCRETE WITNESS of the non-closure defect: the residual `g·ǧ = 1 − (hη)²`, applied to the
    time axis `metricTimeAxis = (1,0,0)`, annihilates the time component. The identity `1` would
    return `1`; the residual returns `0`. -/
def metricTimeAxis : STVC := ((1:Cut), 0, 0)

theorem residual_time_zero :
    ((weakMetric timeProj * linInv timeProj) metricTimeAxis).1 = 0 := by
  rw [metric_linearized_inverse, timeProj_comp_sigOpC, timeProj_idem]
  simp only [LinearMap.sub_apply, Module.End.one_apply, timeProj_apply, metricTimeAxis,
    sub_self, Prod.fst_zero]

end

end Phys.Algebra
