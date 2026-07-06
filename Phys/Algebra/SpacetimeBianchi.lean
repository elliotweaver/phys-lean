/-
  Phys.Algebra.SpacetimeBianchi — N355 (arc-E E2-route): THE (differential) BIANCHI IDENTITY IS THE
  JACOBI IDENTITY of the look-back-transport commutator, over the derived ℝ `Cut`.
  ===========================================================================
  DIRECTED SINGLE SUCCESSOR of N354 (E1-Einstein, `Phys/Algebra/SpacetimeEinsteinTensor.lean`), which
  banked the EINSTEIN TENSOR `G_μν = Ric_μν − ½ R g_μν` + its DIMENSION-FORCED trace-reversal. Toward
  E2 (Einstein's equations unique — Lovelock as a LITERATURE IMPORT / HIDDEN JOINT), the identity that
  makes the Einstein tensor the UNIQUE consistent source-coupling is the divergence-freeness
  `∇^μ G_μν = 0`, which in standard GR FOLLOWS from the DEEPER (second/differential) Bianchi identity
  `∇_[a R_bc]de = 0`. This node banks the theory-native core of that deeper identity on the SAME banked
  derived-ℝ carrier `MetricEnd = Module.End Cut STVC`.

  ── THE THEORY-NATIVE ANCHOR (the QUIET-DRIFT catch: what does the FOLD say the textbook grinds?) ──
  The ticket toward E2 offered a coordinate-style beat: compute `∇^μ G_μν = 0` by applying the banked
  N350 operator-derivative to the metric tensor field. Ask the theory-native question FIRST: what does
  the FOLD say about "the LHS of Einstein's equations is divergence-free" that the textbook does not?

  In THIS framework, curvature is NOT a tensor written down by hand — it is the COMMUTATOR of the two
  look-back transports (banked N348: `lbCurv k₁ k₂ = [Γ₁,Γ₂]`, `Γ = lbConn k = ½·η·k`). And the
  (differential) Bianchi identity FOR A COMMUTATOR-CURVATURE connection IS the JACOBI IDENTITY of the
  transport bracket. The identity the textbook grinds coordinate-by-coordinate DISSOLVES (W1 step 2):
  it is `lie_jacobi` applied to the banked transports, FORCED by the ASSOCIATIVITY of operator
  composition on the banked derived carrier `MetricEnd = Module.End Cut STVC` — the `leibniz_lie` law
  that grounds `lie_jacobi` on `MetricEnd` holds precisely because operator composition is associative.
  ONE CAUSE (composition of look-backs is associative), the divergence structure of gravity.

  ── THE ONE FORCED FACT (the heart) ──
  `bianchi_jacobi`: the cyclic sum of the covariant-transport action on the curvature of the other two
  loop directions VANISHES, `D_{k₁}R(k₂,k₃) + D_{k₂}R(k₃,k₁) + D_{k₃}R(k₁,k₂) = 0`, closing by
  `lie_jacobi (lbConn k₁) (lbConn k₂) (lbConn k₃)` after `lbCurv_eq_bracket` ties the banked curvature
  to the Mathlib Lie bracket. `bianchi_from_associativity` bundles the load-bearing connection
  (curvature = bracket) with the identity, exhibiting the divergence structure as the fold's own
  operator-composition associativity carried by the look-back transport.

  ── SCOPE (W3) + HONEST GRADE ──
  This node banks the (differential) Bianchi identity for the COMMUTATOR-curvature (the `Γ∧Γ` layer,
  banked N348 `lbCurv`). Following the banked N351 TWO-LAYER reading (the commutator is the irreducible
  curvature; the `dΓ` derivative layer vanishes for integrable fields, measuring only
  non-integrability), this is the theory-native core of the differential Bianchi identity. The full
  nonlinear `F = dΓ + Γ∧Γ` differential Bianchi (with the derivative-layer terms) and the CONTRACTED
  Bianchi / covariant divergence `∇^μ G_μν = 0` (raising + tracing this identity via the banked `BvC`
  metric-raise + N350 operator-derivative), and E2 proper (Lovelock's uniqueness — a LITERATURE IMPORT
  / HIDDEN JOINT, CITED as machinery, NOT a framework theorem) are childed as the single successor.
  A MACHINERY node — leading-order/algebraic-layer, flagged: it asserts NO physical value; no `κ`, no
  `Λ`, no field equation written down.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N347/N348 objects) ──
    lbCurv_eq_bracket          — ★ THE LOAD-BEARING CONNECTION: the banked curvature `lbCurv k₁ k₂`
                                 (N348, the commutator of transports) IS the Mathlib Lie bracket
                                 `⁅lbConn k₁, lbConn k₂⁆` of the associative endomorphism ring.
    covTransport k C           — the covariant-transport (adjoint) action `⁅Γ(k), C⁆` (the algebraic
                                 exterior covariant derivative `[A, ·]`).
    covTransport_apply         — `covTransport k C = Γ(k)·C − C·Γ(k)`.
    covTransport_add/smul_right — BILINEAR in the transported object (bracket bilinearity).
    covTransport_add/smul_left  — BILINEAR in the transport direction (transport linearity, N347).
    bianchi_jacobi             — ★★★ THE (differential) BIANCHI IDENTITY = the JACOBI IDENTITY: the
                                 cyclic sum of the covariant-transport action on curvature VANISHES.
    covTransport_curv          — the covariant transport of the curvature is the double bracket.
    bianchi_from_associativity — ★★★ THE HEART bundled: curvature = bracket ∧ the Bianchi identity —
                                 the divergence structure is the fold's operator-composition associativity.
    curvBracket_ne_zero        — the concrete curvature-bracket is nonzero (transports don't commute).
    covTransport_curv_ne_zero  — the covariant transport of the concrete curvature is nonzero (⅛).
    bianchi_nonvacuous         — ★★ NON-VACUITY (W8): the Bianchi cancellation is real, not vacuous 0=0.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N348 `lbCurv`/`lbCurv_eq`/`lbCurv_ne_zero`/`timeProj`/
  `offDiagVar` and the banked N347 `lbConn`/`lbConn_add`/`lbConn_smul` (← N90 `sigOpC` ← the derived ℝ
  `Cut` ← the fold); `LieRing.ofAssociativeRing`/`lie_jacobi`/`of_associative_ring_bracket`/`lie_add`/
  `lie_smul` are Mathlib MACHINERY on the DERIVED associative endomorphism ring `MetricEnd`
  (exactly as `Phys/Algebra/Derivation.lean` uses `lie_jacobi` on `Module.End`). Complete:
  `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for every declaration. Words-removable:
  delete "Bianchi / curvature / transport / covariant / connection / gravity / spacetime": over the
  derived complete ordered field `Cut`, for the banked linear map `Γ = lbConn` on
  `MetricEnd = Module.End Cut STVC` and the banked commutator `lbCurv a b = [Γa,Γb]`, the cyclic sum
  `⁅Γk₁,⁅Γk₂,Γk₃⁆⁆ + ⁅Γk₂,⁅Γk₃,Γk₁⁆⁆ + ⁅Γk₃,⁅Γk₁,Γk₂⁆⁆ = 0` (the Jacobi identity of the associative
  endomorphism ring), and the terms are genuinely nonzero for the concrete `timeProj`/`offDiagVar`;
  pure Lie-ring/commutator algebra over the derived ℝ. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/algebraic-layer — flagged; the `⅛` and the
  cancellation FALL OUT of the banked `lbConn`/`lbCurv`). NO empirical number. NO Mathlib
  number-system content import (the field is the DERIVED `Cut`), NO Mathlib manifold/Riemannian/
  curvature-tensor/covariant-derivative/`HasDerivAt`/`deriv` API as content (`LieRing.ofAssociativeRing`/
  `lie_jacobi`/`of_associative_ring_bracket`/`lie_add`/`lie_smul` are machinery on the derived carrier;
  the curvature is the banked derived `lbCurv`, the transport the banked derived `lbConn`). NO posited
  Bianchi/Jacobi identity (it is `lie_jacobi` of the banked derived transports; the curvature IS the
  banked commutator, PROVED). NO kernel-trust bypass, NO `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeEinsteinTensor
import Mathlib.Algebra.Lie.OfAssociative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The banked curvature IS the Lie bracket of the two look-back transports. -/

/-- ★ THE LOAD-BEARING CONNECTION: the banked curvature `lbCurv k₁ k₂ = [Γ₁,Γ₂]` (N348, the
    commutator of the two transports `Γᵢ = lbConn kᵢ`) is EXACTLY the Mathlib Lie bracket
    `⁅lbConn k₁, lbConn k₂⁆` of the associative endomorphism ring `MetricEnd`. This ties the banked
    derived curvature to the Lie structure whose Jacobi identity is the (differential) Bianchi
    identity. -/
theorem lbCurv_eq_bracket (k₁ k₂ : MetricEnd) :
    lbCurv k₁ k₂ = ⁅lbConn k₁, lbConn k₂⁆ :=
  (LieRing.of_associative_ring_bracket (lbConn k₁) (lbConn k₂)).symm

/-! ## (2) The covariant-transport action (the algebraic exterior covariant derivative). -/

/-- THE COVARIANT-TRANSPORT ACTION on an operator-valued object `C`: the adjoint action
    `covTransport k C = ⁅Γ(k), C⁆ = [lbConn k, C]`. This is the algebraic part of the exterior
    covariant derivative `D` (the `[A, ·]` term) acting on a curvature-valued object. -/
def covTransport (k C : MetricEnd) : MetricEnd := ⁅lbConn k, C⁆

/-- `covTransport k C = Γ(k)·C − C·Γ(k)` — the raw commutator form. -/
theorem covTransport_apply (k C : MetricEnd) : covTransport k C = lbConn k * C - C * lbConn k :=
  LieRing.of_associative_ring_bracket (lbConn k) C

/-- The covariant transport action is ADDITIVE in the transported object `C` (bracket additivity). -/
theorem covTransport_add_right (k C₁ C₂ : MetricEnd) :
    covTransport k (C₁ + C₂) = covTransport k C₁ + covTransport k C₂ := by
  simp only [covTransport_apply]; noncomm_ring

/-- The covariant transport action is HOMOGENEOUS in the transported object `C`. -/
theorem covTransport_smul_right (c : Cut) (k C : MetricEnd) :
    covTransport k (c • C) = c • covTransport k C := by
  simp only [covTransport_apply]; rw [mul_smul_comm, smul_mul_assoc, smul_sub]

/-- The covariant transport action is ADDITIVE in the transport direction `k` (transport linearity,
    banked N347 `lbConn_add`). -/
theorem covTransport_add_left (k₁ k₂ C : MetricEnd) :
    covTransport (k₁ + k₂) C = covTransport k₁ C + covTransport k₂ C := by
  simp only [covTransport_apply]; rw [lbConn_add]; noncomm_ring

/-- The covariant transport action is HOMOGENEOUS in the transport direction `k` (banked `lbConn_smul`). -/
theorem covTransport_smul_left (c : Cut) (k C : MetricEnd) :
    covTransport (c • k) C = c • covTransport k C := by
  simp only [covTransport_apply]; rw [lbConn_smul, smul_mul_assoc, mul_smul_comm, smul_sub]

/-! ## (3) THE HEART: the (differential) Bianchi identity IS the Jacobi identity. -/

/-- ★★★ THE (differential) BIANCHI IDENTITY as the JACOBI IDENTITY. The cyclic sum of the
    covariant-transport action on the curvature of the other two loop directions VANISHES:
        `D_{k₁} R(k₂,k₃) + D_{k₂} R(k₃,k₁) + D_{k₃} R(k₁,k₂) = 0`.
    In standard GR the (second/differential) Bianchi identity `∇_[a R_bc]de = 0` is proved by a
    coordinate computation on the Riemann tensor's derivatives. Here it DISSOLVES (W1 step 2):
    curvature is the transport commutator (`lbCurv_eq_bracket`, banked N348), so the Bianchi identity
    is exactly the Jacobi identity `lie_jacobi` of the transport bracket — FORCED by the ASSOCIATIVITY
    of operator composition (the `leibniz_lie` that grounds `lie_jacobi` on `MetricEnd` IS the
    associativity of the endomorphism ring). ONE CAUSE (composition of look-backs is associative), the
    divergence structure of gravity. -/
theorem bianchi_jacobi (k₁ k₂ k₃ : MetricEnd) :
    covTransport k₁ (lbCurv k₂ k₃)
      + covTransport k₂ (lbCurv k₃ k₁)
      + covTransport k₃ (lbCurv k₁ k₂) = 0 := by
  unfold covTransport
  rw [lbCurv_eq_bracket, lbCurv_eq_bracket, lbCurv_eq_bracket]
  exact lie_jacobi (lbConn k₁) (lbConn k₂) (lbConn k₃)

/-- The Bianchi identity written PURELY in the banked curvature and the raw transport bracket — the
    covariant transport of the curvature is the double bracket `[Γ(k), [Γ(a),Γ(b)]]`. -/
theorem covTransport_curv (k a b : MetricEnd) :
    covTransport k (lbCurv a b) = ⁅lbConn k, ⁅lbConn a, lbConn b⁆⁆ := by
  unfold covTransport; rw [lbCurv_eq_bracket]

/-- ★★★ THE HEART bundled: the Bianchi identity is FORCED by the associativity of operator
    composition. The load-bearing connection (curvature = bracket for ALL directions) together with
    the vanishing cyclic sum exhibits the divergence structure of gravity as the fold's own
    operator-composition associativity carried by the look-back transport. -/
theorem bianchi_from_associativity (k₁ k₂ k₃ : MetricEnd) :
    (∀ a b : MetricEnd, lbCurv a b = ⁅lbConn a, lbConn b⁆)
      ∧ covTransport k₁ (lbCurv k₂ k₃)
          + covTransport k₂ (lbCurv k₃ k₁)
          + covTransport k₃ (lbCurv k₁ k₂) = 0 :=
  ⟨lbCurv_eq_bracket, bianchi_jacobi k₁ k₂ k₃⟩

/-! ## (4) NON-VACUITY (W8): the Bianchi identity is a genuine cancellation of nonzero curvatures. -/

/-- The curvature-bracket is genuinely NONZERO for the concrete pair — the transports fail to
    commute, so the Bianchi identity is not a vacuous `0 = 0` (the terms being cancelled are real). -/
theorem curvBracket_ne_zero : ⁅lbConn timeProj, lbConn offDiagVar⁆ ≠ 0 := by
  rw [← lbCurv_eq_bracket]; exact lbCurv_ne_zero

/-- The covariant transport of the concrete curvature is itself NONZERO: transporting the nonzero
    curvature `R(offDiagVar,timeProj)` along `timeProj` gives a nonzero object, so the Bianchi
    cancellation is genuine, not termwise-trivial. Applied to `(0,1,0)` its first component is `⅛`. -/
theorem covTransport_curv_ne_zero :
    covTransport timeProj (lbCurv offDiagVar timeProj) ≠ 0 := by
  intro hcon
  have h := congrArg (fun (f : MetricEnd) => (f ((0:Cut),(1:Cut),(0:O Cut))).1) hcon
  rw [covTransport_apply] at h
  simp only [LinearMap.zero_apply, Prod.fst_zero, LinearMap.sub_apply, Module.End.mul_apply,
    lbCurv_eq, lbConn, LinearMap.smul_apply, sigOpC_apply, timeProj_apply, offDiagVar_apply,
    Prod.smul_fst, Prod.fst_sub, neg_zero, Prod.smul_snd] at h
  norm_num at h

/-- ★★ NON-VACUITY (W8): the Bianchi identity holds AND the curvature it acts on is genuinely
    nonzero — the identity is a real cancellation of nonzero terms, not a vacuous `0 = 0`. -/
theorem bianchi_nonvacuous :
    (covTransport timeProj (lbCurv offDiagVar timeProj)
      + covTransport offDiagVar (lbCurv timeProj timeProj)
      + covTransport timeProj (lbCurv timeProj offDiagVar) = 0)
      ∧ ⁅lbConn timeProj, lbConn offDiagVar⁆ ≠ 0 :=
  ⟨bianchi_jacobi timeProj offDiagVar timeProj, curvBracket_ne_zero⟩

end

end Phys.Algebra
