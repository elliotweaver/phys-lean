import Phys.Algebra.LorentzContinuumOctStabilizerG2Nontrivial

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## The H-rung top-half negation (the INNER Cayley–Dickson involution). -/

def hTopNegFun (p : H Cut) : H Cut := ⟨p.re, -p.im⟩

@[simp] theorem hTopNegFun_re (p : H Cut) : (hTopNegFun p).re = p.re := rfl
@[simp] theorem hTopNegFun_im (p : H Cut) : (hTopNegFun p).im = -p.im := rfl

theorem hTopNegFun_add (p q : H Cut) :
    hTopNegFun (p + q) = hTopNegFun p + hTopNegFun q := by
  apply CD.ext
  · simp [hTopNegFun]
  · simp only [hTopNegFun, CD.add_im]; abel

theorem hTopNegFun_neg (p : H Cut) : hTopNegFun (-p) = -hTopNegFun p := by
  apply CD.ext <;> simp [hTopNegFun]

theorem hTopNegFun_one : hTopNegFun (1 : H Cut) = 1 := by
  apply CD.ext <;> simp [hTopNegFun]

theorem hTopNegFun_mul (p q : H Cut) :
    hTopNegFun (p * q) = hTopNegFun p * hTopNegFun q := by
  apply CD.ext
  · simp [hTopNegFun, CD.mul_re]
  · show -(p * q).im = (hTopNegFun q).im * (hTopNegFun p).re
        + (hTopNegFun p).im * star (hTopNegFun q).re
    simp only [hTopNegFun, CD.mul_im]
    rw [neg_add]
    congr 1
    · exact (neg_mul q.im p.re).symm
    · exact (neg_mul p.im (star q.re)).symm

theorem hTopNegFun_star (p : H Cut) : hTopNegFun (star p) = star (hTopNegFun p) := by
  apply CD.ext <;> simp [hTopNegFun]

/-! ## The inner negation on O = componentwise lift of hTopNeg. -/

def octInnerNegFun (z : O Cut) : O Cut := ⟨hTopNegFun z.re, hTopNegFun z.im⟩

@[simp] theorem octInnerNegFun_re (z : O Cut) : (octInnerNegFun z).re = hTopNegFun z.re := rfl
@[simp] theorem octInnerNegFun_im (z : O Cut) : (octInnerNegFun z).im = hTopNegFun z.im := rfl

theorem octInnerNegFun_mul (z w : O Cut) :
    octInnerNegFun (z * w) = octInnerNegFun z * octInnerNegFun w := by
  apply CD.ext
  · show hTopNegFun ((z * w).re) = (octInnerNegFun z).re * (octInnerNegFun w).re
        + -(star (octInnerNegFun w).im * (octInnerNegFun z).im)
    simp only [octInnerNegFun_re, octInnerNegFun_im, CD.mul_re]
    rw [hTopNegFun_add, hTopNegFun_mul, hTopNegFun_neg, hTopNegFun_mul, hTopNegFun_star]
  · show hTopNegFun ((z * w).im) = (octInnerNegFun w).im * (octInnerNegFun z).re
        + (octInnerNegFun z).im * star (octInnerNegFun w).re
    simp only [octInnerNegFun_re, octInnerNegFun_im, CD.mul_im]
    rw [hTopNegFun_add, hTopNegFun_mul, hTopNegFun_mul, hTopNegFun_star]

theorem octInnerNegFun_one : octInnerNegFun (1 : O Cut) = 1 := by
  apply CD.ext
  · show hTopNegFun (1 : O Cut).re = (1 : O Cut).re
    rw [CD.one_re, hTopNegFun_one]
  · show hTopNegFun (1 : O Cut).im = (1 : O Cut).im
    rw [CD.one_im]
    apply CD.ext <;> simp [hTopNegFun]

end

end Phys.Algebra
