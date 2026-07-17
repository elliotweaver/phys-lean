import Phys.Algebra.SpacetimeBlackHoleEntropy
import Mathlib.Tactic
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

-- gaussSphereSolidAngle is banked (N328). The flux-conservation field law:
-- E(r) = totalFlux / A(r), A(r) = gaussSphereSolidAngle·r², totalFlux = gaussSphereSolidAngle·M
-- ⇒ E(r) = M·r⁻² : the solid angle CANCELS (1/r² forced by sphere geometry, indep of the 4π value).
theorem invSquare_from_flux (M r : Cut) (hr : r ≠ 0) :
    (gaussSphereSolidAngle * M) / (gaussSphereSolidAngle * r ^ 2) = M * (r ^ 2)⁻¹ := by
  have hsa : gaussSphereSolidAngle ≠ 0 := by
    have : (0:Cut) < gaussSphereSolidAngle := by
      unfold gaussSphereSolidAngle
      sorry
    exact ne_of_gt this
  have hr2 : r ^ 2 ≠ 0 := pow_ne_zero 2 hr
  field_simp
  ring
