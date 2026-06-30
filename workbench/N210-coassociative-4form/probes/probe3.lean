import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.Alternative
import Phys.Algebra.OctonionCrossProduct

namespace Phys.Algebra.N210Probe3

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def coassoc4 (x y z w : O ℚ) : ℚ := gForm (assoc x y z) w

set_option maxHeartbeats 400000 in
theorem zw_lever (x y z w : O ℚ) :
    reQ (assoc x y z * w) + reQ (assoc x y w * z) = 0 := by
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- z↔w antisymmetry of the 4-form itself, on imaginary z,w. THE GENUINELY-NEW antisymmetry.
theorem coassoc4_swap_zw {z w : O ℚ} (hz : z ∈ ImO) (hw : w ∈ ImO) (x y : O ℚ) :
    coassoc4 x y z w = - coassoc4 x y w z := by
  unfold coassoc4 gForm
  have hsw : star w = - w := (mem_ImO).mp hw
  have hsz : star z = - z := (mem_ImO).mp hz
  rw [hsw, hsz, mul_neg, mul_neg, reQ_neg, reQ_neg]
  have := zw_lever x y z w
  linarith [this]

-- NON-VACUITY: pick imaginary units, show coassoc4 is genuinely nonzero on a 4-tuple.
-- Use u1, u2, octCross u1 u2 (=u1*u2), and... need a 4th. Try the value directly via assoc.
-- Witness: assoc u1 u2 (octCross u1 u2) paired with u1? Let's just compute a coordinate.
-- The natural non-vacuous 4-tuple comes from the associator's own non-vanishing witness.
-- Probe: is coassoc4 u1 u2 e4 e4' nonzero for some explicit imaginary units?
-- e4 = ⟨0, e2⟩-style. Let me compute coassoc4 on the banked assoc_nonvanishing triple.

-- candidate imaginary units (coordinates in O ℚ = CD (CD (Dbl ℚ))):
def v1 : O ℚ := ⟨⟨⟨0,1⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩   -- = u1
def v2 : O ℚ := ⟨⟨⟨0,0⟩, ⟨1,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩   -- = u2
def v3 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,1⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩   -- another imaginary unit
def v4 : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,1⟩, ⟨0,0⟩⟩⟩   -- a 4th imaginary unit

set_option maxHeartbeats 400000 in
theorem witness_val : coassoc4 v1 v2 v3 v4 = 0 ∨ coassoc4 v1 v2 v3 v4 ≠ 0 := by
  exact em _

set_option maxHeartbeats 800000 in
theorem witness_compute : coassoc4 v1 v2 v3 v4 = (0:ℚ) - 0 := by
  unfold coassoc4 gForm assoc v1 v2 v3 v4
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  norm_num

end

#print axioms coassoc4_swap_zw

end Phys.Algebra.N210Probe3
