import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.Alternative

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42cSum
noncomputable section

def JO : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := u1 * x
  map_add' x y := CD.mul_add_na u1 x y
  map_smul' c x := by show u1 * (c • x) = c • (u1 * x); ext <;> simp [u1] <;> ring

@[simp] theorem JO_apply (x : O ℚ) : JO x = u1 * x := rfl

-- U = span{e2,e4,e6}.  JU = span{e3,e5,-e7} = span{e3,e5,e7}.
-- The FULL 6-family as Fin 6 in the "complex basis" order {e2,e3,e4,e5,e6,e7} = imgUnit (banked).
-- V = span imgUnit (dim 6, banked). Goal: V = span{e2,e4,e6} ⊔ J(span{e2,e4,e6}).

def Usub : Submodule ℚ (O ℚ) := Submodule.span ℚ (Set.range (![e2O, e4O, e6O] : Fin 3 → O ℚ))
def Vsub : Submodule ℚ (O ℚ) := Submodule.span ℚ (Set.range imgUnit)

-- J e2 = e3 ∈ V, J e4 = e5 ∈ V, J e6 = -e7 ∈ V.  So J maps U into V, and U ⊆ V.
-- U ⊔ J(U) = V  (dimension 3+3=6, both inside V).

-- (a) U ≤ V:
example : Usub ≤ Vsub := by
  rw [Usub, Vsub, Submodule.span_le]
  intro x hx
  rw [Set.range_subset_iff] at *
  simp only [Set.mem_range, SetLike.mem_coe] at hx ⊢
  obtain ⟨i, rfl⟩ := hx
  fin_cases i
  · exact Submodule.subset_span ⟨0, rfl⟩   -- e2 = imgUnit 0
  · exact Submodule.subset_span ⟨2, rfl⟩   -- e4 = imgUnit 2
  · exact Submodule.subset_span ⟨4, rfl⟩   -- e6 = imgUnit 4

-- (b) The map J restricted to V lands in V (V is J-invariant). Need J e_k ∈ V for k=2..7.
example : JO e2O ∈ Vsub := by
  rw [Vsub]; show u1 * e2O ∈ _
  have : u1 * e2O = e3O := by ext <;> simp [u1, e2O, e3O]
  rw [this]; exact Submodule.subset_span ⟨1, rfl⟩

end
end N42cSum
