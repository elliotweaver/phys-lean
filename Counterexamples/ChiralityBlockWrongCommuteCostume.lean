/-
  Counterexamples.ChiralityBlockWrongCommuteCostume — N44 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N44 CHIRALITY BLOCK. N44 banks that the LEFT and RIGHT
  multiplication families on the terminal algebra `O ℚ` do NOT all commute
  (`chirality_block : ¬ ∀ a b, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a)`),
  BECAUSE `O ℚ` is non-associative (the banked cascade-stop `not_associative`). The NEGATION is
  LOAD-BEARING: the commutator of the two chiralities is exactly the associator's middle slot, so
  "the two families always commute" is LITERALLY "the algebra is associative" — which the cascade
  already lost at this rung. If the two families DID all commute, the algebra would associate, the
  generation-cap would not fall (`chirality_block_iff_jordan_cap`), and the cascade would not have
  stopped. The non-commutation is the whole content.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the two families ALWAYS commute,
  `∀ a b, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a)` (the associative misreading),
  rather than the derived negation. This is FALSE: `chirality_block` proves the negation `¬ ∀ …`.
  The costume tries to supply the banked `chirality_block` (of type `¬ ∀ …`) where a proof of the
  POSITIVE `∀ …` is demanded; the `¬`-mismatch (`¬ P` supplied where `P` is required) makes it FAIL
  to compile — the guard against reading the non-associative terminal algebra as if its left and
  right actions commuted (which would collapse all three terminations of the one-cause claim).

  This costume DIRECTLY exercises the NEW N44 content: it uses `LeftMul`/`RightMul`/`chirality_block`.
  Deleting `Phys/Algebra/ChiralityBlock.lean` removes the identifiers the costume references, so it
  would fail with a DIFFERENT (unknown-identifier) error and the PASS_SIGNATURE below would not match.
-/
import Phys.Algebra.ChiralityBlock

namespace Counterexamples

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the left and right multiplication families ALWAYS commute (the associative
    misreading) rather than the derived negation. Supplying the banked `chirality_block` (of type
    `¬ ∀ …`) where the positive `∀ …` is demanded forces a type mismatch. Must FAIL to compile. -/
theorem chirality_always_commute_BOGUS :
    ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a) :=
  chirality_block

end Counterexamples
