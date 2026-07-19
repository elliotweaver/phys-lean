import Phys.Algebra.PerChannelRecombination
import Phys.Algebra.AssembledBracket
import Phys.Foundation.ContinuumBracket
import Mathlib.Tactic

namespace Phys.Algebra.D7Probe2

open Phys.Algebra
open Phys.Algebra.AssembledBracket
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra.RecomposedRunningEndpoint
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.FreezeoutEdgeNumerals
open Phys.Algebra.PerChannelRecomb
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- Abstract arithmetic core for the endpoint bracket: opaque κ, L (=cutLog m01), Lmb, Lb0, Lb2 with
    their bracket hypotheses. Keep transcendentals out of arithmetic. Endpoint expands to
    2425/18 + κ·(2L + (7/3)Lmb + (11/3)Lb0 − (5/3)Lb2).  Show it sits in [3406/25, 13639/100]. -/
theorem endpoint_core (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (1250000000 / 3926990817 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000 / 157079632679 : Cut) / 3)
    (hL : (8 : Cut) ≤ L ∧ L ≤ 82/10)
    (hLmb : (-41/10 : Cut) ≤ Lmb ∧ Lmb ≤ -4)
    (hLb0 : (17/10 : Cut) ≤ Lb0 ∧ Lb0 ≤ 18/10)
    (hLb2 : (-(12/10) : Cut) ≤ Lb2 ∧ Lb2 ≤ -1) :
    (3406/25 : Cut) ≤ 2425/18 + k * (2*L + (7/3)*Lmb + (11/3)*Lb0 - (5/3)*Lb2)
      ∧ 2425/18 + k * (2*L + (7/3)*Lmb + (11/3)*Lb0 - (5/3)*Lb2) ≤ 13639/100 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  -- combo ∈ [43/3, 47/3]
  have hcombo_lo : (43/3 : Cut) ≤ 2*L + (7/3)*Lmb + (11/3)*Lb0 - (5/3)*Lb2 := by nlinarith
  have hcombo_hi : 2*L + (7/3)*Lmb + (11/3)*Lb0 - (5/3)*Lb2 ≤ 47/3 := by nlinarith
  set C := 2*L + (7/3)*Lmb + (11/3)*Lb0 - (5/3)*Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  constructor
  · -- lower: k*C ≥ klo * (43/3)
    have h1 : k * C ≥ ((1250000000 / 3926990817 : Cut) / 3) * (43/3) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos)
      linarith [this]
    have h2 : ((1250000000 / 3926990817 : Cut) / 3) * (43/3) ≥ 3406/25 - 2425/18 := by norm_num
    linarith
  · -- upper: k*C ≤ khi * (47/3)
    have h1 : k * C ≤ ((50000000000 / 157079632679 : Cut) / 3) * (47/3) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity)
      linarith [this]
    have h2 : ((50000000000 / 157079632679 : Cut) / 3) * (47/3) ≤ 13639/100 - 2425/18 := by norm_num
    linarith

end

end Phys.Algebra.D7Probe2
