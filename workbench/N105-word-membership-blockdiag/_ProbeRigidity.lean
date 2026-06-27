import Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- single generator: rfl
example (u u' : O Cut) (p : STVC) : (biMulLin u u' p).1 = p.1 := rfl
example (u u' : O Cut) (p : STVC) : (biMulLin u u' p).2.1 = p.2.1 := rfl

-- closure_induction with predicate ∀ p, ...
theorem genIsomMonoidLin_fixes_fst {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLin) : ∀ p : STVC, (K p).1 = p.1 := by
  induction hK using Submonoid.closure_induction with
  | mem K hK =>
      obtain ⟨u, u', _, _, rfl⟩ := hK
      intro p; rfl
  | one => intro p; rfl
  | mul A B _ _ ihA ihB =>
      intro p
      show (A (B p)).1 = p.1
      rw [ihA (B p), ihB p]

theorem genIsomMonoidLin_fixes_snd_fst {K : Module.End Cut STVC}
    (hK : K ∈ genIsomMonoidLin) : ∀ p : STVC, (K p).2.1 = p.2.1 := by
  induction hK using Submonoid.closure_induction with
  | mem K hK =>
      obtain ⟨u, u', _, _, rfl⟩ := hK
      intro p; rfl
  | one => intro p; rfl
  | mul A B _ _ ihA ihB =>
      intro p
      show (A (B p)).2.1 = p.2.1
      rw [ihA (B p), ihB p]

end

end Phys.Algebra
