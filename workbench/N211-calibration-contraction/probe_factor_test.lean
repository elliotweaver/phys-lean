import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- Test: evaluate coassoc4 and the RHS on specific witnesses to check the factor.
-- Using u1, u2 from the banked infrastructure.

-- Factor-1 version: coassoc4 x y z w = gForm(octCross x y)(octCross z w) - (gForm x z * gForm y w - gForm x w * gForm y z)
-- Factor-2 version: coassoc4 x y z w = 2*gForm(octCross x y)(octCross z w) - 2*(gForm x z * gForm y w - gForm x w * gForm y z)

-- Test on (u1, u2, u1, u2): all imaginary
-- coassoc4 u1 u2 u1 u2 = gForm(assoc u1 u2 u1) u2
set_option maxHeartbeats 400000 in
theorem test_factor1_u1u2u1u2 :
    coassoc4 u1 u2 u1 u2 = gForm (octCross u1 u2) (octCross u1 u2) - (gForm u1 u1 * gForm u2 u2 - gForm u1 u2 * gForm u2 u1) := by
  rw [show coassoc4 u1 u2 u1 u2 = gForm (assoc u1 u2 u1) u2 from rfl]
  unfold assoc gForm octCross
  have hsu1 : star u1 = -u1 := (mem_ImO).mp u1_mem_ImO
  have hsu2 : star u2 = -u2 := (mem_ImO).mp u2_mem_ImO
  simp only [star_add, star_mul, star_one, star_smul, hsu1, hsu2, neg_neg, mul_neg, neg_mul]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- Test factor-2 on (u1, u2, u1, u2)
set_option maxHeartbeats 400000 in
theorem test_factor2_u1u2u1u2 :
    coassoc4 u1 u2 u1 u2 = 2 * gForm (octCross u1 u2) (octCross u1 u2) - 2 * (gForm u1 u1 * gForm u2 u2 - gForm u1 u2 * gForm u2 u1) := by
  rw [show coassoc4 u1 u2 u1 u2 = gForm (assoc u1 u2 u1) u2 from rfl]
  unfold assoc gForm octCross
  have hsu1 : star u1 = -u1 := (mem_ImO).mp u1_mem_ImO
  have hsu2 : star u2 = -u2 := (mem_ImO).mp u2_mem_ImO
  simp only [star_add, star_mul, star_one, star_smul, hsu1, hsu2, neg_neg, mul_neg, neg_mul]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- Also get the numeric values
set_option maxHeartbeats 400000 in
theorem val_coassoc4_u1u2u1u2 : coassoc4 u1 u2 u1 u2 = 0 := by
  rw [show coassoc4 u1 u2 u1 u2 = gForm (assoc u1 u2 u1) u2 from rfl]
  unfold assoc gForm
  have hsu2 : star u2 = -u2 := (mem_ImO).mp u2_mem_ImO
  rw [hsu2, mul_neg, reQ_neg]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

set_option maxHeartbeats 400000 in
theorem val_gForm_octCross_u1u2_u1u2 : gForm (octCross u1 u2) (octCross u1 u2) = 1 := by
  unfold gForm octCross
  have hsu1 : star u1 = -u1 := (mem_ImO).mp u1_mem_ImO
  have hsu2 : star u2 = -u2 := (mem_ImO).mp u2_mem_ImO
  simp only [star_add, star_mul, star_one, star_smul, hsu1, hsu2, neg_neg, mul_neg, neg_mul]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

set_option maxHeartbeats 400000 in
theorem val_gForm_u1u1 : gForm u1 u1 = 1 := by
  unfold gForm
  have hsu1 : star u1 = -u1 := (mem_ImO).mp u1_mem_ImO
  rw [hsu1, mul_neg, reQ_neg]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

set_option maxHeartbeats 400000 in
theorem val_gForm_u2u2 : gForm u2 u2 = 1 := by
  unfold gForm
  have hsu2 : star u2 = -u2 := (mem_ImO).mp u2_mem_ImO
  rw [hsu2, mul_neg, reQ_neg]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

set_option maxHeartbeats 400000 in
theorem val_gForm_u1u2 : gForm u1 u2 = 0 := by
  unfold gForm
  have hsu2 : star u2 = -u2 := (mem_ImO).mp u2_mem_ImO
  rw [hsu2, mul_neg, reQ_neg]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- So: coassoc4 u1 u2 u1 u2 = 0
-- Factor-1 RHS: 1 - (1*1 - 0*0) = 1 - 1 = 0 ✓
-- Factor-2 RHS: 2*1 - 2*(1*1 - 0*0) = 2 - 2 = 0 ✓
-- Both give 0! This test doesn't distinguish.

-- Need a test where the two factors give different answers.
-- Let's try (u1, u2, u2, u1):
-- coassoc4 u1 u2 u2 u1 — note: assoc u1 u2 u2 = 0 (by alt_right: assoc x y y = 0)
-- So LHS = 0
-- Factor-1 RHS: gForm(octCross u1 u2)(octCross u2 u1) - (g(u1,u2)*g(u2,u1) - g(u1,u1)*g(u2,u2))
-- = gForm(octCross u1 u2)(octCross u2 u1) - (0*0 - 1*1) = gForm(octCross u1 u2)(octCross u2 u1) + 1
-- octCross u2 u1 = -octCross u1 u2 (antisymm)
-- gForm(octCross u1 u2)(-octCross u1 u2) = -gForm(octCross u1 u2)(octCross u1 u2) = -1
-- Factor-1 RHS: -1 + 1 = 0 ✓
-- Factor-2 RHS: 2*(-1) - 2*(0 - 1) = -2 + 2 = 0 ✓
-- Still both 0!

-- Try (u1, u2, e2, wa) — but we need all imaginary. Let's use the N210 witness.
-- coassoc4 wa wb wc (assoc wa wb wc) = 4 (N210 witness)
-- Need gForm(octCross wa wb)(octCross wc (assoc wa wb wc)) which is complex.

-- Let me try a simpler distinguishing test: (u1, u2, u1, u1)
-- LHS: coassoc4 u1 u2 u1 u1 = gForm(assoc u1 u2 u1) u1
-- Factor-1 RHS: gForm(octCross u1 u2)(octCross u1 u1) - (g(u1,u1)*g(u2,u1) - g(u1,u1)*g(u2,u1))
-- = gForm(octCross u1 u2)(0) - (1*0 - 1*0) = 0 - 0 = 0
-- Factor-2 RHS: 2*0 - 2*0 = 0
-- assoc u1 u2 u1: is this 0? Let me check. alt_left says assoc x x y = 0, but this is assoc u1 u2 u1, not x x y.
-- Actually assoc_swap12: assoc x y z = -assoc y x z, so assoc u1 u2 u1 = -assoc u2 u1 u1 = 0 (by alt_left with x=u1... no, alt_left says assoc x x y = 0, but assoc u2 u1 u1 has u1 u1 in positions 2,3, not 1,2.
-- Actually alt_right: assoc x y y = 0. So assoc u2 u1 u1 = 0. And assoc_swap12 gives assoc u1 u2 u1 = -assoc u2 u1 u1 = 0. Wait, that's not right either. assoc_swap12 says assoc x y z + assoc y x z = 0, so assoc u1 u2 u1 = -assoc u2 u1 u1 = 0.
-- So LHS = 0, both RHS = 0. Still doesn't distinguish.

-- I need a case where coassoc4 ≠ 0. Let me use the witness from N210.
-- The witness uses wa, wb, wc.

end
end Phys.Algebra
