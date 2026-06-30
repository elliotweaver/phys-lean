import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationAutGroup

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem reQ_ImO_zero {x : O ℚ} (hx : x ∈ ImO) : reQ x = 0 := by
  have hs : star x = -x := (mem_ImO).mp hx
  have ht := trace_id x
  rw [hs, add_neg_cancel] at ht
  have : (2 * reQ x) • (1 : O ℚ) = 0 := ht.symm
  rcases smul_eq_zero.mp this with h | h
  · rcases mul_eq_zero.mp h with h' | h'
    · norm_num at h'
    · exact h'
  · exact absurd h one_ne_zero_O

theorem octSq_ImO {x : O ℚ} (hx : x ∈ ImO) :
    x * x = (- gForm x x) • (1 : O ℚ) := by
  have hs : star x = -x := (mem_ImO).mp hx
  have hsm : x * star x = (gForm x x) • (1 : O ℚ) := selfMul_eq_smul x
  rw [hs, mul_neg] at hsm
  have : x * x = -((gForm x x) • (1 : O ℚ)) := by rw [← hsm, neg_neg]
  rw [this, neg_smul]

theorem octMul_x_octCross {x y : O ℚ} (hx : x ∈ ImO) :
    x * (octCross x y) = (gForm x y) • x - (gForm x x) • y := by
  unfold octCross
  rw [mul_add, mul_mul_left x y, octSq_ImO hx, qsmul_mul_left, one_mul,
      qsmul_mul_right, mul_one, neg_smul]
  abel

theorem gForm_x_octCross {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    gForm x (octCross x y) = 0 := by
  have hmem : octCross x y ∈ ImO := octCross_mem_ImO hy
  have hs : star (octCross x y) = -(octCross x y) := (mem_ImO).mp hmem
  unfold gForm
  rw [hs, mul_neg, reQ_neg, octMul_x_octCross hx]
  rw [sub_eq_add_neg, reQ_add, reQ_smul, reQ_neg, reQ_smul,
      reQ_ImO_zero hx, reQ_ImO_zero hy]
  ring

theorem octCross_contraction {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    octCross x (octCross x y) = (gForm x y) • x - (gForm x x) • y := by
  have hgo : gForm x (octCross x y) = 0 := gForm_x_octCross hx hy
  have hxo : x * (octCross x y) = (gForm x y) • x - (gForm x x) • y :=
    octMul_x_octCross hx
  show x * (octCross x y) + (gForm x (octCross x y)) • (1 : O ℚ)
      = (gForm x y) • x - (gForm x x) • y
  rw [hgo, zero_smul, add_zero, hxo]

/-! ## W8 witness teeth -/

/-- At the orthonormal pair (u1, u2): gForm u1 u2 = 0 (N206), gForm u1 u1 = 1 (SpinorRotation),
    so the contraction collapses to octCross u1 (octCross u1 u2) = 0•u1 − 1•u2 = −u2. -/
theorem octCross_contraction_witness :
    octCross u1 (octCross u1 u2) = - u2 := by
  rw [octCross_contraction u1_mem_ImO u2_mem_ImO, gForm_u1_u2, gForm_u1,
      zero_smul, zero_sub, one_smul]

/-- The witness coordinate (−u2).re.im.re = −1: the double cross reproduces −u2, a NONZERO
    imaginary unit. -/
theorem octCross_contraction_witness_coord :
    (octCross u1 (octCross u1 u2)).re.im.re = -1 := by
  rw [octCross_contraction_witness]
  decide

theorem octCross_contraction_witness_ne_zero :
    octCross u1 (octCross u1 u2) ≠ 0 := by
  intro h
  have hc : (octCross u1 (octCross u1 u2)).re.im.re = -1 :=
    octCross_contraction_witness_coord
  rw [h] at hc
  simp at hc

#print axioms octCross_contraction
#print axioms octCross_contraction_witness
#print axioms octCross_contraction_witness_coord
#print axioms octCross_contraction_witness_ne_zero

end Phys.Algebra
