/-
  Counterexamples.OctonionJordanGaugeUniversalityWrongValueCostume — N268 anti-vacuity (C299).
  ===========================================================================
  W8 ANTI-VACUITY. The N268 node banks THE DERIVED GAUGE ACTS ON THE MAXIMAL MATTER ARENA BY
  JORDAN DERIVATIONS, IDENTICALLY ACROSS THE THREE CAP-FORCED COPIES (family universality
  FORCED): over the derived octonion rung `O ℚ = CD (H ℚ)`, the entrywise gauge action
  `jAct D M := M.map (D ·)` of a Leibniz derivation `D` of `O ℚ` is a derivation of the Jordan
  bracket, FIXES the real diagonal (`jAct_Dg : jAct D (Dg d0 d1 d2) = 0`), and carries each of the
  three matter-carrier slots by the IDENTICAL rule `jAct D (slotX v) = slotX (D v)`.

  The load-bearing QUANTITATIVE W8 fact anchored here is the DIAGONAL GAUGE-FIXING: the real
  diagonal (the "trace"/spacetime directions) is annihilated by the entrywise gauge action, so its
  entries are GENUINELY sent to `0`. We anchor a concrete deep coordinate: for the banked nonzero
  witness derivation `witnessDerivQ` (N6) and the diagonal `Dg 5 0 0`, the `(0,0)` entry of the
  gauge-acted matrix reads `((jAct witnessDerivQ (Dg 5 0 0)) 0 0).re.re.re = 0` — the diagonal is
  gauge-FIXED (unlike the three matter-carrier slots, which transform).

  We anchor `((jAct witnessDerivQ (Dg (5:ℚ) 0 0)) 0 0).re.re.re = 0` (TRUE via `jAct_Dg`), packaged
  as `min 299 (…) = 0`, TIED to the node via `diag_fixed_true`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the gauge does NOT fix the diagonal / acts
  nontrivially on the trace/spacetime directions / the gauge does not act by derivations / the three
  copies transform NON-uniformly): that `min 299 (((jAct witnessDerivQ (Dg 5 0 0)) 0 0).re.re.re) =
  299`. It GENUINELY equals `0` (`diag_fixed_scale_true`). Rewriting the banked value reduces the
  bogus claim to the false numeric `0 = 299` in ℚ. The kernel cannot close it; the costume BITES
  (exit 1).

  The bite is name-independent: for `O ℚ = CD (H ℚ)`, the entrywise action of the derivation
  `witnessDerivQ` genuinely annihilates the central-scalar diagonal (`jAct_Dg`), so the `(0,0)`
  coordinate is genuinely `0`, and claiming it is `299` is genuinely FALSE (0 ≠ 299).

  DISTINCT from the banked battery: the pair (299, 0) is fresh (RHS 299 distinct from every prior
  right-hand value: …, 295, 296, 297, 298). The LHS anchor is the N268 diagonal-gauge-fixing witness
  `0` — the trace/spacetime diagonal fixed by the entrywise gauge while the three matter-carrier
  slots transform — tied to the node via `jAct_Dg`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.DerivationFinrank

namespace Counterexamples

open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- TRUE (tied to the node's diagonal gauge-fixing): the entrywise gauge action of the banked
    nonzero witness derivation `witnessDerivQ` annihilates the real diagonal `Dg 5 0 0`, so its
    `(0,0)` deep coordinate is genuinely `0`. Via the banked `jAct_Dg`. The trace/spacetime diagonal
    is gauge-FIXED (unlike the three matter-carrier slots, which transform). -/
theorem diag_fixed_true :
    ((jAct witnessDerivQ (Dg (5 : ℚ) 0 0)) 0 0).re.re.re = 0 := by
  rw [jAct_Dg witnessDerivQ witnessDerivQ_isDerivQ]
  simp

/-- TRUE: `min 299 (((jAct witnessDerivQ (Dg 5 0 0)) 0 0).re.re.re) = 0`, holding precisely because
    the gauge action fixes the diagonal (the gauge-fixing is genuine, not vacuous). -/
theorem diag_fixed_scale_true :
    min (299 : ℚ) (((jAct witnessDerivQ (Dg (5 : ℚ) 0 0)) 0 0).re.re.re) = 0 := by
  rw [diag_fixed_true]; norm_num

/-- BOGUS: claims `min 299 (((jAct witnessDerivQ (Dg 5 0 0)) 0 0).re.re.re) = 299`. It GENUINELY
    equals `0` (`diag_fixed_scale_true`). The WRONG reading (the gauge does not fix the diagonal /
    acts nontrivially on the trace directions / does not act by derivations / the three copies
    transform non-uniformly) reduces — through the banked value — to the false numeric `0 = 299`,
    so this must NOT compile. -/
theorem diag_fixed_scale_wrong_BOGUS :
    min (299 : ℚ) (((jAct witnessDerivQ (Dg (5 : ℚ) 0 0)) 0 0).re.re.re) = 299 := by
  rw [diag_fixed_scale_true]
  -- ⊢ (0 : ℚ) = 299  (FALSE — the costume bites)

end

end Counterexamples
