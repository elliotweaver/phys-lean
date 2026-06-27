import Phys.Algebra.LorentzContinuumOpSqrtScalarUnique

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C124): A BOGUS SCALAR-TARGET POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS VALUE —
-- "THE POSITIVE OPERATOR SQUARE ROOT OF 49·id IS THE HOMOTHETY 8·id".
-- N93 banks `op_sqrt_scalar_unique`: a positive operator square root `R` of a scalar operator
-- `l·id` (with `0 ≤ l`) is EXACTLY `cutSqrt l · id` — the UNIQUE homothety whose square is `l`.
-- For `l = 49` the genuine root reads `cutSqrt 49 · id`, and `cutSqrt 49 = 7` (the nonnegative
-- number with `7·7 = 49`, `cutSqrt_unique`), so the genuine root is `7·id`. The BOGUS claim that
-- the root is `8·id` asserts `7·id = 8·id`, i.e. `7 = 8` (`cutSmul_id_inj`), and must NOT compile.
--   The false numeric `7 = 8` is DISTINCT from the banked battery (C115 1=7, C116 4=13,
-- C117 36=9, C118 21=1, C119 16=1, C120 25=1, C121 5=1, C122 2=8, C123 4=64).
--   PHYSICS-WORDS-REMOVABLE: delete "square-root/uniqueness/positive-definite/self-adjoint/scalar/
-- homothety/operator/spectral" → over the derived complete ordered field `Cut`, if a `Cut`-linear
-- `R` is `EvC`-symmetric, `EvC`-nonneg, and `R∘R = 49·id`, then `R = cutSqrt 49 · id = 7·id`;
-- claiming `R = 8·id` forces `7 = 8`; pure linear-algebra arithmetic. The bite is a false NUMERIC,
-- name-independent.

/-- BOGUS: the scalar-target positive-operator-square-root uniqueness `op_sqrt_scalar_unique` pins
    any positive operator square root `R` of `49·id` to `cutSqrt 49 · id = 7·id`; the WRONG claim
    that `R` is the homothety `8·id` asserts `7·id = 8·id`, which reduces to the false numeric
    `7 = 8`, so this must NOT compile. -/
theorem op_sqrt_scalar_unique_wrong_value_BOGUS {R : Module.End Cut STVC}
    (hsymm : IsEvCSymm R) (hpos : ∀ p, 0 ≤ EvC (R p) p)
    (hsq : R.comp R = (49 : Cut) • (LinearMap.id : Module.End Cut STVC)) :
    R = (8 : Cut) • (LinearMap.id : Module.End Cut STVC) := by
  have h := op_sqrt_scalar_unique (show (0 : Cut) ≤ 49 by norm_num) hsymm hpos hsq
  have h49 : cutSqrt (49 : Cut) = 7 :=
    (cutSqrt_unique (show (0 : Cut) ≤ 7 by norm_num) (by norm_num : (7 : Cut) * 7 = 49)).symm
  rw [h49] at h
  -- h : R = 7 • id. BOGUS goal R = 8 • id forces 7 • id = 8 • id, i.e. 7 = 8.
  rw [h]
  congr 1

end

end Counterexamples
