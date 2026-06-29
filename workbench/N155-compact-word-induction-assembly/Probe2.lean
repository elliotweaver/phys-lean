import Phys.Algebra.LorentzContinuumPathConnectedFull

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

def JoinedIdC (g : Module.End Cut STVC) : Prop :=
  ∃ Conn : Set (Module.End Cut STVC),
    IsPreconnected Conn ∧ (1 : Module.End Cut STVC) ∈ Conn ∧ g ∈ Conn

theorem joinedIdC_one : JoinedIdC (1 : Module.End Cut STVC) :=
  ⟨{1}, isPreconnected_singleton, rfl, rfl⟩

theorem joinedIdC_mul {a b : Module.End Cut STVC}
    (ha : JoinedIdC a) (hb : JoinedIdC b) : JoinedIdC (a * b) := by
  obtain ⟨A, hApre, h1A, haA⟩ := ha
  obtain ⟨B, hBpre, h1B, hbB⟩ := hb
  set Ab := (fun g => g * b) '' A with hAb
  have hAbcont : Continuous (fun g : Module.End Cut STVC => g * b) := endOpC_mul_right_cont b
  have hAbpre : IsPreconnected Ab := hApre.image _ hAbcont.continuousOn
  have hbAb : b ∈ Ab := ⟨1, h1A, by show (1 : Module.End Cut STVC) * b = b; rw [one_mul]⟩
  have habAb : a * b ∈ Ab := ⟨a, haA, rfl⟩
  refine ⟨B ∪ Ab, hBpre.union b hbB hbAb hAbpre, Set.mem_union_left _ h1B,
    Set.mem_union_right _ habAb⟩

theorem joinedIdC_listProd : ∀ (L : List (Module.End Cut STVC)),
    (∀ g ∈ L, JoinedIdC g) → JoinedIdC L.prod
  | [], _ => by simpa using joinedIdC_one
  | (a :: L), h => by
      rw [List.prod_cons]
      exact joinedIdC_mul (h a (List.mem_cons_self ..))
        (joinedIdC_listProd L (fun g hg => h g (List.mem_cons_of_mem a hg)))

theorem joinedIdC_planeRotLin (c s : Cut) (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) :
    JoinedIdC (planeRotLin c s) := by
  obtain ⟨γ, _, _, hpre, h1, hrot⟩ := rotPath_joins_id_rotation c s h hc
  exact ⟨_, hpre, h1, hrot⟩

/-! ## THE FULL REDUCTION in set form (strictly cleaner than N154's path form). -/

-- THE FULL REDUCTION (set form): arbitrary BvC-isometry is JoinedIdC provided its compact
-- polar factor is JoinedIdC.
theorem bvIsom_joinedIdC_of_compact_joinedSet {S : Module.End Cut STVC} (hS : IsBvIsomLin S)
    (hcompact : ∀ k : Module.End Cut STVC, IsQvIsomC k → JoinedIdC k) :
    JoinedIdC S := by
  obtain ⟨h, n, c, u, γ, hhS, hγeq, hγ0, hγ1sqrt, hsymm, hpos, hk_isom, hkS⟩ :=
    bvIsomLin_polar_path_decomp hS
  set k := S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u) with hkdef
  set p := γ 1 with hpdef
  -- boost factor p = γ 1 is JoinedIdC: the boost path γ joins id to p
  have hβcont : Continuous γ := by rw [hγeq]; exact specPathOp_cont c u
  have hβ0 : γ 0 = (1 : Module.End Cut STVC) := by rw [hγ0, Module.End.one_eq_id]
  have hpJoined : JoinedIdC p := by
    refine ⟨γ '' (Set.uIcc 0 1), (isPreconnected_uIcc).image _ hβcont.continuousOn,
      ⟨0, Set.left_mem_uIcc, hβ0⟩, ⟨1, Set.right_mem_uIcc, rfl⟩⟩
  have hkJoined : JoinedIdC k := hcompact k hk_isom
  have hSeq : S = k * p := by rw [hpdef, hkdef, ← Module.End.mul_eq_comp] at hkS; exact hkS.symm
  rw [hSeq]
  exact joinedIdC_mul hkJoined hpJoined

end

end Phys.Algebra
