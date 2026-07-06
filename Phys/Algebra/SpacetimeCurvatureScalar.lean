/-
  Phys.Algebra.SpacetimeCurvatureScalar — N349 (arc-E E1c-scalar): THE THEORY-NATIVE CURVATURE
  SCALAR = THE BORN SELF-OVERLAP OF THE NON-CLOSURE, and the fiber-trace NO-GO.
  ===========================================================================
  DIRECTED SUCCESSOR of N348 (E1c, `Phys/Algebra/SpacetimeCurvature.lean`), which banked the CURVATURE
  `R(k₁,k₂) = lbCurv k₁ k₂ = [Γ₁,Γ₂] = ¼·(η·k₁·η·k₂ − η·k₂·η·k₁)` — the two look-back transports
  (N347 `lbConn`, `Γ = ½ηk`) failing to commute — with its 2-form structure, non-vacuity, and heart
  (`curvature_from_compatible_transports`). That is the ALGEBRAIC (`Γ∧Γ` / commutator) part of the
  linearized Riemann `F = dΓ + Γ∧Γ`. THIS node builds the SCALAR MAGNITUDE of that curvature — the
  theory-native contraction — on the SAME banked derived-ℝ carrier `MetricEnd = Module.End Cut STVC`.

  ── THE THEORY-NATIVE ANCHOR (the scalar contraction IS the fold's Born self-overlap, NOT a basis trace) ──
  A FRESH-worker SELECT asked FIRST what the theory says the scalar contraction of the non-closure IS,
  and MEASURED whether the standard "trace" move delivers content. The measurement is decisive:

    • The naive scalar-curvature-by-basis-trace reading — the ENDOMORPHISM TRACE of the commutator
      curvature — is FORCED TO ZERO: `trace [Γ₁,Γ₂] = trace(Γ₁Γ₂) − trace(Γ₂Γ₁) = 0` (`trace_mul_comm`,
      the loop-orientation antisymmetry at the trace level). The standard basis-trace move is
      CONTENT-FREE on the non-closure (`fiberTrace_lbCurv_zero`). It is BLIND to the curvature.

    • The theory delivers the contraction MORE DIRECTLY through the fold's OWN positive form. The trunk
      primitive is Born = self-overlap = positivity; the banked continuum Born form is `EvC` (N58,
      positive-semidefinite `EvC_nonneg`, positive-definite `EvC_eq_zero_iff`). The theory-native scalar
      magnitude of the non-closure is the BORN SELF-OVERLAP of the curvature vector:
          `bornCurv p k₁ k₂ := EvC (R(k₁,k₂)·p) (R(k₁,k₂)·p)`.
      It is `≥ 0` (Born positivity), orientation-INDEPENDENT (the `±` of the antisymmetric 2-form squares
      away — the density does not see loop orientation), positive-DEFINITE (`= 0 ⇔ the curvature vector
      = 0`, a FAITHFUL measure), QUADRATIC in the metric variation, and — for the concrete pair
      `(timeProj, offDiagVar)` at `(0,1,0)` — strictly POSITIVE. The fold's positive form SEES the
      non-closure the endomorphism trace cannot.

  This is the QUIET-DRIFT correction made concrete: the standard move (contract with a generic basis
  trace) is blind here; the theory's own object (the Born self-overlap) is the right, faithful
  contraction. We do NOT posit a Ricci scalar and compute it; we DERIVE the trace no-go and the
  positive Born magnitude from the banked objects.

  ── SCOPE (W3 — this is the SCALAR MAGNITUDE of the ALGEBRAIC curvature; the tensorial Ricci is childed) ──
  This node banks a curvature-NORM invariant (`⟨R·p, R·p⟩` through the fold's Born form — a
  Kretschmann-type positive scalar), NOT the tensorial Ricci scalar (which is a rank-2 index contraction
  of the DERIVATIVE-carrying Riemann `∂Γ − ∂Γ + Γ∧Γ`). The `dΓ` derivative part needs the multivariate
  operator-field directional-derivative on the derived-ℝ tangent structure (the banked
  `cut_powerseries_deriv` (N41g) / `...Deriv2` (N182) are SCALAR `Cut → Cut` limits; there is NO banked
  topology on `STVC`/`MetricEnd`), a genuine heavy W1 build — childed as a DIRECTED route-finder toward
  the tensorial Ricci and E2. Weak-field is sufficient to reach E2/E3 (docs/SEED_GR_BLACKHOLE_COSMOLOGY.md
  §E1). A MACHINERY node: it asserts NO physical value; it is flagged leading-order/mechanism-grade.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N348/N58 objects) ──
    fiberTrace_lbCurv_zero          — ★ THE NO-GO: `trace R(k₁,k₂) = 0` identically (trace of a
                                      commutator; the standard basis-trace scalar-curvature move is
                                      content-free — blind to the non-closure).
    bornCurv                        — the theory-native scalar `EvC (R·p) (R·p)` — the fold's Born
                                      self-overlap of the non-closure vector.
    bornCurv_nonneg                 — `0 ≤ bornCurv` — Born positivity (the trunk primitive).
    bornCurv_self_zero              — `bornCurv p k k = 0` — a degenerate loop encloses no area.
    bornCurv_flat_left / _right     — no variation ⟹ no curvature ⟹ no density.
    bornCurv_orient_indep           — `bornCurv p k₁ k₂ = bornCurv p k₂ k₁` — the `±` orientation squares
                                      away; the positive density does not see loop orientation.
    bornCurv_eq_zero_iff            — ★ FAITHFUL measure (positive-definite): `bornCurv = 0 ⇔ R·p = 0`.
    bornCurv_smul_left / _right     — `bornCurv p (c•k₁) k₂ = c²·bornCurv p k₁ k₂` — QUADRATIC in the
                                      variation (Born self-overlap is quadratic).
    bornCurv_parallel               — `bornCurv p k (c•k) = 0` — parallel variations enclose no area.
    curvSampleVec                   — the concrete witness vector `(0,1,0)`.
    bornCurv_ne_zero / bornCurv_pos  — ★★ NON-VACUITY (W8): `0 < bornCurv curvSampleVec timeProj
                                      offDiagVar` — the fold's Born form genuinely SEES the non-closure;
                                      the curvature has a positive Born measure.
    curvature_scalar_positive_not_trace — ★★★ THE HEART: the naive fiber trace is identically zero, YET
                                      the theory-native Born self-overlap scalar is strictly positive for
                                      the concrete pair — the fold's own positive form measures the
                                      non-closure the endomorphism trace cannot see.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N348 `lbCurv` (← N347 `lbConn` ← N90 `sigOpC` ← the
  derived ℝ `Cut` ← the fold) and the banked N58 Born form `EvC`; `Module.End`/`LinearMap.trace`/
  `Module.Free`/`Module.Finite` are Mathlib MACHINERY on the DERIVED carrier. Complete: `#print axioms
  ⊆ {propext, Classical.choice, Quot.sound}` for every declaration. Words-removable: delete "curvature /
  Riemann / Ricci / scalar / gravity / loop / non-closure": over the derived complete ordered field `Cut`,
  for endomorphisms `Γᵢ = ½ηkᵢ` (`η²=1`), the endomorphism trace of the commutator `[Γ₁,Γ₂]` is `0`, and
  the banked positive-semidefinite form `EvC` evaluated on the commutator's image vector is `≥ 0`,
  `= 0 ⇔ that vector = 0`, orientation-independent, quadratic in `k`, and strictly positive for the
  concrete `(timeProj, offDiagVar)` at `(0,1,0)`; pure linear/ring algebra + the banked positive-definite
  form. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/linearized — flagged). NO empirical number. NO Mathlib
  number-system content import (the field is the DERIVED `Cut`), NO Mathlib manifold/Riemannian/deriv API
  as content, NO posited Ricci tensor (the scalar is the fold's Born self-overlap of the DERIVED
  non-closure; the trace no-go is PROVED). NO kernel-trust bypass, NO `maxHeartbeats` raise, NO coordinate
  bash (the identities are dimension-free ring/form algebra).
