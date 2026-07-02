import Phys.Algebra.DerivationH
namespace T
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD
-- The su(2)/so(3) structure constant "2": ad_k(i) = 2j, coordinate reads 2.
theorem sc2 : (adM hK hI).im.re = 2 := by
  rw [adM_k_on_i, two_zsmul]
  simp only [CD.add_im, Dbl.add_re, hJ, CD.e2]
  norm_num
#print axioms sc2
end T
