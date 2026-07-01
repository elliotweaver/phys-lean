import Phys.Algebra.TowerGatherSymAntisymDecomp
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.FiniteDimensional.Basic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000

noncomputable section

-- MEASURE 1: trace of identity on ImO = 7
example : LinearMap.trace ℚ ImO 1 = 7 := by
  rw [LinearMap.trace_one, finrank_ImO]; norm_num

-- MEASURE 2: (1 : End) ≠ 0
example : (1 : Module.End ℚ ImO) ≠ 0 := by
  intro h
  have : LinearMap.trace ℚ ImO (1 : Module.End ℚ ImO) = 7 := by
    rw [LinearMap.trace_one, finrank_ImO]; norm_num
  rw [h, map_zero] at this
  norm_num at this

-- MEASURE 3: finrank_span_singleton applies to End ℚ ImO
example (hne : (1 : Module.End ℚ ImO) ≠ 0) :
    Module.finrank ℚ (ℚ ∙ (1 : Module.End ℚ ImO)) = 1 :=
  finrank_span_singleton hne

-- MEASURE 4: trace_lie closes g₂-invariance of ker(trace)
example (D : derivationLieQ) (X : Module.End ℚ ImO) :
    LinearMap.trace ℚ ImO (adEnd D X) = 0 := by
  rw [adEnd_apply]; exact LinearMap.trace_lie _ _

-- MEASURE 5: finrank_sup_add_finrank_inf_eq is available for submodules of End ℚ ImO
example (s t : Submodule ℚ (Module.End ℚ ImO)) :
    Module.finrank ℚ ↑(s ⊔ t) + Module.finrank ℚ ↑(s ⊓ t)
      = Module.finrank ℚ ↑s + Module.finrank ℚ ↑t :=
  Submodule.finrank_sup_add_finrank_inf_eq s t

-- MEASURE 6: the ker(trace) submodule and its membership
example (X : Module.End ℚ ImO) :
    X ∈ LinearMap.ker (LinearMap.trace ℚ ImO) ↔ LinearMap.trace ℚ ImO X = 0 :=
  LinearMap.mem_ker

end
end Phys.Algebra
