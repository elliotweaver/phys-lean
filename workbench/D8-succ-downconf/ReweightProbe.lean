import Phys.Algebra.LeadingComposedAssembly
import Phys.Algebra.FreezeoutComposition
import Mathlib.Tactic

namespace ReweightProbe

open Phys.Algebra
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.FreezeoutComposition
open Phys.Algebra.HadronicLevelWeights
open Phys.Algebra.AssembledBracket
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (A) general reweighting bound
theorem freezeout_reweight_bounded (wb wc wl rb rc rl R : Cut)
    (hwb : 0 ≤ wb) (hwc : 0 ≤ wc) (hwl : 0 ≤ wl)
    (hb : 1 < rb) (hc : 1 < rc) (hl : 1 < rl)
    (hbR : rb ≤ R) (hcR : rc ≤ R) (hlR : rl ≤ R) :
    kappaLeading * wb * cutLog rb + kappaLeading * wc * cutLog rc
        + kappaLeading * wl * cutLog rl
      ≤ kappaLeading * (wb + wc + wl) * cutLog R := by
  have hk := kappaLeading_pos
  have hlogb : cutLog rb ≤ cutLog R := cutLog_mono (by linarith) hbR
  have hlogc : cutLog rc ≤ cutLog R := cutLog_mono (by linarith) hcR
  have hlogl : cutLog rl ≤ cutLog R := cutLog_mono (by linarith) hlR
  have h1 : (0 : Cut) ≤ kappaLeading * wb := mul_nonneg (le_of_lt hk) hwb
  have h2 : (0 : Cut) ≤ kappaLeading * wc := mul_nonneg (le_of_lt hk) hwc
  have h3 : (0 : Cut) ≤ kappaLeading * wl := mul_nonneg (le_of_lt hk) hwl
  have t1 : kappaLeading * wb * cutLog rb ≤ kappaLeading * wb * cutLog R :=
    mul_le_mul_of_nonneg_left hlogb h1
  have t2 : kappaLeading * wc * cutLog rc ≤ kappaLeading * wc * cutLog R :=
    mul_le_mul_of_nonneg_left hlogc h2
  have t3 : kappaLeading * wl * cutLog rl ≤ kappaLeading * wl * cutLog R :=
    mul_le_mul_of_nonneg_left hlogl h3
  have hsum : kappaLeading * wb * cutLog R + kappaLeading * wc * cutLog R
        + kappaLeading * wl * cutLog R = kappaLeading * (wb + wc + wl) * cutLog R := by ring
  linarith [t1, t2, t3, hsum]

-- (C) assembly-frame instance as a consequence of the general bound
theorem assembly_freezeout_bounded (rb rc rl R : Cut)
    (hb : 1 < rb) (hc : 1 < rc) (hl : 1 < rl)
    (hbR : rb ≤ R) (hcR : rc ≤ R) (hlR : rl ≤ R) :
    totalScreening (freezeoutTail rb rc rl) ≤ kappaLeading * 9 * cutLog R := by
  rw [freezeout_closed]
  have h := freezeout_reweight_bounded (11/3) (10/3) 2 rb rc rl R
    (by norm_num) (by norm_num) (by norm_num) hb hc hl hbR hcR hlR
  have he : kappaLeading * (11/3 + 10/3 + 2) * cutLog R = kappaLeading * 9 * cutLog R := by ring
  linarith [h, he]

-- (E) census-conserving reweighting stays under the same ceiling
theorem census_conserving_reweight_bounded (wb wc wl rb rc rl R : Cut)
    (hwb : 0 ≤ wb) (hwc : 0 ≤ wc) (hwl : 0 ≤ wl)
    (hconserve : wb + wc + wl = 9)
    (hb : 1 < rb) (hc : 1 < rc) (hl : 1 < rl)
    (hbR : rb ≤ R) (hcR : rc ≤ R) (hlR : rl ≤ R) :
    kappaLeading * wb * cutLog rb + kappaLeading * wc * cutLog rc
        + kappaLeading * wl * cutLog rl
      ≤ kappaLeading * 9 * cutLog R := by
  have h := freezeout_reweight_bounded wb wc wl rb rc rl R hwb hwc hwl hb hc hl hbR hcR hlR
  rw [hconserve] at h
  exact h

-- (D) the occupancy floor weight (16) is distinct from the census band weights
theorem occupancy_ne_census_weights :
    ((Nat.card ↥(levelOccupancy 1) : ℕ) : Cut) ≠ censusBottomBand
    ∧ ((Nat.card ↥(levelOccupancy 1) : ℕ) : Cut) ≠ censusCharmBand
    ∧ ((Nat.card ↥(levelOccupancy 1) : ℕ) : Cut) ≠ censusLightBand := by
  rw [floorOccupancy_eq_sixteen, censusBottomBand_val, censusCharmBand_val, censusLightBand_val]
  refine ⟨?_, ?_, ?_⟩ <;> norm_num

-- (F) edge-sign-AGNOSTIC linear-perturbation identity: ANY reweighting differs from the census
-- freeze-out by a FIXED linear form in the three edge logs (no new bulk, whatever the sign of the edges)
theorem reweight_is_linear_perturbation (wb wc wl rb rc rl : Cut) :
    (kappaLeading * wb * cutLog rb + kappaLeading * wc * cutLog rc + kappaLeading * wl * cutLog rl)
      - (kappaLeading * (11/3) * cutLog rb + kappaLeading * (10/3) * cutLog rc
          + kappaLeading * 2 * cutLog rl)
      = kappaLeading * ((wb - 11/3) * cutLog rb + (wc - 10/3) * cutLog rc + (wl - 2) * cutLog rl) := by
  ring

-- (G) the reweighting delta welded to the banked totalScreening (freezeout_closed)
theorem reweight_delta_from_totalScreening (wb wc wl rb rc rl : Cut) :
    (kappaLeading * wb * cutLog rb + kappaLeading * wc * cutLog rc + kappaLeading * wl * cutLog rl)
      - totalScreening (freezeoutTail rb rc rl)
      = kappaLeading * ((wb - 11/3) * cutLog rb + (wc - 10/3) * cutLog rc + (wl - 2) * cutLog rl) := by
  rw [freezeout_closed]; ring

end

end ReweightProbe
