import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationCompact
import Phys.Quantum.Unitarity
import Mathlib.Tactic
namespace Phys.QFT
open Phys.Algebra Phys.Cascade Phys.Cascade.CD Phys.Quantum
open Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable def singletElt (a b : ℚ) : O ℚ := a • (1 : O ℚ) + b • u1
noncomputable def dress (a b : ℚ) : StateFibre := ((a : Cut), (b : Cut))

-- frame match
theorem dress_eInward : dress 1 0 = eInward := by unfold dress eInward; push_cast; rfl
theorem dress_eOutward : dress 0 1 = eOutward := by unfold dress eOutward; push_cast; rfl
theorem dress_ne : dress 1 0 ≠ dress 0 1 := by rw [dress_eInward, dress_eOutward]; exact eInward_ne_eOutward
-- unitary conservation on a dressed singlet (fold-phase generator)
theorem asymptotic_conserves (a b : ℚ) :
    bornForm (evolve Dbl.J (dress a b)) (evolve Dbl.J (dress a b))
      = wIn (dress a b) + wOut (dress a b) :=
  unitary_conserves_gather_resolution Dbl.J J_is_unit_phase (dress a b)
-- transported dressed singlet is still a sheaf
theorem asymptotic_stays_sheaf (U : Dbl Cut) (a b : ℚ) :
    totalGather (evolve U (dress a b)) = evolve U (dress a b) := evolve_is_sheaf U (dress a b)
-- singletElt lands in sheafifiable sector; sector sheafifies
theorem singletElt_mem (a b : ℚ) : singletElt a b ∈ Submodule.span ℚ {(1 : O ℚ), u1} := by
  apply Submodule.add_mem
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
theorem asymptotic_worlds_glue (a b c d : ℚ) : WorldsGlue (singletElt a b) (singletElt c d) :=
  singlet_worlds_glue (singletElt_mem a b) (singletElt_mem c d)
end Phys.QFT
