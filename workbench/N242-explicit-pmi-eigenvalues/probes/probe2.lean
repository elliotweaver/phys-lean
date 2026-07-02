import Phys.Algebra.TowerGatherForcedChargeSplitting
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Polynomial
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

theorem Vsub_map_crossOpO : Vsub.map (crossOpO u1) = Vsub := by
  rw [← Uhol_sup_Uah_eq_Vsub, Submodule.map_sup, Uhol_map_crossOpO_eq_Uah,
      Uah_map_crossOpO_eq_Uhol, sup_comm]

theorem crossOpO_u1_mapsTo_Vsub : ∀ v ∈ Vsub, crossOpO u1 v ∈ Vsub := by
  intro v hv
  have : crossOpO u1 v ∈ Vsub.map (crossOpO u1) := ⟨v, hv, rfl⟩
  rwa [Vsub_map_crossOpO] at this

def chargeOpV : Module.End ℚ Vsub := (crossOpO u1).restrict crossOpO_u1_mapsTo_Vsub

theorem chargeOpV_coe (v : Vsub) : ((chargeOpV v : Vsub) : O ℚ) = crossOpO u1 (v : O ℚ) := rfl

theorem chargeOpV_sq : chargeOpV.comp chargeOpV = -LinearMap.id := by
  refine LinearMap.ext (fun v => ?_)
  apply Subtype.ext
  show ((chargeOpV (chargeOpV v) : Vsub) : O ℚ) = ((-v : Vsub) : O ℚ)
  rw [chargeOpV_coe, chargeOpV_coe, crossOpO_u1_eq_JO_on_Vsub _ (crossOpO_u1_mapsTo_Vsub _ v.2),
      crossOpO_u1_eq_JO_on_Vsub _ v.2, JO_JO]
  rfl

-- (A) aeval closing
theorem chargeOpV_aeval : (aeval chargeOpV) (X^2 + 1 : ℚ[X]) = 0 := by
  have h : chargeOpV * chargeOpV = -1 := by
    rw [show chargeOpV * chargeOpV = chargeOpV.comp chargeOpV from rfl, chargeOpV_sq]; rfl
  rw [map_add, map_pow, aeval_X, map_one, sq, h]; abel

-- (B) IsIntegral witness
theorem chargeOpV_monic_wit : (X^2 + 1 : ℚ[X]).Monic := by monicity!
theorem chargeOpV_integral : IsIntegral ℚ chargeOpV := ⟨X^2 + 1, chargeOpV_monic_wit, chargeOpV_aeval⟩

-- (C) irreducibility of X²+1 over ℚ — route 1: cyclotomic 4
example : (Polynomial.cyclotomic 4 ℚ) = X^2 + 1 := by
  have := Polynomial.cyclotomic_prime_pow_eq_geom_sum (R := ℚ) (p := 2)
  sorry
example : Irreducible (Polynomial.cyclotomic 4 ℚ) := Polynomial.cyclotomic.irreducible_rat (by norm_num)

-- (D) Nontrivial End
example : Nontrivial (Module.End ℚ Vsub) := by infer_instance

-- (E) no rational eigenvalue — elementary
example (μ : ℚ) (hμ : Module.End.HasEigenvalue chargeOpV μ) : False := by
  obtain ⟨v, hv, hne⟩ := hμ.exists_hasEigenvector
  -- hv : chargeOpV v = μ • v
  have h2 : chargeOpV (chargeOpV v) = (μ*μ) • v := by
    rw [hv, map_smul, hv, smul_smul]
  have hsq : chargeOpV (chargeOpV v) = -v := by
    have := chargeOpV_sq
    have := congrArg (fun (f : Module.End ℚ Vsub) => f v) this
    simpa using this
  rw [hsq] at h2
  -- (μ*μ)•v = -v ⟹ (μ*μ+1)•v = 0
  have : (μ*μ + 1) • v = 0 := by
    rw [add_smul, one_smul, ← h2]; abel
  have hnz : (μ*μ + 1) = 0 := by
    by_contra hc
    exact hne (by rwa [smul_eq_zero_iff_left hc] at this)
  nlinarith [mul_self_nonneg μ]

end
end Phys.Algebra
