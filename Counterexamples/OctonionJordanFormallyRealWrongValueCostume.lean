/-
  Counterexamples.OctonionJordanFormallyRealWrongValueCostume — N270 anti-vacuity (C301).
  ===========================================================================
  W8 ANTI-VACUITY. The N270 node banks THE OBSERVABLE MATTER ARENA IS FORMALLY REAL: over the
  derived octonion rung `O ℚ = CD (H ℚ)`, the fold's Born positivity lifts to the maximal matter
  arena `J₃(O ℚ) = H₃(O ℚ)`, making the real trace-square functional `jQ A = reQ (trace (A * A))`
  (and the banked Cartan–Killing trace form `jTraceForm`, N214) POSITIVE-DEFINITE: `jQ A ≥ 0` with
  `= 0 ↔ A = 0`. The positivity is NON-VACUOUS: a genuine NONZERO off-diagonal (matter-slot)
  element has STRICTLY POSITIVE trace-square.

  The load-bearing QUANTITATIVE W8 fact anchored here is the STRICTLY POSITIVE OFF-DIAGONAL VALUE:
  the pure off-diagonal Hermitian element `Hm 0 0 0 1 0 0` (`= slotA 1`, a matter-carrier slot) has
  trace-square `jQ 0 0 0 1 0 0 = 2` (N270 `jQ_witness_offdiag`, `= 2·gForm 1 1`) — a genuine
  positive value the fold's positivity assigns to a MATTER-slot direction, not only the diagonal.
  If the form vanished off-diagonal, formal reality would fail to see the matter carrier; it does
  not — the off-diagonal contributes `2·gForm 1 1 = 2 > 0`.

  We anchor `jQ 0 0 0 1 0 0 = 2` (TRUE via `jQ_witness_offdiag`), packaged as `min 301 (…) = 2`,
  TIED to the node via `jQ_witness_offdiag`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the trace-square form is trivial off-diagonal /
  positivity sees only the diagonal / the matter slots carry no positive norm / formal reality is
  vacuous): that `min 301 (jQ 0 0 0 1 0 0) = 301`. It GENUINELY equals `2`
  (`offdiag_value_scale_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `2 = 301` in ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: for `O ℚ = CD (H ℚ)`, the trace-square of `Hm 0 0 0 1 0 0` is
  genuinely `2` (`jQ_witness_offdiag`), so the matter-slot direction carries genuine positive
  trace-square, and claiming `min 301 2 = 301` is genuinely FALSE (2 ≠ 301).

  DISTINCT from the banked battery: the pair (301, 2) is fresh (RHS 301 distinct from every prior
  right-hand value: …, 297, 298, 299, 300). The LHS anchor is the N270 strictly-positive
  off-diagonal trace-square witness `2` — the genuine positive value the fold's positivity assigns
  to a matter-carrier slot — tied to the node via `jQ_witness_offdiag`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanFormallyReal

namespace Counterexamples

open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- TRUE (tied to the node's non-vacuity): the trace-square form takes a genuine STRICTLY POSITIVE
    value on a matter-carrier slot — the pure off-diagonal `Hm 0 0 0 1 0 0` has `jQ 0 0 0 1 0 0 = 2`
    (N270 `jQ_witness_offdiag`, `= 2·gForm 1 1`). The fold's positivity genuinely sees the matter
    carrier, not only the real diagonal. -/
theorem offdiag_value_true : jQ (Hm 0 0 0 1 0 0) = 2 := jQ_witness_offdiag

/-- TRUE: `min 301 (jQ 0 0 0 1 0 0) = 2`, holding precisely because the off-diagonal matter-slot
    trace-square is a genuine positive value (formal reality is non-vacuous). -/
theorem offdiag_value_scale_true : min (301 : ℚ) (jQ (Hm 0 0 0 1 0 0)) = 2 := by
  rw [offdiag_value_true]; norm_num

/-- BOGUS: claims `min 301 (jQ 0 0 0 1 0 0) = 301`. It GENUINELY equals `2`
    (`offdiag_value_scale_true`). The WRONG reading (the trace-square is trivial off-diagonal /
    positivity sees only the diagonal / the matter slots carry no positive norm / formal reality is
    vacuous) reduces — through the banked value — to the false numeric `2 = 301`, so this must NOT
    compile. -/
theorem offdiag_value_scale_wrong_BOGUS : min (301 : ℚ) (jQ (Hm 0 0 0 1 0 0)) = 301 := by
  rw [offdiag_value_scale_true]
  -- ⊢ (2 : ℚ) = 301  (FALSE — the costume bites)

end

end Counterexamples
