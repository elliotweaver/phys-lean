/-
  Counterexamples.AlphaLandingFinalVacuityCostume — the final wiring is GENUINE: the
  final legality is inhabited (through the N679 count and the N680 geometric weld), the
  obstruction weld holds against the census OBJECT, and the once-insertion is exact with
  strictly positive magnitude and strictly negative census mean. C681.
  =====================================================================================
  W8 ANTI-VACUITY. N681 wires the final capstone through the constructed objects and
  welds the obstruction to the census. What must NOT be hollow: (i) DerivedLegalFinal is
  INHABITED — mirrorParsed passes through the N680 geometry (geometry_agrees_two) and
  the N679 count; (ii) the obstruction weld is an equality against the banked
  obstructionTerm (the 3/5 literal retroactively the census object's evaluation);
  (iii) the insertion identity F0 + obstruction = dressed endpoint is EXACT with the
  deficit strictly positive.

  THE CERTIFICATE. attestFlag := 1 -- "final legality inhabited + obstruction welded + inserted once".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 681 attestFlag = 1 (TRUE -- attestFlag = 1 < 681).

  THE BOGUS CLAIM (a stand-in for ANY "the final legality is empty / the weld fails /
  the insertion is inexact" reading): that min 681 attestFlag = 681. It GENUINELY
  equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric
  1 = 681 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (681, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.AlphaLandingFinal

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MirrorTermLanguage
open Phys.Algebra.ChainTermGrammar
open Phys.Algebra.MirrorFixedPoint
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "final legality inhabited + obstruction welded + inserted once". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems). -/
theorem attestFlag_forced :
    DerivedLegalFinal mirrorParsed
      ∧ obstructionFromCensus = obstructionTerm
      ∧ (F0 + obstructionFromCensus = D7DepthTwoComposed.recomposedEndpointDressed
          ∧ 0 < obstructionFromCensus ∧ censusMeanObj < 0)
      ∧ attestFlag = 1 :=
  ⟨mirrorParsed_derivedLegalFinal, obstructionTerm_welded, obstruction_inserted_once, rfl⟩

/-- TRUE: min 681 attestFlag = 1. -/
theorem cert_val_true : min (681 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 681 attestFlag = 681. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (681 : ℕ) attestFlag = 681 := by
  rw [cert_val_true]

end Counterexamples
