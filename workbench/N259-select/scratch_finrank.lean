import Phys.Algebra.TowerGatherElectroweakReductiveLie

/-! N259 scratch 3 — de-risk finrank(inf)=1, finrank(sup)=12, and W8 teeth. -/

open scoped Classical
noncomputable section

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

set_option synthInstance.maxHeartbeats 400000

-- assume the headline (proved in scratch_full)
axiom shared_cartan :
    chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      = Submodule.span ℚ {imRepL DI}

-- imRepL DI ≠ 0  (imRep injective + DI ≠ 0)
theorem imRepL_DI_ne_zero : imRepL DI ≠ 0 := by
  intro h
  exact DI_ne_zero ((injective_iff_map_eq_zero imRepL).mp imRep_injective DI h)

-- finrank(inf) = 1
theorem finrank_inf :
    Module.finrank ℚ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      : Submodule ℚ (Module.End ℚ ImO)) = 1 := by
  rw [shared_cartan, finrank_span_singleton imRepL_DI_ne_zero]

-- finrank(sup) = 12 via inclusion-exclusion
theorem finrank_sup :
    Module.finrank ℚ (chargeColourLie.toSubmodule ⊔ electroweakLie.toSubmodule
      : Submodule ℚ (Module.End ℚ ImO)) = 12 := by
  have hie := Submodule.finrank_sup_add_finrank_inf_eq
    chargeColourLie.toSubmodule electroweakLie.toSubmodule
  rw [chargeColourLie_finrank, electroweakLie_finrank] at hie
  -- hie : finrank(sup) + finrank(inf) = 9 + 4
  rw [finrank_inf] at hie
  omega

-- W8 teeth: the shared line is NEITHER factor (proper intersection),
-- i.e. chargeOp ∉ inf and hyperOp ∉ inf (each in only one factor).
-- Simpler tooth: the intersection is nonzero (not ⊥) but not all of either factor.
theorem inf_ne_bot :
    (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      : Submodule ℚ (Module.End ℚ ImO)) ≠ ⊥ := by
  rw [shared_cartan]
  intro h
  rw [Submodule.span_singleton_eq_bot] at h
  exact imRepL_DI_ne_zero h

-- chargeOp ∉ the intersection (charge is colour-charge only, not shared)
theorem chargeOp_not_mem_inf :
    chargeOp ∉ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      : Submodule ℚ (Module.End ℚ ImO)) := by
  intro h
  rw [Submodule.mem_inf] at h
  have h2 := h.2
  rw [electroweakLie_toSubmodule] at h2
  exact chargeOp_not_mem_electroweakLie h2

end Phys.Algebra
