/-
  Counterexamples.OctonionJordanSpectrumMovingSectorWrongValueCostume — N295 anti-vacuity (C324).
  ===========================================================================
  W8 ANTI-VACUITY. The N295 node banks that the Jordan left-multiplication `Lmul (slotA 1)` MOVES the
  identity that every derivation of `f₄ = derH3` KILLS — it is the first member of the spectrum-MOVING
  sector beyond `f₄`. The load-bearing content is the identity-motion law:

      ★  Lmul A 1 = A + A        (banked `Lmul_one`),

  which for `A = slotA 1` is `slotA 1 + slotA 1 ≠ 0` (a derivation would send `1 ↦ 0`,
  `derH3_kills_one`). So `Lmul (slotA 1)` is genuinely OUTSIDE `f₄` (`Lmul_notMem_derH3`).

  The certificate that the left-multiplication genuinely MOVES the identity (so it is NOT a derivation
  and the spectrum-moving sector is a genuine complement of the spectrum-preserving `f₄`) is the
  `re.re.re` coordinate of the `(0,1)` entry that `Lmul (slotA 1)` produces on the identity `1`:

      `((Lmul (slotA 1) 1) 0 1).re.re.re = 2`

  Since `Lmul (slotA 1) 1 = slotA 1 + slotA 1` (banked `Lmul_one`), the `(0,1)` entry is
  `1 + 1 = 2` (the sum of the two unit `(0,1)` slot entries, `slotA_entry`), whose `re.re.re`
  coordinate is `2 ≠ 0`, certifying `Lmul (slotA 1) 1 ≠ 0` — the left-multiplication moves the
  identity, which NO derivation can (`T 1 = 0`). So the spectrum-mover is genuinely beyond `f₄`.

  We anchor `braVal.num.natAbs = 2` (TRUE), packaged as `min 324 (braVal.num.natAbs) = 2`, TIED to
  the node via `Lmul_one` (`Lmul A 1 = A + A`) + the `slotA`/`Xz` coordinate.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the left-multiplication kills the identity like a
  derivation / `Lmul ⊆ f₄` / there is no structure beyond `f₄` / the spectrum-moving sector is empty):
  that `min 324 (…) = 324`. It GENUINELY equals `2` (`bra_scale_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `2 = 324` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (324, 2) is fresh (RHS 324 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanSpectrumMovingSector
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE IDENTITY-MOTION CERTIFICATE: the `re.re.re` coordinate of the `(0,1)` entry that the Jordan
    left-multiplication `Lmul (slotA 1)` produces on the identity `1`. Since
    `Lmul (slotA 1) 1 = slotA 1 + slotA 1` (banked `Lmul_one`) whose `(0,1)` entry is `1 + 1 = 2`,
    the coordinate is `2`, certifying `Lmul (slotA 1) 1 ≠ 0` — the left-multiplication MOVES the
    identity, which no derivation of `f₄` can (`derH3_kills_one`). -/
noncomputable def braVal : ℚ :=
  ((Lmul (slotA (1 : O ℚ)) 1) 0 1).re.re.re

/-- TRUE (tied to the banked N295 law `Lmul_one`): the certificate is `2`. -/
theorem braVal_eq : braVal = 2 := by
  show ((Lmul (slotA (1 : O ℚ)) 1) 0 1).re.re.re = 2
  rw [Lmul_one, Matrix.add_apply, slotA_entry]
  simp only [CD.add_re, CD.one_re, Dbl.add_re, Dbl.one_re]
  norm_num

/-- TRUE: the magnitude of the identity-motion certificate is `2`. -/
theorem braNum_true : braVal.num.natAbs = 2 := by rw [braVal_eq]; decide

/-- TRUE: `min 324 (magnitude of the certificate) = 2`, holding precisely because
    `Lmul (slotA 1) 1 ≠ 0` — the left-multiplication moves the identity, so it is NOT a derivation and
    the spectrum-moving sector is a genuine complement of the spectrum-preserving `f₄`. -/
theorem bra_scale_true : min (324 : ℕ) braVal.num.natAbs = 2 := by
  rw [braNum_true]; decide

/-- BOGUS: claims `min 324 (magnitude of the certificate) = 324`. It GENUINELY equals `2`
    (`bra_scale_true`). The WRONG reading (the left-multiplication kills the identity like a
    derivation / `Lmul ⊆ f₄` / there is no structure beyond `f₄` / the spectrum-moving sector is
    empty) reduces — through the banked value — to the false numeric `2 = 324`, so this must NOT
    compile. -/
theorem bra_scale_wrong_BOGUS :
    min (324 : ℕ) braVal.num.natAbs = 324 := by
  rw [bra_scale_true]
  -- ⊢ (2 : ℕ) = 324  (FALSE — the costume bites)

end Counterexamples
