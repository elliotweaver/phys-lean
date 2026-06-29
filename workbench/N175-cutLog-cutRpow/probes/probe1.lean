import Phys.Foundation.ContinuumExp
import Mathlib.Topology.Order.IntermediateValue

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- (A) THE SEED: 1 + t ≤ cutExp t for 0 ≤ t  (the n=0,1 partial sum ≤ tsum, all terms nonneg)
theorem probe_one_add_le (t : Cut) (ht : 0 ≤ t) : 1 + t ≤ cutExp t := by
  have hnn : ∀ n, 0 ≤ expTermC t n := by
    intro n; unfold expTermC; positivity
  have hsum := expTermC_summable t
  have hle := sum_le_tsum (Finset.range 2) (fun i _ => hnn i) hsum
  have hfin : ∑ i ∈ Finset.range 2, expTermC t i = 1 + t := by
    rw [Finset.sum_range_succ, Finset.sum_range_one]
    unfold expTermC; simp
  rw [hfin] at hle
  exact hle

-- (A') cutExp t > 1 for t > 0
theorem probe_one_lt (t : Cut) (ht : 0 < t) : 1 < cutExp t := by
  have h := probe_one_add_le t (le_of_lt ht)
  have : (1:Cut) < 1 + t := by linarith
  linarith

-- (B) STRICT MONOTONICITY
theorem probe_strict_mono : StrictMono (cutExp) := by
  intro x y hxy
  have hd : 0 < y - x := by linarith
  have hgt1 : 1 < cutExp (y - x) := probe_one_lt _ hd
  have hpos : 0 < cutExp x := cutExp_pos x
  have hmul : cutExp x * 1 < cutExp x * cutExp (y - x) := by
    exact (mul_lt_mul_left hpos).mpr hgt1
  have hadd : cutExp x * cutExp (y - x) = cutExp y := by
    rw [cutExp_add]; congr 1; ring
  rw [hadd, mul_one] at hmul
  exact hmul

-- (C) CONTINUITY reachability probes
example : IsTopologicalRing Cut := inferInstance
example (n : ℕ) : Continuous (fun x : Cut => x ^ n) := by continuity
example : Continuous (fun x : Cut => expTermC x 0) := by unfold expTermC; continuity

-- (C') does Continuous cutExp synthesize cheaply? (expected to FAIL — no norm)
-- example : Continuous (cutExp) := by continuity

-- (C'') IVT availability over Cut: does intermediate_value_Icc typecheck for Cut?
example (a b : Cut) (hab : a ≤ b) (hf : ContinuousOn cutExp (Set.Icc a b)) :
    Set.Icc (cutExp a) (cutExp b) ⊆ cutExp '' (Set.Icc a b) :=
  intermediate_value_Icc hab hf

end
end ContinuumQ
end Phys.Foundation
