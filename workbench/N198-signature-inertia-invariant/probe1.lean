import Phys.Algebra.SpacetimeSignature
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- A subspace is TIMELIKE (positive-definite) if Qv > 0 off the origin. -/
def IsTimelikeSub (W : Submodule ℚ STV) : Prop := ∀ w ∈ W, w ≠ 0 → 0 < Qv w

/-- A subspace is SPACELIKE (negative-definite) if Qv < 0 off the origin. -/
def IsSpacelikeSub (W : Submodule ℚ STV) : Prop := ∀ w ∈ W, w ≠ 0 → Qv w < 0

theorem timeSub_timelike : IsTimelikeSub timeSub := fun _ hw hne => Qv_pos_on_time hw hne

theorem spaceSub_spacelike : IsSpacelikeSub spaceSub := fun _ hw hne => Qv_neg_on_space hw hne

theorem timelike_inf_spaceSub_eq_bot {W : Submodule ℚ STV} (hW : IsTimelikeSub W) :
    W ⊓ spaceSub = ⊥ := by
  rw [eq_bot_iff]
  intro w hw
  rw [Submodule.mem_bot]
  by_contra hne
  obtain ⟨hwW, hwS⟩ := hw
  exact absurd (hW w hwW hne) (not_lt.mpr (le_of_lt (Qv_neg_on_space hwS hne)))

theorem spacelike_inf_timeSub_eq_bot {W : Submodule ℚ STV} (hW : IsSpacelikeSub W) :
    W ⊓ timeSub = ⊥ := by
  rw [eq_bot_iff]
  intro w hw
  rw [Submodule.mem_bot]
  by_contra hne
  obtain ⟨hwW, hwT⟩ := hw
  exact absurd (hW w hwW hne) (not_lt.mpr (le_of_lt (Qv_pos_on_time hwT hne)))

theorem timelike_index_le_one {W : Submodule ℚ STV} (hW : IsTimelikeSub W) :
    Module.finrank ℚ W ≤ 1 := by
  have hinf : W ⊓ spaceSub = ⊥ := timelike_inf_spaceSub_eq_bot hW
  have hkey := Submodule.finrank_sup_add_finrank_inf_eq W spaceSub
  rw [hinf, finrank_bot, add_zero, finrank_spaceSub] at hkey
  have hle : Module.finrank ℚ ↥(W ⊔ spaceSub) ≤ 10 := by
    rw [← finrank_STV]; exact Submodule.finrank_le _
  omega

theorem spacelike_index_le_nine {W : Submodule ℚ STV} (hW : IsSpacelikeSub W) :
    Module.finrank ℚ W ≤ 9 := by
  have hinf : W ⊓ timeSub = ⊥ := spacelike_inf_timeSub_eq_bot hW
  have hkey := Submodule.finrank_sup_add_finrank_inf_eq W timeSub
  rw [hinf, finrank_bot, add_zero, finrank_timeSub] at hkey
  have hle : Module.finrank ℚ ↥(W ⊔ timeSub) ≤ 10 := by
    rw [← finrank_STV]; exact Submodule.finrank_le _
  omega

theorem timelike_index_eq_one :
    IsTimelikeSub timeSub ∧ Module.finrank ℚ timeSub = 1 ∧
      (∀ W : Submodule ℚ STV, IsTimelikeSub W → Module.finrank ℚ W ≤ 1) :=
  ⟨timeSub_timelike, finrank_timeSub, fun _ h => timelike_index_le_one h⟩

theorem spacelike_index_eq_nine :
    IsSpacelikeSub spaceSub ∧ Module.finrank ℚ spaceSub = 9 ∧
      (∀ W : Submodule ℚ STV, IsSpacelikeSub W → Module.finrank ℚ W ≤ 9) :=
  ⟨spaceSub_spacelike, finrank_spaceSub, fun _ h => spacelike_index_le_nine h⟩

theorem signature_inertia_one_nine :
    (IsTimelikeSub timeSub ∧ Module.finrank ℚ timeSub = 1 ∧
      (∀ W : Submodule ℚ STV, IsTimelikeSub W → Module.finrank ℚ W ≤ 1)) ∧
    (IsSpacelikeSub spaceSub ∧ Module.finrank ℚ spaceSub = 9 ∧
      (∀ W : Submodule ℚ STV, IsSpacelikeSub W → Module.finrank ℚ W ≤ 9)) :=
  ⟨timelike_index_eq_one, spacelike_index_eq_nine⟩

theorem timePlusSpace_not_timelike :
    ¬ IsTimelikeSub (Submodule.span ℚ
        {((1 : ℚ), (0 : ℚ), (0 : O ℚ)), ((0 : ℚ), (1 : ℚ), (0 : O ℚ))}) := by
  intro h
  have hmem : ((0 : ℚ), (1 : ℚ), (0 : O ℚ)) ∈ Submodule.span ℚ
      {((1 : ℚ), (0 : ℚ), (0 : O ℚ)), ((0 : ℚ), (1 : ℚ), (0 : O ℚ))} :=
    Submodule.subset_span (by simp)
  have hne : ((0 : ℚ), (1 : ℚ), (0 : O ℚ)) ≠ 0 := by
    intro hc
    have := congrArg (fun p => p.2.1) hc
    simp at this
  have hmemS : ((0 : ℚ), (1 : ℚ), (0 : O ℚ)) ∈ spaceSub := by
    show ((0 : ℚ), (1 : ℚ), (0 : O ℚ)).1 = 0
    rfl
  have hpos := h _ hmem hne
  have hneg := Qv_neg_on_space hmemS hne
  linarith

#print axioms timelike_index_le_one
#print axioms spacelike_index_le_nine
#print axioms signature_inertia_one_nine
#print axioms timePlusSpace_not_timelike

end

end Phys.Algebra
