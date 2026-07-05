import Phys.Foundation.ContinuumTrigAdd
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Order.IntermediateValue
import Mathlib.Topology.Order.Monotone

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

-- assume the two banked results (as axioms for this probe)
axiom cutCos_continuous_A : Continuous cutCos
axiom cutCos_two_neg_A : cutCos (2:Cut) < 0

/-- The zero set of cutCos in [0,2]. -/
def cosZeroSet : Set Cut := {x : Cut | x ∈ Icc (0:Cut) 2 ∧ cutCos x = 0}

theorem cosZeroSet_nonempty : cosZeroSet.Nonempty := by
  have h02 : (0:Cut) ≤ 2 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0:Cut) 2) := cutCos_continuous_A.continuousOn
  -- cutCos 2 ≤ 0 ≤ cutCos 0, so 0 ∈ Icc (cutCos 2) (cutCos 0), use intermediate_value_Icc'
  have hmem : (0:Cut) ∈ Icc (cutCos 2) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_two_neg_A, by norm_num⟩
  have hsub := intermediate_value_Icc' h02 hcont
  obtain ⟨x, hx, hxval⟩ := hsub hmem
  exact ⟨x, hx, hxval⟩

theorem cosZeroSet_closed : IsClosed cosZeroSet := by
  have h1 : IsClosed (Icc (0:Cut) 2) := isClosed_Icc
  have h2 : IsClosed {x : Cut | cutCos x = 0} := by
    have : {x : Cut | cutCos x = 0} = cutCos ⁻¹' {0} := rfl
    rw [this]; exact isClosed_singleton.preimage cutCos_continuous_A
  have : cosZeroSet = Icc (0:Cut) 2 ∩ {x : Cut | cutCos x = 0} := by
    ext x; simp [cosZeroSet, Set.mem_inter_iff, and_comm]
  rw [this]; exact h1.inter h2

theorem cosZeroSet_bddBelow : BddBelow cosZeroSet := by
  refine ⟨0, ?_⟩; intro x hx; exact hx.1.1

/-- The least zero. -/
def leastCosZero : Cut := sInf cosZeroSet

theorem leastCosZero_mem : leastCosZero ∈ cosZeroSet :=
  cosZeroSet_closed.csInf_mem cosZeroSet_nonempty cosZeroSet_bddBelow

theorem leastCosZero_cos : cutCos leastCosZero = 0 := (leastCosZero_mem).2

theorem leastCosZero_nonneg : 0 ≤ leastCosZero := (leastCosZero_mem).1.1

theorem leastCosZero_pos : 0 < leastCosZero := by
  rcases lt_or_eq_of_le leastCosZero_nonneg with h | h
  · exact h
  · exfalso
    have := leastCosZero_cos
    rw [← h, cutCos_zero] at this
    norm_num at this

/-- THE DERIVED π: twice the least positive zero of cutCos. -/
def cutPi : Cut := 2 * leastCosZero

theorem cutPi_pos : 0 < cutPi := by
  unfold cutPi; have := leastCosZero_pos; linarith

theorem cutCos_cutPi_half : cutCos (cutPi / 2) = 0 := by
  unfold cutPi
  rw [show (2 * leastCosZero) / 2 = leastCosZero by ring]
  exact leastCosZero_cos

/-- cutSin(cutPi/2)² = 1 (the orbit at the quarter-turn is on the sine axis). -/
theorem cutSin_cutPi_half_sq : cutSin (cutPi / 2) * cutSin (cutPi / 2) = 1 := by
  have hp := cutSin_sq_add_cutCos_sq (cutPi / 2)
  rw [cutCos_cutPi_half] at hp
  linarith [hp]

/-- cutCos cutPi = −1 (the half-turn), from the addition formula + Pythagorean. NO sign argument. -/
theorem cutCos_cutPi : cutCos cutPi = -1 := by
  have hhalf : cutPi = cutPi / 2 + cutPi / 2 := by ring
  rw [hhalf, cutCos_add, cutCos_cutPi_half]
  have hsq := cutSin_cutPi_half_sq
  have : cutPi / 2 + cutPi / 2 = cutPi := hhalf.symm
  -- goal: 0 * 0 - cutSin (cutPi/2) * cutSin (cutPi/2) = -1
  rw [hsq]; ring

/-- cutSin cutPi = 0, from the addition formula. NO sign argument. -/
theorem cutSin_cutPi : cutSin cutPi = 0 := by
  have hhalf : cutPi = cutPi / 2 + cutPi / 2 := by ring
  rw [hhalf, cutSin_add, cutCos_cutPi_half]
  ring

/-- SHIFT: cutCos(x + cutPi) = −cutCos x. -/
theorem cutCos_add_cutPi (x : Cut) : cutCos (x + cutPi) = -cutCos x := by
  rw [cutCos_add, cutCos_cutPi, cutSin_cutPi]; ring

/-- SHIFT: cutSin(x + cutPi) = −cutSin x. -/
theorem cutSin_add_cutPi (x : Cut) : cutSin (x + cutPi) = -cutSin x := by
  rw [cutSin_add, cutCos_cutPi, cutSin_cutPi]; ring

/-- FULL PERIOD: cutCos(x + 2·cutPi) = cutCos x. -/
theorem cutCos_add_two_cutPi (x : Cut) : cutCos (x + (cutPi + cutPi)) = cutCos x := by
  rw [show x + (cutPi + cutPi) = (x + cutPi) + cutPi by ring, cutCos_add_cutPi, cutCos_add_cutPi]; ring

/-- FULL PERIOD: cutSin(x + 2·cutPi) = cutSin x. -/
theorem cutSin_add_two_cutPi (x : Cut) : cutSin (x + (cutPi + cutPi)) = cutSin x := by
  rw [show x + (cutPi + cutPi) = (x + cutPi) + cutPi by ring, cutSin_add_cutPi, cutSin_add_cutPi]; ring

end
end ContinuumQ
end Phys.Foundation
