/-
  N239 probe3b — MEASURE the field-tower diamond risk for abs-irred (End_{g₂}(ImO)=ℚ).
  Uses Module.End.applyModule : Module (Module.End ℚ ImO) ImO, restrict scalars to K = ℚ[X].
  Sorry for domain-ness; goal is to measure whether the tower + restrictScalars elaborate.
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

noncomputable section

/-- MEASURE: with `K := adjoin ℚ {X}` a field acting on ImO by restriction of the apply-action,
    the field tower gives `dim_ℚ K ∣ 7`. -/
example (X : Module.End ℚ ImO)
    (hdom : IsDomain (Algebra.adjoin ℚ ({X} : Set (Module.End ℚ ImO)))) :
    Module.finrank ℚ (Algebra.adjoin ℚ ({X} : Set (Module.End ℚ ImO))) ∣ 7 := by
  set K := Algebra.adjoin ℚ ({X} : Set (Module.End ℚ ImO)) with hKdef
  haveI : IsDomain K := hdom
  letI : Field K := fieldOfFiniteDimensional ℚ K
  -- ImO is a Module (End ℚ ImO) via applyModule; restrict scalars to K.
  letI : Module K ImO := Module.compHom ImO (algebraMap K (Module.End ℚ ImO))
  haveI : IsScalarTower ℚ K ImO := by
    refine ⟨fun c k v => ?_⟩
    sorry
  have htower := Module.finrank_mul_finrank ℚ K ImO
  rw [finrank_ImO] at htower
  exact ⟨Module.finrank K ImO, htower.symm⟩

end

end Phys.Algebra
