import Phys.Algebra.OctonionCoassociative4Form
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.DerivationAutCompact
import Phys.Algebra.DerivationCompact
import Phys.Algebra.Alternative

/-!
MEASURE (N235 toolkit brick): g₂-INVARIANCE of the coassociative 4-form ψ = `coassoc4`
and the metric δ = `gForm`, plus the associator Leibniz identity.
-/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- δ (the metric) is g₂-invariant: this is exactly gFormQ_skew restated as a 2-slot invariance.
theorem gForm_g2_invariant_PROBE (D : derivationLieQ) (x y : O ℚ) :
    gForm ((D : Module.End ℚ (O ℚ)) x) y + gForm x ((D : Module.End ℚ (O ℚ)) y) = 0 :=
  gFormQ_skew (D : Module.End ℚ (O ℚ)) D.2 x y

-- The associator [x,y,z] = (x*y)*z - x*(y*z) obeys the Leibniz rule under any derivation D
-- (it is built from products only).
theorem assoc_deriv_leibniz_PROBE (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x y z : O ℚ) :
    D (assoc x y z) = assoc (D x) y z + assoc x (D y) z + assoc x y (D z) := by
  unfold assoc
  simp only [map_sub, hD, LinearMap.map_add]
  rw [hD, hD]
  ring

theorem assoc_deriv_leibniz_lieQ_PROBE (D : derivationLieQ) (x y z : O ℚ) :
    (D : Module.End ℚ (O ℚ)) (assoc x y z)
      = assoc ((D : Module.End ℚ (O ℚ)) x) y z + assoc x ((D : Module.End ℚ (O ℚ)) y) z
        + assoc x y ((D : Module.End ℚ (O ℚ)) z) :=
  assoc_deriv_leibniz_PROBE (D : Module.End ℚ (O ℚ)) D.2 x y z

-- ψ (the coassociative 4-form) is g₂-invariant.
theorem coassoc4_g2_invariant_PROBE (D : derivationLieQ) (x y z w : O ℚ) :
    coassoc4 ((D : Module.End ℚ (O ℚ)) x) y z w
      + coassoc4 x ((D : Module.End ℚ (O ℚ)) y) z w
      + coassoc4 x y ((D : Module.End ℚ (O ℚ)) z) w
      + coassoc4 x y z ((D : Module.End ℚ (O ℚ)) w) = 0 := by
  unfold coassoc4
  have hleib := assoc_deriv_leibniz_lieQ_PROBE D x y z
  -- combine first three coassoc4 terms into gForm (D (assoc x y z)) w
  have h3 : gForm (assoc ((D : Module.End ℚ (O ℚ)) x) y z) w
              + gForm (assoc x ((D : Module.End ℚ (O ℚ)) y) z) w
              + gForm (assoc x y ((D : Module.End ℚ (O ℚ)) z) ) w
            = gForm ((D : Module.End ℚ (O ℚ)) (assoc x y z)) w := by
    rw [← gForm_add_left, ← gForm_add_left, ← hleib]
  rw [add_assoc, add_assoc, ← add_assoc (gForm (assoc x ((D:Module.End ℚ (O ℚ)) y) z) w),
      show gForm (assoc ((D:Module.End ℚ (O ℚ)) x) y z) w
             + (gForm (assoc x ((D:Module.End ℚ (O ℚ)) y) z) w
                + gForm (assoc x y ((D:Module.End ℚ (O ℚ)) z)) w)
           = gForm (assoc ((D:Module.End ℚ (O ℚ)) x) y z) w
             + gForm (assoc x ((D:Module.End ℚ (O ℚ)) y) z) w
             + gForm (assoc x y ((D:Module.End ℚ (O ℚ)) z)) w by ring]
  rw [h3]
  -- now gForm (D (assoc x y z)) w + gForm (assoc x y z) (D w) = 0 by skew-adjointness
  exact gFormQ_skew (D : Module.End ℚ (O ℚ)) D.2 (assoc x y z) w

end

end Phys.Algebra
