import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- coe helper: chargeOp acts as octCross u1 at the O ℚ level (chargeOp := crossOp u1, defeq).
theorem chargeOp_coe (y : ImO) : ((chargeOp y : ImO) : O ℚ) = octCross u1 (y : O ℚ) :=
  crossOp_coe u1 y

-- STEP 1: chargeOp³ = -chargeOp on ImO, ENTIRELY at the octCross/coe level (no ImO smul).
-- (chargeOp³ y : O ℚ) = gForm u1 (chargeOp y) • u1 - (chargeOp y)   [chargeOp_sq_coe at chargeOp y]
--                     = gForm u1 (octCross u1 y) • u1 - octCross u1 y   [crossOp_coe]
--                     = 0 • u1 - octCross u1 y   [gForm_x_octCross: u1 ⟂ its own cross products]
--                     = - octCross u1 y = ((-chargeOp) y : O ℚ)
theorem chargeOp_cube : chargeOp.comp (chargeOp.comp chargeOp) = -chargeOp := by
  refine LinearMap.ext (fun y => ?_)
  apply Subtype.ext
  show ((chargeOp (chargeOp (chargeOp y)) : ImO) : O ℚ) = (((-chargeOp) y : ImO) : O ℚ)
  rw [chargeOp_sq_coe (chargeOp y)]
  show gForm u1 ((chargeOp y : ImO) : O ℚ) • u1 - ((chargeOp y : ImO) : O ℚ)
      = (((-chargeOp) y : ImO) : O ℚ)
  rw [chargeOp_coe y, gForm_x_octCross u1_mem_ImO y.2, zero_smul, zero_sub,
      LinearMap.neg_apply, Submodule.coe_neg, chargeOp_coe y]

-- STEP 2: aeval chargeOp (X³ + X) = 0
theorem chargeOp_aeval : (aeval chargeOp) (X ^ 3 + X : ℚ[X]) = 0 := by
  have h : chargeOp ^ 3 = -chargeOp := by
    rw [pow_succ, pow_succ, pow_one]
    show chargeOp * (chargeOp * chargeOp) = -chargeOp
    rw [show chargeOp * (chargeOp * chargeOp) = chargeOp.comp (chargeOp.comp chargeOp) from rfl,
        chargeOp_cube]
  rw [map_add, map_pow, aeval_X, h]; abel

-- STEP 3: integral + minpoly ∣ X³+X
theorem cube_poly_monic : (X ^ 3 + X : ℚ[X]).Monic := by monicity!

theorem chargeOp_integral : IsIntegral ℚ chargeOp :=
  ⟨X ^ 3 + X, cube_poly_monic, chargeOp_aeval⟩

theorem minpoly_dvd_cube : minpoly ℚ chargeOp ∣ (X ^ 3 + X : ℚ[X]) :=
  minpoly.dvd ℚ chargeOp chargeOp_aeval

end

end Phys.Algebra
