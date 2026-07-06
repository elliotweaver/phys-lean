/-
  Phys.Algebra.SpacetimeCurvature — N348 (arc-E E1c): CURVATURE = THE LOOK-BACK TRANSPORT'S
  NON-CLOSURE — the two transports failing to commute, `R(k₁,k₂) = [Γ₁, Γ₂]`.
  ===========================================================================
  DIRECTED SUCCESSOR of N347 (E1b, `Phys/Algebra/SpacetimeConnection.lean`), which banked the
  look-back transport (connection) `Γ = lbConn k = ½·η·k` and — its ★★★ result —
  METRIC-COMPATIBILITY `Γᵀη + ηΓ = k`, DERIVED EXACTLY from `η·η = 1`. E1c builds the NEXT and
  final forced object of the general-relativity machinery on the SAME banked derived-ℝ carrier
  `MetricEnd = Module.End Cut STVC`: the CURVATURE.

  ── THE THEORY-NATIVE ANCHOR (curvature IS the transport's non-closure, NOT a posited tensor) ──
  Curvature is NOT a tensor written down by hand. The connection is the fold's LOOK-BACK TRANSPORT
  (N347); CURVATURE is what happens when you carry the transport around a closed LOOP and DO NOT
  return where you started — the transport FAILS TO COMMUTE. For two metric variations `k₁, k₂`
  (directions of the loop), the curvature is the COMMUTATOR of the two transports:
      `R(k₁,k₂) := Γ₁·Γ₂ − Γ₂·Γ₁ = [lbConn k₁, lbConn k₂]`.
  This is the fold's SELF-BLINDNESS at the connection level: the SAME non-closure that appeared at
  the metric level as N346's residual `(hη)²` (the self-overlap failing to undo), now at the
  transport level as `[Γ₁,Γ₂] ≠ 0`.

  ── THE ONE FORCED FACT (the heart): compatibility survives locally, curvature survives it ──
  Every individual transport is metric-compatible — it PRESERVES the Born self-overlap (N347
  `metricCompat`, holding for ALL `k`, forced by `η²=1`). YET their commutator need not vanish.
  Curvature is the residual non-closure that survives even when every single transport preserves the
  self-overlap. That is precisely the fold's self-blindness: locally the look-back undoes itself
  (flat, compatible), globally-around-a-loop it does not (curved). One cause (`η²=1`) makes every
  transport preserve the metric; ANOTHER termination: their commutator is a genuine obstruction
  (`curvature_from_compatible_transports`).

  The closed form falls straight out of `Γ = ½ηk`:
      `R(k₁,k₂) = ¼·(η·k₁·η·k₂ − η·k₂·η·k₁)`  (`lbCurv_eq`).

  ── SCOPE (W3 — this beat is the ALGEBRAIC (commutator / `Γ∧Γ`) part; the derivative is childed) ──
  The full linearized Riemann is the standard `F = dΓ + Γ∧Γ`: the antisymmetrized DERIVATIVE of the
  connection `∂Γ − ∂Γ` PLUS the commutator `[Γ,Γ]`. This node builds the EXACT commutator (`Γ∧Γ`)
  part — the theory-native heart (the transports failing to commute). The derivative (`∂Γ`) part
  needs the multivariate directional-derivative machinery producing `k = ∂h` on the derived-ℝ
  tangent structure (the banked `cut_powerseries_deriv` (N41g) / `...Deriv2` (N182) are SCALAR-only
  power-series limits — a genuine multivariate operator derivative on `Cut` is not yet banked), and
  is childed to E1c-deriv. The Ricci/scalar TRACE contractions need the finite basis of `STVC` and
  are childed too. Weak-field is sufficient to reach E2/E3 (per docs/SEED_GR_BLACKHOLE_COSMOLOGY.md
  §E1). A MACHINERY node: it asserts NO physical value; it is flagged leading-order/mechanism-grade.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N346/N347/N90 objects) ──
    lbCurv                          — the CURVATURE `R(k₁,k₂) = [Γ₁,Γ₂]` (commutator of transports).
    lbCurv_eq                       — the closed form `R = ¼·(η·k₁·η·k₂ − η·k₂·η·k₁)`.
    lbCurv_antisymm                 — ★ LOOP ORIENTATION: `R(k₁,k₂) = −R(k₂,k₁)` (a 2-form).
    lbCurv_self                     — a degenerate one-direction loop encloses no area: `R(k,k) = 0`.
    lbCurv_flat_left / _right       — no variation ⟹ no transport ⟹ no curvature (flat spacetime).
    lbCurv_add_left / _right        — BILINEAR in the two metric variations (additivity).
    lbCurv_smul_left / _right       — BILINEAR in the two metric variations (homogeneity).
    lbCurv_parallel                 — parallel/proportional variations give no curvature: `R(k,c·k)=0`.
    offDiagVar / offDiagVar_apply    — a second CONCRETE variation (a shear `(t,x,v) ↦ (x,0,0)`).
    lbCurv_ne_zero                  — ★★ NON-VACUITY (W8): for the concrete pair `(timeProj,
                                      offDiagVar)`, `R ≠ 0` — spacetime CAN be curved; the fold's
                                      non-closure is genuine, not vacuous.
    curvature_from_compatible_transports — ★★★ THE HEART: every transport is metric-compatible
                                      (`∀k, Γᵀη+ηΓ = k`) YET the curvature (their commutator) is a
                                      nonzero obstruction. Local compatibility, global non-closure.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N347 `lbConn`/`lbConnAdj`/`metricCompat`, the N346
  `MetricEnd`/`eta_mul_self`/`timeProj`, and the N90 `sigOpC` ← the derived ℝ `Cut` ← the fold;
  `Module.End`/`•`/`noncomm_ring` are Mathlib MACHINERY on the DERIVED carrier. Complete:
  `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for every declaration. Words-removable:
  delete "curvature / Riemann / loop / gravity / spacetime": over the derived complete ordered field
  `Cut`, for the involution `η` (`η·η = 1`) and endomorphisms `Γᵢ = ½ηkᵢ`, the commutator
  `[Γ₁,Γ₂] = ¼·(η·k₁·η·k₂ − η·k₂·η·k₁)` is antisymmetric in `(k₁,k₂)`, vanishes when `k₁=0` or
  `k₂ = c·k₁`, and is nonzero for the concrete pair; pure noncommutative-ring algebra with a scalar
  `¼`. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/linearized — flagged). NO empirical number. NO
  Mathlib number-system content import (the field is the DERIVED `Cut`), NO Mathlib manifold/
  Riemannian/curvature-tensor API as content, NO posited curvature tensor (it is the commutator of
  the DERIVED transport; non-vacuity is PROVED). NO kernel-trust bypass, NO `maxHeartbeats` raise,
  NO coordinate bash (the closed form is a dimension-free ring identity from `η² = 1`).
-/
import Phys.Algebra.SpacetimeConnection

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The curvature `R(k₁,k₂) = [Γ₁,Γ₂]` — the two look-back transports failing to commute. -/

/-- THE CURVATURE (linearized, commutator part) generated by two metric variations `k₁, k₂` — the
    directions of an infinitesimal loop: `R(k₁,k₂) := Γ₁·Γ₂ − Γ₂·Γ₁`, the COMMUTATOR of the two
    look-back transports `Γᵢ = lbConn kᵢ`. Curvature is NOT a posited tensor; it IS the transport's
    non-closure — the fold's self-blindness at the connection level. -/
def lbCurv (k₁ k₂ : MetricEnd) : MetricEnd := lbConn k₁ * lbConn k₂ - lbConn k₂ * lbConn k₁

/-- THE CLOSED FORM: `R(k₁,k₂) = ¼·(η·k₁·η·k₂ − η·k₂·η·k₁)`. Falls straight out of `Γ = ½·η·k`
    (the two `½`'s giving `¼`); curvature is `η`-times the `η`-twisted commutator of the variations. -/
theorem lbCurv_eq (k₁ k₂ : MetricEnd) :
    lbCurv k₁ k₂ = (4⁻¹ : Cut) • (sigOpC * k₁ * sigOpC * k₂ - sigOpC * k₂ * sigOpC * k₁) := by
  unfold lbCurv lbConn
  rw [smul_mul_smul_comm, smul_mul_smul_comm]
  have h4 : (2⁻¹ * 2⁻¹ : Cut) = 4⁻¹ := by norm_num
  rw [h4, smul_sub]
  congr 2

/-! ## (2) The forced 2-form structure: antisymmetry, degenerate loops, flat limit, bilinearity. -/

/-- ★ LOOP ORIENTATION: reversing the loop reverses the curvature — `R(k₁,k₂) = −R(k₂,k₁)`. The
    curvature is an antisymmetric 2-form in the loop directions (a commutator is antisymmetric). -/
theorem lbCurv_antisymm (k₁ k₂ : MetricEnd) : lbCurv k₁ k₂ = - lbCurv k₂ k₁ := by
  unfold lbCurv; abel

/-- A DEGENERATE LOOP (one direction, `k₁ = k₂`) encloses no area, so no curvature: `R(k,k) = 0`. -/
theorem lbCurv_self (k : MetricEnd) : lbCurv k k = 0 := by
  unfold lbCurv; abel

/-- THE FLAT LIMIT (left): no variation in the first direction ⟹ no transport ⟹ no curvature. -/
theorem lbCurv_flat_left (k : MetricEnd) : lbCurv 0 k = 0 := by
  unfold lbCurv; rw [lbConn_flat]; simp

/-- THE FLAT LIMIT (right): no variation in the second direction ⟹ no curvature. -/
theorem lbCurv_flat_right (k : MetricEnd) : lbCurv k 0 = 0 := by
  unfold lbCurv; rw [lbConn_flat]; simp

/-- BILINEAR (left-additive): `R(k₁+k₂, k₃) = R(k₁,k₃) + R(k₂,k₃)`. -/
theorem lbCurv_add_left (k₁ k₂ k₃ : MetricEnd) :
    lbCurv (k₁ + k₂) k₃ = lbCurv k₁ k₃ + lbCurv k₂ k₃ := by
  unfold lbCurv; rw [lbConn_add]; noncomm_ring

/-- BILINEAR (right-additive): `R(k₁, k₂+k₃) = R(k₁,k₂) + R(k₁,k₃)`. -/
theorem lbCurv_add_right (k₁ k₂ k₃ : MetricEnd) :
    lbCurv k₁ (k₂ + k₃) = lbCurv k₁ k₂ + lbCurv k₁ k₃ := by
  unfold lbCurv; rw [lbConn_add]; noncomm_ring

/-- BILINEAR (left-homogeneous): `R(c·k₁, k₂) = c·R(k₁,k₂)`. -/
theorem lbCurv_smul_left (c : Cut) (k₁ k₂ : MetricEnd) :
    lbCurv (c • k₁) k₂ = c • lbCurv k₁ k₂ := by
  unfold lbCurv; rw [lbConn_smul, mul_smul_comm, smul_mul_assoc, smul_sub]

/-- BILINEAR (right-homogeneous): `R(k₁, c·k₂) = c·R(k₁,k₂)`. -/
theorem lbCurv_smul_right (c : Cut) (k₁ k₂ : MetricEnd) :
    lbCurv k₁ (c • k₂) = c • lbCurv k₁ k₂ := by
  unfold lbCurv; rw [lbConn_smul, mul_smul_comm, smul_mul_assoc, smul_sub]

/-- PARALLEL variations give no curvature: `R(k, c·k) = 0`. A 2-form is degenerate on parallel
    (proportional) directions — the loop collapses to a line. -/
theorem lbCurv_parallel (c : Cut) (k : MetricEnd) : lbCurv k (c • k) = 0 := by
  rw [lbCurv_smul_right, lbCurv_self, smul_zero]

/-! ## (3) NON-VACUITY (W8): spacetime CAN be curved — a concrete pair gives nonzero curvature. -/

/-- A SECOND CONCRETE variation: the shear `(t,x,v) ↦ (x,0,0)` (carries the space-x line into the
    time line). Paired with the banked `timeProj` it witnesses that the curvature is genuinely
    nonzero — the two transports do NOT commute. -/
def offDiagVar : MetricEnd where
  toFun p := (p.2.1, 0, 0)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show (0:Cut) = 0 + 0; ring
    · show (0:O Cut) = 0 + 0; rw [add_zero]
  map_smul' c p := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show (0:Cut) = c • 0; rw [smul_zero]
    · show (0:O Cut) = c • 0; rw [smul_zero]

theorem offDiagVar_apply (p : STVC) : offDiagVar p = (p.2.1, 0, 0) := rfl

/-- ★★ NON-VACUITY (W8): for the concrete pair `(timeProj, offDiagVar)`, the curvature is NONZERO —
    `R(timeProj, offDiagVar) ≠ 0`. Spacetime CAN be curved: the two look-back transports genuinely
    fail to commute; the fold's non-closure is real, not a vacuous "curvature always vanishes"
    reading. (Applied to `(0,1,0)`, the first component is `¼ ≠ 0`.) -/
theorem lbCurv_ne_zero : lbCurv timeProj offDiagVar ≠ 0 := by
  intro hcon
  have h := congrArg (fun (f : MetricEnd) => (f ((0:Cut), (1:Cut), (0 : O Cut))).1) hcon
  simp only [LinearMap.zero_apply, Prod.fst_zero] at h
  rw [lbCurv_eq] at h
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_fst, Prod.fst_sub,
    neg_zero, sub_zero] at h
  exact (by norm_num : (4⁻¹ : Cut) • (1:Cut) ≠ 0) h

/-! ## (4) THE HEART: local metric-compatibility survives; the curvature is the residual obstruction. -/

/-- ★★★ THE THEORY-NATIVE HEART — local compatibility, global non-closure. EVERY look-back transport
    is metric-compatible (`∀ k, Γᵀη + ηΓ = k`, the banked `metricCompat`, forced by `η²=1`), and YET
    the curvature (the commutator of two such transports) is a nonzero obstruction. Curvature is the
    residual non-closure that survives even when every single transport preserves the Born
    self-overlap — the fold's self-blindness at the connection level. One cause (`η²=1`) makes every
    transport preserve the metric; another termination: their commutator does not vanish. -/
theorem curvature_from_compatible_transports :
    (∀ k : MetricEnd, lbConnAdj k * sigOpC + sigOpC * lbConn k = k)
      ∧ lbCurv timeProj offDiagVar ≠ 0 :=
  ⟨metricCompat, lbCurv_ne_zero⟩

end

end Phys.Algebra
