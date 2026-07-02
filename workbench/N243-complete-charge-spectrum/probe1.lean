import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

abbrev sgl : ImO := ⟨u1, u1_mem_ImO⟩

theorem chargeOp_coe (y : ImO) : ((chargeOp y : ImO) : O ℚ) = octCross u1 (y : O ℚ) :=
  crossOp_coe u1 y

theorem chargeOp_cube : chargeOp.comp (chargeOp.comp chargeOp) = -chargeOp := by
  refine LinearMap.ext (fun y => ?_)
  apply Subtype.ext
  show ((chargeOp (chargeOp (chargeOp y)) : ImO) : O ℚ) = (((-chargeOp) y : ImO) : O ℚ)
  rw [chargeOp_sq_coe (chargeOp y)]
  show gForm u1 ((chargeOp y : ImO) : O ℚ) • u1 - ((chargeOp y : ImO) : O ℚ)
      = (((-chargeOp) y : ImO) : O ℚ)
  rw [chargeOp_coe y, gForm_x_octCross u1_mem_ImO y.2, zero_smul, zero_sub,
      LinearMap.neg_apply, Submodule.coe_neg, chargeOp_coe y]

theorem chargeOp_aeval : (aeval chargeOp) (X ^ 3 + X : ℚ[X]) = 0 := by
  have h : chargeOp ^ 3 = -chargeOp := by
    rw [pow_succ, pow_succ, pow_one]
    show chargeOp * (chargeOp * chargeOp) = -chargeOp
    rw [show chargeOp * (chargeOp * chargeOp) = chargeOp.comp (chargeOp.comp chargeOp) from rfl,
        chargeOp_cube]
  rw [map_add, map_pow, aeval_X, h]; abel

theorem cube_poly_monic : (X ^ 3 + X : ℚ[X]).Monic := by monicity!

theorem chargeOp_integral : IsIntegral ℚ chargeOp :=
  ⟨X ^ 3 + X, cube_poly_monic, chargeOp_aeval⟩

theorem minpoly_dvd_cube : minpoly ℚ chargeOp ∣ (X ^ 3 + X : ℚ[X]) :=
  minpoly.dvd ℚ chargeOp chargeOp_aeval

-- ============ MINIMALITY ============

-- The factorization X³+X = X·(X²+1).
theorem cube_factor : (X ^ 3 + X : ℚ[X]) = X * (X ^ 2 + 1) := by ring

-- sgl ≠ 0
theorem sgl_ne_zero : sgl ≠ 0 := by
  intro h
  exact u1_ne_zero (congrArg (Subtype.val) h)

-- 0 is a genuine eigenvalue: chargeOp kills the nonzero singlet.
theorem chargeOp_hasEigenvalue_zero : Module.End.HasEigenvalue chargeOp (0 : ℚ) := by
  apply Module.End.hasEigenvalue_of_hasEigenvector (x := sgl)
  rw [Module.End.hasEigenvector_iff]
  refine ⟨?_, sgl_ne_zero⟩
  rw [Module.End.mem_eigenspace_iff, chargeOp_kills_singlet, zero_smul]

-- X ∣ minpoly (0 is a root of minpoly).
theorem X_dvd_minpoly : (X : ℚ[X]) ∣ minpoly ℚ chargeOp := by
  have hroot : (minpoly ℚ chargeOp).IsRoot 0 :=
    Module.End.isRoot_of_hasEigenvalue chargeOp_hasEigenvalue_zero
  have := (dvd_iff_isRoot (a := (0 : ℚ)) (p := minpoly ℚ chargeOp)).mpr hroot
  simpa using this

-- THE HEADLINE: minpoly ℚ chargeOp = X³ + X.
theorem chargeOp_minpoly : minpoly ℚ chargeOp = (X ^ 3 + X : ℚ[X]) := by
  have hp_monic : (minpoly ℚ chargeOp).Monic := minpoly.monic chargeOp_integral
  -- p ∣ X·(X²+1)
  have hp_dvd : minpoly ℚ chargeOp ∣ X * (X ^ 2 + 1) := by
    rw [← cube_factor]; exact minpoly_dvd_cube
  -- X ∣ p, so p = X * q
  obtain ⟨q, hpq⟩ := X_dvd_minpoly
  -- q is monic
  have hX_monic : (X : ℚ[X]).Monic := monic_X
  have hq_monic : q.Monic := hX_monic.of_mul_monic_left (hpq ▸ hp_monic)
  -- q ∣ X²+1  (cancel X from  X*q = p ∣ X*(X²+1))
  have hq_dvd : q ∣ (X ^ 2 + 1 : ℚ[X]) := by
    have hXq : (X : ℚ[X]) * q ∣ X * (X ^ 2 + 1) := hpq ▸ hp_dvd
    exact (mul_dvd_mul_iff_left (X_ne_zero (R := ℚ))).mp hXq
  -- q ∈ {1, X²+1}  via  X²+1 irreducible
  obtain ⟨s, hs⟩ := hq_dvd
  rcases charge_poly_irreducible.isUnit_or_isUnit hs with hqu | hsu
  · -- q unit → q = 1 → p = X → chargeOp = 0, contra
    exfalso
    have hq1 : q = 1 := hq_monic.eq_one_of_isUnit hqu
    have hpX : minpoly ℚ chargeOp = X := by rw [hpq, hq1, mul_one]
    have : (aeval chargeOp) (minpoly ℚ chargeOp) = chargeOp := by rw [hpX, aeval_X]
    rw [minpoly.aeval] at this
    exact chargeOp_ne_zero this.symm
  · -- s unit → q ~ᵤ X²+1 → q = X²+1 (both monic) → p = X·(X²+1) = X³+X
    have hassoc : Associated q (X ^ 2 + 1 : ℚ[X]) := by
      rw [hs]; exact associated_mul_unit_right q s hsu
    have hqeq : q = (X ^ 2 + 1 : ℚ[X]) :=
      eq_of_monic_of_associated hq_monic chargeOpV_monic_wit hassoc
    rw [hpq, hqeq, ← cube_factor]

end

end Phys.Algebra
