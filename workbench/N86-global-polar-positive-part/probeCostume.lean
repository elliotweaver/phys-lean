import Phys.Algebra.LorentzContinuumPolarPositive

namespace CostumeProbe

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

theorem mixB_singleton_orth :
    ∀ i j : Fin 1, EvC ((![mixB] : Fin 1 → STVC) i) ((![mixB] : Fin 1 → STVC) j)
      = if i = j then 1 else 0 := by
  intro i j
  fin_cases i
  fin_cases j
  simp only [Matrix.cons_val_fin_one]
  rw [mixB_norm]; rfl

theorem squared_funext :
    (fun i => (![(6:Cut)] i) * (![(6:Cut)] i)) = (![(36:Cut)] : Fin 1 → Cut) := by
  funext i; fin_cases i; norm_num

-- CORRECT: the square reads eigenvalue 36 on mixB.
theorem correct_square_eigenvalue :
    EvC (((specOpN ![(6:Cut)] ![mixB]).comp (specOpN ![(6:Cut)] ![mixB])) mixB) mixB = 36 := by
  rw [specOpN_comp mixB_singleton_orth, squared_funext]
  show EvC (specOpN ![(36:Cut)] ![mixB] ((![mixB] : Fin 1 → STVC) 0)) ((![mixB] : Fin 1 → STVC) 0) = 36
  rw [specOpN_read mixB_singleton_orth 0]
  norm_num

-- WRONG: claim the square reads eigenvalue 9 → 36 = 9.
theorem wrong_sqrt_eigenvalue_BOGUS :
    EvC (((specOpN ![(6:Cut)] ![mixB]).comp (specOpN ![(6:Cut)] ![mixB])) mixB) mixB = 9 := by
  rw [specOpN_comp mixB_singleton_orth, squared_funext]
  show EvC (specOpN ![(36:Cut)] ![mixB] ((![mixB] : Fin 1 → STVC) 0)) ((![mixB] : Fin 1 → STVC) 0) = 9
  rw [specOpN_read mixB_singleton_orth 0]
  show (36:Cut) = 9

end

end CostumeProbe
