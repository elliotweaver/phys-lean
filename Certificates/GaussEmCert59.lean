/-
  Certificates.GaussEmCert59 — E_m instantiation at D = -59:
  window [0, 6), every position tagged by its REAL factorization,
  em_skeleton fired end-to-end: 6 <= 1 + 2*2*(6/3+1) = 13.
  Channels: 1 prime/allotment, 5 seeded into ps = [3, 5]
  (root classes {3: (0, 2), 5: (4, 0)}). AUTO-GENERATED.
-/
import Phys.Algebra.GaussEmSkeleton

namespace Certificates.EmCert59
open Phys.Foundation.GaussForms.BQF

theorem cert : ([0, 1, 2, 3, 4, 5] : List Nat).length ≤
    1 + (3 - 1) * (2 * (6 / 3 + 1)) := by
  refine em_skeleton (W := 6) (B := 1) (m := 3)
    [0, 1, 2, 3, 4, 5]
    (fun x => if x = 0 then (1 : Fin 3) else if x = 1 then (0 : Fin 3) else if x = 2 then (1 : Fin 3) else if x = 3 then (1 : Fin 3) else if x = 4 then (1 : Fin 3) else (1 : Fin 3))
    [3, 5]
    (fun x => if x = 0 then 3 else if x = 1 then 3 else if x = 2 then 3 else if x = 3 then 3 else if x = 4 then 5 else 3)
    (fun p => if p = 3 then 0 else 4)
    (fun p => if p = 3 then 2 else 0) ?_ ?_ ?_ ?_ ?_ ?_
  · -- pairwise distinct
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    exact List.pairwise_singleton _ _
  · intro x hx htag
    fin_cases hx
    · exact ⟨by norm_num, by decide, by decide⟩
    · exact absurd htag (by decide)
    · exact ⟨by norm_num, by decide, by decide⟩
    · exact ⟨by norm_num, by decide, by decide⟩
    · exact ⟨by norm_num, by decide, by decide⟩
    · exact ⟨by norm_num, by decide, by decide⟩
  · intro p hp
    fin_cases hp <;> exact ⟨by norm_num, by decide, by decide⟩
  · decide
  · norm_num
  · intro p hp
    fin_cases hp <;> norm_num

#print axioms cert

end Certificates.EmCert59
