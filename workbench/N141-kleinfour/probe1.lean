import Phys.Algebra.LorentzContinuumOctStabilizerG2SecondAut

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## MEASURE: composition of automorphisms; the third involution; Klein-four. -/

-- LEVER: IsAlgAutCut closed under LinearEquiv.trans (composition).
theorem isAlgAutCut_trans {φ ψ : O Cut ≃ₗ[Cut] O Cut}
    (hφ : IsAlgAutCut φ) (hψ : IsAlgAutCut ψ) :
    IsAlgAutCut (φ.trans ψ) := by
  refine ⟨?_, ?_⟩
  · intro x y
    show ψ (φ (x * y)) = ψ (φ x) * ψ (φ y)
    rw [hφ.1, hψ.1]
  · show ψ (φ 1) = 1
    rw [hφ.2, hψ.2]

-- THE THIRD MAP: composition octTopNeg ∘ octInnerNeg (apply octInnerNeg first, then octTopNeg).
def octCompNeg : O Cut ≃ₗ[Cut] O Cut := octInnerNeg.trans octTopNeg

theorem octCompNeg_isAlgAut : IsAlgAutCut octCompNeg :=
  isAlgAutCut_trans octInnerNeg_isAlgAut octTopNeg_isAlgAut

-- octCompNeg apply: ⟨a,b⟩ ↦ octTopNeg(octInnerNeg ⟨a,b⟩) = ⟨hTopNeg a, -hTopNeg b⟩
theorem octCompNeg_apply (z : O Cut) :
    octCompNeg z = ⟨hTopNegFun z.re, -hTopNegFun z.im⟩ := by
  show octTopNegFun (octInnerNegFun z) = _
  apply CD.ext
  · rfl
  · rfl

-- Action on e₂: octInnerNeg fixes e₂, octTopNeg negates it ⟹ octCompNeg e₂ = -e₂.
theorem octCompNeg_e2 : octCompNeg (CD.e2 : O Cut) = -(CD.e2 : O Cut) := by
  show octTopNeg (octInnerNeg (CD.e2 : O Cut)) = _
  rw [octInnerNeg_e2, octTopNeg_e2]

-- Action on innerGen: octInnerNeg negates innerGen, octTopNeg fixes it ⟹ octCompNeg innerGen = -innerGen.
theorem octTopNeg_innerGen : octTopNeg innerGen = innerGen := by
  apply CD.ext
  · rfl
  · show -(innerGen.im) = innerGen.im
    show -(0 : H Cut) = (0 : H Cut)
    simp

theorem octCompNeg_innerGen : octCompNeg innerGen = -innerGen := by
  show octTopNeg (octInnerNeg innerGen) = _
  rw [octInnerNeg_innerGen, map_neg, octTopNeg_innerGen]

#check @octCompNeg_isAlgAut
#check @octCompNeg_e2
#check @octCompNeg_innerGen

end
end Phys.Algebra
