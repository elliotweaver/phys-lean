import Phys.Algebra.CascadeFoldPhase
import Phys.Algebra.GenerationJarlskogInvariantNumeric
import Phys.Quantum.BornRule
import Mathlib.Tactic

namespace Phys.Algebra.CKMProbe2

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra.GenerationMixingAngles
open Phys.Algebra.GenerationJarlskog

noncomputable section

-- The derived phase element e^{i·θ} = ⟨cutCos θ, cutSin θ⟩ : Dbl Cut  (a genuine derived complex number)
def phaseEl (θ : Cut) : Dbl Cut := ⟨cutCos θ, cutSin θ⟩

@[simp] theorem phaseEl_re (θ : Cut) : (phaseEl θ).re = cutCos θ := rfl
@[simp] theorem phaseEl_im (θ : Cut) : (phaseEl θ).im = cutSin θ := rfl

-- ★ unit modulus over the derived ℂ: |e^{iθ}|² = 1 (the Born self-overlap circle)
theorem phaseEl_normSq (θ : Cut) :
    (phaseEl θ).re * (phaseEl θ).re + (phaseEl θ).im * (phaseEl θ).im = 1 := by
  simp only [phaseEl_re, phaseEl_im]
  have := cutSin_sq_add_cutCos_sq θ; linarith

-- The two-sector diagonal D = diag(1, e^{i2P}, e^{iP}); the Cabibbo-block relative phase is 2P = cutPi/4
def dPhase2 : Dbl Cut := phaseEl (2 * Phys.Algebra.FoldPhase.foldPhase)
def dPhase3 : Dbl Cut := phaseEl Phys.Algebra.FoldPhase.foldPhase

theorem twoP_eq_quarter : (2 : Cut) * Phys.Algebra.FoldPhase.foldPhase = cutPi / 4 := by
  unfold Phys.Algebra.FoldPhase.foldPhase; ring

-- ★ the derived phase's imaginary (CP-odd) Born-weight IS the CP factor = 1/2
def cpFactorDerived : Cut := (dPhase2).im * (dPhase2).im

theorem cpFactorDerived_eq_half : cpFactorDerived = 1 / 2 := by
  unfold cpFactorDerived dPhase2
  simp only [phaseEl_im]
  rw [twoP_eq_quarter]
  have hp := cutSin_sq_add_cutCos_sq (cutPi / 4)
  have hc := Phys.Algebra.FoldPhase.cutCos_quarter_sq
  linarith

-- ★ the derived phase is EXACTLY the CP-balance point: Im² = Re² (self=other, neither real nor pure-imaginary)
theorem cpBalance : (dPhase2).im * (dPhase2).im = (dPhase2).re * (dPhase2).re := by
  unfold dPhase2; simp only [phaseEl_re, phaseEl_im]
  rw [twoP_eq_quarter]
  have hp := cutSin_sq_add_cutCos_sq (cutPi / 4)
  have hc := Phys.Algebra.FoldPhase.cutCos_quarter_sq
  linarith

end

end Phys.Algebra.CKMProbe2
