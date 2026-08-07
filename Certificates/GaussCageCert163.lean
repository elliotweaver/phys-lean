/-
  Certificates.GaussCageCert163 — THE CAGE INSTANTIATION at D = -163:
  the REAL box (1 reduced forms) through the REAL cage
  (2-tower [1, 2, 4] ++ deep [] ++ band []), K = 1:
  h = 1 ≤ 3·1. deferring_h_bound fired END-TO-END on real
  numbers; every membership/filter by explicit route. AUTO-GENERATED.
-/
import Phys.Algebra.GaussSignatureBound

set_option maxRecDepth 8192
set_option maxHeartbeats 1600000

namespace Certificates.CageCert163
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def theBox : List GaussForms.BQF := [⟨1, 1, 41⟩]

def twoTower : List Z := [1, 2, 4]
def bandDeep : List Z := []

/-- h(-163) = 1 ≤ (3 + 0)·1: the H-bound on real numbers. -/
theorem cage_cert : theBox.length ≤ (3 + 0) * 1 := by
  refine deferring_h_bound (T₂ := 3) (B := 0) (K := 1)
    twoTower bandDeep theBox (by norm_num [twoTower]) (by norm_num [bandDeep]) ?_ ?_
  · intro f hf
    fin_cases hf
    · show (1 : Z) ∈ twoTower ++ bandDeep
      exact List.mem_cons_self ..
  · intro p hp
    have hlen : theBox.length = 1 := rfl
    calc (theBox.filter (fun f => decide (f.a = p))).length
        ≤ theBox.length := List.length_filter_le ..
      _ ≤ 1 := by rw [hlen]

#print axioms cage_cert

end Certificates.CageCert163
