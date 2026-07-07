-- N397 probe1: K1 unitarity from monad idempotency — route validation + cost measure.
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Measurement

namespace Probe397

open Phys.Quantum
open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

-- (B) Norm-multiplicativity (Brahmagupta–Fibonacci two-square identity).
theorem dblNormSq_mul (z w : Dbl ContinuumQ.Cut) :
    dblNormSq (z * w) = dblNormSq z * dblNormSq w := by
  unfold dblNormSq
  simp only [Dbl.mul_re, Dbl.mul_im]
  ring

-- (C) unit phase preserves norm.
theorem unit_phase_preserves_norm (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1)
    (z : Dbl ContinuumQ.Cut) : dblNormSq (U * z) = dblNormSq z := by
  rw [dblNormSq_mul, hU, one_mul]

-- (C converse) norm-preserving ⟺ unit phase (the emergent unitary group = {dblNormSq=1}).
theorem norm_preserving_iff_unit_phase (U : Dbl ContinuumQ.Cut) :
    (∀ z, dblNormSq (U * z) = dblNormSq z) ↔ dblNormSq U = 1 := by
  constructor
  · intro h
    have := h 1
    simpa [dblNormSq] using this
  · intro hU z; exact unit_phase_preserves_norm U hU z

-- dblNormSq 1 = 1 helper
example : dblNormSq (1 : Dbl ContinuumQ.Cut) = 1 := by simp [dblNormSq]

-- J is a unit phase.
theorem J_is_unit_phase : dblNormSq (Dbl.J : Dbl ContinuumQ.Cut) = 1 := by
  simp [dblNormSq, Dbl.J]

-- (D) the weld: dblNormSq(toDbl p) = wIn p + wOut p (Parseval = gather-resolved total).
theorem dblNormSq_toDbl_eq_gather_total (p : StateFibre) :
    dblNormSq (toDbl p) = wIn p + wOut p := by
  rw [wIn_eq, wOut_eq]; unfold dblNormSq; simp [toDbl]

-- (D) unitary conserves the gather-resolved total.
theorem unitary_conserves_gather_total (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1)
    (p : StateFibre) : dblNormSq (U * toDbl p) = wIn p + wOut p := by
  rw [unit_phase_preserves_norm U hU, dblNormSq_toDbl_eq_gather_total]

-- unit-phase group: closure, identity, conjugate inverse.
theorem unitary_group_closed (U V : Dbl ContinuumQ.Cut)
    (hU : dblNormSq U = 1) (hV : dblNormSq V = 1) : dblNormSq (U * V) = 1 := by
  rw [dblNormSq_mul, hU, hV, one_mul]

theorem U_mul_conj (U : Dbl ContinuumQ.Cut) :
    U * dblConj U = ⟨dblNormSq U, 0⟩ := by
  apply Dbl.ext <;> simp [dblConj, dblNormSq, Dbl.mul_re, Dbl.mul_im] <;> ring

-- costume witness: nontrivial unit phase transport of unit state preserves norm = 1.
theorem costume_witness : dblNormSq (Dbl.J * toDbl eInward) = 1 := by
  rw [unit_phase_preserves_norm Dbl.J J_is_unit_phase]
  unfold dblNormSq; simp [toDbl, eInward]

-- J genuinely rotates (nontrivial): J * toDbl eInward ≠ toDbl eInward.
theorem J_nontrivial_rotation : Dbl.J * toDbl eInward ≠ toDbl eInward := by
  intro h
  have := congrArg Dbl.re h
  simp [Dbl.J, toDbl, eInward, Dbl.mul_re] at this

end Probe397
