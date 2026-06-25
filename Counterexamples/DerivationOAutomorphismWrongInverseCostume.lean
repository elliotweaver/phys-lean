/-
  Counterexamples.DerivationOAutomorphismWrongInverseCostume — N41f costume (must be REJECTED).
  =============================================================================================
  THE GARBAGE CLAIM for the N41f Cut-side `≃ₗ[Cut]`/`IsAlgAutCut` AUTOMORPHISM of `O Cut` over the
  DERIVED ℝ `ContinuumQ.Cut`. N41f banks `expOLin_comp_neg`: the vector exponential's literal group
  INVERSE is the exponential of the NEGATED derivation,
    `expOLin D' (expOLin (-D') x) = x`.
  This is the bijection content of the automorphism: `expOEquiv D'` is `LinearEquiv.ofLinear (expOLin
  D') (expOLin (-D'))`. The `-D'` is LOAD-BEARING — it transports, through the banked N40 matrix
  one-parameter-subgroup law `expMap_mul_neg` (`exp(M)·exp(-M) = 1`), to invertibility; the inverse of
  the flow is the flow run BACKWARD (`-D'`), NOT forward (`D'`).

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the exponential is its OWN inverse,
  `expOLin D' (expOLin D' x) = x` — i.e. that `expO D` is an INVOLUTION. This is FALSE in general: it
  would require `expMap M · expMap M = 1`, i.e. `expMap (2M) = 1`, forcing `M = 0` (only the zero
  derivation's flow is an involution). Routing the bogus claim through the banked `expOLin_comp_neg` via
  `Eq.trans` + `congr 1` leaves the per-point identity
    `(expOLin D') x = (expOLin (-D')) x`
  as an unsolved goal — FALSE unless `D' = -D'`, i.e. `D' = 0`. The bogus involution collapses to that
  unsatisfiable equation (the group-inverse structure made explicit: the inverse of the exponential flow
  is the flow of the NEGATED derivation, not the flow itself).

  This costume DIRECTLY exercises the NEW N41f content: it uses `expOLin` (the new Cut-linear
  exponential map) and `expOLin_comp_neg` (the new bijection/group-inverse lever); deleting
  `Phys/Algebra/DerivationOAutomorphism.lean` removes both, so the costume would fail with a DIFFERENT
  (unknown-identifier) error and the PASS_SIGNATURE below would not match. If the bijection were built
  with the WRONG inverse (the flow as its own inverse), this false involution would go through — the
  costume is exactly the guard against that.
-/
import Phys.Algebra.DerivationOAutomorphism

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- WRONG: claiming the vector exponential is its OWN inverse (an involution),
    `expOLin D' (expOLin D' x) = x`. The literal group inverse of the exponential flow is the flow of
    the NEGATED derivation `expO (-D)` (banked `expOLin_comp_neg`), NOT the flow itself. Routing the
    bogus involution through `expOLin_comp_neg` via `Eq.trans` + `congr 1` leaves the per-point identity
    `(expOLin D') x = (expOLin (-D')) x` unsolved — false unless `D' = -D'`, i.e. `D' = 0` (only the
    zero derivation's flow is an involution). Must FAIL to compile. -/
theorem expOEquiv_wrong_inverse_BOGUS (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOLin D' (expOLin D' x) = x := by
  refine Eq.trans ?_ (expOLin_comp_neg D' x)
  congr 1

end

end Counterexamples
