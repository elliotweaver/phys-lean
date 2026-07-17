import Phys.Algebra.WayPointBracket
import Phys.Algebra.SubBandCompletion
import Mathlib.Tactic

namespace Phys.Algebra.ProbeD7

open Phys.Algebra
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (1) THE NUMERAL pinned to 12 significant digits
theorem numeral_pinned :
    (679475880261 / 10000000000 : Cut) < invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) < 679475880262 / 10000000000 := by
  obtain ⟨hlo, hhi⟩ := NarrowedBracket12.invAlphaZero_narrowed12_bracket
  constructor
  · have hw : (679475880261 / 10000000000 : Cut) < 12007329939722 / 176714586765 := by norm_num
    linarith
  · have hw : (32019546505738 / 471238898037 : Cut) < 679475880262 / 10000000000 := by norm_num
    linarith

-- (2) THE COMPOSITION-COMPLETENESS ATTESTATION (negative): the complete tower (freeze-out inserted)
-- reads EXACTLY the partial-tower way-point plus the freeze-out tail screening.
theorem complete_tower_exceeds_waypoint (rb rc rl d : Cut) :
    invAlphaZero (completeFreezeoutList rb rc rl d)
      = invAlphaZero (completeBandList d) + totalScreening (freezeoutTail rb rc rl) := by
  rw [freezeout_confWaypoint_free, totalScreening_append, confWaypoint_in_complete]
  ring

-- the freeze-out gap is strictly positive for screening ratios: the missing summand is non-zero
theorem freezeout_gap_pos (rb rc rl : Cut) (hb : 1 < rb) (hc : 1 < rc) (hl : 1 < rl) :
    invAlphaZero (completeBandList chargeTraceDepth)
      < invAlphaZero (completeFreezeoutList rb rc rl chargeTraceDepth) := by
  rw [complete_tower_exceeds_waypoint]
  have := freezeoutTail_screens rb rc rl hb hc hl
  linarith

-- (3) teeth
theorem numeral_window_strict :
    (679475880261 / 10000000000 : Cut) < 679475880262 / 10000000000 := by norm_num

theorem waypoint_ne_endpoint (rb rc rl : Cut) (hb : 1 < rb) (hc : 1 < rc) (hl : 1 < rl) :
    invAlphaZero (completeBandList chargeTraceDepth)
      ≠ invAlphaZero (completeFreezeoutList rb rc rl chargeTraceDepth) :=
  ne_of_lt (freezeout_gap_pos rb rc rl hb hc hl)

end

end Phys.Algebra.ProbeD7
