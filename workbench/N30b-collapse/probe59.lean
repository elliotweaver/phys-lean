import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
-- SCALAR BRANCH: if every a∈A_I is a ℚ-scalar and I is an atom, then I = ⊥.
example (I : LieIdeal ℚ derivationLieQ) (hI : IsAtom I)
    (hscal : ∀ a : (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))),
        ∃ c : ℚ, (a : Module.End ℚ ImO) = c • LinearMap.id) : I = ⊥ := by
  -- generator membership
  have hgen : ∀ x : I, imRep (I.incl x) ∈
      Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x))) :=
    fun x => Algebra.subset_adjoin ⟨x, rfl⟩
  -- each generator is a scalar
  have hgenscal : ∀ x : I, ∃ c : ℚ, imRep (I.incl x) = c • LinearMap.id := by
    intro x
    obtain ⟨c, hc⟩ := hscal ⟨imRep (I.incl x), hgen x⟩
    exact ⟨c, hc⟩
  -- the Lie hom f := imRep ∘ I.incl : ↥I → End ℚ ImO
  let f : I →ₗ⁅ℚ⁆ Module.End ℚ ImO := imRep.comp I.incl
  have hf_app : ∀ x : I, f x = imRep (I.incl x) := fun x => rfl
  -- f kills brackets (scalars commute)
  have hf_brak : ∀ a b : I, f ⁅a, b⁆ = 0 := by
    intro a b
    rw [LieHom.map_lie]
    obtain ⟨ca, hca⟩ := hgenscal a
    obtain ⟨cb, hcb⟩ := hgenscal b
    rw [hf_app, hf_app, hca, hcb]
    -- ⁅ca•id, cb•id⁆ = 0
    rw [Ring.lie_def]
    simp [smul_smul, mul_comm]
  -- ⁅⊤,⊤⁆ ≤ f.ker
  have hker : (⁅(⊤ : LieIdeal ℚ I), (⊤ : LieIdeal ℚ I)⁆ : LieIdeal ℚ I) ≤ f.ker := by
    rw [LieSubmodule.lie_le_iff]
    intro a _ b _
    rw [LieHom.mem_ker]
    exact hf_brak a b
  -- atom perfect: ⁅⊤,⊤⁆ = ⊤
  have hperf : (⁅(⊤ : LieIdeal ℚ I), (⊤ : LieIdeal ℚ I)⁆ : LieIdeal ℚ I) = ⊤ :=
    atom_isPerfect I hI
  rw [hperf] at hker
  -- so f = 0 on all of ↥I
  have hf0 : ∀ x : I, imRep (I.incl x) = 0 := by
    intro x
    have : x ∈ f.ker := hker (LieSubmodule.mem_top x)
    rw [LieHom.mem_ker] at this
    rw [← hf_app]; exact this
  -- imRep injective ⟹ I.incl x = 0 ⟹ x = 0
  rw [eq_bot_iff]
  intro y hy
  rw [LieSubmodule.mem_bot]
  have hyzero : imRep (I.incl ⟨y, hy⟩) = 0 := hf0 ⟨y, hy⟩
  have : (I.incl ⟨y, hy⟩ : derivationLieQ) = 0 :=
    (injective_iff_map_eq_zero imRep).mp imRep_injective _ hyzero
  simpa using this

end
end Phys.Algebra
