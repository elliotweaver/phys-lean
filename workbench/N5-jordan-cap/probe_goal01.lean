/- PROBE (run 50, W9.2 measurement — bounded, NO closer, throwaway).
   Goal: see the OCTONION-LEVEL polynomial identity for ONE off-diagonal entry of
   jdef(Hm,Hm), with the REAL central diagonal (dR), octonions kept OPAQUE. This is
   the INPUT to the sequenced rewrite. Matrix structure reduced only; trace_state; sorry.
   Bounded heartbeats; this does NOT run any normalizer closer. -/
import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbeGoal
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- central self-adjoint diagonal element, kept as an opaque central atom via `d`. -/
def Hm (d0 d1 d2 : CD (CD B)) (a b c : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ d0,      a,       b;
      star a,  d1,      c;
      star b,  star c,  d2]

set_option maxHeartbeats 1000000 in
/-- off-diagonal entry (0,1): reduce matrix structure ONLY, octonions opaque. -/
theorem probe01 (d0 d1 d2 e0 e1 e2 a b c p q r : CD (CD B)) :
    (jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r)) 0 1 = 0 := by
  unfold jdef jb Hm
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]
  trace_state
  sorry

end ProbeGoal
