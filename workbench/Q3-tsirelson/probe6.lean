import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Composite

namespace Phys.Quantum.Q3Probe
open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

noncomputable def chsh (a1 a2 b1 b2 : StateFibre) : Cut :=
  bornForm a1 b1 + bornForm a1 b2 + bornForm a2 b1 - bornForm a2 b2

theorem sqrt2_sq : sqrt2 * sqrt2 = (2 : Cut) := by
  rw [sqrt2_mul_sqrt2]
  have h1 : (1 : Cut) = Qcut 1 := rfl
  have : Qcut (1+1) = Qcut 1 + Qcut 1 := (Qcut_add 1 1).symm
  rw [show (2:Q) = 1 + 1 by norm_num, this, ← h1]; norm_num

theorem two_ssq : 2 * ((pinv zero_lt_sqrt2) * (pinv zero_lt_sqrt2)) = 1 := by
  have hs : sqrt2 * (pinv zero_lt_sqrt2) = 1 := mul_pinv_cancel zero_lt_sqrt2
  rw [← sqrt2_sq]; nlinarith [hs]

theorem four_s : 4 * (pinv zero_lt_sqrt2) = 2 * sqrt2 := by
  have hs : sqrt2 * (pinv zero_lt_sqrt2) = 1 := mul_pinv_cancel zero_lt_sqrt2
  have hne : sqrt2 ≠ 0 := ne_of_gt zero_lt_sqrt2
  have hmul : sqrt2 * (4 * (pinv zero_lt_sqrt2)) = sqrt2 * (2 * sqrt2) := by
    have h2 : sqrt2 * sqrt2 = 2 := sqrt2_sq
    nlinarith [hs, h2]
  exact mul_left_cancel₀ hne hmul

noncomputable def oa1 : StateFibre := (1, 0)
noncomputable def oa2 : StateFibre := (0, 1)
noncomputable def ob1 : StateFibre := (pinv zero_lt_sqrt2, pinv zero_lt_sqrt2)
noncomputable def ob2 : StateFibre := (pinv zero_lt_sqrt2, -(pinv zero_lt_sqrt2))

theorem sat_units : bornForm oa1 oa1 = 1 ∧ bornForm oa2 oa2 = 1 ∧
    bornForm ob1 ob1 = 1 ∧ bornForm ob2 ob2 = 1 := by
  have hss := two_ssq
  refine ⟨?_,?_,?_,?_⟩ <;>
    simp only [bornForm, oa1, oa2, ob1, ob2] <;> nlinarith [hss]

theorem sat_value : chsh oa1 oa2 ob1 ob2 = 2 * sqrt2 := by
  have h4 := four_s
  simp only [chsh, bornForm, oa1, oa2, ob1, ob2]
  ring_nf
  nlinarith [h4]

end Phys.Quantum.Q3Probe
