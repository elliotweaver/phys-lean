import Phys.Algebra.TowerGatherForcedChargeSplitting
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.LinearAlgebra.Eigenspace.Minpoly
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

theorem chargeOpV_aeval : (aeval chargeOpV) (X^2 + 1 : ℚ[X]) = 0 := by
  have h : chargeOpV * chargeOpV = -1 := by
    rw [show chargeOpV * chargeOpV = chargeOpV.comp chargeOpV from rfl, chargeOpV_sq]; rfl
  rw [map_add, map_pow, aeval_X, map_one, sq, h]; abel

theorem chargeOpV_monic_wit : (X^2 + 1 : ℚ[X]).Monic := by monicity!

-- Nontrivial Vsub (6-dim) → Nontrivial End
theorem nontrivial_Vsub : Nontrivial (Vsub) :=
  FiniteDimensional.nontrivial_of_finrank_pos (by rw [finrank_Vsub]; norm_num)

-- Irreducibility of X²+1 over ℚ — via cyclotomic 4
example : (cyclotomic 4 ℚ) = X^2 + 1 := by
  have : cyclotomic 4 ℚ = cyclotomic (2^2) ℚ := by norm_num
  rw [this, cyclotomic_prime_pow_eq_geom_sum (R := ℚ) Nat.prime_two]
  sorry

example : Irreducible (cyclotomic 4 ℚ) := cyclotomic.irreducible_rat (by norm_num)

-- candidate degree-2 no-root lemmas
#check @Polynomial.irreducible_of_degree_le_three_of_not_isRoot
end
end Phys.Algebra
