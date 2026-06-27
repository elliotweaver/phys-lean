import Phys.Algebra.LorentzContinuumAlgClosure
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Normal.Closure
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.RingTheory.AdjoinRoot

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Polynomial

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

theorem cuti_isAlgClosed_probe : IsAlgClosed Cuti := by
  apply IsAlgClosed.of_exists_root
  intro p hmon hirr
  haveI : Fact (Irreducible p) := ⟨hirr⟩
  -- K := AdjoinRoot p, finite over Cuti and over Cut
  let K := AdjoinRoot p
  haveI : FiniteDimensional Cuti K :=
    (AdjoinRoot.powerBasis hirr.ne_zero).finite
  haveI : FiniteDimensional Cut Cuti := Module.finite_of_finrank_eq_succ cuti_finrank_eq_two
  haveI : FiniteDimensional Cut K := FiniteDimensional.trans Cut Cuti K
  -- Ω = AlgebraicClosure K, algebraic & Galois over Cut
  let Ω := AlgebraicClosure K
  haveI h1 : Algebra.IsAlgebraic Cut K := Algebra.IsAlgebraic.of_finite Cut K
  haveI : Algebra.IsAlgebraic Cut Ω := Algebra.IsAlgebraic.trans Cut K Ω
  haveI : IsGalois Cut Ω := IsAlgClosure.isGalois Cut Ω
  -- M = normal closure of K over Cut: finite Galois over Cut
  let M := IntermediateField.normalClosure Cut K Ω
  haveI : FiniteDimensional Cut M := normalClosure.is_finiteDimensional Cut K Ω
  haveI : IsGalois Cut M := IsGalois.normalClosure Cut K Ω
  -- M carries Algebra K M and IsScalarTower Cut K M (normalClosure instances)
  -- build Algebra Cuti M via Cuti → K → M, with no diamond on Algebra Cut M
  letI algCutiM : Algebra Cuti M := ((algebraMap K M).comp (algebraMap Cuti K)).toAlgebra
  haveI towCutiKM : IsScalarTower Cuti K M := IsScalarTower.of_algebraMap_eq (fun _ => rfl)
  haveI towCutCutiM : IsScalarTower Cut Cuti M := by
    apply IsScalarTower.of_algebraMap_eq
    intro x
    -- algebraMap Cut M = algebraMap K M ∘ algebraMap Cut K = algebraMap K M ∘ algebraMap Cuti K ∘ algebraMap Cut Cuti
    have e1 : algebraMap Cut M x = algebraMap K M (algebraMap Cut K x) :=
      IsScalarTower.algebraMap_apply Cut K M x
    have e2 : algebraMap Cut K x = algebraMap Cuti K (algebraMap Cut Cuti x) :=
      IsScalarTower.algebraMap_apply Cut Cuti K x
    rw [e1, e2]
    rfl
  haveI : FiniteDimensional Cuti M := Module.Finite.right Cut Cuti M
  haveI : IsGalois Cuti M := IsGalois.tower_top_of_isGalois Cut Cuti M
  -- finrank arithmetic: 2^n over Cut, factor out the degree-2 Cuti
  obtain ⟨n, hn⟩ := cut_galois_finrank_two_power M
  have htower2 : Module.finrank Cut Cuti * Module.finrank Cuti M = Module.finrank Cut M :=
    Module.finrank_mul_finrank Cut Cuti M
  rw [cuti_finrank_eq_two, hn] at htower2  -- 2 * finrank Cuti M = 2^n
  -- finrank Cuti M positive ⟹ n ≥ 1
  have hpos : 0 < Module.finrank Cuti M := Module.finrank_pos
  have hn1 : 1 ≤ n := by
    rcases Nat.eq_zero_or_pos n with h0 | hp
    · rw [h0, pow_zero] at htower2; omega
    · exact hp
  have hfr_cuti : Module.finrank Cuti M = 2 ^ (n - 1) := by
    have : 2 * Module.finrank Cuti M = 2 * 2 ^ (n - 1) := by
      rw [htower2, ← pow_succ']; congr 1; omega
    exact Nat.eq_of_mul_eq_mul_left (by norm_num) this
  -- brick D: a 2-group Galois ext of Cuti is trivial
  have hexp0 : n - 1 = 0 := cuti_galois_two_group_trivial M (n - 1) hfr_cuti
  have hMone : Module.finrank Cuti M = 1 := by rw [hfr_cuti, hexp0, pow_zero]
  -- Cuti → K → M tower: finrank Cuti K ∣ finrank Cuti M = 1
  have htowerK : Module.finrank Cuti K * Module.finrank K M = Module.finrank Cuti M :=
    Module.finrank_mul_finrank Cuti K M
  rw [hMone] at htowerK
  have hKone : Module.finrank Cuti K = 1 := Nat.eq_one_of_mul_eq_one_right htowerK
  -- finrank Cuti (AdjoinRoot p) = natDegree p
  have hdeg : (AdjoinRoot.powerBasis hirr.ne_zero).dim = Module.finrank Cuti K :=
    (AdjoinRoot.powerBasis hirr.ne_zero).finrank.symm
  rw [hKone, AdjoinRoot.powerBasis_dim hirr.ne_zero] at hdeg
  -- natDegree p = 1 ⟹ p has a root
  have hp1 : p.natDegree = 1 := hdeg
  -- monic degree-1 polynomial p = X + C (p.coeff 0); root is -(p.coeff 0)
  have hpform : p = X + C (p.coeff 0) := by
    have h := eq_X_add_C_of_natDegree_le_one (p := p) (by omega)
    have hlc : p.coeff 1 = 1 := by
      have := hmon.coeff_natDegree; rwa [hp1] at this
    rw [hlc, C_1, one_mul] at h
    exact h
  refine ⟨-(p.coeff 0), ?_⟩
  rw [hpform]; simp

end
end Phys.Algebra
