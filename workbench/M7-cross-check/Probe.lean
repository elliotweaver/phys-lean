import Phys.Algebra.LightQuarkNumerals
import Phys.Algebra.ScaleTowerNumerals
import Phys.Algebra.UnitPeg
import Mathlib.Tactic

namespace M7Probe

open Phys.Algebra Phys.Algebra.LightQuarkNumerals
open Phys.Algebra.HeavyQuarkNumerals
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.LeptonNumerals Phys.Algebra.ConfNumeral Phys.Algebra.TowerNumerals
open Phys.Algebra.BandEdgeList
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- CRUX 1: the Koide straddle — the three independently-bracketed relative Born squares
-- sum to an interval STRADDLING the exact Koide total 6.
theorem koide_overconstraint :
    ((56616871249 : Cut) / 10000000000 + 16273156 / 10000000000 + 33663204 / 100000000
        ≤ mass0 + mass1 + mass2)
    ∧ (mass0 + mass1 + mass2
        ≤ 56617347136 / 10000000000 + 1629333225 / 1000000000000 + 3366552484 / 10000000000)
    ∧ (mass0 + mass1 + mass2 = 6) := by
  have h0lo := mass0_lo; have h0hi := mass0_hi
  have h1lo := mass1_lo; have h1hi := mass1_hi
  have h2lo := mass2_lo; have h2hi := mass2_hi
  refine ⟨?_, ?_, koide_total⟩
  · -- lower ends sum ≤ actual sum ; each lo bracket is `a/1eN * a/1eN`, normalize
    have e0 : (56616871249 : Cut) / 10000000000 = (237943 : Cut) / 100000 * (237943 / 100000) := by norm_num
    have e1 : (16273156 : Cut) / 10000000000 = (4034 : Cut) / 100000 * (4034 / 100000) := by norm_num
    have e2 : (33663204 : Cut) / 100000000 = (5802 : Cut) / 10000 * (5802 / 10000) := by norm_num
    rw [e0, e1, e2]; linarith
  · have e0 : (56617347136 : Cut) / 10000000000 = (237944 : Cut) / 100000 * (237944 / 100000) := by norm_num
    have e1 : (1629333225 : Cut) / 1000000000000 = (40365 : Cut) / 1000000 * (40365 / 1000000) := by norm_num
    have e2 : (3366552484 : Cut) / 10000000000 = (58022 : Cut) / 100000 * (58022 / 100000) := by norm_num
    rw [e0, e1, e2]; linarith

-- Simpler straddle statement: the digit brackets straddle the exact 6 as pure rationals.
theorem koide_straddle_6 :
    ((56616871249 : Cut) / 10000000000 + 16273156 / 10000000000 + 33663204 / 100000000 ≤ 6)
    ∧ ((6 : Cut) ≤ 56617347136 / 10000000000 + 1629333225 / 1000000000000 + 3366552484 / 10000000000) := by
  constructor <;> norm_num

-- CRUX 2: CC4 — the M6 light placements ratioed reproduce the N340 within-sector m_d/m_s bracket
-- (downConfBundle cancels). lightBandDown = downConfBundle·bMass1, lightBandStrange = downConfBundle·bMass2.
theorem lightPlacement_ratio_reproduces_N340 :
    (483 : Cut) / 100000 * lightBandStrange ≤ lightBandDown
      ∧ lightBandDown ≤ (485 : Cut) / 100000 * lightBandStrange := by
  have hdpos : (0 : Cut) < downConfBundle := downConfBundle_pos
  have hb1 : bMass 1 = mass1 := rfl
  have hb2 : bMass 2 = mass2 := rfl
  obtain ⟨hlo, hhi⟩ := massRatio_1_2
  unfold lightBandDown lightBandStrange
  rw [hb1, hb2]
  constructor
  · -- 483/1e5·(dc·mass2) ≤ dc·mass1  ⟸  483/1e5·mass2 ≤ mass1  (× dc>0)
    have := mul_le_mul_of_nonneg_left hlo (le_of_lt hdpos)
    nlinarith [this]
  · have := mul_le_mul_of_nonneg_left hhi (le_of_lt hdpos)
    nlinarith [this]

-- CRUX 3: CC3 — the confBandRatio triple reading is one object.
theorem confBandRatio_triple_reading :
    ((4347 : Cut) ≤ confBandRatio ∧ confBandRatio ≤ 4350)
    ∧ (bandScreen chargeTraceDepth confBandRatio = 128 / 27)
    ∧ (downConfBundle = mbRatioDerived * confBandRatio) :=
  ⟨confBandRatio_bracket, confBand_128_27_free, downConfBundle_as_mul⟩

end

end M7Probe
