import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.Alternative

namespace Phys.Algebra.N210Probe2

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- THE COASSOCIATIVE 4-FORM ψ(x,y,z,w) = ⟨[x,y,z], w⟩ = gForm (assoc x y z) w. -/
def coassoc4 (x y z w : O ℚ) : ℚ := gForm (assoc x y z) w

-- (1) x↔y antisymmetry: mechanical from assoc_swap12 + gForm left-linearity.
theorem coassoc4_swap_xy (x y z w : O ℚ) : coassoc4 x y z w = - coassoc4 y x z w := by
  unfold coassoc4
  have h : assoc x y z = - assoc y x z := eq_neg_of_add_eq_zero_left (assoc_swap12 x y z)
  rw [h]
  rw [show (- assoc y x z) = (-1 : ℚ) • assoc y x z by rw [neg_one_smul], gForm_smul_left]
  ring

-- (2) y↔z antisymmetry: mechanical from assoc_swap23 + gForm left-linearity.
theorem coassoc4_swap_yz (x y z w : O ℚ) : coassoc4 x y z w = - coassoc4 x z y w := by
  unfold coassoc4
  have h : assoc x y z = - assoc x z y := eq_neg_of_add_eq_zero_left (assoc_swap23 x y z)
  rw [h]
  rw [show (- assoc x z y) = (-1 : ℚ) • assoc x z y by rw [neg_one_smul], gForm_smul_left]
  ring

-- (3) THE GENUINELY-NEW LEVER: z↔w antisymmetry on imaginary args.
-- gForm (assoc x y z) w = reQ (assoc x y z * star w). For w ∈ ImO, star w = -w.
-- Need: coassoc4 x y z w = - coassoc4 x y w z, i.e.
--   gForm([x,y,z],w) = - gForm([x,y,w],z), i.e. for imaginary z,w:
--   -reQ([x,y,z]*w) = reQ([x,y,w]*z), i.e. reQ([x,y,z]*w) + reQ([x,y,w]*z) = 0.
-- coordinate-ring brute on ALL args, measured ~15s in probe1.
set_option maxHeartbeats 400000 in
theorem zw_lever_allcoord (x y z w : O ℚ) :
    reQ (assoc x y z * w) + reQ (assoc x y w * z) = 0 := by
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end

#print axioms coassoc4_swap_xy
#print axioms coassoc4_swap_yz
#print axioms zw_lever_allcoord

end Phys.Algebra.N210Probe2
