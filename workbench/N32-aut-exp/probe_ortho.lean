/-
  N32 W9 PROBE 4b — lock the orthonormality + boundedness route (continuum-free compactness core).
-/
import Phys.Algebra.DerivationAutGroup

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
open scoped BigOperators
noncomputable section

-- find: coordO (bO i) = Pi.single i 1 ?
example (i : Fin 8) : coordO (bO i) = (Pi.single i 1 : Fin 8 → ℚ) := by
  simp only [bO, Module.Basis.coe_ofEquivFun]
  rw [LinearEquiv.apply_symm_apply]

-- orthonormality of the frame: gForm (bO i) (bO j) = if i = j then 1 else 0
example (i j : Fin 8) : gForm (bO i) (bO j) = if i = j then 1 else 0 := by
  rw [← coord_eq_gForm]
  have : coordO (bO i) = (Pi.single i 1 : Fin 8 → ℚ) := by
    simp only [bO, Module.Basis.coe_ofEquivFun]; rw [LinearEquiv.apply_symm_apply]
  rw [this, Pi.single_apply]
  by_cases h : i = j <;> simp [h, eq_comm]

-- boundedness: gForm w w = Σ_j (coordO w j)^2 (rewrite via coord_eq_gForm, generic)
example (w : O ℚ) : gForm w w = ∑ j : Fin 8, (coordO w j)^2 := by
  rw [gForm_self_sum_sq]
  simp only [coordO, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk, Fin.sum_univ_eight]
  simp [Matrix.cons_val]

end
end Phys.Algebra
