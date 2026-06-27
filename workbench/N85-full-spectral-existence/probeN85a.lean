import Phys.Algebra.LorentzContinuumSubSeed

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section
open scoped BigOperators
open Polynomial

-- PIECE 1: snoc decomposition of specOpN
theorem specOpN_snoc {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) (μ : Cut) (uk : STVC) :
    specOpN (Fin.snoc l μ) (Fin.snoc u uk) = specOpN l u + μ • projC uk := by
  unfold specOpN
  rw [Fin.sum_univ_castSucc]
  simp only [Fin.snoc_castSucc, Fin.snoc_last]

-- PIECE 2: finrank (W ⊓ uPerp u) = finrank W - 1 for unit u ∈ W
example {W : Submodule Cut STVC} {u : STVC} (hu : EvC u u = 1) (huW : u ∈ W) :
    Module.finrank Cut (W ⊓ uPerp u : Submodule Cut STVC) = Module.finrank Cut W - 1 := by
  -- φ : W →ₗ Cut, p ↦ EvC u p
  set φ : W →ₗ[Cut] Cut := (EvCRight u).comp W.subtype with hφ
  have hsurj : Function.Surjective φ := by
    intro c
    refine ⟨⟨c • u, W.smul_mem c huW⟩, ?_⟩
    show EvC u (c • u) = c
    rw [EvC_smul_right, hu, mul_one]
  have hrn := φ.finrank_range_add_finrank_ker
  have hr : Module.finrank Cut (LinearMap.range φ) = 1 := by
    have h : LinearMap.range φ = ⊤ := LinearMap.range_eq_top.mpr hsurj
    rw [h, finrank_top]; simp
  -- ker φ maps to W ⊓ uPerp u under W.subtype, finrank preserved
  have hmap : Submodule.map W.subtype (LinearMap.ker φ) = W ⊓ uPerp u := by
    ext x
    simp only [Submodule.mem_map, LinearMap.mem_ker, Submodule.mem_inf, mem_uPerp]
    constructor
    · rintro ⟨p, hp, rfl⟩
      exact ⟨p.2, by simpa [hφ, EvCRight] using hp⟩
    · rintro ⟨hxW, hxu⟩
      exact ⟨⟨x, hxW⟩, by simpa [hφ, EvCRight] using hxu, rfl⟩
  have hfeq : Module.finrank Cut (Submodule.map W.subtype (LinearMap.ker φ))
      = Module.finrank Cut (LinearMap.ker φ) := by
    apply LinearEquiv.finrank_eq
    exact (Submodule.equivMapOfInjective W.subtype (Subtype.coe_injective) (LinearMap.ker φ)).symm
  rw [hmap] at hfeq
  rw [hfeq]
  omega

end
end Phys.Algebra
