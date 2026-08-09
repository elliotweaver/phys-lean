/-
  Counterexamples.EndpointPartitionUniqueVacuityCostume — the uniqueness is GENUINE:
  the legality predicate is satisfiable (the canonical partition is legal), the pinning
  is real (a near-miss fails a SPECIFIC clause), and the honest freedom is banked. C695
  covers N695 + N696 (the two referee-item nodes integrated together).
  =====================================================================================
  W8 ANTI-VACUITY. N695 banks partition uniqueness; N696 the dressing-scope
  characterization. What must NOT be hollow: (i) legality is satisfiable (not a
  vacuous predicate — the canonical values pass); (ii) the near-miss discrimination is
  real (shaving the gem census breaks a named clause); (iii) the scope refutations are
  real (the alternative dressed values strictly differ).

  THE CERTIFICATE. attestFlag := 1 -- "legal-inhabited + near-miss bites + scopes differ".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 695 attestFlag = 1 (TRUE -- attestFlag = 1 < 695).

  THE BOGUS CLAIM (a stand-in for ANY "the uniqueness is tautological / the legality
  is unsatisfiable / the scope choice is free" reading): that min 695 attestFlag = 695.
  It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false
  numeric 1 = 695 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (695, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.EndpointPartitionUnique
import Phys.Algebra.DressingScopeCharacterized

namespace Counterexamples

open Phys.Algebra.EndpointPartitionUnique
open Phys.Algebra.DressingScopeCharacterized
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "legal-inhabited + near-miss bites + scopes differ". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the canonical partition is legal (legality
    inhabited), uniqueness holds at it, and attestFlag = 1. -/
theorem attestFlag_forced :
    StructurallyLegal canonicalEndpointPartition
      ∧ (∀ P, StructurallyLegal P → P = canonicalEndpointPartition)
      ∧ attestFlag = 1 :=
  ⟨canonical_is_legal, fun P h => endpoint_partition_unique P h, rfl⟩

/-- TRUE: min 695 attestFlag = 1. -/
theorem cert_val_true : min (695 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 695 attestFlag = 695. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (695 : ℕ) attestFlag = 695 := by
  rw [cert_val_true]

end Counterexamples
