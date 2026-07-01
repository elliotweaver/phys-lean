import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.DerivationRep7

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/- MEASURE 1: the skew-adjoint identity for the cross-product operator.
   gForm (octCross a y) z + gForm y (octCross a z) = 0  for a,y,z ∈ ImO.
   Route: gForm (octCross a y) z = gForm z (octCross a y) = assoc3 z a y (def).
          gForm y (octCross a z) = assoc3 y a z (def, via gForm_symm).
   Need assoc3 z a y = - assoc3 y a z : swap slot1<->slot3 (odd perm of {z,a,y}->{y,a,z}).
   {z,a,y} -> {y,a,z} is the transposition (1 3), odd. Build from banked antisym generators. -/

-- first, the swap13: assoc3 x y z = - assoc3 z y x
theorem assoc3_swap_xz {x y z : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) :
    assoc3 x y z = - assoc3 z y x := by
  -- (x y z) -> (y x z) [swap_xy] -> (y z x)? use cyclic. Compose:
  -- assoc3 x y z = - assoc3 y x z (swap_xy)
  -- assoc3 y x z = assoc3 x z y (cyclic on (y x z) -> (x z y))
  -- assoc3 x z y = - assoc3 z x y (swap_xy)
  -- assoc3 z x y = assoc3 x y z? no. Let's just chain to reach - assoc3 z y x.
  -- Target: assoc3 z y x. swap_xy on (z y x): assoc3 z y x = - assoc3 y z x.
  -- cyclic: assoc3 y z x = assoc3 z x y = assoc3 x y z. So assoc3 z y x = - assoc3 x y z.
  have h1 : assoc3 z y x = - assoc3 y z x := assoc3_swap_xy hz hy hx
  have h2 : assoc3 y z x = assoc3 z x y := assoc3_cyclic hy hz hx
  have h3 : assoc3 z x y = assoc3 x y z := assoc3_cyclic hz hx hy
  rw [h1, h2, h3, neg_neg]

theorem crossOp_skew {a y z : O ℚ} (ha : a ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) :
    gForm (octCross a y) z + gForm y (octCross a z) = 0 := by
  -- gForm (octCross a y) z = gForm z (octCross a y) = assoc3 z a y
  have e1 : gForm (octCross a y) z = assoc3 z a y := by
    unfold assoc3; rw [gForm_symm]
  have e2 : gForm y (octCross a z) = assoc3 y a z := rfl
  rw [e1, e2]
  -- need assoc3 z a y = - assoc3 y a z : swap slot1<->slot3
  have : assoc3 z a y = - assoc3 y a z := assoc3_swap_xz hz ha hy
  rw [this]; ring

/- MEASURE 2: the g₂-intertwiner identity, restricted-to-ImO form, at the End(O ℚ) level.
   D (octCross a y) = octCross (D a) y + octCross a (D y). Already banked as
   derivationLieQ_octCross_leibniz. Just confirm we can phrase it for imRep purposes. -/
theorem crossOp_intertwiner_raw (D : derivationLieQ) (a y : O ℚ) :
    (D : Module.End ℚ (O ℚ)) (octCross a y)
      = octCross ((D : Module.End ℚ (O ℚ)) a) y + octCross a ((D : Module.End ℚ (O ℚ)) y) :=
  derivationLieQ_octCross_leibniz D a y

end Phys.Algebra
