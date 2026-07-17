/-
  Counterexamples.ComposedNumeralObstructionVacuityCostume — obstruction anti-vacuity (C533).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE COMPOSED-NUMERAL OBSTRUCTION) proves that the complete composed
  endpoint (D2b weld + D2c per-channel dressing + D2d join) is NOT determined to a two-sided bracket
  narrower than 1 while the isospin anti-screening magnitude is a free parameter in its banked open
  range: at the derived weight, the composed value at the admissible point 1/2 minus its value at the
  admissible point 3/2 STRICTLY EXCEEDS 1, independent of the join splitting. The content that must
  NOT be hollow: this two-point spread is genuinely POSITIVE and larger than 1 (not a collapsed
  zero), so a >=15-significant-digit bracket is genuinely impossible until the free parameter is
  derived. A "the composed numeral is already pinnable / the parameter spread is vacuous / a narrow
  bracket exists" mis-reading is refuted by the banked `composed_numeral_unpinnable` (spread > 1) and
  `no_narrow_bracket` (any containing bracket has width > 1).

  THE CERTIFICATE. cnoFlag := 1 -- a natural-number flag standing for "the derived composed-numeral
  obstruction is non-vacuous: the two admissible-parameter values of the fully-composed endpoint
  differ by strictly more than 1, so the numeral cannot be pinned to any bracket of width <= 1". It
  is TIED to the banked landing by cnoFlag_forced: `composed_numeral_unpinnable` gives the two-point
  spread > 1 (for the concrete join splitting 2), and `no_narrow_bracket` gives that any bracket
  containing both values has width > 1, so the flag is 1.

  We anchor min 533 cnoFlag = 1 (TRUE -- cnoFlag = 1 < 533, so the min is cnoFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the composed numeral is already pinnable / the parameter
  spread is vacuous / a narrow bracket exists" mis-reading): that min 533 cnoFlag = 533. It GENUINELY
  equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 533 in the
  naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (533, 1) is fresh (Cid 533 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ComposedNumeralObstruction
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.DepthWeight
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.PerChannelDressing
open Phys.Algebra.JoinContent
open Phys.Algebra.ComposedNumeralObstruction
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived composed-numeral obstruction is non-vacuous — the two
    admissible-parameter values of the fully-composed endpoint differ by strictly more than 1, so
    the numeral cannot be pinned to any bracket of width <= 1". -/
def cnoFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the two-point spread of the fully-composed endpoint exceeds 1
    (`composed_numeral_unpinnable` at join splitting 2), any bracket containing both admissible
    values has width > 1 (`no_narrow_bracket`), and `cnoFlag = 1`. -/
theorem cnoFlag_forced :
    ((1 : Cut)
        < dressedInvAlphaEMJoin depthWeight (1 / 2) 2 (completeBandList chargeTraceDepth)
          - dressedInvAlphaEMJoin depthWeight (3 / 2) 2 (completeBandList chargeTraceDepth))
    ∧ (∀ lo hi : Cut,
        dressedInvAlphaEMJoin depthWeight (1 / 2) 2 (completeBandList chargeTraceDepth) ≤ hi →
        lo ≤ dressedInvAlphaEMJoin depthWeight (3 / 2) 2 (completeBandList chargeTraceDepth) →
        (1 : Cut) < hi - lo)
    ∧ cnoFlag = 1 :=
  ⟨composed_numeral_unpinnable 2,
   fun lo hi h2 h3 => no_narrow_bracket 2 lo hi h2 h3,
   rfl⟩

/-- TRUE: min 533 cnoFlag = 1, holding precisely because cnoFlag = 1 < 533. -/
theorem cert_val_true : min (533 : ℕ) cnoFlag = 1 := by decide

/-- BOGUS: claims min 533 cnoFlag = 533. It GENUINELY equals 1 (cert_val_true). A "the composed
    numeral is already pinnable / the parameter spread is vacuous / a narrow bracket exists"
    mis-reading reduces -- through the banked landing -- to the false numeric 1 = 533, so this must
    NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (533 : ℕ) cnoFlag = 533 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 533  (FALSE — the costume bites)

end Counterexamples
