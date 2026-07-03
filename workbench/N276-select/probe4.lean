import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable def Winert : Submodule ℚ (O ℚ) := Submodule.span ℚ (Set.range (![e4O, e5O] : Fin 2 → O ℚ))
noncomputable def Wactive : Submodule ℚ (O ℚ) := Submodule.span ℚ (Set.range (![e2O, e3O, e6O, e7O] : Fin 4 → O ℚ))

-- Cleaner: Winert ⊔ Wactive = Vsub via span_union + set range equality.
example : Winert ⊔ Wactive = Vsub := by
  rw [Winert, Wactive, Vsub, imgUnit, ← Submodule.span_union]
  congr 1
  apply Set.eq_of_subset_of_subset
  · rintro x (hx | hx) <;> (
      simp only [Set.mem_range] at hx ⊢; obtain ⟨i, rfl⟩ := hx; fin_cases i)
    · exact ⟨2, rfl⟩
    · exact ⟨3, rfl⟩
    · exact ⟨0, rfl⟩
    · exact ⟨1, rfl⟩
    · exact ⟨4, rfl⟩
    · exact ⟨5, rfl⟩
  · rintro x ⟨i, rfl⟩
    fin_cases i
    · exact Or.inr ⟨0, rfl⟩
    · exact Or.inr ⟨1, rfl⟩
    · exact Or.inl ⟨0, rfl⟩
    · exact Or.inl ⟨1, rfl⟩
    · exact Or.inr ⟨2, rfl⟩
    · exact Or.inr ⟨3, rfl⟩

end Phys.Algebra
