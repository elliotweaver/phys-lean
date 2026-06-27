import Phys.Algebra.LorentzContinuumMetricCondition

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C121): A BOGUS METRIC CONDITION — "A NON-ISOMETRY SATISFIES gᵀ J g = J".
-- N90 banks `linIsom_metric_condition` / `boostEndC_metric_condition`: the operator Lorentz
-- metric condition `h ∘ J ∘ g = J` (the signature involution `J = sigOpC`) holds for a LINEAR
-- isometry `g` — and the boost `boostEndC a b` is a `QvC`-isometry EXACTLY on the unit hyperbola
-- `a² − b² = 1` (N49 `boostC_isom`). The metric condition is NOT free of that hypothesis: a
-- boost OFF the unit hyperbola is NOT an isometry and does NOT satisfy `gᵀ J g = J`.
--   Take the boost `a = 3, b = 2`: `a² − b² = 9 − 4 = 5 ≠ 1`, so it is NOT a `QvC`-isometry.
-- Tracking the metric-operator `h ∘ J ∘ g` on the time unit `(1,0,0)` through the banked
-- `boostEndC_apply` (the boost action) and `sigOpC_apply` (the signature flip):
--     g(1,0,0)      = (3·1+2·0, 2·1+3·0, 0) = (3, 2, 0)            [boostEndC_apply]
--     J(3,2,0)      = (3, −2, −0)           = (3, −2, 0)          [sigOpC_apply]
--     g(3,−2,0)     = (3·3+2·(−2), 2·3+3·(−2), 0) = (5, 0, 0)     [boostEndC_apply]
-- so `(h ∘ J ∘ g)(1,0,0)` has FIRST coordinate `3·3 + 2·(−2) = a² − b² = 5`, NOT the genuine
-- signature value `J(1,0,0) = (1, 0, 0)` whose first coordinate is `1`. The product `a² − b² = 5`
-- (the unit-hyperbola defect) is exactly what the metric condition forces to `1` for a genuine
-- isometry. A BOGUS claim that the non-isometric boost-(3,2) metric operator reads `1` at the
-- time-unit first coordinate forces `5 = 1` and must NOT compile.
--   The false numeric `5 = 1` is DISTINCT from the banked battery (C115 1=7, C116 4=13,
-- C117 36=9, C118 21=1, C119 16=1, C120 25=1).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/isometry/signature/metric/orthogonal" → over
-- the derived complete ordered field `Cut`, the `Cut`-linear map `boostEndC 3 2` composed with
-- the involution `sigOpC` and itself reads `5` (= `3² − 2²`) in the first coordinate at `(1,0,0)`,
-- not `1`; pure linear-algebra arithmetic. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the boost `a = 3, b = 2` (NOT on the unit hyperbola, `a² − b² = 5 ≠ 1`, hence NOT a
    `QvC`-isometry) is claimed to satisfy the operator Lorentz metric condition `gᵀ J g = J` at
    the time-unit `(1,0,0)`. The genuine metric-operator first coordinate is `a² − b² = 5`
    (`boostEndC_apply` + `sigOpC_apply`), while the genuine signature value `J(1,0,0)` has first
    coordinate `1`; so this forces `5 = 1` and must NOT compile. -/
theorem metriccondition_wrong_nonisometry_BOGUS :
    ((boostEndC 3 2).comp (sigOpC.comp (boostEndC 3 2))
        ((1 : Cut), (0 : Cut), (0 : O Cut))).1 = (1 : Cut) := by
  have h : ((boostEndC 3 2).comp (sigOpC.comp (boostEndC 3 2))
      ((1 : Cut), (0 : Cut), (0 : O Cut))).1 = (5 : Cut) := by
    simp only [LinearMap.comp_apply, boostEndC_apply, sigOpC_apply]
    ring
  rw [h]

end

end Counterexamples
