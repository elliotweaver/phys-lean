import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic

namespace Phys.Algebra.ScratchN20inj2
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem oct_ext_zero (x : O ℚ)
    (h0 : x.re.re.re = 0) (h1 : x.re.re.im = 0)
    (h2 : x.re.im.re = 0) (h3 : x.re.im.im = 0)
    (h4 : x.im.re.re = 0) (h5 : x.im.re.im = 0)
    (h6 : x.im.im.re = 0) (h7 : x.im.im.im = 0) : x = 0 := by
  ext
  · exact h0
  · exact h1
  · exact h2
  · exact h3
  · exact h4
  · exact h5
  · exact h6
  · exact h7

-- De3 = D(u1*u2). When D u1 = 0 ∧ D u2 = 0, De3 = 0 (Leibniz).
-- We'll need this for the De4.c3 step.

-- local copy of the (private) product lemma for scratch testing
private lemma mul_u12 : u1 * u2 = u3 := by
  ext <;> simp [u1, u2, u3, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

/-- ★ THE CASCADE: the 14 pivot-coords vanishing + the 7 structural cut constraints +
    trace-free forces `D u1 = D u2 = D u4 = 0`. -/
theorem gens_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (p1 : (D u1).re.im.re = 0) (p2 : (D u1).re.im.im = 0) (p3 : (D u1).im.re.re = 0)
    (p4 : (D u1).im.re.im = 0) (p5 : (D u1).im.im.re = 0) (p6 : (D u1).im.im.im = 0)
    (q3 : (D u2).re.im.im = 0) (q4 : (D u2).im.re.re = 0) (q5 : (D u2).im.re.im = 0)
    (q6 : (D u2).im.im.re = 0) (q7 : (D u2).im.im.im = 0)
    (r5 : (D u4).im.re.im = 0) (r6 : (D u4).im.im.re = 0) (r7 : (D u4).im.im.im = 0) :
    D u1 = 0 ∧ D u2 = 0 ∧ D u4 = 0 := by
  -- De1: c0 trace-free, c1 from cut_e1_c1, c2..c7 = pivots
  have d1c0 := derivQ_reQ_zero D hD u1   -- (D u1).re.re.re = 0
  have d1c1 := cut_e1_c1 D hD            -- (D u1).re.re.im = 0
  have hDe1 : D u1 = 0 := oct_ext_zero _ d1c0 d1c1 p1 p2 p3 p4 p5 p6
  -- De2: c0 trace-free, c1 from cut_e12_c0 + De1.c2 (=p1) = 0, c2 from cut_e2_c2, c3..c7 pivots
  have d2c0 := derivQ_reQ_zero D hD u2   -- (D u2).re.re.re = 0
  have hc12 := cut_e12_c0 D hD           -- (D u1).re.im.re + (D u2).re.re.im = 0
  have d2c1 : (D u2).re.re.im = 0 := by rw [p1] at hc12; linarith [hc12]
  have d2c2 := cut_e2_c2 D hD            -- (D u2).re.im.re = 0
  have hDe2 : D u2 = 0 := oct_ext_zero _ d2c0 d2c1 d2c2 q3 q4 q5 q6 q7
  -- De3 = 0 (Leibniz, De1=De2=0)
  have hDe3 : D u3 = 0 := by rw [← mul_u12, hD u1 u2, hDe1, hDe2]; simp
  -- De4: c0 trace-free, c1 from cut_e14_c0 + p3, c2 from cut_e24_c0 + q4, c3 from cut_e34_c0 + De3, c4 from cut_e4_c4, c5..c7 pivots
  have d4c0 := derivQ_reQ_zero D hD u4   -- (D u4).re.re.re = 0
  have hc14 := cut_e14_c0 D hD           -- (D u1).im.re.re + (D u4).re.re.im = 0
  have d4c1 : (D u4).re.re.im = 0 := by rw [p3] at hc14; linarith [hc14]
  have hc24 := cut_e24_c0 D hD           -- (D u2).im.re.re + (D u4).re.im.re = 0
  have d4c2 : (D u4).re.im.re = 0 := by rw [q4] at hc24; linarith [hc24]
  have hc34 := cut_e34_c0 D hD           -- (D u3).im.re.re + (D u4).re.im.im = 0
  have d3im : (D u3).im.re.re = 0 := by rw [hDe3]; rfl
  have d4c3 : (D u4).re.im.im = 0 := by rw [d3im] at hc34; linarith [hc34]
  have d4c4 := cut_e4_c4 D hD            -- (D u4).im.re.re = 0
  have hDe4 : D u4 = 0 := oct_ext_zero _ d4c0 d4c1 d4c2 d4c3 d4c4 r5 r6 r7
  exact ⟨hDe1, hDe2, hDe4⟩

end Phys.Algebra.ScratchN20inj2
