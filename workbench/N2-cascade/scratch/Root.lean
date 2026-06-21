import Mathlib.Algebra.Order.Ring.Defs
import Mathlib.Algebra.Ring.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic
import Phys.Foundation.Fold

/-! Scratch 2: rooting rung 1 in N1 — "square root of the fold" connects to j*j = -1. -/

namespace Scratch2
open Phys.Foundation

variable {R : Type*} [CommRing R]

/-- A scalar `j` is a *square root of the fold* `look` on the line when multiplying by `j`
    twice reproduces the fold: `∀ x, j*(j*x) = look x`. -/
def IsSqrtFoldScalar (look : R → R) (j : R) : Prop := ∀ x, j * (j * x) = look x

/-- Rooted in N1: a scalar squares to the fold iff `j*j = -1` (uses `fold_eq_neg`). -/
theorem isSqrtFoldScalar_iff {look : R → R} (h : IsFold look) (j : R) :
    IsSqrtFoldScalar look j ↔ j * j = -1 := by
  constructor
  · intro hj
    have := hj 1
    rw [mul_one, fold_eq_neg h 1] at this
    simpa using this
  · intro hj x
    rw [← mul_assoc, hj, fold_eq_neg h x, neg_one_mul]

end Scratch2

#print axioms Scratch2.isSqrtFoldScalar_iff
