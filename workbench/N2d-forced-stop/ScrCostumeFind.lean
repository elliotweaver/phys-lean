import Phys.Cascade.ForcedStop
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD

noncomputable def p : O ℚ := CD.iota (ιJ ℚ)
noncomputable def q : O ℚ := CD.iota (CD.e2 : H ℚ)
noncomputable def r : O ℚ := (CD.e2 : O ℚ)

noncomputable def X : S ℚ := ⟨p, q⟩
noncomputable def Y : S ℚ := CD.iota r

macro "red" : tactic => `(tactic|
  (simp only [X, Y, p, q, r, ιJ, CD.Nrm];
   simp [CD.iota, CD.e2, Dbl.J, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.mul_im,
    Dbl.star_re', Dbl.star_im']))

set_option maxHeartbeats 2000000 in
theorem rhsval : (CD.iota (CD.Nrm X) * Y).im.im.im.im = (0:ℚ) := by red
set_option maxHeartbeats 2000000 in
theorem lhsval : (X * (star X * Y)).im.im.im.im = (2:ℚ) := by red; norm_num
