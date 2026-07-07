import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.BornRule

namespace Phys.Quantum.MeasProbe2
open Phys.Foundation Phys.Cascade
open Phys.Foundation.ContinuumQ
open Phys.Quantum

noncomputable def gatherIn  (p : StateFibre) : StateFibre := (p.1, 0)
noncomputable def gatherOut (p : StateFibre) : StateFibre := (0, p.2)
noncomputable def wIn  (p : StateFibre) : ContinuumQ.Cut := bornForm (gatherIn p) (gatherIn p)
noncomputable def wOut (p : StateFibre) : ContinuumQ.Cut := bornForm (gatherOut p) (gatherOut p)

theorem sum (p : StateFibre) : wIn p + wOut p = bornForm p p := by
  unfold wIn wOut bornForm gatherIn gatherOut; ring

theorem probs_sum_to_one (p : StateFibre) (h : bornForm p p ≠ 0) :
    wIn p / bornForm p p + wOut p / bornForm p p = 1 := by
  rw [← add_div, sum]; exact div_self h

end Phys.Quantum.MeasProbe2
