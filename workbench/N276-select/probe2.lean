import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Winert = span{e4O, e5O}, Wactive = span{e2O,e3O,e6O,e7O}
noncomputable def Winert : Submodule ℚ (O ℚ) := Submodule.span ℚ (Set.range (![e4O, e5O] : Fin 2 → O ℚ))
noncomputable def Wactive : Submodule ℚ (O ℚ) := Submodule.span ℚ (Set.range (![e2O, e3O, e6O, e7O] : Fin 4 → O ℚ))

-- G4a: finrank Winert = 2 (need independence of {e4O,e5O})
example : LinearIndependent ℚ (![e4O, e5O] : Fin 2 → O ℚ) := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero] at hg
  have h4 := congrArg c4 hg
  have h5 := congrArg c5 hg
  simp only [e4O, e5O, c4, c5, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h4 h5
  intro i; fin_cases i <;> simp_all

example : Module.finrank ℚ Winert = 2 := by
  rw [Winert, finrank_span_eq_card]
  · simp
  · rw [Fintype.linearIndependent_iff]
    intro g hg
    simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
      Matrix.cons_val_succ, add_zero] at hg
    have h4 := congrArg c4 hg
    have h5 := congrArg c5 hg
    simp only [e4O, e5O, c4, c5, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h4 h5
    intro i; fin_cases i <;> simp_all

end Phys.Algebra
