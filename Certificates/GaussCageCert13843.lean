/-
  Certificates.GaussCageCert13843 — THE CAGE INSTANTIATION at D = -13843:
  the REAL box (11 reduced forms) through the REAL cage
  (2-tower [1, 2, 4, 8, 16, 32, 64] ++ deep [23, 31, 53] ++ band [59, 61, 67]), K = 2:
  h = 11 ≤ 15·2. deferring_h_bound fired END-TO-END on real
  numbers; every membership/filter by explicit route. AUTO-GENERATED.
-/
import Phys.Algebra.GaussSignatureBound

set_option maxRecDepth 8192
set_option maxHeartbeats 1600000

namespace Certificates.CageCert13843
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def theBox : List GaussForms.BQF := [⟨1, 1, 3461⟩, ⟨23, -7, 151⟩, ⟨23, 7, 151⟩, ⟨31, -13, 113⟩, ⟨31, 13, 113⟩, ⟨53, -19, 67⟩, ⟨53, 19, 67⟩, ⟨59, -9, 59⟩, ⟨59, 9, 59⟩, ⟨61, -59, 71⟩, ⟨61, 59, 71⟩]

def twoTower : List Z := [1, 2, 4, 8, 16, 32, 64]
def bandDeep : List Z := [23, 31, 46, 53, 59, 61, 62, 67]

/-- h(-13843) = 11 ≤ (7 + 8)·2: the H-bound on real numbers. -/
theorem cage_cert : theBox.length ≤ (7 + 8) * 2 := by
  refine deferring_h_bound (T₂ := 7) (B := 8) (K := 2)
    twoTower bandDeep theBox (by norm_num [twoTower]) (by norm_num [bandDeep]) ?_ ?_
  · intro f hf
    fin_cases hf
    · show (1 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_self ..
    · show (23 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))))))
    · show (23 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))))))
    · show (31 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))))))
    · show (31 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))))))
    · show (53 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))))))))
    · show (53 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))))))))
    · show (59 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))))))))))
    · show (59 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))))))))))
    · show (61 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))))))))))
    · show (61 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))))))))))
  · intro p hp
    fin_cases hp
    · -- p = 1: filter keeps exactly 1 form(s)
      show (theBox.filter (fun f => decide (f.a = (1 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (1 : Z)))
            = [⟨1, 1, 3461⟩] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 2: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (2 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (2 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 4: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (4 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (4 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 8: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (8 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (8 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 16: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (16 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (16 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 32: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (32 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (32 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 64: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (64 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (64 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 23: filter keeps exactly 2 form(s)
      show (theBox.filter (fun f => decide (f.a = (23 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (23 : Z)))
            = [⟨23, -7, 151⟩, ⟨23, 7, 151⟩] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 31: filter keeps exactly 2 form(s)
      show (theBox.filter (fun f => decide (f.a = (31 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (31 : Z)))
            = [⟨31, -13, 113⟩, ⟨31, 13, 113⟩] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 46: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (46 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (46 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 53: filter keeps exactly 2 form(s)
      show (theBox.filter (fun f => decide (f.a = (53 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (53 : Z)))
            = [⟨53, -19, 67⟩, ⟨53, 19, 67⟩] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 59: filter keeps exactly 2 form(s)
      show (theBox.filter (fun f => decide (f.a = (59 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (59 : Z)))
            = [⟨59, -9, 59⟩, ⟨59, 9, 59⟩] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 61: filter keeps exactly 2 form(s)
      show (theBox.filter (fun f => decide (f.a = (61 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (61 : Z)))
            = [⟨61, -59, 71⟩, ⟨61, 59, 71⟩] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 62: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (62 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (62 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 67: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (67 : Z)))).length ≤ 2
      rw [show theBox.filter (fun f => decide (f.a = (67 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num

#print axioms cage_cert

end Certificates.CageCert13843
