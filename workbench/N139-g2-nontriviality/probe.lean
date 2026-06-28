import Phys.Algebra.LorentzContinuumOctStabilizerG2

namespace Phys.Algebra.N139Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- The top-half negation on `O Cut = CD (H Cut)`: fix the quaternion subalgebra `H`,
    negate its orthogonal complement. -/
def octTopNegFun (z : O Cut) : O Cut := ⟨z.re, -z.im⟩

@[simp] theorem octTopNegFun_re (z : O Cut) : (octTopNegFun z).re = z.re := rfl
@[simp] theorem octTopNegFun_im (z : O Cut) : (octTopNegFun z).im = -z.im := rfl

/-- MULTIPLICATIVE: the two top-half sign flips cancel in `.re`, combine in `.im`. -/
theorem octTopNegFun_mul (z w : O Cut) :
    octTopNegFun (z * w) = octTopNegFun z * octTopNegFun w := by
  apply CD.ext
  · simp [octTopNegFun, CD.mul_re]
  · show -(z * w).im = (octTopNegFun w).im * (octTopNegFun z).re
        + (octTopNegFun z).im * star (octTopNegFun w).re
    simp only [octTopNegFun, CD.mul_im]
    rw [neg_add]
    congr 1
    · exact (neg_mul w.im z.re).symm
    · exact (neg_mul z.im (star w.re)).symm

/-- UNITAL. -/
theorem octTopNegFun_one : octTopNegFun (1 : O Cut) = 1 := by
  apply CD.ext <;> simp [octTopNegFun]

/-- Cut-LINEAR (additive + smul), and an involution. -/
def octTopNeg : O Cut ≃ₗ[Cut] O Cut where
  toFun := octTopNegFun
  map_add' x y := by
    apply CD.ext
    · simp [octTopNegFun]
    · simp only [octTopNegFun, CD.add_im]; abel
  map_smul' r x := by
    apply CD.ext <;> simp [octTopNegFun, CD.genSmul_re, CD.genSmul_im]
  invFun := octTopNegFun
  left_inv x := by apply CD.ext <;> simp [octTopNegFun]
  right_inv x := by apply CD.ext <;> simp [octTopNegFun]

@[simp] theorem octTopNeg_apply (z : O Cut) : octTopNeg z = octTopNegFun z := rfl

/-- THE HEADLINE: octTopNeg is an octonion algebra-automorphism (IsAlgAutCut). -/
theorem octTopNeg_isAlgAut : IsAlgAutCut octTopNeg := by
  refine ⟨?_, ?_⟩
  · intro x y; simp only [octTopNeg_apply]; exact octTopNegFun_mul x y
  · simp only [octTopNeg_apply]; exact octTopNegFun_one

/-- It MOVES e₂: octTopNeg e₂ = -e₂. -/
theorem octTopNeg_e2 : octTopNeg (CD.e2 : O Cut) = -(CD.e2 : O Cut) := by
  apply CD.ext <;> simp [octTopNeg, octTopNegFun, CD.e2]

/-- NON-IDENTITY: octTopNeg ≠ identity, because it moves e₂ (and e₂ ≠ -e₂ since char Cut = 0). -/
theorem octTopNeg_ne_refl : octTopNeg ≠ LinearEquiv.refl Cut (O Cut) := by
  intro h
  have he : octTopNeg (CD.e2 : O Cut) = (CD.e2 : O Cut) := by rw [h]; rfl
  rw [octTopNeg_e2] at he
  -- he : -e2 = e2, i.e. the im-component: -1 = 1 in Cut
  have him := congrArg (fun z => (z : O Cut).im) he
  simp only at him
  -- (-(e2)).im = e2.im → -(e2.im) = e2.im; e2.im = (1 : H Cut)
  have : -((CD.e2 : O Cut).im) = (CD.e2 : O Cut).im := by
    have := him; simpa [CD.neg_im] using this
  rw [CD.e2_im] at this
  -- this : -(1 : H Cut) = 1 ; take re.re.re to land in Cut
  have hc := congrArg (fun (q : H Cut) => q.re.re) this
  simp only at hc
  -- hc : (-(1:H Cut)).re.re = (1:H Cut).re.re  →  -(1:Cut) = 1
  norm_num [CD.neg_re, CD.one_re] at hc

/-- THE GAUGE INCLUSION: the concrete non-identity gauge element lands in octStab. -/
theorem octBlockEndC_octTopNeg_mem_octStab :
    IsOctStab (octBlockEndC ((octTopNeg : O Cut →ₗ[Cut] O Cut))) :=
  octBlockEndC_autC_mem_octStab octTopNeg_isAlgAut

/-- Costume anchor: preserves e₂'s self-overlap (= 1). -/
theorem octTopNeg_gFormC_e2 :
    gFormC (octTopNeg (CD.e2 : O Cut)) (octTopNeg (CD.e2 : O Cut)) = gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) :=
  autC_gFormC octTopNeg_isAlgAut _ _

end

end Phys.Algebra.N139Probe
