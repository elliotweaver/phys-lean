import Phys.Algebra.RecombinedEndpoint
import Phys.Algebra.DepthWeight

namespace Phys.Algebra.PerChannelDressingProbe2

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.TheNumeral
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.DepthWeight
open Phys.Algebra.RecombinedEndpoint
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

def dressedTotalScreeningWith (w c : Cut) (bands : List (Cut × Cut)) : Cut :=
  (bands.map (fun p => dressedBandScreen w c p.2)).sum

theorem dressedTotalScreeningWith_factor (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) (c : Cut)
    (bands : List (Cut × Cut)) :
    dressedTotalScreeningWith w c bands = totalScreeningWith c bands / (1 - w) := by
  unfold dressedTotalScreeningWith totalScreeningWith
  induction bands with
  | nil => simp
  | cons p ps ih =>
    simp only [List.map_cons, List.sum_cons, add_div]
    rw [dressedBandScreen_factor w hw0 hw1 c p.2, ih]

theorem totalScreeningWith_homog (c : Cut) (bands : List (Cut × Cut)) :
    totalScreeningWith c bands = c * totalScreeningWith 1 bands := by
  unfold totalScreeningWith
  induction bands with
  | nil => simp
  | cons p ps ih =>
    simp only [List.map_cons, List.sum_cons, mul_add]
    rw [ih]
    have : bandScreen c p.2 = c * bandScreen 1 p.2 := by unfold bandScreen; ring
    rw [this]

def dressedIsoTower (w s : Cut) (bands : List (Cut × Cut)) : Cut :=
  invAlpha2High + dressedTotalScreeningWith w (netIsoDepth s) bands

def dressedHyperTower (w : Cut) (bands : List (Cut × Cut)) : Cut :=
  invAlphaYHigh + dressedTotalScreeningWith w hyperDepth bands

def dressedInvAlphaEM (w s : Cut) (bands : List (Cut × Cut)) : Cut :=
  dressedIsoTower w s bands + dressedHyperTower w bands

theorem dressedInvAlphaEM_closed (w s : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1)
    (bands : List (Cut × Cut)) :
    dressedInvAlphaEM w s bands
      = 112 + ((chargeTraceDepth - s) * totalScreeningWith 1 bands) / (1 - w) := by
  unfold dressedInvAlphaEM dressedIsoTower dressedHyperTower
  rw [dressedTotalScreeningWith_factor w hw0 hw1, dressedTotalScreeningWith_factor w hw0 hw1,
      totalScreeningWith_homog (netIsoDepth s), totalScreeningWith_homog hyperDepth,
      invAlpha2High_eq, invAlphaYHigh_eq]
  unfold netIsoDepth
  rw [census_additive]
  have h1w : (1 : Cut) - w ≠ 0 := sub_ne_zero.mpr (fun h => (ne_of_lt hw1) h.symm)
  field_simp
  ring

/-- T = totalScreeningWith 1 (charge list). On the charge list,
    chargeTraceDepth * T = totalScreening (charge list). -/
theorem chargeDepth_screeningUnit_eq :
    chargeTraceDepth * totalScreeningWith 1 (completeBandList chargeTraceDepth)
      = totalScreening (completeBandList chargeTraceDepth) := by
  rw [← totalScreeningWith_homog,
      totalScreeningWith_eq_totalScreening _ completeBandList_all_charge]

/-- the numeral gives totalScreening (charge list) > 0 (invAlphaZero ≈ 67.95 > 42). -/
theorem numeral_screening_pos :
    (0 : Cut) < totalScreening (completeBandList chargeTraceDepth) := by
  have hlo := theNumeral_bracket.1
  have hclosed : invAlphaZero (completeBandList chargeTraceDepth)
      = invAlphaHigh + totalScreening (completeBandList chargeTraceDepth) := rfl
  rw [invAlphaHigh_eq] at hclosed
  have hval : (12007329939722 / 176714586765 : Cut) > 42 := by norm_num
  linarith [hlo, hclosed, hval]

/-- ★ the numeral screening unit T is positive (chargeTraceDepth = 16/3 > 0). -/
theorem screeningUnit_pos :
    (0 : Cut) < totalScreeningWith 1 (completeBandList chargeTraceDepth) := by
  have hprod := chargeDepth_screeningUnit_eq
  have hpos := numeral_screening_pos
  have hcpos : (0 : Cut) < chargeTraceDepth := chargeTraceDepth_pos
  nlinarith [hpos, hprod, hcpos]

/-- ★★★ the s=0 composed dressed endpoint = dressedInvAlphaZero + 70. -/
theorem dressedInvAlphaEM_s0_composed (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    dressedInvAlphaEM w 0 (completeBandList chargeTraceDepth)
      = dressedInvAlphaZero w (completeBandList chargeTraceDepth) + 70 := by
  rw [dressedInvAlphaEM_closed w 0 hw0 hw1, dressedInvAlphaZero_closed w hw0 hw1]
  rw [← chargeDepth_screeningUnit_eq]
  have h1w : (1 : Cut) - w ≠ 0 := sub_ne_zero.mpr (fun h => (ne_of_lt hw1) h.symm)
  field_simp
  ring

/-- ★★ the anti-screening runs the recombined dressed endpoint DOWN for s>0. -/
theorem dressedInvAlphaEM_runs_down (w s : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) (hs : 0 < s) :
    dressedInvAlphaEM w s (completeBandList chargeTraceDepth)
      < dressedInvAlphaEM w 0 (completeBandList chargeTraceDepth) := by
  rw [dressedInvAlphaEM_closed w s hw0 hw1, dressedInvAlphaEM_closed w 0 hw0 hw1]
  have hT := screeningUnit_pos
  have h1w : (0 : Cut) < 1 - w := by linarith
  have hred : (0 : Cut) < (s * totalScreeningWith 1 (completeBandList chargeTraceDepth)) / (1 - w) :=
    div_pos (mul_pos hs hT) h1w
  have hsub0 : chargeTraceDepth - (0 : Cut) = chargeTraceDepth := by ring
  rw [hsub0]
  have hsplit : (chargeTraceDepth - s) * totalScreeningWith 1 (completeBandList chargeTraceDepth)
      = chargeTraceDepth * totalScreeningWith 1 (completeBandList chargeTraceDepth)
        - s * totalScreeningWith 1 (completeBandList chargeTraceDepth) := by ring
  rw [hsplit, sub_div]
  linarith [hred]

end

end Phys.Algebra.PerChannelDressingProbe2
