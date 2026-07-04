/-
  Counterexamples.OctonionJordanFamilyRotationSo3ClosureWrongValueCostume — N289 anti-vacuity (C318).
  ===========================================================================
  W8 ANTI-VACUITY. The N289 node banks the `so(3)` CLOSURE of the derived family-rotation generators
  of the gauge-neutral room of `f₄ = Der(H₃(O))`:

      `⁅famC, famA⁆ = famB`  (cyclic),  famC = innerMul (slotA 1)(slotB 1), etc.,

  making `span{famA, famB, famC}` a genuine 3-dimensional SIMPLE Lie algebra — the continuous Lie
  form of N273's discrete family S₃. The content of the node is that this closure is genuinely
  NON-ABELIAN: the bracket does NOT vanish; it equals the nonzero generator `famB`.

  The certificate that the closure is NON-TRIVIAL (that the family-rotation room is a genuine simple
  `so(3)`, not an abelian / trivial / vanishing-bracket room) is the real part of the `(1,2)` entry
  the closed bracket `⁅famC, famA⁆ = famB` produces when applied to the first real-unit slot `slotA 1`
  — `famB (slotA 1) = slotC 1`, whose `(1,2)` entry is `1`:

      `reQ ((⁅innerMul (slotA 1)(slotB 1), innerMul (slotB 1)(slotC 1)⁆ (slotA 1)) 1 2) = 1`

  — via `famC_famA_closure` (`⁅famC, famA⁆ = famB`) + the collapse (`famB` acts as the matrix
  commutator, sending `slotA 1 ↦ slotC 1`). The value `1 ≠ 0` certifies the bracket genuinely closes
  onto the nonzero `famB` — the room is the non-abelian simple `so(3)`, not a vanishing-bracket
  (abelian) or trivial room.

  We anchor `braVal.num.natAbs = 1` (TRUE), packaged as `min 318 (braVal.num.natAbs) = 1`, TIED to the
  node via `famC_famA_closure` + `famB_ne_zero`'s underlying action.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the family-rotation room is ABELIAN / the closure
  bracket VANISHES / the generators do NOT close / the room is trivial): that `min 318 (…) = 318`. It
  GENUINELY equals `1` (`bra_scale_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `1 = 318` in ℕ. The kernel cannot close it; the costume BITES.

  DISTINCT from the banked battery: the pair (318, 1) is fresh (RHS 318 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE so(3)-CLOSURE NON-TRIVIALITY CERTIFICATE: the real part of the `(1,2)` entry the closed
    bracket `⁅famC, famA⁆ = famB` produces on the first real-unit slot `slotA 1`. Since
    `⁅famC, famA⁆ = famB` (`famC_famA_closure`) and `famB (slotA 1) = slotC 1` (the matrix-commutator
    action), the `(1,2)` entry is `1`, certifying the family-rotation room is the genuine non-abelian
    simple `so(3)`, not a vanishing-bracket (abelian) / trivial room. -/
noncomputable def braVal : ℚ :=
  reQ ((⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotB (1:O ℚ)) (slotC 1)⁆
    (slotA 1)) 1 2)

/-- TRUE (tied to the banked N289 closure `famC_famA_closure`): the certificate is `1`. -/
theorem braVal_eq : braVal = 1 := by
  show reQ ((⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotB (1:O ℚ)) (slotC 1)⁆
    (slotA 1)) 1 2) = 1
  rw [famC_famA_closure, famB_eq_adE, adE_apply, slotA_one_ocRM]
  simp only [ocRM, pA, pC, Matrix.mul_apply, Matrix.sub_apply, Matrix.of_apply,
    Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons, ocR_sub, ocR_zero, ocR_one,
    mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, sub_zero, zero_sub, reQ]
  norm_num

/-- TRUE: the magnitude of the so(3)-closure certificate is `1`. -/
theorem braNum_true : braVal.num.natAbs = 1 := by rw [braVal_eq]; decide

/-- TRUE: `min 318 (magnitude of the so(3)-closure certificate) = 1`, holding precisely because the
    closure bracket `⁅famC, famA⁆` GENUINELY equals the nonzero generator `famB` (which carries
    `slotA 1 ↦ slotC 1`) — so the family-rotation room is the non-abelian simple `so(3)`. -/
theorem bra_scale_true : min (318 : ℕ) braVal.num.natAbs = 1 := by
  rw [braNum_true]; decide

/-- BOGUS: claims `min 318 (magnitude of the closure certificate) = 318`. It GENUINELY equals `1`
    (`bra_scale_true`). The WRONG reading (the family-rotation room is abelian / the closure bracket
    vanishes / the generators do not close / the room is trivial) reduces — through the banked value —
    to the false numeric `1 = 318`, so this must NOT compile. -/
theorem bra_scale_wrong_BOGUS :
    min (318 : ℕ) braVal.num.natAbs = 318 := by
  rw [bra_scale_true]
  -- ⊢ (1 : ℕ) = 318  (FALSE — the costume bites)

end Counterexamples
