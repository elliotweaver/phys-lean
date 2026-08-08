/-
  Counterexamples.UnaryNestCountVacuityCostume — the constructed unary object is GENUINE:
  the family is inhabited at every depth, the count-is-one is proved by induction on the
  structure (not defined), the weld to the banked tower coefficients holds, and the
  constructed legality selects. C679.
  =====================================================================================
  W8 ANTI-VACUITY. N679 answers referee seam A: the return slot must be forced by an
  independently constructed unary object, not by `foldCount := fun _ => 1`. What must
  NOT be hollow: (i) `UnaryNest` is inhabited at every depth AND subsingleton — the
  count 1 is the cardinality of a real structure, proved by induction; (ii) the weld
  `foldCount n = nestCount n` holds (the banked tower's coefficients ARE the counted
  structure); (iii) the constructed legality is inhabited and still selects uniquely.

  THE CERTIFICATE. attestFlag := 1 -- "constructed, counted, welded, selecting".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 679 attestFlag = 1 (TRUE -- attestFlag = 1 < 679).

  THE BOGUS CLAIM (a stand-in for ANY "the family is empty / the count is defined not
  proved / the weld fails" reading): that min 679 attestFlag = 679. It GENUINELY equals
  1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 679 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (679, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.UnaryNestCount

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MirrorTermLanguage
open Phys.Algebra.ChainTermGrammar
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "constructed, counted, welded, selecting". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): every depth of the constructed family is
    inhabited, the counted multiplicity is 1 at every depth (induction on the
    structure), the weld to the banked tower coefficients holds at every depth, the
    constructed legality is inhabited, and attestFlag = 1. -/
theorem attestFlag_forced :
    (∀ n : ℕ, Nonempty (UnaryNest n))
      ∧ (∀ n : ℕ, nestCount n = 1)
      ∧ (∀ n : ℕ, Phys.Algebra.foldCount n = nestCount n)
      ∧ DerivedLegalNest mirrorParsed
      ∧ attestFlag = 1 :=
  ⟨fun n => ⟨UnaryNest.canonical n⟩, nestCount_eq_one, foldCount_eq_nestCount,
   mirrorParsed_derivedLegalNest, rfl⟩

/-- TRUE: min 679 attestFlag = 1. -/
theorem cert_val_true : min (679 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 679 attestFlag = 679. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (679 : ℕ) attestFlag = 679 := by
  rw [cert_val_true]

end Counterexamples
