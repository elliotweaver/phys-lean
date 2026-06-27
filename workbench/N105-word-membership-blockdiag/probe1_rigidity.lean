import Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- ============================================================
-- PROBE 1: x-rigidity and t-rigidity of a single generator (rfl?)
-- ============================================================

-- Check: biMulLin u u' fixes the first two coordinates by rfl.
example (u u' : O Cut) (p : STVC) : (biMulLin u u' p).1 = p.1 := rfl
example (u u' : O Cut) (p : STVC) : (biMulLin u u' p).2.1 = p.2.1 := rfl

-- ============================================================
-- PROBE 2: the closure_induction for genIsomMonoidLin x-rigidity
-- ============================================================

theorem genIsomMonoidLin_fixes_fst {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLin) (p : STVC) : (K p).1 = p.1 := by
  induction hK using Submonoid.closure_induction with
  | mem K hK =>
      obtain ⟨u, u', _, _, rfl⟩ := hK
      rfl
  | one => rfl
  | mul A B _ _ ihA ihB =>
      show (A (B p)).1 = p.1
      rw [ihA (B p), ihB p]

theorem genIsomMonoidLin_fixes_snd_fst {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLin) (p : STVC) : (K p).2.1 = p.2.1 := by
  induction hK using Submonoid.closure_induction with
  | mem K hK =>
      obtain ⟨u, u', _, _, rfl⟩ := hK
      rfl
  | one => rfl
  | mul A B _ _ ihA ihB =>
      show (A (B p)).2.1 = p.2.1
      rw [ihA (B p), ihB p]

end

end Phys.Algebra
