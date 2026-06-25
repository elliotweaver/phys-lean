/-
  Counterexamples.SpacetimeSignatureWrongSpaceSignCostume — N43 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N43 Lorentzian SIGNATURE `(1, 9)` of the Born determinant form
  on the self-adjoint `2 × 2` matrices over the terminal algebra. N43 banks the SPACE block as
  NEGATIVE: `Qform_space : Qform 0 x v = −(x² + gForm v v)`, with the Born self-overlap entering
  with a MINUS sign. The SIGN is LOAD-BEARING: it is exactly what makes the signature `(1, 9)`
  (one positive time direction, nine negative space directions). If the space block were instead
  POSITIVE (`Qform 0 x v = +(x² + gForm v v)`), every space direction would carry a positive
  square alongside the time square — the form would be positive-definite Euclidean `(10, 0)`, NOT
  Lorentzian, with no distinguished time and no light cone. The minus is the whole physics.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the space block is POSITIVE,
  `Qform 0 x v = x² + gForm v v` (the Euclidean / wrong-signature misreading), rather than the
  derived `−(x² + gForm v v)`. This is FALSE: `Qform_space` proves `Qform 0 x v = −(x² + gForm v v)`,
  and `−(x² + gForm v v) ≠ x² + gForm v v` in general (they agree only at `x = 0, v = 0`). The
  costume tries to supply the banked `Qform_space` (`= −(…)`) where a proof of `= +(…)` is demanded;
  the sign mismatch (`−(x² + gForm v v)` vs `x² + gForm v v`) makes it FAIL to compile — the guard
  against a Lorentzian signature misread as a Euclidean one (which would destroy the `(1, 9)` split).

  This costume DIRECTLY exercises the NEW N43 content: it uses `Qform_space` (the banked space-block
  reduction). Deleting `Phys/Algebra/SpacetimeSignature.lean` removes the `Qform_space` the costume
  references, so it would fail with a DIFFERENT (unknown-identifier) error and the PASS_SIGNATURE
  below would not match.
-/
import Phys.Algebra.SpacetimeSignature

namespace Counterexamples

open Phys.Cascade Phys.Algebra

/-- WRONG: claiming the space block is POSITIVE (`x² + gForm v v`, a Euclidean signature with no
    distinguished time) rather than the derived NEGATIVE `−(x² + gForm v v)` (the Lorentzian `(1,9)`).
    Supplying the banked `Qform_space` (`= −(x² + gForm v v)`) forces a sign type mismatch. Must FAIL
    to compile. -/
theorem Qform_space_pos_BOGUS (x : ℚ) (v : O ℚ) :
    Qform 0 x v = x^2 + gForm v v := Qform_space x v

end Counterexamples
