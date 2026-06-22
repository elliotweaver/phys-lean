/- PROBE (run 50, W9.2): is the central-diagonal reduction jdef(D+X, E+Y) = jdef(X,Y)
   cheaply provable from banked centrality? The diagonal D = diag(ocR/central) drops out.
   We model D,E as matrices whose entries are CENTRAL (commute+associate with everything).
   Test the cleanest form: a diagonal matrix of central scalars added to ANY matrix.
   If the Jordan bracket/defect respects this additively+centrally, it's a structural
   matrix identity, cheap. MEASURE. -/
import Phys.Algebra.JordanTower
import Phys.Algebra.HermitianJordan.CompCentral
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbeReduce
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Matrix

attribute [local instance] CD.narCD CD.srCD

-- Try the simplest nontrivial sub-claim: does adding a real central scalar to ONE
-- diagonal slot leave jdef unchanged? First just measure the full Hm vs Xz defect equality
-- on the actual carrier via the banked structure. (We expect this is the hard part too —
-- measure before trusting.)
noncomputable def Xz (a b c : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  !![ 0,       a,       b;
      star a,  0,       c;
      star b,  star c,  0]

set_option maxHeartbeats 1000000 in
-- MEASURE: just reduce jdef(Hm) - jdef(Xz) structure with octonions opaque + ocR.
-- We want to see if the DIFFERENCE collapses cheaply (the reduction), separate from
-- the core vanishing. trace_state only.
example (d0 d1 d2 e0 e1 e2 : ℚ) (a b c p q r : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r)) 0 1
      = (jdef (Xz a b c) (Xz p q r)) 0 1 := by
  unfold jdef jb Hm Xz
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add]
  trace_state
  sorry

end ProbeReduce
