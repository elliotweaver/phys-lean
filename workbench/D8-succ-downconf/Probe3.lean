import Phys.Algebra.UpDownRelativeScaleFoldPhase
import Phys.Algebra.QuarkHadronTower
import Mathlib.Tactic

namespace Probe3

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.FreezeoutComposition
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] Phys.Cascade.CD.narCD Phys.Cascade.CD.srCD

noncomputable section

def downConfBundle : Cut := mbRatioDerived / confBundle

theorem downConfBundle_pos : 0 < downConfBundle :=
  div_pos mbRatioDerived_pos confBundle_pos

/-- TOOTH: the confinement bundle genuinely BITES — dividing by confBundle < 1 lifts the leg strictly
    above the bare up/down weight: downConfBundle > mbRatioDerived. -/
theorem downConfBundle_gt_mbRatio : mbRatioDerived < downConfBundle := by
  unfold downConfBundle
  rw [lt_div_iff₀ confBundle_pos]
  have h1 : 0 < mbRatioDerived := mbRatioDerived_pos
  have h2 : confBundle < 1 := confBundle_lt_one
  nlinarith [h1, h2]

/-- TOOTH: the up/down leg genuinely enters — downConfBundle ≠ 1/confBundle (would require
    mbRatioDerived = 1, but mbRatioDerived < 1). -/
theorem downConfBundle_ne_confBundleInv : downConfBundle ≠ 1 / confBundle := by
  unfold downConfBundle
  intro h
  have hc : confBundle ≠ 0 := confBundle_ne_zero
  have h2 : mbRatioDerived = 1 := by
    field_simp at h
    exact h
  have := mbRatioDerived_lt_one
  linarith

/-- edgeLight weld. -/
theorem edgeLight_weld (Md Mlam : Cut) (hl : Mlam ≠ 0) :
    edgeLight Md (Mlam ^ 2) = (Md / Mlam) ^ 2 * bMass 2 := by
  unfold edgeLight
  rw [sectorMass_eq]
  have hl2 : (Mlam : Cut) ^ 2 ≠ 0 := pow_ne_zero 2 hl
  field_simp

/-- FREEZE-OUT SUMMAND (cite parent's banked closed form at the pinned edges). -/
theorem freezeout_summand_pins (Mu Md Mlam : Cut) :
    totalScreening (freezeoutTail (edgeBottom Mu Md) (edgeCharm Mu Md) (edgeLight Md (Mlam ^ 2)))
      = kappaLeading * (11 / 3) * cutLog (edgeBottom Mu Md)
        + kappaLeading * (10 / 3) * cutLog (edgeCharm Mu Md)
        + kappaLeading * 2 * cutLog (edgeLight Md (Mlam ^ 2)) :=
  freezeout_at_derived_edges Mu Md (Mlam ^ 2)

/-- edgeLight pinned to downConfBundle·bMass2. -/
theorem edgeLight_pinned (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    edgeLight Md (Mlam ^ 2) = downConfBundle * bMass 2 := by
  rw [edgeLight_weld Md Mlam hl]
  have hsplit : (Md / Mlam) ^ 2 = (Md / Mu) ^ 2 * (Mu / Mlam) ^ 2 := by
    field_simp
  rw [hsplit, hud, huc]
  unfold downConfBundle
  ring

end

end Probe3
