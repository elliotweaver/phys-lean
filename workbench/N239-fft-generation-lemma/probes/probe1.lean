/-
  N239 probe1 — MEASURE the minpoly field-tower core for `End_{g₂}(ImO) = ℚ`
  (absolute irreducibility of the fundamental 7).

  Target lemma being measured (not yet the production statement):
    every `T : End ℚ ImO` commuting with `imRep D` for all `D ∈ derivationLieQ`
    is a ℚ-scalar `c • 1`.

  Route: K := ℚ[T] = Algebra.adjoin ℚ {T}. T ∈ commutant. ImO A-simple (A = adjoin range imRep,
  via no_proper_invariant_ImO). D := End_A ImO division ring, T ∈ D, ℚ[T] a field.
  dim_ℚ ImO = dim_ℚ K · dim_K ImO ⟹ dim_ℚ K | 7 ⟹ dim_ℚ K ∈ {1,7}. 7 ⟹ imRep(g₂) ⊆ K
  commutative ⟹ g₂ abelian, contra derivationLieQ_not_lieAbelian. So dim K = 1, T scalar.

  This probe ONLY measures the tractability of the pieces — expect sorries at first.
-/
import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.RingTheory.SimpleModule.Basic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- MEASURE (1): does `Module.finrank_mul_finrank` elaborate as a field tower over ℚ?
    Abstract: for a field K that is a ℚ-algebra and a K-module V, dim_ℚ V = dim_ℚ K * dim_K V. -/
example (K : Type*) [Field K] [Algebra ℚ K] (V : Type*) [AddCommGroup V] [Module ℚ V]
    [Module K V] [IsScalarTower ℚ K V] :
    Module.finrank ℚ K * Module.finrank K V = Module.finrank ℚ V :=
  Module.finrank_mul_finrank ℚ K V

/-- MEASURE (2): the intrinsic-ImO irreducibility (no proper A-submodule) — can we get
    `IsSimpleModule` for the adjoin of the imRep image? First: an A-submodule of ↥ImO is
    an imRep-invariant subspace. -/
-- We test: any imRep-invariant subspace N of ↥ImO (0<dim<7) is impossible, transported
-- from no_proper_invariant_ImO. This is the intrinsic-ImO analogue.
example (N : Submodule ℚ ImO)
    (hNinv : ∀ (D : derivationLieQ) (x : ImO), x ∈ N → imRep D x ∈ N)
    (hd0 : 0 < Module.finrank ℚ N) (hd7 : Module.finrank ℚ N < 7) : False := by
  -- push N forward to O ℚ
  set W : Submodule ℚ (O ℚ) := N.map ImO.subtype with hWdef
  have hWle : W ≤ ImO := by rw [hWdef]; rintro _ ⟨x, _, rfl⟩; exact x.2
  have hfW : Module.finrank ℚ W = Module.finrank ℚ N :=
    (Submodule.equivMapOfInjective ImO.subtype ImO.injective_subtype N).finrank_eq.symm
  have hWinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W → (D : Module.End ℚ (O ℚ)) x ∈ W := by
    intro D x hx
    rw [hWdef, Submodule.mem_map] at hx ⊢
    obtain ⟨a, haN, rfl⟩ := hx
    refine ⟨imRep D a, hNinv D a haN, ?_⟩
    exact (imRep_coe D a).symm
  exact no_proper_invariant_ImO W hWle hWinv (by rw [hfW]; exact hd0) (by rw [hfW]; exact hd7)

end

end Phys.Algebra
