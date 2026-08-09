import Phys.Algebra.MirrorRootExistence
import Phys.Algebra.CorrectedEndpointComposition
import Phys.Algebra.CorrectedEndpointCores
import Mathlib.Tactic

/-
  # N692 — THE CORRECTED MIRROR FIXED POINT (repair phase 4)

  The mirror fixed-point pipeline re-run over the CORRECTED endpoint (N690/N691):
  `F0Corrected := recomposedEndpointCorrectedDressed − obstructionTerm` (the SAME banked
  obstruction — N688: the obstruction is frame-independent), and the fixed-point residual
  `residualCorrected a := a·F0Corrected − mirrorCoeff·κ·a³ − 1` with the ASSEMBLED
  `mirrorCoeff = chargeTraceDepth · depthWeight` (N676 standard — no coefficient literal).

  Exact-arithmetic verification (python Fractions, done BEFORE writing):
  - dressed corrected bracket (N691): [681387543619019/5e12, 34069377180951/2.5e11];
    banked obstruction bracket (N586): [63661977236/1e12, 63661977237/1e12];
    F0Corrected ∈ [340534616866417/2500000000000, 17026730843321/125000000000]
    (= [136.2138467465668, 136.213846746568], both endpoints EXACT differences).
  - window aL' = 7341/10⁶, aR' = 7342/10⁶: worst-case residual at aL' ≤ −5.42e-5 < 0,
    worst-case residual at aR' ≥ +8.19e-5 > 0.
  - tight sub-window tL' = 734139808/10¹¹, tR' = 734139811/10¹¹ (root ≈ 0.0073413980922):
    worst-case residual at tL' ≤ −1.66e-9 < 0, at tR' ≥ +2.42e-9 > 0.
  - monotonicity second factor ≥ F0'_lo − (16/9)·κ_hi·3·aR'² ≥ 136.21381 > 136 > 0.
  - landing bracket from the tight window: 1/a ∈ [136.21383658024396, 136.21383658024524]
    ⊂ [1362138365802/10¹⁰, 1362138365803/10¹⁰] (margins +4.4e-11 / +5.5e-11, both inside).

  HONEST FRAME: the corrected landing ≈ 136.2138 IS the chain's current number — stated as
  the theorem it is. No reference to any measured value anywhere. NO-FIT: aL'/aR'/tL'/tR'
  are chosen where the residual's SIGN is certifiable from the banked brackets.

  PHYSICS-WORDS-REMOVABLE: delete mirror/coupling — the statements are: a cubic over the
  derived Cut changes sign on a rational interval, is continuous, hence has a root there,
  the root is unique (strict monotonicity), and its inverse lies in a stated rational
  bracket. Classical.choice enters only via IVT, exactly as in MirrorRootExistence.
-/

namespace Phys.Algebra
namespace CorrectedMirrorFixedPoint

open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.DepthWeight
open Phys.Algebra.D7DepthTwoComposed
open Phys.Algebra.D7NarrowingRung3
open Phys.Algebra.D7NarrowingRung4
open Phys.Algebra.CorrectedEndpointComposition
open Phys.Algebra.CorrectedEndpointCores
open Phys.Algebra.MirrorFixedPoint
open Phys.Foundation Phys.Foundation.ContinuumQ
open Set

noncomputable section

/-! ## (A) THE CORRECTED DRESSED BRACKET — the N691 core fed by the banked 1e14 inputs. -/

/-- ★★ THE CORRECTED DRESSED ENDPOINT BRACKET: `recomposedEndpointCorrectedDressed ∈
    [681387543619019/5e12, 34069377180951/2.5e11]` (≈ [136.2775087238038, 136.277508723804]).
    Assembled by `dressed_core_corrected` (N691) from the banked 1e14 `κ` bracket
    (`kappa_bracket_ext8`), the split@7 `L_m01` (`⟨cutLog_lo_s7, cutLog_hi_s7⟩`) and the
    three deepened edge logs — the SAME assembly as `recomposedEndpointDressed_restated_r4`,
    through the N690 closed form `corrected_dressed_closed`. -/
theorem recomposedEndpointCorrectedDressed_restated :
    (681387543619019 : Cut) / 5000000000000 ≤ recomposedEndpointCorrectedDressed
      ∧ recomposedEndpointCorrectedDressed ≤ 34069377180951 / 250000000000 := by
  have heq : recomposedEndpointCorrectedDressed
      = 7259 / 54 + kappaLeading * (3 * cutLog (mass0 / mass1)
          + (9 / 2) * cutLog mbRatioDerived + 5 * cutLog (bMass 0)
          - (5 / 2) * cutLog (bMass 2)) := by
    rw [corrected_dressed_closed]; unfold cInnerCorrected; ring
  rw [heq]
  obtain ⟨hklo, hkhi⟩ := kappa_bracket_ext8
  exact dressed_core_corrected kappaLeading (cutLog (mass0 / mass1)) (cutLog mbRatioDerived)
    (cutLog (bMass 0)) (cutLog (bMass 2)) hklo hkhi ⟨cutLog_lo_s7, cutLog_hi_s7⟩ cutLog_mb_ext8
    cutLog_bMass0_ext8 cutLog_bMass2_ext8

