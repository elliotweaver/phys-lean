/- N316 PROBE — de-risk the A4 α*=1/42 landing before production. Bounded, throwaway. -/
import Phys.Algebra.BornIsometryCompleteness
import Phys.Algebra.InteractionChannelTower
import Mathlib.Tactic

namespace Phys.Algebra.N316Probe

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- α* := the banked per-channel Born weight (N315 couplingWeight). -/
def alphaStar : ℚ := couplingWeight

/-- α* = 1/42 — banked couplingWeight_eq. -/
theorem alphaStar_eq : alphaStar = 1 / 42 := couplingWeight_eq

/-- (channel count)·α* = 1 — banked channels_times_coupling. -/
theorem alphaStar_reciprocal_completeness :
    (imChannelCount (Module.finrank ℚ ImO) : ℚ) * alphaStar = 1 := channels_times_coupling

/-- ★ MARQUEE: 1/α* = channel count. -/
theorem inverseAlphaStar_eq_channelCount :
    1 / alphaStar = (imChannelCount (Module.finrank ℚ ImO) : ℚ) := by
  have h42 : (imChannelCount (Module.finrank ℚ ImO) : ℚ) = 42 := by rw [channels_O]; norm_num
  rw [alphaStar_eq, h42]; norm_num

/-- 1/α* = 42. -/
theorem inverseAlphaStar_eq_42 : 1 / alphaStar = 42 := by
  rw [alphaStar_eq]; norm_num

theorem alphaStar_ne_zero : alphaStar ≠ 0 := by rw [alphaStar_eq]; norm_num
theorem alphaStar_ne_wrong : alphaStar ≠ 1 / 49 := by rw [alphaStar_eq]; norm_num
theorem inverseAlphaStar_ne_wrong : 1 / alphaStar ≠ 49 := by rw [inverseAlphaStar_eq_42]; norm_num

end

end Phys.Algebra.N316Probe
