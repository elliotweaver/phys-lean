import Phys.Algebra.TowerGatherInducedColourRep

namespace Phys.Algebra.ProbeN249

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE A: does injective_iff_map_eq_zero apply to the LieHom colourRepV directly?
theorem faithful_A : Function.Injective colourRepV := by
  rw [injective_iff_map_eq_zero]
  intro D hzero
  -- Step 1: imRep (D:derivationLieQ) vanishes on range chargeOp
  have hrange0 : ∀ y ∈ LinearMap.range chargeOp, imRep (D : derivationLieQ) y = 0 := by
    intro y hy
    have hyV : (y : O ℚ) ∈ Vsub := by
      rw [← range_chargeOp_map_eq_Vsub]; exact ⟨y, hy, rfl⟩
    have h0 : colourRepV D ⟨(y : O ℚ), hyV⟩ = 0 := by rw [hzero]; rfl
    have hc := congrArg (fun (z : Vsub) => (z : O ℚ)) h0
    simp only [colourRepV_coe] at hc
    apply Subtype.ext
    rw [imRep_coe]
    show (D.1 : Module.End ℚ (O ℚ)) (y : O ℚ) = ((0 : ImO) : O ℚ)
    simpa using hc
  -- Step 2: imRep (D:derivationLieQ) kills sgl
  have hsgl0 : imRep (D : derivationLieQ) sgl = 0 := colour_kills_sgl (D : derivationLieQ) D.2
  -- Step 3: imRep (D:derivationLieQ) = 0 on ker ⊔ range = ⊤
  have hall : imRep (D : derivationLieQ) = 0 := by
    rw [← LinearMap.ker_eq_top, eq_top_iff, ← ker_sup_range_chargeOp]
    apply sup_le
    · rw [chargeOp_ker, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe,
          LinearMap.mem_ker]
      exact hsgl0
    · intro r hr
      rw [LinearMap.mem_ker]
      exact hrange0 r hr
  -- Step 4: faithfulness forces (D:derivationLieQ) = 0
  have hD0 : (D : derivationLieQ) = 0 := imRep_injective (by rw [hall]; rfl)
  -- Step 5: D = 0 in colourCentralizer
  exact Subtype.ext hD0

end

end Phys.Algebra.ProbeN249
