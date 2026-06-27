import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle
import Phys.Algebra.LorentzContinuumGenerationSO8RankInduction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## OPTION 1: the KAK sandwich — soundness, membership, isometry. -/

/-- THE KAK SANDWICH `SO(8)·A·SO(8)`: an octonion-block word, a ninth rotation, an octonion-block word. -/
def kakWordLin (L1 L2 : List (O Cut × O Cut)) (c s : Cut) : Module.End Cut STVC :=
  blockWordLin L2 * planeRotLin c s * blockWordLin L1

theorem kakWordLin_mem (L1 L2 : List (O Cut × O Cut)) (c s : Cut)
    (hL1 : ∀ p ∈ L1, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1)
    (hL2 : ∀ p ∈ L2, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1)
    (h : c ^ 2 + s ^ 2 = 1) :
    kakWordLin L1 L2 c s ∈ genIsomMonoidLinPlus := by
  unfold kakWordLin
  exact mul_mem (mul_mem
      (genIsomMonoidLin_le_genIsomMonoidLinPlus (blockWordLin_mem_genLin L2 hL2))
      (planeRotLin_mem_genIsomMonoidLinPlus c s h))
    (genIsomMonoidLin_le_genIsomMonoidLinPlus (blockWordLin_mem_genLin L1 hL1))

theorem kakWordLin_isQvIsomC (L1 L2 : List (O Cut × O Cut)) (c s : Cut)
    (hL1 : ∀ p ∈ L1, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1)
    (hL2 : ∀ p ∈ L2, gFormC p.1 p.1 = 1 ∧ gFormC p.2 p.2 = 1)
    (h : c ^ 2 + s ^ 2 = 1) :
    IsQvIsomC ((kakWordLin L1 L2 c s : Module.End Cut STVC) : STVC → STVC) :=
  genIsomMonoidLinPlus_isQvIsomC (kakWordLin_mem L1 L2 c s hL1 hL2 h)

/-! ## OPTION 2: the commutation of a diagonal block with the ninth rotation.
    genTwoPlaneLin u w (imaginary Born units) FIXES x and the real axis 1, preserves reQC;
    planeRotLin acts on {x, real-axis} fixing the imaginary block ⟹ they commute. -/

-- W(1) = 1 for imaginary block: w·((u·(1·u))·w) = w·((u·u)·w) = w·(-w) = 1
example (u w : O Cut) (hu : u * u = -1) (hw : w * w = -1) :
    genTwoPlaneLin u w (0, 0, (1 : O Cut)) = (0, 0, (1 : O Cut)) := by
  show biMulLin w w (biMulLin u u (0, 0, (1 : O Cut))) = _
  refine Prod.ext rfl (Prod.ext rfl ?_)
  show w * ((u * ((1 : O Cut) * u)) * w) = (1 : O Cut)
  rw [one_mul, hu]
  rw [show ((-1 : O Cut) * w) = -w by rw [neg_one_mul]]
  rw [mul_neg, hw, neg_neg]

end

end Phys.Algebra
