import Phys.Algebra.RecomposedRunningEndpoint
import Phys.Algebra.CensusCompletenessClosure
import Phys.Algebra.ComposedFreezeoutDissolved
import Phys.Algebra.FreezeoutEdgeNumerals
import Phys.Algebra.NarrowedBracket7
import Mathlib.Tactic

namespace Phys.Algebra.PerChannelRecomb4

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.RecomposedRunningEndpoint
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.FreezeoutEdgeNumerals
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- Abstract arithmetic core (opaque `k, C` — no transcendental terms): if `0 < k`,
    `k ≤ (1/3)·(2500000/7853981)`, and `C ≥ -5/3`, then `0 < 16/9 + k·C`. Keeps the heavy
    `cutLog`/`cutPi` terms OUT of the arithmetic (W9). -/
theorem pos_core (k C : Cut) (hk : 0 < k) (hkhi : k ≤ (1/3) * (2500000 / 7853981))
    (hC : (-5/3 : Cut) ≤ C) : 0 < 16/9 + k * C := by
  rcases le_or_gt 0 C with hCpos | hCneg
  · have : 0 ≤ k * C := mul_nonneg (le_of_lt hk) hCpos
    linarith
  · -- C < 0: k*C ≥ (1/3)(2500000/7853981)*C (since C<0, larger k gives smaller product)
    have h1 : k * C ≥ ((1/3) * (2500000 / 7853981)) * C :=
      mul_le_mul_of_nonpos_right hkhi (le_of_lt hCneg)
    have h2 : ((1/3 : Cut) * (2500000 / 7853981)) * C ≥ ((1/3) * (2500000 / 7853981)) * (-5/3) :=
      mul_le_mul_of_nonneg_left hC (by norm_num)
    have h3 : ((1/3 : Cut) * (2500000 / 7853981)) * (-5/3) > -16/9 := by norm_num
    linarith [h1, h2, h3]

def freezeoutStaircaseSummand : Cut :=
  16 / 9
    + kappaLeading * ((7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0)
      - (5 / 3) * cutLog (bMass 2))

theorem freezeoutStaircaseSummand_pos : 0 < freezeoutStaircaseSummand := by
  unfold freezeoutStaircaseSummand
  obtain ⟨hmb_lo, hmb_hi⟩ := charmEdgeLog_bracket_reexport
  obtain ⟨hb0_lo, hb0_hi⟩ := Lb0_bracket
  obtain ⟨hb2_lo, hb2_hi⟩ := Lb2_bracket
  have hmbid : cutLog (1 / mbRatioDerived) = - cutLog mbRatioDerived :=
    Phys.Algebra.ComposedFreezeoutDissolved.cutLog_inv_pos mbRatioDerived_pos
  rw [hmbid] at hmb_lo hmb_hi
  have hmb_ge : cutLog mbRatioDerived ≥ -41/10 := by linarith
  -- the log combination ≥ -5/3
  have hcombo_bound :
      (7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0) - (5 / 3) * cutLog (bMass 2)
        ≥ -5/3 := by
    have h1 : (7/3 : Cut) * cutLog mbRatioDerived ≥ (7/3)*(-41/10) := by nlinarith [hmb_ge]
    have h2 : (11/3 : Cut) * cutLog (bMass 0) ≥ (11/3)*(17/10) := by nlinarith [hb0_lo]
    have h3 : (5/3 : Cut) * cutLog (bMass 2) ≤ (5/3)*(-1) := by nlinarith [hb2_hi]
    nlinarith [h1, h2, h3]
  -- kappaLeading > 0 and ≤ (1/3)*(2500000/7853981)
  have hkpos : 0 < kappaLeading := kappaLeading_pos
  obtain ⟨_, hinv_hi⟩ := inv_cutPi_bracket_ext2
  have hpi : (0:Cut) < cutPi := cutPi_pos
  have hk_hi : kappaLeading ≤ (1/3) * (2500000 / 7853981) := by
    have hsplit : kappaLeading = (1/3) * (1 / cutPi) := by rw [kappaLeading_eq]; field_simp
    rw [hsplit]
    have := mul_le_mul_of_nonneg_left hinv_hi (show (0:Cut) ≤ 1/3 by norm_num)
    linarith [this]
  exact pos_core kappaLeading _ hkpos hk_hi hcombo_bound

end

end Phys.Algebra.PerChannelRecomb4
