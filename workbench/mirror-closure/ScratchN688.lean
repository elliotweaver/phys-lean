import Phys.Algebra.AlphaLandingFinal
import Phys.Algebra.BaseNormalFormAudit
import Phys.Algebra.PerEdgeCensusRederived

/-!
  # N688 — BASE GEM CENSUS ADJUDICATED: the fold forces the active-span census
  ================================================================================
  MANAGER-AS-PROVER NODE (owner-directed first-principles adjudication; recon:
  workbench/base-adjudication/VERDICT.md per its frozen PREREG; the reverse-provenance
  sweep workbench/reverse-provenance/SWEEP-REPORT.md corroborates independently).

  THE FINDING (external referee, verified): the production endpoint's base 2425/18
  carries a gem 16/9 = κ·censusLightBand·(8π/3) with censusLightBand = 2, while the
  banked N574/N575 audit frame proves the active-span census 5/3 and the corrected gem
  40/27 (base 7259/54). Two banked counting frames, one production value — the fold
  cannot force both.

  THE ADJUDICATION (fold-native, NO-FIT — the measured value entered no inference):
  (1) SAME SUMMAND: the base's 16/9 gem IS the freeze-out staircase's light-edge term —
      `2425/18 = 7179/54 + 16/9` (base_eq_waypoint_plus_gem) is an arithmetic regrouping
      of the ONE assembly (recomposedEndpoint_closed vs recomposedEndpoint_cInner); no
      banked object of type "below-Λ plateau with census 2" exists; the Frame-1 steelman
      fails.
  (2) THE CENSUS ON THAT SPAN IS FORCED: the banked removal frame (decoupled content is
      REMOVED from the descent, never re-carried) + X3's active-content rule assign the
      light span the active set census 5/3; overcount_light proves the banked 2 retains
      EXACTLY the just-decoupled strange flavour's term — a systematic off-by-one.
  (3) THE POST-N574 CHAIN ALREADY COMMITTED: N579's one-cause theorem states the gem AT
      40/27 (endpoint_conf_one_cause) — the banked audit chain speaks the corrected
      census; only the production composition still computes with the old one.

  THIS NODE banks the adjudication as theorems: the same-summand regrouping, the forced
  correction welded to its N574/N575 ancestors BY NAME, the full corrected composition
  shape (the correction moves the cInner log WEIGHTS too — the referee's −8/27
  diagnostic is incomplete), and the honest status: the banked-frame landing bracket is
  a certified bracket OF THE BANKED-FRAME OBJECT; the corrected-frame recomposition is
  the directed successor's work (the completeness-tension question: does
  census_completeness_closure survive the active weights, or does the removed strange
  content re-enter as its own missing sub-band summand?).
-/

namespace Phys.Algebra
namespace BaseGemCensusAdjudicated
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.BaseNormalFormAudit
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra.DepthWeight
open Phys.Algebra.SubBandCompletion

noncomputable section

/-! ## (1) THE SAME-SUMMAND IDENTITY — the base's gem is the staircase light term. -/

/-- The base is the way-point plus the gem — the regrouping identity (re-export of the
    N575 decomposition; the gem is NOT an independent summand). -/
theorem base_is_waypoint_plus_gem : (2425 : Cut) / 18 = 7179 / 54 + 16 / 9 :=
  base_eq_waypoint_plus_gem

