import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance 2000] Module.Free.of_divisionRing
noncomputable section

def restrictOp (W : Submodule ℚ (O ℚ))
    (hWinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W → (D : Module.End ℚ (O ℚ)) x ∈ W)
    (D : derivationLieQ) : Module.End ℚ W :=
  (D : Module.End ℚ (O ℚ)).restrict (fun x hx => hWinv D x hx)

theorem restrictOp_skew (W : Submodule ℚ (O ℚ))
    (hWinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W → (D : Module.End ℚ (O ℚ)) x ∈ W)
    (D : derivationLieQ) :
    (gBil.restrict W).IsSkewAdjoint (restrictOp W hWinv D) := by
  intro x y
  show (gBil.restrict W) (restrictOp W hWinv D x) y
    = (gBil.restrict W) x ((-(restrictOp W hWinv D)) y)
  simp only [BilinForm.restrict_apply, LinearMap.neg_apply]
  show gForm ((D:Module.End ℚ (O ℚ)) (x:O ℚ)) (y:O ℚ)
    = gForm (x:O ℚ) (-((D:Module.End ℚ (O ℚ)) (y:O ℚ)))
  have hsk := gFormQ_skew (D:Module.End ℚ (O ℚ)) D.2 (x:O ℚ) (y:O ℚ)
  have hneg : gForm (x:O ℚ) (-((D:Module.End ℚ (O ℚ)) (y:O ℚ)))
      = - gForm (x:O ℚ) ((D:Module.End ℚ (O ℚ)) (y:O ℚ)) := by
    simp only [gForm, star_neg, mul_neg, reQ_neg]
  rw [hneg]; linarith

def restrictToSkew (W : Submodule ℚ (O ℚ))
    (hWinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W → (D : Module.End ℚ (O ℚ)) x ∈ W) :
    derivationLieQ →ₗ[ℚ] (gBil.restrict W).skewAdjointSubmodule where
  toFun D := ⟨restrictOp W hWinv D, (LinearMap.mem_skewAdjointSubmodule _).mpr
    (restrictOp_skew W hWinv D)⟩
  map_add' := by
    intro D E; apply Subtype.ext; apply LinearMap.ext; intro x; apply Subtype.ext
    show ((D:Module.End ℚ (O ℚ)) + (E:Module.End ℚ (O ℚ))) (x:O ℚ)
      = (D:Module.End ℚ (O ℚ)) (x:O ℚ) + (E:Module.End ℚ (O ℚ)) (x:O ℚ)
    rfl
  map_smul' := by
    intro c D; apply Subtype.ext; apply LinearMap.ext; intro x; apply Subtype.ext
    show (c • (D:Module.End ℚ (O ℚ))) (x:O ℚ) = c • (D:Module.End ℚ (O ℚ)) (x:O ℚ)
    rfl

/-- The restricted Born form on an invariant subspace W ≤ ImO is symmetric & nondegenerate. -/
theorem gBil_restrict_symm (W : Submodule ℚ (O ℚ)) : (gBil.restrict W).IsSymm := by
  rw [BilinForm.isSymm_def]; intro x y
  show gForm (x:O ℚ) (y:O ℚ) = gForm (y:O ℚ) (x:O ℚ)
  exact gForm_symm _ _

/-- The dimension of the skew-adjoint operators of the restricted Born form on W
    is ≤ C(finrank W, 2). -/
theorem finrank_restrictSkew_le (W : Submodule ℚ (O ℚ)) :
    Module.finrank ℚ (gBil.restrict W).skewAdjointSubmodule ≤ (Module.finrank ℚ W).choose 2 :=
  finrank_skewAdjoint_le_choose (gBil.restrict W) (gBil_restrict_symm W)
    (gBil_restrict_nondegenerate W)

/-- ★★ NO PROPER NONZERO INVARIANT SUBSPACE of `ImO`: an invariant `W ≤ ImO` with
    `0 < dim W < 7` cannot exist. The Born-orthogonal complement `W'` (within `ImO`,
    also invariant) splits `ImO = W ⊕ W'`, `derivationLieQ` injects into
    `skew(Φ|W) × skew(Φ|W')` by faithfulness, forcing `14 ≤ C(d,2)+C(7−d,2) ≤ 11 < 14`. -/