/-! ## (B) THE CORRECTED F0 — corrected dressed endpoint minus the SAME banked obstruction. -/

/-- ★★★ (TARGET 1) THE CORRECTED OBSTRUCTED ENDPOINT: the corrected dressed endpoint minus
    the banked gather-coherence obstruction (frame-independent per N688). -/
def F0Corrected : Cut :=
  recomposedEndpointCorrectedDressed - MirrorFixedPoint.obstructionTerm

/-- ★★★ (TARGET 2) THE CERTIFIED CORRECTED F0 BRACKET — corrected dressed bracket minus the
    banked obstruction bracket (worst-case rational arithmetic):
    `F0Corrected ∈ [340534616866417/2.5e12, 17026730843321/1.25e11]`
    (≈ [136.2138467465668, 136.213846746568]). -/
theorem F0Corrected_bracket :
    (340534616866417 : Cut) / 2500000000000 ≤ F0Corrected
      ∧ F0Corrected ≤ 17026730843321 / 125000000000 := by
  have hd := recomposedEndpointCorrectedDressed_restated
  have hob := MirrorFixedPoint.obstructionTerm_bracket
  constructor
  · rw [F0Corrected]; linarith [hd.1, hob.2]
  · rw [F0Corrected]; linarith [hd.2, hob.1]

/-! ## (C) THE CORRECTED RESIDUAL — the assembled mirror coefficient, no literal. -/

/-- ★★★ (TARGET 3) THE CORRECTED FIXED-POINT RESIDUAL:
    `h(a) = a·F0Corrected − mirrorCoeff·κ·a³ − 1` with the ASSEMBLED
    `mirrorCoeff = chargeTraceDepth · depthWeight` (N676 standard). A positive root `a` is
    exactly a value with `1/a = F0Corrected − mirrorCoeff·κ·a²`. -/
def residualCorrected (a : Cut) : Cut :=
  a * F0Corrected - MirrorFixedPoint.mirrorCoeff * kappaLeading * a ^ 3 - 1

/-- The corrected bracketing window (chosen where the SIGN is certifiable). -/
def aL' : Cut := 7341 / 1000000

def aR' : Cut := 7342 / 1000000

/-- The tight sub-window pinning the landing (root ≈ 0.0073413980922). -/
def tL' : Cut := 734139808 / 100000000000

def tR' : Cut := 734139811 / 100000000000

