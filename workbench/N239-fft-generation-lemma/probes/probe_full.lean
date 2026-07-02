/-
  N239 probe_full — FULL ASSEMBLY of absolute irreducibility of the fundamental 7:
    every `T : End ℚ ImO` commuting with every `imRep D` is a ℚ-scalar `c • 1`.
  I.e. `End_{g₂}(V₇) = ℚ` (the degree-2 g₂ FFT count `dim (V₇⊗V₇)^{g₂} = 1`), the required
  `d_i = 1` (division-algebra-trivial) ingredient of the FFT partition over ℚ.
-/
import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.RingTheory.Adjoin.Field
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.Algebra.Algebra.Subalgebra.Centralizer
import Mathlib.LinearAlgebra.Dimension.FreeAndStrongRankCondition

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Submodule
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000
set_option maxHeartbeats 800000
noncomputable section

/-- Any imRep-invariant subspace of `ImO` (`0 < dim < 7`) is impossible (N28 transported). -/
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

/-- Any imRep-invariant subspace of `ImO` is `⊥` or `⊤` (prime dimension 7). -/
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

/-- If `a` commutes with every `imRep D`, its kernel is imRep-invariant. -/
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

/-- MAIN: absolute irreducibility of the fundamental 7. Any `T : End ℚ ImO` commuting with every
    `imRep D` is a ℚ-scalar. Equivalently `End_{g₂}(V₇) = ℚ`. -/
