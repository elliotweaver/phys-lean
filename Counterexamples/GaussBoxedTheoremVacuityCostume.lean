/-
  Counterexamples.GaussBoxedTheoremVacuityCostume — the capstone is GENUINE:
  both jaws fire on ONE real box and the squeeze BITES. C642.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the boxed confinement. The content that
  must NOT be hollow: boxed_confinement must fire BOTH jaws on ONE real box —
  the tower slice of D = −1687 (four real reduced forms, a ∈ {1, 2, 4, 8},
  the C638 stack): caged by twoTower = [1, 2, 4, 8] (T₂ = 4, B = 0, K = 1 —
  each a-value once in the slice) AND carrying the realized 4-family (H = 3).
  Conclusion: 4 ≤ 4·1 ∧ 3 < 4 — both exact at the boundary (the slice
  saturates its cage: the squeeze gives 3 < 4, tight). Every hypothesis
  discharged concretely; the kernel recomputes both jaws.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 642 attestFlag = 1 (TRUE).
  BOGUS: min 642 attestFlag = 642 reduces to 1 = 642; BITES. (642, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussBoxedTheorem

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

def slice42 : List GaussForms.BQF :=
  [⟨1, 1, 422⟩, ⟨2, 1, 211⟩, ⟨4, 3, 106⟩, ⟨8, 3, 53⟩]

def pick42 : Nat → GaussForms.BQF
  | 0 => ⟨1, 1, 422⟩
  | 1 => ⟨2, 1, 211⟩
  | 2 => ⟨4, 3, 106⟩
  | _ => ⟨8, 3, 53⟩

theorem attestFlag_forced :
    ((slice42.length ≤ (4 + 0) * 1) ∧ (3 < slice42.length)) → attestFlag = 1 :=
  fun _ => rfl

/-- Both jaws fire on the real tower slice of D = −1687 — the squeeze
    is TIGHT at the boundary (4 ≤ 4 ∧ 3 < 4). -/
theorem capstone_fires :
    (slice42.length ≤ (4 + 0) * 1) ∧ (3 < slice42.length) := by
  refine boxed_confinement (T₂ := 4) (B := 0) (K := 1) (H := 3)
    [1, 2, 4, 8] [] slice42 [0, 1, 2, 3] pick42
    (by norm_num) (by norm_num) ?_ ?_ rfl ?_ ?_ ?_
  · intro f hf
    fin_cases hf
    · show (1 : Z) ∈ [1, 2, 4, 8] ++ []
      exact List.mem_cons_self ..
    · show (2 : Z) ∈ [1, 2, 4, 8] ++ []
      exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
    · show (4 : Z) ∈ [1, 2, 4, 8] ++ []
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))
    · show (8 : Z) ∈ [1, 2, 4, 8] ++ []
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _
        (List.mem_cons_of_mem _ (List.mem_cons_self ..)))
  · intro p hp
    -- per-p filter: each a-value appears exactly once in the slice
    have h1 : (slice42.filter (fun f => decide (f.a = (1:Z)))).length = 1 := by
      simp only [slice42, List.filter]; norm_num
    have h2 : (slice42.filter (fun f => decide (f.a = (2:Z)))).length = 1 := by
      simp only [slice42, List.filter]; norm_num
    have h4 : (slice42.filter (fun f => decide (f.a = (4:Z)))).length = 1 := by
      simp only [slice42, List.filter]; norm_num
    have h8 : (slice42.filter (fun f => decide (f.a = (8:Z)))).length = 1 := by
      simp only [slice42, List.filter]; norm_num
    fin_cases hp
    · rw [h1]
    · rw [h2]
    · rw [h4]
    · rw [h8]
  · intro t ht
    fin_cases ht
    · exact List.mem_cons_self ..
    · exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
    · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))
    · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _
        (List.mem_cons_of_mem _ (List.mem_cons_self ..)))
  · refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> (intro h; simp [pick42] at h)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> (intro h; simp [pick42] at h)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> (intro h; simp [pick42] at h)
    exact List.pairwise_singleton _ _
  · refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> (intro h; simp at h)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> (intro h; simp at h)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> (intro h; simp at h)
    exact List.pairwise_singleton _ _

theorem cert_val_true : min 642 attestFlag = 1 := by
  have h := attestFlag_forced capstone_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 642 attestFlag = 642 := by
  rw [cert_val_true]

end Counterexamples
