/-
  Counterexamples.SinglePairNonVacuityCostume — N5e anti-vacuity costume
  (must be REJECTED).
  ===========================================================================
  The positive-edge single-generator theorem `jdef_single_pair`
  (`Phys/Algebra/HermitianJordan/SinglePair.lean`) proves the order-3 Jordan
  identity defect VANISHES for the zero-diagonal Hermitian core carrying one
  off-diagonal octonion generator. A vanishing theorem is only content if the
  object it vanishes on is genuinely NON-trivial — if `jb (Xz a 0 0) (Xz a 0 0)`
  (the symmetric square that seeds the defect) were itself identically zero, the
  Jordan identity would hold vacuously and prove nothing about the central norm.

  THE GARBAGE WITNESS: the claim that the symmetric square `jb (Xz a 0 0)(Xz a 0 0)`
  has a ZERO `(0,0)` entry at a CONCRETE non-zero generator. The `(0,0)` entry of
  that square is the central norm `2 · (a · star a)` (twice the self-overlap). At
  the concrete generator `a = e₂` of `O ℚ` (the cascade's last-doubling unit, with
  `e₂ · star e₂ = 1`), that entry is `2`, with `re.re.re` coordinate `= 2`. The
  bogus claim is that this coordinate is `0`.

  Substituting the actual Cayley–Dickson arithmetic, the bogus claim reduces to the
  false core `1 + 1 = 0` in `ℚ` (the norm `e₂ · star e₂ = 1`, the entry `1 + 1 = 2`).
  The manifest PASS_SIGNATURE matches that core.

  This guards the NON-VACUITY of `jdef_single_pair` (docs/RUNBOOK.md W8): if the
  seeding square vanished, the single-generator Jordan identity would be the empty
  statement `0 = 0` and the composition-centrality route would close nothing real.
  The kernel must REJECT this. -/
import Phys.Algebra.HermitianJordan.SinglePair
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Matrix

namespace Counterexamples

attribute [local instance] CD.narCD CD.srCD

/-- WRONG (NON-VACUITY) CLAIM: that the symmetric square seeding the single-generator
    Jordan defect has a vanishing `(0,0)` entry at the concrete generator `a = e₂`.
    The true value is the central norm `2 · (e₂ · star e₂) = 2`, whose `re.re.re`
    coordinate is `2`; the claim that it is `0` reduces to the false core `2 = 0` and
    must FAIL to elaborate. -/
theorem single_pair_nonvacuity_BOGUS :
    ((jb (Xz (CD.e2 : O ℚ) 0 0) (Xz (CD.e2 : O ℚ) 0 0)) 0 0).re.re.re = 0 := by
  unfold jb Xz
  simp only [Fin.isValue, Matrix.mul_apply, Matrix.add_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add,
    CD.e2, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    CD.neg_re, CD.neg_im, CD.one_re, CD.zero_re, CD.zero_im, star_one, star_zero,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.one_re, Dbl.one_im, Dbl.zero_re, Dbl.zero_im,
    mul_one, one_mul, neg_zero, neg_neg]

end Counterexamples
