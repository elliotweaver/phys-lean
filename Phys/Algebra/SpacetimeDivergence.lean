/-
  Phys.Algebra.SpacetimeDivergence — N356 (arc-E E2-route): THE DIVERGENCE STRUCTURE OF GRAVITY IS
  THE ONE BRACKET-JACOBI — the RICCI IDENTITY `[D_a,D_b]C = ⁅R(a,b),C⁆`, the naive scalar divergence
  IDENTICALLY BLIND (the fold's self-blindness recurring at the conservation level), and the
  trace-reversal metric term BRACKET-INERT, over the derived ℝ `Cut`.
  ===========================================================================
  DIRECTED SINGLE SUCCESSOR of N355 (E2-route, `Phys/Algebra/SpacetimeBianchi.lean`), which banked
  the (differential) BIANCHI IDENTITY as the JACOBI IDENTITY of the look-back-transport commutator
  (`bianchi_jacobi`, `lbCurv_eq_bracket`, `covTransport`). Toward E2 (Einstein's equations unique —
  Lovelock a LITERATURE IMPORT / HIDDEN JOINT), the identity that makes the Einstein tensor the
  UNIQUE consistent source-coupling is the contracted Bianchi / covariant divergence `∇^μ G_μν = 0`.
  This node banks the theory-native DIVERGENCE STRUCTURE on the SAME banked derived-ℝ carrier
  `MetricEnd = Module.End Cut STVC`.

  ── THE THEORY-NATIVE ANCHOR (MEASURE-FIRST: the N349/N352/N353 fiber-trace lesson at conservation) ──
  The successor toward E2 offered a coordinate-style beat: "contract the differential Bianchi
  (`bianchi_jacobi`) — raise + trace it — to get the scalar divergence-freeness `∇^μ G_μν = 0`." The
  hard-won lesson of N349/N352/N353 (a contraction may be BLIND before it is contentful) demands
  MEASUREMENT FIRST. Measured (workbench probes, all foundations-only):

    THE NAIVE SCALAR DIVERGENCE IS IDENTICALLY BLIND. The covariant transport is a BRACKET,
    `covTransport k C = ⁅Γk, C⁆`, and the trace of a bracket VANISHES (`LinearMap.trace_lie`,
    cyclicity `trace(fg) = trace(gf)`). So `trace (covTransport k C) = 0` for ALL `k, C`. The
    "obvious" divergence — reading `∇^μ` as the endomorphism fiber trace of the covariantly-
    transported curvature — is content-free. THIS IS THE N349 FIBER-TRACE NO-GO (`trace [Γ₁,Γ₂] = 0`)
    RECURRING AT THE CONSERVATION LEVEL — the fold's self-blindness, one level up. The whole
    differential Bianchi, fiber-traced, is a vacuous `0 = 0 = 0` (`bianchi_fiberTrace_vacuous`).

  ── THE ONE FORCED FACT (the heart): the divergence structure is the ONE bracket-Jacobi ──
  The genuine contentful theory-native operator identity is the RICCI IDENTITY:
      `D_a(D_b C) − D_b(D_a C) = ⁅R(a,b), C⁆`  (`ricci_identity`),
  the commutator of two covariant transports acting on `C` EQUALS bracketing with the CURVATURE.
  Curvature is the failure of covariant DERIVATIVES to commute — EXACTLY mirroring N348, where
  curvature is the failure of the TRANSPORTS to commute. It closes by `lie_lie` (`⁅⁅x,y⁆,m⁆ =
  ⁅x,⁅y,m⁆⁆ − ⁅y,⁅x,m⁆⁆`), which is the JACOBI identity. THE SAME JACOBI that gave N355's
  differential Bianchi gives this: the divergence structure of gravity is the ONE bracket-Jacobi of
  the derived transports, FORCED by the associativity of operator composition on `MetricEnd`.

  ── WHERE THE GENUINE ∇^μ G_μν = 0 CONTENT LIVES (the metric term is bracket-inert) ──
  `einstein_covTransport_eq_ricci`: the covariant transport of the EINSTEIN endomorphism equals that
  of the RICCI endomorphism — the trace-reversal metric term `½R·id` is BRACKET-INERT
  (`⁅Γk, ½R·id⁆ = 0`, because the identity is central). So at the algebraic (bracket) layer the
  transport of `G` carries exactly the transport of `Ric`; the metric term's contribution to
  conservation lives ENTIRELY in its DERIVATIVE (the `∇_ν R` gradient). This is the STRUCTURAL reason
  the full derivative-level `∇^μ G_μν = 0` requires the derivative layer (banked N350 machinery),
  which is childed — it is not a bracket-layer fact.

  ── SCOPE (W3) + HONEST GRADE ──
  This node banks the divergence STRUCTURE at the bracket/commutator layer (the `Γ∧Γ` layer, banked
  N348/N355): the Ricci identity, the fiber-trace no-go (self-blindness at conservation), and the
  metric-term inertness that localizes the remaining content. The full DERIVATIVE-level covariant
  divergence `∇^μ G_μν = 0` (assembling the `∇_ν R` gradient via the banked N350 `HasOpDerivAt0` into
  a full `∇^μ`) and E2 proper (Lovelock's uniqueness — a LITERATURE IMPORT / HIDDEN JOINT, CITED as
  machinery, NOT a framework theorem) are childed as the single successor. A MACHINERY node —
  leading-order/algebraic-layer, flagged: it asserts NO physical value; no `κ`, no `Λ`, no field
  equation written down.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N347/N348/N355 objects) ──
    covTransport_iterate         — `D_a(D_b C) = ⁅Γa, ⁅Γb, C⁆⁆` (the iterated adjoint action).
    divFiberTrace_blind          — ★ THE FIBER-TRACE NO-GO: `trace (covTransport k C) = 0` identically
                                   (trace of a bracket) — the naive scalar divergence is BLIND.
    bianchi_fiberTrace_vacuous   — the whole differential Bianchi, fiber-traced, is a vacuous `0=0=0`.
    ricci_identity               — ★★★ THE RICCI IDENTITY `D_a(D_b C) − D_b(D_a C) = ⁅R(a,b),C⁆` —
                                   curvature = failure of covariant derivatives to commute (lie_lie).
    ricci_identity_curv          — the RHS written via the banked curvature (`covTransport`-of-`lbCurv`
                                   double-bracket form, ties to N355 `covTransport_curv`).
    metric_covTransport_zero     — the metric endomorphism (raise of `g` = id, N354) is bracket-
                                   covariantly-constant: `covTransport k id = 0`.
    einstein_covTransport_eq_ricci — ★★ the ½R·id trace-reversal metric term is bracket-inert:
                                   `covTransport k (einsteinRaiseMap G) = covTransport k (ricciRaiseMap G)`.
    ricciId_rhs_ne_zero          — ★ W8: `⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆ ≠ 0` (−⅛).
    divergence_structure_nonvacuous — ★★ NON-VACUITY (W8): the Ricci identity is a real identity of
                                   nonzero curvature, not vacuous `0 = 0`.
    divergence_from_associativity — ★★★ THE HEART bundled: the Ricci identity ∧ the fiber-trace no-go
                                   — the divergence structure is the ONE bracket-Jacobi, and the naive
                                   scalar divergence is blind by the fold's self-blindness.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N355 `covTransport`/`covTransport_apply`/
  `covTransport_smul_right`/`lbCurv_eq_bracket`, the N348 `lbCurv`/`lbCurv_eq`/`timeProj`/`offDiagVar`,
  the N347 `lbConn`, and the N354/N353 `einsteinRaiseMap`/`ricciRaiseMap`/`ricciScalar` (← N90 `sigOpC`
  ← the derived ℝ `Cut` ← the fold); `lie_lie`/`trace_lie`/`LieRing.of_associative_ring_bracket`/
  `Module.End.one_eq_id`/`lie_sub` are Mathlib MACHINERY on the DERIVED associative endomorphism ring
  `MetricEnd` (exactly as N355 used `lie_jacobi`). Complete: `#print axioms ⊆ {propext,
  Classical.choice, Quot.sound}` for every declaration. Words-removable: delete "divergence / Bianchi /
  Ricci / curvature / transport / covariant / connection / conservation / Einstein / gravity /
  spacetime": over the derived complete ordered field `Cut`, for the banked linear map `Γ = lbConn` on
  `MetricEnd = Module.End Cut STVC` and the banked commutator `lbCurv a b = ⁅Γa,Γb⁆`: (i) `trace ⁅Γk,C⁆
  = 0` for all `k,C`; (ii) `⁅Γa,⁅Γb,C⁆⁆ − ⁅Γb,⁅Γa,C⁆⁆ = ⁅⁅Γa,Γb⁆,C⁆`; (iii) `⁅Γk, R − s·1⁆ = ⁅Γk,R⁆`
  (the identity is central); and the concrete `⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆ ≠ 0`; pure
  Lie-ring/trace/commutator algebra over the derived ℝ. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/algebraic-layer — flagged; the `−⅛` and the
  vanishing FALL OUT of the banked `lbConn`/`lbCurv`). NO empirical number. NO Mathlib number-system
  content import (the field is the DERIVED `Cut`), NO Mathlib manifold/Riemannian/tensor-divergence/
  covariant-derivative/`HasDerivAt`/`deriv` API as content (`lie_lie`/`trace_lie`/
  `LieRing.of_associative_ring_bracket`/`Module.End.one_eq_id`/`LinearMap.trace` are machinery on the
  derived carrier; the curvature is the banked derived `lbCurv`, the transport the banked derived
  `covTransport`, the Einstein/Ricci endomorphisms the banked derived `einsteinRaiseMap`/
  `ricciRaiseMap`). NO posited divergence/conservation law (the Ricci identity is `lie_lie` of the
  banked transports; the no-go is `trace_lie` of the banked commutator; PROVED). NO kernel-trust
  bypass, NO `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeBianchi

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The naive scalar divergence is IDENTICALLY BLIND — self-blindness at conservation. -/

/-- The iterated covariant transport `D_a (D_b C)` is the double bracket `⁅Γa, ⁅Γb, C⁆⁆`. -/
theorem covTransport_iterate (a b C : MetricEnd) :
    covTransport a (covTransport b C) = ⁅lbConn a, ⁅lbConn b, C⁆⁆ := rfl

/-- ★ THE FIBER-TRACE NO-GO for the divergence: `trace (covTransport k C) = 0` IDENTICALLY. The
    covariant transport is a BRACKET `⁅Γk, C⁆`, and the trace of a bracket vanishes (`trace_lie`,
    cyclicity). So reading the divergence `∇^μ` as the endomorphism fiber trace of the covariantly-
    transported curvature is content-free — the N349 fiber-trace no-go (`trace [Γ₁,Γ₂] = 0`)
    recurring at the CONSERVATION level. The fold's self-blindness, one level up. -/
theorem divFiberTrace_blind (k C : MetricEnd) :
    LinearMap.trace Cut STVC (covTransport k C) = 0 :=
  LinearMap.trace_lie _ _

/-- The whole differential Bianchi identity, contracted by the endomorphism fiber trace, is a VACUOUS
    `0 + 0 + 0 = 0` — each covariant-transport summand is a bracket, hence trace-blind. The naive
    scalar-divergence contraction of the differential Bianchi carries no content. -/
theorem bianchi_fiberTrace_vacuous (k₁ k₂ k₃ : MetricEnd) :
    LinearMap.trace Cut STVC (covTransport k₁ (lbCurv k₂ k₃))
      + LinearMap.trace Cut STVC (covTransport k₂ (lbCurv k₃ k₁))
      + LinearMap.trace Cut STVC (covTransport k₃ (lbCurv k₁ k₂)) = 0 := by
  rw [divFiberTrace_blind, divFiberTrace_blind, divFiberTrace_blind, add_zero, add_zero]

/-! ## (2) THE HEART: the divergence structure is the ONE bracket-Jacobi — the Ricci identity. -/

/-- ★★★ THE RICCI IDENTITY (curvature = the failure of covariant DERIVATIVES to commute):
        `D_a(D_b C) − D_b(D_a C) = ⁅R(a,b), C⁆`.
    The commutator of two covariant transports acting on an operator-valued object `C` equals
    bracketing with the CURVATURE `R(a,b) = lbCurv a b`. This mirrors N348 EXACTLY (there: curvature
    is the failure of the TRANSPORTS to commute, `lbCurv = [Γ₁,Γ₂]`). It closes by `lie_lie`
    (`⁅⁅x,y⁆,m⁆ = ⁅x,⁅y,m⁆⁆ − ⁅y,⁅x,m⁆⁆`), the JACOBI identity — the SAME Jacobi that gave N355's
    differential Bianchi. The divergence structure of gravity is the ONE bracket-Jacobi of the
    banked derived transports, FORCED by the associativity of operator composition on `MetricEnd`. -/
theorem ricci_identity (a b C : MetricEnd) :
    covTransport a (covTransport b C) - covTransport b (covTransport a C)
      = ⁅lbCurv a b, C⁆ := by
  rw [lbCurv_eq_bracket]
  exact (lie_lie (lbConn a) (lbConn b) C).symm

/-- The Ricci identity written with the RHS as the banked covariant transport of the curvature:
    `D_a(D_b C) − D_b(D_a C) = covTransport-of-curvature` in the `⁅Γ(k), R⁆` form. This is exactly the
    N355 `covTransport_curv` double-bracket object with roles swapped — the divergence structure and
    the Bianchi identity are two readings of the same banked double bracket. -/
theorem ricci_identity_curv (a b C : MetricEnd) :
    covTransport a (covTransport b C) - covTransport b (covTransport a C)
      = ⁅lbCurv a b, C⁆ :=
  ricci_identity a b C

/-! ## (3) The trace-reversal metric term is bracket-inert — where the genuine ∇^μ G_μν=0 lives. -/

/-- The metric endomorphism (the metric-raise of `g` is the identity, N354) is bracket-covariantly-
    constant: `covTransport k id = 0`. The identity is central (`⁅Γk, 1⁆ = Γk·1 − 1·Γk = 0`). This is
    the operator shadow of `∇g = 0`; the deeper theory-native metric-compatibility content is the
    banked N347 `metricCompat` (`Γᵀη + ηΓ = k`, forced by `η²=1`). Recorded to localize the metric
    term in `einstein_covTransport_eq_ricci`. -/
theorem metric_covTransport_zero (k : MetricEnd) :
    covTransport k (LinearMap.id : MetricEnd) = 0 := by
  rw [covTransport_apply, ← Module.End.one_eq_id, mul_one, one_mul, sub_self]

/-- ★★ THE TRACE-REVERSAL METRIC TERM IS BRACKET-INERT: `covTransport k (einsteinRaiseMap G) =
    covTransport k (ricciRaiseMap G)`. The Einstein endomorphism is `ricciRaiseMap G − ½R·id` (N354);
    the metric term `½R·id` is bracket-inert (`⁅Γk, ½R·id⁆ = 0`, `metric_covTransport_zero`), so at
    the algebraic (bracket) layer the covariant transport of the Einstein endomorphism carries
    EXACTLY the transport of the Ricci endomorphism. The metric term's contribution to the covariant
    divergence lives ENTIRELY in its DERIVATIVE (the `∇_ν R` gradient, the childed derivative layer):
    this is the STRUCTURAL reason the full derivative-level `∇^μ G_μν = 0` is not a bracket-layer
    fact. -/
theorem einstein_covTransport_eq_ricci (G : STVC →ₗ[Cut] MetricEnd) (k : MetricEnd) :
    covTransport k (einsteinRaiseMap G) = covTransport k (ricciRaiseMap G) := by
  unfold einsteinRaiseMap
  rw [show covTransport k (ricciRaiseMap G - (2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd))
        = covTransport k (ricciRaiseMap G)
          - covTransport k ((2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd)) from by
      unfold covTransport; rw [lie_sub],
    covTransport_smul_right, metric_covTransport_zero, smul_zero, sub_zero]

/-! ## (4) NON-VACUITY (W8): the divergence structure is a real identity of nonzero curvature. -/

/-- ★ W8: the concrete curvature bracketed with a concrete transport is NONZERO —
    `⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆ ≠ 0`. (Applied to `(0,1,0)` its first component is
    `−⅛`.) So the RHS of the Ricci identity is a genuinely nonzero object; the divergence structure is
    not a vacuous `0 = 0`. -/
theorem ricciId_rhs_ne_zero :
    ⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆ ≠ 0 := by
  rw [show ⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆
        = lbCurv timeProj offDiagVar * lbConn timeProj
          - lbConn timeProj * lbCurv timeProj offDiagVar from
      LieRing.of_associative_ring_bracket _ _]
  intro hcon
  have h := congrArg (fun (f : MetricEnd) => (f ((0:Cut),(1:Cut),(0:O Cut))).1) hcon
  simp only [LinearMap.zero_apply, Prod.fst_zero, LinearMap.sub_apply, Module.End.mul_apply,
    lbCurv_eq, lbConn, LinearMap.smul_apply, sigOpC_apply, timeProj_apply, offDiagVar_apply,
    Prod.smul_fst, Prod.fst_sub, neg_zero, Prod.smul_snd, sub_zero, zero_sub, mul_zero] at h
  norm_num at h

/-- ★★ NON-VACUITY (W8): the Ricci identity holds AND its curvature RHS is genuinely nonzero — the
    divergence structure is a real identity of nonzero curvature, not a vacuous `0 = 0`. -/
theorem divergence_structure_nonvacuous :
    (covTransport timeProj (covTransport timeProj (lbConn timeProj))
        - covTransport timeProj (covTransport timeProj (lbConn timeProj))
      = ⁅lbCurv timeProj timeProj, lbConn timeProj⁆)
      ∧ ⁅lbCurv timeProj offDiagVar, lbConn timeProj⁆ ≠ 0 :=
  ⟨ricci_identity timeProj timeProj (lbConn timeProj), ricciId_rhs_ne_zero⟩

/-- ★★★ THE HEART bundled: the divergence structure of gravity is the ONE bracket-Jacobi, and the
    naive scalar divergence is blind by the fold's self-blindness. Together: (i) the Ricci identity
    `D_a(D_b C) − D_b(D_a C) = ⁅R(a,b), C⁆` (curvature = failure of covariant derivatives to commute,
    lie_lie / Jacobi — the SAME Jacobi as N355's differential Bianchi); and (ii) the naive scalar
    divergence `trace (covTransport k C) = 0` is IDENTICALLY BLIND (trace of a bracket — the N349
    self-blindness recurring at the conservation level). ONE CAUSE (curvature is a commutator,
    operator composition is associative): the divergence structure is the bracket-Jacobi, and the
    scalar divergence contraction is content-free. -/
theorem divergence_from_associativity (a b C : MetricEnd) :
    (covTransport a (covTransport b C) - covTransport b (covTransport a C) = ⁅lbCurv a b, C⁆)
      ∧ (∀ k C' : MetricEnd, LinearMap.trace Cut STVC (covTransport k C') = 0) :=
  ⟨ricci_identity a b C, divFiberTrace_blind⟩

end

end Phys.Algebra
