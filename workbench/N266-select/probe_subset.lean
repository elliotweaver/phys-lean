import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationUpperBound

/-!
PROBE (N266 SELECT, candidate A'): ⊆ direction — the crux (lifting N252 from ImO to the carrier).
-/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable def matterColourNeutral : Submodule ℚ (O ℚ) :=
  ⨅ D : colourCentralizer, LinearMap.ker ((D : derivationLieQ) : Module.End ℚ (O ℚ))

theorem matterColourNeutral_le_span_one_u1 :
    matterColourNeutral ≤ Submodule.span ℚ {(1 : O ℚ), u1} := by
  intro x hx
  rw [matterColourNeutral, Submodule.mem_iInf] at hx
  set w : O ℚ := x - (reQ x) • (1 : O ℚ) with hw
  have hwIm : w ∈ ImO := by
    rw [mem_ImO, hw]
    have ht := trace_id x
    have hs1 : star ((reQ x) • (1 : O ℚ)) = (reQ x) • (1 : O ℚ) := by
      have := starL.map_smul (reQ x) (1 : O ℚ)
      simpa [starL_apply, star_one] using this
    rw [star_sub, hs1]
    linear_combination (norm := module) ht
  have hker : (⟨w, hwIm⟩ : ImO) ∈ colourInvariants := by
    rw [colourInvariants, Submodule.mem_iInf]
    intro D
    rw [LinearMap.mem_ker]
    apply Subtype.ext
    rw [imRep_coe]
    show ((D : derivationLieQ) : Module.End ℚ (O ℚ)) w = ((0 : ImO) : O ℚ)
    have hD : IsDerivQ ((D : derivationLieQ) : Module.End ℚ (O ℚ)) := (D : derivationLieQ).2
    have hx0 : ((D : derivationLieQ) : Module.End ℚ (O ℚ)) x = 0 := hx D
    have h1 : ((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((reQ x) • (1 : O ℚ)) = 0 := by
      rw [map_smul, derivQ_one _ hD, smul_zero]
    rw [hw, map_sub, hx0, h1, sub_zero]
    rfl
  rw [colourInvariants_eq_span_sgl, Submodule.mem_span_singleton] at hker
  obtain ⟨c, hc⟩ := hker
  have hwc : w = c • u1 := by
    have := congrArg (Subtype.val) hc
    simpa [SetLike.val_smul] using this.symm
  have hxsplit : x = (reQ x) • (1 : O ℚ) + c • u1 := by
    rw [← hwc, hw]; abel
  rw [hxsplit]
  apply Submodule.add_mem
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by left; rfl))
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by right; rfl))

#print axioms matterColourNeutral_le_span_one_u1

end Phys.Algebra
