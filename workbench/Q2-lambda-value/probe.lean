import Phys.Algebra.SeesawScale
import Phys.Algebra.ScaleTowerNumeratorLock
import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.NoDialDissolutionTheorems
import Mathlib.Tactic

/-!  MEASURE-FIRST probe for Q2 (the Λ value — saturation-residue mechanism). -/

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD Phys.Algebra.dblModuleQ Phys.Algebra.cdModuleQ

namespace Phys.Algebra.Q2Probe

-- banked objects resolve
example (M : Cut) (hM : 0 < M) : 0 < seesawScale M := seesawScale_pos M hM
example : channelCount = 42 := channelCount_eq
example : Module.finrank ℚ STV4 = 4 := finrank_STV4
example (c : Cut) : plateauApproachPot c 0 = 0 := Phys.Algebra.NoDial.lambda_vacuum_zero c
example (s : Cut) : Phys.Algebra.NoDial.selfOverlap s = s ^ 2 := rfl

-- === CORE STRUCTURAL PIECES ===

noncomputable def residualScale (M : Cut) : Cut := seesawScale M / channelCount

noncomputable def vacDensity (M : Cut) : Cut := residualScale M ^ (Module.finrank ℚ STV4)

-- the exponent IS the derived spacetime dimension 4
example (M : Cut) : vacDensity M = residualScale M ^ 4 := by
  unfold vacDensity; rw [finrank_STV4]

-- the fourth power IS the iterated Born self-overlap (self-overlap of the self-overlap)
example (s : Cut) :
    Phys.Algebra.NoDial.selfOverlap (Phys.Algebra.NoDial.selfOverlap s) = s ^ 4 := by
  unfold Phys.Algebra.NoDial.selfOverlap; ring

-- positivity: the residue density is > 0 for M > 0
example (M : Cut) (hM : 0 < M) : 0 < vacDensity M := by
  unfold vacDensity residualScale
  have hs : 0 < seesawScale M := seesawScale_pos M hM
  have hc : (0:Cut) < channelCount := by rw [channelCount_eq]; norm_num
  rw [finrank_STV4]; positivity

-- the residue is STRICTLY below the naive m₀⁴ (suppressed by the divisor 42 > 1)
example (M : Cut) (hM : 0 < M) : vacDensity M < seesawScale M ^ 4 := by
  unfold vacDensity residualScale
  have hs : 0 < seesawScale M := seesawScale_pos M hM
  have hc : (0:Cut) < channelCount := by rw [channelCount_eq]; norm_num
  rw [finrank_STV4, channelCount_eq]
  have hlt : seesawScale M / 42 < seesawScale M := by
    rw [div_lt_iff₀ (by norm_num : (0:Cut) < 42)]; nlinarith
  have hnn : 0 ≤ seesawScale M / 42 := le_of_lt (by positivity)
  exact pow_lt_pow_left₀ hlt hnn (by norm_num)

-- the bare constant is 0 (N372) while the residue is nonzero — genuinely distinct objects
example (M : Cut) (hM : 0 < M) :
    (plateauApproachPot 1 0 = 0) ∧ vacDensity M ≠ plateauApproachPot 1 0 := by
  refine ⟨Phys.Algebra.NoDial.lambda_vacuum_zero 1, ?_⟩
  rw [Phys.Algebra.NoDial.lambda_vacuum_zero 1]
  have hpos : 0 < vacDensity M := by
    unfold vacDensity residualScale
    have hs : 0 < seesawScale M := seesawScale_pos M hM
    have hc : (0:Cut) < channelCount := by rw [channelCount_eq]; norm_num
    rw [finrank_STV4]; positivity
  exact ne_of_gt hpos

end Phys.Algebra.Q2Probe
