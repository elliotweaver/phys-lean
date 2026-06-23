/-
  Counterexamples.ContinuumFieldMulCapstoneCostume — N12 ℝ-field-ops (positive-cone
  multiplication + capstone) costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the CAPSTONE `√2 · √2 = 2` on the derived-ℚ completion
  `ContinuumQ.Cut`, in the precise wrong shape the structure forbids: claiming the
  product cut `pmul sqrt2 sqrt2` CONTAINS the value `2` — i.e. that `√2 · √2 > 2`
  (the cut would overshoot the true product).

  The load-bearing theorem of `Phys/Foundation/ContinuumFieldMul.lean` is
  `pmul_sqrt2_sqrt2` (`pmul sqrt2 sqrt2 = Qcut 2`), the analytic gap N6 forced
  (`x²=2` has NO solution in the derived ℚ) SOLVED in the completion. By it, the
  product cut IS `Qcut 2 = {q | q < 2}`, an OPEN lower cut that contains NO element
  `≥ 2`. If the product cut contained `2`, the multiplication would overshoot — the
  density-of-squares closure (`sq_dense`, the Archimedean eternal approach) would be
  wrong, and `√2 · √2` would not equal `2`. The degenerate/overshooting error the
  construction exists to rule out (docs/RUNBOOK.md W8).

  Rewriting by the banked `pmul_sqrt2_sqrt2`, the claim `(pmul sqrt2 sqrt2).S 2`
  reduces (`Qcut` is `{q | q < a}`) to `(2 : Q) < 2`, impossible. The proof below
  must FAIL to elaborate; the manifest's PASS_SIGNATURE matches the resulting
  `2 < 2` goal.
-/
import Phys.Foundation.ContinuumFieldMul
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation
open Phys.Foundation.ContinuumQ

/-- WRONG CLAIM: that the product cut `pmul sqrt2 sqrt2` contains the value `2` —
    `(pmul sqrt2 sqrt2).S 2`. By the banked `pmul_sqrt2_sqrt2` this cut is
    `Qcut 2 = {q | q < 2}`, so the claim reduces to `(2 : Q) < 2`, impossible. It
    must FAIL to elaborate. -/
theorem capstone_product_contains_two_BOGUS : (pmul sqrt2 sqrt2).S 2 := by
  rw [pmul_sqrt2_sqrt2]
  show (2 : Q) < 2

end Counterexamples
