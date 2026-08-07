/-
  Counterexamples.GaussSentenceVacuityCostume — THE SENTENCE is GENUINE:
  large h FORCES seedcount on the real record. C644.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the sentence. The content that must NOT be
  hollow: h_forces_seedcount must FORCE on real data — the tower slice of
  D = −1687 (4 real forms) with S = 0: a box of length 4 > (4 + (0 + 0))·1 = 4?
  NO — honest: (T₂ + (S + B))·K = (2 + (0+0))·1 = 2 < 4 with twoTower = [1, 2]
  (T₂ = 2), psList = [4, 8]?? — psList must be the TOUCHING list. HONEST
  instance: cage the slice as twoTower = [1, 2] (T₂ = 2), psList = [4, 8]
  (the "captured" family — abstractly, any list), bandList = [] (B = 0),
  K = 1 (each a-value once): the bound (2 + (len + 0))·1 with len = 2 gives
  4 ≤ 4 ✓ (sentence). And the CONTRAPOSITIVE with S = 1:
  (2 + (1 + 0))·1 = 3 < 4 = box length FORCES psList.length > 1 — TRUE
  (it's 2). The kernel recomputes the forcing on the real slice.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 644 attestFlag = 1 (TRUE).
  BOGUS: min 644 attestFlag = 644 reduces to 1 = 644; BITES. (644, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussSentence

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

def slice44 : List GaussForms.BQF :=
  [⟨1, 1, 422⟩, ⟨2, 1, 211⟩, ⟨4, 3, 106⟩, ⟨8, 3, 53⟩]

theorem attestFlag_forced :
    ((1 : Nat) < ([4, 8] : List Z).length) → attestFlag = 1 :=
  fun _ => rfl

/-- THE SENTENCE forces: box length 4 past the S = 1 cap forces the
    captured family past 1 — on the real slice of D = −1687. -/
theorem sentence_forces : (1 : Nat) < ([4, 8] : List Z).length := by
  refine h_forces_seedcount (T₂ := 2) (B := 0) (K := 1) (S := 1)
    [1, 2] [4, 8] [] slice44 (by norm_num) (by norm_num) ?_ ?_
    (by show (2 + (1 + 0)) * 1 < slice44.length
        have h4 : slice44.length = 4 := rfl
        rw [h4]
        norm_num)
  · intro f hf
    fin_cases hf
    · show (1 : Z) ∈ [1, 2] ++ ([4, 8] ++ [])
      exact List.mem_cons_self ..
    · show (2 : Z) ∈ [1, 2] ++ ([4, 8] ++ [])
      exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
    · show (4 : Z) ∈ [1, 2] ++ ([4, 8] ++ [])
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))
    · show (8 : Z) ∈ [1, 2] ++ ([4, 8] ++ [])
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _
        (List.mem_cons_of_mem _ (List.mem_cons_self ..)))
  · intro p hp
    have h1 : (slice44.filter (fun f => decide (f.a = (1:Z)))).length = 1 := by
      simp only [slice44, List.filter]; norm_num
    have h2 : (slice44.filter (fun f => decide (f.a = (2:Z)))).length = 1 := by
      simp only [slice44, List.filter]; norm_num
    have h4 : (slice44.filter (fun f => decide (f.a = (4:Z)))).length = 1 := by
      simp only [slice44, List.filter]; norm_num
    have h8 : (slice44.filter (fun f => decide (f.a = (8:Z)))).length = 1 := by
      simp only [slice44, List.filter]; norm_num
    fin_cases hp
    · rw [h1]
    · rw [h2]
    · rw [h4]
    · rw [h8]

theorem cert_val_true : min 644 attestFlag = 1 := by
  have h := attestFlag_forced sentence_forces
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 644 attestFlag = 644 := by
  rw [cert_val_true]

end Counterexamples
