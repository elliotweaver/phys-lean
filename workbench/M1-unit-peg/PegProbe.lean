import Phys.Algebra.ConfinementHadronicMass
import Phys.Algebra.AbsoluteMassSpectrum
import Mathlib.Tactic

namespace Workbench.M1

open Phys.Algebra Phys.Algebra.AbsMass Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- THE ONE FLAGGED UNIT PEG (convention): a positive derived `Cut` giving the human-unit value of
    the chain's natural closure unit `M_oct := 1`. This is the SINGLE dimensionful convention. -/
structure UnitPeg where
  val : Cut
  pos : 0 < val

/-- The human-readable value of a chain quantity `x` (expressed in units of `M_oct`) under peg `p`. -/
def UnitPeg.human (p : UnitPeg) (x : Cut) : Cut := p.val * x

theorem human_pos (p : UnitPeg) {x : Cut} (hx : 0 < x) : 0 < p.human x :=
  mul_pos p.pos hx

/-- RATIO IS PEG-INVARIANT: the peg cancels in any dimensionless ratio (unconditional). -/
theorem ratio_peg_invariant (p : UnitPeg) (x y : Cut) : p.human x / p.human y = x / y := by
  unfold UnitPeg.human
  exact mul_div_mul_left x y (ne_of_gt p.pos)

/-- Every dimensionless ratio is the SAME under ANY peg — nothing dimensionless moves. -/
theorem ratio_peg_independent (p q : UnitPeg) (x y : Cut) :
    p.human x / p.human y = q.human x / q.human y := by
  rw [ratio_peg_invariant, ratio_peg_invariant]

/-- UNIQUE UP TO UNITS: any two pegs differ by a single global positive constant `c`, the SAME for
    all `x` (nothing else moves). -/
theorem peg_unique_up_to_units (p q : UnitPeg) :
    ∃ c : Cut, 0 < c ∧ ∀ x, q.human x = c * p.human x := by
  refine ⟨q.val / p.val, div_pos q.pos p.pos, ?_⟩
  intro x
  unfold UnitPeg.human
  have hp : p.val ≠ 0 := ne_of_gt p.pos
  field_simp

/-- The banked lepton mass ratio is peg-free and equals the banked N340 ratio. -/
theorem absMass_ratio_peg_invariant (p : UnitPeg) :
    p.human absMass1 / p.human absMass0 = mass1 / mass0 := by
  rw [ratio_peg_invariant]
  unfold absMass1 absMass0
  exact mul_div_mul_left mass1 mass0 (ne_of_gt massScale_pos)

/-- The peg genuinely moves absolute (dimensionful) values — non-vacuity. -/
theorem human_peg_dependent : ∃ p q : UnitPeg, p.human absMass0 ≠ q.human absMass0 := by
  refine ⟨⟨1, one_pos⟩, ⟨2, by norm_num⟩, ?_⟩
  unfold UnitPeg.human
  simp only
  intro h
  have := absMass0_pos
  nlinarith [h, absMass0_pos]

end

end Workbench.M1
