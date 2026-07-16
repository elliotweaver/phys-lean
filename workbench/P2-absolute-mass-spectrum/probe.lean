import Phys.Algebra.ScaleTowerDischargeArcM
import Phys.Algebra.GenerationMassRatiosNumeric
import Phys.Algebra.OctonionJordanSpectrumMovingSector
import Phys.Algebra.LorentzContinuumSqrt
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ

namespace Phys.Algebra.AbsMassProbe

open Phys.Algebra.DischargeArcM
open Phys.Algebra.GenerationMassRatios

noncomputable section

-- the derived parameter-free scale (N417)
def massScale : Cut := absScaleChainDerived
def ampScale : Cut := Phys.Algebra.cutSqrt massScale

theorem massScale_pos : 0 < massScale := absScaleChainDerived_pos
theorem ampScale_pos : 0 < ampScale := Phys.Algebra.cutSqrt_pos massScale_pos
theorem ampScale_sq : ampScale * ampScale = massScale :=
  Phys.Algebra.cutSqrt_sq (le_of_lt massScale_pos)

-- absolute masses/amplitudes
def absMass0 : Cut := massScale * mass0
def absMass1 : Cut := massScale * mass1
def absMass2 : Cut := massScale * mass2
def absAmp0 : Cut := ampScale * b0
def absAmp1 : Cut := ampScale * b1
def absAmp2 : Cut := ampScale * b2

-- T1: absolute mass is Born square of absolute amplitude
theorem absMass0_born : absMass0 = absAmp0 ^ 2 := by
  unfold absMass0 absAmp0
  have : (ampScale * b0) ^ 2 = (ampScale * ampScale) * (b0 ^ 2) := by ring
  rw [this, ampScale_sq]; rfl

-- T2 core: positivity + ordering
theorem absMass1_pos : 0 < absMass1 := mul_pos massScale_pos mass1_pos
theorem absMass_order_12 : absMass1 < absMass2 :=
  mul_lt_mul_of_pos_left mass_distinct_1_2 massScale_pos

-- T3: ratio inheritance
theorem abs_ratio_12_lo : (483 : Cut) / 100000 * absMass2 ≤ absMass1 := by
  unfold absMass1 absMass2
  have hb := massRatio_1_2.1
  nlinarith [mul_le_mul_of_nonneg_left hb (le_of_lt massScale_pos), massScale_pos]

-- T4: scale-invariant Koide
theorem sum_b : b0 + b1 + b2 = 3 := by unfold b0 b1 b2; ring
theorem koide_abs :
    (absMass0 + absMass1 + absMass2) / (absAmp0 + absAmp1 + absAmp2) ^ 2 = 2 / 3 := by
  have hm : absMass0 + absMass1 + absMass2 = massScale * 6 := by
    unfold absMass0 absMass1 absMass2
    have h := koide_total
    linear_combination massScale * h
  have ha : absAmp0 + absAmp1 + absAmp2 = ampScale * 3 := by
    unfold absAmp0 absAmp1 absAmp2
    have h := sum_b
    linear_combination ampScale * h
  rw [hm, ha]
  have hsq : (ampScale * 3) ^ 2 = massScale * 9 := by
    have : (ampScale * 3) ^ 2 = (ampScale * ampScale) * 9 := by ring
    rw [this, ampScale_sq]
  rw [hsq]
  have hS : massScale ≠ 0 := ne_of_gt massScale_pos
  field_simp
  ring

end

end Phys.Algebra.AbsMassProbe