theorem fundamental7_absolutely_irreducible (T : Module.End ℚ ImO)
    (hT : ∀ D : derivationLieQ, Commute T (imRep D)) :
    ∃ c : ℚ, T = c • (1 : Module.End ℚ ImO) := by
  -- The centralizer of the imRep image, a subalgebra containing T.
  set Cset : Set (Module.End ℚ ImO) := Set.range (fun D : derivationLieQ => imRep D) with hCset
  set C : Subalgebra ℚ (Module.End ℚ ImO) := Subalgebra.centralizer ℚ Cset with hCdef
  have hTC : T ∈ C := by
    rw [hCdef, Subalgebra.mem_centralizer_iff]
    rintro g ⟨D, rfl⟩; exact (hT D).symm
  set K := Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO)) with hKdef
  have hsub : K ≤ C := by
    apply Algebra.adjoin_le; intro x hx
    rw [Set.mem_singleton_iff] at hx; rw [hx]; exact hTC
  -- every element of K commutes with every imRep D
  have hcomm : ∀ (a : K) (D : derivationLieQ), Commute (a : Module.End ℚ ImO) (imRep D) := by
    intro a D
    have haC : (a : Module.End ℚ ImO) ∈ C := hsub a.2
    rw [hCdef, Subalgebra.mem_centralizer_iff] at haC
    have := haC (imRep D) ⟨D, rfl⟩
    rw [Commute, SemiconjBy]; exact this.symm
  -- nonzero elements of K are injective
  have hinj : ∀ (a : K), a ≠ 0 → Function.Injective (a : Module.End ℚ ImO) := by
    intro a ha
    rcases invariant_eq_bot_or_top _ (ker_invariant_of_commute _ (hcomm a)) with h | h
    · exact LinearMap.ker_eq_bot.mp h
    · exfalso; apply ha
      have hz : (a : Module.End ℚ ImO) = 0 := by
        apply LinearMap.ext; intro v
        have : v ∈ LinearMap.ker (a : Module.End ℚ ImO) := by rw [h]; trivial
        rw [LinearMap.mem_ker] at this; simpa using this
      exact Subtype.ext (by simpa using hz)
  -- K is a domain
  haveI hImOnt : Nontrivial ImO := by
    have hpos : 0 < Module.finrank ℚ ImO := by rw [finrank_ImO]; norm_num
    exact Module.finrank_pos_iff.mp hpos
  haveI hKnt : Nontrivial K := by
    refine ⟨0, 1, ?_⟩
    intro h
    have := congrArg (Subtype.val) h
    simp only [ZeroMemClass.coe_zero, OneMemClass.coe_one] at this
    exact zero_ne_one this
  haveI hnzd : NoZeroDivisors K :=
    { eq_zero_or_eq_zero_of_mul_eq_zero := by
        intro a b hab
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
          exact Subtype.ext (by simpa [Subalgebra.coe_zero] using hbval) }
  haveI hKdom : IsDomain K := NoZeroDivisors.to_isDomain K
  letI : Field K := fieldOfFiniteDimensional ℚ K
  -- ImO as a K-module by restriction along K.val
  letI : Module K ImO := Module.compHom ImO (K.val : K →+* Module.End ℚ ImO)
  haveI : IsScalarTower ℚ K ImO := by
    refine ⟨fun c k v => ?_⟩
    show ((c • k).val) v = c • ((k.val) v)
    rw [Subalgebra.coe_smul]; exact (LinearMap.smul_apply c k.val v)
  -- field tower: dim_ℚ K ∣ 7
  have htower := Module.finrank_mul_finrank ℚ K ImO
  rw [finrank_ImO] at htower
  have hdvd : Module.finrank ℚ K ∣ 7 := ⟨Module.finrank K ImO, htower.symm⟩
  -- 7 prime ⟹ dim_ℚ K = 1 or 7
  have h17 : Module.finrank ℚ K = 1 ∨ Module.finrank ℚ K = 7 := by
    have hp : Nat.Prime 7 := by norm_num
    rcases (Nat.Prime.eq_one_or_self_of_dvd hp _ hdvd) with h | h
    · exact Or.inl h
    · exact Or.inr h
  rcases h17 with hd1 | hd7
  · -- dim_ℚ K = 1 ⟹ K = ⊥ ⟹ T = c • 1
    have hbot : K = ⊥ := eq_bot_of_finrank_one hd1
    have hTmem : T ∈ (⊥ : Subalgebra ℚ (Module.End ℚ ImO)) := by
      rw [← hbot]; exact Algebra.self_mem_adjoin_singleton ℚ T
    rw [Algebra.mem_bot] at hTmem
    obtain ⟨c, hc⟩ := hTmem
    exact ⟨c, by rw [← hc]; exact (Algebra.algebraMap_eq_smul_one c)⟩
  · -- dim_ℚ K = 7 ⟹ dim_K ImO = 1 ⟹ each imRep D is K-scalar ⟹ g₂ abelian ⟹ ⊥
    exfalso
    have hdimK1 : Module.finrank K ImO = 1 := by
      rw [hd7] at htower; omega
    -- each imRep D lies in K (as a K-scalar endo)
    have himK : ∀ D : derivationLieQ, ∃ k : K, imRep D = (k : Module.End ℚ ImO) := by
      intro D
      let fK : ImO →ₗ[K] ImO :=
        { toFun := imRep D
          map_add' := (imRep D).map_add
          map_smul' := by
            intro k v
            show imRep D ((k : Module.End ℚ ImO) v) = (k : Module.End ℚ ImO) (imRep D v)
            have := LinearMap.congr_fun ((hcomm k D)).symm v
            simpa [Module.End.mul_apply] using this }
      obtain ⟨c, hc⟩ := (fK.existsUnique_eq_smul_id_of_finrank_eq_one hdimK1)
      refine ⟨c, ?_⟩
      apply LinearMap.ext; intro v
      have := LinearMap.congr_fun hc.1 v
      simp only [LinearMap.smul_apply, LinearMap.id_coe, id_eq] at this
      show imRep D v = (c : Module.End ℚ ImO) v
      have hfKv : fK v = imRep D v := rfl
      rw [← hfKv, this]; rfl
    -- all imRep D commute pairwise (they live in the commutative K)
    have hcommpair : ∀ D D' : derivationLieQ, Commute (imRep D) (imRep D') := by
      intro D D'
      obtain ⟨k, hk⟩ := himK D
      obtain ⟨k', hk'⟩ := himK D'
      rw [hk, hk', Commute, SemiconjBy]
      rw [← Subalgebra.coe_mul, ← Subalgebra.coe_mul, mul_comm]
    -- g₂ is abelian
    apply derivationLieQ_not_lieAbelian
    constructor
    intro D D'
    have hbr : imRep ⁅D, D'⁆ = 0 := by
      rw [LieHom.map_lie]
      have := hcommpair D D'
      rw [Commute, SemiconjBy] at this
      -- ⁅imRep D, imRep D'⁆ = imRep D * imRep D' - imRep D' * imRep D = 0
      show ⁅imRep D, imRep D'⁆ = 0
      rw [Ring.lie_def, this, sub_self]
    exact (injective_iff_map_eq_zero imRep).mp imRep_injective _ hbr

end
end Phys.Algebra
