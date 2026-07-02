import Phys.Algebra.TowerGatherForcedChargeSplitting
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.LinearAlgebra.Eigenspace.Minpoly

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Polynomial
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- (0) crossOpO u1 maps Vsub ONTO Vsub (from N241 map-equalities + N42c sup).
theorem Vsub_map_crossOpO : Vsub.map (crossOpO u1) = Vsub := by
  rw [← Uhol_sup_Uah_eq_Vsub, Submodule.map_sup, Uhol_map_crossOpO_eq_Uah,
      Uah_map_crossOpO_eq_Uhol, sup_comm]

theorem crossOpO_u1_mapsTo_Vsub : ∀ v ∈ Vsub, crossOpO u1 v ∈ Vsub := by
  intro v hv
  have : crossOpO u1 v ∈ Vsub.map (crossOpO u1) := ⟨v, hv, rfl⟩
  rwa [Vsub_map_crossOpO] at this

-- (1) the restricted real charge operator on the derived 6-space V
def chargeOpV : Module.End ℚ Vsub := (crossOpO u1).restrict crossOpO_u1_mapsTo_Vsub

-- coe of the restriction
theorem chargeOpV_coe (v : Vsub) : ((chargeOpV v : Vsub) : O ℚ) = crossOpO u1 (v : O ℚ) := rfl

-- (2) it is a COMPLEX STRUCTURE: chargeOpV² = -id
theorem chargeOpV_sq : chargeOpV.comp chargeOpV = -LinearMap.id := by
  refine LinearMap.ext (fun v => ?_)
  apply Subtype.ext
  show ((chargeOpV (chargeOpV v) : Vsub) : O ℚ) = ((-v : Vsub) : O ℚ)
  rw [chargeOpV_coe, chargeOpV_coe, crossOpO_u1_eq_JO_on_Vsub _ (crossOpO_u1_mapsTo_Vsub _ v.2),
      crossOpO_u1_eq_JO_on_Vsub _ v.2, JO_JO]
  rfl

-- (3) it satisfies X²+1
theorem chargeOpV_aeval : (aeval chargeOpV) (X^2 + 1 : ℚ[X]) = 0 := by
  rw [map_add, map_pow, aeval_X, map_one, ← LinearMap.comp_eq_mul, chargeOpV_sq]
  abel

-- (4) X²+1 is irreducible over ℚ
example : Irreducible (X^2 + 1 : ℚ[X]) := by
  have h := Polynomial.Monic.irreducible_of_irreducible_map (f := (Int.castRingHom ℚ))
  sorry

-- (4b) simpler: minpoly is X²+1 because it divides it, is monic, nonconstant
example : (X^2 + 1 : ℚ[X]).Monic := by monicity!

-- (5) can we even name minpoly of chargeOpV?
#check minpoly ℚ chargeOpV
#check @minpoly.eq_of_irreducible_of_monic

end
end Phys.Algebra
