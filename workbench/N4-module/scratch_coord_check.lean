import Phys.Algebra.Operator
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD

-- which coordinate of e₂*ιe₂ vs ιe₂*e₂ differs?
-- e₂ : O ℚ = ⟨0, 1⟩ (im=1 in H), ιe₂ = ⟨e₂_H, 0⟩
-- compute (e2 * iota e2).im and (iota e2 * e2).im (these are in H ℚ)
example : ((CD.e2 : O ℚ) * CD.iota (CD.e2 : H ℚ)).im = (CD.e2 : H ℚ) := by
  simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im]
example : (CD.iota (CD.e2 : H ℚ) * (CD.e2 : O ℚ)).im = star (CD.e2 : H ℚ) := by
  simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im]
-- so they differ where e₂_H ≠ star e₂_H, i.e. e₂_H.im ≠ -e₂_H.im. e₂_H = ⟨0,1⟩, .im=1, star=-1.
-- coordinate path: O.im : H, then H.im : Dbl, then Dbl.im : ℚ.  e2_H = ⟨⟨0,0⟩(re Dbl), ⟨0,1⟩? no.
-- e2 : H ℚ = CD (Dbl ℚ) = ⟨(0:Dbl),(1:Dbl)⟩. So e2_H.im = (1:Dbl ℚ) = ⟨1,0⟩. .im.re = 1? star negates H.im fully: star e2_H .im = -1_Dbl = ⟨-1,0⟩.
-- pick coordinate z.im.im.re : differs 1 vs -1.
