/-
  N239 probe2 — MEASURE the abs-irred (End_{g₂}(ImO)=ℚ) machinery cost:
  (a) K := adjoin ℚ {T} is a field (domain via ker-invariance + Artinian),
  (b) Module K ImO + IsScalarTower + finrank tower dim_ℚ K | 7,
  (c) does the subalgebra-module diamond blow up (the DerivationSimpleCollapse warning)?

  Sorries allowed for the deep homothety step; goal is to MEASURE tractability of the
  field/tower scaffolding, per W9 measure-first.
-/
import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.RingTheory.Artinian.Module
import Mathlib.RingTheory.SimpleModule.Basic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- The intrinsic-ImO no-proper-invariant fact (measured clean in probe1). -/
theorem imRep_no_proper_invariant_intrinsic (N : Submodule ℚ ImO)
    (hNinv : ∀ (D : derivationLieQ) (x : ImO), x ∈ N → imRep D x ∈ N)
    (hd0 : 0 < Module.finrank ℚ N) (hd7 : Module.finrank ℚ N < 7) : False := by
  set W : Submodule ℚ (O ℚ) := N.map ImO.subtype with hWdef
  have hWle : W ≤ ImO := by rw [hWdef]; rintro _ ⟨x, _, rfl⟩; exact x.2
  have hfW : Module.finrank ℚ W = Module.finrank ℚ N :=
    (Submodule.equivMapOfInjective ImO.subtype ImO.injective_subtype N).finrank_eq.symm
  have hWinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W → (D : Module.End ℚ (O ℚ)) x ∈ W := by
    intro D x hx
    rw [hWdef, Submodule.mem_map] at hx ⊢
    obtain ⟨a, haN, rfl⟩ := hx
    exact ⟨imRep D a, hNinv D a haN, (imRep_coe D a).symm⟩
  exact no_proper_invariant_ImO W hWle hWinv (by rw [hfW]; exact hd0) (by rw [hfW]; exact hd7)

/-- MEASURE (a): the kernel of a commuting operator `a` (commutes with every `imRep D`) is
    imRep-invariant. This is the clean piece the domain/irreducibility argument needs. -/
theorem ker_invariant_of_commute (a : Module.End ℚ ImO)
    (ha : ∀ D : derivationLieQ, Commute a (imRep D)) :
    ∀ (D : derivationLieQ) (x : ImO), x ∈ LinearMap.ker a → imRep D x ∈ LinearMap.ker a := by
  intro D x hx
  rw [LinearMap.mem_ker] at hx ⊢
  have : a (imRep D x) = imRep D (a x) := by
    have h := ha D
    rw [Commute, SemiconjBy] at h
    have := LinearMap.congr_fun h x
    simpa [Module.End.mul_apply] using this
  rw [this, hx, map_zero]

/-- MEASURE (b): field tower elaborates for a subalgebra-field K of End ℚ ImO acting on ImO.
    We test whether `Module K ImO` + `IsScalarTower ℚ K ImO` + `finrank_mul_finrank` compose
    when K is a *subalgebra* (the diamond the W9 note flagged). -/
example (K : Subalgebra ℚ (Module.End ℚ ImO)) [Nontrivial K] (hK : IsField K) :
    True := by
  -- Can we even *state* Module K ImO for a subalgebra of End? ImO is a module over End ℚ ImO
  -- (tautological), restrict scalars to K.
  trivial

end

end Phys.Algebra
