import Phys.Algebra.DerivationLowerBound
import Mathlib.Tactic

namespace Phys.Algebra.ScratchN20c
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def e1 : O ℚ := ⟨⟨⟨0,1⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e2 : O ℚ := ⟨⟨⟨0,0⟩, ⟨1,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e3 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,1⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e4 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨1,0⟩, ⟨0,0⟩⟩⟩
def e5 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,1⟩, ⟨0,0⟩⟩⟩
def e6 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨1,0⟩⟩⟩
def e7 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,1⟩⟩⟩

-- e1*e1 = -1
theorem sq1 : e1 * e1 = -1 := by
  ext <;> simp [e1, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

-- D(-1) = 0 (since D 1 = 0)
theorem derivQ_one (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) : D 1 = 0 := by
  have h := hD 1 1
  simp only [one_mul, mul_one] at h
  have : D 1 + D 1 = D 1 + 0 := by rw [add_zero]; exact h.symm
  exact (add_left_cancel this)

-- ★ MEASURE C0:  (D e1).c1 = 0   [= z.re.re.im]
-- from hD e1 e1 : D(e1*e1) = De1*e1 + e1*De1, and e1*e1=-1 ⟹ D(-1)=0=De1*e1+e1*De1.
-- take coord c0 (re.re.re): the recon says coord c0 of (De1*e1+e1*De1) = -2*(De1).c1.
theorem C0 (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) : (D e1).re.re.im = 0 := by
  have h := hD e1 e1
  rw [sq1] at h
  -- h : D (-1) = D e1 * e1 + e1 * D e1
  rw [map_neg, derivQ_one D hD, neg_zero] at h
  -- h : 0 = D e1 * e1 + e1 * D e1
  have hc := congrArg (fun z => z.re.re.re) h
  simp only [e1, CD.mul_re, CD.add_re,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at hc
  show (D ⟨⟨⟨0,1⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩ : O ℚ).re.re.im = 0
  linarith [hc]

end Phys.Algebra.ScratchN20c
