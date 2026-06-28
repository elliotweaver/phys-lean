import Phys.Algebra.LorentzContinuumOctStabilizerG2SecondAut

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

theorem isAlgAutCut_trans {φ ψ : O Cut ≃ₗ[Cut] O Cut}
    (hφ : IsAlgAutCut φ) (hψ : IsAlgAutCut ψ) : IsAlgAutCut (φ.trans ψ) := by
  refine ⟨?_, ?_⟩
  · intro x y; show ψ (φ (x * y)) = ψ (φ x) * ψ (φ y); rw [hφ.1, hψ.1]
  · show ψ (φ 1) = 1; rw [hφ.2, hψ.2]

def octCompNeg : O Cut ≃ₗ[Cut] O Cut := octInnerNeg.trans octTopNeg

theorem octCompNeg_isAlgAut : IsAlgAutCut octCompNeg :=
  isAlgAutCut_trans octInnerNeg_isAlgAut octTopNeg_isAlgAut

-- hTopNegFun is an involution.
theorem hTopNegFun_involution (p : H Cut) : hTopNegFun (hTopNegFun p) = p := by
  apply CD.ext
  · rfl
  · show -(-p.im) = p.im; rw [neg_neg]

-- octCompNeg apply form.
theorem octCompNeg_apply (z : O Cut) :
    octCompNeg z = ⟨hTopNegFun z.re, -hTopNegFun z.im⟩ := by
  show octTopNegFun (octInnerNegFun z) = _; apply CD.ext <;> rfl

/-! ### Distinctness: 4 distinct elements {id, octTopNeg, octInnerNeg, octCompNeg}. -/

theorem octCompNeg_e2 : octCompNeg (CD.e2 : O Cut) = -(CD.e2 : O Cut) := by
  show octTopNeg (octInnerNeg (CD.e2 : O Cut)) = _; rw [octInnerNeg_e2, octTopNeg_e2]

theorem octTopNeg_innerGen : octTopNeg innerGen = innerGen := by
  apply CD.ext
  · rfl
  · show -(innerGen.im) = innerGen.im; show -(0 : H Cut) = (0 : H Cut); simp

theorem octCompNeg_innerGen : octCompNeg innerGen = -innerGen := by
  show octTopNeg (octInnerNeg innerGen) = _
  rw [octInnerNeg_innerGen, map_neg, octTopNeg_innerGen]

-- octCompNeg ≠ id (negates e₂).
theorem octCompNeg_ne_refl : octCompNeg ≠ LinearEquiv.refl Cut (O Cut) := by
  intro h
  have he : octCompNeg (CD.e2 : O Cut) = (CD.e2 : O Cut) := by rw [h]; rfl
  rw [octCompNeg_e2] at he
  have him := congrArg (fun z => (z : O Cut).im) he
  simp only [CD.neg_im, CD.e2_im] at him
  have hc := congrArg (fun (q : H Cut) => q.re.re) him
  simp only at hc
  norm_num [CD.neg_re, CD.one_re, Dbl.neg_re, Dbl.one_re] at hc

-- octCompNeg ≠ octTopNeg (differ on innerGen: octCompNeg negates, octTopNeg fixes).
theorem octCompNeg_ne_octTopNeg : octCompNeg ≠ octTopNeg := by
  intro h
  have he : octCompNeg innerGen = octTopNeg innerGen := by rw [h]
  rw [octCompNeg_innerGen, octTopNeg_innerGen] at he
  -- -innerGen = innerGen ⟹ innermost -1 = 1
  have hre := congrArg (fun z => (z : O Cut).re) he
  simp only [CD.neg_re] at hre
  have hgen : -(CD.e2 : H Cut) = (CD.e2 : H Cut) := by
    simpa [innerGen, CD.iota] using hre
  have him := congrArg (fun (p : H Cut) => p.im) hgen
  simp only [CD.neg_im, CD.e2_im] at him
  have hc := congrArg (fun (d : Dbl Cut) => d.re) him
  simp only at hc
  norm_num [Dbl.neg_re, Dbl.one_re] at hc

