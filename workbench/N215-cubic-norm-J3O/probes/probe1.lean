import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-- THE CUBIC NORM (Freudenthal reduced determinant) of the general Hermitian matrix
    `Hm d0 d1 d2 a b c` over `O ℚ`. Since `O ℚ` is noncommutative, `Matrix.det` (a CommRing
    notion) does not typecheck; the Freudenthal cubic norm is the ℚ-valued replacement. -/
noncomputable def jN (d0 d1 d2 : ℚ) (a b c : O ℚ) : ℚ :=
  d0 * d1 * d2
    - d0 * gForm c c
    - d1 * gForm b b
    - d2 * gForm a a
    + 2 * reQ ((a * c) * star b)

/-- jN on the diagonal Cartan is the product of the three real eigenvalues. -/
theorem jN_diag (d0 d1 d2 : ℚ) : jN d0 d1 d2 0 0 0 = d0 * d1 * d2 := by
  unfold jN gForm reQ
  simp

/-- ★ WELL-DEFINEDNESS: the trilinear cross-term is bracketing-INDEPENDENT.
    `reQ ((a*c)*star b) = reQ (a*(c*star b))` — FORCED by octonion trace-associativity
    (`reQ_mul_assoc3`, N210). This is the structural reason the cubic norm is well-defined. -/
theorem jN_cross_wd (a b c : O ℚ) :
    reQ ((a * c) * star b) = reQ (a * (c * star b)) := reQ_mul_assoc3 a c (star b)

/-- The identity matrix has unit cubic norm. -/
theorem jN_one : jN 1 1 1 0 0 0 = 1 := by
  unfold jN gForm reQ; simp

/-- A primitive frame idempotent `E0` has cubic norm 0 (it is rank 1). -/
theorem jN_frame0 : jN 1 0 0 0 0 0 = 0 := by
  unfold jN gForm reQ; simp

/-- W8 witness 1: a genuine off-diagonal contribution — the `a` slot reduces the norm
    from `8` (diagonal `2·2·2`) to `6`. -/
theorem jN_witness_a : jN 2 2 2 1 0 0 = 6 := by
  unfold jN gForm reQ
  simp
  norm_num

/-- W8 witness 2: the PURE trilinear cross-term. With zero diagonal the norm is
    `2·reQ((a·c)·star b)`; for `a=b=c=1` this is `2`. -/
theorem jN_witness_cross : jN 0 0 0 1 1 1 = 2 := by
  unfold jN gForm reQ
  simp
  norm_num

#print axioms jN_diag
#print axioms jN_cross_wd
#print axioms jN_one
#print axioms jN_frame0
#print axioms jN_witness_a
#print axioms jN_witness_cross

end Phys.Algebra.HJ
