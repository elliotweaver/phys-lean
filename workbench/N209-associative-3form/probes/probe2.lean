import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.OctonionCrossProductContraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## N209 full probe — the associative calibration 3-form φ(x,y,z) = ⟨x, y×z⟩. -/

-- trace cyclicity / associativity (the genuinely-new levers)
theorem reQ_mul_comm (a b : O ℚ) : reQ (a * b) = reQ (b * a) := by
  simp only [reQ, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

theorem reQ_mul_assoc3 (a b c : O ℚ) : reQ ((a * b) * c) = reQ (a * (b * c)) := by
  simp only [reQ, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- gForm is linear in the right slot under negation
theorem gForm_neg_right (v w : O ℚ) : gForm v (-w) = - gForm v w := by
  show reQ (v * star (-w)) = - reQ (v * star w)
  rw [star_neg, mul_neg, reQ_neg]

/-- THE CALIBRATION 3-FORM: `assoc3 x y z = ⟨x, y × z⟩`. -/
def assoc3 (x y z : O ℚ) : ℚ := gForm x (octCross y z)

/-- THE BRIDGE TO TRACE-ASSOCIATIVITY: for imaginary `x,y,z`,
    `assoc3 x y z = − reQ (x * (y * z))` — the calibration 3-form IS (minus) the real part
    of the octonion triple product. -/
theorem assoc3_eq_neg_reQ {x y z : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = - reQ (x * (y * z)) := by
  unfold assoc3
  -- octCross y z ∈ ImO so star (octCross y z) = - (octCross y z)
  have hwmem : octCross y z ∈ ImO := octCross_mem_ImO hz
  have hstar : star (octCross y z) = - (octCross y z) := (mem_ImO).mp hwmem
  show reQ (x * star (octCross y z)) = - reQ (x * (y * z))
  rw [hstar, mul_neg, reQ_neg]
  -- octCross y z = y*z + (gForm y z)•1
  unfold octCross
  rw [mul_add, reQ_add]
  -- the correction term: reQ (x * ((gForm y z)•1)) = (gForm y z) * reQ x = 0 since x ∈ ImO
  have hrx : reQ x = 0 := reQ_ImO_zero hx
  have : x * ((gForm y z) • (1 : O ℚ)) = (gForm y z) • x := by
    rw [qsmul_mul_right, mul_one]
  rw [this, reQ_smul, hrx, mul_zero, add_zero]

/-- ★★ THE 3-FORM IS CYCLIC: `assoc3 x y z = assoc3 y z x` (imaginary `x,y,z`) — the
    real-part trace-associativity of the octonion product. -/
theorem assoc3_cyclic {x y z : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = assoc3 y z x := by
  rw [assoc3_eq_neg_reQ hx hy hz, assoc3_eq_neg_reQ hy hz hx]
  congr 1
  -- reQ (x*(y*z)) = reQ (y*(z*x))
  rw [reQ_mul_comm x (y * z), reQ_mul_assoc3 y z x]

/-- ★ THE 3-FORM IS ANTISYMMETRIC under swapping the last two arguments:
    `assoc3 x y z = − assoc3 x z y` (imaginary `y,z`). -/
theorem assoc3_swap_yz {x y z : O ℚ} (hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = - assoc3 x z y := by
  unfold assoc3
  rw [octCross_antisymm hy hz, gForm_neg_right]

/-- ★ THE 3-FORM IS ANTISYMMETRIC under swapping the first two arguments:
    `assoc3 x y z = − assoc3 y x z` (imaginary `x,y,z`) — derived from cyclic + the yz-swap. -/
theorem assoc3_swap_xy {x y z : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = - assoc3 y x z := by
  -- assoc3 y x z = assoc3 x z y (cyclic) = - assoc3 x y z (swap yz)
  have h1 : assoc3 y x z = assoc3 x z y := assoc3_cyclic hy hx hz
  have h2 : assoc3 x z y = - assoc3 x y z := assoc3_swap_yz hz hy
  rw [h1, h2, neg_neg]

/-- W8 NON-VACUITY: the 3-form on the orthonormal-derived triple `(u2, u1, u1×u2)` equals `−1`
    — via the banked contraction witness `u1×(u1×u2) = −u2` and `⟨u2,u2⟩ = 1`. -/
theorem assoc3_witness : assoc3 u2 u1 (octCross u1 u2) = -1 := by
  unfold assoc3
  rw [octCross_contraction_witness, gForm_neg_right, gForm_u2_u2]

theorem assoc3_witness_ne_zero : assoc3 u2 u1 (octCross u1 u2) ≠ 0 := by
  rw [assoc3_witness]; norm_num

-- the antisymmetry has teeth: the swapped value is +1, distinct from -1
theorem assoc3_witness_swapped : assoc3 u1 u2 (octCross u1 u2) = 1 := by
  have hz : octCross u1 u2 ∈ ImO := octCross_mem_ImO (x := u1) u2_mem_ImO
  have h := assoc3_swap_xy u2_mem_ImO u1_mem_ImO hz
  -- h : assoc3 u2 u1 (octCross u1 u2) = - assoc3 u1 u2 (octCross u1 u2)
  rw [assoc3_witness] at h
  linarith [h]

#print axioms reQ_mul_assoc3
#print axioms assoc3_eq_neg_reQ
#print axioms assoc3_cyclic
#print axioms assoc3_swap_yz
#print axioms assoc3_swap_xy
#print axioms assoc3_witness
#print axioms assoc3_witness_ne_zero
#print axioms assoc3_witness_swapped

end
end Phys.Algebra
