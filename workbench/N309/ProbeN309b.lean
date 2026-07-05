-- ProbeN309 v2 — nail the two tactic issues (σ2 via symmetric functions; robust indexing).
import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

def massVecP (M A p r : ℚ) : Fin 3 → ℚ := fun k => (genVec M A p r k)^2
def e3ampP (M A p r : ℚ) : ℚ := genVec M A p r 0 * genVec M A p r 1 * genVec M A p r 2

-- reusable: Σamp = 3M (from banked mean_genVec).
theorem e1amp (M A p r : ℚ) : genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2 = 3*M := by
  have := mean_genVec M A p r; simp only [mean] at this; linarith

-- reusable: Σm = 6M² (parseval + banked balance).
theorem sqsum (M A p r : ℚ) (h : 3*p^2+r^2=3) (hA : A^2=2*M^2) :
    (genVec M A p r 0)^2 + (genVec M A p r 1)^2 + (genVec M A p r 2)^2 = 6*M^2 := by
  rw [parseval, DCpower_genVec, cyclepower_genVec _ _ _ _ h, hA]; ring

-- e2(amp) = (3/2)M² FORCED (from e1² = Σamp² + 2e2), no genVec expansion.
theorem e2amp (M A p r : ℚ) (h : 3*p^2+r^2=3) (hA : A^2=2*M^2) :
    genVec M A p r 0 * genVec M A p r 1 + genVec M A p r 0 * genVec M A p r 2
      + genVec M A p r 1 * genVec M A p r 2 = (3/2)*M^2 := by
  have h1 := e1amp M A p r
  have hs := sqsum M A p r h hA
  have hsq : (genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2)^2 = 9*M^2 := by
    rw [h1]; ring
  nlinarith [hsq, hs]

-- σ2(m) = (9/4)M⁴ − 6M·e3amp  (phase enters ONLY via e3amp).
theorem sigma2m (M A p r : ℚ) (h : 3*p^2+r^2=3) (hA : A^2=2*M^2) :
    massVecP M A p r 0 * massVecP M A p r 1 + massVecP M A p r 0 * massVecP M A p r 2
      + massVecP M A p r 1 * massVecP M A p r 2 = (9/4)*M^4 - 6*M*(e3ampP M A p r) := by
  have h1 := e1amp M A p r
  have h2 := e2amp M A p r h hA
  simp only [massVecP, e3ampP]
  nlinarith [h1, h2]

-- Σm = 6M² on masses.
theorem sigma1m (M A p r : ℚ) (h : 3*p^2+r^2=3) (hA : A^2=2*M^2) :
    massVecP M A p r 0 + massVecP M A p r 1 + massVecP M A p r 2 = 6*M^2 := by
  simp only [massVecP]; exact sqsum M A p r h hA

-- σ3(m) = e3amp².
theorem sigma3m (M A p r : ℚ) :
    massVecP M A p r 0 * massVecP M A p r 1 * massVecP M A p r 2 = (e3ampP M A p r)^2 := by
  simp only [massVecP, e3ampP]; ring

-- robust concrete-index non-vacuity (full simp evaluates ![..] i).
theorem deg_delta0 (M A : ℚ) : genVec M A 1 0 1 = genVec M A 1 0 2 := by
  simp [genVec]
theorem distinct01 (M A : ℚ) (hA : A ≠ 0) : genVec M A (1/7) (-12/7) 0 ≠ genVec M A (1/7) (-12/7) 1 := by
  simp only [genVec]; norm_num; intro hc; apply hA; linarith
theorem distinct12 (M A : ℚ) (hA : A ≠ 0) : genVec M A (1/7) (-12/7) 1 ≠ genVec M A (1/7) (-12/7) 2 := by
  simp only [genVec]; norm_num
theorem conic17 : 3*((1:ℚ)/7)^2 + (-12/7)^2 = 3 := by norm_num

end Phys.Algebra.HJ
