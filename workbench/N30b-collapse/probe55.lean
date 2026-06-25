import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
-- THE hdich PROBE v2: a fully-invariant A_I-submodule of ImO is ⊥ or ⊤.
example (I : LieIdeal ℚ derivationLieQ)
    (N : Submodule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO)
    (hN : N.IsFullyInvariant) : N = ⊥ ∨ N = ⊤ := by
  -- generator membership
  have hincl_mem : ∀ x : I, (I.incl x : derivationLieQ) ∈ I := fun x => x.2
  have hgen : ∀ x : I, imRep (I.incl x) ∈
      Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x))) :=
    fun x => Algebra.subset_adjoin ⟨x, rfl⟩
  -- W := image of N in O ℚ
  set W : Submodule ℚ (O ℚ) := (N.restrictScalars ℚ).map ImO.subtype with hWdef
  have hWle : W ≤ ImO := by rintro _ ⟨z, _, rfl⟩; exact z.2
  -- N stable under generators imRep (I.incl x)
  have hNstab_I : ∀ (x : I) (v : ImO), v ∈ N → imRep (I.incl x) v ∈ N := by
    intro x v hv
    have hsmul := N.smul_mem
      (⟨imRep (I.incl x), hgen x⟩ :
        Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) hv
    exact hsmul
  -- N stable under any A_I-linear f via full-invariance
  have hNstab_fi : ∀ (f : ImO →ₗ[Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))] ImO)
      (v : ImO), v ∈ N → f v ∈ N := by
    intro f v hv
    have := hN f hv
    rwa [Submodule.mem_comap] at this
  -- ⁅I,Iᶜ⁆=⊥
  have hbrak : (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) = ⊥ := by
    rw [eq_bot_iff]
    calc (⁅I, Iᶜ⁆ : LieIdeal ℚ derivationLieQ) ≤ I ⊓ Iᶜ :=
          le_inf (LieSubmodule.lie_le_left I Iᶜ) (LieSubmodule.lie_le_right Iᶜ I)
      _ = ⊥ := inf_compl_eq_bot
  -- imRep b (b∈Iᶜ) commutes with every generator
  have hJcomm : ∀ (b : derivationLieQ), b ∈ (Iᶜ : LieIdeal ℚ derivationLieQ) →
      ∀ s ∈ (Set.range (fun x : I => imRep (I.incl x))), Commute (imRep b) s := by
    intro b hb s hs
    obtain ⟨x, rfl⟩ := hs
    have hlz : (⁅(I.incl x : derivationLieQ), b⁆ : derivationLieQ) = 0 := by
      have hmem : (⁅(I.incl x : derivationLieQ), b⁆ : derivationLieQ)
          ∈ (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) :=
        LieSubmodule.lie_mem_lie (hincl_mem x) hb
      rw [hbrak, LieSubmodule.mem_bot] at hmem; exact hmem
    exact (imRep_commute_of_lie_zero (I.incl x) b hlz).symm
  -- N stable under imRep b for b∈Iᶜ
  have hNstab_J : ∀ (b : derivationLieQ), b ∈ (Iᶜ : LieIdeal ℚ derivationLieQ) →
      ∀ (v : ImO), v ∈ N → imRep b v ∈ N := by
    intro b hb v hv
    exact hNstab_fi (Phys.Algebra.Collapse.commutantHom
      (Set.range (fun x : I => imRep (I.incl x))) (imRep b) (hJcomm b hb)) v hv
  -- W is invariant under FULL derivationLieQ
  have hWinv : ∀ (D : derivationLieQ) (y : O ℚ), y ∈ W → (D : Module.End ℚ (O ℚ)) y ∈ W := by
    intro D y hy
    obtain ⟨z, hzN, rfl⟩ := hy
    have hsup : I ⊔ (Iᶜ : LieIdeal ℚ derivationLieQ) = ⊤ := sup_compl_eq_top
    have hmemD : D ∈ (⊤ : LieIdeal ℚ derivationLieQ) := trivial
    rw [← hsup, ← LieSubmodule.mem_toSubmodule, LieSubmodule.sup_toSubmodule,
      Submodule.mem_sup] at hmemD
    obtain ⟨a, ha, b, hb, hab⟩ := hmemD
    have ha_stab : imRep a z ∈ N := by
      have := hNstab_I ⟨a, ha⟩ z hzN
      rwa [show (I.incl ⟨a, ha⟩ : derivationLieQ) = a from rfl] at this
    have hb_stab : imRep b z ∈ N := hNstab_J b hb z hzN
    have himD : imRep D = imRep a + imRep b := by rw [← hab, map_add]
    refine ⟨imRep a z + imRep b z, N.add_mem ha_stab hb_stab, ?_⟩
    calc ((imRep a z + imRep b z : ImO) : O ℚ)
        = ((imRep D z : ImO) : O ℚ) := by rw [himD]; rfl
      _ = (D : Module.End ℚ (O ℚ)) (z : O ℚ) := imRep_coe D z
  -- ⊥ or ⊤ via no_proper_invariant_ImO
  by_contra hcon
  rw [not_or] at hcon
  obtain ⟨hNbot, hNtop⟩ := hcon
  -- dim W = dim (N.restrictScalars ℚ), with 0 < · < 7
  have hWNq : Module.finrank ℚ W = Module.finrank ℚ (N.restrictScalars ℚ) :=
    (Submodule.equivMapOfInjective ImO.subtype Subtype.val_injective
      (N.restrictScalars ℚ)).finrank_eq.symm
  have hNqbot : (N.restrictScalars ℚ) ≠ ⊥ := by
    intro h; exact hNbot (by rwa [Submodule.restrictScalars_eq_bot_iff] at h)
  have hNqtop : (N.restrictScalars ℚ) ≠ ⊤ := by
    intro h; exact hNtop (by rwa [Submodule.restrictScalars_eq_top_iff] at h)
  have hd0 : 0 < Module.finrank ℚ W := by
    rw [hWNq]; have := (Submodule.one_le_finrank_iff (S := N.restrictScalars ℚ)).mpr hNqbot; omega
  have hd7 : Module.finrank ℚ W < 7 := by
    rw [hWNq]; have hlt := Submodule.finrank_lt (s := N.restrictScalars ℚ) hNqtop
    rwa [finrank_ImO] at hlt
  exact no_proper_invariant_ImO W hWle hWinv hd0 hd7

end
end Phys.Algebra
