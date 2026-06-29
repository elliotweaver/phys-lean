import Phys.Algebra.LorentzContinuumRotationPathConnected
import Phys.Algebra.LorentzContinuumGenerationConversePolar

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- (copy of the assembly engine for the probe)
theorem joined_id_of_factor_paths
    (p k : Module.End Cut STVC)
    (β : Cut → Module.End Cut STVC) (hβ : Continuous β) {b0 b1 : Cut}
    (hβ0 : β b0 = 1) (hβ1 : β b1 = p)
    (κ : Cut → Module.End Cut STVC) (hκ : Continuous κ) {k0 k1 : Cut}
    (hκ0 : κ k0 = 1) (hκ1 : κ k1 = k) :
    ∃ Conn : Set (Module.End Cut STVC),
      IsPreconnected Conn ∧
      (1 : Module.End Cut STVC) ∈ Conn ∧
      k * p ∈ Conn := by
  set A := β '' (Set.uIcc b0 b1) with hA
  have hApre : IsPreconnected A := (isPreconnected_uIcc).image _ hβ.continuousOn
  have h1A : (1 : Module.End Cut STVC) ∈ A := ⟨b0, Set.left_mem_uIcc, hβ0⟩
  have hpA : p ∈ A := ⟨b1, Set.right_mem_uIcc, hβ1⟩
  set B := (fun t => κ t * p) '' (Set.uIcc k0 k1) with hB
  have hBcont : Continuous (fun t => κ t * p) := continuous_mul_right_path p κ hκ
  have hBpre : IsPreconnected B := (isPreconnected_uIcc).image _ hBcont.continuousOn
  have hpB : p ∈ B := ⟨k0, Set.left_mem_uIcc, by simp only [hκ0, one_mul]⟩
  have hkpB : k * p ∈ B := ⟨k1, Set.right_mem_uIcc, by simp only [hκ1]⟩
  refine ⟨A ∪ B, hApre.union p hpA hpB hBpre, Set.mem_union_left _ h1A, Set.mem_union_right _ hkpB⟩

-- PROBE B: THE FULL REDUCTION. An arbitrary BvC-isometry lies in a preconnected set with id,
-- PROVIDED its polar compact factor is path-joined to id (the single residual: compact-group
-- path-connectedness). Uses N130 polar decomp + N152 boost path + the assembly engine.
theorem bvIsom_joined_id_of_compact_joined {S : Module.End Cut STVC} (hS : IsBvIsomLin S)
    (hcompact : ∀ k : Module.End Cut STVC, IsQvIsomC k →
       ∃ (κ : Cut → Module.End Cut STVC) (k0 k1 : Cut),
         Continuous κ ∧ κ k0 = 1 ∧ κ k1 = k) :
    ∃ Conn : Set (Module.End Cut STVC),
      IsPreconnected Conn ∧
      (1 : Module.End Cut STVC) ∈ Conn ∧
      S ∈ Conn := by
  obtain ⟨h, n, c, u, γ, hhS, hγeq, hγ0, hγ1sqrt, hsymm, hpos, hk_isom, hkS⟩ :=
    bvIsomLin_polar_path_decomp hS
  -- the compact factor
  set k := S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) with hkdef
  -- the boost factor p := γ 1
  set p := γ 1 with hpdef
  -- the residual: k is path-joined to id
  obtain ⟨κ, k0, k1, hκcont, hκ0, hκ1⟩ := hcompact k hk_isom
  -- boost path is continuous (N152), β 0 = id, β 1 = p
  have hβcont : Continuous γ := by rw [hγeq]; exact specPathOp_cont c u
  have hβ0 : γ 0 = (1 : Module.End Cut STVC) := by rw [hγ0, Module.End.one_eq_id]
  have hβ1 : γ 1 = p := rfl
  obtain ⟨Conn, hConnpre, h1, hkp⟩ :=
    joined_id_of_factor_paths p k γ hβcont hβ0 hβ1 κ hκcont hκ0 hκ1
  refine ⟨Conn, hConnpre, h1, ?_⟩
  -- k * p = S
  have : k * p = S := by rw [hpdef, hkdef, ← Module.End.mul_eq_comp] at hkS; exact hkS
  rwa [this] at hkp

end

end Phys.Algebra
