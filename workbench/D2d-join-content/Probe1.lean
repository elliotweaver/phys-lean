import Phys.Algebra.PerChannelDressing
import Phys.Algebra.TowerGatherIsospinMultiplet

/-!  D2d PROBE 1 — de-risk the join-content composition (bounded, isolated). -/

namespace Phys.Algebra.D2dProbe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.TheNumeral
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.DepthWeight
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.PerChannelDressing
open Phys.Algebra.AssembledBracket
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (0) the banked N277 tear + quasi-degeneracy resolve in this import context
example : Phys.Algebra.TL ⊔ Phys.Algebra.Sg ⊔ Phys.Algebra.TR = ⊤ := TL_sup_Sg_sup_TR_eq_top
example : Module.finrank ℚ Phys.Algebra.TR = 3 := finrank_TR
example : casimirOp u1M = (-8 : ℚ) • u1M := casimirOp_u1I
example : casimirOp e5I = (-8 : ℚ) • e5I := casimirOp_e5I
example : casimirOp e4I = 0 := casimirOp_e4I

-- (1) the mirror-multiplet census as a derived counting fact of the banked TR
def mirrorMultCensus : Cut := ((Module.finrank ℚ Phys.Algebra.TR : ℚ) : Cut)

example : mirrorMultCensus = 3 := by
  unfold mirrorMultCensus; rw [finrank_TR]; norm_num

example : (0 : Cut) < mirrorMultCensus := by
  unfold mirrorMultCensus; rw [finrank_TR]; norm_num

-- (2) the join content = mirror census-in-census dressed threshold at splitting ratio j
def joinContent (w j : Cut) : Cut := dressedBandScreen w mirrorMultCensus j

-- factoring by /(1-w) (Z5)
example (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) (j : Cut) :
    joinContent w j = bandScreen mirrorMultCensus j / (1 - w) := by
  unfold joinContent
  exact dressedBandScreen_factor w hw0 hw1 mirrorMultCensus j

-- (3) THE BOUND (quasi-degeneracy ⇒ bounded log threshold) — for j ≤ R
example (w j R : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) (hj : 1 < j) (hR : 1 < R) (hjR : j ≤ R) :
    joinContent w j ≤ kappaLeadingDressed w * mirrorMultCensus * cutLog R := by
  unfold joinContent dressedBandScreen
  have hkw : 0 ≤ kappaLeadingDressed w * mirrorMultCensus := by
    apply mul_nonneg
    · -- kappaLeadingDressed w ≥ 0 : from factoring kappaLeadingDressed = kappaLeading/(1-w)
      rw [kappaLeadingDressed_eq_div w hw0 hw1]
      have h1w : (0 : Cut) < 1 - w := by linarith
      exact le_of_lt (div_pos kappaLeading_pos h1w)
    · unfold mirrorMultCensus; rw [finrank_TR]; norm_num
  have hlog : cutLog j ≤ cutLog R := cutLog_mono (by linarith) hjR
  calc kappaLeadingDressed w * mirrorMultCensus * cutLog j
      ≤ kappaLeadingDressed w * mirrorMultCensus * cutLog R :=
        mul_le_mul_of_nonneg_left hlog hkw

-- (4) THE COMPOSITION: join threshold added onto the D2c dressed recombined endpoint
def dressedInvAlphaEMJoin (w s j : Cut) (bands : List (Cut × Cut)) : Cut :=
  dressedInvAlphaEM w s bands + joinContent w j

example (w s j : Cut) (bands : List (Cut × Cut)) :
    dressedInvAlphaEMJoin w s j bands = dressedInvAlphaEM w s bands + joinContent w j := rfl

end

end Phys.Algebra.D2dProbe
