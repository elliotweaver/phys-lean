import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## PROBE A2 — structural route via Module.End.mul_apply (no rfl on the nested coercion). -/

def doubleBlockLin (u w a b : O Cut) : Module.End Cut STVC :=
  genTwoPlaneLin a b * genTwoPlaneLin u w

theorem doubleBlockLin_apply (u w a b : O Cut) (p : STVC) :
    doubleBlockLin u w a b p = genTwoPlaneLin a b (genTwoPlaneLin u w p) := by
  rw [doubleBlockLin, Module.End.mul_apply]

theorem doubleBlockLin_mem_genLin (u w a b : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1) :
    doubleBlockLin u w a b ∈ genIsomMonoidLin := by
  unfold doubleBlockLin
  exact mul_mem (genTwoPlaneLin_mem_genLin a b ha hb) (genTwoPlaneLin_mem_genLin u w hu hw)

theorem doubleBlockLin_isQvIsomC (u w a b : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1) :
    IsQvIsomC ((doubleBlockLin u w a b : Module.End Cut STVC) : STVC → STVC) := by
  intro p
  rw [doubleBlockLin, Module.End.mul_apply]
  rw [genTwoPlaneLin_isQvIsomC a b ha hb (genTwoPlaneLin u w p),
      genTwoPlaneLin_isQvIsomC u w hu hw p]

theorem doubleBlockLin_mem_gen2 (u w a b : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1) :
    endToFunEnd (doubleBlockLin u w a b) ∈ genIsomMonoidC2 :=
  endToFunEnd_genIsomMonoidLin_mem_gen2 (doubleBlockLin_mem_genLin u w a b hu hw ha hb)

end

end Phys.Algebra
