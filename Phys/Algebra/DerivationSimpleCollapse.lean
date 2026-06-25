import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

namespace Phys.Algebra.Collapse

/-! ## GENERIC LAYER — abstract `A : Subalgebra ℚ (End ℚ V)` (fast typeclass synthesis).

    The concrete `A_I = Algebra.adjoin ℚ (imRep '' I)` makes typeclass synthesis blow up
    (measured: `SMul A_I ↥ImO` times out), so the structure-theorem content is proved here
    over an ABSTRACT subalgebra and instantiated at `A_I` only at the very end. -/

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

omit [FiniteDimensional ℚ V] in
/-- ★ THE COMMUTANT MAP. An operator `T : End ℚ V` that commutes with every generator in `S`
    commutes with all of `A = Algebra.adjoin ℚ S`, hence is `A`-linear: it defines an element
    of `End A V` (the commutant). This is the lever that lands the action of a COMMUTING ideal
    `J` in the commutant of `A_I`. -/
def commutantHom (S : Set (Module.End ℚ V)) (T : Module.End ℚ V)
    (hT : ∀ s ∈ S, Commute T s) : V →ₗ[Algebra.adjoin ℚ S] V where
  toFun := T
  map_add' := T.map_add
  map_smul' := by
    intro a x
    have hc : Commute T (a : Module.End ℚ V) :=
      Algebra.commute_of_mem_adjoin_of_forall_mem_commute a.2 hT
    show T ((a : Module.End ℚ V) x) = (a : Module.End ℚ V) (T x)
    have h2 : (T * (a : Module.End ℚ V)) x = ((a : Module.End ℚ V) * T) x := by rw [hc]
    simpa [Module.End.mul_apply] using h2

omit [FiniteDimensional ℚ V] in
@[simp] theorem commutantHom_apply (S : Set (Module.End ℚ V)) (T : Module.End ℚ V)
    (hT : ∀ s ∈ S, Commute T s) (x : V) : commutantHom S T hT x = T x := rfl

/-- The ℚ-dimension count for an `A`-linear iso `V ≃ₗ[A] (Fin n → S)`: descending to ℚ,
    `dim_ℚ V = n · dim_ℚ S`. -/
theorem finrank_of_linearEquiv_fun (A : Subalgebra ℚ (Module.End ℚ V)) (n : ℕ)
    (S : Submodule A V) (e : V ≃ₗ[A] (Fin n → S)) :
    Module.finrank ℚ V = n * Module.finrank ℚ S := by
  haveI hfd : FiniteDimensional ℚ S := by
    have h : FiniteDimensional ℚ (S.restrictScalars ℚ) := inferInstance; exact h
  haveI : Module.Free ℚ S := Module.Free.of_divisionRing ℚ S
  let eℚ : V ≃ₗ[ℚ] (Fin n → S) := e.restrictScalars ℚ
  rw [eℚ.finrank_eq, Module.finrank_pi_fintype ℚ]
  simp [Finset.sum_const, Finset.card_univ]

/-- ★★ THE GENERIC PRIME-DIMENSION STRUCTURE THEOREM. For a finite-dimensional ℚ-space `V`
    whose ℚ-dimension is PRIME, that is a SEMISIMPLE `A`-module (`A` a subalgebra of `End ℚ V`)
    in which every FULLY-INVARIANT `A`-submodule is `⊥` or `⊤`, the module is `A`-ISOTYPIC and
    splits as `V ≃ₗ[A] Fin n → S` (`S` a simple `A`-submodule) with EITHER
      • `n = p`, `dim_ℚ S = 1`  (the module is a sum of `p` one-dimensional copies — characters), OR
      • `n = 1`, `dim_ℚ S = p`  (the module is itself `A`-simple — the Schur branch).
    The prime dimension forbids any intermediate split. This is the Mathlib-absent structure
    theorem (W1 BUILD) the simplicity collapse runs on, proved entirely over an abstract `A`. -/
theorem isotypic_prime_split (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) :
    ∃ (n : ℕ) (S : Submodule A V), IsSimpleModule A S ∧ Nonempty (V ≃ₗ[A] (Fin n → S)) ∧
      ((n = p ∧ Module.finrank ℚ S = 1) ∨ (n = 1 ∧ Module.finrank ℚ S = p)) := by
  haveI := hss
  haveI : Module.Finite A V := Module.Finite.of_restrictScalars_finite ℚ A V
  -- V is nontrivial: dim = p ≥ 2 > 0.
  haveI hnt : Nontrivial V := by
    have hpos : 0 < Module.finrank ℚ V := by rw [hdim]; exact hp.pos
    exact Module.nontrivial_of_finrank_pos hpos
  -- the dichotomy gives isotypy
  have hiso : IsIsotypic A V := isIsotypic_iff_isFullyInvariant_imp_bot_or_top.mpr hdich
  obtain ⟨n, hne, S, hSsimple, ⟨e⟩⟩ := hiso.linearEquiv_fun
  refine ⟨n, S, hSsimple, ⟨e⟩, ?_⟩
  -- dimension count
  have hcount : p = n * Module.finrank ℚ S := by
    rw [← hdim]; exact finrank_of_linearEquiv_fun A n S e
  -- n ∣ p, so n = 1 or n = p
  have hndvd : n ∣ p := ⟨Module.finrank ℚ S, hcount⟩
  rcases (Nat.Prime.eq_one_or_self_of_dvd hp n hndvd) with hn1 | hnp
  · -- n = 1 ⟹ dim S = p
    right
    refine ⟨hn1, ?_⟩
    rw [hn1, one_mul] at hcount; omega
  · -- n = p ⟹ dim S = 1
    left
    refine ⟨hnp, ?_⟩
    rw [hnp] at hcount
    have hppos : 0 < p := hp.pos
    -- p = p * dim S ⟹ dim S = 1
    have : p * 1 = p * Module.finrank ℚ S := by rw [mul_one]; exact hcount
    have := Nat.eq_of_mul_eq_mul_left hppos this
    omega

end Phys.Algebra.Collapse

end
