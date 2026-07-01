import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.DerivationAutCompact
import Phys.Algebra.DerivationCompact

/-!
MEASURE (N235 toolkit brick b): g₂-INVARIANCE of the associative 3-form φ = `assoc3`.
For any derivation D (member of g₂ = derivationLieQ) and any x,y,z:
  φ(Dx,y,z) + φ(x,Dy,z) + φ(x,y,Dz) = 0.
Proof: combine the last two via octCross Leibniz (N207) into gForm x (D (octCross y z)),
then the whole is gForm (Dx)(octCross y z) + gForm x (D (octCross y z)) = 0 by gFormQ_skew (N24).
-/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

theorem assoc3_g2_invariant_PROBE (D : derivationLieQ) (x y z : O ℚ) :
    assoc3 ((D : Module.End ℚ (O ℚ)) x) y z
      + assoc3 x ((D : Module.End ℚ (O ℚ)) y) z
      + assoc3 x y ((D : Module.End ℚ (O ℚ)) z) = 0 := by
  unfold assoc3
  -- Leibniz for the cross product (N207): D(y×z) = (Dy)×z + y×(Dz)
  have hleib : octCross ((D : Module.End ℚ (O ℚ)) y) z + octCross y ((D : Module.End ℚ (O ℚ)) z)
      = (D : Module.End ℚ (O ℚ)) (octCross y z) :=
    (derivationLieQ_octCross_leibniz D y z).symm
  -- combine the last two terms via right-additivity of gForm
  have h2 : gForm x (octCross ((D : Module.End ℚ (O ℚ)) y) z)
              + gForm x (octCross y ((D : Module.End ℚ (O ℚ)) z))
            = gForm x ((D : Module.End ℚ (O ℚ)) (octCross y z)) := by
    rw [← gForm_add_right, hleib]
  rw [add_assoc, h2]
  -- now: gForm (Dx) (y×z) + gForm x (D (y×z)) = 0  — skew-adjointness of D for gForm (N24)
  exact gFormQ_skew (D : Module.End ℚ (O ℚ)) D.2 x (octCross y z)

end

end Phys.Algebra
