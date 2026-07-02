import Phys.Algebra.LorentzContinuumBoostPolarFactor
import Phys.Algebra.LorentzContinuumGenerationConversePolar

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## (A) THE EXPLICIT KAK PRODUCT ASSEMBLY -/

-- A forward boost times an N163-certified time-fixing SO(9) compact factor is JoinedIdQvC.
theorem probe_joinedIdQvC_boost_so9compact {a b : Cut} (hab : a^2 - b^2 = 1) (ha : 0 < a)
    {k kadj : Module.End Cut STVC}
    (hk : IsQvIsomC k) (hadj : IsEvCAdjoint k kadj) (horth : kadj.comp k = LinearMap.id)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hv : (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 ≠ 0)
    (hdet : LinearMap.det
      (vBlockEndC (deflateNinth (k ((0:Cut), (1:Cut), (0:O Cut))).2.1
        (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 * k)) = 1) :
    JoinedIdQvC (boostEndC a b * k) :=
  joinedIdQvC_boost_compact hab ha
    (joinedIdQvC_of_timeFixing_evCOrth_SO9 hk hadj horth htime hv hdet)

/-! ## (B) THE POLAR REDUCTION -/

-- An arbitrary BvC-isometry factors as compact·positive, reducing JoinedIdQvC S to the two factors.
theorem probe_bvIsomLin_polar_reduction {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC k ∧ IsEvCSymm p ∧ (∀ q, 0 ≤ EvC (p q) q) ∧
      k * p = S ∧
      (JoinedIdQvC k → JoinedIdQvC p → JoinedIdQvC S) := by
  obtain ⟨h, n, c, u, γ, _h1, _h2, _h3, _h4, h5, h6, h7, h8⟩ :=
    bvIsomLin_polar_path_decomp hS
  refine ⟨S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u), γ 1, h7, h5 1, ?_, ?_, ?_⟩
  · intro q; exact h6 1 (by norm_num) (by norm_num) q
  · rw [← Module.End.mul_eq_comp] at h8; exact h8
  · intro hk hp
    have hSeq : S = (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) * (γ 1) := by
      rw [← Module.End.mul_eq_comp] at h8; exact h8.symm
    rw [hSeq]; exact joinedIdQvC_mul hk hp

/-! ## (C) W8 WITNESS — a concrete non-identity boost·SO(9)-rotation product is JoinedIdQvC. -/

theorem probe_joinedIdQvC_boostWitness_so9Witness :
    JoinedIdQvC (boostEndC ((5:Cut)/3) ((4:Cut)/3) * octBlockEndC so9WitnessR) :=
  joinedIdQvC_boost_compact boostWitness_hab (by norm_num) joinedIdQvC_so9Witness_via_assembly

end

end Phys.Algebra
