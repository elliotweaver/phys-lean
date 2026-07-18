import Phys.Algebra.RecombinedEndpoint
import Phys.Algebra.DepthWeight

namespace Phys.Algebra.PerChannelDressingProbe3

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

theorem chargeDepth_screeningUnit_eq :
    chargeTraceDepth * totalScreeningWith 1 (completeBandList chargeTraceDepth)
      = totalScreening (completeBandList chargeTraceDepth) := by
  rw [← totalScreeningWith_homog,
      totalScreeningWith_eq_totalScreening _ completeBandList_all_charge]

theorem numeral_screening_pos :
    (0 : Cut) < totalScreening (completeBandList chargeTraceDepth) := by
  have hlo := theNumeral_bracket.1
  have hclosed : invAlphaZero (completeBandList chargeTraceDepth)
      = invAlphaHigh + totalScreening (completeBandList chargeTraceDepth) := rfl
  rw [invAlphaHigh_eq] at hclosed
  have hval : (12007329939722 / 176714586765 : Cut) > 42 := by norm_num
  linarith [hlo, hclosed, hval]

theorem screeningUnit_pos :
    (0 : Cut) < totalScreeningWith 1 (completeBandList chargeTraceDepth) := by
  have hprod := chargeDepth_screeningUnit_eq
  have hpos := numeral_screening_pos
  have hcpos : (0 : Cut) < chargeTraceDepth := chargeTraceDepth_pos
  nlinarith [hpos, hprod, hcpos]

/-- TOOTH: the depth dressing genuinely dresses each channel — for a nontrivial weight 0<w<1 the
    recombined dressed endpoint at s=0 strictly EXCEEDS the bare (w=0) recombined endpoint. -/
theorem dressed_gt_bare (w : Cut) (hw0 : 0 < w) (hw1 : w < 1) :
    dressedInvAlphaEM 0 0 (completeBandList chargeTraceDepth)
      < dressedInvAlphaEM w 0 (completeBandList chargeTraceDepth) := by
  rw [dressedInvAlphaEM_closed 0 0 (le_refl 0) (by norm_num),
      dressedInvAlphaEM_closed w 0 (le_of_lt hw0) hw1]
  have hT := screeningUnit_pos
  have hcpos : (0 : Cut) < chargeTraceDepth := chargeTraceDepth_pos
  set T := totalScreeningWith 1 (completeBandList chargeTraceDepth) with hTdef
  have hnum : (0 : Cut) < (chargeTraceDepth - 0) * T := by
    have : chargeTraceDepth - (0:Cut) = chargeTraceDepth := by ring
    rw [this]; exact mul_pos hcpos hT
  have h1w : (0 : Cut) < 1 - w := by linarith
  have hbase : ((chargeTraceDepth - 0) * T) / (1 - 0) = (chargeTraceDepth - 0) * T := by norm_num
  rw [hbase]
  set X := (chargeTraceDepth - 0) * T with hXdef
  -- X < X/(1-w) since 0<X and 0<1-w<1
  have hkey : X < X / (1 - w) := by
    rw [lt_div_iff₀ h1w]
    nlinarith [hnum, hw0]
  linarith [hkey]

end

end Phys.Algebra.PerChannelDressingProbe3
