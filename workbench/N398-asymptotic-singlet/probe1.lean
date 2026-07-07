import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationCompact
import Phys.Quantum.Unitarity
import Mathlib.Tactic

namespace Phys.QFT

open Phys.Algebra Phys.Quantum Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

/-- The singlet element (a•1 + b•u1) in the fold's complex line span{1,u1} ⊆ O ℚ. -/
noncomputable def singletElt (a b : ℚ) : O ℚ := a • (1 : O ℚ) + b • u1

/-- singletElt lands in the sheafifiable line. -/
theorem singletElt_mem (a b : ℚ) :
    singletElt a b ∈ Submodule.span ℚ {(1 : O ℚ), u1} := by
  apply Submodule.add_mem
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))

/-- star u1 = -u1 is rfl. -/
theorem star_u1' : star u1 = -u1 := rfl

/-- The octonion Born self-overlap of a singlet is a²+b². -/
theorem gForm_singletElt (a b : ℚ) :
    gForm (singletElt a b) (singletElt a b) = a^2 + b^2 := by
  unfold gForm singletElt
  rw [star_add, star_smul_one]
  have hst : star (b • u1) = b • (-u1) := by rw [star_smul]; rw [star_u1']; rfl
  rw [hst]
  -- now expand (a•1 + b•u1) * (a•1 + b•(-u1))
  simp only [mul_add, add_mul, qsmul_mul_left, qsmul_mul_right, mul_one, one_mul,
    complexUnit_sq, reQ_add, reQ_smul, reQ_neg, reQ_one]
  ring_nf
  sorry

end Phys.QFT
