/-
  Phys.Algebra.SpacetimeConnection — N347 (arc-E E1b): THE CONNECTION = THE FOLD'S LOOK-BACK
  TRANSPORT, with METRIC-COMPATIBILITY `Γᵀη + ηΓ = k` derived EXACTLY from `η·η = 1`.
  ===========================================================================
  DIRECTED SUCCESSOR of N346 (E1a, `Phys/Algebra/SpacetimeWeakFieldMetric.lean`), which banked the
  weak-field metric `g = η + h` and its exact linearized inverse over the derived ℝ `Cut`. E1b builds
  the NEXT forced object of the general-relativity machinery: the CONNECTION (the transport that says
  how the metric is carried from a point to its neighbour), on the SAME banked derived-ℝ carrier
  `MetricEnd = Module.End Cut STVC` and the SAME banked flat reference `η := sigOpC` (N90).

  ── THE THEORY-NATIVE ANCHOR (the connection IS the look-back transport, NOT a posited field) ──
  Gravity's connection is NOT a new gauge field written down by hand. It IS the fold's LOOK-BACK
  TRANSPORT — the same structure that normalized `α` (the H² look-back face): the infinitesimal
  carrying of the Born self-overlap (the metric) from one point to the next. For a metric VARIATION
  `k` (physically `k = ∂_λ h`, the directional change of the weak field `h`), the linearized transport
  is `Γ := ½ · η · k` — the flat inverse `η` (banked `η·η = 1`) contracts the variation, with the
  Christoffel `½`.

  ── THE ONE FORCED FACT: metric-compatibility, DERIVED from `η·η = 1` (not imposed) ──
  The DEFINING property of the Levi-Civita connection is metric-compatibility `∇g = 0`: the transport
  PRESERVES the self-overlap. Standard general relativity IMPOSES this as an axiom and solves for the
  Christoffel symbols. Here it is the reverse — metric-compatibility FALLS OUT of the flat self-overlap
  undoing itself. At the flat reference (`g = η`, variation `∂g = k`, transport `Γ = ½ηk`), the
  compatibility operator identity is
      `Γᵀ · η + η · Γ  =  (½ k η) · η + η · (½ η k)  =  ½ k + ½ k  =  k`,
  where BOTH `η·η = 1` factors (the banked `eta_mul_self`) and `½ + ½ = 1` close it EXACTLY. The SAME
  "one cause" (`η² = 1`, the flat self-overlap undoing itself) that made N346's linearized inverse work
  now FORCES the transport to preserve the metric. One cause, another termination — we DERIVE what the
  field POSITS.

  ── SCOPE (W3 — this beat is the algebraic metric-compatibility TEMPLATE; the derivative is childed) ──
  The physical variation `k = ∂_λ h` is produced by a DIRECTIONAL DERIVATIVE of the operator field `h`
  on the derived-ℝ tangent structure. That multivariate operator-field derivative is a heavier W1
  build (the banked `cut_powerseries_deriv` (N41g) / `...Deriv2` (N182) are SCALAR power-series limits
  — a genuine multivariate operator derivative on `Cut` is not yet banked), and is childed to the E1c
  curvature build. THIS node banks the exact ALGEBRAIC metric-compatibility identity the derivative
  feeds — the leading-order (linearized) transport template. A MACHINERY node: it asserts NO physical
  value; it is flagged leading-order/mechanism-grade here.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N346/N90 objects) ──
    lbConn / lbConnAdj        — the look-back transport `Γ = ½·η·k` and its adjoint `½·k·η`.
    metricCompat              — ★★★ METRIC-COMPATIBILITY `Γᵀη + ηΓ = k`, EXACT, from `η·η = 1`.
                                The DEFINING connection property, DERIVED (not imposed).
    lbConn_flat               — no variation (`k = 0`) ⟹ no transport (`Γ = 0`): flat, no curvature.
    lbConn_add / lbConn_smul  — the transport is linear/homogeneous in the metric variation.
    lbConn_isEvCAdjoint       — for a self-adjoint (symmetric) variation `k`, `Γ` and `Γᵀ` are genuine
                                EvC-adjoints (via banked `sigOpC_isEvCAdjoint_self`).
    wrongConn_not_compatible  — ★★ NON-VACUITY (W8): DROPPING the Christoffel `½` (the naive transport
                                `η·k`) FAILS metric-compatibility for the concrete `timeProj` variation
                                (it gives `2k ≠ k`). The `½` is genuinely load-bearing.
    lbConn_ne_zero            — ★ a nonzero variation gives a nonzero transport (`Γ(timeProj) ≠ 0`).

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N346 `MetricEnd`/`eta_mul_self` and N90 `sigOpC`/
  `IsEvCAdjoint`/`EvC` ← N43/N49–N90 ← the derived ℝ `Cut` ← the fold; `Module.End`/`•`/`noncomm_ring`
  are Mathlib MACHINERY on the DERIVED carrier. Complete: `#print axioms ⊆ {propext, Classical.choice,
  Quot.sound}` for every declaration. Words-removable: delete "connection / transport / Christoffel /
  gravity / metric / compatibility": over the derived complete ordered field `Cut`, for the involution
  `η` (`η·η = 1`) and any endomorphism `k`, `(½·k·η)·η + η·(½·η·k) = k`, and dropping the `½` makes the
  identity fail for the concrete `k = timeProj` (`≠ 0`); pure noncommutative-ring algebra with a scalar
  `½`. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/linearized — flagged). NO empirical number. NO
  Mathlib number-system content import (the field is the DERIVED `Cut`), NO Mathlib manifold/connection/
  deriv API as content, NO posited connection (it is `½·η·k`; compatibility is PROVED from `η²=1`, not
  assumed). NO kernel-trust bypass, NO `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeWeakFieldMetric

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The look-back transport `Γ = ½·η·k` (connection) and its adjoint. -/

/-- THE LOOK-BACK TRANSPORT (linearized connection) generated by a metric variation `k`:
    `Γ := ½ · η · k`, with the flat reference `η = sigOpC` (banked `η·η = 1`) contracting the
    variation and the Christoffel `½`. Physically `k = ∂_λ h` (the directional change of the weak
    field `h`); the derivative producing `k` is childed to the curvature build. -/
def lbConn (k : MetricEnd) : MetricEnd := (2⁻¹ : Cut) • (sigOpC * k)

/-- THE ADJOINT TRANSPORT `Γᵀ := ½ · k · η` — the EvC-adjoint of `lbConn k` for a symmetric
    variation `k`. -/
def lbConnAdj (k : MetricEnd) : MetricEnd := (2⁻¹ : Cut) • (k * sigOpC)

/-! ## (2) METRIC-COMPATIBILITY, derived exactly from `η·η = 1`. -/

/-- ★★★ METRIC-COMPATIBILITY of the look-back transport: `Γᵀ·η + η·Γ = k`, EXACT. The DEFINING
    property of the Levi-Civita connection — `∇g = 0`, the transport preserves the Born self-overlap.
    Standard general relativity IMPOSES this and solves for the connection; here it is DERIVED: it
    falls out of the flat self-overlap undoing itself (`η·η = 1`, banked `eta_mul_self`) together with
    `½ + ½ = 1`. The SAME "one cause" (`η² = 1`) that made N346's linearized inverse close now FORCES
    the transport to preserve the metric. Words-removable: for any `η·η = 1` and any `k` over `Cut`,
    `(½·k·η)·η + η·(½·η·k) = k`. -/
theorem metricCompat (k : MetricEnd) :
    lbConnAdj k * sigOpC + sigOpC * lbConn k = k := by
  unfold lbConn lbConnAdj
  rw [smul_mul_assoc, mul_smul_comm, mul_assoc, eta_mul_self, mul_one,
      ← mul_assoc, eta_mul_self, one_mul, ← add_smul]
  norm_num

/-! ## (3) The flat limit, linearity, and the adjoint structure. -/

/-- THE FLAT LIMIT: no metric variation (`k = 0`) ⟹ no transport (`Γ = 0`). No variation, no
    connection, no curvature — flat spacetime. -/
theorem lbConn_flat : lbConn 0 = 0 := by
  unfold lbConn; simp

/-- The transport is ADDITIVE in the metric variation: `Γ(k₁ + k₂) = Γ(k₁) + Γ(k₂)`. -/
theorem lbConn_add (k₁ k₂ : MetricEnd) : lbConn (k₁ + k₂) = lbConn k₁ + lbConn k₂ := by
  unfold lbConn; rw [mul_add, smul_add]

/-- The transport is HOMOGENEOUS in the metric variation: `Γ(c·k) = c·Γ(k)`. -/
theorem lbConn_smul (c : Cut) (k : MetricEnd) : lbConn (c • k) = c • lbConn k := by
  unfold lbConn; rw [mul_smul_comm, smul_comm]

/-- For a SELF-ADJOINT (symmetric) metric variation `k` (`IsEvCAdjoint k k` — physically `k = ∂h`
    with `h` symmetric), the transport `Γ = lbConn k` and its adjoint `Γᵀ = lbConnAdj k` are genuine
    EvC-adjoints. Uses the banked `sigOpC_isEvCAdjoint_self` (`η` is self-adjoint) and `EvC`
    bilinearity. -/
theorem lbConn_isEvCAdjoint {k : MetricEnd} (hk : IsEvCAdjoint k k) :
    IsEvCAdjoint (lbConn k) (lbConnAdj k) := by
  unfold lbConn lbConnAdj
  intro p q
  simp only [LinearMap.smul_apply]
  rw [EvC_smul_left, EvC_smul_right]
  congr 1
  show EvC (sigOpC (k p)) q = EvC p (k (sigOpC q))
  rw [sigOpC_isEvCAdjoint_self (k p) q, hk p (sigOpC q)]

/-! ## (4) NON-VACUITY (W8): the Christoffel `½` is load-bearing, and the transport is nontrivial. -/

/-- ★★ NON-VACUITY (W8): DROPPING the Christoffel `½` breaks metric-compatibility. The naive transport
    `η·k` (no `½`) gives `(η·k)ᵀ·η + η·(η·k) = k·η·η + η·η·k = 2k`, which is `≠ k` for the concrete
    nonzero variation `timeProj`. The factor `½` in `lbConn` is genuinely load-bearing — a vacuous
    reading where any `η`-scaled operator is metric-compatible is refuted. -/
theorem wrongConn_not_compatible :
    (timeProj * sigOpC) * sigOpC + sigOpC * (sigOpC * timeProj) ≠ (timeProj : MetricEnd) := by
  rw [mul_assoc, eta_mul_self, mul_one, ← mul_assoc, eta_mul_self, one_mul]
  intro hcon
  have hz : (timeProj : MetricEnd) = 0 := by
    have h2 : timeProj + timeProj = timeProj := hcon
    linear_combination (norm := abel) h2
  exact timeProj_ne_zero hz

/-- ★ A nonzero metric variation gives a NONZERO transport: `Γ(timeProj) ≠ 0`. The connection is not
    trivially zero — since `½ ≠ 0` and `η` is invertible (`η·η = 1`). -/
theorem lbConn_ne_zero : lbConn timeProj ≠ 0 := by
  unfold lbConn
  intro hcon
  rw [smul_eq_zero] at hcon
  rcases hcon with h | h
  · exact (by norm_num : (2⁻¹ : Cut) ≠ 0) h
  · have hz : sigOpC * (sigOpC * timeProj) = sigOpC * 0 := by rw [h]
    rw [← mul_assoc, eta_mul_self, one_mul, mul_zero] at hz
    exact timeProj_ne_zero hz

end

end Phys.Algebra
