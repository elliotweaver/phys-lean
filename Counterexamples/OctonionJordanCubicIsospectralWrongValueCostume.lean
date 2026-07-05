/-
  Counterexamples.OctonionJordanCubicIsospectralWrongValueCostume — N302 anti-vacuity (C331).
  ===========================================================================
  W8 ANTI-VACUITY. The N302 node banks that the derived symmetry `f₄ = derH3` is ISOSPECTRAL — it
  preserves all THREE (cap-forced) characteristic-polynomial coefficients of every Hermitian element
  to first order (`derH3_kills_jTr` linear, `derH3_kills_quadratic_spectral` quadratic,
  `derH3_kills_cubic_spectral` cubic/determinant). Like every annihilation node (N298/N299/N300), the
  load-bearing NON-TRIVIALITY is that the isospectral flow is a GENUINE NONZERO motion, not the
  trivial zero derivation: the family generator `famC = innerMul (slotA 1)(slotB 1) ∈ derH3` actually
  MOVES the Hermitian matter element `slotB 1` to the nonzero `slotA 1` (`famC_slotB`), YET all three
  spectral invariants of `slotB 1` are fixed. If the derivation acted trivially, the whole
  full-spectrum-isospectrality statement would be vacuous.

  The certificate is the magnitude of the moved coordinate. The family generator sends `slotB 1` to
  `slotA 1` (`famC_slotB`), whose `(0,1)` deep-real coordinate is `1` (`slotA_entry`):

      `certVal := ((famC (slotB 1)) 0 1).re.re.re   (= 1)`.

  We anchor `certVal.num.natAbs = 1` (TRUE), packaged as `min 331 (certVal.num.natAbs) = 1`, TIED to
  the node's non-vacuity via `famC_slotB` (the derivation genuinely moves the Hermitian element the
  isospectral theorems fix).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the derivation is the zero map / the isospectral
  flow moves nothing / the full-spectrum preservation is vacuous): that `min 331 (…) = 331`. It
  GENUINELY equals `1` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `1 = 331` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (331, 1) is fresh (RHS 331 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanCubicIsospectral
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE MOTION CERTIFICATE: the deep-real `(0,1)` coordinate of the family generator's genuine
    nonzero motion of the Hermitian matter element `slotB 1`. By `famC_slotB` this is
    `slotA 1`, whose `(0,1)` entry is `1`. -/
noncomputable def certVal : ℚ :=
  (((innerMul (slotA (1:O ℚ)) (slotB 1)) (slotB 1)) 0 1).re.re.re

/-- TRUE (tied to the banked N302 non-vacuity via `famC_slotB`): the derivation genuinely moves the
    Hermitian element `slotB 1` to `slotA 1`, whose `(0,1)` coordinate is `1`. -/
theorem certVal_eq : certVal = 1 := by
  unfold certVal
  rw [famC_slotB, slotA_entry]
  show ((1:O ℚ)).re.re.re = 1
  simp only [CD.one_re, Dbl.one_re]

/-- TRUE: the magnitude of the moved coordinate is `1`. -/
theorem certNum_true : certVal.num.natAbs = 1 := by rw [certVal_eq]; decide

/-- TRUE: `min 331 (magnitude of the certificate) = 1`, holding precisely because the isospectral
    derivation genuinely MOVES the Hermitian element — the full-spectrum preservation is
    non-vacuous. -/
theorem cert_val_true : min (331 : ℕ) certVal.num.natAbs = 1 := by
  rw [certNum_true]; decide

/-- BOGUS: claims `min 331 (magnitude of the certificate) = 331`. It GENUINELY equals `1`
    (`cert_val_true`). The WRONG reading (the derivation is trivial / the isospectral flow moves
    nothing / the full-spectrum preservation is vacuous) reduces — through the banked value — to the
    false numeric `1 = 331`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (331 : ℕ) certVal.num.natAbs = 331 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 331  (FALSE — the costume bites)

end Counterexamples
