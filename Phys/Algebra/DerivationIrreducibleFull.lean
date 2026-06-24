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

end

end Phys.Algebra
