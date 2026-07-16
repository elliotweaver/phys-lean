import Phys.Algebra.FineStructureZeroMomentum

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- CRUX 1: the append-decomposition (a reading at an intermediate edge = partial sum of the tower)
theorem probe_append (above below : List (Cut × Cut)) :
    invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below := by
  unfold invAlphaZero totalScreening
  rw [List.map_append, List.sum_append]
  ring

-- CRUX 2: reading grows monotone as we add lower bands (screening runs 1/α UP)
theorem probe_mono (above below : List (Cut × Cut))
    (h : ∀ p ∈ below, 0 ≤ p.1 ∧ 1 ≤ p.2) :
    invAlphaZero above ≤ invAlphaZero (above ++ below) := by
  rw [probe_append]
  have := totalScreening_nonneg h
  linarith

-- CRUX 3: the exact top band is inside the M_Z reading ⟹ 1582/27 ≤ reading
-- (M_Z reading = invAlphaZero (topBand :: rest-above-MZ)); check the prepend bound
theorem probe_topband_inside (rest : List (Cut × Cut))
    (h : ∀ p ∈ rest, 0 ≤ p.1 ∧ 1 ≤ p.2) :
    1582 / 27 ≤ invAlphaZero ((chargeTraceDepth, topBandRatio) :: rest) := by
  rw [invAlphaZero_cons, bandScreen_topBand_exact]
  have hb : (0:Cut) ≤ totalScreening rest := totalScreening_nonneg h
  have hz : invAlphaZero rest = 42 + totalScreening rest := invAlphaZero_closed rest
  rw [hz]
  norm_num
  linarith

-- CRUX 4: Weinberg at a scale point reachable (sinSqRunExact + isoDepth from import chain)
theorem probe_weinberg_stationary (M μ : Cut)
    (h2 : invAlpha2 isoDepth kappaLeading M μ ≠ 0) :
    sinSqRunExact isoDepth M μ = 3 / 8 :=
  sinSqRunExact_matter_stationary M μ h2

theorem probe_weinberg_departs (d2 M μ : Cut) (hd2 : 0 < d2) (hd2lt : d2 < isoDepth)
    (hμ : 0 < μ) (hμM : μ < M) :
    sinSqRunExact d2 M μ < 3 / 8 :=
  sinSqRunExact_departs_down d2 M μ hd2 hd2lt hμ hμM

-- CRUX 5: the intermediate step = screening below M_Z (M_Z→0 running is exactly the low tail)
theorem probe_step (above below : List (Cut × Cut)) :
    invAlphaZero (above ++ below) - invAlphaZero above = totalScreening below := by
  rw [probe_append]; ring

end
end Phys.Algebra
