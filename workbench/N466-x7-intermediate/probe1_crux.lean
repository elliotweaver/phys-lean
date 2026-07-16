import Phys.Algebra.FineStructureZeroMomentum
import Mathlib.Tactic

namespace ProbeN466

open Phys.Algebra Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- CRUX 1: totalScreening is additive over List.append.
theorem totalScreening_append (l1 l2 : List (Cut × Cut)) :
    totalScreening (l1 ++ l2) = totalScreening l1 + totalScreening l2 := by
  unfold totalScreening
  rw [List.map_append, List.sum_append]

-- CRUX 2: the partial-sum / way-point decomposition.
-- The full zero-momentum reading = the intermediate reading (bands above the scale)
-- + the below-scale screening.
theorem invAlphaZero_append (top low : List (Cut × Cut)) :
    invAlphaZero (top ++ low) = invAlphaZero top + totalScreening low := by
  unfold invAlphaZero
  rw [totalScreening_append]; ring

-- CRUX 3: the intermediate reading is ≤ the zero-momentum reading (screening runs UP).
theorem invAlphaInter_le_zero (top low : List (Cut × Cut))
    (h : ∀ p ∈ low, 0 ≤ p.1 ∧ 1 ≤ p.2) :
    invAlphaZero top ≤ invAlphaZero (top ++ low) := by
  rw [invAlphaZero_append]
  have := totalScreening_nonneg h
  linarith

-- CRUX 4: strict when there is genuine below-scale screening.
theorem invAlphaInter_lt_zero (top low : List (Cut × Cut))
    (h : 0 < totalScreening low) :
    invAlphaZero top < invAlphaZero (top ++ low) := by
  rw [invAlphaZero_append]; linarith

-- CRUX 5: the M_Z fine reading = the electroweak way-point 1582/27 + the sub-band screen.
-- (sub-band ratio v/M_Z is a FREE variable — NOT asserted.)
theorem invAlphaMZ_structure (subRatio : Cut) :
    invAlphaZero [(chargeTraceDepth, topBandRatio), (chargeTraceDepth, subRatio)]
      = 1582 / 27 + bandScreen chargeTraceDepth subRatio := by
  rw [invAlphaZero_cons, invAlphaZero_cons, invAlphaZero_nil, bandScreen_topBand_exact]
  ring

-- CRUX 6: sinSqRunExact instantiated at μ = M_Z (matter stationary).
theorem weinberg_MZ_matter (M MZ : Cut)
    (h2 : invAlpha2 isoDepth kappaLeading M MZ ≠ 0) :
    sinSqRunExact isoDepth M MZ = 3 / 8 :=
  sinSqRunExact_matter_stationary M MZ h2

-- CRUX 7: sinSqRunExact departs down at M_Z.
theorem weinberg_MZ_departs (d2 M MZ : Cut) (hd2 : 0 < d2) (hd2lt : d2 < isoDepth)
    (hMZ : 0 < MZ) (hMZM : MZ < M) :
    sinSqRunExact d2 M MZ < 3 / 8 :=
  sinSqRunExact_departs_down d2 M MZ hd2 hd2lt hMZ hMZM

end

end ProbeN466
