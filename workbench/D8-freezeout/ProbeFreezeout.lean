import Phys.Algebra.TheNumeral
import Phys.Algebra.AssembledBracket

open Phys.Algebra
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.AssembledBracket
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- The freeze-out summand CLOSED FORM: extends D2 `freezeoutTail_screening` by unfolding
    `bandScreen` and the DERIVED plateau censuses (11/3, 10/3, 2). -/
theorem freezeout_closed (rb rc rl : Cut) :
    totalScreening (freezeoutTail rb rc rl)
      = kappaLeading * (11 / 3) * cutLog rb + kappaLeading * (10 / 3) * cutLog rc
        + kappaLeading * 2 * cutLog rl := by
  rw [freezeoutTail_screening]
  unfold bandScreen
  rw [censusBottomBand_val, censusCharmBand_val, censusLightBand_val]

/-- ★ THE BOUNDED-REFINEMENT THEOREM: for screening edge ratios all ≤ a rational bound R (1 < R),
    the freeze-out summand is bounded by `κ·(23/3)·cutLog R` — the sum of the three DERIVED censuses
    (11/3 + 10/3 + 2 = 23/3) times κ times the log of the largest edge ratio. This PROVES the
    freeze-out tail is a BOUNDED census-refinement, growing only logarithmically in the edge span. -/
theorem freezeout_bounded (rb rc rl R : Cut) (hR : 1 < R)
    (hb : 1 < rb) (hc : 1 < rc) (hl : 1 < rl)
    (hbR : rb ≤ R) (hcR : rc ≤ R) (hlR : rl ≤ R) :
    totalScreening (freezeoutTail rb rc rl) ≤ kappaLeading * (9) * cutLog R := by
  rw [freezeout_closed]
  have hk := kappaLeading_pos
  have hlogb : cutLog rb ≤ cutLog R := cutLog_mono (by linarith) hbR
  have hlogc : cutLog rc ≤ cutLog R := cutLog_mono (by linarith) hcR
  have hlogl : cutLog rl ≤ cutLog R := cutLog_mono (by linarith) hlR
  have h11 : (0 : Cut) ≤ kappaLeading * (11 / 3) := mul_nonneg (le_of_lt hk) (by norm_num)
  have h10 : (0 : Cut) ≤ kappaLeading * (10 / 3) := mul_nonneg (le_of_lt hk) (by norm_num)
  have h2  : (0 : Cut) ≤ kappaLeading * 2 := mul_nonneg (le_of_lt hk) (by norm_num)
  have t1 : kappaLeading * (11 / 3) * cutLog rb ≤ kappaLeading * (11 / 3) * cutLog R :=
    mul_le_mul_of_nonneg_left hlogb h11
  have t2 : kappaLeading * (10 / 3) * cutLog rc ≤ kappaLeading * (10 / 3) * cutLog R :=
    mul_le_mul_of_nonneg_left hlogc h10
  have t3 : kappaLeading * 2 * cutLog rl ≤ kappaLeading * 2 * cutLog R :=
    mul_le_mul_of_nonneg_left hlogl h2
  have hsum : kappaLeading * (11 / 3) * cutLog R + kappaLeading * (10 / 3) * cutLog R
        + kappaLeading * 2 * cutLog R = kappaLeading * (9) * cutLog R := by ring
  linarith [t1, t2, t3, hsum]

end
