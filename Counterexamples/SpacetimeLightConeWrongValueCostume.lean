/-
  Counterexamples.SpacetimeLightConeWrongValueCostume — N199 anti-vacuity (C231).
  ===========================================================================
  W8 ANTI-VACUITY. The N199 node banks a genuinely-NEW, genuinely-DIFFERENT face of the (1,9)
  Born determinant form Qv on the self-adjoint 2x2 matrices over the terminal algebra
  O Q = CD (H Q): the NULL STRUCTURE (the light cone) and the WITT INDEX. N43 exhibited one
  definite split, N198 proved the inertia indices of the DEFINITE subspaces -- but NEITHER ever
  exhibited a null vector or addressed the form's ISOTROPY. N199 proves the form is ISOTROPIC
  (the light cone exists, witnessed by the explicit rational null vector (1,1,0)) and the Witt
  index (the maximal totally-null dimension) is exactly 1.

  THE GENUINE VALUE. The light-cone vector lightVec = (1,1,0) is NULL: Qv lightVec = 1 - 1 - 0 = 0
  (lightVec_null below). The form REPRESENTS ZERO on a nonzero vector -- it is isotropic, a
  property the definite blocks of N43/N198 do NOT have (a definite form represents zero only at 0).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the light cone is empty / the form is
  anisotropic / no nontrivial null vector exists / the (1,9) form does not represent zero / the
  cone vector is not actually null): that this value equals (199 : Q). The banked value is exactly
  0, so the claim reduces to the false numeric 199 = 0 in Q. The kernel cannot close it; the
  costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "light cone / null / causal / isotropic / Witt / Lorentzian"
  and for the Born quadratic form Qv on the 10-dim Q-space STV = Q x Q x O Q the value at the
  nonzero vector (1,1,0) equals 0 -- so claiming 199 is genuinely FALSE (199 /= 0).

  DISTINCT from the banked battery (... C229 197 = -2, C230 198 = 1): the pair (199, 0) is fresh
  (LHS 199 distinct from every prior left-hand value, RHS 0 distinct from every prior right-hand
  value).
-/
import Phys.Algebra.SpacetimeLightCone

namespace Counterexamples

open Phys.Algebra Phys.Cascade

/-- TRUE: the light-cone vector `(1,1,0)` is NULL for the Born determinant form -- the form is
    ISOTROPIC (represents zero nontrivially). -/
theorem lightvec_value_true : Qv lightVec = 0 := lightVec_null

/-- BOGUS: claims the value at the null vector is `199`. It GENUINELY equals `0`
    (`lightvec_value_true`). The WRONG claim (the light cone is empty / the form is anisotropic /
    no null vector exists / the (1,9) form does not represent zero) reduces to the false numeric
    `199 = 0`, so this must NOT compile. -/
theorem lightvec_value_wrong_BOGUS : (199 : ℚ) = Qv lightVec := by
  rw [lightvec_value_true]

end Counterexamples
