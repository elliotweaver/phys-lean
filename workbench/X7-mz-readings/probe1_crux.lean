import Phys.Algebra.FineStructureZeroMomentum
import Phys.Algebra.FineStructureRunningExact
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- CRUX 1: totalScreening is additive over append (List.map_append + List.sum_append)
example (above below : List (Cut × Cut)) :
    totalScreening (above ++ below) = totalScreening above + totalScreening below := by
  unfold totalScreening
  rw [List.map_append, List.sum_append]

-- CRUX 2: the additive edge decomposition of invAlphaZero
example (above below : List (Cut × Cut)) :
    invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below := by
  unfold invAlphaZero totalScreening
  rw [List.map_append, List.sum_append]; ring

-- CRUX 3: intermediate reading ≤ zero-momentum reading (screening tail)
example (above below : List (Cut × Cut))
    (h : ∀ p ∈ below, 0 ≤ p.1 ∧ 1 ≤ p.2) :
    invAlphaZero above ≤ invAlphaZero (above ++ below) := by
  have hdecomp : invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below := by
    unfold invAlphaZero totalScreening
    rw [List.map_append, List.sum_append]; ring
  rw [hdecomp]
  have := totalScreening_nonneg h
  linarith

-- CRUX 4: reading at the electroweak edge = 1582/27 (reuse banked)
example : invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  invAlphaZero_topBand_value

-- CRUX 5: M_Z reading (below EW) = 1582/27 + tail
example (belowV : List (Cut × Cut)) :
    invAlphaZero ([(chargeTraceDepth, topBandRatio)] ++ belowV)
      = 1582 / 27 + totalScreening belowV := by
  have hdecomp : invAlphaZero ([(chargeTraceDepth, topBandRatio)] ++ belowV)
      = invAlphaZero [(chargeTraceDepth, topBandRatio)] + totalScreening belowV := by
    unfold invAlphaZero totalScreening
    rw [List.map_append, List.sum_append]; ring
  rw [hdecomp, invAlphaZero_topBand_value]

-- CRUX 6: the Weinberg reading at M_Z re-instantiations compile
example (M mz : Cut) (h2 : invAlpha2 isoDepth kappaLeading M mz ≠ 0) :
    sinSqRunExact isoDepth M mz = 3 / 8 :=
  sinSqRunExact_matter_stationary M mz h2

example (d2 M mz : Cut) (hd2 : 0 < d2) (hd2lt : d2 < isoDepth) (hmz : 0 < mz) (hmzM : mz < M) :
    sinSqRunExact d2 M mz < 3 / 8 :=
  sinSqRunExact_departs_down d2 M mz hd2 hd2lt hmz hmzM

end

end Phys.Algebra
