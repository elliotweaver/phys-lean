import Phys.Algebra.OctonionJordanGenerationKoide
import Mathlib.Tactic

namespace Phys.Algebra.HJ.ProbeN308

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## L1 — the fixed-point solve (pure ℚ algebra). -/

-- holonomy=statistics equation solve: unique nontrivial root T=(n-1)/n.
theorem born_fixedpoint_solve (n T : ℚ) (hn : n ≠ 0) (hT : T ≠ 0)
    (hfix : n * (T * (1 - T)) = T) : T = (n - 1) / n := by
  have h : T * (n * (1 - T) - 1) = 0 := by ring_nf; ring_nf at hfix; linarith
  rcases mul_eq_zero.mp h with h0 | h1
  · exact absurd h0 hT
  · field_simp
    linarith [h1]

-- the per-edge phase value in general n.
theorem cyclephase_value (n T : ℚ) (hn : n ≠ 0) (hT : T ≠ 0)
    (hfix : n * (T * (1 - T)) = T) : T * (1 - T) = (n - 1) / n ^ 2 := by
  have hTv : T = (n - 1) / n := born_fixedpoint_solve n T hn hT hfix
  rw [hTv]; field_simp; ring

/-! ## L2 — holonomy=statistics IS the banked self-blindness balance (the crux equivalence). -/

-- ⟸ DERIVE the holonomy equation FROM the banked self-blindness balance (the crux; no T≠0 needed).
theorem holonomy_from_selfblind (n T : ℚ)
    (hbal : (1 - T) * (n - 1) + T * (-1) = 0) : n * (T * (1 - T)) = T := by
  -- balance forces n*(1-T) = 1, then n*T*(1-T) = T*(n*(1-T)) = T*1 = T
  have hkey : n * (1 - T) = 1 := by ring_nf; ring_nf at hbal; linarith
  calc n * (T * (1 - T)) = T * (n * (1 - T)) := by ring
    _ = T * 1 := by rw [hkey]
    _ = T := by ring

-- ⟹ converse: the holonomy equation (nontrivial) gives back the balance.
theorem selfblind_from_holonomy (n T : ℚ) (hT : T ≠ 0)
    (hfix : n * (T * (1 - T)) = T) : (1 - T) * (n - 1) + T * (-1) = 0 := by
  have h : T * (n * (1 - T) - 1) = 0 := by ring_nf; ring_nf at hfix; linarith
  rcases mul_eq_zero.mp h with h0 | h1
  · exact absurd h0 hT
  · ring_nf; ring_nf at h1; linarith

/-! ## L3 — operator grounding on banked cycle objects. -/

-- the self-blind seeing operator IS the sum of the two ℤ₃ loop-holonomy powers (forward+backward).
theorem seeMat_eq_cycle_holonomy : seeMat = Pcyc + Pcyc * Pcyc := by
  have h := cyc_sum_Jall
  unfold seeMat
  rw [← h]; abel

-- the loop-holonomy operator has eigenvalue -1 on the cycle mode (banked see_Poth).
theorem cycle_holonomy_on_Poth : (Pcyc + Pcyc * Pcyc) * Poth = (-1 : ℚ) • Poth := by
  rw [← seeMat_eq_cycle_holonomy]; exact see_Poth

-- trace complementarity: trPdem + trPoth = 3.
theorem tr_sum_three : Matrix.trace Pdem + Matrix.trace Poth = 3 := by
  rw [tr_Pdem, tr_Poth]; norm_num

/-! ## L4 — the n=3 landing: δ_B = 2/9 from the banked traces. -/

-- self-seen fraction from banked trace.
theorem selfseen_two_thirds : Matrix.trace Poth / 3 = 2 / 3 := by rw [tr_Poth]

-- democratic fraction.
theorem democratic_third : Matrix.trace Pdem / 3 = 1 / 3 := by rw [tr_Pdem]

-- the banked balance holds for the banked traces (self-blindness on the traces).
theorem selfblind_balance_traces :
    (1 - Matrix.trace Poth / 3) * (3 - 1) + (Matrix.trace Poth / 3) * (-1) = 0 := by
  rw [tr_Poth]; norm_num

-- ★ the self-seen fraction SATISFIES the holonomy fixed point (self-blindness ⟹ holonomy).
theorem selfseen_satisfies_fixedpoint :
    (3 : ℚ) * ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3)) = Matrix.trace Poth / 3 :=
  holonomy_from_selfblind 3 (Matrix.trace Poth / 3) selfblind_balance_traces

-- ★★ THE CRUX LANDING: δ_B = 2/9 (falls out; not asserted).
theorem cyclephase_delta_B :
    (Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3) = 2 / 9 := by
  rw [tr_Poth]; norm_num

-- δ_B as the product of the two banked Born weights (self × other interference).
theorem cyclephase_as_weight_product :
    (Matrix.trace Pdem / 3) * (Matrix.trace Poth / 3) = 2 / 9 := by
  rw [tr_Pdem, tr_Poth]; norm_num

-- via cyclephase_value at n=3, T=2/3 (general-n route lands the same).
theorem cyclephase_via_value :
    (2 / 3 : ℚ) * (1 - 2 / 3) = (3 - 1) / (3:ℚ) ^ 2 := by
  norm_num

theorem delta_B_general_n3 : ((3:ℚ) - 1) / (3:ℚ)^2 = 2 / 9 := by norm_num

/-! ## W8 non-vacuity. -/

theorem cyclephase_not_selfseen : (2 / 9 : ℚ) ≠ 2 / 3 := by norm_num
theorem cyclephase_not_democratic : (2 / 9 : ℚ) ≠ 1 / 3 := by norm_num
-- T=1/2 (a WRONG fraction) does NOT satisfy the holonomy fixed point at n=3.
theorem fixedpoint_excludes_half : (3 : ℚ) * ((1/2) * (1 - 1/2)) ≠ (1/2) := by norm_num
-- the WRONG "phase = self-seen fraction" reading fails.
theorem delta_not_T : (2/9 : ℚ) ≠ (2/3) := by norm_num

end Phys.Algebra.HJ.ProbeN308

section AxCheck
open Phys.Algebra.HJ.ProbeN308
#print axioms born_fixedpoint_solve
#print axioms holonomy_from_selfblind
#print axioms selfblind_from_holonomy
#print axioms seeMat_eq_cycle_holonomy
#print axioms cycle_holonomy_on_Poth
#print axioms selfseen_satisfies_fixedpoint
#print axioms cyclephase_delta_B
#print axioms cyclephase_as_weight_product
end AxCheck
