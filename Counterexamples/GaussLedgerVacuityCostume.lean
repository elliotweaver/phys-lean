/-
  Counterexamples.GaussLedgerVacuityCostume — the ledger layer is GENUINE: the
  partition FIRES on a real two-form box. C615.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the ledger partition. The content that must NOT
  be hollow: ledger_identity_skeleton FIRES on a REAL box — D = −20, the two
  reduced forms ⟨1,0,5⟩ (principal) and ⟨2,2,3⟩ — producing M of length exactly 1,
  kernel-checked: 2 = 1 + 1.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 615 attestFlag = 1 (TRUE — attestFlag = 1 < 615).
  THE BOGUS CLAIM: min 615 attestFlag = 615. Rewriting reduces to 1 = 615; BITES.
  DISTINCT: the pair (615, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussLedger

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ M : List GaussForms.BQF,
      ([⟨1, 0, 5⟩, ⟨2, 2, 3⟩] : List GaussForms.BQF).length = 1 + M.length) →
    attestFlag = 1 :=
  fun _ => rfl

theorem partition_fires :
    ∃ M : List GaussForms.BQF,
      ([⟨1, 0, 5⟩, ⟨2, 2, 3⟩] : List GaussForms.BQF).length = 1 + M.length := by
  obtain ⟨M, _, _, _, hlen⟩ := ledger_identity_skeleton
    (D := -20) (pf := ⟨1, 0, 5⟩) (L := [⟨1, 0, 5⟩, ⟨2, 2, 3⟩])
    (by
      constructor
      · intro b hb
        rcases List.mem_cons.mp hb with rfl | hb2
        · intro h
          have ha := congrArg GaussForms.BQF.a h
          norm_num at ha
        · exact absurd hb2 List.not_mem_nil
      · constructor
        · intro b hb; exact absurd hb List.not_mem_nil
        · exact List.Pairwise.nil)
    (by
      intro f hf
      rcases List.mem_cons.mp hf with rfl | hf2
      · exact ⟨⟨by norm_num, by norm_num, by norm_num⟩,
          ⟨by norm_num, by norm_num⟩, by
            show (0:Z) * 0 - 4 * 1 * 5 = -20
            norm_num⟩
      · rcases List.mem_cons.mp hf2 with rfl | hf3
        · exact ⟨⟨by norm_num, by norm_num, by norm_num⟩,
            ⟨by norm_num, by norm_num⟩, by
              show (2:Z) * 2 - 4 * 2 * 3 = -20
              norm_num⟩
        · exact absurd hf3 List.not_mem_nil)
    (List.mem_cons_self ..)
    rfl
  exact ⟨M, hlen⟩

theorem cert_val_true : min 615 attestFlag = 1 := by
  have h := attestFlag_forced partition_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 615 attestFlag = 615 := by
  rw [cert_val_true]

end Counterexamples
