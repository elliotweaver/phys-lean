import Phys.Algebra.NeutrinoMasslessGeneration
import Phys.Algebra.GenerationMixingAnglesNumeric
import Mathlib.Tactic

/-! PROBE2 N371 — FULL tri-bimaximal PMNS from magic + μτ symmetry (all with simp<;>linarith). -/

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix
noncomputable section

def muTauMagic (a b c d : Cut) : Matrix (Fin 3) (Fin 3) Cut :=
  !![a, b, b; b, c, d; b, d, c]
def tbmV1 : Fin 3 → Cut := ![2, -1, -1]
def tbmV2 : Fin 3 → Cut := ![1, 1, 1]
def tbmV3 : Fin 3 → Cut := ![0, 1, -1]

theorem tbmV2_eq_selfDir : tbmV2 = selfDir := rfl

theorem muTauMagic_eigvec_trimaximal (a b c d : Cut) (hmagic : a + b = c + d) :
    (muTauMagic a b c d).mulVec tbmV2 = (a + 2*b) • tbmV2 := by
  funext i; fin_cases i <;>
    simp [muTauMagic, tbmV2, Matrix.mulVec, dotProduct, Fin.sum_univ_three] <;> linarith [hmagic]

theorem muTauMagic_eigvec_solar (a b c d : Cut) (hmagic : a + b = c + d) :
    (muTauMagic a b c d).mulVec tbmV1 = (a - b) • tbmV1 := by
  funext i; fin_cases i <;>
    simp [muTauMagic, tbmV1, Matrix.mulVec, dotProduct, Fin.sum_univ_three] <;> linarith [hmagic]

theorem muTauMagic_eigvec_atm (a b c d : Cut) :
    (muTauMagic a b c d).mulVec tbmV3 = (c - d) • tbmV3 := by
  funext i; fin_cases i <;>
    simp [muTauMagic, tbmV3, Matrix.mulVec, dotProduct, Fin.sum_univ_three] <;> ring

theorem tbm_orth_12 : (∑ i, tbmV1 i * tbmV2 i) = (0 : Cut) := by
  simp [tbmV1, tbmV2, Fin.sum_univ_three]; norm_num
theorem tbm_orth_13 : (∑ i, tbmV1 i * tbmV3 i) = (0 : Cut) := by
  simp [tbmV1, tbmV3, Fin.sum_univ_three]
theorem tbm_orth_23 : (∑ i, tbmV2 i * tbmV3 i) = (0 : Cut) := by
  simp [tbmV2, tbmV3, Fin.sum_univ_three]

theorem tbmV1_normSq : (∑ i, tbmV1 i ^ 2) = (6 : Cut) := by
  simp [tbmV1, Fin.sum_univ_three]; norm_num
theorem tbmV2_normSq : (∑ i, tbmV2 i ^ 2) = (3 : Cut) := by
  simp [tbmV2, Fin.sum_univ_three]; norm_num
theorem tbmV3_normSq : (∑ i, tbmV3 i ^ 2) = (2 : Cut) := by
  simp [tbmV3, Fin.sum_univ_three]; norm_num

def wgt (v : Fin 3 → Cut) (α : Fin 3) : Cut := (v α) ^ 2 / (∑ j, v j ^ 2)

theorem reactor_zero : wgt tbmV3 0 = 0 := by
  unfold wgt; rw [tbmV3_normSq]; simp [tbmV3]
theorem atm_maximal_mu : wgt tbmV3 1 = 1/2 := by
  unfold wgt; rw [tbmV3_normSq]; simp [tbmV3]
theorem atm_maximal_tau : wgt tbmV3 2 = 1/2 := by
  unfold wgt; rw [tbmV3_normSq]; simp [tbmV3]
theorem solar_third_e : wgt tbmV2 0 = 1/3 := by
  unfold wgt; rw [tbmV2_normSq]; simp [tbmV2]
theorem v1_e_twothirds : wgt tbmV1 0 = 2/3 := by
  unfold wgt; rw [tbmV1_normSq]; simp [tbmV1]; norm_num

theorem sinSq13_pmns : wgt tbmV3 0 = 0 := reactor_zero
theorem sinSq23_pmns : wgt tbmV3 1 / (1 - wgt tbmV3 0) = 1/2 := by
  rw [reactor_zero, atm_maximal_mu]; norm_num
theorem sinSq12_pmns : wgt tbmV2 0 / (1 - wgt tbmV3 0) = 1/3 := by
  rw [reactor_zero, solar_third_e]; norm_num

theorem pmns_large_vs_ckm :
    Phys.Algebra.GenerationMixingAngles.sinSqMix GenerationMassRatios.mass1 GenerationMassRatios.mass2
      < wgt tbmV2 0 := by
  rw [solar_third_e]
  have h := Phys.Algebra.GenerationMixingAngles.sinSq12_hi
  have : (482 : Cut) / 100000 < 1/3 := by norm_num
  linarith

theorem eigenvalues_distinct :
    (4 + 2*1 : Cut) ≠ (4 - 1) ∧ (4 - 1 : Cut) ≠ (3 - 2) ∧ (4 + 2*1 : Cut) ≠ (3 - 2) := by
  norm_num

theorem trimaximal_massless_witness :
    (muTauMagic 0 0 1 (-1)).mulVec tbmV2 = (0 : Cut) • tbmV2 := by
  have := muTauMagic_eigvec_trimaximal 0 0 1 (-1) (by norm_num); simpa using this

end
end Phys.Algebra
