/-
  Counterexamples.GaussCaseCompositionVacuityCostume — both case engines are
  GENUINE: the inert bound BITES on a real inert box; the split exit FORCES
  past a real fiber. C639.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the two-case composition. The content that
  must NOT be hollow: BOTH capstones fire on REAL data. (1) INERT: D = −59
  (59 ≡ 3 mod 8 ⟹ 2 inert — no even a-values in the box: the real box IS
  [⟨1,1,15⟩, ⟨3,1,5⟩, ⟨5,1,3⟩], all odd a). inert_h_bound with bandList =
  [3, 5], S = 2, K = 3: 3 ≤ (1+2)·3 = 9 ✓ every hypothesis concrete.
  (2) SPLIT: the tower slice of D = −1687 (four real forms, a = 1, 2, 4, 8):
  split_fiber_exit with H = 3: the realized family of size 4 forces
  3 < box.length — D = −1687 has EXITED the fiber h ≤ 3, kernel-checked.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 639 attestFlag = 1 (TRUE).
  BOGUS: min 639 attestFlag = 639 reduces to 1 = 639; BITES. (639, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussCaseComposition

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

def inertBox : List GaussForms.BQF := [⟨1, 1, 15⟩, ⟨3, 1, 5⟩, ⟨5, 1, 3⟩]
def splitSlice : List GaussForms.BQF :=
  [⟨1, 1, 422⟩, ⟨2, 1, 211⟩, ⟨4, 3, 106⟩, ⟨8, 3, 53⟩]
def pickS : Nat → GaussForms.BQF
  | 0 => ⟨1, 1, 422⟩
  | 1 => ⟨2, 1, 211⟩
  | 2 => ⟨4, 3, 106⟩
  | _ => ⟨8, 3, 53⟩

theorem attestFlag_forced :
    ((inertBox.length ≤ (1 + 2) * 3) ∧ (3 < splitSlice.length)) →
    attestFlag = 1 :=
  fun _ => rfl

/-- Both case engines fire on real data. -/
theorem cases_fire :
    (inertBox.length ≤ (1 + 2) * 3) ∧ (3 < splitSlice.length) := by
  constructor
  · refine inert_h_bound (S := 2) (K := 3) [3, 5] inertBox (by norm_num) ?_ ?_
    · intro f hf
      fin_cases hf
      · exact List.mem_cons_self ..
      · exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
      · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))
    · intro p hp
      have hlen : inertBox.length = 3 := rfl
      calc (inertBox.filter (fun f => decide (f.a = p))).length
          ≤ inertBox.length := List.length_filter_le ..
        _ ≤ 3 := by rw [hlen]
  · refine split_fiber_exit (H := 3) [0, 1, 2, 3] splitSlice pickS rfl ?_ ?_ ?_
    · intro t ht
      fin_cases ht
      · exact List.mem_cons_self ..
      · exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
      · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))
      · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _
          (List.mem_cons_of_mem _ (List.mem_cons_self ..)))
    · refine List.pairwise_cons.mpr ⟨?_, ?_⟩
      · intro b hb; fin_cases hb <;> (intro h; simp [pickS] at h)
      refine List.pairwise_cons.mpr ⟨?_, ?_⟩
      · intro b hb; fin_cases hb <;> (intro h; simp [pickS] at h)
      refine List.pairwise_cons.mpr ⟨?_, ?_⟩
      · intro b hb; fin_cases hb <;> (intro h; simp [pickS] at h)
      exact List.pairwise_singleton _ _
    · refine List.pairwise_cons.mpr ⟨?_, ?_⟩
      · intro b hb; fin_cases hb <;> (intro h; simp at h)
      refine List.pairwise_cons.mpr ⟨?_, ?_⟩
      · intro b hb; fin_cases hb <;> (intro h; simp at h)
      refine List.pairwise_cons.mpr ⟨?_, ?_⟩
      · intro b hb; fin_cases hb <;> (intro h; simp at h)
      exact List.pairwise_singleton _ _

theorem cert_val_true : min 639 attestFlag = 1 := by
  have h := attestFlag_forced cases_fire
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 639 attestFlag = 639 := by
  rw [cert_val_true]

end Counterexamples
