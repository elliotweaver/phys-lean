import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable def Winert : Submodule ℚ (O ℚ) := Submodule.span ℚ (Set.range (![e4O, e5O] : Fin 2 → O ℚ))

-- Uhol = span{e2O,e4O,e6O}, Uah = span{e3O,e5O,e7O}  (from DerivationStabilizerSplit)
-- G6: Winert ⊓ Uhol = span{e4O}.  e4O ∈ both. e5O ∈ Winert but ∉ Uhol (c5 coordinate).
-- Strategy: prove ⊆ via coordinate functionals (any x in the meet has c2=c3=c5=c6=c7=0 forced,
-- leaving x = c4•e4O), ⊇ trivial.

-- First the simplest transversality fact: e5O ∉ Uhol (Winert straddles).
example : e5O ∉ Uhol := by
  intro h
  rw [Uhol, Submodule.mem_span_range_iff_exists_fun] at h
  obtain ⟨g, hg⟩ := h
  have h5 := congrArg c5 hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero, e2O, e4O, e6O, e5O, c5,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h5
  -- h5 should say 1 = 0 (contradiction) or similar
  norm_num at h5

-- e4O ∈ Uhol (it's a generator)
example : e4O ∈ Uhol := by
  rw [Uhol]
  apply Submodule.subset_span
  exact ⟨1, by simp⟩

-- e4O ∈ Winert
example : e4O ∈ Winert := by
  rw [Winert]; apply Submodule.subset_span; exact ⟨0, by simp⟩

end Phys.Algebra
