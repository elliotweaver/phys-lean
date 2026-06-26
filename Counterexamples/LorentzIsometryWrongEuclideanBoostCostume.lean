/-
  Counterexamples.LorentzIsometryWrongEuclideanBoostCostume — N45 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N45 isometry structure of the Born determinant form. N45 banks the
  HYPERBOLIC boost `boost a b : (t,x,v) ↦ (a t + b x, b t + a x, v)` as a `Qv`-isometry precisely
  when `(a, b)` is a rational point on the unit HYPERBOLA `a² − b² = 1` (`boost_isom`). The
  INDEFINITE SIGN of the banked form `Qv = t² − x² − gForm v v` is LOAD-BEARING: it is what makes
  the boost a non-compact, time-mixing LORENTZ transformation rather than a circular rotation. A
  CIRCULAR rotation — the same shear shape but with the EUCLIDEAN constraint `a² + b² = 1` — does
  NOT preserve `t² − x²`; it preserves `t² + x²` (the wrong, definite signature). The hyperbola,
  not the circle, is the whole physics.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the boost is a `Qv`-isometry
  under the EUCLIDEAN constraint `a² + b² = 1` (the circular-rotation misreading), rather than the
  derived HYPERBOLIC `a² − b² = 1`. This is FALSE: a shear with `a² + b² = 1` and `b ≠ 0` does NOT
  preserve `t² − x²` (take `a = 0, b = 1`: it swaps `t ↔ x` up to sign, sending `t² − x²` to
  `x² − t² = −(t² − x²)`, the OPPOSITE form). Trying to discharge `IsQvIsom (boost a b)` from the
  Euclidean hypothesis `a² + b² = 1` by feeding it to `boost_isom` (which demands `a² − b² = 1`)
  forces a hypothesis type mismatch (`a² + b² = 1` vs `a² − b² = 1`); the term FAILS to compile —
  the guard against a Lorentzian boost misread as a Euclidean rotation (which would collapse the
  `(1,9)` signature to a definite one).

  This costume DIRECTLY exercises the NEW N45 content: it uses `boost_isom` (the banked hyperbolic
  isometry) and `boost` (the banked shear). Deleting `Phys/Algebra/LorentzIsometry.lean` removes the
  `boost_isom`/`boost` the costume references, so it would fail with a DIFFERENT (unknown-identifier)
  error and the PASS_SIGNATURE below would not match.
-/
import Phys.Algebra.LorentzIsometry

namespace Counterexamples

open Phys.Cascade Phys.Algebra

/-- WRONG: claiming the shear `boost a b` is a `Qv`-isometry under the EUCLIDEAN constraint
    `a² + b² = 1` (a circular rotation, which preserves `t² + x²`, NOT the Lorentzian `t² − x²`)
    rather than the derived HYPERBOLIC constraint `a² − b² = 1`. Feeding the Euclidean hypothesis
    to the banked `boost_isom` (which requires `a² − b² = 1`) forces a hypothesis type mismatch.
    Must FAIL to compile. -/
theorem boost_euclidean_isom_BOGUS {a b : ℚ} (h : a^2 + b^2 = 1) :
    IsQvIsom (boost a b) := boost_isom h

end Counterexamples
