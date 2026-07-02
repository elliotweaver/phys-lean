import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- DEBUG: see what the goal looks like after unfold + simp
set_option maxHeartbeats 400000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  unfold coassoc4 gForm octCross assoc
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsw : star w = -w := (mem_ImO).mp hw
  simp only [star_add, star_mul, star_one, star_zero, star_smul, neg_neg,
    mul_neg, neg_mul, neg_zero, add_zero, zero_add]
  -- Show the goal to see what star patterns remain
  sorry

end
end Phys.Algebra