-/
import Phys.Algebra.SpacetimeCurvature
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) THE NO-GO: the naive fiber-trace scalar-curvature reading is forced to zero. -/

/-- ★ THE FIBER-TRACE NO-GO: the endomorphism trace of the curvature is IDENTICALLY ZERO,
    `trace R(k₁,k₂) = trace(Γ₁Γ₂) − trace(Γ₂Γ₁) = 0`. The standard "scalar curvature = a basis trace
    of the curvature" move is CONTENT-FREE on the non-closure — the trace of a commutator vanishes
    (`trace_mul_comm`, the loop-orientation antisymmetry at the trace level). The endomorphism trace is
    BLIND to the curvature. This is why the theory-native scalar must be the fold's Born self-overlap,
    not a basis trace. -/
theorem fiberTrace_lbCurv_zero (k₁ k₂ : MetricEnd) :
    LinearMap.trace Cut STVC (lbCurv k₁ k₂) = 0 := by
  unfold lbCurv
  rw [map_sub, LinearMap.trace_mul_comm, sub_self]

/-! ## (2) THE THEORY-NATIVE SCALAR: the Born self-overlap of the non-closure vector. -/

/-- THE THEORY-NATIVE CURVATURE SCALAR: the fold's Born self-overlap of the curvature (non-closure)
    vector `R(k₁,k₂)·p`, `bornCurv p k₁ k₂ := EvC (R·p) (R·p)`. The trunk primitive Born = self-overlap
    = positivity read on the non-closure — the positive scalar magnitude of how much the loop fails to
    close at `p`. NOT a posited Ricci scalar; the fold's OWN positive form contracting the derived
    curvature. -/
