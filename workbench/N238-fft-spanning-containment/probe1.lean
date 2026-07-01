import Phys.Algebra.TowerGatherFFTPeirceReduction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-! ## 7-summand: range crossEmb has no proper nonzero adEnd-invariant subspace. -/

theorem crossEmb_range_no_proper_invariant
    (W : Submodule ℚ (Module.End ℚ ImO)) (hWle : W ≤ LinearMap.range crossEmb)
    (hWinv : ∀ (D : derivationLieQ) (X : Module.End ℚ ImO), X ∈ W → adEnd D X ∈ W)
    (hd0 : 0 < Module.finrank ℚ W) (hd7 : Module.finrank ℚ W < 7) : False := by
  set Wtil : Submodule ℚ ImO := Submodule.comap crossEmb W with hWtil
  set WO : Submodule ℚ (O ℚ) := Wtil.map ImO.subtype with hWO
  have hmapWtil : Submodule.map crossEmb Wtil = W := by
    rw [hWtil, Submodule.map_comap_eq, inf_eq_right.mpr hWle]
  have hf1 : Module.finrank ℚ WO = Module.finrank ℚ Wtil := by
    rw [hWO]
    exact (Submodule.equivMapOfInjective ImO.subtype ImO.injective_subtype Wtil).finrank_eq.symm
  have hf2 : Module.finrank ℚ Wtil = Module.finrank ℚ W := by
    rw [← hmapWtil]
    exact (Submodule.equivMapOfInjective crossEmb crossEmb_injective Wtil).finrank_eq
  have hfWO : Module.finrank ℚ WO = Module.finrank ℚ W := hf1.trans hf2
  have hWOle : WO ≤ ImO := by
    rw [hWO]; rintro _ ⟨x, _, rfl⟩; exact x.2
  have hWOinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ WO → (D : Module.End ℚ (O ℚ)) x ∈ WO := by
    intro D x hx
    rw [hWO, Submodule.mem_map] at hx ⊢
    obtain ⟨a, haW, rfl⟩ := hx
    refine ⟨⟨(D : Module.End ℚ (O ℚ)) (a : O ℚ), derivLieQ_mapsTo D (a:O ℚ) a.2⟩, ?_, rfl⟩
    rw [hWtil, Submodule.mem_comap] at haW ⊢
    have hEq : crossEmb ⟨(D : Module.End ℚ (O ℚ)) (a : O ℚ), derivLieQ_mapsTo D (a:O ℚ) a.2⟩
        = adEnd D (crossEmb a) := by
      rw [adEnd_apply]
      show crossOp ((D : Module.End ℚ (O ℚ)) (a : O ℚ)) = ⁅imRep D, crossOp (a : O ℚ)⁆
      exact (crossOp_imRep_intertwine D (a : O ℚ)).symm
    rw [hEq]
    exact hWinv D (crossEmb a) haW
  exact no_proper_invariant_ImO WO hWOle hWOinv (by rw [hfWO]; exact hd0) (by rw [hfWO]; exact hd7)

end
end Phys.Algebra
