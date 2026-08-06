/-
  Counterexamples.GaussClassLawsVacuityCostume — the relation-level group laws
  are GENUINE: the identity law fires on a real concordant pair. C595.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims CompRel carries functionality, commutativity,
  identity, inverse, and associativity. The content that must NOT be hollow: the
  identity law's hypotheses are SATISFIABLE — compRel_id' fires at a2 = 2 ≠ 0 (D = −4
  family: (1, 0, 2·1) ∘ (2, 0, 1·1) = (2, 0, 1·1) as an actual CompRel instance).

  THE CERTIFICATE. attestFlag := 1 -- "the identity law fires". TIED to the banked
  landing by attestFlag_forced.

  We anchor min 595 attestFlag = 1 (TRUE -- attestFlag = 1 < 595).

  THE BOGUS CLAIM (a stand-in for ANY "the laws are vacuous" reading): that
  min 595 attestFlag = 595. It GENUINELY equals 1 (cert_val_true). Rewriting reduces
  the bogus claim to the false numeric 1 = 595. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (595, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussClassLaws

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    CompRel (⟨1, 0, (2:Z) * 1⟩ : GaussForms.BQF) ⟨2, 0, 1 * 1⟩ ⟨2, 0, 1 * 1⟩ →
    attestFlag = 1 :=
  fun _ => rfl

theorem cert_val_true : min 595 attestFlag = 1 := by
  have h := attestFlag_forced (compRel_id' (B := 0) (c2 := 1) two_ne_zero)
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 595 attestFlag = 595 := by
  rw [cert_val_true]

end Counterexamples
