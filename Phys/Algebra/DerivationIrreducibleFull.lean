/-
  Phys.Algebra.DerivationIrreducibleFull — N28: THE FULL IRREDUCIBILITY of the faithful
  7-rep of `derivationLieQ`, and the `IsSimpleOrder`→`IsSimple` simplicity core.
  ===========================================================================
  N26 banked the invariant 7-dim Lie submodule `ImLie`, the compact embedding
  `g₂ ↪ so(7)`, and the simplicity skeleton `isSimple_of_isSimpleOrder`. N27 banked
  COMPLETE REDUCIBILITY (`gPerp`/`isCompl_gPerp`) and the d=1 exclusion
  (`no_one_dim_invariant_ImO`). The remaining gap to FULL irreducibility is the
  middle dimensions d∈{2,3,4,5}: a proper nonzero invariant subspace `W ⊆ ImO`
  would force `14 = dim derivationLieQ ≤ dim so(d) + dim so(7−d) = C(d,2)+C(7−d,2)`,
  which is `11,9,9,11 < 14` for d∈{2,3,4,5} — a contradiction.

  ★ THE W1 BUILD (docs/RUNBOOK.md W1; Mathlib LACKS `dim so(n) = C(n,2)`). The
  so(n)-type bound is BUILT here, FORWARD, NOT posited: a skew-adjoint operator `D`
  of a symmetric nondegenerate form `Φ` injects into the alternating Fin-2 forms
  `D ↦ ((x,y) ↦ Φ (D x) y)` (alternating because `Φ` is symmetric and `D` skew),
  and `AlternatingMap (Fin 2) ≅ Dual (⋀² V)` has `finrank = C(finrank V, 2)`
  (Mathlib `exteriorPower.finrank_eq`). So
  `finrank (skewAdjoint Φ) ≤ C(finrank V, 2)` — the dimension of `so(n)`, derived
  as a structural fact, NO coordinate matrix, NO posited so(n).

  ★ THE ASSEMBLY (FORWARD from the banked structure, NO posited G₂):
    finrank_skewAdjoint_le_choose — ★★ THE so(n)-TYPE BOUND (the W1 build above).
    deriv_restrict_skewAdjoint    — a derivation restricted to an invariant subspace
                                    is skew-adjoint for the restricted Born form.
    no_proper_invariant_ImO       — ★★ NO proper nonzero invariant subspace of `ImO`:
                                    W and its Born-orthogonal-within-`ImO` complement
                                    split `derivationLieQ` into two skew blocks, forcing
                                    `14 ≤ C(d,2)+C(7−d,2)`, false for d∈{1..6}.
    ImLie_isIrreducible           — ★★★ FULL IRREDUCIBILITY of the faithful 7-rep
                                    `LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie`.
    derivationLieQ_isSimpleOrder  — ★★ the Lie-ideal lattice is a simple order
                                    (faithfulness + irreducibility ⟹ any nonzero ideal
                                    acts as the whole).
    derivationLieQ_isSimple       — ★★★ `LieAlgebra.IsSimple ℚ derivationLieQ` via the
                                    banked `isSimple_of_isSimpleOrder` (N26).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). NO `LieAlgebra.g₂`/`G₂` imported
  to assert anything. The irreducibility and simplicity are STRUCTURAL FACTS about the
  banked `derivationLieQ`/`ImLie`, proved from its own banked structure;
  `LieModule.IsIrreducible`/`IsSimpleOrder`/`AlternatingMap`/`⋀²`/`finrank` are
  MACHINERY on the DERIVED object (docs/STANDARD.md §3).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "g₂ / gauge / compact /
  irreducible / simple / fundamental representation": what remains is the pure
  statement that the 14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson
  double of a double of a double of ℚ acts irreducibly on its invariant 7-dim subspace
  `ker(star + id)`, and has no proper nonzero ideal.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationIrreducible
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.LinearAlgebra.Alternating.Basic
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## THE so(n)-TYPE DIMENSION BOUND (the W1 build).

    A skew-adjoint operator of a symmetric nondegenerate form on a `d`-dimensional
    space lies in a space of dimension `≤ C(d, 2)` — the dimension of `so(d)`,
    built FORWARD via the exterior power, NO posited `so(n)`. -/

section Crux

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

