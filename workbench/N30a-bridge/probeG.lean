import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.Tactic

open LinearMap (BilinForm)

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

-- L2 (generic)
theorem skewAdjoint_mapsTo_orthogonal (B : BilinForm K V) (hsymm : B.IsSymm)
    (N : Submodule K V) (T : Module.End K V) (hskew : B.IsSkewAdjoint T)
    (hN : ∀ n ∈ N, T n ∈ N) {x : V} (hx : x ∈ B.orthogonal N) :
    T x ∈ B.orthogonal N := by
  have hsymmeq : ∀ a b : V, B a b = B b a := by
    intro a b; have := hsymm.eq a b; simpa using this
  rw [BilinForm.mem_orthogonal_iff]; intro n hn; rw [BilinForm.isOrtho_def]
  have hxortho : B (T n) x = 0 := by
    have : B.IsOrtho (T n) x := (BilinForm.mem_orthogonal_iff.mp hx) (T n) (hN n hn)
    rwa [BilinForm.isOrtho_def] at this
  calc B n (T x) = B (T x) n := hsymmeq n (T x)
    _ = B x ((-T) n) := hskew x n
    _ = B x (-(T n)) := by rw [LinearMap.neg_apply]
    _ = -(B x (T n)) := by rw [map_neg]
    _ = -(B (T n) x) := by rw [hsymmeq x (T n)]
    _ = 0 := by rw [hxortho, neg_zero]

-- L3 (generic)
theorem adjoin_stable_orthogonal (B : BilinForm K V) (hsymm : B.IsSymm)
    (S : Set (Module.End K V)) (hS : ∀ T ∈ S, B.IsSkewAdjoint T)
    (P : Submodule (Algebra.adjoin K S) V) (a : Module.End K V)
    (ha : a ∈ Algebra.adjoin K S) {x : V}
    (hx : x ∈ B.orthogonal (P.restrictScalars K)) :
    a x ∈ B.orthogonal (P.restrictScalars K) := by
  have hbase : ∀ T ∈ S, ∀ y ∈ B.orthogonal (P.restrictScalars K),
      T y ∈ B.orthogonal (P.restrictScalars K) := by
    intro T hT y hy
    have hTA : T ∈ Algebra.adjoin K S := Algebra.subset_adjoin hT
    have hpres : ∀ n ∈ P.restrictScalars K, T n ∈ P.restrictScalars K := by
      intro n hn
      have : (⟨T, hTA⟩ : Algebra.adjoin K S) • n ∈ P := P.smul_mem ⟨T, hTA⟩ hn
      simpa [Submodule.restrictScalars_mem] using this
    exact skewAdjoint_mapsTo_orthogonal B hsymm (P.restrictScalars K) T (hS T hT) hpres hy
  refine Algebra.adjoin_induction
    (p := fun b _ => ∀ z ∈ B.orthogonal (P.restrictScalars K),
      b z ∈ B.orthogonal (P.restrictScalars K))
    ?_ ?_ ?_ ?_ ha x hx
  · intro T hT z hz; exact hbase T hT z hz
  · intro r z hz
    have heq : (algebraMap K (Module.End K V) r) z = r • z := by
      simp [Algebra.algebraMap_eq_smul_one]
    rw [heq]; exact (B.orthogonal (P.restrictScalars K)).smul_mem r hz
  · intro f g _ _ hf hg z hz
    show (f + g) z ∈ B.orthogonal (P.restrictScalars K)
    rw [LinearMap.add_apply]
    exact (B.orthogonal (P.restrictScalars K)).add_mem (hf z hz) (hg z hz)
  · intro f g _ _ hf hg z hz
    show (f * g) z ∈ B.orthogonal (P.restrictScalars K)
    rw [Module.End.mul_apply]; exact hf _ (hg z hz)

-- L4a (generic)
theorem isCompl_of_restrictScalars (A : Subalgebra K (Module.End K V))
    (P P' : Submodule A V)
    (h : IsCompl (P.restrictScalars K) (P'.restrictScalars K)) : IsCompl P P' := by
  have hinj := Submodule.restrictScalars_injective K A V
  constructor
  · rw [disjoint_iff]; apply hinj
    rw [Submodule.restrictScalars_inf, Submodule.restrictScalars_bot]
    exact disjoint_iff.mp h.disjoint
  · rw [codisjoint_iff]; apply hinj
    rw [Submodule.restrictScalars_sup, Submodule.restrictScalars_top]
    exact codisjoint_iff.mp h.codisjoint

-- the A-submodule built from the A-stable orthogonal carrier
def orthogonalASubmodule (B : BilinForm K V) (hsymm : B.IsSymm)
    (S : Set (Module.End K V)) (hS : ∀ T ∈ S, B.IsSkewAdjoint T)
    (P : Submodule (Algebra.adjoin K S) V) : Submodule (Algebra.adjoin K S) V where
  carrier := B.orthogonal (P.restrictScalars K)
  add_mem' := (B.orthogonal (P.restrictScalars K)).add_mem
  zero_mem' := (B.orthogonal (P.restrictScalars K)).zero_mem
  smul_mem' := fun a x hx => adjoin_stable_orthogonal B hsymm S hS P (a : Module.End K V) a.2 hx

-- L4 (generic): THE BRIDGE. ComplementedLattice / IsSemisimpleModule.
theorem isSemisimpleModule_adjoin (B : BilinForm K V) (hsymm : B.IsSymm)
    (hrefl : B.IsRefl) (hnd : ∀ W : Submodule K V, (B.restrict W).Nondegenerate)
    (S : Set (Module.End K V)) (hS : ∀ T ∈ S, B.IsSkewAdjoint T) :
    IsSemisimpleModule (Algebra.adjoin K S) V := by
  have hcl : ComplementedLattice (Submodule (Algebra.adjoin K S) V) := by
    rw [complementedLattice_iff]
    intro P
    refine ⟨orthogonalASubmodule B hsymm S hS P, ?_⟩
    apply isCompl_of_restrictScalars
    have hcarrier : (orthogonalASubmodule B hsymm S hS P).restrictScalars K
        = B.orthogonal (P.restrictScalars K) := rfl
    rw [hcarrier]
    exact B.isCompl_orthogonal_of_restrict_nondegenerate hrefl (hnd (P.restrictScalars K))
  exact ⟨⟩
