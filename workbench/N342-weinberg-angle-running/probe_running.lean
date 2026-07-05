import Phys.Algebra.FineStructureRunningCoupling
import Phys.Algebra.OneCouplingCoherence
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

/-! ## (1) Grounded depths over the derived ℝ Cut. -/

/-- Isospin matter depth Tr(T3²)=2, cast from the banked N318 isospin trace. -/
def isoDepth : Cut :=
  ((isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
      (∑ i : Fin 2, (fund2Weight i) ^ 2) : ℚ) : Cut)

theorem isoDepth_eq : isoDepth = 2 := by
  unfold isoDepth
  rw [generation_isospin_trace]
  norm_num

/-- Hypercharge matter depth Tr(Y²)=Tr(Q²)−Tr(T3²)=16/3−2=10/3, from banked N317/N318 traces. -/
def hyperDepth : Cut :=
  ((ladderChargeTrace (Module.finrank ℚ Uhol) : ℚ) : Cut) - isoDepth

theorem hyperDepth_eq : hyperDepth = 10 / 3 := by
  unfold hyperDepth isoDepth
  rw [generation_charge_trace, generation_isospin_trace]
  norm_num

/-- ★ THE LOAD-BEARING PROPORTIONALITY: the matter trace ratio Tr(Y²):Tr(T3²) = (10/3):2 EQUALS
    the GUT intercept ratio 5/3. This is WHY matter alone does not run the mixing. -/
theorem depth_proportional : hyperDepth = (5 / 3) * isoDepth := by
  rw [hyperDepth_eq, isoDepth_eq]; norm_num

theorem isoDepth_pos : 0 < isoDepth := by rw [isoDepth_eq]; norm_num
theorem hyperDepth_pos : 0 < hyperDepth := by rw [hyperDepth_eq]; norm_num

/-! ## (2) GUT-normalized high-scale intercepts. -/

/-- Isospin high-scale inverse coupling 1/α₂(M)=1/α*=42 (banked N341/N316). -/
def invAlpha2High : Cut := invAlphaHigh
/-- GUT-normalized hypercharge high-scale inverse coupling 1/α_Y(M)=(5/3)·(1/α*)=70. -/
def invAlphaYHigh : Cut := (5 / 3) * invAlphaHigh

theorem invAlpha2High_eq : invAlpha2High = 42 := invAlphaHigh_eq
theorem invAlphaYHigh_eq : invAlphaYHigh = 70 := by
  unfold invAlphaYHigh; rw [invAlphaHigh_eq]; norm_num

/-- The GUT unification boundary condition: the high-scale ratio is 5/3. -/
theorem intercept_proportional : invAlphaYHigh = (5 / 3) * invAlpha2High := rfl

/-! ## (3) The running couplings, ratio, and mixing. -/

/-- Running isospin inverse coupling with (possibly non-abelian-reduced) depth d₂. -/
def invAlpha2 (d2 κ M μ : Cut) : Cut := invAlpha2High + κ * d2 * cutLog (M / μ)
/-- Running hypercharge inverse coupling (abelian: depth = matter hyperDepth). -/
def invAlphaY (κ M μ : Cut) : Cut := invAlphaYHigh + κ * hyperDepth * cutLog (M / μ)
/-- The running weak mixing sin²θ_W = a₂/(a₂+a_Y) = 1/(1+r), r = a_Y/a₂ (the N319 mixing form). -/
def sinSqRun (d2 κ M μ : Cut) : Cut :=
  invAlpha2 d2 κ M μ / (invAlpha2 d2 κ M μ + invAlphaY κ M μ)

/-! ## (4) The landings. -/

/-- ★ AT THE OCTONION SCALE μ=M, sin²θ_W = 3/8 (42/(42+70)). -/
theorem sinSqRun_at_high (d2 κ M : Cut) (hM : M ≠ 0) : sinSqRun d2 κ M M = 3 / 8 := by
  unfold sinSqRun invAlpha2 invAlphaY
  rw [div_self hM, cutLog_one, invAlpha2High_eq, invAlphaYHigh_eq]
  norm_num

/-- ★ Tie the high-scale value to the BANKED N319 mixing oneCouplingMixing (5/3) = 3/8. -/
theorem sinSqRun_high_eq_banked_mixing (d2 κ M : Cut) (hM : M ≠ 0) :
    sinSqRun d2 κ M M = ((oneCouplingMixing (5 / 3) : ℚ) : Cut) := by
  rw [sinSqRun_at_high d2 κ M hM, oneCouplingMixing_at_5_3]; norm_num

/-- The proportionality of the running couplings at matter depth: a_Y = (5/3)·a₂. -/
theorem invAlphaY_eq_matter : ∀ κ M μ : Cut,
    invAlphaY κ M μ = (5 / 3) * invAlpha2 isoDepth κ M μ := by
  intro κ M μ
  unfold invAlphaY invAlpha2
  rw [intercept_proportional, depth_proportional]; ring

/-- ★★★ MATTER-ONLY STATIONARITY: with the matter isospin depth d₂ = isoDepth = 2, sin²θ_W = 3/8
    at ALL scales — matter alone does NOT run the mixing (the (10/3):2 = 5/3 proportionality). -/
theorem sinSqRun_matter_stationary (κ M μ : Cut) (h2 : invAlpha2 isoDepth κ M μ ≠ 0) :
    sinSqRun isoDepth κ M μ = 3 / 8 := by
  unfold sinSqRun
  rw [invAlphaY_eq_matter]
  have hne : invAlpha2 isoDepth κ M μ + (5 / 3) * invAlpha2 isoDepth κ M μ ≠ 0 := by
    have h : invAlpha2 isoDepth κ M μ + (5 / 3) * invAlpha2 isoDepth κ M μ
        = (8 / 3) * invAlpha2 isoDepth κ M μ := by ring
    rw [h]; exact mul_ne_zero (by norm_num) h2
  rw [div_eq_iff hne]; ring

