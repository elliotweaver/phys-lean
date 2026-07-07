import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule

namespace Phys.Quantum.MeasProbe
open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Quantum

-- The two outcome gatherers (projections onto the definite frame outcomes).
noncomputable def gatherIn  (p : StateFibre) : StateFibre := (p.1, 0)
noncomputable def gatherOut (p : StateFibre) : StateFibre := (0, p.2)

-- idempotent (repeatability / quantum Zeno)
theorem gatherIn_idem (p : StateFibre) : gatherIn (gatherIn p) = gatherIn p := by
  unfold gatherIn; rfl
theorem gatherOut_idem (p : StateFibre) : gatherOut (gatherOut p) = gatherOut p := by
  unfold gatherOut; rfl

-- orthogonal
theorem gatherIn_gatherOut (p : StateFibre) : gatherIn (gatherOut p) = 0 := by
  unfold gatherIn gatherOut; rfl
theorem gatherOut_gatherIn (p : StateFibre) : gatherOut (gatherIn p) = 0 := by
  unfold gatherOut gatherIn; rfl

-- ★ resolution of Unity (the gather / totalization μ)
theorem gather_resolves_unity (p : StateFibre) : gatherIn p + gatherOut p = p := by
  unfold gatherIn gatherOut
  apply Prod.ext <;> simp

-- total gather = id, idempotent (μ∘μ = μ)
noncomputable def totalGather (p : StateFibre) : StateFibre := gatherIn p + gatherOut p
theorem totalGather_eq (p : StateFibre) : totalGather p = p := gather_resolves_unity p
theorem totalGather_idem (p : StateFibre) : totalGather (totalGather p) = totalGather p := by
  rw [totalGather_eq, totalGather_eq]

-- outcome weights
noncomputable def outcomeWeightIn  (p : StateFibre) : ContinuumQ.Cut := bornForm (gatherIn p) (gatherIn p)
noncomputable def outcomeWeightOut (p : StateFibre) : ContinuumQ.Cut := bornForm (gatherOut p) (gatherOut p)

theorem outcomeWeightIn_eq (p : StateFibre) : outcomeWeightIn p = p.1 ^ 2 := by
  unfold outcomeWeightIn bornForm gatherIn; ring
theorem outcomeWeightOut_eq (p : StateFibre) : outcomeWeightOut p = p.2 ^ 2 := by
  unfold outcomeWeightOut bornForm gatherOut; ring

-- ★ Born weights SUM to the total self-overlap (probability conservation, DERIVED)
theorem outcome_weights_sum (p : StateFibre) :
    outcomeWeightIn p + outcomeWeightOut p = bornForm p p := by
  unfold outcomeWeightIn outcomeWeightOut bornForm gatherIn gatherOut; ring

-- coherence = Kähler cross-term
noncomputable def coherence (p : StateFibre) : ContinuumQ.Cut := kahlerForm (gatherIn p) (gatherOut p)
theorem coherence_eq (p : StateFibre) : coherence p = p.1 * p.2 := by
  unfold coherence; rw [kahlerForm_apply]; unfold gatherIn gatherOut; ring

-- decoherence: the coherence is REAL-BLIND (g sees nothing), carried by ω
theorem coherence_real_blind (p : StateFibre) : bornForm (gatherIn p) (gatherOut p) = 0 := by
  unfold bornForm gatherIn gatherOut; ring

-- non-vacuity witness: coherence of diagonal state (1,1) is 1 ≠ 0
theorem coherence_diag : coherence (eInward + eOutward) = 1 := by
  rw [coherence_eq]; unfold eInward eOutward; simp

-- total weight is phase-blind (invariant under fold's complex unit Dbl.J)
theorem totalWeight_phase_blind (p : StateFibre) :
    dblNormSq (Dbl.J * toDbl p) = dblNormSq (toDbl p) := by
  unfold dblNormSq
  simp only [Dbl.mul_re, Dbl.mul_im, toDbl_re, toDbl_im, Dbl.J]
  ring

end Phys.Quantum.MeasProbe
