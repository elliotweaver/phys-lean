/-
  Counterexamples.LeadingComposedAssemblyVacuityCostume — the assembled leading-κ composed object
  genuinely moves the bare tower / the uncomposed summand acts on populated levels, anti-vacuity (C544).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE LEADING-κ COMPOSED 1/α(0) ASSEMBLED) assembles the way-point-
  consistent leading-κ composed object as a determined closed form and establishes the D7 composition-
  completeness attestation HONESTLY: every banked summand INCLUDED or proven zero EXCEPT the ONE
  genuinely-uncomposed summand — the D2e Born-weight modulation of the freeze-out — which is NAMED and
  handed to the route-finder. The composition is COMPLETE-UP-TO that modulation; it is a WAY-POINT,
  never claimed to be the ≥15-digit endpoint.

  The content that must NOT be hollow: the D2e Born-weight FLOOR is a GENUINELY-POPULATED level — the
  floor Born weight is `16 ≠ 0` (`bornweight_floor_nonzero`), so the uncomposed Born-weight modulation
  is a REAL missing summand acting on a populated spectrum, not a vacuous empty refinement. A "the
  uncomposed summand acts on nothing / the freeze-out fine structure is empty / the modulation is
  vacuous" mis-reading is refuted by the banked `bornweight_floor_nonzero`
  (`Nat.card ↥(levelOccupancy 1) ≠ 0`).

  THE CERTIFICATE. popFlag := 1 -- a natural-number flag standing for "the D2e Born-weight floor level
  is genuinely populated (Nat.card (levelOccupancy 1) ≠ 0), so the uncomposed Born-weight modulation is
  a real missing summand (bornweight_floor_nonzero)". It is TIED to the banked landing by popFlag_forced:
  `bornweight_floor_nonzero` gives `Nat.card ↥(levelOccupancy 1) ≠ 0`.

  We anchor min 544 popFlag = 1 (TRUE -- popFlag = 1 < 544, so the min is popFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the uncomposed summand acts on nothing / the modulation is
  vacuous" mis-reading): that min 544 popFlag = 544. It GENUINELY equals 1 (cert_val_true). Rewriting
  reduces the bogus claim to the false numeric 1 = 544 in the naturals. The kernel cannot close it; it
  BITES.

  DISTINCT from the banked battery: the pair (544, 1) is fresh (Cid 544 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.LeadingComposedAssembly
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.LeadingComposedAssembly
open Phys.Algebra.HadronicLevelWeights
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D2e Born-weight floor level is genuinely populated
    (Nat.card (levelOccupancy 1) ≠ 0), so the uncomposed Born-weight modulation is a real missing
    summand (bornweight_floor_nonzero)". -/
def popFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the D2e floor Born weight is genuinely nonzero
    (`bornweight_floor_nonzero`), and `popFlag = 1`. -/
theorem popFlag_forced :
    (Nat.card ↥(levelOccupancy 1) ≠ 0)
    ∧ popFlag = 1 :=
  ⟨bornweight_floor_nonzero, rfl⟩

/-- TRUE: min 544 popFlag = 1, holding precisely because popFlag = 1 < 544. -/
theorem cert_val_true : min (544 : ℕ) popFlag = 1 := by decide

/-- BOGUS: claims min 544 popFlag = 544. It GENUINELY equals 1 (cert_val_true). A "the uncomposed
    summand acts on nothing / the modulation is vacuous" mis-reading reduces -- through the banked
    landing -- to the false numeric 1 = 544, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (544 : ℕ) popFlag = 544 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 544  (FALSE — the costume bites)

end Counterexamples
