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

theorem hTopNegFun_involution (p : H Cut) : hTopNegFun (hTopNegFun p) = p := by
  apply CD.ext
  · rfl
  · show -(-p.im) = p.im; rw [neg_neg]

theorem octCompNeg_apply (z : O Cut) :
    octCompNeg z = ⟨hTopNegFun z.re, -hTopNegFun z.im⟩ := by
  show octTopNegFun (octInnerNegFun z) = _; apply CD.ext <;> rfl

-- In the GROUP (O Cut ≃ₗ[Cut] O Cut), mul = (f*g) x = f (g x), one = refl.
-- octCompNeg = octTopNeg * octInnerNeg (in group mul).
theorem octCompNeg_eq_mul : octCompNeg = octTopNeg * octInnerNeg := by
  refine LinearEquiv.ext (fun z => ?_)
  show octCompNeg z = octTopNeg (octInnerNeg z)
  rfl

-- octTopNeg is an involution in the group: octTopNeg * octTopNeg = 1.
theorem octTopNeg_mul_self : octTopNeg * octTopNeg = 1 := by
  refine LinearEquiv.ext (fun z => ?_)
  show octTopNeg (octTopNeg z) = z
  apply CD.ext
  · rfl
  · show -(-z.im) = z.im; rw [neg_neg]

theorem octInnerNeg_mul_self : octInnerNeg * octInnerNeg = 1 := by
  refine LinearEquiv.ext (fun z => ?_)
  show octInnerNeg (octInnerNeg z) = z
  apply CD.ext <;> (apply CD.ext <;> simp [hTopNegFun, octInnerNegFun])

theorem octCompNeg_mul_self : octCompNeg * octCompNeg = 1 := by
  refine LinearEquiv.ext (fun z => ?_)
  show octCompNeg (octCompNeg z) = z
  rw [octCompNeg_apply, octCompNeg_apply]
  apply CD.ext
  · show hTopNegFun (hTopNegFun z.re) = z.re; rw [hTopNegFun_involution]
  · show -hTopNegFun (-hTopNegFun z.im) = z.im
    rw [hTopNegFun_neg, neg_neg, hTopNegFun_involution]

-- COMMUTATIVITY: octTopNeg * octInnerNeg = octInnerNeg * octTopNeg.
theorem octTopNeg_comm_octInnerNeg : octTopNeg * octInnerNeg = octInnerNeg * octTopNeg := by
  refine LinearEquiv.ext (fun z => ?_)
  show octTopNeg (octInnerNeg z) = octInnerNeg (octTopNeg z)
  apply CD.ext
  · rfl
  · show -hTopNegFun z.im = hTopNegFun (-z.im); rw [hTopNegFun_neg]

-- Build the Subgroup as closure of the two involutions and probe membership.
-- Carrier predicate for the explicit 4-element set.
def kleinCarrier : Set (O Cut ≃ₗ[Cut] O Cut) := {1, octTopNeg, octInnerNeg, octCompNeg}

example : octCompNeg ∈ kleinCarrier := by
  show octCompNeg ∈ ({1, octTopNeg, octInnerNeg, octCompNeg} : Set _)
  simp [kleinCarrier]

#check @Subgroup.closure
#check @Subgroup.mem_closure

end
end Phys.Algebra
