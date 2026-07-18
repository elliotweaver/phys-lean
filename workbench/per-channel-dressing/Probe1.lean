import Phys.Algebra.RecombinedEndpoint
import Phys.Algebra.DepthWeight

namespace Phys.Algebra.PerChannelDressingProbe

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

/-- Per-channel dressed screening at fixed census c. -/
def dressedTotalScreeningWith (w c : Cut) (bands : List (Cut × Cut)) : Cut :=
  (bands.map (fun p => dressedBandScreen w c p.2)).sum

/-- PROBE 1: the per-channel dressed factoring. -/
theorem dressedTotalScreeningWith_factor (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) (c : Cut)
    (bands : List (Cut × Cut)) :
    dressedTotalScreeningWith w c bands = totalScreeningWith c bands / (1 - w) := by
  unfold dressedTotalScreeningWith totalScreeningWith
  induction bands with
  | nil => simp
  | cons p ps ih =>
    simp only [List.map_cons, List.sum_cons, add_div]
    rw [dressedBandScreen_factor w hw0 hw1 c p.2, ih]

/-- PROBE 2: census homogeneity of totalScreeningWith. -/
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

/-- PROBE 3: the recombined dressed closed form. -/
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

/-- PROBE 4: the anti-screening reduction (s>0 pulls the recombined endpoint down). -/
theorem dressedInvAlphaEM_antiscreen (w s : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1)
    (bands : List (Cut × Cut)) :
    dressedInvAlphaEM w s bands
      = dressedInvAlphaEM w 0 bands - (s * totalScreeningWith 1 bands) / (1 - w) := by
  rw [dressedInvAlphaEM_closed w s hw0 hw1, dressedInvAlphaEM_closed w 0 hw0 hw1]
  have h1w : (1 : Cut) - w ≠ 0 := sub_ne_zero.mpr (fun h => (ne_of_lt hw1) h.symm)
  field_simp
  ring

end

end Phys.Algebra.PerChannelDressingProbe
