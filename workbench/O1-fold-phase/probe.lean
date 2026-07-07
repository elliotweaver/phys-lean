import Phys.Foundation.ContinuumTrigPi
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ
open Set

noncomputable section

namespace ProbeFoldPhase

-- (1) double-angle law
theorem cutCos_two_mul (x : Cut) :
    cutCos (x + x) = 2 * cutCos x * cutCos x - 1 := by
  rw [cutCos_add]
  have hp := cutSin_sq_add_cutCos_sq x
  linarith [hp]

-- (2) the forced halving law
theorem cutCos_half_angle (x : Cut) :
    cutCos x = 2 * cutCos (x / 2) * cutCos (x / 2) - 1 := by
  have h := cutCos_two_mul (x / 2)
  rw [show x / 2 + x / 2 = x by ring] at h
  exact h

-- (3) positivity below cutPi/2  (leastCosZero = cutPi/2)
theorem cutCos_pos_below_half_pi (x : Cut) (hx0 : 0 ≤ x) (hxlt : x < cutPi / 2) :
    0 < cutCos x := by
  by_contra h
  push_neg at h  -- cutCos x ≤ 0
  -- cutPi/2 = leastCosZero
  have hpi2 : cutPi / 2 = leastCosZero := by
    unfold cutPi; rw [show (2 * leastCosZero) / 2 = leastCosZero by ring]
  have hxlt' : x < leastCosZero := by rw [hpi2] at hxlt; exact hxlt
  -- IVT on [0,x]: cutCos 0 = 1 ≥ 0 ≥ cutCos x, so a zero c ∈ [0,x]
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) x) := cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos x) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨h, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' hx0 hcont) hmem
  -- c ∈ [0,x], cutCos c = 0.  c ≤ x < leastCosZero ≤ 2
  have hle2 : leastCosZero ≤ 2 := leastCosZero_mem.1.2
  have hc2 : c ≤ 2 := le_trans hc.2 (le_of_lt (lt_of_lt_of_le hxlt' hle2))
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  have hle : leastCosZero ≤ c := csInf_le cosZeroSet_bddBelow hcmem
  have : leastCosZero ≤ x := le_trans hle hc.2
  exact absurd (lt_of_le_of_lt this hxlt') (lt_irrefl _)

-- (4) quarter-turn square = 1/2
theorem cutCos_quarter_sq :
    cutCos (cutPi / 4) * cutCos (cutPi / 4) = 1 / 2 := by
  have h : cutCos (cutPi / 4 + cutPi / 4)
      = 2 * cutCos (cutPi / 4) * cutCos (cutPi / 4) - 1 := cutCos_two_mul _
  rw [show cutPi / 4 + cutPi / 4 = cutPi / 2 by ring, cutCos_cutPi_half] at h
  linarith [h]

-- (5) 45° self=other Born balance
theorem quarter_self_eq_other :
    cutCos (cutPi / 4) * cutCos (cutPi / 4) = cutSin (cutPi / 4) * cutSin (cutPi / 4) := by
  have hc := cutCos_quarter_sq
  have hp := cutSin_sq_add_cutCos_sq (cutPi / 4)
  linarith

-- (6) quarter positive
theorem cutCos_quarter_pos : 0 < cutCos (cutPi / 4) := by
  apply cutCos_pos_below_half_pi
  · have := cutPi_pos; linarith
  · have := cutPi_pos; linarith

-- (7) eighth square = (1 + cos(π/4))/2
theorem cutCos_eighth_sq :
    cutCos (cutPi / 8) * cutCos (cutPi / 8) = (1 + cutCos (cutPi / 4)) / 2 := by
  have h : cutCos (cutPi / 8 + cutPi / 8)
      = 2 * cutCos (cutPi / 8) * cutCos (cutPi / 8) - 1 := cutCos_two_mul _
  rw [show cutPi / 8 + cutPi / 8 = cutPi / 4 by ring] at h
  linarith [h]

-- (8) eighth positive
theorem cutCos_eighth_pos : 0 < cutCos (cutPi / 8) := by
  apply cutCos_pos_below_half_pi
  · have := cutPi_pos; linarith
  · have := cutPi_pos; linarith

-- (11) next half-step cutPi/16
theorem cutCos_sixteenth_sq :
    cutCos (cutPi / 16) * cutCos (cutPi / 16) = (1 + cutCos (cutPi / 8)) / 2 := by
  have h : cutCos (cutPi / 16 + cutPi / 16)
      = 2 * cutCos (cutPi / 16) * cutCos (cutPi / 16) - 1 := cutCos_two_mul _
  rw [show cutPi / 16 + cutPi / 16 = cutPi / 8 by ring] at h
  linarith [h]

theorem cutCos_sixteenth_pos : 0 < cutCos (cutPi / 16) := by
  apply cutCos_pos_below_half_pi
  · have := cutPi_pos; linarith
  · have := cutPi_pos; linarith

end ProbeFoldPhase
end
