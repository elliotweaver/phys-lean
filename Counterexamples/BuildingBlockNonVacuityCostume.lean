/-
  Counterexamples.BuildingBlockNonVacuityCostume — N5f anti-vacuity costume
  (must be REJECTED).
  ===========================================================================
  The N5f building-block theorem `e22` (`Phys/Algebra/HermitianJordan/Building.lean`)
  proves the `(2,2)` entry of the order-3 Jordan defect `jdef (Xz a b c) (Xz p 0 0)`
  VANISHES — a multi-generator entry closed by the associator-transport lever `ka`.
  A vanishing-entry theorem is only content if the matrices it acts on are genuinely
  multi-generator and non-trivial. The deepest non-vacuity risk for a MULTI-generator
  result is that the carrier `Xz a b c` itself collapses — if `Xz` ignored its generators
  the entry would vanish trivially and `ka` would be closing nothing.

  THE GARBAGE WITNESS: the claim that the `(2,1)` entry of the multi-generator carrier
  `Xz a b c` is ZERO at a concrete non-zero generator. By construction `Xz a b c` carries
  `star c` at `(2,1)` (the conjugate of the `(1,2)` generator `c`). At the concrete
  generator `c = e₂` of `O ℚ` (the cascade's last-doubling unit), `star e₂ = -e₂`, whose
  `im.re.re` coordinate is `-1` (since `e₂` sits in the imaginary part of the outer double
  with `re.re = 1`, and `star` negates it). The bogus claim is that this coordinate is `0`.

  Substituting the actual Cayley–Dickson arithmetic, the bogus claim reduces to the false
  core `-1 = 0` (equivalently `1 = 0`) in `ℚ`: the carrier genuinely deposits the third,
  distinct off-diagonal generator. The manifest PASS_SIGNATURE matches that core.

  This guards the NON-VACUITY of `e22` (docs/RUNBOOK.md W8): if the carrier `Xz` did not
  genuinely carry its `(1,2)`/`(2,1)` generator, the `(2,2)` defect entry would vanish for
  a degenerate reason and the `ka` associator-transport route would close nothing real
  about the multi-generator cross terms. The kernel must REJECT this. -/
import Phys.Algebra.HermitianJordan.Building
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Matrix

namespace Counterexamples

attribute [local instance] CD.narCD CD.srCD

/-- WRONG (NON-VACUITY) CLAIM: that the multi-generator carrier `Xz a b c` has a vanishing
    `(2,1)` entry at the concrete generator `c = e₂`. The true value is `star e₂ = -e₂`,
    whose `im.re.re` coordinate is `-1`; the claim that it is `0` reduces to the false core
    `-1 = 0` and must FAIL to elaborate. -/
theorem building_block_nonvacuity_BOGUS :
    ((Xz (0 : O ℚ) 0 (CD.e2 : O ℚ)) 2 1).im.re.re = 0 := by
  unfold Xz
  simp only [Fin.isValue, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    CD.e2, CD.star_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    CD.one_re, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im,
    Dbl.one_re, Dbl.one_im, Dbl.zero_re, Dbl.zero_im, neg_zero, neg_neg]

end Counterexamples
