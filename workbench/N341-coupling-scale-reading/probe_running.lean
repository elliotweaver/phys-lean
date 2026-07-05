import Phys.Foundation.ContinuumLog
import Phys.Algebra.FineStructureScaleCoupling
import Phys.Algebra.ChiralGenerationChargeTrace
import Mathlib.Tactic

namespace Phys.Algebra.Probe341

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- cutLog_lt (strict monotone on positives)
theorem cutLog_lt {a b : Cut} (ha : 0 < a) (hab : a < b) : cutLog a < cutLog b := by
  have hb : 0 < b := lt_trans ha hab
  by_contra h
  push_neg at h
  have := cutExp_strictMono.monotone h
  rw [cutExp_cutLog hb, cutExp_cutLog ha] at this
  linarith

-- cutLog_pos via cutLog_lt at (1, y) and cutLog_one
theorem cutLog_pos {y : Cut} (hy : 1 < y) : 0 < cutLog y := by
  have := cutLog_lt (by norm_num : (0:Cut) < 1) hy
  rwa [cutLog_one] at this

-- div manipulation via gcongr
theorem div_test (M μ1 μ2 : Cut) (hM : 0 < M) (h1 : 0 < μ1) (h12 : μ1 < μ2) :
    M / μ2 < M / μ1 := by
  gcongr

-- M/μ > 1 from μ < M
theorem one_lt_test (M μ : Cut) (hμ : 0 < μ) (hμM : μ < M) : 1 < M / μ := by
  rw [one_lt_div hμ]; exact hμM

def chargeTraceDepth : Cut := ((ladderChargeTrace (Module.finrank ℚ Uhol) : ℚ) : Cut)

theorem chargeTraceDepth_eq : chargeTraceDepth = 16 / 3 := by
  unfold chargeTraceDepth
  rw [generation_charge_trace]
  norm_num

theorem chargeTraceDepth_pos : 0 < chargeTraceDepth := by
  rw [chargeTraceDepth_eq]; norm_num

def invAlphaHigh : Cut := ((1 / alphaStar : ℚ) : Cut)

theorem invAlphaHigh_eq : invAlphaHigh = 42 := by
  unfold invAlphaHigh
  rw [inverseAlphaStar_eq_42]
  norm_num

def invAlphaRun (κ M μ : Cut) : Cut := invAlphaHigh + κ * chargeTraceDepth * cutLog (M / μ)

theorem invAlphaRun_at_high (κ M : Cut) (hM : M ≠ 0) :
    invAlphaRun κ M M = invAlphaHigh := by
  unfold invAlphaRun
  rw [div_self hM, cutLog_one]
  ring

theorem invAlphaRun_rate (κ M μ : Cut) :
    invAlphaRun κ M μ = 42 + κ * (16 / 3) * cutLog (M / μ) := by
  unfold invAlphaRun
  rw [invAlphaHigh_eq, chargeTraceDepth_eq]

theorem invAlphaRun_screening (κ M μ : Cut) (hκ : 0 < κ) (hM : 0 < M) (hμ : 0 < μ)
    (hμM : μ < M) : invAlphaHigh < invAlphaRun κ M μ := by
  unfold invAlphaRun
  have h1 : (1 : Cut) < M / μ := by rw [one_lt_div hμ]; exact hμM
  have hlog : 0 < cutLog (M / μ) := cutLog_pos h1
  have hcoeff : 0 < κ * chargeTraceDepth := mul_pos hκ chargeTraceDepth_pos
  have : 0 < κ * chargeTraceDepth * cutLog (M / μ) := mul_pos hcoeff hlog
  linarith

theorem invAlphaRun_strictAntitone_mu (κ M μ1 μ2 : Cut) (hκ : 0 < κ) (hM : 0 < M)
    (h1 : 0 < μ1) (h12 : μ1 < μ2) :
    invAlphaRun κ M μ2 < invAlphaRun κ M μ1 := by
  unfold invAlphaRun
  have h2 : 0 < μ2 := lt_trans h1 h12
  have hdiv : M / μ2 < M / μ1 := by gcongr
  have hpos2 : 0 < M / μ2 := div_pos hM h2
  have hlog : cutLog (M / μ2) < cutLog (M / μ1) := cutLog_lt hpos2 hdiv
  have hcoeff : 0 < κ * chargeTraceDepth := mul_pos hκ chargeTraceDepth_pos
  have := mul_lt_mul_of_pos_left hlog hcoeff
  linarith

-- W8 teeth: antiscreening (wrong sign) would NOT run up; the depth is genuinely 16/3 not 0
theorem chargeTraceDepth_ne_zero : chargeTraceDepth ≠ 0 := by
  rw [chargeTraceDepth_eq]; norm_num

-- if the depth were the WRONG n_c=2 value (=3, not 16/3) the rate differs
theorem chargeTraceDepth_ne_wrong : chargeTraceDepth ≠ 3 := by
  rw [chargeTraceDepth_eq]; norm_num

end

end Phys.Algebra.Probe341
