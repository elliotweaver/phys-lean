/-
  Counterexamples.OctonionJordanInnerMultiplicationTriangleWrongValueCostume — N275 anti-vacuity (C306).
  ===========================================================================
  W8 ANTI-VACUITY. The N275 node completes THE INNER-MULTIPLICATION A₂ TRIANGLE — the three derived
  inner-multiplication couplings of the maximal Hermitian octonionic Jordan arena `J₃(O ℚ)` against
  the diagonal Cartan, closing a cyclic triangle, whose three ℚ-coefficients are the trace-zero root
  functionals summing to zero, and which form ONE family-orbit. N274 banked leg 1 (AB→C); N275 banks
  the other two legs and the family-orbit ceiling. The load-bearing NEW leg is

      `innerMul (slotC c) (slotA a) (Dg d0 d1 d2) = slotB ((d0 - d2) • (a * c))`     (N275, leg 3)

  — the inner commutator of the third and first slot multiplications reads the weight difference
  `d0 - d2` (the THIRD trace-zero root functional) into the octonion coupling `a * c` (N272).

  The CONCRETE octonion value anchored here is at the witness `c = 1`, `a = u1` (the fold-root √−1),
  `Dg 1 0 0` (weight difference `d0 - d2 = 1 - 0 = 1`). Leg 3 gives
  `innerMul (slotC 1) (slotA u1) (Dg 1 0 0) = slotB ((1 - 0) • (u1 * 1)) = slotB u1`, whose `(0,2)`
  entry is `u1` (via `slotB_entry`), and `u1.re.re.im = +1`. The value `+1` certifies leg 3 (i)
  carries the NON-ZERO weight difference `d0 - d2 = 1` (a wrong reading that the diagonal split is
  invisible would give the coefficient `0`, hence `0`), AND (ii) carries the octonion coupling
  `u1 * 1 = u1` (a DISTINCT leg from N274's leg 1, which read `star a * b` — leg 3 reads `a * c`
  with NO conjugation on the first factor).

  We anchor `((innerMul (slotC 1) (slotA u1) (Dg 1 0 0)) 0 2).re.re.im = 1` (TRUE via
  `innerMul_slot_diagCA` + `slotB_entry`), packaged as `min 306 (…) = 1`, TIED to the node via the
  headline `innerMul_slot_diagCA`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: leg 3 does NOT close the triangle / the third
  root functional is invisible / the coupling `a * c` is trivial / a wrong value): that
  `min 306 (…) = 306`. It GENUINELY equals `1` (`witness_scale_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `1 = 306` in ℚ. The kernel cannot close it; the
  costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (306, 1) is fresh (RHS 306 distinct from every prior
  right-hand value: …, 302, 303, 304, 305). The LHS anchor is the N275 leg-3 witness `+1` — a leg
  DISTINCT from N274's leg-1 witness (leg 3 reads `a * c` not `star a * b`) — tied to the node via
  `innerMul_slot_diagCA`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- TRUE (tied to the node's headline / leg 3 of the triangle): the `(0,2)` entry of the
    inner-multiplication commutator at the witness `c = 1`, `a = u1`, `Dg 1 0 0` has imaginary
    part `+1` — the fingerprint that leg 3 carries the NON-ZERO third weight difference
    `d0 - d2 = 1` into the octonion coupling `u1 * 1 = u1` (N275 `innerMul_slot_diagCA`). -/
theorem witness_true :
    ((innerMul (slotC (1 : O ℚ)) (slotA u1) (Dg 1 0 0)) 0 2).re.re.im = (1 : ℚ) := by
  rw [innerMul_slot_diagCA, slotB_entry]
  rw [mul_one, sub_zero, one_smul]
  simp only [u1]

/-- TRUE: `min 306 (…) = 1`, holding precisely because leg 3 couples the non-zero third weight
    difference to the octonion coupling (the triangle closes, reading `+1`, not `0`). -/
theorem witness_scale_true :
    min (306 : ℚ) ((innerMul (slotC (1 : O ℚ)) (slotA u1) (Dg 1 0 0)) 0 2).re.re.im = 1 := by
  rw [witness_true]; norm_num

/-- BOGUS: claims `min 306 (…) = 306`. It GENUINELY equals `1` (`witness_scale_true`). The WRONG
    reading (leg 3 does not close the triangle / the third root functional is invisible / the
    coupling `a * c` is trivial / a wrong value) reduces — through the banked value — to the false
    numeric `1 = 306`, so this must NOT compile. -/
theorem witness_scale_wrong_BOGUS :
    min (306 : ℚ) ((innerMul (slotC (1 : O ℚ)) (slotA u1) (Dg 1 0 0)) 0 2).re.re.im = 306 := by
  rw [witness_scale_true]
  -- ⊢ (1 : ℚ) = 306  (FALSE — the costume bites)

end

end Counterexamples
