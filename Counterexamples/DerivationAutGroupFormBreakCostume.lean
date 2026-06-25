/-
  Counterexamples.DerivationAutGroupFormBreakCostume — N31 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N31 automorphism-group DEFINE+SEED. N31 banks the algebra-
  automorphism group `AutO` of the terminal Cayley–Dickson algebra `O ℚ` (as a `Subgroup` of
  the ℚ-linear automorphism group `(O ℚ ≃ₗ[ℚ] O ℚ)` carved by the multiplicative-and-unital
  predicate `IsAlgAut`) and the FORWARD seed facts. The headline forward fact (`aut_gForm`) is
  that an automorphism PRESERVES the Born self-overlap form: `gForm (φ x) (φ y) = gForm x y` —
  the group-level analogue of the infinitesimal skew-adjointness `derivationLieQ_le_skewAdjoint`,
  the SAME Born positivity from the trunk integrated to genuine orthogonality.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that an automorphism BREAKS the
  Born form — concretely that it REVERSES the sign, `gForm (φ x) (φ y) = − gForm x y`. Applied
  to a GENUINE automorphism (the identity `1 ∈ AutO`, `isAlgAut_one`) at `x = y = 1`, the banked
  `aut_gForm` rewrites the LHS to `gForm 1 1 = 1`, and the diagonal `gForm 1 1 = 1` (the unit's
  self-overlap, the Born positivity made concrete) collapses the bogus claim to `1 = −1`, which
  cannot be discharged. If an automorphism did NOT preserve the form — if `aut_gForm` were false
  or vacuous — this costume would be provable; W8 demands it bite. (A form-BREAKING map is
  exactly what is NOT an automorphism, the whole content of `aut_gForm`.)

  The manifest's PASS_SIGNATURE matches the elaboration error below (`⊢ 1 = -1`).
-/
import Phys.Algebra.DerivationAutGroup

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- WRONG: claiming a (genuine) automorphism REVERSES the sign of the Born self-overlap form,
    `gForm (φ x) (φ y) = − gForm x y`. The banked `aut_gForm` proves an automorphism PRESERVES
    the form, so at the identity automorphism (`isAlgAut_one`) and `x = y = 1` the claim reduces
    to `gForm 1 1 = − gForm 1 1`, i.e. `1 = −1` (since `gForm 1 1 = 1`). Must FAIL to compile. -/
theorem aut_gForm_sign_BOGUS :
    gForm ((1 : O ℚ ≃ₗ[ℚ] O ℚ) (1 : O ℚ)) ((1 : O ℚ ≃ₗ[ℚ] O ℚ) (1 : O ℚ))
      = - gForm (1 : O ℚ) (1 : O ℚ) := by
  rw [aut_gForm isAlgAut_one (1 : O ℚ) (1 : O ℚ)]
  rw [show gForm (1 : O ℚ) (1 : O ℚ) = 1 from by
    show reQ ((1 : O ℚ) * star (1 : O ℚ)) = 1; simp [reQ]]

end

end Counterexamples
