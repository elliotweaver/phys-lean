import Phys.Algebra.GenerationMassRatiosNumeric
import Phys.Algebra.OctonionJordanGenerationMixingOverlap
import Mathlib.Tactic

namespace Probe343

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMassRatios

noncomputable section

def sinSqMix {F : Type*} [Field F] (ms ml : F) : F := ms / (ms + ml)
def cosSqMix {F : Type*} [Field F] (ms ml : F) : F := ml / (ms + ml)

theorem sinSqMix_gst {F : Type*} [Field F] (ms ml : F) (hml : ml ≠ 0) (hsum : ms + ml ≠ 0) :
    sinSqMix ms ml = (ms / ml) / (1 + ms / ml) := by
  have hone : (1 : F) + ms / ml ≠ 0 := by
    have h : (1 : F) + ms / ml = (ml + ms) / ml := by field_simp
    rw [h, add_comm ml ms]; exact div_ne_zero hsum hml
  unfold sinSqMix
  rw [div_eq_div_iff hsum hone]
  field_simp
  ring

theorem sinSq_add_cosSq {F : Type*} [Field F] (ms ml : F) (hsum : ms + ml ≠ 0) :
    sinSqMix ms ml + cosSqMix ms ml = 1 := by
  unfold sinSqMix cosSqMix
  field_simp

theorem sinSqMix_born {F : Type*} [Field F] (ai aj : F) :
    sinSqMix (ai^2) (aj^2) = ai^2 / (ai^2 + aj^2) := rfl

theorem sinSq12_lo : (481 : Cut) / 100000 ≤ sinSqMix mass1 mass2 := by
  unfold sinSqMix
  rw [le_div_iff₀ (by have := mass1_pos; have := mass2_pos; linarith)]
  nlinarith [mass1_lo, mass2_hi, mass1_pos, mass2_pos]

theorem sinSq12_hi : sinSqMix mass1 mass2 ≤ (482 : Cut) / 100000 := by
  unfold sinSqMix
  rw [div_le_iff₀ (by have := mass1_pos; have := mass2_pos; linarith)]
  nlinarith [mass1_hi, mass2_lo, mass1_pos, mass2_pos]

theorem sinSq23_lo : (561 : Cut) / 10000 ≤ sinSqMix mass2 mass0 := by
  unfold sinSqMix
  rw [le_div_iff₀ (by have := mass2_pos; have := mass0_pos; linarith)]
  nlinarith [mass2_lo, mass0_hi, mass2_pos, mass0_pos]

theorem sinSq23_hi : sinSqMix mass2 mass0 ≤ (562 : Cut) / 10000 := by
  unfold sinSqMix
  rw [div_le_iff₀ (by have := mass2_pos; have := mass0_pos; linarith)]
  nlinarith [mass2_hi, mass0_lo, mass2_pos, mass0_pos]

theorem sinSq13_lo : (287 : Cut) / 1000000 ≤ sinSqMix mass1 mass0 := by
  unfold sinSqMix
  rw [le_div_iff₀ (by have := mass1_pos; have := mass0_pos; linarith)]
  nlinarith [mass1_lo, mass0_hi, mass1_pos, mass0_pos]

theorem sinSq13_hi : sinSqMix mass1 mass0 ≤ (288 : Cut) / 1000000 := by
  unfold sinSqMix
  rw [div_le_iff₀ (by have := mass1_pos; have := mass0_pos; linarith)]
  nlinarith [mass1_hi, mass0_lo, mass1_pos, mass0_pos]

end

end Probe343
