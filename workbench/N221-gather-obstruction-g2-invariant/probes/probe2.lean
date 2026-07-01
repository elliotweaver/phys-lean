import Phys.Algebra.OctonionCoassociative4Form
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.DerivationCompact

namespace Phys.Algebra.ProbeN221b

open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD

-- COMPANION: the associative calibration 3-form φ = ⟨x, y×z⟩ (N209 assoc3) is g₂-INVARIANT.
theorem assoc3_derivQ_invariant (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x y z : O ℚ) :
    assoc3 (D x) y z + assoc3 x (D y) z + assoc3 x y (D z) = 0 := by
  unfold assoc3
  have hL : octCross (D y) z + octCross y (D z) = D (octCross y z) :=
    (octCross_deriv_leibniz D hD y z).symm
  rw [show gForm (D x) (octCross y z) + gForm x (octCross (D y) z) + gForm x (octCross y (D z))
       = gForm (D x) (octCross y z) + gForm x (octCross (D y) z + octCross y (D z)) from by
        rw [gForm_add_right]; ring]
  rw [hL]
  exact gFormQ_skew D hD x (octCross y z)

end Phys.Algebra.ProbeN221b
