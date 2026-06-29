import Phys.Algebra.LorentzContinuumPathConnectedFull

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- g lies in a preconnected subset of endOpC together with the identity. -/
def JoinedIdC (g : Module.End Cut STVC) : Prop :=
  ∃ Conn : Set (Module.End Cut STVC),
    IsPreconnected Conn ∧ (1 : Module.End Cut STVC) ∈ Conn ∧ g ∈ Conn

theorem joinedIdC_one : JoinedIdC (1 : Module.End Cut STVC) :=
  ⟨{1}, isPreconnected_singleton, rfl, rfl⟩

-- THE ENGINE: closed under multiplication.
theorem joinedIdC_mul {a b : Module.End Cut STVC}
    (ha : JoinedIdC a) (hb : JoinedIdC b) : JoinedIdC (a * b) := by
  obtain ⟨A, hApre, h1A, haA⟩ := ha
  obtain ⟨B, hBpre, h1B, hbB⟩ := hb
  -- right-translate A by b: A*b is preconnected, contains 1*b = b and a*b
  set Ab := (fun g => g * b) '' A with hAb
  have hAbcont : Continuous (fun g : Module.End Cut STVC => g * b) := endOpC_mul_right_cont b
  have hAbpre : IsPreconnected Ab := hApre.image _ hAbcont.continuousOn
  have hbAb : b ∈ Ab := ⟨1, h1A, by show (1 : Module.End Cut STVC) * b = b; rw [one_mul]⟩
  have habAb : a * b ∈ Ab := ⟨a, haA, rfl⟩
  -- B contains 1 and b; Ab contains b and a*b; share b
  refine ⟨B ∪ Ab, hBpre.union b hbB hbAb hAbpre, Set.mem_union_left _ h1B,
    Set.mem_union_right _ habAb⟩

-- WORD-INDUCTION: finite products of JoinedIdC factors are JoinedIdC.
theorem joinedIdC_listProd : ∀ (L : List (Module.End Cut STVC)),
    (∀ g ∈ L, JoinedIdC g) → JoinedIdC L.prod
  | [], _ => by simpa using joinedIdC_one
  | (a :: L), h => by
      rw [List.prod_cons]
      exact joinedIdC_mul (h a (List.mem_cons_self ..))
        (joinedIdC_listProd L (fun g hg => h g (List.mem_cons_of_mem a hg)))

-- per-factor: an rotPath-reachable 2-plane rotation is JoinedIdC.
theorem joinedIdC_planeRotLin (c s : Cut) (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) :
    JoinedIdC (planeRotLin c s) := by
  obtain ⟨γ, _, _, hpre, h1, hrot⟩ := rotPath_joins_id_rotation c s h hc
  exact ⟨_, hpre, h1, hrot⟩

end

end Phys.Algebra
