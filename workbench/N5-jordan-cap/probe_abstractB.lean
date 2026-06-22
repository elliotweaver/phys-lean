/-
  PROBE (W9.2 measurement, throwaway): is the H₃ Jordan-defect entry tractable
  at the ABSTRACT `CD (CD B)` level (CommRing B, star opaque) rather than concrete ℚ?

  At abstract B: each octonion = 4 B-coords, star(B-coord) stays an OPAQUE atom.
  This is the level at which Alternative.lean's mul_mul_left etc. compiled cheaply.
  If ONE entry closes here in bounded time, productionize over B then instantiate
  B := Dbl ℚ for O ℚ.  KILL: > 3 min wall for one entry → pivot to structural route.
-/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbeAbs
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- real (self-adjoint, central) diagonal element of `CD (CD B)`: `⟨⟨b,0⟩,0⟩`. -/
def dR (b : B) : CD (CD B) := ⟨⟨b, 0⟩, ⟨0, 0⟩⟩

/-- general Hermitian 3×3 over the abstract octonion shape `CD (CD B)`. -/
def Hm (d0 d1 d2 : B) (a b c : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ dR d0,   a,       b;
      star a,   dR d1,  c;
      star b,   star c,  dR d2]

set_option maxHeartbeats 8000000 in
/-- (0,0) entry over abstract B. -/
theorem entry_00 (d0 d1 d2 e0 e1 e2 : B) (a b c p q r : CD (CD B)) :
    (jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r)) 0 0 = 0 := by
  unfold jdef jb Hm dR
  ext <;>
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    star_add, star_neg, star_mul', star_star, star_zero,
    neg_mul, mul_neg, neg_neg, mul_add, add_mul, mul_zero, zero_mul,
    add_zero, zero_add] <;>
  ring

end ProbeAbs
