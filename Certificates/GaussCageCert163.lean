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
    fin_cases hp
    · -- p = 1: filter keeps exactly 1 form(s)
      show (theBox.filter (fun f => decide (f.a = (1 : Z)))).length ≤ 1
      rw [show theBox.filter (fun f => decide (f.a = (1 : Z)))
            = [⟨1, 1, 41⟩] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 2: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (2 : Z)))).length ≤ 1
      rw [show theBox.filter (fun f => decide (f.a = (2 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num
    · -- p = 4: filter keeps exactly 0 form(s)
      show (theBox.filter (fun f => decide (f.a = (4 : Z)))).length ≤ 1
      rw [show theBox.filter (fun f => decide (f.a = (4 : Z)))
            = [] by
        simp only [theBox, List.filter]
        norm_num]
      norm_num

#print axioms cage_cert

end Certificates.CageCert163
