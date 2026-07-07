import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

namespace Phys.QFT
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD

noncomputable def singletElt (a b : ℚ) : O ℚ := a • (1 : O ℚ) + b • u1

theorem u1_mul_singletElt (a b : ℚ) :
    u1 * singletElt a b = singletElt (-b) a := by
  unfold singletElt
  rw [mul_add, qsmul_mul_right, qsmul_mul_right, mul_one, complexUnit_sq]
  simp only [smul_neg]
  rw [neg_smul, one_smul]  -- b • (1:O) ... hmm need b•(-1)? 
  sorry
end Phys.QFT
