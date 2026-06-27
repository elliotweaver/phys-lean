import Phys.Algebra.LorentzContinuumGenerationConverseCompact

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- PROBE A: the QvC-isometry of the product (composition of two half-turns).
theorem probe_genTwoPlaneLin_isQvIsomC (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) :
    IsQvIsomC (genTwoPlaneLin u w) := by
  intro p
  show QvC (genTwoPlaneLin u w p) = QvC p
  have hgp : genTwoPlaneLin u w p = biMulLin w w (biMulLin u u p) := rfl
  rw [hgp, biMulLin_imag_isQvIsomC w hw (biMulLin u u p), biMulLin_imag_isQvIsomC u hu p]

-- PROBE B: the EvC-adjoint of the product is the swapped product (comp = * defeq).
theorem probe_genTwoPlaneLin_isEvCAdjoint (u w : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z) :
    IsEvCAdjoint (genTwoPlaneLin u w) (genTwoPlaneLin w u) :=
  IsEvCAdjoint.comp (biMulLin_imag_isEvCAdjoint_self w hw hwss hwL)
                    (biMulLin_imag_isEvCAdjoint_self u hu huss huL)

-- PROBE C (the core obligation): p = h∘g = id (EvC-orthogonal product).
theorem probe_genTwoPlaneLin_pos_part_id (u w : O Cut)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z) :
    (genTwoPlaneLin w u).comp (genTwoPlaneLin u w) = LinearMap.id := by
  show (biMulLin u u * biMulLin w w) * (biMulLin w w * biMulLin u u) = LinearMap.id
  have hBB : biMulLin w w * biMulLin w w = (1 : Module.End Cut STVC) :=
    biMulLin_imag_involutive w hwss hwL
  have hAA : biMulLin u u * biMulLin u u = (1 : Module.End Cut STVC) :=
    biMulLin_imag_involutive u huss huL
  calc (biMulLin u u * biMulLin w w) * (biMulLin w w * biMulLin u u)
      = biMulLin u u * ((biMulLin w w * biMulLin w w) * biMulLin u u) := by
        rw [mul_assoc, mul_assoc]
    _ = biMulLin u u * ((1 : Module.End Cut STVC) * biMulLin u u) := by rw [hBB]
    _ = biMulLin u u * biMulLin u u := by rw [one_mul]
    _ = 1 := hAA

end

end Phys.Algebra
