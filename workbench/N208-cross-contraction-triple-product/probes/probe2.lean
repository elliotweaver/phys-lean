import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationAutGroup

/-! N208 PROBE 2 — orthogonality gForm x (octCross x y) = 0, then the HEADLINE contraction
    and the W8 witness teeth. -/

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

/-- gForm x (octCross x y) = reQ (x · star(octCross x y)).
    Since octCross x y ∈ ImO, star(octCross x y) = −(octCross x y), so
    gForm x (octCross x y) = −reQ(x·octCross x y) = −reQ((gForm x y)•x − (gForm x x)•y).
    Both x,y ∈ ImO have reQ = 0, so the whole thing is 0. -/
theorem gForm_x_octCross {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    gForm x (octCross x y) = 0 := by
  have hmem : octCross x y ∈ ImO := octCross_mem_ImO hy
  have hs : star (octCross x y) = -(octCross x y) := (mem_ImO).mp hmem
  unfold gForm
  rw [hs, mul_neg, reQ_neg, octMul_x_octCross hx]
  -- reQ ((gForm x y)•x − (gForm x x)•y) = 0
  rw [sub_eq_add_neg, reQ_add, reQ_smul, reQ_neg, reQ_smul,
      reQ_ImO_zero hx, reQ_ImO_zero hy]
  ring

/-- ★★★ THE HEADLINE: the 7-dim cross-product CONTRACTION (vector triple-product) identity.
    octCross x (octCross x y) = (gForm x y)•x − (gForm x x)•y. -/
theorem octCross_contraction {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    octCross x (octCross x y) = (gForm x y) • x - (gForm x x) • y := by
  have hgo : gForm x (octCross x y) = 0 := gForm_x_octCross hx hy
  have hxo : x * (octCross x y) = (gForm x y) • x - (gForm x x) • y :=
    octMul_x_octCross hx
  -- outer octCross at (x, w) with w := octCross x y, unfolding ONLY the head occurrence
  show x * (octCross x y) + (gForm x (octCross x y)) • (1 : O ℚ)
      = (gForm x y) • x - (gForm x x) • y
  rw [hgo, zero_smul, add_zero, hxo]

#print axioms octCross_contraction

end Phys.Algebra
