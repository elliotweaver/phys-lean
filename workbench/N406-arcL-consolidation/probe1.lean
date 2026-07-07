import Phys.Algebra.NuclearResidualColour
import Phys.Algebra.AtomicShellPauli
import Phys.Algebra.ChemicalPeriodicity
import Phys.Algebra.CondensedMatterPhaseTransition
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ Module
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.Universality
open Phys.Algebra.AtomicShell
open Phys.Algebra.ChemPeriodic
open Phys.Algebra.PhaseTransition

noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- ── CROSS-TIE A: the terminal carrier dimension 7 governs THREE arc-L rungs ──
-- L2 shell closure, L3 periodicity, L4 exponent — all on the SAME imaginary dim of O ℚ.

theorem probe_dim7_governs :
    Module.finrank ℚ ImO = 7
    ∧ (∀ {N : ℕ}, 7 < N → finrank ℚ (⋀[ℚ]^N Phys.Algebra.ImO) = 0)
    ∧ (∀ Z : ℕ, finrank ℚ (⋀[ℚ]^((Z + 7) % 7) Phys.Algebra.ImO)
          = finrank ℚ (⋀[ℚ]^(Z % 7) Phys.Algebra.ImO)) :=
  ⟨finrank_ImO, fun h => imO_closes_beyond_seven h, imO_valenceSector_dim_periodic⟩

-- ── CROSS-TIE B: the L4 universal exponent denominator IS the ordered-pair count of the
-- same imaginary dimension 7 whose exterior power closes the L2/L3 shells ──
theorem probe_exp_is_channel_count :
    criticalExponent = 1 / (imChannelCount (Module.finrank ℚ ImO) : ℚ)
    ∧ imChannelCount (Module.finrank ℚ ImO)
        = Module.finrank ℚ ImO * (Module.finrank ℚ ImO - 1) := by
  refine ⟨?_, imChannelCount_eq_n_times_n_sub_one _⟩
  rw [criticalExponent_eq_one_div_42, channels_O]; norm_num

-- ── CROSS-TIE C: THE ONE CAUSE — the SAME octonion non-associativity ‖φ‖²=42 is BOTH
-- the residual-force obstruction (L1, nonzero on the cascade-stop witness) AND the
-- denominator of the L4 universal exponent ──
theorem probe_one_cause :
    (assoc (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
        (CD.e2 : O ℚ) ≠ 0)
    ∧ criticalExponent = 1 / assoc3NormSq := by
  refine ⟨Phys.Algebra.NuclearResidual.composite_residual_nonvanishing, ?_⟩
  rw [criticalExponent_eq_one_div_42, assoc3NormSq_eq_42]

-- ── CROSS-TIE D: L3 periodicity restart USES L2 shell closure directly (already-banked
-- weld surfaced): overfill dies (Subsingleton) yet modular restart lives (Nontrivial) ──
theorem probe_l3_uses_l2 :
    Subsingleton (fermiSector (carrierDim + 1))
      ∧ Nontrivial (fermiSector ((carrierDim + 1) % carrierDim)) :=
  filling_restarts

-- ── CROSS-TIE E: carrierDim (L3 period) = finrank of the fibre = 2, distinct from the
-- ImO carrier dim 7 — TWO carriers, ONE closure law ──
theorem probe_two_carriers :
    carrierDim = 2 ∧ Module.finrank ℚ ImO = 7 :=
  ⟨carrierDim_eq, finrank_ImO⟩

end