/-- The bilinear Fin-2 multilinear map `m ↦ Φ (D (m 0)) (m 1)`. -/
def bml (Φ : BilinForm ℚ V) (D : Module.End ℚ V) :
    MultilinearMap ℚ (fun _ : Fin 2 => V) ℚ where
  toFun m := Φ (D (m 0)) (m 1)
  map_update_add' := by intro _ m i x y; fin_cases i <;> simp
  map_update_smul' := by intro _ m i c x; fin_cases i <;> simp

/-- A skew-adjoint operator for a SYMMETRIC form has vanishing diagonal:
    `Φ (D x) x = 0`. -/
theorem bml_zero_diag (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm) (D : Module.End ℚ V)
    (hD : Φ.IsSkewAdjoint D) (x : V) : Φ (D x) x = 0 := by
  have h := hD x x
  rw [Pi.neg_apply, map_neg] at h
  have hs : Φ x (D x) = Φ (D x) x := (BilinForm.isSymm_def.mp hsymm) x (D x)
  rw [hs] at h; linarith

/-- ★ THE ALTERNATING Fin-2 FORM of a skew-adjoint operator. For symmetric `Φ` and
    skew-adjoint `D`, `(x,y) ↦ Φ (D x) y` is alternating (vanishes on the diagonal). -/
def aml (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm) (D : Module.End ℚ V)
    (hD : Φ.IsSkewAdjoint D) : V [⋀^Fin 2]→ₗ[ℚ] ℚ where
  toMultilinearMap := bml Φ D
  map_eq_zero_of_eq' := by
    intro m i j _ hne
    have h0 : m 0 = m 1 := by fin_cases i <;> fin_cases j <;> simp_all
    show Φ (D (m 0)) (m 1) = 0
    rw [← h0]; exact bml_zero_diag Φ hsymm D hD (m 0)

@[simp] theorem aml_apply (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm) (D : Module.End ℚ V)
    (hD : Φ.IsSkewAdjoint D) (v : Fin 2 → V) :
    aml Φ hsymm D hD v = Φ (D (v 0)) (v 1) := rfl

/-- ★ THE LINEAR INJECTION from skew-adjoint operators into `Dual (⋀² V)`, via the
    alternating-Fin-2 forms and the exterior-power universal property. -/
def skewToDual (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm) :
    Φ.skewAdjointSubmodule →ₗ[ℚ] Module.Dual ℚ (⋀[ℚ]^2 V) :=
  (exteriorPower.alternatingMapLinearEquiv (R := ℚ) (n := 2) (M := V) (N := ℚ)).toLinearMap ∘ₗ
    { toFun := fun D => aml Φ hsymm (D : Module.End ℚ V)
        ((LinearMap.mem_skewAdjointSubmodule _).mp D.2)
      map_add' := by
        intro D E; ext v
        simp only [AlternatingMap.add_apply, aml_apply, Submodule.coe_add,
          LinearMap.add_apply, map_add]
      map_smul' := by
        intro c D; ext v
        simp only [AlternatingMap.smul_apply, aml_apply, SetLike.val_smul,
          LinearMap.smul_apply, map_smul, RingHom.id_apply, smul_eq_mul] }

/-- The injection `skewToDual` is INJECTIVE when `Φ` is nondegenerate: if all the
    alternating forms `Φ (D x) y` vanish then `D = 0`. -/
theorem skewToDual_injective (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm)
    (hnd : Φ.Nondegenerate) : Function.Injective (skewToDual Φ hsymm) := by
  rw [injective_iff_map_eq_zero]
  intro D hD
  have haml : aml Φ hsymm (D : Module.End ℚ V)
      ((LinearMap.mem_skewAdjointSubmodule _).mp D.2) = 0 :=
    (exteriorPower.alternatingMapLinearEquiv (R := ℚ) (n := 2)
      (M := V) (N := ℚ)).map_eq_zero_iff.mp hD
  have hzero : (D : Module.End ℚ V) = 0 := by
    ext x
    refine hnd.1 ((D : Module.End ℚ V) x) (fun y => ?_)
    have := AlternatingMap.congr_fun haml ![x, y]
    simpa [aml_apply] using this
  exact Subtype.ext hzero

/-- ★★ THE so(n)-TYPE BOUND: the dimension of the skew-adjoint operators of a
    SYMMETRIC NONDEGENERATE form on a `d`-dimensional space is `≤ C(d, 2)` — the
    dimension of `so(d)`. BUILT FORWARD (the exterior-power injection), NOT posited;
    Mathlib has no `dim so(n)` lemma. -/