-- octCompNeg ≠ octInnerNeg (differ on e₂: octCompNeg negates, octInnerNeg fixes).
theorem octCompNeg_ne_octInnerNeg : octCompNeg ≠ octInnerNeg := by
  intro h
  have he : octCompNeg (CD.e2 : O Cut) = octInnerNeg (CD.e2 : O Cut) := by rw [h]
  rw [octCompNeg_e2, octInnerNeg_e2] at he
  have him := congrArg (fun z => (z : O Cut).im) he
  simp only [CD.neg_im, CD.e2_im] at him
  have hc := congrArg (fun (q : H Cut) => q.re.re) him
  simp only at hc
  norm_num [CD.neg_re, CD.one_re, Dbl.neg_re, Dbl.one_re] at hc

/-! ### Involution + Klein-four closure table. -/

-- octCompNeg is an involution.
theorem octCompNeg_involution : octCompNeg.trans octCompNeg = LinearEquiv.refl Cut (O Cut) := by
  refine LinearEquiv.ext (fun z => ?_)
  show octCompNeg (octCompNeg z) = z
  rw [octCompNeg_apply, octCompNeg_apply]
  apply CD.ext
  · show hTopNegFun (hTopNegFun z.re) = z.re; rw [hTopNegFun_involution]
  · show -hTopNegFun (-hTopNegFun z.im) = z.im
    rw [hTopNegFun_neg, neg_neg, hTopNegFun_involution]

-- COMMUTATIVITY: octTopNeg ∘ octInnerNeg = octInnerNeg ∘ octTopNeg = octCompNeg.
theorem octTopNeg_trans_octInnerNeg : octTopNeg.trans octInnerNeg = octCompNeg := by
  refine LinearEquiv.ext (fun z => ?_)
  show octInnerNeg (octTopNeg z) = octCompNeg z
  rw [octCompNeg_apply]
  show octInnerNegFun (octTopNegFun z) = _
  apply CD.ext
  · rfl
  · show hTopNegFun (-z.im) = -hTopNegFun z.im; rw [hTopNegFun_neg]

-- CLOSURE: octCompNeg ∘ octTopNeg = octInnerNeg.
theorem octCompNeg_trans_octTopNeg : octCompNeg.trans octTopNeg = octInnerNeg := by
  refine LinearEquiv.ext (fun z => ?_)
  show octTopNeg (octCompNeg z) = octInnerNeg z
  rw [octCompNeg_apply]
  show octTopNegFun _ = octInnerNegFun z
  apply CD.ext
  · rfl
  · show -(-hTopNegFun z.im) = hTopNegFun z.im; rw [neg_neg]

-- CLOSURE: octCompNeg ∘ octInnerNeg = octTopNeg.
theorem octCompNeg_trans_octInnerNeg : octCompNeg.trans octInnerNeg = octTopNeg := by
  refine LinearEquiv.ext (fun z => ?_)
  show octInnerNeg (octCompNeg z) = octTopNeg z
  rw [octCompNeg_apply]
  show octInnerNegFun _ = octTopNegFun z
  apply CD.ext
  · show hTopNegFun (hTopNegFun z.re) = z.re; rw [hTopNegFun_involution]
  · show hTopNegFun (-hTopNegFun z.im) = -z.im
    rw [hTopNegFun_neg, hTopNegFun_involution]

/-! ### Third gauge element + W8. -/

theorem octBlockEndC_octCompNeg_mem_octStab :
    IsOctStab (octBlockEndC ((octCompNeg : O Cut →ₗ[Cut] O Cut))) :=
  octBlockEndC_autC_mem_octStab octCompNeg_isAlgAut

theorem octCompNeg_gFormC_e2_eq_one :
    gFormC (octCompNeg (CD.e2 : O Cut)) (octCompNeg (CD.e2 : O Cut)) = 1 := by
  have := autC_gFormC octCompNeg_isAlgAut (CD.e2 : O Cut) (CD.e2 : O Cut)
  rw [this]
  simp [gFormC, reQC, CD.e2, CD.mul_re, CD.star_re, CD.star_im]

#check @octCompNeg_involution
#check @octTopNeg_trans_octInnerNeg
#check @octCompNeg_ne_octTopNeg

end
end Phys.Algebra
