import Phys.Algebra.DepthTowerDescent
import Mathlib.Tactic

namespace Phys.Algebra.DepthWeightProbe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- The per-loop self-look-back weight = the mean Born self-overlap over the return surface:
    the banked meridian Born-flux `∫cos²·sin = 2/3` (X1) normalized by the total return measure
    `∫sin = 2` (N328). -/
def depthWeight : Cut := meridianFlux cutPi / sinAntideriv cutPi

/-- THE MAGNITUDE: `w = 1/3` — the mean Born self-overlap, exact. -/
theorem depthWeight_eq : depthWeight = 1 / 3 := by
  unfold depthWeight
  rw [meridianFlux_cutPi, sinAntideriv_cutPi]
  norm_num

theorem depthWeight_pos : 0 < depthWeight := by rw [depthWeight_eq]; norm_num
theorem depthWeight_lt_one : depthWeight < 1 := by rw [depthWeight_eq]; norm_num
theorem depthWeight_ne_zero : depthWeight ≠ 0 := by rw [depthWeight_eq]; norm_num
theorem depthWeight_ne_one : depthWeight ≠ 1 := by rw [depthWeight_eq]; norm_num
theorem depthWeight_ne_flux : depthWeight ≠ 2 / 3 := by rw [depthWeight_eq]; norm_num

/-- Sense grounded in Born positivity of the flux (not just the value). -/
theorem depthWeight_pos_born : 0 < depthWeight := by
  unfold depthWeight
  rw [meridianFlux_cutPi, sinAntideriv_cutPi]
  norm_num

/-- The dressed running at the derived weight: 42 + (64/3)/(1−1/3) = 42 + 32 = 74. -/
theorem dressed_at_depthWeight :
    dressedInvAlphaZero depthWeight derivedBandList = 74 := by
  rw [dressedInvAlphaZero_derivedBandList depthWeight (le_of_lt depthWeight_pos) depthWeight_lt_one,
      depthWeight_eq]
  norm_num

/-- The dressed all-orders κ at the derived weight: κ(1/3) = κ₀/(2/3) = 1/(2·cutPi). -/
theorem kappaDressed_at_depthWeight :
    kappaLeadingDressed depthWeight = 1 / (2 * cutPi) := by
  rw [kappaLeadingDressed_closed depthWeight (le_of_lt depthWeight_pos) depthWeight_lt_one,
      depthWeight_eq]
  have hpi : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

/-- The running-of-the-running with the DERIVED weight strictly exceeds the bare (w=0) tower:
    74 > 190/3. -/
theorem dressed_gt_leading :
    dressedInvAlphaZero 0 derivedBandList < dressedInvAlphaZero depthWeight derivedBandList := by
  rw [dressed_at_depthWeight, dressedInvAlphaZero_leading]
  norm_num

/-- The census-in-census self-reference AT the derived weight. -/
theorem depthWeight_selfref :
    kappaLeadingDressed depthWeight
      = kappaLeading + depthWeight * kappaLeadingDressed depthWeight :=
  kappaLeadingDressed_selfref depthWeight (le_of_lt depthWeight_pos) depthWeight_lt_one

end
end Phys.Algebra.DepthWeightProbe
