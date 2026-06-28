import Phys.Algebra.LorentzContinuumOctStabilizerG2Nontrivial

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def hTopNegFun (p : H Cut) : H Cut := ⟨p.re, -p.im⟩
@[simp] theorem hTopNegFun_re (p : H Cut) : (hTopNegFun p).re = p.re := rfl
@[simp] theorem hTopNegFun_im (p : H Cut) : (hTopNegFun p).im = -p.im := rfl
theorem hTopNegFun_one : hTopNegFun (1 : H Cut) = 1 := by apply CD.ext <;> simp [hTopNegFun]

def octInnerNegFun (z : O Cut) : O Cut := ⟨hTopNegFun z.re, hTopNegFun z.im⟩
@[simp] theorem octInnerNegFun_re (z : O Cut) : (octInnerNegFun z).re = hTopNegFun z.re := rfl
@[simp] theorem octInnerNegFun_im (z : O Cut) : (octInnerNegFun z).im = hTopNegFun z.im := rfl

/-- THE LINEAR EQUIVALENCE. -/
def octInnerNeg : O Cut ≃ₗ[Cut] O Cut where
  toFun := octInnerNegFun
  map_add' x y := by
    apply CD.ext
    · show hTopNegFun (x + y).re = hTopNegFun x.re + hTopNegFun y.re
      simp only [CD.add_re]; apply CD.ext
      · simp [hTopNegFun]
      · simp only [hTopNegFun, CD.add_im]; abel
    · show hTopNegFun (x + y).im = hTopNegFun x.im + hTopNegFun y.im
      simp only [CD.add_im]; apply CD.ext
      · simp [hTopNegFun]
      · simp only [hTopNegFun, CD.add_im]; abel
  map_smul' r x := by
    apply CD.ext
    · show hTopNegFun (r • x).re = (r • octInnerNegFun x).re
      simp only [CD.genSmul_re, octInnerNegFun]
      apply CD.ext
      · simp [hTopNegFun, CD.genSmul_re]
      · simp only [hTopNegFun, CD.genSmul_im]; rw [smul_neg]
    · show hTopNegFun (r • x).im = (r • octInnerNegFun x).im
      simp only [CD.genSmul_im, octInnerNegFun]
      apply CD.ext
      · simp [hTopNegFun, CD.genSmul_re]
      · simp only [hTopNegFun, CD.genSmul_im]; rw [smul_neg]
  invFun := octInnerNegFun
  left_inv x := by apply CD.ext <;> (apply CD.ext <;> simp [hTopNegFun, octInnerNegFun])
  right_inv x := by apply CD.ext <;> (apply CD.ext <;> simp [hTopNegFun, octInnerNegFun])

@[simp] theorem octInnerNeg_apply (z : O Cut) : octInnerNeg z = octInnerNegFun z := rfl

/-- The inner generator: the H-rung doubling generator embedded into O via `iota`. -/
def innerGen : O Cut := CD.iota (CD.e2 : H Cut)

/-- octInnerNeg MOVES the inner generator to its negative. -/
theorem octInnerNeg_innerGen : octInnerNeg innerGen = -innerGen := by
  apply CD.ext
  · show hTopNegFun (innerGen.re) = (-innerGen).re
    rw [CD.neg_re]
    show hTopNegFun (CD.e2 : H Cut) = -(CD.e2 : H Cut)
    apply CD.ext <;> simp [hTopNegFun, CD.e2]
  · show hTopNegFun (innerGen.im) = (-innerGen).im
    rw [CD.neg_im]
    show hTopNegFun (0 : H Cut) = -(0 : H Cut)
    apply CD.ext <;> simp [hTopNegFun]

/-- octTopNeg FIXES the inner generator (its outer im-half is 0). -/
theorem octTopNeg_innerGen : octTopNeg innerGen = innerGen := by
  apply CD.ext
  · simp [octTopNeg, octTopNegFun]
  · show -(innerGen.im) = innerGen.im
    show -(0 : H Cut) = (0 : H Cut); simp

end

end Phys.Algebra
