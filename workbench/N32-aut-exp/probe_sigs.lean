/-
  N32 W9 MEASUREMENT PROBE 3 — confirm the EXACT banked signatures the continuum-free
  forward increment (the COMPACTNESS shadow of AutO from the definite Born form) will use.
  All #check — fail fast, bounded.
-/
import Phys.Algebra.DerivationAutGroup

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- The form-preservation seed (group level)
#check @aut_gForm
#check @AutO
#check @AutO_gForm
-- The orthonormal coordinate frame + positivity
#check @coordO
#check @bO
#check @gForm
#check @gForm_self_sum_sq
#check @coord_eq_gForm
#check @gForm_self_nonneg
-- IsAlgAut closure (for building OrthO ≥ AutO)
#check @IsAlgAut
#check @isAlgAut_one
#check @isAlgAut_mul
#check @isAlgAut_inv

-- Subgroup machinery on the derived linear automorphism group
#check (inferInstance : Group (O ℚ ≃ₗ[ℚ] O ℚ))

-- the orthonormality value: gForm (bO i) (bO j) should be δ; check coord of basis
#check @Module.Basis.ofEquivFun

end
end Phys.Algebra
