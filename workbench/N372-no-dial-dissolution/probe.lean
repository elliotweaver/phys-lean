import Phys.Algebra.FoldPotentialCriticality
import Phys.Algebra.StrongCPTheta
import Mathlib.Tactic

/-! N372 probe — the no-dial / dissolution consolidation. MEASURE the load-bearing obligations. -/

namespace Phys.Foundation.ContinuumQ

open Phys.Algebra
open Phys.Cascade
open Phys.Cascade.CD
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD

-- (1) THE Λ LEG: the vacuum energy at the fold-origin is EXACTLY 0 (the Born self-overlap min).
theorem probe_vac_zero (c : Cut) : plateauApproachPot c 0 = 0 := by
  unfold plateauApproachPot
  rw [mul_zero, neg_zero, cutExp_zero]; ring

-- (2) NO-DIAL RIGIDITY (Λ): adding a positive constant Λ₀ makes the potential STRICTLY positive
-- everywhere on φ≥0 — the exact-zero minimum of the self-overlap is destroyed. There is no bare Λ.
theorem probe_no_lambda_dial (c Λ₀ φ : Cut) (hΛ : 0 < Λ₀) (hc : 0 < c) (hφ : 0 ≤ φ) :
    0 < plateauApproachPot c φ + Λ₀ := by
  have := plateauApproachPot_nonneg c φ
  linarith

-- and the dialed origin value is Λ₀ ≠ 0 (the minimum shifts off zero).
theorem probe_dial_origin (c Λ₀ : Cut) : plateauApproachPot c 0 + Λ₀ = Λ₀ := by
  rw [probe_vac_zero]; ring

-- (3) HIERARCHY LEG: the mass² (curvature at the min) is FORCED = 2c² (banked N370).
theorem probe_mass_forced (c : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (foldPotentialDeriv c) (2 * c ^ 2) 0 :=
  foldPotential_secondDeriv_origin c hc

-- (4) STRONG CP LEG: the determinant has EXACTLY ZERO phase (banked N367). Re-cite over O ℚ.
open Phys.Algebra.HJ in
theorem probe_theta_zero (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    detArena d0 d1 d2 a b c - ocR (reQ (detArena d0 d1 d2 a b c)) = 0 :=
  theta_det_phase_zero d0 d1 d2 a b c

end Phys.Foundation.ContinuumQ
