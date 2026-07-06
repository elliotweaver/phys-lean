import Phys.Algebra.NeutrinoMasslessGeneration
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix
noncomputable section

def muTauMagic (a b c d : Cut) : Matrix (Fin 3) (Fin 3) Cut :=
  !![a, b, b; b, c, d; b, d, c]
def tbmV2 : Fin 3 → Cut := ![1, 1, 1]

-- try full simp reduction of the !![...] mulVec
theorem test_trimaximal (a b c d : Cut) (hmagic : a + b = c + d) :
    (muTauMagic a b c d).mulVec tbmV2 = (a + 2*b) • tbmV2 := by
  funext i
  fin_cases i <;>
    simp only [muTauMagic, tbmV2, Matrix.mulVec, dotProduct, Fin.sum_univ_three,
      Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
      Matrix.empty_val', Matrix.cons_val_fin_one, Pi.smul_apply, smul_eq_mul] <;> linarith [hmagic]

end
end Phys.Algebra
