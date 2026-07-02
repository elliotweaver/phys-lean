import Phys.Algebra.OctonionJordanSharpPolar
import Mathlib.Tactic

/-!  N220 MEASURE PROBE — bounded W9 cost check for the Freudenthal SHARP ELEMENT.
     Pinned convention (exact-rational numerics, workbench/N220/solve.py):
       A = Hm d0 d1 d2 a b c
       A# = Hm (d1*d2 - gForm c c) (d0*d2 - gForm b b) (d0*d1 - gForm a a)
               (b * star c - d2 • a)      -- (0,1)
               (a * c      - d1 • b)      -- (0,2)
               (star a * b - d0 • c)      -- (1,2)
     Targets to MEASURE for cost:
       (M1) jSharp is well-formed Hm  (trivial def)
       (M2) trace (jSharp A) = ocR (jS A)     [diagonal sum]
       (M3) the trace-pairing  reQ (trace (jSharp A * Hm B)) = jNpolar A B   [THE W9 RISK]
     If M3 closes with a bounded structural simp (matrix product + reQ/gForm lemmas), NOT a
     monolithic octonion-coordinate ring, front 2 is GREEN.  -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

noncomputable def jSharp (d0 d1 d2 : ℚ) (a b c : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Hm (d1 * d2 - gForm c c) (d0 * d2 - gForm b b) (d0 * d1 - gForm a a)
     (b * star c - d2 • a)
     (a * c - d1 • b)
     (star a * b - d0 • c)

-- M2: trace of the sharp element = ocR (jS A).  Measure this first (diagonal only).
set_option maxHeartbeats 800000 in
theorem M2_trace_sharp (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    Matrix.trace (jSharp d0 d1 d2 a b c) = ocR (jS d0 d1 d2 a b c) := by
  unfold jSharp Hm jS
  rw [Matrix.trace]
  simp only [Fin.sum_univ_three, Matrix.diag_apply, Matrix.of_apply, Matrix.cons_val',
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const]
  rw [ocR_add, ocR_add]
  -- goal: ocR(d1 d2 - |c|²) + ocR(d0 d2 - |b|²) + ocR(d0 d1 - |a|²) = ocR(...)  ; sub via ocR_add/neg?
  sorry

end Phys.Algebra.HJ
