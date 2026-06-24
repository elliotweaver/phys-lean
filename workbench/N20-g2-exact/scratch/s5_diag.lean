import Phys.Algebra.DerivationLowerBound
import Mathlib.Tactic

namespace Phys.Algebra.ScratchN20d
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def u1 : O ℚ := ⟨⟨⟨0,1⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩

theorem sq_u1 : u1 * u1 = -1 := by
  ext <;> simp [u1, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

theorem derivQ_one (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) : D 1 = 0 := by
  have h := hD 1 1
  simp only [one_mul, mul_one] at h
  have hh : D 1 + D 1 = D 1 + 0 := by rw [add_zero]; exact h.symm
  exact add_left_cancel hh

-- PRODUCTION form (reduced simp, set a, ring_nf) — probe the hc state.
theorem cut_e1_c1_probe (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) : (D u1).re.re.im = 0 := by
  have h := hD u1 u1
  rw [sq_u1, map_neg, derivQ_one D hD, neg_zero] at h
  set a := D u1 with ha
  have hc := congrArg (fun z => z.re.re.re) h
  simp only [u1, CD.mul_re, CD.add_re, Dbl.mul_re, Dbl.add_re, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, Dbl.neg_re, Dbl.neg_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at hc
  ring_nf at hc
  linarith [hc]

end Phys.Algebra.ScratchN20d
