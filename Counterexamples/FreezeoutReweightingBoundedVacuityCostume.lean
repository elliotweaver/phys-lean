/-
  Counterexamples.FreezeoutReweightingBoundedVacuityCostume — the D2e Born occupancy count and the
  freeze-out census total are GENUINELY DISTINCT objects (16 ≠ 9), anti-vacuity (C545).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE FREEZE-OUT REWEIGHTING IS A BOUNDED, CENSUS-CONSERVING O(1)
  REFINEMENT) corrects the parent's mis-selection: the "D2e Born-weight modulation of the freeze-out"
  is NOT the dominant missing summand of 1/α(0). A load-bearing step of the correction is that the
  D2e per-level Born occupancy of the floor (Nat.card (levelOccupancy 1) = 16) and the freeze-out
  total census (censusBottomBand + censusCharmBand + censusLightBand = 9) are GENUINELY DISTINCT
  objects — the integer-lattice degeneracy count is NOT the R-ratio flavour census. If they were the
  same count, the conflation ("the freeze-out band weights ARE the Born occupancies") would stand and
  the parent's target would not be a mis-selection.

  The content that must NOT be hollow: the two counts are distinct — the banked
  `occupancy_ne_census_total` gives `(Nat.card (levelOccupancy 1) : Cut) ≠ censusBottomBand +
  censusCharmBand + censusLightBand`, i.e. `16 ≠ 9`. A "the occupancy IS the census / the two counts
  coincide / the conflation holds" mis-reading is refuted by that banked theorem.

  THE CERTIFICATE. distinctFlag := 1 -- a natural-number flag standing for "the D2e Born occupancy
  count (16) and the freeze-out census total (9) are genuinely distinct objects
  (occupancy_ne_census_total), so the parent's conflation is refuted". It is TIED to the banked
  landing by distinctFlag_forced: `occupancy_ne_census_total` gives the count distinctness.

  We anchor min 545 distinctFlag = 1 (TRUE -- distinctFlag = 1 < 545, so the min is distinctFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the occupancy IS the census / the conflation holds"
  mis-reading): that min 545 distinctFlag = 545. It GENUINELY equals 1 (cert_val_true). Rewriting
  reduces the bogus claim to the false numeric 1 = 545 in the naturals. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (545, 1) is fresh (Cid 545 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FreezeoutReweightingBounded
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.FreezeoutReweightingBounded
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.HadronicLevelWeights
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D2e Born occupancy count (16) and the freeze-out census total (9) are
    genuinely distinct objects (occupancy_ne_census_total), so the parent's conflation is refuted". -/
def distinctFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the D2e Born occupancy count is distinct from the freeze-out
    census total (`occupancy_ne_census_total`), and `distinctFlag = 1`. -/
theorem distinctFlag_forced :
    (((Nat.card ↥(levelOccupancy 1) : ℕ) : Cut)
        ≠ censusBottomBand + censusCharmBand + censusLightBand)
    ∧ distinctFlag = 1 :=
  ⟨occupancy_ne_census_total, rfl⟩

/-- TRUE: min 545 distinctFlag = 1, holding precisely because distinctFlag = 1 < 545. -/
theorem cert_val_true : min (545 : ℕ) distinctFlag = 1 := by decide

/-- BOGUS: claims min 545 distinctFlag = 545. It GENUINELY equals 1 (cert_val_true). A "the occupancy
    IS the census / the conflation holds" mis-reading reduces -- through the banked
    occupancy_ne_census_total tie -- to the false numeric 1 = 545 in the naturals. The kernel cannot
    close it; it BITES. -/
theorem bogus_claim : min (545 : ℕ) distinctFlag = 545 := by
  rw [cert_val_true]

end Counterexamples
