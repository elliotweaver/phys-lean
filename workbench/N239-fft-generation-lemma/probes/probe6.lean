/-
  N239 probe6 — MEASURE the dim_ℚ K = 7 ⟹ dim_K ImO = 1 step (field tower reversed),
  and whether a ℚ-endo commuting with the K-action is K-linear ⟹ K-scalar.
  K = adjoin ℚ {T}, a field acting on ImO by K.val compHom.
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

-- MEASURE: with K a field acting on ImO (compHom via K.val), if dim_ℚ K = 7 then dim_K ImO = 1,
-- and a ℚ-endo f commuting with T (hence with K) is K-scalar, so f = (some k : End) ∈ K.
example (T : Module.End ℚ ImO)
    (hdom : IsDomain (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))))
    (hdim7 : Module.finrank ℚ (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))) = 7)
    (f : Module.End ℚ ImO)
    (hfK : ∀ (k : Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))),
        f * (k : Module.End ℚ ImO) = (k : Module.End ℚ ImO) * f) :
    ∃ k : Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO)), f = (k : Module.End ℚ ImO) := by
  set K := Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO)) with hKdef
  haveI : IsDomain K := hdom
  letI : Field K := fieldOfFiniteDimensional ℚ K
  letI : Module K ImO := Module.compHom ImO (K.val : K →+* Module.End ℚ ImO)
  haveI : IsScalarTower ℚ K ImO := by
    refine ⟨fun c k v => ?_⟩
    show ((c • k).val) v = c • ((k.val) v)
    rw [Subalgebra.coe_smul]
    exact (LinearMap.smul_apply c k.val v)
  -- dim_K ImO = 1
  have htower := Module.finrank_mul_finrank ℚ K ImO
  rw [finrank_ImO, hdim7] at htower  -- 7 * finrank K ImO = 7
  have hdimK1 : Module.finrank K ImO = 1 := by omega
  -- f is K-linear: build f as K →ₗ map
  let fK : ImO →ₗ[K] ImO :=
    { toFun := f
      map_add' := f.map_add
      map_smul' := by
        intro k v
        show f ((k : Module.End ℚ ImO) v) = (k : Module.End ℚ ImO) (f v)
        have := hfK k
        have := LinearMap.congr_fun (hfK k) v
        simpa [Module.End.mul_apply] using this }
  -- K-scalar
  obtain ⟨c, hc⟩ := (fK.existsUnique_eq_smul_id_of_finrank_eq_one hdimK1)
  refine ⟨c, ?_⟩
  -- unfold: fK = c • id as K-linear ⟹ f v = c • v = (c:End) v
  apply LinearMap.ext
  intro v
  have := LinearMap.congr_fun hc.1 v
  simp only [LinearMap.smul_apply, LinearMap.id_coe, id_eq] at this
  -- this : fK v = c • v ; fK v = f v ; c • v = (c:End) v
  show f v = (c : Module.End ℚ ImO) v
  have hfKv : fK v = f v := rfl
  rw [← hfKv, this]
  show (c : K) • v = (c : Module.End ℚ ImO) v
  rfl

end
end Phys.Algebra
