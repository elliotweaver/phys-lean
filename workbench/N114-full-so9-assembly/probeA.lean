import Phys.Algebra.LorentzContinuumGenerationNinthFamily

namespace ProbeN114

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- THE GENERAL-AXIS enlarged element: axisRotLin e c s · genTwoPlaneLin u w
-- (the non-degenerate analogue of N112's enlargedTwoPlaneNinth = planeRotLin c s · genTwoPlaneLin u w
--  = axisRotLin 1 c s · genTwoPlaneLin u w).
def enlargedAxisNinth (e u w : O Cut) (c s : Cut) : Module.End Cut STVC :=
  axisRotLin e c s * genTwoPlaneLin u w

-- membership in the enlarged FAMILY submonoid
theorem genIsomMonoidLin_le_family :
    genIsomMonoidLin ≤ genIsomMonoidLinFamily :=
  le_trans genIsomMonoidLin_le_genIsomMonoidLinPlus genIsomMonoidLinPlus_le_genIsomMonoidLinFamily

theorem enlargedAxisNinth_mem (e u w : O Cut) (c s : Cut)
    (he : gFormC e e = 1) (hu : gFormC u u = 1) (hw : gFormC w w = 1) (h : c ^ 2 + s ^ 2 = 1) :
    enlargedAxisNinth e u w c s ∈ genIsomMonoidLinFamily :=
  mul_mem (axisRotLin_mem_genIsomMonoidLinFamily e c s he h)
    (genIsomMonoidLin_le_family (genTwoPlaneLin_mem_genLin u w hu hw))

theorem enlargedAxisNinth_isQvIsomC (e u w : O Cut) (c s : Cut)
    (he : gFormC e e = 1) (hu : gFormC u u = 1) (hw : gFormC w w = 1) (h : c ^ 2 + s ^ 2 = 1) :
    IsQvIsomC (enlargedAxisNinth e u w c s) :=
  genIsomMonoidLinFamily_isQvIsomC (enlargedAxisNinth_mem e u w c s he hu hw h)

-- THE WITNESS at (0,1,0): the general-axis element moves BOTH x AND a deep octonion slot.
-- genTwoPlaneLin fixes the zero-v point, axisRotLin e₂ then sends (0,1,0) ↦ (0, c, s•e₂).
theorem enlargedAxisNinth_e2_apply (u w : O Cut) (c s : Cut) :
    enlargedAxisNinth (CD.e2 : O Cut) u w c s ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), c, s • (CD.e2 : O Cut)) := by
  show axisRotLin (CD.e2 : O Cut) c s (genTwoPlaneLin u w ((0:Cut), (1:Cut), (0:O Cut))) = _
  rw [genTwoPlaneLin_fixes_zero_v u w (0:Cut) (1:Cut), axisRotLin_apply]
  show ((0:Cut), c * 1 - s * gFormC (0 : O Cut) (CD.e2 : O Cut),
        (0:O Cut) + (s * 1 + (c - 1) * gFormC (0 : O Cut) (CD.e2 : O Cut)) • (CD.e2 : O Cut))
      = ((0:Cut), c, s • (CD.e2 : O Cut))
  rw [gFormC_zero_left]
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show c * 1 - s * 0 = c; ring
  · show (0:O Cut) + (s * 1 + (c - 1) * 0) • (CD.e2 : O Cut) = s • (CD.e2 : O Cut)
    rw [zero_add]; congr 1; ring

-- x-slot moves to c
theorem enlargedAxisNinth_e2_moves_x (u w : O Cut) (c s : Cut) :
    (enlargedAxisNinth (CD.e2 : O Cut) u w c s ((0:Cut), (1:Cut), (0:O Cut))).2.1 = c := by
  rw [enlargedAxisNinth_e2_apply]

-- ★ THE DEEP-SLOT SEPARATOR: the e₂-octonion-component of the moved v-block reads s.
theorem enlargedAxisNinth_e2_reads_s (u w : O Cut) (c s : Cut) :
    gFormC ((enlargedAxisNinth (CD.e2 : O Cut) u w c s ((0:Cut), (1:Cut), (0:O Cut))).2.2)
      (CD.e2 : O Cut) = s := by
  rw [enlargedAxisNinth_e2_apply]
  show gFormC (s • (CD.e2 : O Cut)) (CD.e2 : O Cut) = s
  rw [gFormC_smul_left, e2_gFormC_self]; ring

-- ★ THE COMPLEMENT: the single A-plane element leaves the e₂-component untouched (reads 0).
theorem enlargedTwoPlaneNinth_e2_reads_zero (u w : O Cut) (c s : Cut) :
    gFormC ((enlargedTwoPlaneNinth u w c s ((0:Cut), (1:Cut), (0:O Cut))).2.2)
      (CD.e2 : O Cut) = 0 := by
  show gFormC ((planeRotLin c s (genTwoPlaneLin u w ((0:Cut), (1:Cut), (0:O Cut)))).2.2)
      (CD.e2 : O Cut) = 0
  rw [genTwoPlaneLin_fixes_zero_v u w (0:Cut) (1:Cut), planeRotLin_apply]
  show gFormC ((0:O Cut) + (s * 1 + (c - 1) * reQC (0:O Cut)) • (1 : O Cut)) (CD.e2 : O Cut) = 0
  rw [reQC_zero, zero_add, gFormC_smul_left, e2_gFormC_one]; ring

-- not a pure SO(8) word (moves x for c ≠ 1)
theorem enlargedAxisNinth_e2_not_mem_genIsomMonoidLin (u w : O Cut) (c s : Cut) (hc : c ≠ 1) :
    enlargedAxisNinth (CD.e2 : O Cut) u w c s ∉ genIsomMonoidLin := by
  intro hmem
  have hfix := genIsomMonoidLin_fixes_snd hmem ((0:Cut), (1:Cut), (0:O Cut))
  rw [enlargedAxisNinth_e2_moves_x u w c s] at hfix
  exact hc hfix

-- ★★ THE SEPARATOR: the general-axis witness differs from EVERY single-A-plane element
-- (enlargedTwoPlaneNinth u' w' c' s') for s ≠ 0 — reaching strictly beyond the SO(8)·A sector.
theorem enlargedAxisNinth_ne_enlargedTwoPlaneNinth (u w u' w' : O Cut) (c s c' s' : Cut)
    (hs : s ≠ 0) :
    enlargedAxisNinth (CD.e2 : O Cut) u w c s ≠ enlargedTwoPlaneNinth u' w' c' s' := by
  intro heq
  have h := congrArg
    (fun K => gFormC ((K ((0:Cut), (1:Cut), (0:O Cut))).2.2) (CD.e2 : O Cut)) heq
  simp only at h
  rw [enlargedAxisNinth_e2_reads_s, enlargedTwoPlaneNinth_e2_reads_zero] at h
  exact hs h

-- W8 concrete witness (5/13, 12/13)
theorem five_twelve_thirteen_sq : ((5:Cut)/13) ^ 2 + ((12:Cut)/13) ^ 2 = 1 := by norm_num

theorem twelve_thirteenths_ne_zero : ((12:Cut)/13) ≠ 0 := by norm_num

theorem enlargedAxisNinth_e2_deep_val (u w : O Cut) :
    gFormC ((enlargedAxisNinth (CD.e2 : O Cut) u w ((5:Cut)/13) ((12:Cut)/13)
        ((0:Cut), (1:Cut), (0:O Cut))).2.2) (CD.e2 : O Cut) = (12:Cut)/13 :=
  enlargedAxisNinth_e2_reads_s u w ((5:Cut)/13) ((12:Cut)/13)

end

end ProbeN114
