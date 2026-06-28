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

theorem octCompNeg_eq_mul : octCompNeg = octTopNeg * octInnerNeg := by
  refine LinearEquiv.ext (fun z => ?_); rfl

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

theorem octTopNeg_comm_octInnerNeg : octTopNeg * octInnerNeg = octInnerNeg * octTopNeg := by
  refine LinearEquiv.ext (fun z => ?_)
  show octTopNeg (octInnerNeg z) = octInnerNeg (octTopNeg z)
  apply CD.ext
  · rfl
  · show -hTopNegFun z.im = hTopNegFun (-z.im); rw [hTopNegFun_neg]

-- Self-inverse ⟹ inv = self.
theorem octTopNeg_inv : octTopNeg⁻¹ = octTopNeg := by
  rw [eq_comm, eq_inv_iff_mul_eq_one]; exact octTopNeg_mul_self
theorem octInnerNeg_inv : octInnerNeg⁻¹ = octInnerNeg := by
  rw [eq_comm, eq_inv_iff_mul_eq_one]; exact octInnerNeg_mul_self
theorem octCompNeg_inv : octCompNeg⁻¹ = octCompNeg := by
  rw [eq_comm, eq_inv_iff_mul_eq_one]; exact octCompNeg_mul_self

-- The remaining products (closure table) in group-mul form.
theorem octCompNeg_mul_octTopNeg : octCompNeg * octTopNeg = octInnerNeg := by
  rw [octCompNeg_eq_mul, mul_assoc, ← octTopNeg_comm_octInnerNeg, ← mul_assoc,
    octTopNeg_mul_self, one_mul]
theorem octTopNeg_mul_octCompNeg : octTopNeg * octCompNeg = octInnerNeg := by
  rw [octCompNeg_eq_mul, ← mul_assoc, octTopNeg_mul_self, one_mul]
theorem octCompNeg_mul_octInnerNeg : octCompNeg * octInnerNeg = octTopNeg := by
  rw [octCompNeg_eq_mul, mul_assoc, octInnerNeg_mul_self, mul_one]
theorem octInnerNeg_mul_octCompNeg : octInnerNeg * octCompNeg = octTopNeg := by
  rw [octCompNeg_eq_mul, octTopNeg_comm_octInnerNeg, ← mul_assoc, octInnerNeg_mul_self, one_mul]
theorem octInnerNeg_mul_octTopNeg : octInnerNeg * octTopNeg = octCompNeg := by
  rw [octCompNeg_eq_mul, octTopNeg_comm_octInnerNeg]

-- Build the explicit Subgroup with 4-element carrier.
def kleinFour : Subgroup (O Cut ≃ₗ[Cut] O Cut) where
  carrier := {1, octTopNeg, octInnerNeg, octCompNeg}
  one_mem' := by left; rfl
  mul_mem' := by
    intro a b ha hb
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at ha hb ⊢
    rcases ha with rfl | rfl | rfl | rfl <;> rcases hb with rfl | rfl | rfl | rfl <;>
      simp only [one_mul, mul_one, octTopNeg_mul_self, octInnerNeg_mul_self, octCompNeg_mul_self,
        ← octCompNeg_eq_mul, octInnerNeg_mul_octTopNeg, octCompNeg_mul_octTopNeg,
        octTopNeg_mul_octCompNeg, octCompNeg_mul_octInnerNeg, octInnerNeg_mul_octCompNeg] <;>
      tauto
  inv_mem' := by
    intro a ha
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at ha ⊢
    rcases ha with rfl | rfl | rfl | rfl <;>
      simp only [inv_one, octTopNeg_inv, octInnerNeg_inv, octCompNeg_inv] <;> tauto

#check @kleinFour

end
end Phys.Algebra
