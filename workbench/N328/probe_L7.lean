import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset Topology
open scoped Topology BigOperators

noncomputable section

-- The meridian flux as the antiderivative INCREMENT of the primitive P(x) = -cutCos x
-- P has derivative cutSin (since d/dx cutCos = -cutSin, so d/dx(-cutCos)=cutSin).
-- The increment over the half-turn [0, cutPi]:
--   P(cutPi) - P(0) = (-cutCos cutPi) - (-cutCos 0) = -(-1) - (-(1)) = 1 + 1 = 2.
-- This is the meridian flux ∫₀^cutPi cutSin (WITHOUT building a Lebesgue integral):
-- it is the increment of the banked primitive across the derived half-turn.

theorem meridian_flux_increment :
    (-cutCos cutPi) - (-cutCos (0:Cut)) = 2 := by
  rw [cutCos_cutPi, cutCos_zero]
  ring

-- The full solid angle = 2 * (azimuthal half-period contribution).
-- Actually: solid angle of 2-sphere = ∫₀^π sinθ dθ · ∫₀^{2π} dφ = (meridian flux 2) · (2·cutPi).
-- The azimuthal full turn is 2·cutPi (the period). So the assembled solid angle:
--   solidAngle := (meridian flux) * (full azimuthal turn) = 2 * (2 * cutPi) = 4 * cutPi.
-- Let me measure that this equals 4 * cutPi symbolically.
theorem solid_angle_assembly :
    ((-cutCos cutPi) - (-cutCos (0:Cut))) * (2 * cutPi) = 4 * cutPi := by
  rw [meridian_flux_increment]
  ring

end
end ContinuumQ
end Phys.Foundation
