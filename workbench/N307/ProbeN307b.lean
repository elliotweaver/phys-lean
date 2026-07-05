import Phys.Algebra.OctonionJordanGenerationCycleForm
import Mathlib.Tactic

namespace ProbeN307b

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

-- Explicit shift action: Pcyc.mulVec a permutes (a0,a1,a2) → (a2,a0,a1).
theorem Pcyc_mulVec (a : Fin 3 → ℚ) : Pcyc.mulVec a = ![a 2, a 0, a 1] := by
  funext i
  fin_cases i <;>
    simp [Pcyc, gcyc, Matrix.mulVec, dotProduct, Fin.sum_univ_three, Matrix.of_apply]

theorem cyclepower_Pcyc_inv (a : Fin 3 → ℚ) : cyclepower (Pcyc.mulVec a) = cyclepower a := by
  rw [Pcyc_mulVec, cyclepower_eq, cyclepower_eq]
  simp only [mean, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  ring

theorem Qkoide_Pcyc_inv (a : Fin 3 → ℚ) : Qkoide (Pcyc.mulVec a) = Qkoide a := by
  rw [Pcyc_mulVec, Qkoide, Qkoide]
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  ring

end ProbeN307b
