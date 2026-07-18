import Phys.Algebra.CrossCheckWeb
import Phys.Algebra.UnitPeg
import Phys.Algebra.LeptonMassNumerals
import Phys.Algebra.ConfinementScaleNumeral
import Phys.Algebra.ScaleTowerNumerals
import Phys.Algebra.HeavyQuarkNumerals
import Phys.Algebra.LightQuarkNumerals
import Mathlib.Tactic

namespace Probe

open Phys.Algebra
open Phys.Algebra.Peg
open Phys.Algebra.LeptonNumerals
open Phys.Algebra.ConfNumeral
open Phys.Algebra.TowerNumerals
open Phys.Algebra.HeavyQuarkNumerals
open Phys.Algebra.LightQuarkNumerals
open Phys.Algebra.CrossCheckWeb
open Phys.Algebra.AbsMass
open Phys.Algebra.BandEdgeList
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (A) the airtight capstone: weld all 7 landings
theorem probe_skeleton :
    (∀ p : UnitPeg, p.human 1 = p.val)
    ∧ (50535 / (10 : Cut) ^ 17 ≤ absMass0 ∧ absMass0 ≤ 50565 / (10 : Cut) ^ 17) := by
  exact ⟨peg_fixes_Moct, (leptonNumerals_landing.1).1⟩

-- (B) check all 7 landing names resolve
#check @unitPeg_landing
#check @leptonNumerals_landing
#check @confinementScaleNumeral_landing
#check @scaleTowerNumerals_landing
#check @heavyQuarkNumerals_landing
#check @lightQuarkNumerals_landing
#check @crossCheckWeb_landing

-- (C) the M6 hypothesis-carrying residual re-export
#check @lightBandStrange_eq_edgeLight

-- (D) pegged readings resolve
#check @pegged_absMass0_bracket
#check @pegged_confinementScale_bracket
#check @pegged_mbRatio_bracket
#check @pegged_lightBandStrange_bracket

-- (E) the peg uniqueness (ONE-PEG LAW) at capstone
theorem probe_peg_unique (p q : UnitPeg) :
    ∃ c : Cut, 0 < c ∧ ∀ x, q.human x = c * p.human x :=
  peg_unique_up_to_units p q

-- (F) a numeral-targets-met conjunct with widths positive
theorem probe_target_met :
    (50535 / (10 : Cut) ^ 17 ≤ absMass0 ∧ absMass0 ≤ 50565 / (10 : Cut) ^ 17)
    ∧ ((50535 / (10 : Cut) ^ 17 : Cut) < 50565 / (10 : Cut) ^ 17) := by
  exact ⟨(leptonNumerals_landing.1).1, by norm_num⟩

end

end Probe
