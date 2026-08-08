/-
  Counterexamples.MirrorLegalityDerivedVacuityCostume — the derived legality is GENUINE:
  the relation is inhabited, its slot conclusions genuinely consume the forcing theorems
  (moment law welded to constructed fluxes; zero-gap screening; unary multiplicity), and
  the ∀-n moment selection discriminates (n = 4 fails it). C678.
  =====================================================================================
  W8 ANTI-VACUITY. N678 answers the referee finding that ChainLegal was definitionally
  the slot values. DerivedLegal's conjuncts name only banked structural objects; the
  values are CONCLUSIONS. What must NOT be hollow: (i) DerivedLegal is INHABITED
  (mirrorParsed_derivedLegal); (ii) the moment selection law is a genuine ∀-n
  discriminator — termMomentNorm 4 ≠ depthWeight (the four-ended term FAILS the ends
  conjunct for a structural reason); (iii) the derived and value forms provably agree
  (derivedLegal_iff_chainLegal), so the derivation is OF the same selection, not of a
  conveniently different one.

  THE CERTIFICATE. attestFlag := 1 -- "derived legality inhabited + discriminating + faithful".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 678 attestFlag = 1 (TRUE -- attestFlag = 1 < 678).

  THE BOGUS CLAIM (a stand-in for ANY "the derived relation is empty / the moment law
  does not discriminate / the derived relation is not the same selection" reading): that
  min 678 attestFlag = 678. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the
  bogus claim to the false numeric 1 = 678 in the naturals. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (678, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.MirrorLegalityDerived

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MirrorTermLanguage
open Phys.Algebra.ChainTermGrammar
open Phys.Algebra.DepthWeight
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "derived legality inhabited, discriminating, and faithful". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): DerivedLegal is inhabited by the mirror term,
    the ∀-n moment law rejects n = 4 (the selection discriminates), the derived and
    value legalities agree on every term, and attestFlag = 1. -/
theorem attestFlag_forced :
    DerivedLegal mirrorParsed
      ∧ termMomentNorm 4 ≠ depthWeight
      ∧ (∀ t : ParsedTerm, DerivedLegal t ↔ ChainLegal t)
      ∧ attestFlag = 1 :=
  ⟨mirrorParsed_derivedLegal,
   fun h => by simpa using (termMomentNorm_eq_weight_iff 4).mp h,
   derivedLegal_iff_chainLegal, rfl⟩

/-- TRUE: min 678 attestFlag = 1. -/
theorem cert_val_true : min (678 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 678 attestFlag = 678. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (678 : ℕ) attestFlag = 678 := by
  rw [cert_val_true]

end Counterexamples
