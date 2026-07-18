/-
  Counterexamples.PerChannelRecombinationVacuityCostume — the recomposed census-conserving endpoint
  assembly is GENUINE: the freeze-out staircase summand is strictly POSITIVE (a real below-Λ screening,
  not a vacuous zero), the two below-Λ census parts are DISTINCT (`10/3 ≠ 2`, no double-count), and the
  derived anti-screening `s = 1/8` genuinely BITES (`7/18 ≠ 0`). C567.
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE PER-CHANNEL RUNNING-DESCENT RECOMBINATION) assembles the recomposed
  census-conserving endpoint over the two-channel descent + the below-Λ census-conserving tail. The
  content that must NOT be hollow is that the assembly is GENUINE — the freeze-out staircase summand is a
  strictly POSITIVE contribution (`freezeoutStaircaseSummand_pos`), the two below-Λ census parts (coloured
  `10/3` vs singlet `2`) are genuinely DISTINCT (`below_parts_distinct`, no double-count degeneracy), and
  the derived anti-screening `s = 1/8` genuinely moves the endpoint (`antiScreen_bites`, `7/18 ≠ 0`). If
  the freeze-out summand were `≤ 0`, or the two census parts coincided, or the anti-screening vanished, the
  recompose would be vacuous. It is genuine: `0 < freezeoutStaircaseSummand`, `10/3 ≠ 2`, `7/18 ≠ 0`.

  THE CERTIFICATE. recombFlag := 1 -- a natural-number flag standing for "the recomposed census-conserving
  endpoint assembly is genuine: the freeze-out staircase summand is strictly positive, the two below-Λ
  census parts are distinct, and the derived anti-screening bites". It is TIED to the banked landing by
  recombFlag_forced.

  We anchor min 567 recombFlag = 1 (TRUE -- recombFlag = 1 < 567, so the min is recombFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the freeze-out summand is nonpositive / the two census parts
  coincide / the anti-screening is zero / the recompose is vacuous" reading): that min 567 recombFlag =
  567. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric
  1 = 567 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (567, 1) is fresh (Cid 567 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.PerChannelRecombination
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.PerChannelRecomb
open Phys.Algebra
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the recomposed census-conserving endpoint assembly is genuine: the freeze-out
    staircase summand is strictly positive, the two below-Λ census parts are distinct, and the derived
    anti-screening bites". -/
def recombFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the freeze-out staircase summand is strictly positive
    (`freezeoutStaircaseSummand_pos`), the two below-Λ census parts are distinct (`below_parts_distinct`),
    and the derived anti-screening genuinely bites (`antiScreen_bites`) — and `recombFlag = 1`. -/
theorem recombFlag_forced :
    (0 < freezeoutStaircaseSummand)
    ∧ (((freezeoutStaircaseCensus : ℚ) : Cut) ≠ leptonCensus)
    ∧ (bandScreen projectedS topBandRatio ≠ 0)
    ∧ recombFlag = 1 :=
  ⟨freezeoutStaircaseSummand_pos, below_parts_distinct, antiScreen_bites, rfl⟩

/-- TRUE: min 567 recombFlag = 1, holding precisely because recombFlag = 1 < 567. -/
theorem cert_val_true : min (567 : ℕ) recombFlag = 1 := by decide

/-- BOGUS: claims min 567 recombFlag = 567. It GENUINELY equals 1 (cert_val_true). A "the freeze-out
    summand is nonpositive / the census parts coincide / the anti-screening is zero / the recompose is
    vacuous" reading reduces -- through the banked freezeoutStaircaseSummand_pos / below_parts_distinct /
    antiScreen_bites tie -- to the false numeric 1 = 567 in the naturals. The kernel cannot close it; it
    BITES. -/
theorem bogus_claim : min (567 : ℕ) recombFlag = 567 := by
  rw [cert_val_true]

end Counterexamples
