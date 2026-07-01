import Phys.Algebra.TowerGatherFFTPeirceReduction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-! ## 1-summand (trivial line): pure dimension. -/

theorem trivialLine_no_proper_invariant
    (W : Submodule ℚ (Module.End ℚ ImO)) (hWle : W ≤ trivialLine)
    (hd0 : 0 < Module.finrank ℚ W) (hd1 : Module.finrank ℚ W < 1) : False := by
  omega

/-! ## 14-summand (adjoint): Lie-ideal correspondence + banked simple order. -/

theorem imRepL_range_no_proper_invariant
    (W : Submodule ℚ (Module.End ℚ ImO)) (hWle : W ≤ LinearMap.range imRepL)
    (hWinv : ∀ (D : derivationLieQ) (X : Module.End ℚ ImO), X ∈ W → adEnd D X ∈ W)
    (hd0 : 0 < Module.finrank ℚ W) (hd14 : Module.finrank ℚ W < 14) : False := by
  set U : Submodule ℚ derivationLieQ := Submodule.comap imRepL W with hUdef
  have hmapU : Submodule.map imRepL U = W := by
    rw [hUdef, Submodule.map_comap_eq, inf_eq_right.mpr hWle]
  have hfU : Module.finrank ℚ U = Module.finrank ℚ W := by
    rw [← hmapU]
    exact (Submodule.equivMapOfInjective imRepL imRep_injective U).finrank_eq
  have hUlie : ∀ (D : derivationLieQ) (D' : derivationLieQ), D' ∈ U → ⁅D, D'⁆ ∈ U := by
    intro D D' hD'
    rw [hUdef, Submodule.mem_comap] at hD' ⊢
    have hEq : imRepL ⁅D, D'⁆ = adEnd D (imRepL D') := by
      rw [adEnd_apply]
      exact LieHom.map_lie imRep D D'
    rw [hEq]
    exact hWinv D (imRepL D') hD'
  let I : LieIdeal ℚ derivationLieQ :=
    { U with lie_mem := fun {x m} h => hUlie x m h }
  have hImem : ∀ x, x ∈ I ↔ x ∈ U := fun _ => Iff.rfl
  have hIbot : (I : LieIdeal ℚ derivationLieQ) ≠ ⊥ := by
    intro h
    have hU0 : U = ⊥ := by
      apply le_bot_iff.mp
      intro x hx
      have : x ∈ I := (hImem x).mpr hx
      rw [h, LieSubmodule.mem_bot] at this
      simpa using this
    rw [hU0, finrank_bot] at hfU
    omega
  have hItop : (I : LieIdeal ℚ derivationLieQ) ≠ ⊤ := by
    intro h
    have hUtop : U = ⊤ := by
      apply top_le_iff.mp
      intro x _
      have hxI : x ∈ I := by rw [h]; exact LieSubmodule.mem_top x
      exact (hImem x).mp hxI
    rw [hUtop] at hfU
    have h14 : Module.finrank ℚ (⊤ : Submodule ℚ derivationLieQ) = 14 := by
      rw [finrank_top]
      exact finrank_derivationQ_eq_14
    rw [h14] at hfU
    omega
  exact (derivationLieQ_isSimpleOrder.2 I).elim hIbot hItop

end
end Phys.Algebra
