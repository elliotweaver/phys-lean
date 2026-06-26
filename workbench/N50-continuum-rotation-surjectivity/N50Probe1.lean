import Phys.Algebra.LorentzContinuum

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- char-0 helper over Cut
theorem cut_add_self_zero {r : Cut} (h : r + r = 0) : r = 0 := by
  have : (2 : Cut) * r = 0 := by linear_combination h
  rcases mul_eq_zero.mp this with h2 | hr
  · exact absurd h2 two_ne_zero
  · exact hr

-- Step 1: Nrm z is self-conjugate in H Cut (generic).
example (z : O Cut) : star (CD.Nrm z) = CD.Nrm z := by
  show star ((z * star z).re) = (z * star z).re
  rw [← CD.star_re]; congr 1; rw [star_mul, star_star]

-- Step 2: real factorization over H Cut = CD (Dbl Cut).
example (a b : H Cut) (ha : star a = a) (hb : star b = b) :
    (a * b).re.re = a.re.re * b.re.re := by
  have haim : a.im = 0 := by
    have hh := congrArg CD.im ha
    simp only [CD.star_im] at hh
    have h2 : a.im + a.im = 0 := by linear_combination -hh
    exact Dbl.two_torsion_free (fun r hr => cut_add_self_zero hr) a.im h2
  have hareim : a.re.im = 0 := by
    have hh := congrArg CD.re ha
    rw [CD.star_re] at hh
    have h2 := congrArg Dbl.im hh
    simp only [Dbl.star_im'] at h2
    exact cut_add_self_zero (by linear_combination -h2)
  show ((a * b).re).re = _
  rw [CD.mul_re, haim]
  simp only [mul_zero, neg_zero, add_zero]
  rw [Dbl.mul_re, hareim]
  ring

end

end Phys.Algebra
