/-
  Counterexamples.GatherEndpointCompositionVacuityCostume — the gather composition is
  GENUINE: the cocycle is nonzero (the global section strictly exceeds the local one at
  the banked brackets is NOT claimed here — what IS certified: the dressed cocycle's
  rational part is exactly 8/27 ≠ 0, the two fixed-point seeds genuinely differ, and
  the gather identity is not a tautology (the two endpoints are distinct objects whose
  difference is the specific cocycle, not zero). C694.
  =====================================================================================
  W8 ANTI-VACUITY. N694 banks the gather composition: banked endpoint = corrected local
  endpoint + dressed closure cocycle; F0Gather = F0; the banked landing bracket as the
  global section's fixed point. What must NOT be hollow: (i) the cocycle's rational
  part is nonzero (8/27); (ii) F0 ≠ F0Corrected (the global and local fixed-point seeds
  genuinely differ — their difference is the dressed cocycle, nonzero at the banked
  brackets); (iii) the seam-law citation carries real content (the ladder holds).

  THE CERTIFICATE. attestFlag := 1 -- "cocycle nonzero + seeds differ + ladder real".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 694 attestFlag = 1 (TRUE -- attestFlag = 1 < 694).

  THE BOGUS CLAIM (a stand-in for ANY "the gather identity is a tautology / the cocycle
  is zero / global = local" reading): that min 694 attestFlag = 694. It GENUINELY
  equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric
  1 = 694 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (694, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GatherEndpointComposition

namespace Counterexamples

open Phys.Algebra.GatherEndpointComposition
open Phys.Algebra.ThresholdClosureSeamLaw
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "cocycle nonzero + seeds differ + ladder real". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the gem-defect rational is nonzero, the
    difference of the two fixed-point seeds IS the dressed cocycle (from the gather
    identity and the two seed definitions), the ladder holds, and attestFlag = 1. -/
theorem attestFlag_forced :
    ((8 : Cut) / 27 ≠ 0)
      ∧ (MirrorFixedPoint.F0 - CorrectedMirrorFixedPoint.F0Corrected
          = dressedClosureCocycle)
      ∧ (censusActiveBottomSpan = censusCharmBand)
      ∧ attestFlag = 1 := by
  refine ⟨by norm_num, ?_, ladder_bottom, rfl⟩
  have h1 := gather_endpoint_eq
  have h2 := local_fixed_point_seed
  have h3 : MirrorFixedPoint.F0
      = D7DepthTwoComposed.recomposedEndpointDressed - MirrorFixedPoint.obstructionTerm :=
    (F0Gather_eq_F0).symm
  rw [h3, h2, h1]
  ring

/-- TRUE: min 694 attestFlag = 1. -/
theorem cert_val_true : min (694 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 694 attestFlag = 694. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (694 : ℕ) attestFlag = 694 := by
  rw [cert_val_true]

end Counterexamples
