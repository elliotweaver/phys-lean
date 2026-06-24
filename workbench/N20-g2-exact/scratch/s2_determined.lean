import Phys.Algebra.DerivationLowerBound
import Mathlib.Tactic

namespace Phys.Algebra.ScratchN20b
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def e0 : O ℚ := 1
def e1 : O ℚ := ⟨⟨⟨0,1⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e2 : O ℚ := ⟨⟨⟨0,0⟩, ⟨1,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e3 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,1⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e4 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨1,0⟩, ⟨0,0⟩⟩⟩
def e5 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,1⟩, ⟨0,0⟩⟩⟩
def e6 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨1,0⟩⟩⟩
def e7 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,1⟩⟩⟩

theorem m12 : e1 * e2 = e3 := by
  ext <;> simp [e1, e2, e3, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]
theorem m14 : e1 * e4 = e5 := by
  ext <;> simp [e1, e4, e5, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]
theorem m24 : e2 * e4 = e6 := by
  ext <;> simp [e2, e4, e6, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]
theorem m34 : e3 * e4 = e7 := by
  ext <;> simp [e3, e4, e7, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

theorem basis_decomp (x : O ℚ) :
    x = c0 x • e0 + c1 x • e1 + c2 x • e2 + c3 x • e3 + c4 x • e4 + c5 x • e5 + c6 x • e6 + c7 x • e7 := by
  ext <;> simp [c0, c1, c2, c3, c4, c5, c6, c7, e0, e1, e2, e3, e4, e5, e6, e7,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, CD.add_re, CD.add_im,
    Dbl.add_re, Dbl.add_im]

-- D 1 = 0 for any IsDerivQ
theorem derivQ_one (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) : D 1 = 0 := by
  have h := hD 1 1
  simp only [one_mul, mul_one] at h
  -- h : D 1 = D 1 + D 1
  have : D 1 + D 1 = D 1 + 0 := by rw [add_zero]; exact h.symm
  exact (add_left_cancel this)

-- ★ THE DETERMINATION LEMMA
theorem determined (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (h1 : D e1 = 0) (h2 : D e2 = 0) (h4 : D e4 = 0) : D = 0 := by
  have h0 : D e0 = 0 := derivQ_one D hD
  have h3 : D e3 = 0 := by rw [← m12, hD e1 e2, h1, h2]; simp
  have h5 : D e5 = 0 := by rw [← m14, hD e1 e4, h1, h4]; simp
  have h6 : D e6 = 0 := by rw [← m24, hD e2 e4, h2, h4]; simp
  have h7 : D e7 = 0 := by rw [← m34, hD e3 e4, h3, h4]; simp
  refine LinearMap.ext fun x => ?_
  rw [basis_decomp x]
  simp only [map_add, map_smul, h0, h1, h2, h3, h4, h5, h6, h7, smul_zero, add_zero,
    LinearMap.zero_apply]

end Phys.Algebra.ScratchN20b
