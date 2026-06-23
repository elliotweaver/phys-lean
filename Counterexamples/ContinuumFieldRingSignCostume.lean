/-
  Counterexamples.ContinuumFieldRingSignCostume — N13 ℝ-field-ops (CommRing Cut)
  costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the SIGN-HOMOMORPHISM law `neg_mul` on the derived-ℚ
  completion `ContinuumQ.Cut`, in the precise wrong shape the ring structure forbids:
  claiming the product `(-1) * 1` CONTAINS the nonnegative value `0` — i.e. that the
  sign extension fails to carry the negation through the product (that `(-1)·1` does
  NOT land on the negative cut `-1`).

  The load-bearing content of `Phys/Foundation/ContinuumFieldRing.lean` is the sign
  homomorphism `neg_mul`/`mul_neg` + `one_mul'`, by which `(-1) * 1 = -(1 * 1) = -1`,
  the cut `-(Qcut 1)`. By `neg_S`, `(-(Qcut 1)).S 0 ↔ ∃ r, (0:Q) < -r ∧ ¬ r < 1`, i.e.
  `∃ r, r < 0 ∧ 1 ≤ r` — impossible. If the product cut `(-1)*1` contained `0 ≥ 0`,
  the sign extension would be broken: `neg_mul` would fail and there would be no
  `CommRing Cut` (the multiplication would not be a ring operation). The
  sign-inverting error the construction exists to rule out (docs/RUNBOOK.md W8).

  Rewriting by the banked `neg_mul`, `one_mul'`, then `neg_S`/`one_S`, the claim
  `((-1) * 1).S 0` reduces to `∃ r, (0:Q) < -r ∧ ¬ r < 1` with no witness; the
  residual goal exposes the impossible core. The proof below must FAIL to elaborate;
  the manifest's PASS_SIGNATURE matches the resulting `0 < -1` core (the witness `r=1`
  forced by `¬ r < 1` with `r < 0` is contradictory — there is no valid `r`).
-/
import Phys.Foundation.ContinuumFieldRing
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation
open Phys.Foundation.ContinuumQ

/-- WRONG CLAIM: that the product cut `(-1) * 1` contains the nonnegative value `0` —
    `((-1 : Cut) * 1).S 0`. By the banked `neg_mul` + `one_mul'` this cut is
    `-(1) = -(Qcut 1)`; by `neg_S` membership of `0` needs `∃ r, 0 < -r ∧ ¬ r < 1`,
    i.e. a rational both `< 0` and `≥ 1` — impossible. It must FAIL to elaborate. -/
theorem continuum_ring_sign_contains_zero_BOGUS : ((-1 : Cut) * 1).S 0 := by
  rw [neg_mul, one_mul']
  show (-(1 : Cut)).S 0
  rw [show (1 : Cut) = Qcut 1 from rfl, neg_S]
  -- ⊢ ∃ r, (0:Q) < -r ∧ ¬ (Qcut 1).S r  ;  i.e. r < 0 ∧ 1 ≤ r — impossible.
  refine ⟨1, ?_, ?_⟩
  · show (0 : Q) < -1

end Counterexamples
