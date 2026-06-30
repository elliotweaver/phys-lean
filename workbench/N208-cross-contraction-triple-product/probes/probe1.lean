import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationAutGroup

/-! N208 PROBE 1 — the 7-dim cross-product CONTRACTION (vector triple-product) identity.
    octCross x (octCross x y) = (gForm x y)•x − (gForm x x)•y   for x,y ∈ ImO.
    Lever: LEFT ALTERNATIVITY mul_mul_left (N5b), NEVER used by N206. -/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- imaginary elements have zero real part
theorem reQ_ImO_zero {x : O ℚ} (hx : x ∈ ImO) : reQ x = 0 := by
  have hs : star x = -x := (mem_ImO).mp hx
  have ht := trace_id x          -- x + star x = (2 reQ x)•1
  rw [hs, add_neg_cancel] at ht  -- 0 = (2 reQ x)•1
  have : (2 * reQ x) • (1 : O ℚ) = 0 := ht.symm
  rcases smul_eq_zero.mp this with h | h
  · have h2 : reQ x = 0 := by
      have := mul_eq_zero.mp h
      rcases this with h' | h'
      · norm_num at h'
      · exact h'
    exact h2
  · exact absurd h one_ne_zero_O

-- imaginary square is the negative Born norm on the unit line
theorem octSq_ImO {x : O ℚ} (hx : x ∈ ImO) :
    x * x = (- gForm x x) • (1 : O ℚ) := by
  have hs : star x = -x := (mem_ImO).mp hx
  have hsm : x * star x = (gForm x x) • (1 : O ℚ) := selfMul_eq_smul x
  rw [hs, mul_neg] at hsm        -- -(x*x) = (gForm x x)•1
  have : x * x = -((gForm x x) • (1 : O ℚ)) := by
    rw [← hsm, neg_neg]
  rw [this, neg_smul]

-- THE INNER STEP via LEFT ALTERNATIVITY: x·(octCross x y) = (gForm x y)•x − (gForm x x)•y
theorem octMul_x_octCross {x y : O ℚ} (hx : x ∈ ImO) :
    x * (octCross x y) = (gForm x y) • x - (gForm x x) • y := by
  unfold octCross
  rw [mul_add]                                  -- x*(x*y) + x*((gForm x y)•1)
  rw [mul_mul_left x y]                          -- (x*x)*y + x*((gForm x y)•1)   ← LEFT ALTERNATIVITY N5b
  rw [octSq_ImO hx]                              -- ((-gForm x x)•1)*y + ...
  rw [qsmul_mul_left, one_mul]                   -- (-gForm x x)•y + x*((gForm x y)•1)
  rw [qsmul_mul_right, mul_one]                  -- (-gForm x x)•y + (gForm x y)•x
  rw [neg_smul]
  abel

#print axioms octMul_x_octCross

end Phys.Algebra
