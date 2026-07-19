import Phys.Algebra.EdgeLogArgAudit

open Phys.Algebra
open Phys.Algebra.QuarkHadronTower
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- witness: M=1, Mu=cutExp(-14π/3), Mλ=cutExp(-6π): the anchor pinnings hold + huc holds.
example : (cutExp (-(14 * cutPi / 3))) ^ 2 = (1 : Cut) * ewClosureRatio := by
  rw [ewClosureRatio_eq, one_mul, sq, cutExp_add]
  congr 1; ring

example : (cutExp (-(6 * cutPi))) ^ 2 = (1 : Cut) * confinementScaleRatio := by
  rw [confinementScaleRatio_eq, one_mul, sq, cutExp_add]
  congr 1; ring

-- both nonzero
example : cutExp (-(14 * cutPi / 3)) ≠ 0 := ne_of_gt (cutExp_pos _)
example : (1 : Cut) ≠ 0 := one_ne_zero

end
