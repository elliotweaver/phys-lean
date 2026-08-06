/-
  Counterexamples.GaussGeneratorsVacuityCostume — the generator machinery is GENUINE:
  the factor tree FIRES on a real coprime split. C603.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the factor tree + grouped presentation. The content
  that must NOT be hollow: generator_factorization fires on the REAL list [2, 3]
  (Bézout (−1)·2+1·3=1, both nonzero) with record 2, cofactor 1 — producing an actual
  ProdRel decomposition of the D=−20 form (6, 2, 1).

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 603 attestFlag = 1 (TRUE — attestFlag = 1 < 603).
  THE BOGUS CLAIM: min 603 attestFlag = 603. Rewriting reduces to 1 = 603; BITES.
  DISTINCT: the pair (603, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussGenerators

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation.IntegerArith
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ gs : List GaussForms.BQF,
      ProdRel gs (⟨zListProd [(2:Z), 3], 2, 1⟩ : GaussForms.BQF) ∧
      (∀ g ∈ gs, g.b = 2 ∧ g.a ∈ [(2:Z), 3])) → attestFlag = 1 :=
  fun _ => rfl

theorem tree_fires :
    ∃ gs : List GaussForms.BQF,
      ProdRel gs (⟨zListProd [(2:Z), 3], 2, 1⟩ : GaussForms.BQF) ∧
      (∀ g ∈ gs, g.b = 2 ∧ g.a ∈ [(2:Z), 3]) := by
  apply generator_factorization
  · refine ⟨?_, ?_, trivial⟩
    · intro r hr
      rcases List.mem_cons.mp hr with rfl | h2
      · exact ⟨-1, 1, by show (-1 : Z) * 2 + 1 * 3 = 1; ring⟩
      · exact absurd h2 (List.not_mem_nil)
    · intro r hr
      exact absurd hr (List.not_mem_nil)
  · intro q hq
    rcases List.mem_cons.mp hq with rfl | h2
    · norm_num
    · rcases List.mem_cons.mp h2 with rfl | h3
      · norm_num
      · exact absurd h3 (List.not_mem_nil)

theorem cert_val_true : min 603 attestFlag = 1 := by
  have h := attestFlag_forced tree_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 603 attestFlag = 603 := by
  rw [cert_val_true]

end Counterexamples
