import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

-- restate the three probe results as axioms-free `have`s inline by re-proving quickly is expensive;
-- instead re-declare minimal versions we need (head/termbound/geo) via `sorry`-free stubs pulled from probe1.
-- For the PROBE we just assume them to test the ASSEMBLY tactics; production file will have real proofs.

theorem probe_head :
    (∑ i ∈ Finset.range 3, cosTermC (2 / 3 : Cut) i) = 191 / 243 := by
  rw [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_one]
  unfold cosTermC; norm_num [Nat.factorial]

theorem probe_termbound (n : ℕ) :
    |cosTermC (2 / 3 : Cut) (n + 3)| ≤ (4 / 32805) * (1 / 126) ^ n := by
  sorry

theorem probe_geo_value : (∑' n, (4 / 32805 : Cut) * (1 / 126) ^ n) ≤ 56 / 455625 := by
  sorry

/-- ASSEMBLY 1: the split. -/
theorem probe_split :
    cutCos (2 / 3 : Cut) = 191 / 243 + ∑' n, cosTermC (2 / 3 : Cut) (n + 3) := by
  have hsum : cutCos (2 / 3 : Cut)
      = (∑ i ∈ Finset.range 3, cosTermC (2 / 3 : Cut) i)
        + ∑' n, cosTermC (2 / 3 : Cut) (n + 3) := by
    unfold cutCos
    exact ((cosTermC_summable (2/3)).sum_add_tsum_nat_add 3).symm
  rw [hsum, probe_head]

/-- ASSEMBLY 2: the two-sided tail bounds. -/
theorem probe_tail_upper :
    (∑' n, cosTermC (2 / 3 : Cut) (n + 3)) ≤ 56 / 455625 := by
  have hshiftsumm : Summable (fun n => cosTermC (2 / 3 : Cut) (n + 3)) :=
    (summable_nat_add_iff 3).mpr (cosTermC_summable (2/3))
  have habssumm : Summable (fun n => |cosTermC (2 / 3 : Cut) (n + 3)|) :=
    (summable_nat_add_iff 3).mpr (cosTermC_abs_summable (2/3))
  have hgeomaj : Summable (fun n => (4 / 32805 : Cut) * (1 / 126) ^ n) :=
    (cut_summable_geometric (by norm_num) (by norm_num)).mul_left _
  calc ∑' n, cosTermC (2 / 3 : Cut) (n + 3)
      ≤ ∑' n, |cosTermC (2 / 3 : Cut) (n + 3)| :=
        hshiftsumm.tsum_le_tsum (fun n => le_abs_self _) habssumm
    _ ≤ ∑' n, (4 / 32805 : Cut) * (1 / 126) ^ n := habssumm.tsum_le_tsum probe_termbound hgeomaj
    _ ≤ 56 / 455625 := probe_geo_value

theorem probe_tail_lower :
    -(56 / 455625 : Cut) ≤ ∑' n, cosTermC (2 / 3 : Cut) (n + 3) := by
  have hshiftsumm : Summable (fun n => cosTermC (2 / 3 : Cut) (n + 3)) :=
    (summable_nat_add_iff 3).mpr (cosTermC_summable (2/3))
  have habssumm : Summable (fun n => |cosTermC (2 / 3 : Cut) (n + 3)|) :=
    (summable_nat_add_iff 3).mpr (cosTermC_abs_summable (2/3))
  have hgeomaj : Summable (fun n => (4 / 32805 : Cut) * (1 / 126) ^ n) :=
    (cut_summable_geometric (by norm_num) (by norm_num)).mul_left _
  have hneg : -(∑' n, cosTermC (2 / 3 : Cut) (n + 3)) ≤ 56 / 455625 := by
    calc -(∑' n, cosTermC (2 / 3 : Cut) (n + 3))
        = ∑' n, -(cosTermC (2 / 3 : Cut) (n + 3)) := by rw [tsum_neg]
      _ ≤ ∑' n, |cosTermC (2 / 3 : Cut) (n + 3)| :=
          (hshiftsumm.neg).tsum_le_tsum (fun n => neg_le_abs _) habssumm
      _ ≤ ∑' n, (4 / 32805 : Cut) * (1 / 126) ^ n := habssumm.tsum_le_tsum probe_termbound hgeomaj
      _ ≤ 56 / 455625 := probe_geo_value
  linarith

/-- ASSEMBLY 3: the two-sided bound + bracket + positivity. -/
theorem probe_bounds :
    191 / 243 - 56 / 455625 ≤ cutCos (2 / 3 : Cut)
      ∧ cutCos (2 / 3 : Cut) ≤ 191 / 243 + 56 / 455625 := by
  rw [probe_split]
  constructor
  · linarith [probe_tail_lower]
  · linarith [probe_tail_upper]

theorem probe_bracket :
    (785 / 1000 : Cut) ≤ cutCos (2 / 3 : Cut) ∧ cutCos (2 / 3 : Cut) ≤ 787 / 1000 := by
  obtain ⟨hlo, hhi⟩ := probe_bounds
  constructor
  · have : (785 / 1000 : Cut) ≤ 191 / 243 - 56 / 455625 := by norm_num
    linarith
  · have : (191 / 243 + 56 / 455625 : Cut) ≤ 787 / 1000 := by norm_num
    linarith

theorem probe_pos : 0 < cutCos (2 / 3 : Cut) := by
  have := probe_bracket.1
  have h : (0 : Cut) < 785 / 1000 := by norm_num
  linarith

end
end ContinuumQ
end Phys.Foundation