def bornCurv (p : STVC) (k₁ k₂ : MetricEnd) : Cut :=
  EvC (lbCurv k₁ k₂ p) (lbCurv k₁ k₂ p)

/-- BORN POSITIVITY (the trunk primitive): `0 ≤ bornCurv`. The self-overlap of the non-closure vector
    is nonnegative — the curvature magnitude cannot be negative. -/
theorem bornCurv_nonneg (p : STVC) (k₁ k₂ : MetricEnd) : 0 ≤ bornCurv p k₁ k₂ :=
  EvC_nonneg _

/-- A DEGENERATE LOOP (one direction, `k₁ = k₂`) encloses no area, so no curvature density:
    `bornCurv p k k = 0`. -/
theorem bornCurv_self_zero (p : STVC) (k : MetricEnd) : bornCurv p k k = 0 := by
  unfold bornCurv; rw [lbCurv_self]
  simp only [LinearMap.zero_apply, EvC_zero_left]

/-- THE FLAT LIMIT (left): no variation in the first direction ⟹ no curvature ⟹ no density. -/
theorem bornCurv_flat_left (p : STVC) (k : MetricEnd) : bornCurv p 0 k = 0 := by
  unfold bornCurv; rw [lbCurv_flat_left]
  simp only [LinearMap.zero_apply, EvC_zero_left]

/-- THE FLAT LIMIT (right): no variation in the second direction ⟹ no density. -/
theorem bornCurv_flat_right (p : STVC) (k : MetricEnd) : bornCurv p k 0 = 0 := by
  unfold bornCurv; rw [lbCurv_flat_right]
  simp only [LinearMap.zero_apply, EvC_zero_left]

/-- ORIENTATION INDEPENDENCE: reversing the loop reverses `R` (`lbCurv_antisymm`), but the positive
    Born density is UNCHANGED — the `±` squares away. `bornCurv p k₁ k₂ = bornCurv p k₂ k₁`. The
    positive scalar magnitude does not see loop orientation. -/
theorem bornCurv_orient_indep (p : STVC) (k₁ k₂ : MetricEnd) :
    bornCurv p k₁ k₂ = bornCurv p k₂ k₁ := by
  unfold bornCurv
  rw [lbCurv_antisymm k₁ k₂]
  simp only [LinearMap.neg_apply]
  rw [EvC_neg_right, EvC_symm (-(lbCurv k₂ k₁ p)), EvC_neg_right, neg_neg]

/-- ★ FAITHFUL MEASURE (positive-definiteness of the Born form): the density vanishes EXACTLY where the
    curvature vector vanishes — `bornCurv p k₁ k₂ = 0 ↔ R(k₁,k₂)·p = 0`. The Born self-overlap is a
    faithful measure of the non-closure: zero density ⇔ genuinely flat at `p` in the loop `(k₁,k₂)`. -/
theorem bornCurv_eq_zero_iff (p : STVC) (k₁ k₂ : MetricEnd) :
    bornCurv p k₁ k₂ = 0 ↔ lbCurv k₁ k₂ p = 0 := by
  unfold bornCurv; exact EvC_eq_zero_iff _

/-- QUADRATIC (left): `bornCurv p (c•k₁) k₂ = c²·bornCurv p k₁ k₂`. The Born self-overlap is a
    quadratic form; scaling the variation by `c` scales the density by `c²`. -/
theorem bornCurv_smul_left (c : Cut) (p : STVC) (k₁ k₂ : MetricEnd) :
    bornCurv p (c • k₁) k₂ = c ^ 2 * bornCurv p k₁ k₂ := by
  unfold bornCurv
  rw [lbCurv_smul_left, LinearMap.smul_apply, EvC_smul_left, EvC_smul_right]
  ring

