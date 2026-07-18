import Phys.Algebra.LeptonMassNumerals
import Phys.Algebra.BandEdgeList
import Mathlib.Tactic

namespace Phys.Algebra.M3Probe

open Phys.Algebra Phys.Algebra.LeptonNumerals Phys.Algebra.BandEdgeList
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- CRUX 1: the confinementScaleRatio reciprocal norm_num (36th power)
example : (42408 / (10 : Cut) ^ 21) * (284966 / 100000) ^ 36 ≤ 1 := by norm_num
example : (1 : Cut) ≤ (42414 / (10 : Cut) ^ 21) * (284965 / 100000) ^ 36 := by norm_num

-- CRUX 2: v/Lambda = E^8 bracket rationals
example : (4347 : Cut) ≤ (284965 / 100000) ^ 8 := by norm_num
example : ((284966 / 100000 : Cut)) ^ 8 ≤ 4350 := by norm_num

-- CRUX 3: M/Lambda = E^36 bracket rationals
example : (23577 * (10:Cut)^12) ≤ (284965 / 100000) ^ 36 := by norm_num
example : ((284966 / 100000 : Cut)) ^ 36 ≤ 23581 * (10:Cut)^12 := by norm_num

end

end Phys.Algebra.M3Probe
