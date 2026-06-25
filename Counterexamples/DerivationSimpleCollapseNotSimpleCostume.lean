/-
  Counterexamples.DerivationSimpleCollapseNotSimpleCostume — N30b costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N30b prime-7 / isotypic-Schur COLLAPSE. N30b banks the capstone of
  the type-G₂/compact-form identification: the Lie-ideal lattice of the 14-dimensional derivation
  algebra of the terminal Cayley–Dickson algebra is a SIMPLE ORDER (`derivationLieQ_isSimpleOrder`)
  hence `derivationLieQ` is a SIMPLE Lie algebra (`derivationLieQ_isSimple`). The collapse forces
  this through the prime-dimension-7 dichotomy: a nonzero proper ideal would split the faithful
  7-rep into two commuting factors, and prime 7 leaves only the character branch (⟹ atom = ⊥) or
  the Schur branch (⟹ complement = ⊥), both impossible.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the ideal lattice is NOT a
  simple order — i.e. `¬ IsSimpleOrder (LieIdeal ℚ derivationLieQ)`, the degenerate reading in
  which the algebra would be decomposable (a non-prime / multiple-factor structure, the negation
  of the prime-7 collapse's conclusion). Feeding the banked `derivationLieQ_isSimpleOrder` to such
  a negation reduces the claim to `False`, which cannot be discharged. If the collapse had NOT
  forced simplicity — if the 7 = r·dim W factorization admitted r, dim W > 1, or if a branch
  failed to close — this costume would be provable; W8 demands it bite.

  The manifest's PASS_SIGNATURE matches the elaboration error below (`⊢ False`).
-/
import Phys.Algebra.DerivationSimpleCollapse

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD LieAlgebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

/-- WRONG: claiming the Lie-ideal lattice of `derivationLieQ` is NOT a simple order (the algebra
    is decomposable / not prime-collapsed). The banked forward result
    `derivationLieQ_isSimpleOrder` proves it IS a simple order, so after `intro h` the residual
    goal `⊢ False` cannot be discharged. Must FAIL to compile. -/
theorem derivationLieQ_not_isSimpleOrder_BOGUS :
    ¬ IsSimpleOrder (LieIdeal ℚ derivationLieQ) := by
  intro h

end Counterexamples
