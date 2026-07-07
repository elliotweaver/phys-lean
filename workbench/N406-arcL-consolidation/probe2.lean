import Phys.Algebra.NuclearResidualColour
import Phys.Algebra.AtomicShellPauli
import Phys.Algebra.ChemicalPeriodicity
import Phys.Algebra.CondensedMatterPhaseTransition
import Phys.Algebra.InteractionChannelTower
import Phys.Algebra.OctonionStructure3FormNorm
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

-- ★ CROSS-TIE 1: the L4 universal exponent IS the reciprocal of the octonion structure
-- 3-form norm ‖φ‖² (the ascent-side terminal invariant) = 1/42.
theorem exponent_is_structure_form_norm_reciprocal :
    criticalExponent = 1 / assoc3NormSq
      ∧ assoc3NormSq = 42
      ∧ assoc3NormSq = (imChannelCount (Module.finrank ℚ ImO) : ℚ) := by
  refine ⟨?_, assoc3NormSq_eq_42, ?_⟩
  · rw [criticalExponent_eq_one_div_42, assoc3NormSq_eq_42]
  · rw [channels_O_eq_assoc3NormSq]

-- ★ CROSS-TIE 2: the ONE terminal imaginary dimension 7 threads L2 (shell closure),
-- L3 (modular recurrence), L4 (channel count 42 = 7·6).
theorem terminal_dim_threads_ladder :
    Module.finrank ℚ ImO = 7
    ∧ (∀ {N : ℕ}, 7 < N → finrank ℚ (⋀[ℚ]^N Phys.Algebra.ImO) = 0)          -- L2 closure
    ∧ (∀ Z : ℕ, finrank ℚ (⋀[ℚ]^((Z + 7) % 7) Phys.Algebra.ImO)
          = finrank ℚ (⋀[ℚ]^(Z % 7) Phys.Algebra.ImO))                       -- L3 recurrence
    ∧ imChannelCount (Module.finrank ℚ ImO)
        = Module.finrank ℚ ImO * (Module.finrank ℚ ImO - 1)                  -- L4 count = 7·6
    ∧ imChannelCount (Module.finrank ℚ ImO) = 42 :=
  ⟨finrank_ImO, fun h => imO_closes_beyond_seven h,
   imO_valenceSector_dim_periodic, imChannelCount_eq_n_times_n_sub_one _, channels_O⟩

-- ★ CROSS-TIE 3: THE ONE CAUSE — the terminal-algebra non-associativity is BOTH L1's
-- residual force (nonzero at the cascade-stop witness) AND L4's exponent denominator.
theorem ladder_one_cause_nonassociativity :
    (assoc (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
        (CD.e2 : O ℚ) ≠ 0)                                                    -- L1 residual ≠ 0
    ∧ (¬ ∀ x y z : O ℚ, (x * y) * z = x * (y * z))                          -- cascade stop
    ∧ criticalExponent = 1 / assoc3NormSq := by                             -- L4 exponent
  refine ⟨Phys.Algebra.NuclearResidual.composite_residual_nonvanishing,
          not_associative, ?_⟩
  rw [criticalExponent_eq_one_div_42, assoc3NormSq_eq_42]

-- ★★ THE CAPSTONE (non-hollow): the three cross-ties + one representative landing per rung.
theorem emergent_matter_ladder :
    -- L1: residual colour — the nuclear force is the nonzero coloured leakage
    (assoc (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
        (CD.e2 : O ℚ) ≠ 0)
    -- L2: shell closure on the terminal carrier
    ∧ (∀ {N : ℕ}, 7 < N → finrank ℚ (⋀[ℚ]^N Phys.Algebra.ImO) = 0)
    -- L3: modular recurrence forced by the closure
    ∧ (Subsingleton (fermiSector (carrierDim + 1))
        ∧ Nontrivial (fermiSector ((carrierDim + 1) % carrierDim)))
    -- L4: the universal exponent = 1/‖φ‖²
    ∧ criticalExponent = 1 / assoc3NormSq
    -- THE ONE CAUSE threading all four: terminal-algebra non-associativity, dim 7, 42
    ∧ (¬ ∀ x y z : O ℚ, (x * y) * z = x * (y * z))
    ∧ Module.finrank ℚ ImO = 7
    ∧ assoc3NormSq = (imChannelCount (Module.finrank ℚ ImO) : ℚ) := by
  refine ⟨Phys.Algebra.NuclearResidual.composite_residual_nonvanishing,
          fun h => imO_closes_beyond_seven h, filling_restarts, ?_,
          not_associative, finrank_ImO, ?_⟩
  · rw [criticalExponent_eq_one_div_42, assoc3NormSq_eq_42]
  · rw [channels_O_eq_assoc3NormSq]

-- W8 non-vacuity: the threaded number is genuinely 42, not degenerate.
theorem ladder_number_nonvacuous :
    assoc3NormSq = 42 ∧ assoc3NormSq ≠ 0 ∧ assoc3NormSq ≠ 49 :=
  ⟨assoc3NormSq_eq_42, assoc3NormSq_ne_zero, assoc3NormSq_ne_49⟩

end
