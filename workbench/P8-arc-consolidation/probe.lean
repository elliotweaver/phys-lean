import Phys.Algebra.ParameterFreeCertificate
import Mathlib.Tactic

namespace Probe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Phys.Algebra.FoldPhase
open Phys.Algebra.Gear

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## §1 — THE SELF-BLIND COUNT thread + multi-node teeth. -/

-- P6 teeth: the wrong count 2 fails to close the triality cycle.
theorem trialityHom_gcyc_sq_ne_one : trialityHom gcyc ^ 2 ≠ 1 := by
  rw [← trialityHom.map_pow]
  intro h
  have hg : gcyc ^ 2 = 1 := trialityHom_injective (by rw [h, trialityHom.map_one])
  exact absurd hg (by decide)

-- positive: the ONE count reads three arc-P sectors (P3 anomaly, P4 mixing, P6 triality).
theorem selfblind_count_reads_three_sectors :
    su2MixedCoeff (Module.finrank ℚ Uhol) (Module.finrank ℚ singlet) = 0
    ∧ weinberg (1 * isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
          (∑ i : Fin 2, (fund2Weight i) ^ 2))
        (1 * ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 / 8
    ∧ trialityHom gcyc ^ (Module.finrank ℚ Uhol) = 1 :=
  ⟨su2_mixed_anomaly_cancels,
   weinberg_normalization_forced 1 (by norm_num),
   by rw [finrank_Uhol]; exact trialityHom_gcyc_order3⟩

-- multi-node teeth: the SAME wrong count 2 breaks BOTH P3 and P6.
theorem wrong_count_breaks_anomaly_and_triality :
    su2MixedCoeff 2 (Module.finrank ℚ singlet) ≠ 0
    ∧ trialityHom gcyc ^ 2 ≠ 1 :=
  ⟨su2_mixed_anomaly_wrong_colour, trialityHom_gcyc_sq_ne_one⟩

/-! ## §2 — THE FOLD-TURN thread: the mass scale routes through the fold turn. -/

theorem massScale_through_fold_turn :
    Phys.Algebra.AbsMass.massScale
      = cutExp (-(azimuthalTurn * ((1 / alphaStar : ℚ) : Cut) / (comarkCount : Cut)))
          * ((cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3)) := by
  have hmr : minimalWrapRatio
      = cutExp (-(azimuthalTurn * ((1 / alphaStar : ℚ) : Cut) / (comarkCount : Cut))) := by
    unfold minimalWrapRatio; rw [minimalWrap_exponent]
  rw [Phys.Algebra.Reckoning.massScale_anchored_on_wrap, hmr]

/-! ## §3 — TWO DISTINCT DERIVED DIMENSIONS. -/

theorem two_derived_counts_distinct :
    Module.finrank ℚ spaceSub ≠ Module.finrank ℚ Uhol := by
  rw [finrank_spaceSub, finrank_Uhol]; decide

end

end Probe
