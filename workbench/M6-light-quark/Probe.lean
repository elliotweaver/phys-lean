import Phys.Algebra.HeavyQuarkNumerals
import Phys.Algebra.UnitPeg
import Mathlib.Tactic

namespace M6Probe

open Phys.Algebra Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.HeavyQuarkNumerals
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- The light-band edge (strange placement relative to confinement floor): determined derived Cut.
def lightEdgeStrange : Cut := downConfBundle * bMass 2
def lightEdgeDown : Cut := downConfBundle * bMass 1

-- CRUX 1: the strange placement product bracket (M5 downConfBundle_bracket × N340 mass2 bracket)
theorem lightEdgeStrange_bracket :
    (49 / 2 : Cut) ≤ lightEdgeStrange ∧ lightEdgeStrange ≤ 1227 / 50 := by
  obtain ⟨hdlo, hdhi⟩ := downConfBundle_bracket
  have hm2lo := mass2_lo
  have hm2hi := mass2_hi
  have hb2 : bMass 2 = mass2 := rfl
  have hdpos : (0 : Cut) < downConfBundle := downConfBundle_pos
  unfold lightEdgeStrange
  rw [hb2]
  constructor
  · have hprod : (7280 / 100 : Cut) * ((5802 / 10000) * (5802 / 10000)) ≤ downConfBundle * mass2 :=
      mul_le_mul hdlo hm2lo (by norm_num) (le_of_lt hdpos)
    have hkey : (49 / 2 : Cut) ≤ (7280 / 100) * ((5802 / 10000) * (5802 / 10000)) := by norm_num
    linarith
  · have hprod : downConfBundle * mass2 ≤ (7288 / 100 : Cut) * ((58022 / 100000) * (58022 / 100000)) :=
      mul_le_mul hdhi hm2hi (by positivity) (by norm_num)
    have hkey : (7288 / 100 : Cut) * ((58022 / 100000) * (58022 / 100000)) ≤ 1227 / 50 := by norm_num
    linarith

-- CRUX 2: the down placement product bracket
theorem lightEdgeDown_bracket :
    (118 / 1000 : Cut) ≤ lightEdgeDown ∧ lightEdgeDown ≤ 119 / 1000 := by
  obtain ⟨hdlo, hdhi⟩ := downConfBundle_bracket
  have hm1lo := mass1_lo
  have hm1hi := mass1_hi
  have hb1 : bMass 1 = mass1 := rfl
  have hdpos : (0 : Cut) < downConfBundle := downConfBundle_pos
  unfold lightEdgeDown
  rw [hb1]
  constructor
  · have hprod : (7280 / 100 : Cut) * ((4034 / 100000) * (4034 / 100000)) ≤ downConfBundle * mass1 :=
      mul_le_mul hdlo hm1lo (by norm_num) (le_of_lt hdpos)
    have hkey : (118 / 1000 : Cut) ≤ (7280 / 100) * ((4034 / 100000) * (4034 / 100000)) := by norm_num
    linarith
  · have hprod : downConfBundle * mass1 ≤ (7288 / 100 : Cut) * ((40365 / 1000000) * (40365 / 1000000)) :=
      mul_le_mul hdhi hm1hi (by positivity) (by norm_num)
    have hkey : (7288 / 100 : Cut) * ((40365 / 1000000) * (40365 / 1000000)) ≤ 119 / 1000 := by norm_num
    linarith

theorem lightEdgeStrange_pos : (0 : Cut) < lightEdgeStrange := by
  have := lightEdgeStrange_bracket.1; linarith

-- CRUX 3: the reciprocal
theorem invLightEdgeStrange_bracket :
    (407 / 10000 : Cut) ≤ 1 / lightEdgeStrange ∧ 1 / lightEdgeStrange ≤ 409 / 10000 := by
  obtain ⟨hlo, hhi⟩ := lightEdgeStrange_bracket
  have hpos : (0 : Cut) < lightEdgeStrange := lightEdgeStrange_pos
  have hlopos : (0 : Cut) < (49 / 2 : Cut) := by norm_num
  constructor
  · have h1 : 1 / (1227 / 50 : Cut) ≤ 1 / lightEdgeStrange := one_div_le_one_div_of_le hpos hhi
    have h2 : (407 / 10000 : Cut) ≤ 1 / (1227 / 50 : Cut) := by norm_num
    linarith
  · have h1 : 1 / lightEdgeStrange ≤ 1 / (49 / 2 : Cut) := one_div_le_one_div_of_le hlopos hlo
    have h2 : (1 / (49 / 2 : Cut) : Cut) ≤ 409 / 10000 := by norm_num
    linarith

end

end M6Probe
