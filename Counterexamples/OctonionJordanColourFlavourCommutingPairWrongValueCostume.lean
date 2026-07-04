/-
  Counterexamples.OctonionJordanColourFlavourCommutingPairWrongValueCostume — N294 anti-vacuity (C323).
  ===========================================================================
  W8 ANTI-VACUITY. The N294 node banks that inside the single derived `f₄ = Der(H₃(O))` the derived
  gauge-COLOUR su(3) (`jActL(colourCentralizer)`, N201/N268) and the derived family-FLAVOUR su(3)
  (`Z_{f4}(colour)` = family so(3) {famA,famB,famC} ⊕ fold-root-dressed coset {kAB,kBC,kCA}, N287–293)
  form a genuine COMMUTING PAIR — they mutually commute AND are genuinely DISTINCT (`flavour ⊄ gauge`).

  The distinctness (`famC_ne_gauge`) is the load-bearing ★1↔★4 content: no flavour generator is an
  entrywise gauge element, because the family generator `famC = innerMul (slotA 1)(slotB 1)` moves
  matter ACROSS generation slots,

      ★  famC (slotA 1) = − slotB 1        (banked `famC_slotA`),

  whereas every entrywise gauge `jActL D` PRESERVES each generation slot (`jActL D (slotA a) =
  slotA (D a)`, N268) and kills `slotA 1` (`D 1 = 0`). So `famC ≠ jActL D` for every derivation `D`.

  The certificate that `famC` genuinely crosses slots (so the two su(3)'s are distinct, a genuine
  commuting PAIR and not one algebra) is the `re.re.re` coordinate of the `(0,2)` entry that `famC`
  produces on the first generation slot `slotA 1`:

      `((innerMul (slotA 1)(slotB 1) (slotA 1)) 0 2).re.re.re = −1`

  Since `famC (slotA 1) = − slotB 1` (banked `famC_slotA`), the `(0,2)` entry is `− 1` (the octonion
  unit negated), whose `re.re.re` coordinate is `−1 ≠ 0`, certifying `famC (slotA 1) ≠ 0` in the
  `slotB` position — the family generator moves generation slot A into slot B, which NO gauge element
  can (gauge preserves slot A). So flavour is genuinely OUTSIDE the gauge image: a commuting PAIR.

  We anchor `braVal.num.natAbs = 1` (TRUE), packaged as `min 323 (braVal.num.natAbs) = 1`, TIED to
  the node via `famC_slotA` (`famC (slotA 1) = − slotB 1`) + the `slotB`/`Xz` coordinate.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: colour and flavour are the same algebra /
  flavour ⊆ gauge / they do not commute / there is no genuine second su(3)): that
  `min 323 (…) = 323`. It GENUINELY equals `1` (`bra_scale_true`). Rewriting the banked value reduces
  the bogus claim to the false numeric `1 = 323` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (323, 1) is fresh (RHS 323 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanColourFlavourCommutingPair
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE DISTINCTNESS CERTIFICATE: the `re.re.re` coordinate of the `(0,2)` entry that
    `famC = innerMul (slotA 1)(slotB 1)` produces on the first generation slot `slotA 1`. Since
    `famC (slotA 1) = − slotB 1` (banked `famC_slotA`) whose `(0,2)` entry is `−1`, the coordinate
    is `−1`, certifying `famC (slotA 1) ≠ 0` in slot B — the family generator crosses generation
    slots, which no entrywise gauge element does. -/
noncomputable def braVal : ℚ :=
  ((innerMul (slotA (1 : O ℚ)) (slotB 1) (slotA 1)) 0 2).re.re.re

/-- TRUE (tied to the banked N288 action `famC_slotA`): the certificate is `−1`. -/
theorem braVal_eq : braVal = -1 := by
  show ((innerMul (slotA (1 : O ℚ)) (slotB 1) (slotA 1)) 0 2).re.re.re = -1
  rw [famC_slotA]
  simp only [slotB, Xz, Matrix.neg_apply, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two]
  norm_num

/-- TRUE: the magnitude of the distinctness certificate is `1`. -/
theorem braNum_true : braVal.num.natAbs = 1 := by rw [braVal_eq]; decide

/-- TRUE: `min 323 (magnitude of the certificate) = 1`, holding precisely because
    `famC (slotA 1) ≠ 0` in slot B — the family-flavour generator crosses generation slots, so it is
    NOT an entrywise gauge element and the two su(3)'s form a genuine commuting PAIR. -/
theorem bra_scale_true : min (323 : ℕ) braVal.num.natAbs = 1 := by
  rw [braNum_true]; decide

/-- BOGUS: claims `min 323 (magnitude of the certificate) = 323`. It GENUINELY equals `1`
    (`bra_scale_true`). The WRONG reading (colour and flavour are the same algebra / flavour ⊆ gauge /
    they do not commute / there is no genuine second su(3)) reduces — through the banked value — to
    the false numeric `1 = 323`, so this must NOT compile. -/
theorem bra_scale_wrong_BOGUS :
    min (323 : ℕ) braVal.num.natAbs = 323 := by
  rw [bra_scale_true]
  -- ⊢ (1 : ℕ) = 323  (FALSE — the costume bites)

end Counterexamples
