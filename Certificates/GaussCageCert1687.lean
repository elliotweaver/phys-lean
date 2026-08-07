/-
  Certificates.GaussCageCert1687 — THE CAGE INSTANTIATION at D = -1687:
  the REAL box (18 reduced forms) through the REAL cage
  (2-tower [1, 2, 4, 8, 16] ++ deep [7, 13, 17, 19] ++ band []), K = 2:
  h = 18 ≤ 10·2. deferring_h_bound fired END-TO-END on real
  numbers; every membership/filter by explicit route. AUTO-GENERATED.
-/
import Phys.Algebra.GaussSignatureBound

set_option maxRecDepth 8192
set_option maxHeartbeats 1600000

namespace Certificates.CageCert1687
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def theBox : List GaussForms.BQF := [⟨1, 1, 422⟩, ⟨2, -1, 211⟩, ⟨2, 1, 211⟩, ⟨4, -3, 106⟩, ⟨4, 3, 106⟩, ⟨7, 7, 62⟩, ⟨8, -3, 53⟩, ⟨8, 3, 53⟩, ⟨13, -9, 34⟩, ⟨13, 9, 34⟩, ⟨14, -7, 31⟩, ⟨14, 7, 31⟩, ⟨16, -13, 29⟩, ⟨16, 13, 29⟩, ⟨17, -9, 26⟩, ⟨17, 9, 26⟩, ⟨19, -17, 26⟩, ⟨19, 17, 26⟩]

def twoTower : List Z := [1, 2, 4, 8, 16]
def bandDeep : List Z := [7, 14, 13, 17, 19]

/-- h(-1687) = 18 ≤ (5 + 5)·2: the H-bound on real numbers. -/
theorem cage_cert : theBox.length ≤ (5 + 5) * 18 := by
  refine deferring_h_bound (T₂ := 5) (B := 5) (K := 18)
    twoTower bandDeep theBox (by norm_num [twoTower]) (by norm_num [bandDeep]) ?_ ?_
  · intro f hf
    fin_cases hf
    · show (1 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_self ..
    · show (2 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
    · show (2 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
    · show (4 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))
    · show (4 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))
    · show (7 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))))
    · show (8 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))
    · show (8 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))
    · show (13 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))))))
    · show (13 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))))))
    · show (14 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))))
    · show (14 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))))
    · show (16 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))
    · show (16 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))
    · show (17 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))))))
    · show (17 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))))))
    · show (19 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))))))))
    · show (19 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..)))))))))
  · intro p hp
    have hlen : theBox.length = 18 := rfl
    calc (theBox.filter (fun f => decide (f.a = p))).length
        ≤ theBox.length := List.length_filter_le ..
      _ ≤ 18 := by rw [hlen]

#print axioms cage_cert

end Certificates.CageCert1687
