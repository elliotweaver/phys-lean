import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.Alternative
import Phys.Algebra.OctonionCrossProduct

namespace Phys.Algebra.N210Probe5

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def coassoc4 (x y z w : O ℚ) : ℚ := gForm (assoc x y z) w

-- bridge: for imaginary w, coassoc4 = -reQ([x,y,z]·w).
theorem coassoc4_eq_neg_reQ {w : O ℚ} (hw : w ∈ ImO) (x y z : O ℚ) :
    coassoc4 x y z w = - reQ (assoc x y z * w) := by
  unfold coassoc4 gForm
  have hsw : star w = - w := (mem_ImO).mp hw
  rw [hsw, mul_neg, reQ_neg]

-- a full 4-cycle to confirm total antisymmetry composes (xyzw -> yzwx is odd).
-- Just confirm the swaps compose: an example double-swap = identity-sign.
theorem coassoc4_swap_xy (x y z w : O ℚ) : coassoc4 x y z w = - coassoc4 y x z w := by
  unfold coassoc4
  have h : assoc x y z = - assoc y x z := eq_neg_of_add_eq_zero_left (assoc_swap12 x y z)
  rw [h, show (- assoc y x z) = (-1 : ℚ) • assoc y x z by rw [neg_one_smul], gForm_smul_left]
  ring

end

#print axioms coassoc4_eq_neg_reQ

end Phys.Algebra.N210Probe5
