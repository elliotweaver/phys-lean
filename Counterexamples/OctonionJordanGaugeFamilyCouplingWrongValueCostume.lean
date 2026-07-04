/-
  Counterexamples.OctonionJordanGaugeFamilyCouplingWrongValueCostume — N291 anti-vacuity (C320).
  ===========================================================================
  W8 ANTI-VACUITY. The N291 node banks that the derived arena's Jordan-derivation Lie algebra
  `f₄ = Der(H₃(O)) = derH3` (N285/N286) contains a GAUGE-COVARIANT, COLOUR-NEUTRAL, FAMILY-VISIBLE
  coupling member

      Mc := innerMul (slotA u1) (slotB 1)         (u1 = the fold-root √−1, imaginary; slotA u1 Herm),

  the forced family-symmetry-BREAKING object N290 named as ★5's missing ingredient. Unlike the
  gauge-CENTRAL family generators (N288 `fam_gauge_central`), Mc is genuinely gauge-COVARIANT
  (`coupling_covariance`) and MOVES matter no zero map could: its action on the diagonal `Dg 0 0 1`
  has `(1,2)` entry `star u1` (banked `coupling_slotA_diag_entry` = `innerMul_slot_diag`, N274).

  The load-bearing content is that this coupling is NON-TRIVIAL — the cross complement of
  (gauge ⊕ family) inside f₄ is genuinely occupied, Mc genuinely SEES the gauge and MOVES matter. The
  certificate that Mc is non-trivial is the `re.im.re` coordinate of that `(1,2)` entry:

      `((innerMul (slotA u1)(slotB 1) (Dg 0 0 1)) 1 2).re.im.re = -1`

  Since `star u1 = -u1` (banked `star_u1`) and `u1.re.im.re = 1`, the coordinate is `-1 ≠ 0`,
  certifying `Mc (Dg 0 0 1) ≠ 0` — Mc moves the diagonal that every entrywise gauge element FIXES
  (`jAct_Dg = 0`, N268), so it is a genuine, non-trivial member of the gauge↔family coupling
  complement, NOT gauge-central like the family.

  We anchor `braVal.num.natAbs = 1` (TRUE), packaged as `min 320 (braVal.num.natAbs) = 1`, TIED to
  the node via `coupling_slotA_diag_entry` (`(Mc (Dg 0 0 1)) 1 2 = star u1 * 1`) + `star_u1`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the coupling is gauge-CENTRAL like the family /
  the cross-term is empty / f₄ has no coupling beyond gauge ⊕ family / Mc does not move matter): that
  `min 320 (…) = 320`. It GENUINELY equals `1` (`bra_scale_true`). Rewriting the banked value reduces
  the bogus claim to the false numeric `1 = 320` in ℕ. The kernel cannot close it; the costume BITES.

  DISTINCT from the banked battery: the pair (320, 1) is fresh (RHS 320 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE COUPLING-NON-TRIVIALITY CERTIFICATE: the `re.im.re` coordinate of the `(1,2)` entry that
    `Mc = innerMul (slotA u1)(slotB 1)` produces on the diagonal `Dg 0 0 1`. Since that entry is
    `star u1 * 1 = star u1 = -u1` (banked `coupling_slotA_diag_entry` + `star_u1`) and `u1.re.im.re
    = 1`, the coordinate is `-1`, certifying `Mc (Dg 0 0 1) ≠ 0` — Mc genuinely moves the diagonal
    the entrywise gauge fixes, so the gauge↔family coupling complement is non-empty. -/
noncomputable def braVal : ℚ :=
  ((innerMul (slotA (u1 : O ℚ)) (slotB 1) (Dg 0 0 1)) 1 2).re.im.re

/-- TRUE (tied to the banked N291 entry `coupling_slotA_diag_entry` + `star_u1`): the certificate is
    `-1`. -/
theorem braVal_eq : braVal = -1 := by
  show ((innerMul (slotA (u1 : O ℚ)) (slotB 1) (Dg 0 0 1)) 1 2).re.im.re = -1
  rw [coupling_slotA_diag_entry, mul_one, star_u1]
  simp only [u1, CD.neg_re, Dbl.neg_re, CD.neg_im, Dbl.neg_im]
  norm_num

/-- TRUE: the magnitude of the coupling-non-triviality certificate is `1`. -/
theorem braNum_true : braVal.num.natAbs = 1 := by rw [braVal_eq]; decide

/-- TRUE: `min 320 (magnitude of the coupling-non-triviality certificate) = 1`, holding precisely
    because `Mc (Dg 0 0 1) ≠ 0` — the coupling member genuinely moves the diagonal that the
    entrywise gauge fixes, so the gauge↔family coupling complement is non-empty and Mc is NOT
    gauge-central. -/
theorem bra_scale_true : min (320 : ℕ) braVal.num.natAbs = 1 := by
  rw [braNum_true]; decide

/-- BOGUS: claims `min 320 (magnitude of the certificate) = 320`. It GENUINELY equals `1`
    (`bra_scale_true`). The WRONG reading (the coupling is gauge-central like the family / the
    cross-term is empty / f₄ has no coupling beyond gauge ⊕ family / Mc does not move matter) reduces
    — through the banked value — to the false numeric `1 = 320`, so this must NOT compile. -/
theorem bra_scale_wrong_BOGUS :
    min (320 : ℕ) braVal.num.natAbs = 320 := by
  rw [bra_scale_true]
  -- ⊢ (1 : ℕ) = 320  (FALSE — the costume bites)

end Counterexamples
