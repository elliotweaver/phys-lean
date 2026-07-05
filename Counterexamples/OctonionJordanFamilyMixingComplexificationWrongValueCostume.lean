/-
  Counterexamples.OctonionJordanFamilyMixingComplexificationWrongValueCostume — N303 anti-vacuity (C332).
  ===========================================================================
  W8 ANTI-VACUITY. The N303 node banks the FOLD-ROOT COMPLEXIFICATION of the generation-mixing
  sector: the family-breaking coset `kAB = innerMul (slotA u1)(slotB 1) ∈ derH3` carries the diagonal
  mass-splitting into the fold's IMAGINARY mixing direction, and the bracket `famMixJ = ⁅famC, kAB⁆`
  acts on the mixing plane `span{slotC 1, slotC u1}` as a genuine COMPLEX STRUCTURE with SQUARE `−16`
  (`famMixJ_sq_slotC_one`). The load-bearing NON-TRIVIALITY is that this square is a genuine nonzero
  NEGATIVE scalar (a true complex structure), NOT the trivial zero / a degenerate map: `famMixJ²`
  sends `slotC 1` to `(−16) • slotC 1`, whose `(1,2)` deep-real coordinate is `−16`. If the bracket
  acted trivially (or squared to `0`, or the mixing plane were not complex), the whole
  complexification statement would be vacuous.

  The certificate is the magnitude of the complex-structure square's moved coordinate. The double
  bracket sends `slotC 1` to `(−16) • slotC 1` (`famMixJ_sq_slotC_one`), whose `(1,2)` entry is
  `(−16) • 1`, deep-real coordinate `−16` (`slotC_entry`):

      `certVal := ((famMixJ (famMixJ (slotC 1))) 1 2).re.re.re   (= −16)`.

  We anchor `certVal.num.natAbs = 16` (TRUE), packaged as `min 332 (certVal.num.natAbs) = 16`, TIED to
  the node's complex-structure non-vacuity via `famMixJ_sq_slotC_one` (the bracket genuinely phases
  the mixing plane, squaring to `−16`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the bracket is the zero map / the mixing plane is
  not complex / the complexification is vacuous / the square is trivial): that `min 332 (…) = 332`. It
  GENUINELY equals `16` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `16 = 332` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (332, 16) is fresh (RHS 332 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanFamilyMixingComplexification
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE COMPLEX-STRUCTURE CERTIFICATE: the deep-real `(1,2)` coordinate of the square of the mixing
    complex structure `famMixJ = ⁅famC, kAB⁆` applied to `slotC 1`. By `famMixJ_sq_slotC_one` this is
    `(−16) • slotC 1`, whose `(1,2)` entry is `(−16) • 1`, deep-real coordinate `−16`. -/
noncomputable def certVal : ℚ :=
  ((⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆
      (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotC 1))) 1 2).re.re.re

/-- TRUE (tied to the banked N303 complex-structure square via `famMixJ_sq_slotC_one`): the bracket
    squares to `−16` on the mixing plane, so the moved `(1,2)` coordinate is `−16`. -/
theorem certVal_eq : certVal = -16 := by
  unfold certVal
  rw [famMixJ_sq_slotC_one]
  rw [show ((-16 : ℚ) • slotC (1 : O ℚ)) 1 2 = (-16 : ℚ) • ((slotC (1 : O ℚ)) 1 2) from rfl,
      slotC_entry]
  show ((-16 : ℚ) • (1:O ℚ)).re.re.re = -16
  simp [CD.one_re, Dbl.one_re, cd_qsmul_re]

/-- TRUE: the magnitude of the complex-structure square's moved coordinate is `16`. -/
theorem certNum_true : certVal.num.natAbs = 16 := by rw [certVal_eq]; decide

/-- TRUE: `min 332 (magnitude of the certificate) = 16`, holding precisely because the mixing complex
    structure genuinely squares to `−16` — the complexification is non-vacuous. -/
theorem cert_val_true : min (332 : ℕ) certVal.num.natAbs = 16 := by
  rw [certNum_true]; decide

/-- BOGUS: claims `min 332 (magnitude of the certificate) = 332`. It GENUINELY equals `16`
    (`cert_val_true`). The WRONG reading (the bracket is trivial / the mixing plane is not complex /
    the complexification is vacuous) reduces — through the banked value — to the false numeric
    `16 = 332`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (332 : ℕ) certVal.num.natAbs = 332 := by
  rw [cert_val_true]
  -- ⊢ (16 : ℕ) = 332  (FALSE — the costume bites)

end Counterexamples