/-- ★★★ (TARGET 4a) SIGN CHANGE, LEFT: `h(aL') < 0` (worst case: F0 high, κ low). -/
theorem residualCorrected_neg_at_aL : residualCorrected aL' < 0 := by
  have hF := F0Corrected_bracket.2
  have hk := kappa_bracket_mirror.1
  rw [residualCorrected, aL', mirrorCoeff_eq]
  nlinarith [hF, hk]

/-- ★★★ (TARGET 4b) SIGN CHANGE, RIGHT: `0 < h(aR')` (worst case: F0 low, κ high). -/
theorem residualCorrected_pos_at_aR : 0 < residualCorrected aR' := by
  have hF := F0Corrected_bracket.1
  have hk := kappa_bracket_mirror.2
  rw [residualCorrected, aR', mirrorCoeff_eq]
  nlinarith [hF, hk]

set_option maxHeartbeats 1000000 in
/-- ★★ TIGHT SIGN CHANGE, LEFT: `h(tL') < 0` (worst-case margin ≈ −1.66×10⁻⁹). -/
theorem residualCorrected_neg_at_tL : residualCorrected tL' < 0 := by
  have hF := F0Corrected_bracket.2
  have hk := kappa_bracket_mirror.1
  rw [residualCorrected, tL', mirrorCoeff_eq]
  nlinarith [hF, hk]

set_option maxHeartbeats 1000000 in
/-- ★★ TIGHT SIGN CHANGE, RIGHT: `0 < h(tR')` (worst-case margin ≈ +2.42×10⁻⁹). -/
theorem residualCorrected_pos_at_tR : 0 < residualCorrected tR' := by
  have hF := F0Corrected_bracket.1
  have hk := kappa_bracket_mirror.2
  rw [residualCorrected, tR', mirrorCoeff_eq]
  nlinarith [hF, hk]

/-! ## (D) STRICT MONOTONICITY on the window — uniqueness of any root. -/

/-- ★★★ (TARGET 5) STRICT MONOTONICITY on `[aL', aR']`: for `a < b` in the window,
    `h(a) < h(b)`. Factorization: `h(b) − h(a) = (b−a)·(F0Corrected −
    mirrorCoeff·κ·(a²+ab+b²))`, and the second factor stays
    `≥ F0'_lo − (16/9)·κ_hi·3·aR'² > 136 > 0`. -/
theorem residualCorrected_strictMono {a b : Cut}
    (haL : aL' ≤ a) (hbR : b ≤ aR') (hab : a < b) :
    residualCorrected a < residualCorrected b := by
  have hF := F0Corrected_bracket.1
  have hk := kappa_bracket_mirror.2
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  have key : residualCorrected b - residualCorrected a
      = (b - a) * (F0Corrected
          - MirrorFixedPoint.mirrorCoeff * kappaLeading * (a ^ 2 + a * b + b ^ 2)) := by
    rw [residualCorrected, residualCorrected]; ring
  have hapos : (0 : Cut) < a := by
    have h0 : (0 : Cut) < 7341 / 1000000 := by norm_num
    rw [aL'] at haL; linarith
  have hbpos : (0 : Cut) < b := lt_trans hapos hab
  have haR : a ≤ 7342 / 1000000 := by rw [aR'] at hbR; linarith
  have hbR' : b ≤ 7342 / 1000000 := by rw [aR'] at hbR; exact hbR
  have hquad : a ^ 2 + a * b + b ^ 2 ≤ 3 * (7342 / 1000000) ^ 2 := by
    nlinarith [hapos, hbpos, haR, hbR', hab]
  have hfac : 0 < F0Corrected
      - MirrorFixedPoint.mirrorCoeff * kappaLeading * (a ^ 2 + a * b + b ^ 2) := by
    rw [mirrorCoeff_eq]
    nlinarith [hF, hk, hkpos, hquad, hapos, hbpos]
  have : 0 < residualCorrected b - residualCorrected a := by
    rw [key]
    exact mul_pos (by linarith) hfac
  linarith

/-! ## (E) ROOT EXISTENCE — IVT over the derived Cut, MirrorRootExistence pattern. -/

/-- The corrected residual is CONTINUOUS: a polynomial in `a` over the derived topological
    ring Cut (banked `isTopologicalRing_cut`). -/
theorem residualCorrected_continuous : Continuous residualCorrected := by
  have h : residualCorrected = fun a : Cut =>
      a * F0Corrected - MirrorFixedPoint.mirrorCoeff * kappaLeading * a ^ 3 - 1 := rfl
  rw [h]
  fun_prop

/-- ★★★ (TARGET 6) THE CORRECTED ROOT EXISTS — IVT on the certified sign change: some
    `a ∈ [aL', aR']` has `residualCorrected a = 0`. -/
theorem corrected_root_exists : ∃ a ∈ Icc aL' aR', residualCorrected a = 0 := by
  have haLR : aL' ≤ aR' := by rw [aL', aR']; norm_num
  have hcont : ContinuousOn residualCorrected (Icc aL' aR') :=
    residualCorrected_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (residualCorrected aL') (residualCorrected aR') :=
    ⟨le_of_lt residualCorrected_neg_at_aL, le_of_lt residualCorrected_pos_at_aR⟩
  obtain ⟨a, ha, haval⟩ := (intermediate_value_Icc haLR hcont) hmem
  exact ⟨a, ha, haval⟩

/-- ★★ THE ROOT IS UNIQUE in `[aL', aR']` — from strict monotonicity. -/
theorem corrected_root_unique {a b : Cut}
    (ha : a ∈ Icc aL' aR') (hb : b ∈ Icc aL' aR')
    (hra : residualCorrected a = 0) (hrb : residualCorrected b = 0) : a = b := by
  rcases lt_trichotomy a b with h | h | h
  · exact absurd (residualCorrected_strictMono ha.1 hb.2 h)
      (by rw [hra, hrb]; exact lt_irrefl 0)
  · exact h
  · exact absurd (residualCorrected_strictMono hb.1 ha.2 h)
      (by rw [hra, hrb]; exact lt_irrefl 0)

/-! ## (F) THE FIXED-POINT FORM AND THE CERTIFIED LANDING. -/

/-- ★★ (TARGET 7) At a positive root, `1/a = F0Corrected − mirrorCoeff·κ·a²` exactly
    (the fixed-point form, assembled coefficient). -/
theorem root_inverse_form_corrected {a : Cut}
    (hpos : 0 < a) (hroot : residualCorrected a = 0) :
    1 / a = F0Corrected - MirrorFixedPoint.mirrorCoeff * kappaLeading * a ^ 2 := by
  have h : a * F0Corrected - MirrorFixedPoint.mirrorCoeff * kappaLeading * a ^ 3 = 1 := by
    rw [residualCorrected] at hroot; linarith
  have hne : a ≠ 0 := ne_of_gt hpos
  field_simp
  nlinarith [h]

/-- ★★ ANY ROOT IN THE WINDOW LIES IN THE TIGHT SUB-WINDOW `[tL', tR']` — from the tight
    sign change + strict monotonicity (the root cannot sit left of `tL'` or right of `tR'`). -/
theorem corrected_root_in_tight {a : Cut}
    (haL : aL' ≤ a) (haR : a ≤ aR') (hroot : residualCorrected a = 0) :
    tL' ≤ a ∧ a ≤ tR' := by
  constructor
  · by_contra h
    have h' : a < tL' := lt_of_not_ge h
    have htR : tL' ≤ aR' := by rw [tL', aR']; norm_num
    have hmono := residualCorrected_strictMono haL htR h'
    rw [hroot] at hmono
    linarith [residualCorrected_neg_at_tL]
  · by_contra h
    have h' : tR' < a := lt_of_not_ge h
    have htL : aL' ≤ tR' := by rw [tR', aL']; norm_num
    have hmono := residualCorrected_strictMono htL haR h'
    rw [hroot] at hmono
    linarith [residualCorrected_pos_at_tR]

set_option maxHeartbeats 1000000 in
/-- ★★★ (TARGET 8) THE CORRECTED SOLUTION BRACKET — the certified landing: ANY root of the
    corrected residual in `[aL', aR']` satisfies
    `1362138365802/10¹⁰ ≤ 1/a ≤ 1362138365803/10¹⁰`
    (`136.2138365802 ≤ 1/a ≤ 136.2138365803`). From banked brackets alone. -/
theorem solution_bracket_corrected {a : Cut}
    (haL : aL' ≤ a) (haR : a ≤ aR') (hroot : residualCorrected a = 0) :
    (1362138365802 : Cut) / 10000000000 ≤ 1 / a
      ∧ 1 / a ≤ 1362138365803 / 10000000000 := by
  have hapos : (0 : Cut) < a := by
    have h0 : (0 : Cut) < 7341 / 1000000 := by norm_num
    rw [aL'] at haL; linarith
  obtain ⟨htL, htR⟩ := corrected_root_in_tight haL haR hroot
  have hform := root_inverse_form_corrected hapos hroot
  have hF := F0Corrected_bracket
  have hk := kappa_bracket_mirror
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  have htL' : (734139808 : Cut) / 100000000000 ≤ a := by rw [tL'] at htL; exact htL
  have htR' : a ≤ (734139811 : Cut) / 100000000000 := by rw [tR'] at htR; exact htR
  rw [mirrorCoeff_eq] at hform
  constructor
  · rw [hform]
    nlinarith [hF.1, hk.2, hkpos, htR', hapos]
  · rw [hform]
    nlinarith [hF.2, hk.1, hkpos, htL', hapos]

/-! ## (G) THE CAPSTONE. -/

/-- ★★★ (TARGET 9) THE CORRECTED CERTIFIED LANDING — the corrected mirror equation HAS a
    (unique-in-window) solution in `[aL', aR']` and its inverse is certified:
    `1362138365802/10¹⁰ ≤ 1/a★ ≤ 1362138365803/10¹⁰`. Assembled from
    `corrected_root_exists` + `solution_bracket_corrected`. -/
theorem invAlphaCorrected_certified :
    ∃ a ∈ Icc aL' aR', residualCorrected a = 0
      ∧ (1362138365802 : Cut) / 10000000000 ≤ 1 / a
      ∧ 1 / a ≤ 1362138365803 / 10000000000 := by
  obtain ⟨a, ha, haval⟩ := corrected_root_exists
  obtain ⟨hlo, hhi⟩ := solution_bracket_corrected ha.1 ha.2 haval
  exact ⟨a, ha, haval, hlo, hhi⟩

/-- ★ W8 TEETH: the landing sits strictly BELOW the corrected bare F0 — the mirror
    correction is genuine, downward, and one-law. -/
theorem corrected_mirror_strictly_lowers {a : Cut}
    (haL : aL' ≤ a) (hroot : residualCorrected a = 0) :
    1 / a < F0Corrected := by
  have hapos : (0 : Cut) < a := by
    have h0 : (0 : Cut) < 7341 / 1000000 := by norm_num
    rw [aL'] at haL; linarith
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  have hmcpos : (0 : Cut) < MirrorFixedPoint.mirrorCoeff := by
    rw [mirrorCoeff_eq]; norm_num
  have hform := root_inverse_form_corrected hapos hroot
  have hterm : 0 < MirrorFixedPoint.mirrorCoeff * kappaLeading * a ^ 2 := by positivity
  linarith [hform, hterm]

end
end CorrectedMirrorFixedPoint
end Phys.Algebra
