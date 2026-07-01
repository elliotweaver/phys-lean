import Phys.Algebra.OctonionCoassociative4Form
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.DerivationCompact

namespace Phys.Algebra.ProbeN221

open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD

-- MEASURE 1: the associator (= gluing-obstruction cocycle) is Der(O)-EQUIVARIANT.
-- Pure Leibniz applied twice to (x·y)·z - x·(y·z). NO skew-adjointness needed.
theorem assoc_derivQ_equivariant (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x y z : O ℚ) :
    D (assoc x y z) = assoc (D x) y z + assoc x (D y) z + assoc x y (D z) := by
  unfold assoc
  rw [map_sub, hD (x * y) z, hD x y, hD x (y * z), hD y z]
  simp only [add_mul, mul_add, sub_mul, mul_sub]
  abel

-- MEASURE 2: the same on the N219 gluingDefect map (definitional tie on O ℚ).
theorem gluingDefect_derivQ_equivariant_O (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (a b x : O ℚ) :
    D (gluingDefect a b x)
      = gluingDefect (D a) b x + gluingDefect a (D b) x + gluingDefect a b (D x) := by
  have h : ∀ p q r : O ℚ, gluingDefect p q r = assoc p q r := fun p q r => rfl
  rw [h, h, h, h]
  exact assoc_derivQ_equivariant D hD a b x

-- MEASURE 3: THE HEADLINE — the coassociative calibration 4-form ψ = ⟨[x,y,z],w⟩ is
-- Der(O)=g₂-INVARIANT (total infinitesimal variation vanishes). Combines the equivariance
-- (Leibniz twice) with gFormQ_skew (the Born metric is Der-skew).
theorem coassoc4_derivQ_invariant (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x y z w : O ℚ) :
    coassoc4 (D x) y z w + coassoc4 x (D y) z w + coassoc4 x y (D z) w
      + coassoc4 x y z (D w) = 0 := by
  unfold coassoc4
  -- first three terms: gForm applied to the three equivariance pieces = gForm (D assoc) w
  rw [← gForm_add_left, ← gForm_add_left]
  rw [← assoc_derivQ_equivariant D hD x y z]
  -- now: gForm (D (assoc x y z)) w + gForm (assoc x y z) (D w) = 0 by skew-adjointness
  exact gFormQ_skew D hD (assoc x y z) w

-- MEASURE 4 (W8 non-vacuity): the equivariance is a genuine nonzero relation at D0E.
-- (Just check it typechecks as an instance; nonzero-ness measured separately.)
theorem assoc_equivariant_at_D0E (x y z : O ℚ) :
    D0E (assoc x y z) = assoc (D0E x) y z + assoc x (D0E y) z + assoc x y (D0E z) :=
  assoc_derivQ_equivariant D0E D0E_isDerivQ x y z

end Phys.Algebra.ProbeN221
