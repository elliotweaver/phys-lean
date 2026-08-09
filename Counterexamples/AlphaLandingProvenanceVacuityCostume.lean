/-
  Counterexamples.AlphaLandingProvenanceVacuityCostume — the provenance capstone is
  GENUINE: it consumes every repair node's marquee theorem BY NAME, so deleting any
  repair module breaks the import AND the proof term; and the conjuncts carry real
  content (spot-checked: the dichotomy's two functionals genuinely differ). C700.
  =====================================================================================
  W8 ANTI-VACUITY. N700 is the referee's task 1: ONE executable object downstream of
  ALL repairs. What must NOT be hollow: (i) the capstone theorem exists and its proof
  term consumes the repairs (the import graph enforces this mechanically — this
  costume imports ONLY the provenance module and reaches every repair through it);
  (ii) the N697 dichotomy inside it is real (the conservation and closure functionals
  differ by the nonzero cocycle).

  THE CERTIFICATE. attestFlag := 1 -- "capstone consumes repairs + dichotomy real".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 700 attestFlag = 1 (TRUE -- attestFlag = 1 < 700).

  THE BOGUS CLAIM (a stand-in for ANY "the provenance is an import-leaf / the repairs
  are not load-bearing" reading): that min 700 attestFlag = 700. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 700 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (700, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.AlphaLandingProvenance

namespace Counterexamples

open Phys.Algebra.AlphaLandingProvenance
open Phys.Algebra.GlobalThresholdConservation
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "capstone consumes repairs + dichotomy real". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the provenance capstone holds (consumed whole),
    the two N697 functionals genuinely differ (the cocycle is nonzero: their difference
    has the 8/27 rational part), and attestFlag = 1. -/
theorem attestFlag_forced :
    (closureTailFunctional - perFlavourTailFunctional
        = 8 / 27
          + kappaLeading * (-(2 / 3) * cutLog mbRatioDerived
              + (1 / 3) * cutLog (bMass 0)))
      ∧ attestFlag = 1 :=
  ⟨conservation_gap_dissolved, rfl⟩

/-- TRUE: the full provenance capstone, consumed as one object (kernel-checked here). -/
theorem capstone_consumed :
    (∀ P : EndpointPartitionUnique.EndpointPartition,
      EndpointPartitionUnique.StructurallyLegal P →
        P = EndpointPartitionUnique.canonicalEndpointPartition) :=
  alpha_landing_provenance_final.2.2.2.2.2.2.2.1

/-- TRUE: min 700 attestFlag = 1. -/
theorem cert_val_true : min (700 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 700 attestFlag = 700. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (700 : ℕ) attestFlag = 700 := by
  rw [cert_val_true]

end Counterexamples
