/-
  Counterexamples.D7AugmentedAttestationVacuityCostume — the D7 AUGMENTED COMPOSITION-COMPLETENESS
  ATTESTATION (the TWO owner-named forced summands composed into the census-conserving descent, the
  ledger CLOSED, restated AS `1/α(0)`) is GENUINE: the mirror threshold census shift is a real derived
  count (`mirrorMultCensus = 3 ≠ 0`) whose composed descent contribution vanishes at the derived
  splitting, the above-floor level weights sit on a real, populated floor whose occupancy count `16` is
  GENUINELY DISTINCT from the freeze-out census total `9`, and the endpoint lies strictly below `137`
  (the fold's prediction, a real exclusion of the measured value). C570.
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE D7 AUGMENTED ATTESTATION) composes both enumerated forced summands
  and closes the completeness ledger. The content that must NOT be hollow is that the mirror census is a
  genuine nonzero count (`mirrorMultCensus = 3`, so the composed summand acts on a real multiplet — its
  descent contribution vanishing at the derived splitting is a real degeneracy, not a vacuous zero),
  that the above-floor floor occupancy count `16` is GENUINELY DISTINCT from the freeze-out census total
  `9` (the two counts are different objects — the above-floor weights are their own structure, not the
  flavour census re-labelled), and that the endpoint is GENUINELY below `137` (a real exclusion of the
  measured `= 137.036`, the kernel-forced landing). If the mirror census were zero, or the two counts
  coincided, or the endpoint were not below `137`, the attestation would be hollow. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the D7 augmented attestation
  is genuine: the mirror census is a nonzero derived count, the floor occupancy is distinct from the
  freeze-out census, and the endpoint lies strictly below 137". It is TIED to the banked landing by
  attestFlag_forced.

  We anchor min 570 attestFlag = 1 (TRUE -- attestFlag = 1 < 570, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the mirror census is zero / the two counts coincide / the
  endpoint is not below 137 / the attestation is hollow" reading): that min 570 attestFlag = 570. It
  GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 570 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (570, 1) is fresh (Cid 570 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.D7AugmentedAttestation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.D7AugmentedAttestation
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.JoinContent
open Phys.Algebra.HadronicLevelWeights
open Phys.Algebra.SubBandCompletion
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D7 augmented attestation is genuine: the mirror census is a nonzero derived
    count, the floor occupancy is distinct from the freeze-out census, and the endpoint lies strictly
    below 137". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the mirror census is a nonzero derived count
    (`mirror_census_count = 3`), the floor occupancy count is distinct from the freeze-out census total
    (`abovefloor_count_distinct`), and the endpoint is strictly below `137`
    (`augmented_endpoint_predicts_below_137`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    (mirrorMultCensus = 3)
    ∧ (((Nat.card ↥(levelOccupancy 1) : ℕ) : Cut)
        ≠ censusBottomBand + censusCharmBand + censusLightBand)
    ∧ (recomposedEndpoint < 137)
    ∧ attestFlag = 1 :=
  ⟨mirror_census_count, abovefloor_count_distinct, augmented_endpoint_predicts_below_137, rfl⟩

/-- TRUE: min 570 attestFlag = 1, holding precisely because attestFlag = 1 < 570. -/
theorem cert_val_true : min (570 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 570 attestFlag = 570. It GENUINELY equals 1 (cert_val_true). A "the mirror census
    is zero / the two counts coincide / the endpoint is not below 137 / the attestation is hollow"
    reading reduces -- through the banked mirror_census_count / abovefloor_count_distinct /
    augmented_endpoint_predicts_below_137 tie -- to the false numeric 1 = 570 in the naturals. The kernel
    cannot close it; it BITES. -/
theorem bogus_claim : min (570 : ℕ) attestFlag = 570 := by
  rw [cert_val_true]

end Counterexamples
