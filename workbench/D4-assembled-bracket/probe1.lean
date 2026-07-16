import Phys.Algebra.DepthWeight
import Phys.Algebra.SubBandCompletion
import Phys.Foundation.ContinuumBracket
import Mathlib.Tactic

namespace Probe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.AbsMass
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- cutLog monotone, built from D1's transfer lemma. -/
theorem cutLog_mono {x y : Cut} (hx : 0 < x) (hxy : x ≤ y) : cutLog x ≤ cutLog y := by
  have hy : 0 < y := lt_of_lt_of_le hx hxy
  have hinv : cutExp (cutLog y) = y := cutExp_cutLog hy
  have h : x ≤ cutExp (cutLog y) := by rw [hinv]; exact hxy
  exact cutLog_le_of_le_expLower hx h

/-- TEST 1: lower bound on cutLog(mass0/mass1) via banked cutLog 3 ∈[1,2] + mono. -/
theorem test_clog_lo : (1 : Cut) ≤ cutLog (mass0 / mass1) := by
  have h3 : (3 : Cut) ≤ mass0 / mass1 := by
    have := m01_bracket_lo   -- 1e9/288575 ≤ mass0/mass1
    have h : (3 : Cut) ≤ (1000000000 : Cut) / 288575 := by norm_num
    linarith
  have hmono : cutLog 3 ≤ cutLog (mass0 / mass1) := cutLog_mono (by norm_num) h3
  have hlo : (1 : Cut) ≤ cutLog 3 := cutLog_three_bracket.1
  linarith

/-- TEST 2 (COST): upper bound on cutLog(mass0/mass1) via mono to 1e9/286902 then D1 upper at b=9. -/
theorem test_clog_hi : cutLog (mass0 / mass1) ≤ 9 := by
  have hup : mass0 / mass1 ≤ (1000000000 : Cut) / 286902 := m01_bracket_hi
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((1000000000 : Cut) / 286902) :=
    cutLog_mono (lt_of_lt_of_le (by norm_num : (0:Cut) < 1000000000/288575) m01_bracket_lo) hup
  have hbnd : cutLog ((1000000000 : Cut) / 286902) ≤ 9 := by
    apply cutLog_le_certified ((1000000000 : Cut) / 286902) 9 9 (by norm_num) (by norm_num)
    -- need 1e9/286902 ≤ partialExp 9 9
    show (1000000000 : Cut) / 286902 ≤ partialExp 9 9
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

end

end Probe