/-- QUADRATIC (right): `bornCurv p k₁ (c•k₂) = c²·bornCurv p k₁ k₂`. -/
theorem bornCurv_smul_right (c : Cut) (p : STVC) (k₁ k₂ : MetricEnd) :
    bornCurv p k₁ (c • k₂) = c ^ 2 * bornCurv p k₁ k₂ := by
  unfold bornCurv
  rw [lbCurv_smul_right, LinearMap.smul_apply, EvC_smul_left, EvC_smul_right]
  ring

/-- PARALLEL variations give no curvature density: `bornCurv p k (c•k) = 0`. The 2-form is degenerate
    on proportional directions — the loop collapses to a line. -/
theorem bornCurv_parallel (c : Cut) (p : STVC) (k : MetricEnd) : bornCurv p k (c • k) = 0 := by
  rw [bornCurv_smul_right, bornCurv_self_zero, mul_zero]

/-! ## (3) NON-VACUITY (W8): the fold's Born form genuinely sees the non-closure. -/

/-- THE CONCRETE WITNESS VECTOR `(0,1,0)` — the space-`x` unit line, at which the curvature of the
    concrete pair `(timeProj, offDiagVar)` is nonzero. -/
def curvSampleVec : STVC := ((0 : Cut), (1 : Cut), (0 : O Cut))

/-- The concrete curvature vector `R(timeProj, offDiagVar)·(0,1,0)` is NONZERO (its first component is
    `¼ ≠ 0`). The banked non-vacuity `lbCurv_ne_zero` witnesses `R(timeProj,offDiagVar) ≠ 0` as an
    operator; here we pin the concrete image vector at `curvSampleVec`. -/
theorem lbCurv_sample_ne_zero : lbCurv timeProj offDiagVar curvSampleVec ≠ 0 := by
  intro hcon
  have h := congrArg (fun z : STVC => z.1) hcon
  simp only [Prod.fst_zero] at h
  rw [lbCurv_eq] at h
  simp only [curvSampleVec, LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_fst, Prod.fst_sub,
    neg_zero, sub_zero] at h
  exact (by norm_num : (4⁻¹ : Cut) • (1:Cut) ≠ 0) h

/-- ★★ NON-VACUITY (W8): the theory-native Born curvature scalar is STRICTLY POSITIVE for the concrete
    pair — `0 < bornCurv curvSampleVec timeProj offDiagVar`. The fold's Born form genuinely SEES the
    non-closure; spacetime's curvature has a positive Born measure. From `0 ≤ bornCurv` (Born
    positivity) and `bornCurv ≠ 0` (faithful measure + the nonzero curvature vector). -/
theorem bornCurv_pos : 0 < bornCurv curvSampleVec timeProj offDiagVar := by
  have hne : bornCurv curvSampleVec timeProj offDiagVar ≠ 0 := by
    rw [Ne, bornCurv_eq_zero_iff]; exact lbCurv_sample_ne_zero
  exact lt_of_le_of_ne (bornCurv_nonneg _ _ _) (fun h => hne h.symm)

/-- ★★ NON-VACUITY (W8, the costume anchor): the Born curvature scalar is nonzero for the concrete
    pair. The fold's positive form is not a vacuous "always zero" object — it measures a genuine
    non-closure. -/
theorem bornCurv_ne_zero : bornCurv curvSampleVec timeProj offDiagVar ≠ 0 :=
  ne_of_gt bornCurv_pos

/-! ## (4) THE HEART: the trace is blind, the Born form sees. -/

/-- ★★★ THE THEORY-NATIVE HEART — the fold's own positive form measures the non-closure the endomorphism
    trace cannot. The naive fiber trace of the curvature is IDENTICALLY ZERO (`fiberTrace_lbCurv_zero`,
    the standard basis-trace scalar-curvature move is content-free — blind to the non-closure), YET the
    theory-native Born self-overlap scalar is STRICTLY POSITIVE for the concrete pair (`bornCurv_pos`).
    The standard contraction sees nothing; the fold's Born self-overlap sees the curvature. This is the
    QUIET-DRIFT correction made a theorem: the theory delivers the scalar contraction the field would
    reach a blind basis trace for. -/
theorem curvature_scalar_positive_not_trace :
    LinearMap.trace Cut STVC (lbCurv timeProj offDiagVar) = 0
      ∧ 0 < bornCurv curvSampleVec timeProj offDiagVar :=
  ⟨fiberTrace_lbCurv_zero timeProj offDiagVar, bornCurv_pos⟩

end

end Phys.Algebra
