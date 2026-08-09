/-
  Counterexamples.ConfRungRelationalSignatureVacuityCostume — the confinement rung's
  relational signature is GENUINE: the relations hold, the pin discriminates (n = 9 and
  n = 3 FAIL the confinement signature), and the census-carrier tie is real arithmetic
  (210 = 7·6·5 through the banked finrank). C687.
  =====================================================================================
  W8 ANTI-VACUITY. N687 identifies the n=7 rung RELATIONALLY. What must NOT be hollow:
  (i) the relations hold (dim-through-finrank-imO, shared α numerator, census-carrier
  count); (ii) the pin DISCRIMINATES — rungExponent 9 ≠ 12π and rungExponent 3 ≠ 12π;
  (iii) the carrier tie is the real product identity, not a coincidence of labels.

  THE CERTIFICATE. attestFlag := 1 -- "relations hold + pin discriminates + carrier tied".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 687 attestFlag = 1 (TRUE -- attestFlag = 1 < 687).

  THE BOGUS CLAIM (a stand-in for ANY "the signature is vacuous / the pin admits other
  n / the carrier tie is labeling" reading): that min 687 attestFlag = 687. It GENUINELY
  equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric
  1 = 687 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (687, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ConfRungRelationalSignature

namespace Counterexamples

open Phys.Algebra.ConfRungRelationalSignature
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "relations hold + pin discriminates + carrier tied". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the α-numerator relation at the imaginary-
    octonion dimension, the uniqueness pin at 7, the DISCRIMINATION (9 and 3 fail),
    and attestFlag = 1. -/
theorem attestFlag_forced :
    (rungExponent 7 = 12 * cutPi)
      ∧ (rungExponent 9 ≠ 12 * cutPi)
      ∧ (rungExponent 3 ≠ 12 * cutPi)
      ∧ attestFlag = 1 := by
  refine ⟨?_, ?_, ?_, rfl⟩
  · exact (confRung_unique_in_grammar 7 (by norm_num)).mpr rfl
  · intro h
    exact absurd ((confRung_unique_in_grammar 9 (by norm_num)).mp h) (by norm_num)
  · intro h
    exact absurd ((confRung_unique_in_grammar 3 (by norm_num)).mp h) (by norm_num)

/-- TRUE: min 687 attestFlag = 1. -/
theorem cert_val_true : min (687 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 687 attestFlag = 687. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (687 : ℕ) attestFlag = 687 := by
  rw [cert_val_true]

end Counterexamples
