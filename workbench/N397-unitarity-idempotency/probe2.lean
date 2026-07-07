-- N397 probe2: K1 — the FULL idempotency weld (sheaf transport).
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Measurement

namespace Probe397b

open Phys.Quantum
open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

-- inverse of toDbl.
noncomputable def fromDbl (z : Dbl ContinuumQ.Cut) : StateFibre := (z.re, z.im)

theorem toDbl_fromDbl (z : Dbl ContinuumQ.Cut) : toDbl (fromDbl z) = z := by
  apply Dbl.ext <;> simp [toDbl, fromDbl]

theorem fromDbl_toDbl (p : StateFibre) : fromDbl (toDbl p) = p := by
  cases p; simp [fromDbl, toDbl]

-- bornForm of fromDbl = dblNormSq.
theorem bornForm_fromDbl (z : Dbl ContinuumQ.Cut) :
    bornForm (fromDbl z) (fromDbl z) = dblNormSq z := by
  unfold bornForm fromDbl dblNormSq; ring

-- the transported state.
noncomputable def evolve (U : Dbl ContinuumQ.Cut) (p : StateFibre) : StateFibre :=
  fromDbl (U * toDbl p)

-- the transported state is STILL a sheaf (μ-fixed): the idempotent gather resolves it.
theorem evolve_is_sheaf (U : Dbl ContinuumQ.Cut) (p : StateFibre) :
    totalGather (evolve U p) = evolve U p := totalGather_eq _

-- born self-overlap of the transported state = dblNormSq of the transport.
theorem bornForm_evolve (U : Dbl ContinuumQ.Cut) (p : StateFibre) :
    bornForm (evolve U p) (evolve U p) = dblNormSq (U * toDbl p) := by
  rw [evolve, bornForm_fromDbl]

theorem dblNormSq_mul (z w : Dbl ContinuumQ.Cut) :
    dblNormSq (z * w) = dblNormSq z * dblNormSq w := by
  unfold dblNormSq; simp only [Dbl.mul_re, Dbl.mul_im]; ring

-- ★ CORE: a unit phase conserves the Born probability of the transported state.
theorem unitary_conserves_born (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1)
    (p : StateFibre) : bornForm (evolve U p) (evolve U p) = bornForm p p := by
  rw [bornForm_evolve, dblNormSq_mul, hU, one_mul]
  unfold bornForm dblNormSq toDbl; ring

-- ★ WELD: the conserved total = the sum over the idempotent orthogonal gather-resolution.
theorem unitary_conserves_gather_resolution (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1)
    (p : StateFibre) : bornForm (evolve U p) (evolve U p) = wIn p + wOut p := by
  rw [unitary_conserves_born U hU, outcome_weights_sum]

end Probe397b
