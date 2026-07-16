import Phys.Algebra.StrongCPTheta
import Phys.Algebra.DerivationAutGroup
import Mathlib.Tactic

open scoped BigOperators
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ

namespace P4ProbeC

attribute [local instance] CD.narCD CD.srCD

/-- Full inversion (θ=π candidate) FLIPS the F₄-invariant cubic norm's sign, so it does NOT preserve
    jN — hence it is NOT a Jordan automorphism (F₄ = Aut(J₃(O)) preserves jN). If it preserved jN,
    then at the identity config jN(−1,−1,−1,0,0,0) = jN(1,1,1,0,0,0) = 1, but homogeneity gives
    jN(−1,−1,−1,0,0,0) = −1. Contradiction. -/
theorem neg_not_preserves_jN :
    ¬ (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ),
        jN (-d0) (-d1) (-d2) (-a) (-b) (-c) = jN d0 d1 d2 a b c) := by
  intro h
  have hkey := h 1 1 1 0 0 0
  rw [jN_one] at hkey
  -- jN(-1,-1,-1,-0,-0,-0) = 1, but by homogeneity it is -jN(1,1,1,0,0,0) = -1
  have hneg : jN (-1) (-1) (-1) (-(0:O ℚ)) (-(0:O ℚ)) (-(0:O ℚ)) = -1 := by
    have hh : jN (-1) (-1) (-1) (-(0:O ℚ)) (-(0:O ℚ)) (-(0:O ℚ)) = - jN 1 1 1 0 0 0 := by
      unfold jN
      have hg1 : gForm (-(0:O ℚ)) (-(0:O ℚ)) = gForm 0 0 := by unfold gForm; rw [star_neg, neg_mul_neg]
      have hg2 : reQ ((-(0:O ℚ)) * (-(0:O ℚ)) * star (-(0:O ℚ))) = - reQ ((0:O ℚ) * 0 * star 0) := by
        rw [star_neg, neg_mul_neg, mul_neg, reQ_neg]
      rw [hg1, hg2]; ring
    rw [hh, jN_one]
  rw [hneg] at hkey
  norm_num at hkey

end P4ProbeC
