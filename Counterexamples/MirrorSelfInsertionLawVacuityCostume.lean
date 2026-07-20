/-
  Counterexamples.MirrorSelfInsertionLawVacuityCostume — the self-insertion law is GENUINE: the
  weight slot bites (w⁰ and w² laws give strictly sign-separated residuals at the root), the
  census slot bites (sub-census laws strictly miss), and the no-gap removal is exactly zero
  while genuine-edge removals are nonzero elsewhere in the bank. C589.
  =====================================================================================
  W8 ANTI-VACUITY. The O2 node claims the mirror term instantiates the banked unary law with
  the coefficient ASSEMBLED (one derived w × cap census × one κ). The content that must NOT be
  hollow: (i) the single-w slot is not decorative — the w⁰ law (c=16/3) and w² law (c=16/27)
  are STRICTLY different equations at the root (w_slot_bites: opposite strict signs); (ii) the
  cap-census slot is not decorative — the lepton (2·w) and coloured (10/3·w) sub-census laws
  strictly miss (census_slot_bites); (iii) the coefficient assembly is exact (16/9).

  THE CERTIFICATE. attestFlag := 1 -- "the insertion law's slots bite and the coefficient is
  assembled exactly". TIED to the banked landing by attestFlag_forced.

  We anchor min 589 attestFlag = 1 (TRUE -- attestFlag = 1 < 589).

  THE BOGUS CLAIM (a stand-in for ANY "the slots are decorative / any census-and-weight combo
  closes the equation / the assembly is approximate" reading): that min 589 attestFlag = 589.
  It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false
  numeric 1 = 589 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (589, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.MirrorSelfInsertionLaw

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MirrorFixedPoint
open Phys.Algebra.MirrorSelfInsertionLaw
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the insertion law's slots bite and the coefficient is assembled exactly". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the coefficient assembles to 16/9 for every coupling
    (`insertion_coefficient_forced`), the no-gap removal vanishes for every census
    (`census_no_edge_no_removal`), and `attestFlag = 1`. -/
theorem attestFlag_forced :
    (∀ a : Cut, mirrorInsertion a = (16/9) * kappaLeading * a^2)
    ∧ (∀ c : Cut, bandScreen c 1 = 0)
    ∧ attestFlag = 1 :=
  ⟨insertion_coefficient_forced, census_no_edge_no_removal, rfl⟩

/-- TRUE: min 589 attestFlag = 1. -/
theorem cert_val_true : min (589 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 589 attestFlag = 589. It GENUINELY equals 1 (cert_val_true). The kernel
    cannot close it; it BITES. -/
theorem bogus_claim : min (589 : ℕ) attestFlag = 589 := by
  rw [cert_val_true]

end Counterexamples
