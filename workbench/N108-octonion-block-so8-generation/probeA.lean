import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## PROBE A — the general structural lemmas (expect INSTANT). -/

/-- The four-generator octonion-block composite: a product of two 2-plane rotations. -/
def doubleBlockLin (u w a b : O Cut) : Module.End Cut STVC :=
  genTwoPlaneLin a b * genTwoPlaneLin u w

theorem doubleBlockLin_apply (u w a b : O Cut) (p : STVC) :
    doubleBlockLin u w a b p = genTwoPlaneLin a b (genTwoPlaneLin u w p) := rfl

/-- A four-generator biMulLin word ∈ genIsomMonoidLin (mul_mem of two genTwoPlaneLin members). -/
theorem doubleBlockLin_mem_genLin (u w a b : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1) :
    doubleBlockLin u w a b ∈ genIsomMonoidLin := by
  unfold doubleBlockLin
  exact mul_mem (genTwoPlaneLin_mem_genLin a b ha hb) (genTwoPlaneLin_mem_genLin u w hu hw)

/-- A QvC-isometry (composition of two genTwoPlaneLin isometries). -/
theorem doubleBlockLin_isQvIsomC (u w a b : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1) :
    IsQvIsomC ((doubleBlockLin u w a b : Module.End Cut STVC) : STVC → STVC) := by
  intro p
  show QvC (doubleBlockLin u w a b p) = QvC p
  have h : doubleBlockLin u w a b p = genTwoPlaneLin a b (genTwoPlaneLin u w p) := rfl
  rw [h, genTwoPlaneLin_isQvIsomC a b ha hb, genTwoPlaneLin_isQvIsomC u w hu hw]

/-- Bridged ∈ genIsomMonoidC2 (the transport applied to the four-generator word). -/
theorem doubleBlockLin_mem_gen2 (u w a b : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1) :
    endToFunEnd (doubleBlockLin u w a b) ∈ genIsomMonoidC2 :=
  endToFunEnd_genIsomMonoidLin_mem_gen2 (doubleBlockLin_mem_genLin u w a b hu hw ha hb)

end

end Phys.Algebra
