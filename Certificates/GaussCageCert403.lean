/-
  Certificates.GaussCageCert403 — THE CAGE INSTANTIATION at D = -403:
  the REAL box (3 reduced forms) through the REAL cage
  (2-tower [1, 2, 4, 8] ++ deep [] ++ band [11]), K = 2:
  h = 3 ≤ 5·2. deferring_h_bound fired END-TO-END on real
  numbers; every membership/filter by explicit route. AUTO-GENERATED.
-/
import Phys.Algebra.GaussSignatureBound

set_option maxRecDepth 8192
set_option maxHeartbeats 1600000

namespace Certificates.CageCert403
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def theBox : List GaussForms.BQF := [⟨1, 1, 101⟩, ⟨11, -9, 11⟩, ⟨11, 9, 11⟩]

def twoTower : List Z := [1, 2, 4, 8]
def bandDeep : List Z := [11]

/-- h(-403) = 3 ≤ (4 + 1)·2: the H-bound on real numbers. -/
theorem cage_cert : theBox.length ≤ (4 + 1) * 3 := by
  refine deferring_h_bound (T₂ := 4) (B := 1) (K := 3)
    twoTower bandDeep theBox (by norm_num [twoTower]) (by norm_num [bandDeep]) ?_ ?_
  · intro f hf
    fin_cases hf
    · show (1 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_self ..
    · show (11 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))
    · show (11 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_self ..))))
  · intro p hp
    have hlen : theBox.length = 3 := rfl
    calc (theBox.filter (fun f => decide (f.a = p))).length
        ≤ theBox.length := List.length_filter_le ..
      _ ≤ 3 := by rw [hlen]

#print axioms cage_cert

end Certificates.CageCert403
