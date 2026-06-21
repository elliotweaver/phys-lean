import Phys.Cascade.ForcedStop
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD

noncomputable def p : O ℚ := CD.iota (ιJ ℚ)
noncomputable def q : O ℚ := CD.iota (CD.e2 : H ℚ)
noncomputable def r : O ℚ := (CD.e2 : O ℚ)

noncomputable def proj8 (w : O ℚ) : List ℚ :=
  [w.re.re.re, w.re.re.im, w.re.im.re, w.re.im.im,
   w.im.re.re, w.im.re.im, w.im.im.re, w.im.im.im]

-- *-associator term  b*(c̄*a) - (b*c̄)*a  in O ℚ  (using + (-·))
noncomputable def assocTerm (a b c : O ℚ) : O ℚ := b*(star c*a) + (-((b*star c)*a))

#eval! proj8 (assocTerm p q r)
#eval! proj8 (assocTerm q r p)
#eval! proj8 (assocTerm r p q)
#eval! proj8 (assocTerm p r q)
#eval! proj8 ((p*q)*r + (-(p*(q*r))))
