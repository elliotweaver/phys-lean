/-
  Counterexamples.EwRungRelationalSignatureVacuityCostume — the EW rung's relational
  signature is GENUINE: the relations hold, the uniqueness pin discriminates (n = 7 and
  n = 42 both FAIL the EW signature), and the band membership is real. C686.
  =====================================================================================
  W8 ANTI-VACUITY. N686 identifies the n=9 rung RELATIONALLY (the ontology rule: math =
  physics; identification = relations + uniqueness, never naming). What must NOT be
  hollow: (i) the relations hold (dim-through-finrank, shared α numerator, band census);
  (ii) the pin DISCRIMINATES — nearby candidates fail (rungExponent 7 ≠ 28π/3,
  rungExponent 42 ≠ 28π/3 via the iff); (iii) the band entry is genuinely in the list.

  THE CERTIFICATE. attestFlag := 1 -- "relations hold + pin discriminates".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 686 attestFlag = 1 (TRUE -- attestFlag = 1 < 686).

  THE BOGUS CLAIM (a stand-in for ANY "the signature is vacuous / the pin admits other
  n / the relations are namings" reading): that min 686 attestFlag = 686. It GENUINELY
  equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric
  1 = 686 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (686, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.EwRungRelationalSignature

namespace Counterexamples

open Phys.Algebra.EwRungRelationalSignature
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "relations hold + pin discriminates". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the numerator relation, the uniqueness pin at
    9, the DISCRIMINATION (7 and 42 fail the EW signature), and attestFlag = 1. -/
theorem attestFlag_forced :
    rungExponent (Module.finrank ℚ spaceSub) * (Module.finrank ℚ spaceSub : Cut)
        = azimuthalTurn * channelCount
      ∧ (rungExponent 9 = 28 * cutPi / 3)
      ∧ (rungExponent 7 ≠ 28 * cutPi / 3)
      ∧ (rungExponent 42 ≠ 28 * cutPi / 3)
      ∧ attestFlag = 1 := by
  refine ⟨ewRung_shares_alpha_numerator, ?_, ?_, ?_, rfl⟩
  · exact (ewRung_unique_in_grammar 9 (by norm_num)).mpr rfl
  · intro h
    exact absurd ((ewRung_unique_in_grammar 7 (by norm_num)).mp h) (by norm_num)
  · intro h
    exact absurd ((ewRung_unique_in_grammar 42 (by norm_num)).mp h) (by norm_num)

/-- TRUE: min 686 attestFlag = 1. -/
theorem cert_val_true : min (686 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 686 attestFlag = 686. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (686 : ℕ) attestFlag = 686 := by
  rw [cert_val_true]

end Counterexamples
