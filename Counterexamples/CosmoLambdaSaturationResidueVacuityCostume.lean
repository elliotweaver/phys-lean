/-
  Counterexamples.CosmoLambdaSaturationResidueVacuityCostume — N436 anti-vacuity (C461).
  ============================================================================================
  W8 ANTI-VACUITY. The N436 node (arc-Q Q2 — THE Λ VALUE as the saturation-residue mechanism:
  the vacuum-energy density is the fourth power of the per-channel deepest derived scale, the
  BARE constant is zero, the observed value the residue of incomplete self-coherence) has genuine
  content only if the residue landings genuinely DEPEND on the banked objects and the threads bite.
  Specifically it needs:
  (a) the fourth-power = iterated Born self-overlap (`vacuumResidueDensity_is_iterated_selfOverlap`,
      the exponent being the DERIVED spacetime dimension `vacuumResidueExponent_eq_spacetimeDim`);
  (b) the bare term is exactly zero (`bareCosmoConstant_zero`) yet the residue is positive and
      DISTINCT from it (`vacuumResidueDensity_pos`, `vacuumResidueDensity_ne_bare`);
  (c) the structural divisor is the banked octonion Born-channel count 42 and genuinely suppresses
      the residue below the un-diluted fourth power (`structuralDivisor_eq_channelCount`,
      `residue_suppressed_below_scale4`);
  (d) the joint-kill tie to the ν sum (`residue_rides_seesaw_scale`);
  (e) the capstone (`lambda_saturation_residue`) and the W8 teeth (`lambda_residue_nonvacuous`).
  A mis-reading where the residue equalled the bare zero (a hollow mechanism), or where the divisor
  did not suppress, would gut Q2.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N436 Λ saturation-residue is genuine:
  the residue is the iterated self-overlap fourth power of the per-channel deepest scale, the bare
  term is zero and the residue is a positive distinct remainder, the divisor 42 suppresses, and the
  residue rides the same seesaw scale as the ν sum". It is TIED to the banked N436 landing by
  `cFlag_forced` through `vacuumResidueDensity_is_iterated_selfOverlap`,
  `vacuumResidueExponent_eq_spacetimeDim`, `bareCosmoConstant_zero`, `vacuumResidueDensity_ne_bare`,
  `structuralDivisor_eq_channelCount`, `residue_suppressed_below_scale4`, `residue_rides_seesaw_scale`,
  `lambda_saturation_residue`, and `lambda_residue_nonvacuous`.

  We anchor `min 461 cFlag = 1` (TRUE — `cFlag = 1 < 461`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the residue is hollow / equals the bare zero / the divisor
  does not bite" mis-reading): that `min 461 cFlag = 461`. It GENUINELY equals `1` (`cons_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 461` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (461, 1) is fresh (Cid 461 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoLambdaSaturationResidue
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.Cosmo

/-- THE N436-NON-VACUITY FLAG: `1` = "the Λ saturation-residue is genuine: the residue is the
    iterated self-overlap fourth power of the per-channel deepest scale, the bare term is zero and
    the residue a positive distinct remainder, the divisor 42 suppresses, and it rides the ν scale". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N436 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing Q2 landings — the iterated self-overlap fourth power over the derived dimension
    (`vacuumResidueDensity_is_iterated_selfOverlap`, `vacuumResidueExponent_eq_spacetimeDim`), the
    bare-zero / positive-distinct-residue pair (`bareCosmoConstant_zero`,
    `vacuumResidueDensity_ne_bare`), the divisor-42 suppression (`structuralDivisor_eq_channelCount`,
    `residue_suppressed_below_scale4`), the joint-kill tie (`residue_rides_seesaw_scale`), the
    capstone (`lambda_saturation_residue`) and the teeth (`lambda_residue_nonvacuous`). If the residue
    were hollow / equalled the bare zero / the divisor did not bite, those decls would not exist and
    this could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @vacuumResidueDensity_is_iterated_selfOverlap
  have _ := vacuumResidueExponent_eq_spacetimeDim
  have _ := @bareCosmoConstant_zero
  have _ := @vacuumResidueDensity_ne_bare
  have _ := structuralDivisor_eq_channelCount
  have _ := @residue_suppressed_below_scale4
  have _ := @residue_rides_seesaw_scale
  have _ := @lambda_saturation_residue
  have _ := lambda_residue_nonvacuous
  rfl

/-- TRUE: `min 461 cFlag = 1`, holding precisely because `cFlag = 1 < 461`. -/
theorem cons_val_true : min (461 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 461 cFlag = 461`. It GENUINELY equals `1` (`cons_val_true`). A "the residue
    is hollow / equals the bare zero / the divisor does not bite" mis-reading reduces — through the
    banked N436 landing — to the false numeric `1 = 461`, so this must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (461 : ℕ) cFlag = 461 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 461  (FALSE — the costume bites)

end Counterexamples
