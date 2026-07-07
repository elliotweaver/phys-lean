import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Measurement
import Phys.Quantum.Composite

namespace Phys.Quantum.ProbeJ6

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Quantum
open scoped TensorProduct

/-! WELD 1 — THE ONE OPERATOR. The complex structure foldComplex (=J₂) that GENERATES
    the wave face ω (kahlerForm x y = bornForm (foldComplex x) y, N393) is the SAME
    phase the Born weight is BLIND to (N394): the Born weight is invariant under
    applying the fibre's own complex structure. Welds J3's ω-generator to J4's
    phase-blindness — never banked as a TYPE. -/
theorem bornWeight_foldComplex_invariant (p : StateFibre) :
    dblNormSq (toDbl (foldComplex p)) = dblNormSq (toDbl p) := by
  rw [toDbl_foldComplex]; exact totalWeight_phase_blind p

/-! WELD 2 — THE ONE VACUUM. Two INDEPENDENT trunk facts pick out the SAME state:
    Born POSITIVITY (bornForm p p = 0 ↔ p = 0, N391) and self-blindness C6
    (foldComplex p = p ↔ p = 0, N392/N395). So the Born-null state IS the
    self-blind fixed state. Welds J1's positivity to J2's self-blindness. -/
theorem null_iff_self_blind (p : StateFibre) :
    bornForm p p = 0 ↔ foldComplex p = p := by
  rw [vacuum_unique_zero p, ← vacuum_unique_J_fixed p]

/-! WELD 3 — THE ONE ω (duality = decoherence). Between the two measurement outcomes,
    the WAVE face carries the (discarded) coherence while the PARTICLE face vanishes:
    duality's two faces ARE the measurement's kept/discarded split. Welds J5 duality
    to J4 decoherence. -/
theorem duality_is_decoherence_split (p : StateFibre) :
    waveFace (gatherIn p) (gatherOut p) = coherence p ∧
      particleFace (gatherIn p) (gatherOut p) = 0 := by
  refine ⟨rfl, ?_⟩
  exact coherence_real_blind p

-- non-vacuity check: the two faces are genuinely different (1 ≠ 0) on the diagonal.
theorem duality_nonvacuous :
    coherence (eInward + eOutward) = 1 ∧
      particleFace (gatherIn (eInward + eOutward)) (gatherOut (eInward + eOutward)) = 0 :=
  ⟨coherence_diag, coherence_real_blind _⟩

end Phys.Quantum.ProbeJ6
