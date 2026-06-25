/-
  Counterexamples.DerivationOProductPreservingDropFactorialCostume — N41e costume (must be REJECTED).
  ====================================================================================
  THE GARBAGE CLAIM for the N41e UNCONDITIONAL `O Cut` product-preservation over the DERIVED ℝ
  `ContinuumQ.Cut`. N41e banks `oCut_term_abs_summable`: for a `Cut`-linear endomorphism `D'`, each
  coordinate sequence of the NORMALIZED vector-exponential terms is absolutely summable,
    `Summable (fun k => |(coordOCut ((1/k!)•((D'ᵏ) x))) i|)`.
  This is THE engine of the genuine hard core: it is exactly what makes the `hxy` octonion-PRODUCT-
  family `cut_summable_mul_of_abs` leaves converge (each leaf `(k,l) ↦ (coordOCut (a k)) i ·
  (coordOCut (b l)) j` needs the two coordinate sequences ABSOLUTELY summable), so `oCut_prod_summable`
  — and hence the unconditional `expO_mul` — rests on it. The `1/k!` factorial normalization is the
  C6 eternal-approach majorant (the factorial outruns the operator-norm power `(opNorm M)ᵏ` of the
  banked N40 `expTerm_entry_abs_summable`). It is LOAD-BEARING, NOT decorative.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the coordinate sequence of the
  UN-NORMALIZED power series `k ↦ (D'ᵏ) x` — with the `1/k!` factorial DROPPED — is absolutely
  summable. This is FALSE in general: for `D' = 1` (the identity) and `x` with a nonzero coordinate
  `i`, the terms `|(coordOCut ((D'ᵏ) x)) i| = |(coordOCut x) i|` are a nonzero constant, whose partial
  sums are unbounded (divergent) by the Archimedean property (N35). Routing it through the banked
  `oCut_term_abs_summable` via `.congr` unifies the summand-up-to-congruence and leaves the per-term
  identity
    `|(coordOCut ((1/k!)•((D'ᵏ) x))) i| = |(coordOCut ((D'ᵏ) x)) i|`
  as an unsolved goal — FALSE for `k ≥ 2` (`1/k! ≠ 1`). The bogus claim collapses to that
  unsatisfiable equation (the convergence-structure made explicit: the coordinate sequence is
  absolutely summable WITH the factorial normalization but NOT without it — the factorial is the
  majorant's engine).

  This costume DIRECTLY exercises the NEW N41e content: it uses `oCut_term_abs_summable` (the banked
  coordinate-factorial-majorant lever underpinning the product family); deleting
  `Phys/Algebra/DerivationOProductPreserving.lean` removes the `oCut_term_abs_summable` the costume's
  `.congr` resolves against, so the costume would fail with a DIFFERENT (unknown-identifier) error and
  the PASS_SIGNATURE below would not match. If the product-family summability were built on the
  UN-NORMALIZED coordinate sequences, this divergent series would go through — the costume is exactly
  the guard against that.
-/
import Phys.Algebra.DerivationOProductPreserving

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- WRONG: claiming the coordinate sequence of the UN-NORMALIZED power series `k ↦ (D'ᵏ) x` (the
    `1/k!` factorial that makes the operator-norm coordinate majorant converge DROPPED) is absolutely
    summable over the derived ℝ. Routing it through the banked `oCut_term_abs_summable` via `.congr`
    leaves the per-term identity `|(coordOCut ((1/k!)•((D'ᵏ) x))) i| = |(coordOCut ((D'ᵏ) x)) i|`
    unsolved — false for `k ≥ 2`. The coordinate sequence converges WITH the factorial normalization
    (the C6 eternal-approach majorant) but DIVERGES without it (e.g. `D'=1`, `x` with nonzero
    coordinate gives a nonzero constant sequence, unbounded). Must FAIL to compile. -/
theorem oCut_term_abs_summable_no_factorial_BOGUS (D' : Module.End Cut (O Cut)) (x : O Cut) (i : Fin 8) :
    Summable (fun k => |(coordOCut ((D' ^ k) x)) i|) := by
  refine (oCut_term_abs_summable D' x i).congr (fun k => ?_)

end

end Counterexamples
