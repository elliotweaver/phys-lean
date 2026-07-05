-- ProbeN309 — de-risk the T6 mass-ratio algebra (bounded, W9 MEASURE-FIRST).
-- Theory-native ℚ-exact content: masses = Born squares of the banked genVec;
-- the spectrum is a ZERO-parameter forced cubic — σ1=6M² FORCED (Koide, δ-invariant),
-- the phase enters only through the single amplitude product e3amp. All ℚ-exact.
import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

def massVecP (M A p r : ℚ) : Fin 3 → ℚ := fun k => (genVec M A p r k)^2
def e3ampP (M A p r : ℚ) : ℚ := genVec M A p r 0 * genVec M A p r 1 * genVec M A p r 2

-- (1) grounding.
example (M A p r : ℚ) (k : Fin 3) : massVecP M A p r k = (genVec M A p r k)^2 := rfl

-- (2) Σm = 6M² FORCED on conic + balance (δ-invariant). Reuse parseval.
example (M A p r : ℚ) (h : 3*p^2 + r^2 = 3) (hA : A^2 = 2*M^2) :
    massVecP M A p r 0 + massVecP M A p r 1 + massVecP M A p r 2 = 6*M^2 := by
  have hp := parseval (genVec M A p r)
  have hdc := DCpower_genVec M A p r
  have hcy := cyclepower_genVec M A p r h
  simp only [massVecP]
  rw [hp, hdc, hcy, hA]; ring

-- (3) mass-level Koide 2/3 (= Qkoide genVec, reuse koide_genVec).
example (M A p r : ℚ) (h : 3*p^2+r^2=3) (hM : M ≠ 0) (hA : A^2 = 2*M^2) :
    (massVecP M A p r 0 + massVecP M A p r 1 + massVecP M A p r 2)
      / (genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2)^2 = 2/3 := by
  have := koide_genVec M A p r h hM hA
  unfold Qkoide at this
  simpa [massVecP] using this

-- (4) the middle amplitude symmetric function is FORCED (Koide): e2(a) = (3/2)M².
example (M A p r : ℚ) (h : 3*p^2+r^2=3) (hA : A^2 = 2*M^2) :
    genVec M A p r 0 * genVec M A p r 1 + genVec M A p r 0 * genVec M A p r 2
      + genVec M A p r 1 * genVec M A p r 2 = (3/2)*M^2 := by
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  nlinarith [h, hA]

-- (5) σ2(m) = (9/4)M⁴ − 6M·e3amp  (phase enters ONLY through e3amp). Via e2(a)=(3/2)M².
example (M A p r : ℚ) (h : 3*p^2+r^2=3) (hA : A^2 = 2*M^2) :
    massVecP M A p r 0 * massVecP M A p r 1 + massVecP M A p r 0 * massVecP M A p r 2
      + massVecP M A p r 1 * massVecP M A p r 2
    = (9/4)*M^4 - 6*M*(e3ampP M A p r) := by
  have he2 : genVec M A p r 0 * genVec M A p r 1 + genVec M A p r 0 * genVec M A p r 2
      + genVec M A p r 1 * genVec M A p r 2 = (3/2)*M^2 := by
    simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons]; nlinarith [h, hA]
  have he1 : genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2 = 3*M := by
    have := mean_genVec M A p r; simp only [mean] at this; linarith
  -- e2(m) = e2(a)² − 2 e1(a) e3(a)
  simp only [massVecP, e3ampP]
  nlinarith [he1, he2]

-- (6) σ3(m) = e3amp²  (phase).
example (M A p r : ℚ) :
    massVecP M A p r 0 * massVecP M A p r 1 * massVecP M A p r 2 = (e3ampP M A p r)^2 := by
  simp only [massVecP, e3ampP]; ring

-- (7) NON-VACUITY of phase-dependence: the δ=0 slice is DEGENERATE (two equal masses),
--     a GENERIC phase is NON-DEGENERATE (3 distinct) — the phase controls the spectrum shape.
example (M A : ℚ) : genVec M A 1 0 1 = genVec M A 1 0 2 := by
  simp only [genVec, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons]
  ring
example (M A : ℚ) (hA : A ≠ 0) : genVec M A (1/7) (-12/7) 0 ≠ genVec M A (1/7) (-12/7) 1 := by
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons]
  intro hc; apply hA; linarith
example (M A : ℚ) (hA : A ≠ 0) : genVec M A (1/7) (-12/7) 1 ≠ genVec M A (1/7) (-12/7) 2 := by
  simp only [genVec, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons]
  intro hc; apply hA; linarith

-- (8) the conic point (1/7,-12/7) is genuinely on the phase circle (ℚ-exact, non-degenerate).
example : 3*((1:ℚ)/7)^2 + (-12/7)^2 = 3 := by norm_num

end Phys.Algebra.HJ