theorem no_proper_invariant_ImO (W : Submodule ℚ (O ℚ)) (hWle : W ≤ ImO)
    (hWinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W → (D : Module.End ℚ (O ℚ)) x ∈ W)
    (hd0 : 0 < Module.finrank ℚ W) (hd7 : Module.finrank ℚ W < 7) : False := by
  set W' := gBil.orthogonal W ⊓ ImO with hW'def
  have hW'inv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W' → (D : Module.End ℚ (O ℚ)) x ∈ W' := by
    intro D x hx
    rw [hW'def, Submodule.mem_inf] at hx ⊢
    exact ⟨deriv_mapsTo_orthogonal (D:Module.End ℚ (O ℚ)) D.2 (fun n hn => hWinv D n hn) hx.1,
      derivLieQ_mapsTo D x hx.2⟩
  have hsup : W ⊔ W' = ImO := by
    rw [hW'def, ← sup_inf_assoc_of_le _ hWle, (isCompl_gBil_orthogonal W).sup_eq_top, top_inf_eq]
  have hdisj : Disjoint W W' :=
    (isCompl_gBil_orthogonal W).disjoint.mono_right inf_le_left
  -- dim W + dim W' = 7
  have hdimsum : Module.finrank ℚ W + Module.finrank ℚ W' = 7 := by
    have key := Submodule.finrank_sup_add_finrank_inf_eq W W'
    rw [hsup, finrank_ImO, disjoint_iff.mp hdisj, finrank_bot, add_zero] at key
    omega
  -- The injection derivationLieQ → skew(Φ|W) × skew(Φ|W') by faithfulness.
  let F : derivationLieQ →ₗ[ℚ]
      ((gBil.restrict W).skewAdjointSubmodule × (gBil.restrict W').skewAdjointSubmodule) :=
    (restrictToSkew W hWinv).prod (restrictToSkew W' hW'inv)
  have hFinj : Function.Injective F := by
    rw [injective_iff_map_eq_zero]
    intro D hD
    have h1 : restrictToSkew W hWinv D = 0 := (Prod.ext_iff.mp hD).1
    have h2 : restrictToSkew W' hW'inv D = 0 := (Prod.ext_iff.mp hD).2
    -- D kills W and W', hence ImO = W ⊔ W'; then imRep_injective ⟹ D = 0
    have hkillW : ∀ y ∈ W, (D:Module.End ℚ (O ℚ)) y = 0 := by
      intro y hy
      have := congrArg (fun (t : (gBil.restrict W).skewAdjointSubmodule) =>
        ((t : Module.End ℚ W) ⟨y, hy⟩ : W)) h1
      simpa [restrictToSkew, restrictOp, LinearMap.restrict_apply] using
        congrArg (Subtype.val) this
    have hkillW' : ∀ y ∈ W', (D:Module.End ℚ (O ℚ)) y = 0 := by
      intro y hy
      have := congrArg (fun (t : (gBil.restrict W').skewAdjointSubmodule) =>
        ((t : Module.End ℚ W') ⟨y, hy⟩ : W')) h2
      simpa [restrictToSkew, restrictOp, LinearMap.restrict_apply] using
        congrArg (Subtype.val) this
    have hkillImO : ∀ y ∈ ImO, (D:Module.End ℚ (O ℚ)) y = 0 := by
      intro y hy
      rw [← hsup, Submodule.mem_sup] at hy
      obtain ⟨a, ha, b, hb, rfl⟩ := hy
      rw [map_add, hkillW a ha, hkillW' b hb, add_zero]
    -- imRep D = 0 ⟹ D = 0
    have hImRep : imRep D = 0 := by
      apply LinearMap.ext; intro x
      apply Subtype.ext
      show (D:Module.End ℚ (O ℚ)) (x:O ℚ) = 0
      exact hkillImO x x.2
    exact (injective_iff_map_eq_zero imRep).mp imRep_injective D hImRep
  -- 14 = dim derivationLieQ ≤ dim(skew W × skew W') ≤ C(d,2)+C(7-d,2)
  have h14 : Module.finrank ℚ derivationLieQ.toSubmodule = 14 := finrank_derivationQ_eq_14
  have hle := LinearMap.finrank_le_finrank_of_injective hFinj
  haveI : Module.Free ℚ (gBil.restrict W).skewAdjointSubmodule :=
    Module.Free.of_divisionRing ℚ (gBil.restrict W).skewAdjointSubmodule
  haveI : Module.Free ℚ (gBil.restrict W').skewAdjointSubmodule :=
    Module.Free.of_divisionRing ℚ (gBil.restrict W').skewAdjointSubmodule
  rw [Module.finrank_prod] at hle
  have hb1 := finrank_restrictSkew_le W
  have hb2 := finrank_restrictSkew_le W'
  have hfin : (14 : ℕ) ≤ (Module.finrank ℚ W).choose 2 + (Module.finrank ℚ W').choose 2 := by
    calc (14:ℕ) = Module.finrank ℚ derivationLieQ.toSubmodule := h14.symm
    _ ≤ Module.finrank ℚ (gBil.restrict W).skewAdjointSubmodule
        + Module.finrank ℚ (gBil.restrict W').skewAdjointSubmodule := hle
    _ ≤ (Module.finrank ℚ W).choose 2 + (Module.finrank ℚ W').choose 2 := Nat.add_le_add hb1 hb2
  -- d ∈ {1,...,6}. d=1: W is a 1-dim invariant; d=6: W' is a 1-dim invariant;
  -- d∈{2,3,4,5}: the count 14 ≤ C(d,2)+C(7-d,2) is false (11,9,9,11).
  obtain ⟨d, hd⟩ : ∃ d, Module.finrank ℚ W = d := ⟨_, rfl⟩
  have hd'7 : Module.finrank ℚ W' = 7 - d := by omega
  rw [hd, hd'7] at hfin
  rw [hd] at hd0 hd7
  interval_cases d
  · exact no_one_dim_invariant_ImO W hWle hd (fun D hD x hx => hWinv ⟨D, hD⟩ x hx)
  · revert hfin; decide
  · revert hfin; decide
  · revert hfin; decide
  · revert hfin; decide
  · exact no_one_dim_invariant_ImO W' inf_le_right (by omega)
      (fun D hD x hx => hW'inv ⟨D, hD⟩ x hx)

end
end Phys.Algebra
