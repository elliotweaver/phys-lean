import Phys.Algebra.DerivationLowerBound
import Mathlib.Tactic

namespace Phys.Algebra.ScratchN20d
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def e1 : O ℚ := ⟨⟨⟨0,1⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e2 : O ℚ := ⟨⟨⟨0,0⟩, ⟨1,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e3 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,1⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩

theorem m12 : e1 * e2 = e3 := by
  ext <;> simp [e1, e2, e3, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

-- ★ VALIDATE 1: trace-free via restrictScalars bridge to banked deriv_reQ_zero
theorem traceFree (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x : O ℚ) :
    (D x).re.re.re = 0 := by
  have hDz : IsDeriv (D.restrictScalars ℤ) := fun a b => hD a b
  have := deriv_reQ_zero (D.restrictScalars ℤ) hDz x
  simpa [reQ, LinearMap.restrictScalars_apply] using this

-- ★ VALIDATE 2: off-diagonal extraction with De1 = 0 known ⟹ De2.c1 = 0
theorem C1_with (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (h1 : D e1 = 0) :
    (D e2).re.re.im = 0 := by
  have h := hD e1 e2
  rw [m12, h1, zero_mul, zero_add] at h
  -- h : D e3 = e1 * D e2
  have hc := congrArg (fun z => z.re.re.re) h
  simp only [] at hc
  have htf : (D e3).re.re.re = 0 := traceFree D hD e3
  rw [htf] at hc
  -- 0 = (e1 * D e2).re.re.re
  simp only [e1, CD.mul_re, CD.add_re,
    Dbl.mul_re, Dbl.add_re, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, Dbl.neg_re, Dbl.neg_im,
    CD.zero_im, Dbl.zero_re, Dbl.zero_im] at hc
  ring_nf at hc
  linarith [hc]

end Phys.Algebra.ScratchN20d