/-- THE GEM IS THE LIGHT-CENSUS SCREEN (N575's identification, consumed by name): the
    base's 16/9 is κ·censusLightBand·(8π/3) — the staircase light-edge object, not a
    plateau. -/
theorem gem_is_light_census_screen :
    kappaLeading * censusLightBand * (8 * cutPi / 3) = 16 / 9 :=
  base_gem_is_light_census

/-! ## (2) THE FORCED CORRECTION — consumed from its N574/N575 ancestors by name. -/

/-- THE OVER-COUNT IS EXACTLY THE JUST-DECOUPLED STRANGE TERM (N574's overcount_light,
    consumed): censusLightBand − censusActiveLightSpan = colouredCensusTerm 1. -/
theorem gem_census_overcounts_by_strange :
    censusLightBand - censusActiveLightSpan = ((colouredCensusTerm 1 : ℚ) : Cut) :=
  overcount_light

/-- THE CORRECTED GEM (N574's gem_active through N575's active-census form). -/
theorem gem_corrected :
    kappaLeading * censusActiveLightSpan * (8 * cutPi / 3) = 40 / 27 :=
  base_gem_active_census

/-- THE CORRECTED BASE (N575's base_corrected, consumed): 7259/54. -/
theorem base_corrected_value : (6923 : Cut) / 54 + 128 / 27 + 40 / 27 = 7259 / 54 :=
  base_corrected

/-- THE DROP IS THE GEM'S OVER-COUNT EXACTLY (N575's base_drop_val): the base moves by
    16/9 − 40/27 = 8/27 and by NOTHING else. -/
theorem base_drop_is_gem_drop : (2425 : Cut) / 18 - 7259 / 54 = 16 / 9 - 40 / 27 :=
  base_drop_val

/-! ## (3) THE FULL CORRECTION SHAPE — the log weights move too (the referee's −8/27
    diagnostic is incomplete). -/

/-- ★★ THE CORRECTED DISSOLVED SUMMAND (N574's freezeoutActive_summand_dissolved shape,
    stated as the weight identity): the active-span correction changes the constant
    (16/9 → 40/27) AND the L_mb, L_b0 weights ((7/3, 11/3) → (3, 10/3)); the L_b2 weight
    −5/3 is unchanged. Stated as the exact difference of the two summand forms — the
    full correction the recomposition must carry: -/
theorem full_correction_shape (Lmb Lb0 Lb2 : Cut) :
    (16 / 9 + kappaLeading * ((7/3) * Lmb + (11/3) * Lb0 - (5/3) * Lb2))
      - (40 / 27 + kappaLeading * (3 * Lmb + (10/3) * Lb0 - (5/3) * Lb2))
      = 8 / 27 + kappaLeading * (-(2/3) * Lmb + (1/3) * Lb0) := by
  ring_nf

/-- The correction is REAL (teeth): the gem over-count is strictly positive — the base
    strictly drops (N575's base_corrected_lt_base consumed). -/
theorem correction_real : (7259 : Cut) / 54 < 2425 / 18 :=
  base_corrected_lt_base

/-! ## (4) THE ADJUDICATION LANDING — what is now settled and what is opened. -/

/-- ★★★ THE ADJUDICATION: the base's gem carries the light-band census object (1), that
    census over-counts by exactly the strange term (2), the corrected gem/base are the
    banked N574/N575 values (3), and the base drop is exactly the gem drop (4) — the
    production base 2425/18 is REFUTED by the fold's own counting; the true base under
    the banked active-span rule is 7259/54, and the full correction carries the log-
    weight shift (5). The banked-frame landing bracket remains a certified bracket OF
    the banked-frame composition; the corrected-frame recomposition (and the
    completeness-tension question it opens) is the directed successor. -/
theorem base_gem_census_adjudicated :
    (kappaLeading * censusLightBand * (8 * cutPi / 3) = 16 / 9)
    ∧ (censusLightBand - censusActiveLightSpan = ((colouredCensusTerm 1 : ℚ) : Cut))
    ∧ (kappaLeading * censusActiveLightSpan * (8 * cutPi / 3) = 40 / 27)
    ∧ ((2425 : Cut) / 18 - 7259 / 54 = 16 / 9 - 40 / 27)
    ∧ ((7259 : Cut) / 54 < 2425 / 18) :=
  ⟨gem_is_light_census_screen, gem_census_overcounts_by_strange, gem_corrected,
   base_drop_is_gem_drop, correction_real⟩

end
end BaseGemCensusAdjudicated
end Phys.Algebra
