import Phys.Algebra.LorentzContinuumSpin9Reach
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- subtype product route: bulletproof, mul is the submonoid's = End's
theorem tC (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) :
    (((⟨biMulFun w w, biMulFun_imag_mem_gen2 w hw⟩ : genIsomMonoidC2)
      * ⟨biMulFun u u, biMulFun_imag_mem_gen2 u hu⟩ : genIsomMonoidC2) : Function.End STVC)
      ∈ genIsomMonoidC2 :=
  Subtype.property _
-- and the coercion applies to nested function application?
theorem tD (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) (p : STVC) :
    (((⟨biMulFun w w, biMulFun_imag_mem_gen2 w hw⟩ : genIsomMonoidC2)
      * ⟨biMulFun u u, biMulFun_imag_mem_gen2 u hu⟩ : genIsomMonoidC2) : Function.End STVC) p
      = biMulFun w w (biMulFun u u p) := rfl
end
end Phys.Algebra
