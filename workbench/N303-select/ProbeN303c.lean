import Phys.Algebra.OctonionJordanCubicIsospectral
import Phys.Algebra.OctonionJordanColourCentralizerCoset

namespace Phys.Algebra.HJ.ProbeN303c

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
open Phys.Algebra.HJ

attribute [local instance] CD.narCD CD.srCD

/-! CLEAN FORWARD-LEG COMPLEXIFICATION (no reverse leg): the imaginary mixing coupling is the
    real mixing coupling right-multiplied by the fold-root −u1. -/
theorem kAB_diag_to_imag_mix (t0 t1 t2 : ℚ) :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (-u1 : O ℚ)) := by
  rw [innerMul_slot_diag]; congr 2; rw [star_u1, mul_one]

-- the real (famC) leg (N301):
--   innerMul (slotA 1)(slotB 1)(Dg t) = slotC ((t2-t1)•1)
-- COMPLEXIFICATION: the imaginary coupling = real coupling * (−u1)
theorem imag_coupling_eq_real_times_foldroot (t0 t1 t2 : ℚ) :
    ((t2 - t1) • (-u1 : O ℚ)) = ((t2 - t1) • (1 : O ℚ)) * (-u1) := by
  rw [smul_mul_assoc, one_mul]

/-! Reverse-leg measurement: is kAB(slotC 1) = 0 cheap? -/
set_option maxHeartbeats 800000 in
theorem kAB_slotC_one_test :
    innerMul (slotA (u1:O ℚ)) (slotB 1) (slotC 1) = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  rw [innerMul_apply]
  rw [jb_slotB_slotC, jb_comm (slotA u1) (slotC 1), jb_slotC_slotA]
  sorry

/-! Fold ℂ-core: the imaginary mixing axis u1 is in the colour-neutral core span{1,u1} (N266). -/
theorem u1_in_fold_core : (u1 : O ℚ) ∈ Submodule.span ℚ {(1 : O ℚ), u1} :=
  Submodule.subset_span (by simp)

theorem one_in_fold_core : (1 : O ℚ) ∈ Submodule.span ℚ {(1 : O ℚ), u1} :=
  Submodule.subset_span (by simp)

end Phys.Algebra.HJ.ProbeN303c
