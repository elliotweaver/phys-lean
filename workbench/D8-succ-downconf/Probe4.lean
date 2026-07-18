import Phys.Algebra.DownConfinementRelativeScale
import Phys.Algebra.FreezeoutComposition
import Phys.Algebra.ComposedNumeralSPinned
import Phys.Algebra.JoinSplitRatioDerived
import Mathlib.Tactic

namespace Phys.Algebra.ComposedFreezeoutDissolvedProbe

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.FreezeoutComposition
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- positivity of the banked shape numerals as Cut
theorem bMass0_pos : (0 : Cut) < bMass 0 := by
  have : bMass 0 = mass0 := rfl
  rw [this]; exact mass0_pos
theorem bMass2_pos : (0 : Cut) < bMass 2 := by
  have : bMass 2 = mass2 := rfl
  rw [this]; exact mass2_pos

-- cutLog inverse and division laws (derived from banked cutLog_mul / cutLog_one)
theorem cutLog_inv_pos {a : Cut} (ha : 0 < a) : cutLog (1 / a) = - cutLog a := by
  have hinv : 0 < 1 / a := by positivity
  have h : cutLog (1 / a) + cutLog a = 0 := by
    rw [← cutLog_mul hinv ha]
    rw [one_div, inv_mul_cancel₀ (ne_of_gt ha), cutLog_one]
  linarith

theorem cutLog_div_pos {a b : Cut} (ha : 0 < a) (hb : 0 < b) :
    cutLog (a / b) = cutLog a - cutLog b := by
  rw [div_eq_mul_inv, cutLog_mul ha (by positivity), ← one_div, cutLog_inv_pos hb]
  ring

-- the confinement rung's log
theorem cutLog_confBundle : cutLog confBundle = -(8 * cutPi / 3) := by
  rw [confBundle_eq, cutLog_cutExp]

-- downConfBundle's log = L_mb + 8π/3
theorem cutLog_downConfBundle :
    cutLog downConfBundle = cutLog mbRatioDerived + 8 * cutPi / 3 := by
  unfold downConfBundle
  rw [cutLog_div_pos mbRatioDerived_pos confBundle_pos, cutLog_confBundle]
  ring

-- ★ THE GEM: κ·2·(8·cutPi/3) = 16/9 (π cancels)
theorem confinement_rung_rational :
    kappaLeading * 2 * (8 * cutPi / 3) = 16 / 9 := by
  rw [kappaLeading_eq]
  have hpi : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

-- ★★ THE DISSOLUTION (the freeze-out summand at pinned edges = determined closed form)
theorem freezeout_summand_dissolved :
    kappaLeading * (11 / 3) * cutLog (mbRatioDerived * (bMass 0 / bMass 2))
      + kappaLeading * (10 / 3) * cutLog (1 / mbRatioDerived)
      + kappaLeading * 2 * cutLog (downConfBundle * bMass 2)
    = 16 / 9
      + kappaLeading * ((7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0)
        - (5 / 3) * cutLog (bMass 2)) := by
  have hmb := mbRatioDerived_pos
  have hb0 := bMass0_pos
  have hb2 := bMass2_pos
  have hdcb := downConfBundle_pos
  -- expand the three logs
  rw [cutLog_mul hmb (by positivity), cutLog_div_pos hb0 hb2,
      cutLog_inv_pos hmb,
      cutLog_mul hdcb hb2, cutLog_downConfBundle]
  -- now purely linear in cutLog mbRatioDerived, cutLog(bMass0), cutLog(bMass2), and κ·2·(8π/3)
  have hgem := confinement_rung_rational
  ring_nf
  ring_nf at hgem
  linarith [hgem]

end

end Phys.Algebra.ComposedFreezeoutDissolvedProbe
