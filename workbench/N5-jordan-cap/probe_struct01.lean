import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

namespace ProbeStruct
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

-- abstract Hermitian 3x3 over the octonion shape CD (CD B), real (central) diagonal
-- modeled by ANY central self-adjoint elements d0 d1 d2 (we keep them opaque self-adjoint
-- octonions; for the probe we use zero diagonal first to see the off-diagonal core).
noncomputable def Hz (a b c : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0,       a,       b;
      star a,  0,       c;
      star b,  star c,  0]

-- MEASURE ONLY: reduce the matrix structure of entry (0,1), octonions OPAQUE, NO closer.
-- We expect an octonion identity in a,b,c,p,q,r and their stars. Inspect the goal.
set_option maxHeartbeats 1000000 in
theorem probe_entry01 (a b c p q r : CD (CD B)) :
    (jdef (Hz a b c) (Hz p q r)) 0 1 = 0 := by
  unfold jdef jb Hz
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add]
  trace_state
  sorry

end ProbeStruct
