/-
  Counterexamples.OctonionJordanColourCentralizerCosetWrongValueCostume — N292 anti-vacuity (C321).
  ===========================================================================
  W8 ANTI-VACUITY. The N292 node banks that the derived colour-centralizer `Z_{f4}(colour)` inside
  the derived arena's Jordan-derivation Lie algebra `f₄ = Der(H₃(O)) = derH3` (N285/N286) contains a
  FOLD-ROOT-DRESSED family-breaking COSET — the three members

      kAB := innerMul (slotA u1)(slotB 1)  [= N291's Mc],
      kBC := innerMul (slotB u1)(slotC 1),  kCA := innerMul (slotC u1)(slotA 1)

  (u1 = the fold-root √−1, imaginary) — each COLOUR-NEUTRAL (the fold-root is colour-blind, N266/N291)
  and each ROTATING the three matter generations through the fold's own √−1: `kAB` sends the first
  generation slot to the second, DRESSED by the fold-root,

      ★  kAB (slotA 1) = slotB u1        (banked `kAB_slotA_one`).

  The load-bearing content is that this coset is NON-TRIVIAL and family-VISIBLE — it MOVES the
  generations (it is NOT in N290's family-blind core). The certificate that the coset genuinely moves
  a generation is the `re.im.re` coordinate of the `(0,2)` entry that `kAB` produces on `slotA 1`:

      `((innerMul (slotA u1)(slotB 1) (slotA 1)) 0 2).re.im.re = 1`

  Since `kAB (slotA 1) = slotB u1` (banked `kAB_slotA_one`), the `(0,2)` entry is `u1`, and
  `u1.re.im.re = 1 ≠ 0`, certifying `kAB (slotA 1) ≠ 0` — the fold-root-dressed coset genuinely
  moves the first generation slot, so it is family-VISIBLE (contrast N290's family-blind core) and a
  genuine member of the family-symmetry-BREAKING sector, NOT a trivial/family-invariant object.

  We anchor `braVal.num.natAbs = 1` (TRUE), packaged as `min 321 (braVal.num.natAbs) = 1`, TIED to
  the node via `kAB_slotA_one` (`kAB (slotA 1) = slotB u1`) + the `slotB`/`Xz`/`u1` coordinate.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the coset is trivial / family-INVARIANT like
  N290's core / it does not move the generations / Z_{f4}(colour) has no family-breaking sector):
  that `min 321 (…) = 321`. It GENUINELY equals `1` (`bra_scale_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `1 = 321` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (321, 1) is fresh (RHS 321 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanColourCentralizerCoset
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE COSET-NON-TRIVIALITY CERTIFICATE: the `re.im.re` coordinate of the `(0,2)` entry that
    `kAB = innerMul (slotA u1)(slotB 1)` produces on the first generation slot `slotA 1`. Since
    `kAB (slotA 1) = slotB u1` (banked `kAB_slotA_one`) whose `(0,2)` entry is `u1`, and
    `u1.re.im.re = 1`, the coordinate is `1`, certifying `kAB (slotA 1) ≠ 0` — the fold-root-dressed
    coset genuinely moves the first generation slot (family-VISIBLE). -/
noncomputable def braVal : ℚ :=
  ((innerMul (slotA (u1 : O ℚ)) (slotB 1) (slotA 1)) 0 2).re.im.re

/-- TRUE (tied to the banked N292 action `kAB_slotA_one`): the certificate is `1`. -/
theorem braVal_eq : braVal = 1 := by
  show ((innerMul (slotA (u1 : O ℚ)) (slotB 1) (slotA 1)) 0 2).re.im.re = 1
  rw [kAB_slotA_one]
  simp only [slotB, Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons, Matrix.empty_val', u1]
  norm_num

/-- TRUE: the magnitude of the coset-non-triviality certificate is `1`. -/
theorem braNum_true : braVal.num.natAbs = 1 := by rw [braVal_eq]; decide

/-- TRUE: `min 321 (magnitude of the certificate) = 1`, holding precisely because
    `kAB (slotA 1) ≠ 0` — the fold-root-dressed coset genuinely moves the first generation slot, so
    the family-breaking sector of Z_{f4}(colour) is non-empty and family-VISIBLE. -/
theorem bra_scale_true : min (321 : ℕ) braVal.num.natAbs = 1 := by
  rw [braNum_true]; decide

/-- BOGUS: claims `min 321 (magnitude of the certificate) = 321`. It GENUINELY equals `1`
    (`bra_scale_true`). The WRONG reading (the coset is trivial / family-INVARIANT like N290's core /
    it does not move the generations / Z_{f4}(colour) has no family-breaking sector) reduces —
    through the banked value — to the false numeric `1 = 321`, so this must NOT compile. -/
theorem bra_scale_wrong_BOGUS :
    min (321 : ℕ) braVal.num.natAbs = 321 := by
  rw [bra_scale_true]
  -- ⊢ (1 : ℕ) = 321  (FALSE — the costume bites)

end Counterexamples
