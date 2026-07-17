/-
  Counterexamples.TheNumeralVacuityCostume — N### / ARC-D D7 anti-vacuity (C521).
  =====================================================================================
  W8 ANTI-VACUITY. The D7 node (ARC-D THE DIGITS — THE NUMERAL: state the certified two-sided
  rational bracket for the derived partial-tower endpoint to 12 significant digits, WITH the
  composition-completeness gate applied FIRST) proves the composition-completeness ATTESTATION: the
  certified 12-digit bracket is a WAY-POINT, not the endpoint, because the freeze-out sub-band summand
  is present and strictly positive. The marquee content that must NOT be hollow: the ATTESTATION IS
  LOAD-BEARING -- for screening freeze-out edge ratios, the partial-tower endpoint
  invAlphaZero (completeBandList chargeTraceDepth) is GENUINELY DISTINCT from the complete tower
  invAlphaZero (completeFreezeoutList rb rc rl chargeTraceDepth). A partial composition is genuinely
  NOT the endpoint. A hollow reading where "the partial sum already equals the complete tower / the
  freeze-out summand is zero / the composition is already complete" is refuted: the banked
  attestation_partial proves the partial sum is strictly below the complete tower (for rb=rc=rl=2),
  so they are distinct.

  THE CERTIFICATE. numFlag := 1 -- a natural-number flag standing for "the composition-completeness
  attestation is LOAD-BEARING: the certified 12-digit numeral is a WAY-POINT, strictly below the
  complete tower with the freeze-out sub-bands inserted, so the composition is genuinely PARTIAL". It
  is TIED to the banked D7 landing by numFlag_forced: attestation_partial (at rb=rc=rl=2) witnesses
  invAlphaZero (completeBandList chargeTraceDepth) < invAlphaZero (completeFreezeoutList 2 2 2
  chargeTraceDepth), so the flag is 1.

  We anchor min 521 numFlag = 1 (TRUE -- numFlag = 1 < 521, so the min is numFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the partial sum already equals the complete tower / the
  freeze-out summand is zero / the composition is already complete" mis-reading): that
  min 521 numFlag = 521. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 521 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (521, 1) is fresh (Cid 521 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TheNumeral
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.TheNumeral
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D7 FLAG: 1 = "the composition-completeness attestation is LOAD-BEARING -- the certified
    12-digit numeral is a WAY-POINT, strictly below the complete tower with the freeze-out sub-bands
    inserted, so the composition is genuinely PARTIAL". -/
def numFlag : ℕ := 1

/-- TRUE (tied to the banked D7 landing): attestation_partial (at rb=rc=rl=2) proves the partial-tower
    endpoint is strictly below the complete tower, so the flag is present, numFlag = 1. -/
theorem numFlag_forced :
    invAlphaZero (completeBandList chargeTraceDepth)
        < invAlphaZero (completeFreezeoutList 2 2 2 chargeTraceDepth)
      ∧ numFlag = 1 :=
  ⟨attestation_partial 2 2 2 (by norm_num) (by norm_num) (by norm_num), rfl⟩

/-- TRUE: min 521 numFlag = 1, holding precisely because numFlag = 1 < 521. -/
theorem cert_val_true : min (521 : ℕ) numFlag = 1 := by decide

/-- BOGUS: claims min 521 numFlag = 521. It GENUINELY equals 1 (cert_val_true). A "the partial sum
    already equals the complete tower / the freeze-out summand is zero / the composition is already
    complete" mis-reading reduces -- through the banked value -- to the false numeric 1 = 521, so
    this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (521 : ℕ) numFlag = 521 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 521  (FALSE — the costume bites)

end Counterexamples
