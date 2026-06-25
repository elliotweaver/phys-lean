import Phys.Algebra.DerivationAutGroup
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- compute gForm 1 1
example : gForm (1 : O ℚ) (1 : O ℚ) = 1 := by
  show reQ ((1:O ℚ) * star (1:O ℚ)) = 1
  simp [reQ]

-- candidate costume A: gForm sign reversal at the identity member, x=y=1
theorem aut_gForm_sign_BOGUS :
    gForm ((1 : O ℚ ≃ₗ[ℚ] O ℚ) (1:O ℚ)) ((1 : O ℚ ≃ₗ[ℚ] O ℚ) (1:O ℚ))
      = - gForm (1:O ℚ) (1:O ℚ) := by
  rw [aut_gForm isAlgAut_one (1:O ℚ) (1:O ℚ)]
  rw [show gForm (1 : O ℚ) (1 : O ℚ) = 1 from by show reQ ((1:O ℚ) * star (1:O ℚ)) = 1; simp [reQ]]

end
