import Phys.Algebra.DerivationLowerBound
import Mathlib.Tactic

namespace Phys.Algebra.ScratchN20
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- concrete basis elements e0..e7 of O ℚ (coord layout c0..c7)
def e0 : O ℚ := 1
def e1 : O ℚ := ⟨⟨⟨0,1⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e2 : O ℚ := ⟨⟨⟨0,0⟩, ⟨1,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e3 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,1⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e4 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨1,0⟩, ⟨0,0⟩⟩⟩
def e5 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,1⟩, ⟨0,0⟩⟩⟩
def e6 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨1,0⟩⟩⟩
def e7 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,1⟩⟩⟩

-- MEASURE 1: the multiplication relations e3=e1*e2, e5=e1*e4, e6=e2*e4, e7=e3*e4
example : e1 * e2 = e3 := by
  ext <;> simp [e1, e2, e3, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

example : e1 * e4 = e5 := by
  ext <;> simp [e1, e4, e5, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

example : e2 * e4 = e6 := by
  ext <;> simp [e2, e4, e6, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

example : e3 * e4 = e7 := by
  ext <;> simp [e3, e4, e7, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

-- MEASURE 2: the basis decomposition x = Σ cᵢ(x) • eᵢ
example (x : O ℚ) :
    x = c0 x • e0 + c1 x • e1 + c2 x • e2 + c3 x • e3 + c4 x • e4 + c5 x • e5 + c6 x • e6 + c7 x • e7 := by
  ext <;> simp [c0, c1, c2, c3, c4, c5, c6, c7, e0, e1, e2, e3, e4, e5, e6, e7,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, CD.add_re, CD.add_im,
    Dbl.add_re, Dbl.add_im] <;> ring

end Phys.Algebra.ScratchN20
