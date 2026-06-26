import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationRep7

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42cDisj
noncomputable section

def JO : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := u1 * x
  map_add' x y := CD.mul_add_na u1 x y
  map_smul' c x := by show u1 * (c • x) = c • (u1 * x); ext <;> simp [u1] <;> ring
@[simp] theorem JO_apply (x : O ℚ) : JO x = u1 * x := rfl

-- Uhol = span{imgUnit 0, 2, 4} = span{e2,e4,e6}; Uah = span{imgUnit 1,3,5} = span{e3,e5,e7}.
def Uhol : Submodule ℚ (O ℚ) := Submodule.span ℚ (imgUnit '' {0, 2, 4})
def Uah : Submodule ℚ (O ℚ) := Submodule.span ℚ (imgUnit '' {1, 3, 5})

-- DISJOINT via the banked imgUnit_indep + disjoint index sets.
theorem Uhol_disj_Uah : Disjoint Uhol Uah := by
  have hd : Disjoint ({0, 2, 4} : Set (Fin 6)) ({1, 3, 5} : Set (Fin 6)) := by
    rw [Set.disjoint_left]; decide
  exact imgUnit_indep.disjoint_span_image hd

-- sup = Vsub = span(range imgUnit), since {0,2,4} ∪ {1,3,5} = univ.
theorem Uhol_sup_Uah : Uhol ⊔ Uah = Submodule.span ℚ (Set.range imgUnit) := by
  rw [Uhol, Uah, ← Submodule.span_union, ← Set.image_union]
  congr 1
  rw [← Set.image_univ]
  congr 1
  ext i; fin_cases i <;> simp <;> decide

-- J swaps: JO e2=e3, JO e4=e5, JO e6=-e7  (Uhol → Uah)
example : JO e2O = e3O := by show u1*e2O = e3O; ext <;> simp [u1,e2O,e3O]
example : JO e4O = e5O := by show u1*e4O = e5O; ext <;> simp [u1,e4O,e5O]
example : JO e6O = -e7O := by show u1*e6O = -e7O; ext <;> simp [u1,e6O,e7O]
-- and back: JO e3=-e2, JO e5=-e4, JO e7=e6  (Uah → Uhol)
example : JO e3O = -e2O := by show u1*e3O = -e2O; ext <;> simp [u1,e2O,e3O]
example : JO e5O = -e4O := by show u1*e5O = -e4O; ext <;> simp [u1,e4O,e5O]
example : JO e7O = e6O := by show u1*e7O = e6O; ext <;> simp [u1,e6O,e7O]

-- finrank Uhol = 3: imgUnit '' {0,2,4} has 3 elements, independent (subfamily).
example : Module.finrank ℚ Uhol = 3 := by
  rw [Uhol]
  have : imgUnit '' {0, 2, 4} = Set.range (fun i : Fin 3 => imgUnit (![0,2,4] i)) := by
    ext x; constructor
    · rintro ⟨j, hj, rfl⟩
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hj
      rcases hj with h|h|h <;> subst h
      · exact ⟨0, rfl⟩
      · exact ⟨1, rfl⟩
      · exact ⟨2, rfl⟩
    · rintro ⟨j, rfl⟩; fin_cases j
      · exact ⟨0, by simp, rfl⟩
      · exact ⟨2, by simp, rfl⟩
      · exact ⟨4, by simp, rfl⟩
  rw [this, finrank_span_eq_card]
  · simp
  · exact imgUnit_indep.comp _ (by intro a b; fin_cases a <;> fin_cases b <;> simp <;> decide)

end
end N42cDisj
