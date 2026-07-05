import Phys.Algebra.OctonionJordanGenerationCycleForm
import Mathlib.Tactic

namespace ProbeN307

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- δ-family over ℚ: `p = cos δ`, `r = √3·sin δ` (rational conic point). All entries rational. -/
def genVec (M A p r : ℚ) : Fin 3 → ℚ := ![M + A*p, M - A*(p+r)/2, M - A*(p-r)/2]

theorem mean_genVec (M A p r : ℚ) : mean (genVec M A p r) = M := by
  simp [mean, genVec]; ring

theorem DCpower_genVec (M A p r : ℚ) : DCpower (genVec M A p r) = 3 * M ^ 2 := by
  rw [DCpower_eq, mean_genVec]

-- ★ CORE (no constraint): cyclepower = A²(3p²+r²)/2 — pure ring after folding mean.
theorem cyclepower_genVec_core (M A p r : ℚ) :
    cyclepower (genVec M A p r) = A ^ 2 * (3*p^2 + r^2) / 2 := by
  rw [cyclepower_eq, mean_genVec]
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  ring

-- ★ δ-invariance: under the rational conic 3p²+r²=3, cyclepower = (3/2)A².
theorem cyclepower_genVec (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) :
    cyclepower (genVec M A p r) = (3/2) * A ^ 2 := by
  rw [cyclepower_genVec_core, h]; ring

theorem balance_genVec (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) (hA : A ^ 2 = 2 * M ^ 2) :
    DCpower (genVec M A p r) = cyclepower (genVec M A p r) := by
  rw [DCpower_genVec, cyclepower_genVec _ _ _ _ h, hA]; ring

theorem forced_sqrt2_genVec (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) (_hM : M ≠ 0)
    (hbal : DCpower (genVec M A p r) = cyclepower (genVec M A p r)) : A ^ 2 = 2 * M ^ 2 := by
  rw [DCpower_genVec, cyclepower_genVec _ _ _ _ h] at hbal
  linarith

-- ★★ THE T4 LANDING: Q = 2/3 for ALL δ (all conic points).
theorem koide_genVec (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) (hM : M ≠ 0) (hA : A ^ 2 = 2 * M ^ 2) :
    Qkoide (genVec M A p r) = 2 / 3 := by
  apply balance_forces_koide
  · rw [mean_genVec]; exact hM
  · exact balance_genVec M A p r h hA

-- W8 non-vacuity: wrong ratio A²=4M² gives Q=1 (not 2/3), for all δ.
theorem koide_genVec_not_one (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) (hM : M ≠ 0)
    (hA : A ^ 2 = 4 * M ^ 2) : Qkoide (genVec M A p r) = 1 := by
  have hnum : (genVec M A p r 0)^2 + (genVec M A p r 1)^2 + (genVec M A p r 2)^2 = 9 * M^2 := by
    rw [parseval, DCpower_genVec, cyclepower_genVec _ _ _ _ h, hA]; ring
  have hden : (genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2)^2 = 9 * M^2 := by
    have hs : genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2 = 3 * M := by
      simp [genVec]; ring
    rw [hs]; ring
  rw [Qkoide, hnum, hden, div_eq_one_iff_eq]
  positivity

-- Non-vacuity of the family: it is genuinely a family with a real cycle mode (A≠0 ⇒ not all equal).
theorem genVec_moves (M A : ℚ) (hA : A ≠ 0) : genVec M A 1 0 0 ≠ genVec M A 1 0 1 := by
  simp [genVec]; intro hc; apply hA; linarith

-- TIE to banked Pcyc/Poth: cyclepower is invariant under the ℤ₃ shift Pcyc (discrete rotation).
theorem cyclepower_Pcyc_inv (a : Fin 3 → ℚ) :
    cyclepower (Pcyc.mulVec a) = cyclepower a := by
  sorry  -- probe placeholder: measure whether this is cheap; see below

end ProbeN307
