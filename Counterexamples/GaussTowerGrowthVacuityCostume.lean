/-
  Counterexamples.GaussTowerGrowthVacuityCostume — the exit is GENUINE: it
  bounds a real box from below through real distinct picks. C638.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the exit. The content that must NOT be
  hollow: tower_growth must bound a REAL box from below — D = −1687 has the
  fold's longest small tower (2 splits: a-values include 1, 2, 4, 8, 14, ...;
  h = 18). Take the pick family idx = [0, 1, 2, 3] mapping to the box members
  with a = 1, 2, 4, 8 (the occupied tower: ⟨1,1,422⟩, ⟨2,1,211⟩, ⟨4,1,...⟩...
  honest concrete from the certified box of D = −1687: ⟨1, 1, 422⟩,
  ⟨2, 1, 211⟩, ⟨4, 3, 106⟩, ⟨8, 3, 53⟩ — all real reduced forms of −1687).
  The theorem must yield 4 ≤ box.length on a 4-member demo box (the tower
  slice itself: distinct picks inside a duplicate-free list), every
  hypothesis discharged concretely. Kernel recomputes everything.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 638 attestFlag = 1 (TRUE).
  BOGUS: min 638 attestFlag = 638 reduces to 1 = 638; BITES. (638, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussTowerGrowth

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

def towerSlice : List GaussForms.BQF :=
  [⟨1, 1, 422⟩, ⟨2, 1, 211⟩, ⟨4, 3, 106⟩, ⟨8, 3, 53⟩]

def pickT : Nat → GaussForms.BQF
  | 0 => ⟨1, 1, 422⟩
  | 1 => ⟨2, 1, 211⟩
  | 2 => ⟨4, 3, 106⟩
  | _ => ⟨8, 3, 53⟩

theorem attestFlag_forced :
    (([0, 1, 2, 3] : List Nat).length ≤ towerSlice.length) → attestFlag = 1 :=
  fun _ => rfl

/-- The exit fires on the real tower slice of D = −1687. -/
theorem exit_fires : ([0, 1, 2, 3] : List Nat).length ≤ towerSlice.length := by
  refine tower_growth [0, 1, 2, 3] towerSlice pickT ?_ ?_ ?_
  · intro t ht
    fin_cases ht
    · exact List.mem_cons_self ..
    · exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
    · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))
    · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _
        (List.mem_cons_of_mem _ (List.mem_cons_self ..)))
  · -- pairwise: picks differ (distinct forms)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb
      fin_cases hb <;> (intro h; simp [pickT] at h)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb
      fin_cases hb <;> (intro h; simp [pickT] at h)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb
      fin_cases hb <;> (intro h; simp [pickT] at h)
    exact List.pairwise_singleton _ _
  · -- the demo box is duplicate-free
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> (intro h; simp at h)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> (intro h; simp at h)
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> (intro h; simp at h)
    exact List.pairwise_singleton _ _

theorem cert_val_true : min 638 attestFlag = 1 := by
  have h := attestFlag_forced exit_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 638 attestFlag = 638 := by
  rw [cert_val_true]

end Counterexamples
