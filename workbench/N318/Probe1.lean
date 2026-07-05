import Phys.Algebra.ChiralGenerationChargeTrace
import Mathlib.Tactic

open scoped BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

-- PROBE 1: banked colour + singlet finranks accessible?
example : Module.finrank ℚ Uhol = 3 := finrank_Uhol
example : Module.finrank ℚ singlet = 1 := finrank_singlet

-- PROBE 2: the fundamental-2 weight system w = (1/2, -1/2).
def fund2Weight : Fin 2 → ℚ := ![1/2, -1/2]

example : (∑ i : Fin 2, fund2Weight i) = 0 := by
  simp [Fin.sum_univ_two, fund2Weight]; norm_num
example : fund2Weight 0 - fund2Weight 1 = 1 := by
  simp [fund2Weight]; norm_num
example : (∑ i : Fin 2, (fund2Weight i)^2) = 1/2 := by
  simp [Fin.sum_univ_two, fund2Weight]; norm_num

-- PROBE 2b: UNIQUENESS — any traceless gap-1 Fin 2 weight system has square-sum 1/2.
example (w : Fin 2 → ℚ) (htl : w 0 + w 1 = 0) (hgap : w 0 - w 1 = 1) :
    (∑ i : Fin 2, (w i)^2) = 1/2 := by
  have h0 : w 0 = 1/2 := by linarith
  have h1 : w 1 = -1/2 := by linarith
  rw [Fin.sum_univ_two, h0, h1]; norm_num

-- PROBE 3: isospinTrace(count) = count · (1/2); grounded to colour finranks = 2.
def isospinTrace (count : ℕ) : ℚ := (count : ℚ) * (1/2)

example : isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet) = 2 := by
  rw [finrank_Uhol, finrank_singlet]; unfold isospinTrace; norm_num

-- PROBE 4: Tr(Y·T3)=0 forced by tracelessness alone (ANY per-doublet Y).
example (y : ℚ) : (∑ i : Fin 2, y * fund2Weight i) = 0 := by
  rw [← Finset.mul_sum]
  have : (∑ i : Fin 2, fund2Weight i) = 0 := by
    simp [Fin.sum_univ_two, fund2Weight]; norm_num
  rw [this, mul_zero]

-- PROBE 5: THE LANDINGS via rw into the banked N317 assembly.
example : hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
    (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)) = 5/3 := by
  have h : isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet) = 2 := by
    rw [finrank_Uhol, finrank_singlet]; unfold isospinTrace; norm_num
  rw [h]; exact assembly_delivers_5_3

example : weinberg (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet))
    (ladderChargeTrace (Module.finrank ℚ Uhol)) = 3/8 := by
  have h : isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet) = 2 := by
    rw [finrank_Uhol, finrank_singlet]; unfold isospinTrace; norm_num
  rw [h]; exact weinberg_delivers_3_8

-- PROBE 6: costume certificate 8·sin²θ_W = 3
example : (8 : ℚ) * weinberg (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet))
    (ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 := by
  have h : weinberg (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet))
      (ladderChargeTrace (Module.finrank ℚ Uhol)) = 3/8 := by
    have h2 : isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet) = 2 := by
      rw [finrank_Uhol, finrank_singlet]; unfold isospinTrace; norm_num
    rw [h2]; exact weinberg_delivers_3_8
  rw [h]; norm_num

end Phys.Algebra

-- AXIOM AUDIT
theorem _audit1 (w : Fin 2 → ℚ) (htl : w 0 + w 1 = 0) (hgap : w 0 - w 1 = 1) :
    (∑ i : Fin 2, (w i)^2) = 1/2 := by
  have h0 : w 0 = 1/2 := by linarith
  have h1 : w 1 = -1/2 := by linarith
  rw [Fin.sum_univ_two, h0, h1]; norm_num
theorem _audit2 : isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet) = 2 := by
  rw [finrank_Uhol, finrank_singlet]; unfold isospinTrace; norm_num
#print axioms _audit1
#print axioms _audit2
