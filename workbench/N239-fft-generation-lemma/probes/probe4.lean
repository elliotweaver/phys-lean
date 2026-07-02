/-
  N239 probe4 — MEASURE the DOMAIN-NESS core of `End_{g₂}(ImO) = ℚ` (abs-irred of the 7).
-/
import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.Algebra.Algebra.Subalgebra.Centralizer
import Mathlib.RingTheory.Adjoin.Basic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000
set_option maxHeartbeats 800000

noncomputable section

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

theorem invariant_eq_bot_or_top (N : Submodule ℚ ImO)
    (hNinv : ∀ (D : derivationLieQ) (x : ImO), x ∈ N → imRep D x ∈ N) :
    N = ⊥ ∨ N = ⊤ := by
  rcases eq_or_ne N ⊥ with h | h
  · exact Or.inl h
  · refine Or.inr ?_
    have hpos : 0 < Module.finrank ℚ N := by
      apply Nat.pos_of_ne_zero
      intro hz
      exact h (Submodule.finrank_eq_zero.mp hz)
    have hle7 : Module.finrank ℚ N ≤ 7 := by
      have := Submodule.finrank_le N
      rwa [finrank_ImO] at this
    rcases lt_or_eq_of_le hle7 with hlt | heq
    · exact absurd (imRep_no_proper_invariant_intrinsic N hNinv hpos hlt) (by simp)
    · exact Submodule.eq_top_of_finrank_eq (by rw [heq, finrank_ImO])

theorem ker_invariant_of_commute (a : Module.End ℚ ImO)
    (ha : ∀ D : derivationLieQ, Commute a (imRep D)) :
    ∀ (D : derivationLieQ) (x : ImO), x ∈ LinearMap.ker a → imRep D x ∈ LinearMap.ker a := by
  intro D x hx
  rw [LinearMap.mem_ker] at hx ⊢
  have h := ha D
  rw [Commute, SemiconjBy] at h
  have := LinearMap.congr_fun h x
  simp only [Module.End.mul_apply] at this
  rw [this, hx, map_zero]

/-- MEASURE the crux: `adjoin ℚ {T}` is a DOMAIN when `T` centralizes the imRep image. -/
example (T : Module.End ℚ ImO)
    (hT : ∀ D : derivationLieQ, Commute T (imRep D)) :
    IsDomain (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))) := by
  set Cset : Set (Module.End ℚ ImO) := Set.range (fun D : derivationLieQ => imRep D) with hCset
  set C : Subalgebra ℚ (Module.End ℚ ImO) := Subalgebra.centralizer ℚ Cset with hCdef
  have hTC : T ∈ C := by
    rw [hCdef, Subalgebra.mem_centralizer_iff]
    rintro g ⟨D, rfl⟩
    exact (hT D).symm
  have hsub : Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO)) ≤ C := by
    apply Algebra.adjoin_le
    intro x hx
    rw [Set.mem_singleton_iff] at hx
    rw [hx]; exact hTC
  have hcomm : ∀ (a : Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO)))
      (D : derivationLieQ), Commute (a : Module.End ℚ ImO) (imRep D) := by
    intro a D
    have haC : (a : Module.End ℚ ImO) ∈ C := hsub a.2
    rw [hCdef, Subalgebra.mem_centralizer_iff] at haC
    have := haC (imRep D) ⟨D, rfl⟩
    rw [Commute, SemiconjBy]; exact this.symm
  have hinj : ∀ (a : Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))), a ≠ 0 →
      Function.Injective (a : Module.End ℚ ImO) := by
    intro a ha
    have hker : LinearMap.ker (a : Module.End ℚ ImO) = ⊥ ∨
        LinearMap.ker (a : Module.End ℚ ImO) = ⊤ :=
      invariant_eq_bot_or_top _ (ker_invariant_of_commute _ (hcomm a))
    rcases hker with h | h
    · exact LinearMap.ker_eq_bot.mp h
    · exfalso; apply ha
      have hz : (a : Module.End ℚ ImO) = 0 := by
        apply LinearMap.ext; intro v
        have : v ∈ LinearMap.ker (a : Module.End ℚ ImO) := by rw [h]; trivial
        rw [LinearMap.mem_ker] at this; simpa using this
      exact Subtype.ext (by simpa using hz)
  haveI : Nontrivial (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))) := by infer_instance
  haveI : NoZeroDivisors (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))) := by
    refine ⟨fun {a b} hab => ?_⟩
    by_cases ha : a = 0
    · exact Or.inl ha
    · refine Or.inr ?_
      have hval : (a : Module.End ℚ ImO) * (b : Module.End ℚ ImO) = 0 := by
        have h := congrArg (Subtype.val) hab
        simpa [Subalgebra.coe_mul, Subalgebra.coe_zero] using h
      have hbval : (b : Module.End ℚ ImO) = 0 := by
        apply LinearMap.ext; intro v
        have hcomp : (a : Module.End ℚ ImO) ((b : Module.End ℚ ImO) v) = 0 := by
          have := LinearMap.congr_fun hval v
          simpa [Module.End.mul_apply] using this
        have heq0 : (a : Module.End ℚ ImO) ((b : Module.End ℚ ImO) v)
            = (a : Module.End ℚ ImO) 0 := by rw [map_zero]; exact hcomp
        exact (hinj a ha) heq0
      exact Subtype.ext (by simpa [Subalgebra.coe_zero] using hbval)
  exact NoZeroDivisors.to_isDomain _

end

end Phys.Algebra
