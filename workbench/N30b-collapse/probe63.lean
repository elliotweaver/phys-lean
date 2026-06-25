import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

-- helper: full nondegeneracy of gBil.restrict ImO (proved in probe62)
theorem gBil_ImO_nondegenerate : (gBil.restrict ImO).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro x hx
    have h0 : gForm ((x : ImO) : O ℚ) ((x : ImO) : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hx x
    exact Subtype.ext (gForm_self_eq_zero.mp h0)
  · intro y hy
    have h0 : gForm ((y : ImO) : O ℚ) ((y : ImO) : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hy y
    exact Subtype.ext (gForm_self_eq_zero.mp h0)

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
-- BRANCH B: if V = ↥ImO is A_I-SIMPLE, then Iᶜ = ⊥
example (I : LieIdeal ℚ derivationLieQ)
    (hsimple : IsSimpleModule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO) :
    (Iᶜ : LieIdeal ℚ derivationLieQ) = ⊥ := by
  classical
  set A := Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x))) with hAdef
  haveI : IsSimpleModule A ImO := hsimple
  -- bracket ⁅I, Iᶜ⁆ = ⊥
  have hbrak : (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) = ⊥ := by
    rw [eq_bot_iff]
    calc (⁅I, Iᶜ⁆ : LieIdeal ℚ derivationLieQ) ≤ I ⊓ Iᶜ :=
          le_inf (LieSubmodule.lie_le_left I Iᶜ) (LieSubmodule.lie_le_right Iᶜ I)
      _ = ⊥ := inf_compl_eq_bot
  rw [eq_bot_iff]
  intro b hb
  rw [LieSubmodule.mem_bot]
  -- imRep b commutes with every generator
  have hcomm : ∀ s ∈ (Set.range (fun x : I => imRep (I.incl x))), Commute (imRep b) s := by
    intro s hs
    obtain ⟨x, rfl⟩ := hs
    have hlz : (⁅(I.incl x : derivationLieQ), b⁆ : derivationLieQ) = 0 := by
      have hmem : (⁅(I.incl x : derivationLieQ), b⁆ : derivationLieQ)
          ∈ (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) :=
        LieSubmodule.lie_mem_lie (x.2) hb
      rw [hbrak, LieSubmodule.mem_bot] at hmem; exact hmem
    exact (imRep_commute_of_lie_zero (I.incl x) b hlz).symm
  -- the commutant element g : ImO →ₗ[A] ImO with the same toFun as imRep b
  set g : ImO →ₗ[A] ImO := Phys.Algebra.Collapse.commutantHom
    (Set.range (fun x : I => imRep (I.incl x))) (imRep b) hcomm with hgdef
  -- imRep b is SINGULAR: skew-adjoint, odd dim 7, nondegenerate
  have hdet : LinearMap.det (imRep b) = 0 :=
    Phys.Algebra.Collapse.skew_odd_det_zero (gBil.restrict ImO) gBil_ImO_nondegenerate
      (imRep b) (imRep_isSkewAdjoint_gImO b) (by rw [finrank_ImO]; decide) (by norm_num)
  -- g = 0 by Schur: g injective ⟹ imRep b injective ⟹ det ≠ 0, contradicting hdet
  have hg0 : g = 0 := by
    by_contra hg
    have hginj : Function.Injective g :=
      LinearMap.injective_of_ne_zero (R := A) (M := ImO) (N := ImO) (f := g) hg
    have hbinj : Function.Injective (imRep b) := by
      intro p q hpq
      apply hginj
      have hgp : g p = imRep b p := Phys.Algebra.Collapse.commutantHom_apply _ _ _ p
      have hgq : g q = imRep b q := Phys.Algebra.Collapse.commutantHom_apply _ _ _ q
      rw [hgp, hgq, hpq]
    have hker : LinearMap.ker (imRep b) = ⊥ := LinearMap.ker_eq_bot.mpr hbinj
    have hu2 : IsUnit (imRep b) := (LinearMap.isUnit_iff_ker_eq_bot _).mpr hker
    have hu3 : IsUnit (LinearMap.det (imRep b)) := (LinearMap.isUnit_iff_isUnit_det _).mp hu2
    rw [hdet] at hu3
    exact not_isUnit_zero hu3
  -- g = 0 ⟹ imRep b = 0
  have hib0 : imRep b = 0 := by
    refine LinearMap.ext (fun x => ?_)
    have h1 : g x = imRep b x := Phys.Algebra.Collapse.commutantHom_apply _ _ _ x
    have h2 : g x = 0 := LinearMap.congr_fun hg0 x
    rw [LinearMap.zero_apply, ← h1, h2]
  -- faithfulness
  exact (injective_iff_map_eq_zero imRep).mp imRep_injective b hib0

end
end Phys.Algebra
