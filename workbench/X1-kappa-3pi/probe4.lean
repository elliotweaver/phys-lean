import Phys.Foundation.ContinuumSphereFlux
namespace Phys.Foundation.ContinuumQ
noncomputable section
-- variant A: field_simp closes it
example : (1:Cut) / (3 * cutPi) ≠ 1 / cutPi := by
  have hpi := cutPi_pos
  have hne : cutPi ≠ 0 := ne_of_gt hpi
  intro h
  field_simp [hne] at h
end
end Phys.Foundation.ContinuumQ
