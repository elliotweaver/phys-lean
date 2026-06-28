import Phys.Algebra.LorentzContinuumGenerationNullPeel

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- W8 witness probe: concrete reflection membership + involution-composite self-overlap.

theorem houseHolderM_mTimeUnit_mem_closure_PROBE :
    houseHolderM (mTimeUnit : STVC) ∈ Submonoid.closure houseHolderMSet := by
  apply Submonoid.subset_closure
  exact ⟨mTimeUnit, by rw [BvC_mTimeUnit_self]; exact one_ne_zero, rfl⟩

theorem exhaustion_witness_self_overlap_PROBE :
    BvC (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)))
        (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)))
      = 1 := by
  have hb : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0 := by
    rw [BvC_mTimeUnit_self]; exact one_ne_zero
  rw [houseHolderM_neg_self hb, map_neg, houseHolderM_neg_self hb, neg_neg, BvC_mTimeUnit_self]

end

end Phys.Algebra
