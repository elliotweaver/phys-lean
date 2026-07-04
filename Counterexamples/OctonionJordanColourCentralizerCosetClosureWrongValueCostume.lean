/-
  Counterexamples.OctonionJordanColourCentralizerCosetClosureWrongValueCostume — N293 anti-vacuity (C322).
  ===========================================================================
  W8 ANTI-VACUITY. The N293 node banks the su(3)/so(3) SYMMETRIC-PAIR CLOSURE: the three fold-root-
  dressed family-BREAKING coset generators of the derived colour-centralizer `su(3) = Z_{f₄}(colour)`
  inside `f₄ = Der(H₃(O)) = derH3` (N292),

      kAB := innerMul (slotA u1)(slotB 1),  kBC := innerMul (slotB u1)(slotC 1),
      kCA := innerMul (slotC u1)(slotA 1)   (u1 = the fold-root √−1, imaginary),

  CLOSE back into the banked family-so(3) generators (N288/N289): `⁅kAB, kBC⁆ = famB` (cyclic), where
  `famB = innerMul (slotC 1)(slotA 1)`. The load-bearing content is that this closure is NON-TRIVIAL
  — the fold-root-dressed coset is NOT abelian and genuinely closes back INTO the family (it is the
  "square-root" of the family so(3)). The certificate that the closure is non-trivial is the
  `re.re.re` coordinate of the `(1,2)` entry that `⁅kAB, kBC⁆ = famB` produces on the first
  generation slot `slotA 1`:

      `((⁅kAB, kBC⁆ (slotA 1)) 1 2).re.re.re = 1`.

  Since `⁅kAB, kBC⁆ = famB = innerMul (slotC 1)(slotA 1)` (banked `coset_close_AB_BC`), and
  `famB (slotA 1)` rotates the first generation into the `(1,2)` generation plane with real-unit
  coordinate `1`, the certificate is `1 ≠ 0` — the fold-root-dressed coset genuinely closes into a
  NONZERO family generator (the closure is non-abelian, `famB ≠ 0`, N289), NOT a trivial/abelian
  coset.

  We anchor `braVal.num.natAbs = 1` (TRUE), packaged as `min 322 (braVal.num.natAbs) = 1`, TIED to
  the node via `coset_close_AB_BC` (`⁅kAB, kBC⁆ = famB`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the coset is abelian / does NOT close into the
  family / Z_{f₄}(colour) is not a simple su(3) / the family-breaking is orthogonal to the family
  symmetry): that `min 322 (…) = 322`. It GENUINELY equals `1` (`bra_scale_true`). Rewriting the
  banked value reduces the bogus claim to the false numeric `1 = 322` in ℕ. The kernel cannot close
  it; it BITES.

  DISTINCT from the banked battery: the pair (322, 1) is fresh (RHS 322 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanColourCentralizerCosetClosure
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE CLOSURE-NON-TRIVIALITY CERTIFICATE: the real coordinate `reQ` of the `(1,2)` entry that the
    closure bracket `⁅kAB, kBC⁆` produces on the first generation slot `slotA 1`. Since
    `⁅kAB, kBC⁆ = famB = innerMul (slotC 1)(slotA 1)` (banked `coset_close_AB_BC`), which rotates the
    first generation into the `(1,2)` plane with real coordinate `1`, the coordinate is `1`,
    certifying the fold-root-dressed coset closes into a NONZERO family generator. -/
noncomputable def braVal : ℚ :=
  reQ ((⁅innerMul (slotA (u1 : O ℚ)) (slotB 1), innerMul (slotB (u1 : O ℚ)) (slotC 1)⁆
      (slotA 1)) 1 2)

/-- TRUE (tied to the banked N293 closure `coset_close_AB_BC` + N289 `famB_eq_adE`): the certificate
    is `1`. -/
theorem braVal_eq : braVal = 1 := by
  show reQ ((⁅innerMul (slotA (u1 : O ℚ)) (slotB 1), innerMul (slotB (u1 : O ℚ)) (slotC 1)⁆
      (slotA 1)) 1 2) = 1
  rw [coset_close_AB_BC, famB_eq_adE, adE_apply, slotA_one_ocRM]
  simp only [ocRM, pA, pC, Matrix.mul_apply, Matrix.sub_apply, Matrix.of_apply,
    Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons, ocR_sub, ocR_zero, ocR_one,
    mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, sub_zero, zero_sub, reQ]
  norm_num

/-- TRUE: the magnitude of the closure-non-triviality certificate is `1`. -/
theorem braNum_true : braVal.num.natAbs = 1 := by rw [braVal_eq]; decide

/-- TRUE: `min 322 (magnitude of the certificate) = 1`, holding precisely because
    `⁅kAB, kBC⁆ = famB ≠ 0` — the fold-root-dressed coset genuinely closes into a nonzero family
    generator, so the closure is non-abelian and Z_{f₄}(colour) is a genuine simple su(3). -/
theorem bra_scale_true : min (322 : ℕ) braVal.num.natAbs = 1 := by
  rw [braNum_true]; decide

/-- BOGUS: claims `min 322 (magnitude of the certificate) = 322`. It GENUINELY equals `1`
    (`bra_scale_true`). The WRONG reading (the coset is abelian / does NOT close into the family /
    Z_{f₄}(colour) is not a simple su(3) / the family-breaking is orthogonal to the family symmetry)
    reduces — through the banked closure — to the false numeric `1 = 322`, so this must NOT compile. -/
theorem bra_scale_wrong_BOGUS :
    min (322 : ℕ) braVal.num.natAbs = 322 := by
  rw [bra_scale_true]
  -- ⊢ (1 : ℕ) = 322  (FALSE — the costume bites)

end Counterexamples
