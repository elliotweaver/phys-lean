import Phys.Algebra.LorentzContinuumGenerationSO8GlobalExhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- The Householder reflection of the positive-definite Born form across the hyperplane
    Born-orthogonal to `a`: `v ↦ v − (2·(gFormC a a)⁻¹ · gFormC a v) • a`. Built from the bundled
    Born functional `gFormCRight a` (N119) via `smulRight`. PURE bilinear-form linear algebra —
    NO octonion multiplication, NO imaginarity. -/
def houseHolder (a : O Cut) : O Cut →ₗ[Cut] O Cut :=
  LinearMap.id - (2 * (gFormC a a)⁻¹) • (LinearMap.smulRight (gFormCRight a) a)

/-- P1 — the explicit action. -/
theorem houseHolder_apply (a v : O Cut) :
    houseHolder a v = v - (2 * (gFormC a a)⁻¹ * gFormC a v) • a := by
  unfold houseHolder
  rw [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.smul_apply,
      LinearMap.smulRight_apply]
  show v - (2 * (gFormC a a)⁻¹) • (gFormCRight a v • a) = _
  rw [smul_smul]
  rfl

/-- P4 — fixes the Born-orthogonal complement. -/
theorem houseHolder_fixes_ortho {a u : O Cut} (h : gFormC a u = 0) :
    houseHolder a u = u := by
  rw [houseHolder_apply, h, mul_zero, zero_smul, sub_zero]

/-- P5 — negates `a` itself (when `gFormC a a ≠ 0`). -/
theorem houseHolder_neg_self {a : O Cut} (ha : gFormC a a ≠ 0) :
    houseHolder a a = -a := by
  rw [houseHolder_apply]
  have : (2 * (gFormC a a)⁻¹ * gFormC a a) = 2 := by field_simp
  rw [this]
  module

end

end Phys.Algebra
