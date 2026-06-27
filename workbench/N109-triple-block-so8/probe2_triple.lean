import Phys.Algebra.LorentzContinuumGenerationOctonionBlockSO8

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

abbrev ii4 : O Cut :=
  (CD.iota (CD.iota (Phys.Cascade.Dbl.J : Phys.Cascade.Dbl Cut)) : O Cut)

theorem ii4_imag : star (ii4 : O Cut) = -(ii4 : O Cut) := by
  ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]

theorem ii4_sq : (ii4 : O Cut) * (ii4 : O Cut) = -1 := by
  ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]

theorem ii4_alt (v : O Cut) : (ii4 : O Cut) * ((ii4 : O Cut) * v) = -v := by
  have h := L_sq_imag (ii4 : O Cut) ii4_imag v
  rw [h]
  have hN : (CD.iota (CD.Nrm (ii4 : O Cut)) : O Cut) = 1 := by
    rw [show CD.Nrm (ii4 : O Cut) = (1 : H Cut) by
          rw [CD.Nrm_def]; ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]]
    ext <;> simp [CD.iota]
  rw [hN, one_mul]

theorem ii4_gFormC_self : gFormC (ii4 : O Cut) (ii4 : O Cut) = 1 := by
  show reQC ((ii4 : O Cut) * star (ii4 : O Cut)) = 1
  rw [ii4_imag]
  simp only [reQC]
  simp [CD.iota, Phys.Cascade.Dbl.J, CD.mul_re, CD.neg_re]

/-! ## THE TRIPLE-BLOCK COMPOSITE -/

/-- THE TRIPLE-BLOCK COMPOSITE — a product of three octonion-block 2-plane rotations:
    `genTwoPlaneLin c d * doubleBlockLin u w a b` (a SIX-generator biMulLin word). -/
def tripleBlockLin (u w a b c d : O Cut) : Module.End Cut STVC :=
  genTwoPlaneLin c d * doubleBlockLin u w a b

theorem tripleBlockLin_apply (u w a b c d : O Cut) (p : STVC) :
    tripleBlockLin u w a b c d p = genTwoPlaneLin c d (doubleBlockLin u w a b p) := by
  rw [tripleBlockLin, Module.End.mul_apply]

-- PROBE A: membership in genIsomMonoidLin
theorem tripleBlockLin_mem_genLin (u w a b c d : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1)
    (hc : gFormC c c = 1) (hd : gFormC d d = 1) :
    tripleBlockLin u w a b c d ∈ genIsomMonoidLin := by
  unfold tripleBlockLin
  exact mul_mem (genTwoPlaneLin_mem_genLin c d hc hd)
    (doubleBlockLin_mem_genLin u w a b hu hw ha hb)

-- PROBE B: QvC-isometry
theorem tripleBlockLin_isQvIsomC (u w a b c d : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1)
    (hc : gFormC c c = 1) (hd : gFormC d d = 1) :
    IsQvIsomC ((tripleBlockLin u w a b c d : Module.End Cut STVC) : STVC → STVC) := by
  intro p
  rw [tripleBlockLin, Module.End.mul_apply]
  rw [genTwoPlaneLin_isQvIsomC c d hc hd (doubleBlockLin u w a b p)]
  exact doubleBlockLin_isQvIsomC u w a b hu hw ha hb p

-- PROBE C: bridged ∈ genIsomMonoidC2
theorem tripleBlockLin_mem_gen2 (u w a b c d : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (ha : gFormC a a = 1) (hb : gFormC b b = 1)
    (hc : gFormC c c = 1) (hd : gFormC d d = 1) :
    endToFunEnd (tripleBlockLin u w a b c d) ∈ genIsomMonoidC2 :=
  endToFunEnd_genIsomMonoidLin_mem_gen2
    (tripleBlockLin_mem_genLin u w a b c d hu hw ha hb hc hd)

-- PROBE D: the bridge to nested six-factor biMulFun composite
theorem tripleBlock_bridge_eq (u w a b c d : O Cut) :
    endToFunEnd (tripleBlockLin u w a b c d)
      = (endToFunEnd (genTwoPlaneLin c d)) * (endToFunEnd (doubleBlockLin u w a b)) := by
  rw [tripleBlockLin, map_mul]

theorem tripleBlock_bridge_apply (u w a b c d : O Cut) (p : STVC) :
    endToFunEnd (tripleBlockLin u w a b c d) p
      = biMulFun d d (biMulFun c c
          (biMulFun b b (biMulFun a a (biMulFun w w (biMulFun u u p))))) := by
  rw [tripleBlock_bridge_eq]
  show (endToFunEnd (genTwoPlaneLin c d)) ((endToFunEnd (doubleBlockLin u w a b)) p) = _
  rw [genTwoPlaneLin_apply, doubleBlock_bridge_apply]

end

end Phys.Algebra