/-- ★★★ THE DEPARTURE (toward 0.231): with the non-abelian-reduced isospin depth 0 < d₂ < isoDepth
    (=2) below the octonion scale (0<μ<M, κ>0), sin²θ_W STRICTLY DROPS below 3/8. The SIGN is forced
    by d₂ < isoDepth (non-abelian anti-screening) with κ·cutLog(M/μ) > 0. -/
theorem sinSqRun_departs_down (d2 κ M μ : Cut) (hκ : 0 < κ) (hd2 : 0 < d2)
    (hd2lt : d2 < isoDepth) (hμ : 0 < μ) (hμM : μ < M) :
    sinSqRun d2 κ M μ < 3 / 8 := by
  have hL : 0 < cutLog (M / μ) := cutLog_pos (by rw [one_lt_div hμ]; exact hμM)
  have hd2lt2 : d2 < 2 := by rw [isoDepth_eq] at hd2lt; exact hd2lt
  have key : 5 * invAlpha2 d2 κ M μ - 3 * invAlphaY κ M μ < 0 := by
    unfold invAlpha2 invAlphaY
    rw [invAlpha2High_eq, invAlphaYHigh_eq, hyperDepth_eq]
    have hexpand :
        5 * (42 + κ * d2 * cutLog (M / μ)) - 3 * (70 + κ * (10 / 3) * cutLog (M / μ))
          = 5 * κ * cutLog (M / μ) * (d2 - 2) := by ring
    rw [hexpand]
    have hpos : 0 < 5 * κ * cutLog (M / μ) := by
      have := mul_pos (mul_pos (by norm_num : (0:Cut) < 5) hκ) hL; exact this
    have hd : d2 - 2 < 0 := by linarith
    exact mul_neg_of_pos_of_neg hpos hd
  have hsum : 0 < invAlpha2 d2 κ M μ + invAlphaY κ M μ := by
    unfold invAlpha2 invAlphaY
    rw [invAlpha2High_eq, invAlphaYHigh_eq, hyperDepth_eq]
    have h1 : 0 < κ * d2 * cutLog (M / μ) := mul_pos (mul_pos hκ hd2) hL
    have h2 : 0 < κ * (10 / 3) * cutLog (M / μ) := mul_pos (mul_pos hκ (by norm_num)) hL
    linarith
  unfold sinSqRun
  rw [div_lt_iff₀ hsum]
  nlinarith [key]

/-- CAPSTONE — the running weak mixing reading. -/
theorem weinberg_running_reading (κ M μ : Cut) (hκ : 0 < κ) (hμ : 0 < μ) (hμM : μ < M)
    (h2 : invAlpha2 isoDepth κ M μ ≠ 0) :
    sinSqRun isoDepth κ M M = 3 / 8 ∧
    sinSqRun isoDepth κ M μ = 3 / 8 ∧
    (∀ d2 : Cut, 0 < d2 → d2 < isoDepth → sinSqRun d2 κ M μ < 3 / 8) :=
  ⟨sinSqRun_at_high isoDepth κ M (ne_of_gt (lt_trans hμ hμM)),
   sinSqRun_matter_stationary κ M μ h2,
   fun d2 hd2 hd2lt => sinSqRun_departs_down d2 κ M μ hκ hd2 hd2lt hμ hμM⟩

/-! ## (5) W8 teeth. -/

theorem isoDepth_ne_zero : isoDepth ≠ 0 := by rw [isoDepth_eq]; norm_num
theorem hyperDepth_ne_zero : hyperDepth ≠ 0 := by rw [hyperDepth_eq]; norm_num
/-- The depths are genuinely DISTINCT: hyperDepth = 10/3 ≠ 2 = isoDepth. -/
theorem depths_distinct : hyperDepth ≠ isoDepth := by rw [hyperDepth_eq, isoDepth_eq]; norm_num
/-- The high-scale mixing is genuinely 3/8, NOT the wrong 1/4. -/
theorem sinSqHigh_ne_wrong (d2 κ M : Cut) (hM : M ≠ 0) : sinSqRun d2 κ M M ≠ 1 / 4 := by
  rw [sinSqRun_at_high d2 κ M hM]; norm_num
/-- ★ The departure SIGN is load-bearing: the departure quantity 5a₂−3a_Y is strictly negative
    precisely because d₂ < isoDepth (with κ·cutLog>0). A depth d₂ ≥ isoDepth would NOT depart down. -/
theorem departure_needs_reduced_depth (d2 κ M μ : Cut) (hκ : 0 < κ) (hμ : 0 < μ) (hμM : μ < M)
    (hd2lt : d2 < isoDepth) :
    5 * invAlpha2 d2 κ M μ - 3 * invAlphaY κ M μ < 0 := by
  have hL : 0 < cutLog (M / μ) := cutLog_pos (by rw [one_lt_div hμ]; exact hμM)
  have hd2lt2 : d2 < 2 := by rw [isoDepth_eq] at hd2lt; exact hd2lt
  unfold invAlpha2 invAlphaY
  rw [invAlpha2High_eq, invAlphaYHigh_eq, hyperDepth_eq]
  have hexpand :
      5 * (42 + κ * d2 * cutLog (M / μ)) - 3 * (70 + κ * (10 / 3) * cutLog (M / μ))
        = 5 * κ * cutLog (M / μ) * (d2 - 2) := by ring
  rw [hexpand]
  have hpos : 0 < 5 * κ * cutLog (M / μ) := mul_pos (mul_pos (by norm_num) hκ) hL
  exact mul_neg_of_pos_of_neg hpos (by linarith)

end

end Phys.Algebra
