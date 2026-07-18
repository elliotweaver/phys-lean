import Phys.Algebra.DepthWeight
import Mathlib.Tactic

namespace Phys.Algebra.DepthTwoScratch

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.DepthWeight
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

def bandVaryingScreen (wbands : List (Cut × (Cut × Cut))) : Cut :=
  (wbands.map (fun q => bandScreen q.2.1 q.2.2 / (1 - q.1))).sum

def withWeight (w : Cut) (bands : List (Cut × Cut)) : List (Cut × (Cut × Cut)) :=
  bands.map (fun b => (w, b))

def bandVaryingInvAlphaZero (wbands : List (Cut × (Cut × Cut))) : Cut :=
  invAlphaHigh + bandVaryingScreen wbands

theorem bandVaryingScreen_append (xs ys : List (Cut × (Cut × Cut))) :
    bandVaryingScreen (xs ++ ys) = bandVaryingScreen xs + bandVaryingScreen ys := by
  unfold bandVaryingScreen
  rw [List.map_append, List.sum_append]

theorem bandVaryingScreen_uniform (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1)
    (bands : List (Cut × Cut)) :
    bandVaryingScreen (withWeight w bands) = dressedTotalScreening w bands := by
  unfold bandVaryingScreen withWeight dressedTotalScreening
  induction bands with
  | nil => simp
  | cons b bs ih =>
    simp only [List.map_cons, List.sum_cons]
    rw [dressedBandScreen_factor w hw0 hw1 b.1 b.2, ih]

theorem bandVaryingScreen_zeroWeights (bands : List (Cut × Cut)) :
    bandVaryingScreen (withWeight 0 bands) = totalScreening bands := by
  rw [bandVaryingScreen_uniform 0 (le_refl 0) (by norm_num) bands,
      dressedTotalScreening_factor 0 (le_refl 0) (by norm_num)]
  simp

theorem bandVaryingInvAlphaZero_zeroWeights (bands : List (Cut × Cut)) :
    bandVaryingInvAlphaZero (withWeight 0 bands) = invAlphaZero bands := by
  unfold bandVaryingInvAlphaZero
  rw [bandVaryingScreen_zeroWeights, invAlphaZero_closed, invAlphaHigh_eq]

theorem bandVaryingInvAlphaZero_uniform (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1)
    (bands : List (Cut × Cut)) :
    bandVaryingInvAlphaZero (withWeight w bands) = dressedInvAlphaZero w bands := by
  unfold bandVaryingInvAlphaZero dressedInvAlphaZero
  rw [bandVaryingScreen_uniform w hw0 hw1]

theorem highBands_preserved (lowTail : List (Cut × (Cut × Cut))) :
    bandVaryingInvAlphaZero (withWeight 0 derivedBandList ++ lowTail)
      = 190 / 3 + bandVaryingScreen lowTail := by
  unfold bandVaryingInvAlphaZero
  rw [bandVaryingScreen_append, bandVaryingScreen_zeroWeights,
      totalScreening_derivedBandList, invAlphaHigh_eq]
  ring

theorem bandVaryingBandScreen_gt_leading (w depth ratio : Cut)
    (hw0 : 0 < w) (hw1 : w < 1) (hd : 0 < depth) (hr : 1 < ratio) :
    bandScreen depth ratio < bandScreen depth ratio / (1 - w) := by
  have hpos : 0 < bandScreen depth ratio := bandScreen_pos hd hr
  have hw : (0 : Cut) < 1 - w := by linarith
  rw [lt_div_iff₀ hw]
  nlinarith [hpos, hw0]

theorem bandVaryingBandScreen_selfref (w depth ratio : Cut) (hw1 : w < 1) :
    bandScreen depth ratio / (1 - w)
      = bandScreen depth ratio + w * (bandScreen depth ratio / (1 - w)) := by
  have h1w : (1 : Cut) - w ≠ 0 := sub_ne_zero.mpr (fun h => (ne_of_lt hw1) h.symm)
  field_simp
  ring

theorem zeroOnHigh_preserves_waypoint :
    bandVaryingInvAlphaZero (withWeight 0 derivedBandList) = 190 / 3 := by
  rw [bandVaryingInvAlphaZero_zeroWeights, derivedBandList_assembly]

theorem uniform_derived_moves_waypoint :
    bandVaryingInvAlphaZero (withWeight depthWeight derivedBandList) = 74
    ∧ (74 : Cut) ≠ 190 / 3 := by
  refine ⟨?_, by norm_num⟩
  rw [bandVaryingInvAlphaZero_uniform depthWeight (le_of_lt depthWeight_pos) depthWeight_lt_one,
      dressed_at_depthWeight]

end

end Phys.Algebra.DepthTwoScratch
