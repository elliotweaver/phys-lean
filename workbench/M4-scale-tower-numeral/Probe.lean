import Phys.Algebra.BandEdgeList
import Phys.Algebra.LeptonMassNumerals
import Phys.Algebra.UnitPeg
import Phys.Foundation.ContinuumBracket
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace M4Probe

open Phys.Algebra Phys.Algebra.LeptonNumerals Phys.Algebra.BandEdgeList Phys.Algebra.Peg
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- CRUX 1: topBandRatio = cutExp(pi/3)^28 (the M/v reciprocal-of-ew closed form)
theorem topBandRatio_eq_pow28 : topBandRatio = cutExp (cutPi / 3) ^ 28 := by
  rw [topBandRatio_eq]
  have hE : cutExp (28 * (cutPi / 3)) = cutExp (cutPi / 3) ^ 28 := by
    have := cutExp_natMul (cutPi / 3) 28
    simpa using this
  have harg : 28 * cutPi / 3 = 28 * (cutPi / 3) := by ring
  rw [harg, hE]

-- CRUX 2: the topBandRatio numeral bracket [54220*1e8, 54226*1e8] via 28th-power
theorem topBandRatio_bracket :
    (54220 * (10 : Cut) ^ 8) ≤ topBandRatio ∧ topBandRatio ≤ 54226 * (10 : Cut) ^ 8 := by
  obtain ⟨hElo, hEhi⟩ := cutExp_pi3_bracket
  have hEpos : (0 : Cut) < cutExp (cutPi / 3) := cutExp_pos _
  have hEloPos : (0 : Cut) < 284965 / 100000 := by norm_num
  have hpow_lo : (284965 / 100000 : Cut) ^ 28 ≤ cutExp (cutPi / 3) ^ 28 :=
    pow_le_pow_left₀ (le_of_lt hEloPos) hElo 28
  have hpow_hi : cutExp (cutPi / 3) ^ 28 ≤ (284966 / 100000 : Cut) ^ 28 :=
    pow_le_pow_left₀ (le_of_lt hEpos) hEhi 28
  rw [topBandRatio_eq_pow28]
  constructor
  · have hkey : (54220 * (10 : Cut) ^ 8) ≤ (284965 / 100000) ^ 28 := by norm_num
    exact le_trans hkey hpow_lo
  · have hkey : ((284966 / 100000 : Cut)) ^ 28 ≤ 54226 * (10 : Cut) ^ 8 := by norm_num
    exact le_trans hpow_hi hkey

end

end M4Probe
