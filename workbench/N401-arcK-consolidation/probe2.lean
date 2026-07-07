import Mathlib.Tactic
import Phys.Quantum.SMatrix
import Phys.Quantum.ComplexStructure

namespace Phys.Quantum.ArcKProbe2

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Algebra Phys.Cascade.CD
open Phys.Quantum

attribute [local instance] CD.narCD CD.srCD

-- WELD 1 as a TRIPLE equality: arc-K conservation = arc-J gather completeness = arc-I octonion norm.
theorem weld1_triple (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1) (a b : ℚ) :
    bornForm (scatteringOp U (dress a b)) (scatteringOp U (dress a b))
        = wIn (dress a b) + wOut (dress a b)
      ∧ wIn (dress a b) + wOut (dress a b)
        = ((gForm (singletElt a b) (singletElt a b) : ℚ) : ContinuumQ.Cut) := by
  exact ⟨scatteringOp_conserves_gather U hU (dress a b), dress_completeness a b⟩

end Phys.Quantum.ArcKProbe2
