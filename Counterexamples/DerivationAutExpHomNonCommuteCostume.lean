/-
  Counterexamples.DerivationAutExpHomNonCommuteCostume — N40 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N40 EXPONENTIAL ONE-PARAMETER SUBGROUP rung over the DERIVED ℝ
  `ContinuumQ.Cut`. N40 banks the homomorphism law `expMap_mul_of_commute`:
    `Commute A B → expMap A * expMap B = expMap (A + B)`
  — the matrix exponential is multiplicative ONLY for COMMUTING matrices. The commutativity is
  load-bearing: it is precisely what lets the binomial crux `expTerm_antidiagonal` separate the
  powers `(A+B)ⁿ = ∑ choose(n,k) Aᵏ Bˡ` (`Commute.add_pow'`). For NON-commuting `A`, `B` the
  exponential homomorphism law is FALSE (the Baker–Campbell–Hausdorff correction terms appear).

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the exponential homomorphism law
  `expMap A * expMap B = expMap (A + B)` holds for ARBITRARY matrices `A`, `B` — dropping the
  `Commute A B` hypothesis. Routing it through the banked `expMap_mul_of_commute` via `apply` unifies
  the conclusion and leaves the UNDISCHARGEABLE hypothesis `Commute A B`, which is FALSE for general
  matrices and cannot be proved. The bogus claim collapses to the unsatisfiable goal
  `⊢ Commute A B` (the non-abelian obstruction made explicit: a one-parameter subgroup law that holds
  along a commuting flow does NOT hold between arbitrary group elements).

  This costume DIRECTLY exercises the NEW N40 content: it uses `expMap_mul_of_commute` (the banked
  homomorphism law) on the derived ℝ; deleting `Phys/Algebra/DerivationAutExpHom.lean` removes the
  `expMap_mul_of_commute` the costume's `apply` resolves against, so the costume would fail with a
  DIFFERENT (unknown-identifier) error and the PASS_SIGNATURE `Commute A B` would not match. If the
  law were stated without its `Commute` hypothesis, this false claim would go through — the costume is
  exactly the guard against that. The manifest's PASS_SIGNATURE matches the elaboration error below
  (`⊢ Commute A B`).
-/
import Phys.Algebra.DerivationAutExpHom

namespace Counterexamples

open Phys.Foundation.ContinuumQ Phys.Algebra

noncomputable section

/-- WRONG: claiming the exponential homomorphism law holds for ARBITRARY (non-commuting) matrices
    over the derived ℝ. `apply expMap_mul_of_commute` unifies the conclusion and leaves the
    `Commute A B` hypothesis, which is false in general and is left unsolved. The matrix exponential
    is multiplicative only along a commuting flow. Must FAIL to compile. -/
theorem expMap_mul_noncommute_BOGUS (A B : Matrix (Fin 8) (Fin 8) Cut) :
    expMap A * expMap B = expMap (A + B) := by
  apply expMap_mul_of_commute

end

end Counterexamples
