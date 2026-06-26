import Phys.Algebra.LorentzContinuumGeneratedGroup

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- PROBE: the two-sided Moufang bimultiplication `(t,x,v) ↦ (t,x, u·(v·u'))`. -/
def biMulFun (u u' : O Cut) : STVC → STVC := fun p => (p.1, p.2.1, u * (p.2.2 * u'))

/-- PROBE: the three-factor Born composition via gFormC_comp twice. -/
theorem biMul_gFormC (u u' v : O Cut) :
    gFormC (u * (v * u')) (u * (v * u')) = gFormC u u * (gFormC v v * gFormC u' u') := by
  rw [gFormC_comp u (v * u'), gFormC_comp v u']

/-- PROBE: the bimultiplication is a QvC-isometry when u, u' are Born-units. -/
theorem biMulFun_isom {u u' : O Cut} (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) (p : STVC) :
    QvC (biMulFun u u' p) = QvC p := by
  obtain ⟨t, x, v⟩ := p
  show QformC _ _ _ = QformC _ _ _
  unfold QformC biMulFun
  simp only
  rw [biMul_gFormC, hu, hu', mul_one, one_mul]

/-- PROBE: membership. -/
theorem biMulFun_mem {u u' : O Cut} (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    (biMulFun u u' : Function.End STVC) ∈ qvIsomMonoidC :=
  fun p => biMulFun_isom hu hu' p

end

end Phys.Algebra
