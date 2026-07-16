-- MEASURE-FIRST probe (W9): confirm every banked stance theorem is citable with the
-- exact signature the registry will re-export. No new content; just wiring checks.
import Phys.Algebra.CosmoDarkEnergyEquationOfState
import Phys.Algebra.NeutrinoMassSum
import Phys.Algebra.ProtonStabilitySelectionRule
import Phys.Algebra.CKMTwoSectorPhase
import Phys.Algebra.CosmoLambdaSaturationResidue
import Phys.Algebra.CascadeFoldPhase
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Matrix

noncomputable section

-- STANCE 1: dark energy w = -1 exact
example (Λ : Cut) (hΛ : Λ ≠ 0) :
    Phys.Algebra.cosmoPressure Λ / Phys.Algebra.cosmoDensity Λ = -1 :=
  Phys.Algebra.equationOfState_eq_neg_one Λ hΛ

example (Λ : Cut) (hΛ : Λ ≠ 0) :
    Phys.Algebra.cosmoPressure Λ ≠ Phys.Algebra.cosmoDensity Λ :=
  Phys.Algebra.w_neg_one_load_bearing Λ hΛ

-- STANCE 2: neutrino mass sum rides ONE scale (= scaleTowerRung 9 (-2))
example (D : Matrix (Fin 3) (Fin 3) Cut) (M g2 : Cut) (hM : M ≠ 0) (hg : g2 ≠ 0)
    (hnorm : Phys.Algebra.diracSelfOverlap D = (Phys.Algebra.vevScale M g2) ^ 2) :
    Phys.Algebra.neutrinoMassSum D M / M = Phys.Algebra.scaleTowerRung 9 (-2) :=
  Phys.Algebra.neutrinoMassSum_over_M_eq_rung D M g2 hM hg hnorm

example (D : Matrix (Fin 3) (Fin 3) Cut) : 0 ≤ Phys.Algebra.diracSelfOverlap D :=
  Phys.Algebra.diracSelfOverlap_nonneg D

-- STANCE 3: proton stability — a single-proton decay ΔB = -1 is forbidden
example (k : ℤ) :
    Phys.Algebra.baryonShift (Module.finrank ℚ Phys.Algebra.Uhol) k ≠ -1 :=
  Phys.Algebra.proton_decay_forbidden k

example (k : ℤ) :
    Phys.Algebra.baryonShift (Module.finrank ℚ Phys.Algebra.Uhol) k = 3 * k :=
  Phys.Algebra.baryon_violation_quantum k

-- STANCE 4: CKM Jarlskog — the corrected non-maximal invariant with a bracket
example : (189 : Cut) / 1000000 ≤ Phys.Algebra.CKMTwoSectorPhase.jarlskogCorrected :=
  Phys.Algebra.CKMTwoSectorPhase.jarlskogCorrected_lo
example : Phys.Algebra.CKMTwoSectorPhase.jarlskogCorrected ≤ (193 : Cut) / 1000000 :=
  Phys.Algebra.CKMTwoSectorPhase.jarlskogCorrected_hi
example : Phys.Algebra.CKMTwoSectorPhase.cpFactorDerived = 1 / 2 :=
  Phys.Algebra.CKMTwoSectorPhase.cpFactorDerived_eq_half

-- STANCE 5: fold-phase law — P = cutPi/8, 2P = cutPi/4
example : Phys.Algebra.FoldPhase.foldPhase = cutPi / 8 := rfl
example : (2 : Cut) * Phys.Algebra.FoldPhase.foldPhase = cutPi / 4 :=
  Phys.Algebra.CKMTwoSectorPhase.twoP_eq_quarter

-- STANCE 6: Λ saturation residue + the JOINT-KILL cross-tie (SAME m₀ as Σm_ν)
example (M : Cut) (hM : 0 < M) :
    Phys.Algebra.Cosmo.vacuumResidueDensity M = Phys.Algebra.Cosmo.residualScale M ^ 4 :=
  Phys.Algebra.Cosmo.vacuumResidueDensity_eq_fourth_power M

example : Phys.Algebra.plateauApproachPot 1 0 = 0 :=
  Phys.Algebra.Cosmo.bareCosmoConstant_zero 1

-- THE MARQUEE JOINT-KILL: Λ residue scale = neutrinoMassSum / channelCount (ONE object)
example (D : Matrix (Fin 3) (Fin 3) Cut) (M g2 : Cut)
    (hM : M ≠ 0) (hg : g2 ≠ 0)
    (hnorm : Phys.Algebra.diracSelfOverlap D = (Phys.Algebra.vevScale M g2) ^ 2) :
    Phys.Algebra.Cosmo.residualScale M
      = Phys.Algebra.neutrinoMassSum D M / Phys.Algebra.channelCount :=
  Phys.Algebra.Cosmo.residue_rides_seesaw_scale D M g2 hM hg hnorm

example : Phys.Algebra.channelCount = 42 := Phys.Algebra.channelCount_eq

end
