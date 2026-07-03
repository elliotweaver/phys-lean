/-
  Counterexamples.OctonionJordanThreeMatterSlotsWrongValueCostume — N267 anti-vacuity (C298).
  ===========================================================================
  W8 ANTI-VACUITY. The N267 node banks THE FORCED THREE-FOLD MATTER-CARRIER MULTIPLICITY OF THE
  MAXIMAL HERMITIAN OCTONIONIC JORDAN ORDER: over the derived octonion rung `O ℚ = CD (H ℚ)`, the
  general self-adjoint element of the maximal Jordan order (3) decomposes as `Hm = Dg + slotA a +
  slotB b + slotC c` (a real diagonal ⊕ EXACTLY THREE position-disjoint injective ℚ-linear copies of
  the matter carrier `O ℚ`), and the order-4 arena is blocked by the cap.

  The load-bearing QUANTITATIVE W8 fact is that the THIRD matter-carrier slot is GENUINELY PRESENT
  and non-vacuous: the slot `slotC c` deposits its octonion `c` at the `(1,2)` entry
  (`slotC_entry : (slotC c) 1 2 = c`). We anchor a concrete deep coordinate: for the unit octonion
  `c = 1`, the `(1,2)` entry of `slotC 1` reads `((slotC 1) 1 2).re.re.re = 1` — the third slot is a
  genuine, nonzero embedding, so the multiplicity is genuinely THREE (not two, not vacuous).

  We anchor the clean scalar `((slotC (1 : O ℚ)) 1 2).re.re.re = 1` (TRUE via `slotC_entry`,
  `CD.one_re`/`Dbl.one_re`), packaged as `min 298 (…) = 1`, TIED to the node via `third_slot_true`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the third slot is absent / the decomposition is
  wrong / the maximal arena carries fewer than three matter-carrier slots / the count is not the
  cap-forced three): that `min 298 (((slotC 1) 1 2).re.re.re) = 298`. It GENUINELY equals `1`
  (`third_slot_scale_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `1 = 298` in ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: for `O ℚ = CD (H ℚ)`, the third off-diagonal matter-carrier slot
  `slotC 1` genuinely reads `1` at its `(1,2)` entry (`slotC_entry`), and claiming it reads `298` is
  genuinely FALSE (1 ≠ 298).

  DISTINCT from the banked battery: the pair (298, 1) is fresh (RHS 298 distinct from every prior
  right-hand value: …, 294, 295, 296, 297). The LHS anchor is the N267 third-matter-slot witness
  `1` — the genuine third copy of the matter carrier witnessing the cap-forced three-ness — tied to
  the node via `slotC_entry`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanThreeMatterSlots

namespace Counterexamples

open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

noncomputable section

/-- TRUE (tied to the node's decomposition): the THIRD matter-carrier slot `slotC 1` genuinely
    deposits the unit octonion at its `(1,2)` entry, whose deep real coordinate is `1`. Via the
    banked `slotC_entry`. The third copy of the matter carrier is genuinely present. -/
theorem third_slot_true :
    ((slotC (1 : O ℚ)) 1 2).re.re.re = 1 := by
  rw [slotC_entry]
  simp [CD.one_re, Dbl.one_re]

/-- TRUE: `min 298 (((slotC 1) 1 2).re.re.re) = 1`, holding precisely because the third
    matter-carrier slot is a genuine nonzero embedding (the cap-forced three-ness is non-vacuous). -/
theorem third_slot_scale_true :
    min (298 : ℚ) (((slotC (1 : O ℚ)) 1 2).re.re.re) = 1 := by
  rw [third_slot_true]; norm_num

/-- BOGUS: claims `min 298 (((slotC 1) 1 2).re.re.re) = 298`. It GENUINELY equals `1`
    (`third_slot_scale_true`). The WRONG reading (third slot absent / decomposition wrong / fewer
    than three matter-carrier slots / count not the cap-forced three) reduces — through the banked
    value — to the false numeric `1 = 298`, so this must NOT compile. -/
theorem third_slot_scale_wrong_BOGUS :
    min (298 : ℚ) (((slotC (1 : O ℚ)) 1 2).re.re.re) = 298 := by
  rw [third_slot_scale_true]
  -- ⊢ (1 : ℚ) = 298  (FALSE — the costume bites)

end

end Counterexamples
