/-
  N239 probe3c — MEASURE a diamond-free K-module: use K.val (subalgebra→End ring hom) with
  Module.compHom, avoiding algebraMap K End (which timed out in probe3b).
-/
import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.RingTheory.Adjoin.Field
import Mathlib.Algebra.Module.LinearMap.End

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000
set_option maxHeartbeats 800000

noncomputable section

example (X : Module.End ℚ ImO)
    (hdom : IsDomain (Algebra.adjoin ℚ ({X} : Set (Module.End ℚ ImO)))) :
    Module.finrank ℚ (Algebra.adjoin ℚ ({X} : Set (Module.End ℚ ImO))) ∣ 7 := by
  set K := Algebra.adjoin ℚ ({X} : Set (Module.End ℚ ImO)) with hKdef
  haveI : IsDomain K := hdom
  letI : Field K := fieldOfFiniteDimensional ℚ K
  -- ImO as End-module (applyModule) restricted to K via the ring-hom inclusion K.val
  letI : Module K ImO := Module.compHom ImO (K.val : K →+* Module.End ℚ ImO)
  haveI : IsScalarTower ℚ K ImO := by
    refine ⟨fun c k v => ?_⟩
    show ((c • k).val) v = c • ((k.val) v)
    rw [Subalgebra.coe_smul]
    exact (LinearMap.smul_apply c k.val v)
  have htower := Module.finrank_mul_finrank ℚ K ImO
  rw [finrank_ImO] at htower
  exact ⟨Module.finrank K ImO, htower.symm⟩

end

end Phys.Algebra
