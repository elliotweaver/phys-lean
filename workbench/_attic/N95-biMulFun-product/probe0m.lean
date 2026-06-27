import Phys.Algebra.LorentzContinuumSpin9Reach
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- membership of product via Submonoid.mul_mem
theorem biMulComp_mem_gen2 (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) :
    (biMulFun w w : Function.End STVC) * (biMulFun u u : Function.End STVC) ∈ genIsomMonoidC2 :=
  Submonoid.mul_mem _ (biMulFun_imag_mem_gen2 w hw) (biMulFun_imag_mem_gen2 u hu)
-- now the application equality with End mul
theorem biMulComp_apply (u w : O Cut) (p : STVC) :
    ((biMulFun w w : Function.End STVC) * (biMulFun u u : Function.End STVC)) p
      = biMulFun w w (biMulFun u u p) := by
  show (biMulFun w w * biMulFun u u : Function.End STVC) p = _
  rw [Function.End.mul_def]
  rfl
end
end Phys.Algebra
