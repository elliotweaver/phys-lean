import Phys.Algebra.SpacetimeBlackHoleEntropy
import Mathlib.Tactic
import Mathlib.Topology.Algebra.Field
import Mathlib.Topology.Algebra.Order.Field

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open Filter Topology

-- (from Probe1, assumed banked)
axiom hasCutDerivAt_inv (x : Cut) (hx : x ≠ 0) :
    HasCutDerivAt (fun y => y⁻¹) (-(x^2)⁻¹) x

-- The metric function f(r) = 1 - 2M·r⁻¹  (Schwarzschild), M,r symbolic Cut anchors.
noncomputable def metricF (M r : Cut) : Cut := 1 - 2 * M * r⁻¹

-- helper: linearity rules for the local HasCutDerivAt (add const, const_mul, sub via neg)
-- d/dr metricF = -2M · (-(r²)⁻¹) = 2M·(r²)⁻¹   at r ≠ 0
theorem metricF_deriv (M r : Cut) (hr : r ≠ 0) :
    HasCutDerivAt (fun s => metricF M s) (2 * M * (r^2)⁻¹) r := by
  have hinv := hasCutDerivAt_inv r hr
  -- const_mul by (2M): d/dr (2M · r⁻¹) = 2M · (-(r²)⁻¹)
  have h1 := hasCutDerivAt_const_mul (2 * M) hinv
  -- now the function fun s => 2M · s⁻¹ has deriv 2M·(-(r²)⁻¹); wrap with 1 - (…):
  -- HasCutDerivAt is difference-quotient of (f(x+t)-f(x)); constant 1 cancels, and negation flips sign.
  unfold HasCutDerivAt at h1 ⊢
  -- difference quotient of metricF = -(difference quotient of (2M·s⁻¹))
  have hcongr : (fun t : Cut => t⁻¹ * (metricF M (r + t) - metricF M r))
      =ᶠ[𝓝[≠] (0:Cut)] (fun t : Cut => -(t⁻¹ * ((2*M*(r+t)⁻¹) - (2*M*r⁻¹)))) := by
    filter_upwards with t
    unfold metricF; ring
  rw [tendsto_congr' hcongr]
  have hneg := h1.neg
  have hval : -(2 * M * -(r^2)⁻¹) = 2 * M * (r^2)⁻¹ := by ring
  rw [hval] at hneg
  exact hneg

-- Surface gravity κ_sg = f'(r_h)/2, and at r_h = 2M it equals (4M)⁻¹.
theorem surfaceGravity_at_horizon (M : Cut) (hM : M ≠ 0) :
    (2 * M * ((2*M)^2)⁻¹) / 2 = (4 * M)⁻¹ := by
  have h2M : (2:Cut) * M ≠ 0 := by positivity_fail
  sorry
