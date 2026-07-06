-- W9 PROBE: N345 arc-D D7 consolidation — the flavor+gauge prediction table.
-- Measure: does the single capstone conjunction of the banked D2–D6 + gauge capstones
-- typecheck by pure citation (no new number, no re-proof)? And what does it cost?
import Phys.Algebra.GenerationJarlskogInvariantNumeric
import Phys.Algebra.WeinbergAngleRunning
import Mathlib.Tactic

namespace Phys.Algebra
namespace ArcDPredictionProbe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.GenerationMixingAngles
open Phys.Algebra.GenerationJarlskog

noncomputable section

/-- gauge structural sin²θ_W = 3/8 over the derived ℝ, grounded to the banked ℚ colour dim. -/
def weinbergStructural : Cut := ((weinberg 2 (ladderChargeTrace (Module.finrank ℚ Uhol)) : ℚ) : Cut)

theorem weinbergStructural_eq : weinbergStructural = 3 / 8 := by
  unfold weinbergStructural; rw [weinberg_delivers_3_8]; norm_num

/-- THE PREDICTION TABLE — a single conjunction bundling every banked arc-D forced landing,
    each cited from its banked capstone (no new number, no re-proof). -/
theorem flavor_gauge_prediction_table :
    -- ══ FLAVOR (dimensionless) ══ D2: lepton mass ratios + Koide + spectrum
    ( ((483 : Cut) / 100000 * mass2 ≤ mass1 ∧ mass1 ≤ (485 : Cut) / 100000 * mass2)
      ∧ ((594 : Cut) / 10000 * mass0 ≤ mass2 ∧ mass2 ≤ (595 : Cut) / 10000 * mass0)
      ∧ (mass0 + mass1 + mass2 = 6)
      ∧ (mass1 < mass2 ∧ mass2 < mass0)
      ∧ ((0 : Cut) < mass2 / mass0 ∧ mass2 / mass0 < 1) )
    -- D5: mixing angles (leading-order)
    ∧ ( (∀ (ai aj : Cut), sinSqMix (ai ^ 2) (aj ^ 2) = ai ^ 2 / (ai ^ 2 + aj ^ 2))
        ∧ (∀ (ms ml : Cut), ml ≠ 0 → ms + ml ≠ 0 → sinSqMix ms ml = (ms / ml) / (1 + ms / ml))
        ∧ (∀ (ms ml : Cut), ms + ml ≠ 0 → sinSqMix ms ml + cosSqMix ms ml = 1)
        ∧ ((481 : Cut) / 100000 ≤ sinSqMix mass1 mass2 ∧ sinSqMix mass1 mass2 ≤ (482 : Cut) / 100000)
        ∧ ((561 : Cut) / 10000 ≤ sinSqMix mass2 mass0 ∧ sinSqMix mass2 mass0 ≤ (562 : Cut) / 10000)
        ∧ ((287 : Cut) / 1000000 ≤ sinSqMix mass1 mass0 ∧ sinSqMix mass1 mass0 ≤ (288 : Cut) / 1000000)
        ∧ (sinSqMix mass1 mass0 < sinSqMix mass1 mass2 ∧ sinSqMix mass1 mass2 < sinSqMix mass2 mass0)
        ∧ ((0 : Cut) < sinSqMix mass1 mass2 ∧ sinSqMix mass1 mass2 < 1) )
    -- D6: Jarlskog CP invariant (leading-order; sign + order of magnitude)
    ∧ ( ((∀ (x : O ℚ) (b d : ℚ), assoc3 x (b • u1) (d • u1) = 0)
          ∧ assoc3 u2 u1 (octCross u1 u2) ≠ 0)
        ∧ cpPhase ^ 2 = 1
        ∧ jarlskogSq = g12 * g23 * h13
        ∧ ((72 : Cut) / 1000000000 ≤ jarlskogSq ∧ jarlskogSq ≤ (74 : Cut) / 1000000000)
        ∧ ((268 : Cut) / 1000000 ≤ jarlskog ∧ jarlskog ≤ (273 : Cut) / 1000000)
        ∧ (0 : Cut) < jarlskog )
    -- ══ GAUGE (structural constants) ══ D3/D4: α* = 1/42 and sin²θ_W = 3/8
    ∧ ( invAlphaHigh = 42 ∧ weinbergStructural = 3 / 8 )
    -- D3 running: the coupling's scale reading (screening: 1/α runs up below the octonion scale)
    ∧ ( ∀ (κ M μ : Cut), 0 < κ → 0 < μ → μ < M →
          invAlphaRun κ M M = invAlphaHigh
          ∧ invAlphaRun κ M μ = 42 + κ * (16 / 3) * cutLog (M / μ)
          ∧ invAlphaHigh < invAlphaRun κ M μ )
    -- D4 running: the Weinberg angle's scale reading (runs down toward the low-scale regime)
    ∧ ( ∀ (κ M μ : Cut), 0 < κ → 0 < μ → μ < M → invAlpha2 isoDepth κ M μ ≠ 0 →
          sinSqRun isoDepth κ M M = 3 / 8
          ∧ sinSqRun isoDepth κ M μ = 3 / 8
          ∧ (∀ d2 : Cut, 0 < d2 → d2 < isoDepth → sinSqRun d2 κ M μ < 3 / 8) ) := by
  refine ⟨generation_mass_ratios_numeric, generation_mixing_angles_numeric,
    generation_jarlskog_numeric, ⟨invAlphaHigh_eq, weinbergStructural_eq⟩,
    fun κ M μ hκ hμ hμM => fineStructureRunning_reading κ M μ hκ hμ hμM,
    fun κ M μ hκ hμ hμM h2 => weinberg_running_reading κ M μ hκ hμ hμM h2⟩

end

end ArcDPredictionProbe
end Phys.Algebra
