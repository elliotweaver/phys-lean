import Mathlib.Tactic
import Phys.Quantum.BornRule
import Phys.Quantum.Measurement
import Phys.Quantum.Unitarity
import Phys.Quantum.AsymptoticStates

namespace Phys.Quantum

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

-- sub helper lemmas for Dbl (missing from ComplexUnit).
@[simp] theorem dbl_sub_re (z w : Dbl ContinuumQ.Cut) : (z - w).re = z.re - w.re := by
  rw [sub_eq_add_neg, sub_eq_add_neg]; simp
@[simp] theorem dbl_sub_im (z w : Dbl ContinuumQ.Cut) : (z - w).im = z.im - w.im := by
  rw [sub_eq_add_neg, sub_eq_add_neg]; simp

-- THE TRANSITION AMPLITUDE: ⟨out | evolve U | in⟩ over Dbl Cut (arc J hInner + arc K evolve).
noncomputable def transAmp (U : Dbl ContinuumQ.Cut) (out inp : StateFibre) : Dbl ContinuumQ.Cut :=
  hInner (toDbl out) (toDbl (evolve U inp))

theorem probe_dblConj_mul_self (z : Dbl ContinuumQ.Cut) :
    dblConj z * z = ⟨dblNormSq z, 0⟩ := by
  apply Dbl.ext <;> simp [dblConj, dblNormSq, Dbl.mul_re, Dbl.mul_im] <;> ring

-- forward amplitude on a normalized dressed singlet = U itself.
theorem probe_transAmp_forward (U : Dbl ContinuumQ.Cut) (a b : ℚ)
    (h : (a : ContinuumQ.Cut) ^ 2 + (b : ContinuumQ.Cut) ^ 2 = 1) :
    transAmp U (dress a b) (dress a b) = U := by
  unfold transAmp hInner
  have hev : toDbl (evolve U (dress a b)) = U * toDbl (dress a b) := by
    unfold evolve; rw [toDbl_fromDbl]
  rw [hev]
  have hcomm : dblConj (toDbl (dress a b)) * (U * toDbl (dress a b))
      = U * (dblConj (toDbl (dress a b)) * toDbl (dress a b)) := by ring
  rw [hcomm, probe_dblConj_mul_self]
  have hnorm : dblNormSq (toDbl (dress a b)) = 1 := by
    unfold dblNormSq; simp only [toDbl, dress]; linear_combination h
  rw [hnorm]
  apply Dbl.ext <;> simp

-- THE INTERACTION OPERATOR: S = 1 + i·T ⟹ T = (S-1)/i = (S-1)·(-J).
noncomputable def intOp (U : Dbl ContinuumQ.Cut) : Dbl ContinuumQ.Cut := (U - 1) * (- Dbl.J)

theorem probe_intOp_re (U : Dbl ContinuumQ.Cut) : (intOp U).re = U.im := by
  simp [intOp, Dbl.J, Dbl.mul_re]

theorem probe_intOp_im (U : Dbl ContinuumQ.Cut) : (intOp U).im = 1 - U.re := by
  simp [intOp, Dbl.J, Dbl.mul_im]

-- THE OPTICAL THEOREM: 2·Im(forward T) = |T|², a consequence of dblNormSq U = 1 (K1).
theorem probe_optical_theorem (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1) :
    2 * (intOp U).im = dblNormSq (intOp U) := by
  rw [probe_intOp_im]
  have hnn : dblNormSq (intOp U) = 2 * (1 - U.re) := by
    unfold dblNormSq
    rw [probe_intOp_re, probe_intOp_im]
    have : U.re ^ 2 + U.im ^ 2 = 1 := hU
    nlinarith [this]
  rw [hnn]

-- optical theorem as completeness: RHS = sum over outcome channels (K2/N394).
theorem probe_optical_completeness (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1) :
    2 * (intOp U).im = wIn (fromDbl (intOp U)) + wOut (fromDbl (intOp U)) := by
  rw [outcome_weights_sum, bornForm_fromDbl, probe_optical_theorem U hU]

-- teeth: U = Dbl.J genuinely interacts, optical theorem non-vacuous (2 ≠ 0).
theorem probe_teeth : (intOp (Dbl.J : Dbl ContinuumQ.Cut)).im = 1
    ∧ dblNormSq (intOp (Dbl.J : Dbl ContinuumQ.Cut)) = 2 := by
  constructor
  · rw [probe_intOp_im]; simp [Dbl.J]
  · unfold dblNormSq
    rw [probe_intOp_re, probe_intOp_im]; simp [Dbl.J]; ring

end Phys.Quantum
