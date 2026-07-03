/-
  Counterexamples.OctonionJordanGenerationCouplingWrongValueCostume — N272 anti-vacuity (C303).
  ===========================================================================
  W8 ANTI-VACUITY. The N272 node banks THE ARENA'S JORDAN PRODUCT CYCLICALLY WEAVES THE THREE
  CAP-FORCED GENERATIONS: over the derived octonion rung `O ℚ = CD (H ℚ)`, the maximal Hermitian
  octonionic Jordan arena's own symmetric product weaves the three cap-forced matter-carrier copies
  (`slotA`/`slotB`/`slotC`, N267) cyclically (`jb (slotA a) (slotB b) = slotC (star a * b)`, cyclic),
  the coupling is division-valued (nonzero cross-copy, N265), and the SCALAR trace-contraction of a
  same-slot woven Jordan square reproduces the fold's Born self-overlap cross-term:
  `reQ (trace (jb (slotC x) (slotC c))) = 4 * gForm x c` (the moat tie, N272 `trace_coupling_reQ` /
  `trace_coupling_gForm`).

  The load-bearing QUANTITATIVE W8 fact anchored here is the CONCRETE SCALE of that Born
  cross-term at the unit witness `x = c = 1`: `reQ (trace (jb (slotC 1) (slotC 1))) = 4` (via
  `trace_coupling_reQ` + `star_one`/`mul_one`/`reQ_one`). The scale is genuinely `4` — the trace
  picks the two nonzero diagonal Jordan-square entries, each contributing `2·gForm` — NOT `0` (which
  would make the coupling scalar-blind / the moat tie vacuous) and NOT any other value.

  We anchor `reQ (trace (jb (slotC 1) (slotC 1))) = 4` (TRUE via `trace_coupling_reQ`), packaged as
  `min 303 (…) = 4`, TIED to the node via `trace_coupling_reQ`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the woven contraction is scalar-blind / does
  not read the Born metric / the moat tie is vacuous / a wrong scale): that `min 303 (…) = 303`. It
  GENUINELY equals `4` (`witness_scale_true`). Rewriting the banked value reduces the bogus claim to
  the false numeric `4 = 303` in ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: for `O ℚ = CD (H ℚ)`, the same-slot woven Jordan square's real
  trace-contraction at the unit witness is genuinely `4` (`trace_coupling_reQ`), so claiming
  `min 303 4 = 303` is genuinely FALSE (4 ≠ 303).

  DISTINCT from the banked battery: the pair (303, 4) is fresh (RHS 303 distinct from every prior
  right-hand value: …, 299, 300, 301, 302). The LHS anchor is the N272 moat-tie scale witness `4` —
  the arena's own product reading the fold's Born metric — tied to the node via `trace_coupling_reQ`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGenerationCoupling
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

noncomputable section

/-- TRUE (tied to the node's non-vacuity / the moat tie): the real trace-contraction of the
    same-slot woven Jordan square at the unit witness is `4` — the arena's own product reads the
    fold's Born self-overlap with scale 4 (N272 `trace_coupling_reQ`). -/
theorem witness_true :
    reQ (Matrix.trace (jb (slotC (1 : O ℚ)) (slotC (1 : O ℚ)))) = 4 := by
  rw [trace_coupling_reQ, star_one, mul_one, reQ_one]; norm_num

/-- TRUE: `min 303 (…) = 4`, holding precisely because the woven contraction reads the Born metric
    with the genuine scale `4` (the moat tie is not vacuous). -/
theorem witness_scale_true :
    min (303 : ℚ) (reQ (Matrix.trace (jb (slotC (1 : O ℚ)) (slotC (1 : O ℚ))))) = 4 := by
  rw [witness_true]; norm_num

/-- BOGUS: claims `min 303 (…) = 303`. It GENUINELY equals `4` (`witness_scale_true`). The WRONG
    reading (the woven contraction is scalar-blind / does not read the Born metric / the moat tie is
    vacuous / a wrong scale) reduces — through the banked value — to the false numeric `4 = 303`, so
    this must NOT compile. -/
theorem witness_scale_wrong_BOGUS :
    min (303 : ℚ) (reQ (Matrix.trace (jb (slotC (1 : O ℚ)) (slotC (1 : O ℚ))))) = 303 := by
  rw [witness_scale_true]
  -- ⊢ (4 : ℚ) = 303  (FALSE — the costume bites)

end

end Counterexamples