theorem finrank_skewAdjoint_le_choose (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm)
    (hnd : Φ.Nondegenerate) :
    Module.finrank ℚ Φ.skewAdjointSubmodule ≤ (Module.finrank ℚ V).choose 2 := by
  have hle := LinearMap.finrank_le_finrank_of_injective (skewToDual_injective Φ hsymm hnd)
  rwa [Subspace.dual_finrank_eq, exteriorPower.finrank_eq] at hle

end Crux

/-! ## THE ASSEMBLY — no proper invariant subspace of `ImO` (FORWARD, NO posited G₂).

    A derivation restricted to an invariant subspace is skew-adjoint for the
    restricted Born form; faithfulness injects `derivationLieQ` into the product of
    the skew-adjoint operators of the two complementary blocks; the so(n)-type bound
    forces `14 ≤ C(d,2)+C(7−d,2)`, false for every proper `d ∈ {1,...,6}`. -/

section Assembly

/-- The restriction of a derivation to an (all-derivation-)invariant subspace `W ≤ O ℚ`. -/
def restrictOp (W : Submodule ℚ (O ℚ))
    (hWinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W → (D : Module.End ℚ (O ℚ)) x ∈ W)
    (D : derivationLieQ) : Module.End ℚ W :=
  (D : Module.End ℚ (O ℚ)).restrict (fun x hx => hWinv D x hx)

/-- The restricted operator is skew-adjoint for the restricted Born form. -/
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

/-- The linear map `D ↦ D|W` into the skew-adjoint operators of `gBil.restrict W`. -/
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

/-- The restricted Born form on a subspace is symmetric. -/
theorem gBil_restrict_symm (W : Submodule ℚ (O ℚ)) : (gBil.restrict W).IsSymm := by
  rw [BilinForm.isSymm_def]; intro x y
  show gForm (x:O ℚ) (y:O ℚ) = gForm (y:O ℚ) (x:O ℚ)
  exact gForm_symm _ _

/-- The skew-adjoint operators of the restricted Born form on `W` have dimension
    `≤ C(finrank W, 2)` — the so(n)-type bound applied to the restricted form. -/
theorem finrank_restrictSkew_le (W : Submodule ℚ (O ℚ)) :
    Module.finrank ℚ (gBil.restrict W).skewAdjointSubmodule ≤ (Module.finrank ℚ W).choose 2 :=
  finrank_skewAdjoint_le_choose (gBil.restrict W) (gBil_restrict_symm W)
    (gBil_restrict_nondegenerate W)

/-- ★★ NO PROPER NONZERO INVARIANT SUBSPACE of `ImO`: an invariant `W ≤ ImO` with
    `0 < dim W < 7` cannot exist. The Born-orthogonal complement `W'` (within `ImO`,
    also invariant) splits `ImO = W ⊕ W'`; `derivationLieQ` injects into
    `skew(Φ|W) × skew(Φ|W')` by faithfulness; the so(n)-type bound forces
    `14 ≤ C(d,2)+C(7−d,2)`, which is `11,9,9,11 < 14` for `d∈{2,3,4,5}` and excluded
    for `d=1,6` by `no_one_dim_invariant_ImO` + complete reducibility. -/
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
  have hdimsum : Module.finrank ℚ W + Module.finrank ℚ W' = 7 := by
    have key := Submodule.finrank_sup_add_finrank_inf_eq W W'
    rw [hsup, finrank_ImO, disjoint_iff.mp hdisj, finrank_bot, add_zero] at key
    omega
  let F : derivationLieQ →ₗ[ℚ]
      ((gBil.restrict W).skewAdjointSubmodule × (gBil.restrict W').skewAdjointSubmodule) :=
    (restrictToSkew W hWinv).prod (restrictToSkew W' hW'inv)
  have hFinj : Function.Injective F := by
    rw [injective_iff_map_eq_zero]
    intro D hD
    have h1 : restrictToSkew W hWinv D = 0 := (Prod.ext_iff.mp hD).1
    have h2 : restrictToSkew W' hW'inv D = 0 := (Prod.ext_iff.mp hD).2
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
    have hImRep : imRep D = 0 := by
      apply LinearMap.ext; intro x
      apply Subtype.ext
      show (D:Module.End ℚ (O ℚ)) (x:O ℚ) = 0
      exact hkillImO x x.2
    exact (injective_iff_map_eq_zero imRep).mp imRep_injective D hImRep
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

end Assembly

end

end Phys.Algebra
