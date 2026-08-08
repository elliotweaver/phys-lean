import Phys.Algebra.RunningLawCharacterized
import Phys.Algebra.MomentGeometryGeneral
import Phys.Algebra.FineStructureLoopNormalization
import Phys.Algebra.FineStructureZeroMomentum
import Mathlib.Tactic

/-!
  # N685 — KAPPA GENERATOR WELD (referee item 4)
  ==============================================================================
  PREREG: workbench/PREREG-LANES-682-684.md (LANE A2 addendum).

  TARGET: the return-surface normalized flux IS the generator of the characterized
  flow — welding N680 (moment geometry, `momentGeneral`) into N682 (running-law
  characterization, `invAlphaRun_characterized`).

  Grep facts consumed (kill-check discharged):
    • `azimuthalTurn : Cut := 2 * cutPi`   (Phys/Foundation/ContinuumSphereFlux, N328)
    • `kappaLeading  : Cut := meridianFlux cutPi / azimuthalTurn`
      with `meridianFlux_cutPi : meridianFlux cutPi = 2/3`  (FineStructureLoopNormalization)
    • `momentGeneral_eq : momentGeneral n = (1 − (−1)^(n+1))/(n+1)`,
      `sinAntideriv_cutPi : sinAntideriv cutPi = 2`          (MomentGeometryGeneral / trunk)
    • `bandScreen depth ratio := kappaLeading * depth * cutLog ratio`
      (FineStructureZeroMomentum)
    • `invAlphaRun_characterized`                            (RunningLawCharacterized)

  The weld is by REWRITING THROUGH THE OBJECTS: both sides pass through
  `meridianFlux cutPi` and `momentGeneral 2` — no independent computation of
  `1/(3·cutPi)` on either side.
-/

namespace Phys.Algebra
namespace KappaGeneratorWeld

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.MirrorTermLanguage
open Phys.Algebra.DepthWeight
open Phys.Algebra.RunningLawCharacterized

noncomputable section

/-! ## (a) THE GENERATOR IS THE GEOMETRY: the leading normalization `kappaLeading`
    (meridian flux per azimuthal turn) IS the constructed two-ended geometric moment
    `momentGeneral 2` per unit return measure per meridian sweep — the running
    generator read off the CONSTRUCTED geometry, not a matched constant. -/

/-- ★★★ `kappaLeading = momentGeneral 2 / (sinAntideriv cutPi · cutPi)`: the flux side
    unfolds through `meridianFlux cutPi = 2/3` and `azimuthalTurn = 2·cutPi`; the
    geometry side evaluates the two-ended constructed moment (`momentGeneral_eq`) over
    the banked return measure (`sinAntideriv_cutPi = 2`). One object on each side —
    they meet. -/
theorem kappa_is_geometric_generator :
    kappaLeading = momentGeneral 2 / (sinAntideriv cutPi * cutPi) := by
  unfold kappaLeading azimuthalTurn
  rw [meridianFlux_cutPi, momentGeneral_eq, sinAntideriv_cutPi]
  norm_num

/-- Sanity cross-weld: the geometric generator times the return measure recovers the
    banked two-ended weight relation `momentGeneral 2 / sinAntideriv cutPi = depthWeight`
    (N680 `geometry_agrees_two`), so the generator is `depthWeight / cutPi` — the
    Born-square weight per meridian sweep. -/
theorem kappa_is_weight_per_sweep :
    kappaLeading = depthWeight / cutPi := by
  rw [kappa_is_geometric_generator, ← div_div, geometry_agrees_two]

/-! ## (b) THE FLOW WELD: `invAlphaRun_characterized` restated with the GEOMETRIC
    object as the unit rate — any monotone multiplicative-to-additive flow whose
    unit-tick slope is the constructed geometric generator (times the charge trace
    depth) IS the banked running coupling's log part at `kappaLeading`. -/

/-- ★★★ THE RUNNING GENERATOR, WELDED: with the rate hypothesis stated through the
    geometry — `f (cutExp 1) = (momentGeneral 2 / (sinAntideriv cutPi · cutPi)) ·
    chargeTraceDepth` — the characterized flow pins to the banked running coupling at
    the derived normalization: `invAlphaHigh + f r = invAlphaRun kappaLeading M (M/r)`
    for every positive ratio. -/
theorem running_generator_welded (M : Cut) (hM : 0 < M) (f : Cut → Cut)
    (H1 : ∀ x y : Cut, 0 < x → 0 < y → f (x * y) = f x + f y)
    (H2 : ∀ x y : Cut, 0 < x → x ≤ y → f x ≤ f y)
    (Hrate : f (cutExp 1)
      = (momentGeneral 2 / (sinAntideriv cutPi * cutPi)) * chargeTraceDepth) :
    ∀ r : Cut, 0 < r → invAlphaHigh + f r = invAlphaRun kappaLeading M (M / r) := by
  refine invAlphaRun_characterized kappaLeading M hM f H1 H2 ?_
  rw [Hrate, kappa_is_geometric_generator]

/-! ## (c) THE SCREENING KERNEL'S GENERATOR: `bandScreen` rewritten through (a) — the
    kernel's coefficient is the geometric flux, not a named constant. -/

/-- ★ `bandScreen depth r = (momentGeneral 2 / (sinAntideriv cutPi · cutPi)) · depth ·
    cutLog r`: the screening kernel IS the geometric generator scaled by depth against
    the forced affine-log flow. -/
theorem bandScreen_generator (depth r : Cut) :
    bandScreen depth r
      = (momentGeneral 2 / (sinAntideriv cutPi * cutPi)) * depth * cutLog r := by
  unfold bandScreen
  rw [kappa_is_geometric_generator]

end

end KappaGeneratorWeld
end Phys.Algebra
