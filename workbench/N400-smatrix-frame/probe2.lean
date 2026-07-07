import Mathlib.Tactic
import Phys.Quantum.TransitionAmplitude
import Phys.Algebra.ConfinementMassGap

namespace Phys.Quantum.Probe2

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Algebra Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- W8: the domain/confined split genuinely bites. The confined witness is NOT
-- massless (action ≥ 4 > 0), while the singlet frame IS massless (=0). The gap
-- floor number for the costume: the coloured witness curvature coordinate c7 = 2.
-- Test the concrete separation: 0 < 4 ≤ action_witness, and action_singlet = 0.

theorem separation_nonvacuous :
    bornAction ((1:O ℚ)) ((1:O ℚ)) ((1:O ℚ)) = 0
      ∧ (0:Cut) < bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) := by
  refine ⟨?_, ?_⟩
  · -- 1 ∈ span{1,u1}
    apply bornAction_singlet_zero
    · exact Submodule.subset_span (by simp)
    · exact Submodule.subset_span (by simp)
  · calc (0:Cut) < 4 := by norm_num
      _ ≤ _ := bornAction_witness_floor

-- The costume flag: reuse the c7=2 witness coordinate (already used in N388 area
-- law). Test that assoc_witness_coord is reachable and gives 2.
theorem flag_source :
    (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im = 2 :=
  assoc_witness_coord

-- The full capstone bundle shape test.
noncomputable def scatteringOp (U : Dbl Cut) : StateFibre → StateFibre := evolve U

theorem capstone_shape :
    (∀ U : Dbl Cut, scatteringOp U = evolve U) ∧
    (∀ (U : Dbl Cut), dblNormSq U = 1 → ∀ p : StateFibre,
        bornForm (scatteringOp U p) (scatteringOp U p) = wIn p + wOut p) ∧
    (∀ (U : Dbl Cut) (out inp : StateFibre),
        transAmp U out inp = hInner (toDbl out) (toDbl (scatteringOp U inp))) ∧
    (∀ a b : O ℚ, WorldsGlue a b ↔ ∀ x, bornAction a b x = 0) ∧
    (¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ))
        ∧ (4:Cut) ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) := by
  refine ⟨fun _ => rfl, ?_, fun _ _ _ => rfl, ?_, ?_, ?_⟩
  · intro U hU p; exact unitary_conserves_gather_resolution U hU p
  · intro a b
    rw [flat_iff_curvature_zero]
    constructor
    · intro h x; rw [bornAction]; rw [h x]; simp [gForm_self_eq_zero.mpr rfl]
    · intro h x
      have := h x; rw [bornAction, Rat.cast_eq_zero, gForm_self_eq_zero] at this; exact this
  · exact coloured_witness_not_flat
  · exact bornAction_witness_floor

end Phys.Quantum.Probe2
