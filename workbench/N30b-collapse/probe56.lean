import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
-- PROBE: dimension relationships + N=⊥/⊤ ↔ W=⊥/ImO.
example (I : LieIdeal ℚ derivationLieQ)
    (N : Submodule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO)
    (hNbot : N ≠ ⊥) (hNtop : N ≠ ⊤) :
    0 < Module.finrank ℚ ((N.restrictScalars ℚ).map ImO.subtype) ∧
    Module.finrank ℚ ((N.restrictScalars ℚ).map ImO.subtype) < 7 := by
  set Nq : Submodule ℚ ImO := N.restrictScalars ℚ with hNqdef
  set W : Submodule ℚ (O ℚ) := Nq.map ImO.subtype with hWdef
  -- dim W = dim Nq (subtype injective)
  have hWNq : Module.finrank ℚ W = Module.finrank ℚ Nq :=
    (Submodule.equivMapOfInjective ImO.subtype Subtype.val_injective Nq).finrank_eq.symm
  -- Nq ≠ ⊥ and Nq ≠ ⊤ (restrictScalars reflects ⊥/⊤)
  have hNqbot : Nq ≠ ⊥ := by
    rw [hNqdef]; intro h
    apply hNbot
    rwa [Submodule.restrictScalars_eq_bot_iff] at h
  have hNqtop : Nq ≠ ⊤ := by
    rw [hNqdef]; intro h
    apply hNtop
    rwa [Submodule.restrictScalars_eq_top_iff] at h
  constructor
  · rw [hWNq]
    have := (Submodule.one_le_finrank_iff (S := Nq)).mpr hNqbot
    omega
  · rw [hWNq]
    have hlt := Submodule.finrank_lt (s := Nq) hNqtop
    rwa [finrank_ImO] at hlt

end
end Phys.Algebra
