/-
  N315 PROBE — de-risk the A3 ★ BRIDGE route (Born-isometry completeness 42·α=1).
  All heavy work banked in N313 (assoc3InnerSum, assoc3NormSq_eq_42). This probe confirms the
  normalized-weight layer is LIGHT and ℚ-exact.
-/
import Phys.Algebra.OctonionStructure3FormNorm
import Phys.Algebra.InteractionChannelTower
import Mathlib.Tactic

namespace Phys.Algebra.N315Probe

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- The per-channel Born self-overlap: the concrete banked quantity `∑ i (assoc3 eᵢ eⱼ eₖ)²`. -/
def chanSelfOverlap (j k : Fin 7) : ℚ :=
  ∑ i : Fin 7, (assoc3 (imBasis i) (imBasis j) (imBasis k))^2

/-- `chanSelfOverlap = 1 − δ_jk` (banked assoc3InnerSum). -/
theorem chanSelfOverlap_eq (j k : Fin 7) :
    chanSelfOverlap j k = 1 - (if j = k then (1:ℚ) else 0) := assoc3InnerSum j k

/-- The total Born self-overlap over all channels IS assoc3NormSq (reorder the triple sum). -/
theorem assoc3NormSq_as_channel_sum :
    assoc3NormSq = ∑ j : Fin 7, ∑ k : Fin 7, chanSelfOverlap j k := by
  unfold assoc3NormSq chanSelfOverlap
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl; intro j _
  rw [Finset.sum_comm]

/-- The normalized per-channel Born weight. -/
def bornWeight (j k : Fin 7) : ℚ := chanSelfOverlap j k / assoc3NormSq

/-- Off-diagonal (active) channel: weight = 1/42. FALLS OUT (unit self-overlap / total 42). -/
theorem bornWeight_offdiag (j k : Fin 7) (h : j ≠ k) : bornWeight j k = 1 / 42 := by
  unfold bornWeight
  rw [chanSelfOverlap_eq, assoc3NormSq_eq_42, if_neg h]
  norm_num

/-- Diagonal channel: weight = 0. -/
theorem bornWeight_diag (j : Fin 7) : bornWeight j j = 0 := by
  unfold bornWeight
  rw [chanSelfOverlap_eq, if_pos rfl]
  norm_num

/-- UNIFORMITY (democracy): every active channel carries the SAME weight → a single coupling. -/
theorem bornWeight_uniform (j k j' k' : Fin 7) (h : j ≠ k) (h' : j' ≠ k') :
    bornWeight j k = bornWeight j' k' := by
  rw [bornWeight_offdiag j k h, bornWeight_offdiag j' k' h']

/-- COMPLETENESS (Parseval / return normalization): the weights total 1. -/
theorem born_isometry_completeness :
    (∑ j : Fin 7, ∑ k : Fin 7, bornWeight j k) = 1 := by
  have h : (∑ j : Fin 7, ∑ k : Fin 7, bornWeight j k)
      = (∑ j : Fin 7, ∑ k : Fin 7, chanSelfOverlap j k) / assoc3NormSq := by
    unfold bornWeight
    rw [Finset.sum_div]
    apply Finset.sum_congr rfl; intro j _
    rw [Finset.sum_div]
  rw [h, ← assoc3NormSq_as_channel_sum, assoc3NormSq_eq_42]
  norm_num

/-- The shared per-active-channel coupling weight. -/
def couplingWeight : ℚ := bornWeight 0 1

theorem couplingWeight_eq : couplingWeight = 1 / 42 := by
  unfold couplingWeight; exact bornWeight_offdiag 0 1 (by decide)

/-- ★★★ THE ★ BRIDGE HEADLINE `42·α = 1`: channel count (banked N314) × coupling weight = 1. -/
theorem channels_times_coupling :
    (imChannelCount (Module.finrank ℚ ImO) : ℚ) * couplingWeight = 1 := by
  rw [channels_O, couplingWeight_eq]
  norm_num

/-- W8: coupling weight nonzero. -/
theorem couplingWeight_ne_zero : couplingWeight ≠ 0 := by
  rw [couplingWeight_eq]; norm_num

/-- W8: a WRONG weight 1/49 (diagonal not dropped) breaks 42·α=1. -/
theorem wrong_weight_fails : (42 : ℚ) * (1 / 49) ≠ 1 := by norm_num

end

end Phys.Algebra.N315Probe
