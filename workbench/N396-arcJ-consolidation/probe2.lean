import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Measurement
import Phys.Quantum.Composite

namespace Phys.Quantum.ProbeJ6b

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Quantum
open scoped TensorProduct

/-! WELD 3 STRENGTHENED — the transition probability between the two measurement
    outcome components is EXACTLY the discarded coherence squared (pure wave). Ties
    J5 (born_two_faces / duality) to J4 (coherence / decoherence): the interference
    the gather throws away is precisely the Born overlap of the two outcome faces. -/
theorem outcome_prob_is_coherence_sq (p : StateFibre) :
    bornProb (gatherIn p) (gatherOut p) = (coherence p) ^ 2 := by
  rw [born_two_faces]
  have hp : particleFace (gatherIn p) (gatherOut p) = 0 := coherence_real_blind p
  have hw : waveFace (gatherIn p) (gatherOut p) = coherence p := rfl
  rw [hp, hw]; ring

-- non-vacuity: on the diagonal superposition the outcome overlap is 1 (pure wave, nonzero).
theorem outcome_prob_diag :
    bornProb (gatherIn (eInward + eOutward)) (gatherOut (eInward + eOutward)) = 1 := by
  rw [outcome_prob_is_coherence_sq, coherence_diag]; ring

end Phys.Quantum.ProbeJ6b
