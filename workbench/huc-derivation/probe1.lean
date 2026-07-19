import Phys.Algebra.EdgeLogArgAudit

/-!
  PROBE 1 — derive `huc : (Mu/Mlam)^2 = 1/confBundle` ab initio.
-/

open Phys.Algebra
open Phys.Algebra.QuarkHadronTower
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (a) 1/confBundle is the reciprocal confinement bundle = v/Λ, unconditional.
example : (1 : Cut) / confBundle = ewClosureRatio / confinementScaleRatio := by
  rw [confBundle_eq_confToEw, one_div_div]

-- 1/confBundle = cutExp(8π/3)
example : (1 : Cut) / confBundle = cutExp (8 * cutPi / 3) := by
  rw [confBundle_eq, one_div]
  exact inv_eq_of_mul_eq_one_left (by rw [cutExp_add, add_neg_cancel]; exact cutExp_zero)

-- (b) THE CORE: from the two Born-square anchor identifications, (Mu/Mlam)^2 = 1/confBundle,
-- with the shared anchor M cancelling.
example (M Mu Mlam : Cut) (hM : M ≠ 0)
    (hu : Mu ^ 2 = M * ewClosureRatio)
    (hl : Mlam ^ 2 = M * confinementScaleRatio) :
    (Mu / Mlam) ^ 2 = 1 / confBundle := by
  rw [div_pow, hu, hl, mul_div_mul_left _ _ hM, confBundle_eq_confToEw, one_div_div]

end
