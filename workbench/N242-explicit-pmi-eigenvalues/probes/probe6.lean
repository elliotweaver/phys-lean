import Phys.Algebra.TowerGatherForcedChargeSplitting
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.LinearAlgebra.Eigenspace.Minpoly
import Mathlib.Algebra.Polynomial.SpecificDegree

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
theorem chargeOpV_integral : IsIntegral ℚ chargeOpV := ⟨X^2 + 1, chargeOpV_monic_wit, chargeOpV_aeval⟩

-- The charge polynomial X²+1 has no rational root: the fold self-overlap positivity q²+1 ≥ 1 > 0
theorem charge_poly_no_root (q : ℚ) : ¬ IsRoot (X^2 + 1 : ℚ[X]) q := by
  simp only [IsRoot, eval_add, eval_pow, eval_X, eval_one]; nlinarith [sq_nonneg q]

theorem charge_poly_natDegree : (X^2 + 1 : ℚ[X]).natDegree = 2 := by compute_degree!

theorem charge_poly_irreducible : Irreducible (X^2 + 1 : ℚ[X]) := by
  apply irreducible_of_degree_le_three_of_not_isRoot (p := (X^2+1 : ℚ[X]))
  · rw [charge_poly_natDegree]; decide
  · exact charge_poly_no_root

-- Nontrivial End Vsub
theorem nontrivial_Vsub : Nontrivial Vsub :=
  Module.nontrivial_of_finrank_pos (by rw [finrank_Vsub]; norm_num : 0 < Module.finrank ℚ (Vsub))

-- THE HEADLINE: minpoly of the restricted charge operator is X²+1
theorem chargeOpV_minpoly : minpoly ℚ chargeOpV = X^2 + 1 := by
  haveI := nontrivial_Vsub
  exact (minpoly.eq_of_irreducible_of_monic charge_poly_irreducible chargeOpV_aeval
    chargeOpV_monic_wit).symm

-- no rational eigenvalue
theorem chargeOpV_no_rational_eigenvalue (μ : ℚ) : ¬ Module.End.HasEigenvalue chargeOpV μ := by
  intro hμ
  have hdvd := (Module.End.hasEigenvalue_iff_isRoot.mp hμ)
  rw [chargeOpV_minpoly] at hdvd
  exact charge_poly_no_root μ hdvd

#check minpoly ℚ chargeOpV
end
end Phys.Algebra
