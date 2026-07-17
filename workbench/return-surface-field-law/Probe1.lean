import Phys.Algebra.SpacetimeSurfaceGravity
import Mathlib.Tactic

namespace Probe

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- Def: the return surface area at radius r
def returnArea (r : Cut) : Cut := gaussSphereSolidAngle * r ^ 2

-- Def: the 1/r² field strength of a conserved source
def fieldStrength (s r : Cut) : Cut := s * (r ^ 2)⁻¹

-- ★★ GAUSS FLUX CONSERVATION: E·A = gss·s, r-INDEPENDENT
theorem gauss_flux_conservation (s r : Cut) (hr : r ≠ 0) :
    fieldStrength s r * returnArea r = gaussSphereSolidAngle * s := by
  unfold fieldStrength returnArea
  have hr2 : r ^ 2 ≠ 0 := pow_ne_zero 2 hr
  field_simp

-- fieldStrength IS the flux-density reading of invSquare_from_flux
theorem fieldStrength_from_flux (s r : Cut) (hr : r ≠ 0) :
    fieldStrength s r = (gaussSphereSolidAngle * s) / (gaussSphereSolidAngle * r ^ 2) := by
  rw [invSquare_from_flux s r hr]; rfl

-- Def: the potential
def potential (s r : Cut) : Cut := s * r⁻¹

-- ★ POTENTIAL DERIVATIVE: Φ'(r) = −fieldStrength s r = −s·(r²)⁻¹  (mirror of metricF_hasDerivAt)
theorem potential_hasDerivAt (s r : Cut) (hr : r ≠ 0) :
    HasCutDerivAt (fun x => potential s x) (-(s * (r ^ 2)⁻¹)) r := by
  have hinv := hasCutDerivAt_inv r hr
  have h1 := hasCutDerivAt_const_mul s hinv
  unfold HasCutDerivAt at h1 ⊢
  have hcongr : (fun t : Cut => t⁻¹ * (potential s (r + t) - potential s r))
      =ᶠ[𝓝[≠] (0 : Cut)] (fun t : Cut => t⁻¹ * (s * (r + t)⁻¹ - s * r⁻¹)) := by
    filter_upwards with t
    unfold potential; ring
  rw [tendsto_congr' hcongr]
  have hval : s * -(r ^ 2)⁻¹ = -(s * (r ^ 2)⁻¹) := by ring
  rw [hval] at h1
  exact h1

-- ★ WEAK-FIELD CORRESPONDENCE: metricF M r = 1 − 2·potential M r
theorem metricF_eq_one_sub_two_potential (M r : Cut) :
    metricF M r = 1 - 2 * potential M r := by
  unfold metricF potential; ring

-- ★★★ THE WELD: both couplings submultiples of azimuthalTurn; cross-lock
theorem field_law_weld :
    criticalPhaseNumerator = azimuthalTurn * 42
      ∧ gravCouplingCoeff = azimuthalTurn * 4
      ∧ criticalPhaseNumerator * 4 = gravCouplingCoeff * 42 :=
  ⟨(gravAndGauge_share_azimuthalTurn).2.1,
   (gravAndGauge_share_azimuthalTurn).1,
   (gravAndGauge_share_azimuthalTurn).2.2⟩

-- W8: flux ≠ wrong coefficient
theorem gauss_flux_ne_wrong (s : Cut) (hs : 0 < s) :
    gaussSphereSolidAngle * s ≠ gaussSphereSolidAngle * s * 2 := by
  have hgss := gaussSphereSolidAngle_pos
  intro h
  nlinarith [mul_pos hgss hs]

-- W8: the counts distinct
theorem weld_counts_distinct : (42 : ℕ) ≠ 4 := by decide

#print axioms gauss_flux_conservation
#print axioms potential_hasDerivAt
#print axioms metricF_eq_one_sub_two_potential
#print axioms field_law_weld

end

end Probe
