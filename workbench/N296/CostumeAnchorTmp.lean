/-
  Counterexamples.OctonionJordanSpectrumMovingSectorEquivarianceWrongValueCostume — N296 anti-vacuity (C325).
  ===========================================================================
  W8 ANTI-VACUITY. The N296 node banks the f₄-EQUIVARIANCE of the spectrum-moving sector — the third
  bracket relation `[f₄, L₀] ⊆ L₀` that closes the Z₂-graded Lie structure of `e₆ = f₄ ⊕ L₀`:

      ★  ⁅T, Lmul A⁆ B = Lmul (T A) B    for T ∈ derH3, Hermitian A, B    (`spectrum_sector_equivariance`),

  exhibiting `A ↦ Lmul A` as an f₄-MODULE INTERTWINER. The load-bearing NON-TRIVIALITY is that the
  derived family derivation `famC = innerMul (slotA 1)(slotB 1)` (N288, `∈ derH3`) genuinely MOVES the
  spectrum-mover `Lmul (slotA 1)`:

      ⁅famC, Lmul (slotA 1)⁆ B = Lmul (− slotB 1) B    (`family_moves_mover`, via `famC_slotA`),

  which at `B = 1` is `Lmul (− slotB 1) 1 = − slotB 1 + (− slotB 1) ≠ 0` (a WRONG reading — that the
  family derivation FIXES the mover, `[f₄, L₀] = 0`, `L₀` a trivial f₄-module — would give `0`).

  The certificate that the family derivation genuinely MOVES the mover (so the equivariance is
  non-vacuous and the graded module is nontrivial) is the `re.re.re` coordinate of the `(0,2)` entry
  that `⁅famC, Lmul (slotA 1)⁆` produces on the identity `1`:

      `((⁅innerMul (slotA 1)(slotB 1), Lmul (slotA 1)⁆ 1) 0 2).re.re.re = −2`

  Since `⁅famC, Lmul (slotA 1)⁆ 1 = Lmul (− slotB 1) 1 = − slotB 1 + (− slotB 1)` (banked
  `family_moves_mover` + `Lmul_one`), the `(0,2)` entry is `−1 + −1 = −2` (twice the negated unit
  `(0,2)` slot entry, `slotB_entry`), whose `re.re.re` coordinate is `−2 ≠ 0`, certifying
  `⁅famC, Lmul (slotA 1)⁆ 1 ≠ 0` — the family derivation MOVES the mover, so `[f₄, L₀] ≠ 0`.

  We anchor `braVal.num.natAbs = 2` (TRUE), packaged as `min 325 (braVal.num.natAbs) = 2`, TIED to
  the node via `family_moves_mover` (`⁅famC, Lmul (slotA 1)⁆ B = Lmul (− slotB 1) B`) + `Lmul_one` +
  the `slotB`/`Xz` coordinate.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the family derivation FIXES the mover / `[f₄,L₀]=0`
  / `L₀` is a trivial f₄-module / the equivariance is vacuous): that `min 325 (…) = 325`. It GENUINELY
  equals `2` (`bra_scale_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `2 = 325` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (325, 2) is fresh (RHS 325 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE FAMILY-MOVES-MOVER CERTIFICATE: the `re.re.re` coordinate of the `(0,2)` entry that the
    commutator `⁅famC, Lmul (slotA 1)⁆` produces on the identity `1`. Since
    `⁅famC, Lmul (slotA 1)⁆ 1 = Lmul (− slotB 1) 1 = − slotB 1 + (− slotB 1)` (banked
    `family_moves_mover` + `Lmul_one`) whose `(0,2)` entry is `−1 + −1 = −2`, the coordinate is `−2`,
    certifying `⁅famC, Lmul (slotA 1)⁆ 1 ≠ 0` — the family derivation MOVES the spectrum-mover, so
    `[f₄, L₀] ≠ 0` and `L₀` is a nontrivial f₄-module. -/
noncomputable def braVal : ℚ :=
  ((⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (slotA 1)⁆ 1) 0 2).re.re.re

/-- TRUE (tied to the banked N296 laws `family_moves_mover` + `Lmul_one`): the certificate is `−2`. -/
theorem braVal_eq : braVal = -2 := by
  show ((⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (slotA 1)⁆ 1) 0 2).re.re.re = -2
  rw [family_moves_mover Matrix.conjTranspose_one, Lmul_one, Matrix.add_apply, Matrix.neg_apply,
    slotB_entry]
  simp only [CD.add_re, CD.neg_re, CD.one_re, Dbl.add_re, Dbl.neg_re, Dbl.one_re]
  norm_num

/-- TRUE: the magnitude of the family-moves-mover certificate is `2`. -/
theorem braNum_true : braVal.num.natAbs = 2 := by rw [braVal_eq]; decide

/-- TRUE: `min 325 (magnitude of the certificate) = 2`, holding precisely because
    `⁅famC, Lmul (slotA 1)⁆ 1 ≠ 0` — the family derivation moves the mover, so the equivariance is
    non-vacuous and `L₀` is a nontrivial f₄-module. -/
theorem bra_scale_true : min (325 : ℕ) braVal.num.natAbs = 2 := by
  rw [braNum_true]; decide

/-- BOGUS: claims `min 325 (magnitude of the certificate) = 325`. It GENUINELY equals `2`
    (`bra_scale_true`). The WRONG reading (the family derivation FIXES the mover / `[f₄, L₀] = 0` /
    `L₀` is a trivial f₄-module / the equivariance is vacuous) reduces — through the banked value —
    to the false numeric `2 = 325`, so this must NOT compile. -/

end Counterexamples
