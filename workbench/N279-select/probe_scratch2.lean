import Phys.Algebra.TowerWorldMapCliffordModule
import Phys.Algebra.TowerGatherIsospinMultiplet
import Phys.Algebra.TowerGatherJointChargeIsospinWeights
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationColourIsospinCommutator
import Phys.Cascade.ForcedStop

open scoped Classical
open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N279Probe2

-- e2O = iotaO hJ, e3O = iotaO hK ? measure
example : e2O = iotaO hJ := by
  show e2O = (⟨hJ, 0⟩ : O ℚ)
  simp [e2O, hJ, iotaO, CD.e2]
example : e3O = iotaO hK := by
  simp [e3O, hK, hI, hJ, iotaO]

-- associator vanishes on H-image: assoc (iotaO a) (iotaO b) (iotaO c) = 0 since H associative
example (a b c : H ℚ) : assoc (iotaO a) (iotaO b) (iotaO c) = 0 := by
  show (iotaO a * iotaO b) * iotaO c - iotaO a * (iotaO b * iotaO c) = 0
  rw [sub_eq_zero]
  show (CD.iota a * CD.iota b) * CD.iota c = CD.iota a * (CD.iota b * CD.iota c)
  rw [CD.iota_assoc_iff]
  ring

end N279Probe2
end Phys.Algebra
