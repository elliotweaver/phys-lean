import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule

namespace Phys.Quantum.MeasProbe3
open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Quantum

-- gatherers tied DIRECTLY to the banked N391 orthonormal frame
noncomputable def gatherIn  (p : StateFibre) : StateFibre := p.1 • eInward
noncomputable def gatherOut (p : StateFibre) : StateFibre := p.2 • eOutward

theorem gatherIn_apply  (p : StateFibre) : gatherIn p = (p.1, 0) := by
  unfold gatherIn eInward; apply Prod.ext <;> simp
theorem gatherOut_apply (p : StateFibre) : gatherOut p = (0, p.2) := by
  unfold gatherOut eOutward; apply Prod.ext <;> simp

-- ★ resolution of Unity = the banked N391 fibre decomposition (the gather IS fibre_decomp)
theorem gather_resolves_unity (p : StateFibre) : gatherIn p + gatherOut p = p :=
  (fibre_decomp p).symm

-- idempotent + orthogonal
theorem gatherIn_idem  (p : StateFibre) : gatherIn (gatherIn p) = gatherIn p := by
  simp [gatherIn_apply]
theorem gatherOut_idem (p : StateFibre) : gatherOut (gatherOut p) = gatherOut p := by
  simp [gatherOut_apply]
theorem gatherIn_gatherOut (p : StateFibre) : gatherIn (gatherOut p) = 0 := by
  rw [gatherOut_apply, gatherIn_apply]; simp
theorem gatherOut_gatherIn (p : StateFibre) : gatherOut (gatherIn p) = 0 := by
  rw [gatherIn_apply, gatherOut_apply]; simp

-- total gather μ, idempotent (μ∘μ=μ)
noncomputable def totalGather (p : StateFibre) : StateFibre := gatherIn p + gatherOut p
theorem totalGather_eq (p : StateFibre) : totalGather p = p := gather_resolves_unity p
theorem totalGather_idem (p : StateFibre) : totalGather (totalGather p) = totalGather p := by
  rw [totalGather_eq, totalGather_eq]

-- Born weights + conservation
noncomputable def wIn  (p : StateFibre) : ContinuumQ.Cut := bornForm (gatherIn p) (gatherIn p)
noncomputable def wOut (p : StateFibre) : ContinuumQ.Cut := bornForm (gatherOut p) (gatherOut p)
theorem wIn_eq  (p : StateFibre) : wIn p = p.1 ^ 2 := by
  unfold wIn bornForm; rw [gatherIn_apply]; ring
theorem wOut_eq (p : StateFibre) : wOut p = p.2 ^ 2 := by
  unfold wOut bornForm; rw [gatherOut_apply]; ring
theorem outcome_weights_sum (p : StateFibre) : wIn p + wOut p = bornForm p p := by
  unfold wIn wOut bornForm; rw [gatherIn_apply, gatherOut_apply]; ring
theorem outcome_probs_sum_to_one (p : StateFibre) (h : bornForm p p ≠ 0) :
    wIn p / bornForm p p + wOut p / bornForm p p = 1 := by
  rw [← add_div, outcome_weights_sum]; exact div_self h

-- ★ decoherence: coherence between outcomes is the Kähler/ω off-diagonal, REAL-BLIND
noncomputable def coherence (p : StateFibre) : ContinuumQ.Cut := kahlerForm (gatherIn p) (gatherOut p)
theorem coherence_eq (p : StateFibre) : coherence p = p.1 * p.2 := by
  unfold coherence; rw [kahlerForm_apply, gatherIn_apply, gatherOut_apply]; simp
theorem coherence_real_blind (p : StateFibre) : bornForm (gatherIn p) (gatherOut p) = 0 := by
  unfold bornForm; rw [gatherIn_apply, gatherOut_apply]; ring
-- non-vacuity: there IS coherence before the gather (diagonal superposition), total weight blind to it
theorem coherence_diag : coherence (eInward + eOutward) = 1 := by
  rw [coherence_eq]; unfold eInward eOutward; simp
theorem weights_blind_to_coherence (p : StateFibre) :
    wIn p + wOut p = bornForm p p ∧ bornForm (gatherIn p) (gatherOut p) = 0 :=
  ⟨outcome_weights_sum p, coherence_real_blind p⟩

-- ★ phase-blind total weight (the many phases gathered to one weight)
theorem totalWeight_phase_blind (p : StateFibre) :
    dblNormSq (Dbl.J * toDbl p) = dblNormSq (toDbl p) := by
  unfold dblNormSq; simp only [Dbl.mul_re, Dbl.mul_im, toDbl_re, toDbl_im, Dbl.J]; ring

end Phys.Quantum.MeasProbe3
