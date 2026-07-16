import Phys.Foundation.ContinuumSphereFlux

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

theorem probe_integrand_id (x : Cut) :
    cutCos x * cutCos x * cutSin x = (cutSin x + cutSin (3 * x)) / 4 := by
  have h3 : (3 : Cut) * x = x + (x + x) := by ring
  rw [h3, cutSin_add, cutSin_add, cutCos_add]
  have hp := cutSin_sq_add_cutCos_sq x
  linear_combination (cutSin x / 4) * hp

theorem probe_cos_3pi : cutCos (3 * cutPi) = -1 := by
  have h : (3 : Cut) * cutPi = cutPi + (cutPi + cutPi) := by ring
  rw [h, cutCos_add_two_cutPi, cutCos_cutPi]

theorem probe_sin_3pi : cutSin (3 * cutPi) = 0 := by
  have h : (3 : Cut) * cutPi = cutPi + (cutPi + cutPi) := by ring
  rw [h, cutSin_add_two_cutPi, cutSin_cutPi]

end
end ContinuumQ
end Phys.Foundation
