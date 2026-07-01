import Phys.Cascade.Sedenion
import Phys.Algebra.Alternative
import Phys.Algebra.TowerGatherCoherence
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.OctonionCommutatorJacobiator

namespace Phys.Algebra.N220Probe

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

/-! PROBE 1: the Teichmüller cocycle identity for the associator (= gluing obstruction),
    over the octonion shape. If this closes cheaply by `abel` treating products as atoms,
    the gluing-obstruction 3-cochain is a genuine Hochschild 3-cocycle. -/

-- generic (any ring shape) first, to confirm it's a formal identity
theorem teich_generic {B : Type*} [CommRing B] [StarRing B]
    (a b c x : CD (CD B)) :
    a * assoc b c x - assoc (a * b) c x + assoc a (b * c) x
      - assoc a b (c * x) + assoc a b c * x = 0 := by
  simp only [assoc, mul_sub, sub_mul]
  abel

-- now stated ON O ℚ (the banked object)
theorem teich_O (a b c x : O ℚ) :
    a * assoc b c x - assoc (a * b) c x + assoc a (b * c) x
      - assoc a b (c * x) + assoc a b c * x = 0 := by
  simp only [assoc, mul_sub, sub_mul]
  abel

/-! PROBE 2: the multiplication coboundary δμ = −2·assoc (over O ℚ). -/
theorem mult_coboundary_O (a b c : O ℚ) :
    a * (b * c) - (a * b) * c + a * (b * c) - (a * b) * c = -(2 * assoc a b c) := by
  simp only [assoc]
  ring

/-! PROBE 3: the Jacobiator connection — jacobiator = 6 • gluingDefect (on O ℚ). -/
theorem jac_eq_six_gluingDefect (x y z : O ℚ) :
    jacobiator x y z =
      gluingDefect x y z + gluingDefect x y z + gluingDefect x y z
      + gluingDefect x y z + gluingDefect x y z + gluingDefect x y z := by
  rw [jacobiator_eq_six_assoc]
  -- gluingDefect x y z = assoc x y z on O ℚ (definitional)
  rfl

end Phys.Algebra.N220Probe
