import Phys.Algebra.LorentzContinuumSpin9Reach
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- A: force End mul via @Mul.mul on Function.End STVC
theorem tA (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) :
    (Mul.mul (biMulFun w w : Function.End STVC) (biMulFun u u : Function.End STVC)) ∈ genIsomMonoidC2 :=
  Submonoid.mul_mem _ (biMulFun_imag_mem_gen2 w hw) (biMulFun_imag_mem_gen2 u hu)
-- B: does that composite apply defeq to nested application?
theorem tB (u w : O Cut) (p : STVC) :
    (Mul.mul (biMulFun w w : Function.End STVC) (biMulFun u u : Function.End STVC)) p
      = biMulFun w w (biMulFun u u p) := rfl
end
end Phys.Algebra
