import Phys.Algebra.LorentzContinuumIsomCompact

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C125): A BOGUS GENERAL POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS COLLAPSE —
-- "A POSITIVE OPERATOR SQUARE ROOT R OF THE INJECTIVE 36·id THAT ALSO ADMITS 6·id AS A ROOT
-- READS THE HOMOTHETY 5·id".
-- N93 banks `op_sqrt_unique_of_injective`: two EvC-self-adjoint EvC-positive-semidefinite operators
-- s₁, s₂ with s₁∘s₁ = s₂∘s₂ = q and q INJECTIVE are EQUAL — even when they live over DIFFERENT
-- eigen-families. Applied with s₁ = R and s₂ = 6·id (a genuine positive operator square root of the
-- injective 36·id), the uniqueness FORCES R = 6·id. The BOGUS claim that R = 5·id then asserts
-- 6·id = 5·id, i.e. 6 = 5 (`cutSmul_id_inj` via congr), and must NOT compile.
--   The hypotheses are jointly SATISFIABLE (take R = 6·id: both root witnesses hold and 36·id is
-- injective), so the theorem is genuinely FALSE, not vacuous — the bite is a true counterexample.
--   The false numeric `6 = 5` is DISTINCT from the banked battery (… C120 25=1, C121 5=1, C122 2=8,
-- C123 4=64, C124 7=8).
--   PHYSICS-WORDS-REMOVABLE: delete "square-root/uniqueness/positive-definite/self-adjoint/
-- eigen*/isometry/compact/spectral/operator" → over the derived complete ordered field `Cut` with
-- the positive-definite symmetric form `EvC`: if R and 6·id are both EvC-symmetric, EvC-nonneg, and
-- square to the injective 36·id, then R = 6·id; claiming R = 5·id forces 6 = 5; pure linear-algebra
-- arithmetic. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the general positive-operator-square-root uniqueness `op_sqrt_unique_of_injective` pins a
    positive operator square root `R` of the injective `36·id` (which also admits the genuine root
    `6·id`) to `R = 6·id`; the WRONG claim that `R = 5·id` asserts `6·id = 5·id`, which reduces to
    the false numeric `6 = 5`, so this must NOT compile. -/
theorem op_sqrt_unique_of_injective_wrong_value_BOGUS {R : Module.End Cut STVC}
    (hqinj : Function.Injective ((36 : Cut) • (LinearMap.id : Module.End Cut STVC)))
    (h₁ : IsEvCOpSqrt R ((36 : Cut) • (LinearMap.id : Module.End Cut STVC)))
    (h₂ : IsEvCOpSqrt ((6 : Cut) • (LinearMap.id : Module.End Cut STVC))
          ((36 : Cut) • (LinearMap.id : Module.End Cut STVC))) :
    R = (5 : Cut) • (LinearMap.id : Module.End Cut STVC) := by
  have h := op_sqrt_unique_of_injective hqinj h₁ h₂
  -- h : R = 6 • id. BOGUS goal R = 5 • id forces 6 • id = 5 • id, i.e. 6 = 5.
  rw [h]
  congr 1

end

end Counterexamples
