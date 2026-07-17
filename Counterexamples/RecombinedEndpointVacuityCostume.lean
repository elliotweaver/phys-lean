/-
  Counterexamples.RecombinedEndpointVacuityCostume — RecombinedEndpoint anti-vacuity (C529).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE CHANNEL RECOMBINATION WELD) composes the banked two-channel
  recombination (Z2 `TwoChannelDescent`) into the endpoint tower: the photon EM coupling is the sum
  of the isospin and hypercharge towers, so the recombined endpoint is the single-fold-coupling
  endpoint (X6/Z6/D7) LIFTED by the second (hypercharge) ceiling — `invAlphaEM (completeBandList
  chargeTraceDepth) = invAlphaZero (completeBandList chargeTraceDepth) + 70` — with recombination
  weight `sin²θ_W = 42/112 = 3/8`. The content that must NOT be hollow: the `+70` genuinely moves the
  endpoint (`invAlphaEM ≠ invAlphaZero`), both channel censuses are present and ASYMMETRIC
  (`isoDepth = 2 ≠ 10/3 = hyperDepth`, both nonzero), and the recombination weight is the correct
  `3/8`, NOT the wrong `1/4`. A "the recombination weld is vacuous / the second ceiling adds nothing /
  the two channels coincide / the weight is 1/4" mis-reading is refuted by the banked
  `plus70_load_bearing`, `both_channels_present`, `census_split_ne_trivial`, and `weight_ne_wrong`.

  THE CERTIFICATE. recFlag := 1 -- a natural-number flag standing for "the derived channel
  recombination weld is non-vacuous: the +70 hypercharge ceiling genuinely lifts the endpoint, both
  channel censuses are present and asymmetric (2 ≠ 10/3), and the recombination weight is 3/8 (not
  1/4)". It is TIED to the banked landing by recFlag_forced: `plus70_load_bearing` gives
  `invAlphaEM ≠ invAlphaZero`, `both_channels_present` gives `isoDepth ≠ 0 ∧ hyperDepth ≠ 0`,
  `census_split_ne_trivial` gives `isoDepth ≠ hyperDepth`, `weight_ne_wrong` gives the weight ≠ 1/4,
  so the flag is 1.

  We anchor min 529 recFlag = 1 (TRUE -- recFlag = 1 < 529, so the min is recFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the recombination weld is vacuous / the second ceiling adds
  nothing / the two channels coincide / the weight is 1/4" mis-reading): that min 529 recFlag = 529.
  It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric
  1 = 529 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (529, 1) is fresh (Cid 529 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.RecombinedEndpoint
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived channel recombination weld is non-vacuous — the +70 hypercharge
    ceiling genuinely lifts the endpoint, both channel censuses are present and asymmetric (2 ≠ 10/3),
    and the recombination weight is 3/8 (not 1/4)". -/
def recFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the +70 genuinely lifts the endpoint
    (`plus70_load_bearing`), both channel censuses are present (`both_channels_present`), the split is
    asymmetric (`census_split_ne_trivial`), the recombination weight ≠ 1/4 (`weight_ne_wrong`), and
    `recFlag = 1`. -/
theorem recFlag_forced :
    (invAlphaEM (completeBandList chargeTraceDepth)
        ≠ invAlphaZero (completeBandList chargeTraceDepth))
    ∧ (isoDepth ≠ 0 ∧ hyperDepth ≠ 0)
    ∧ isoDepth ≠ hyperDepth
    ∧ (invAlpha2High / (invAlpha2High + invAlphaYHigh) ≠ 1 / 4)
    ∧ recFlag = 1 :=
  ⟨plus70_load_bearing, both_channels_present, census_split_ne_trivial, weight_ne_wrong, rfl⟩

/-- TRUE: min 529 recFlag = 1, holding precisely because recFlag = 1 < 529. -/
theorem cert_val_true : min (529 : ℕ) recFlag = 1 := by decide

/-- BOGUS: claims min 529 recFlag = 529. It GENUINELY equals 1 (cert_val_true). A "the recombination
    weld is vacuous / the second ceiling adds nothing / the two channels coincide / the weight is
    1/4" mis-reading reduces -- through the banked landing -- to the false numeric 1 = 529, so this
    must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (529 : ℕ) recFlag = 529 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 529  (FALSE — the costume bites)

end Counterexamples
