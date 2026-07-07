import Phys.Algebra.ConfinementAreaLaw
import Phys.Algebra.ConfinementCriterion
import Mathlib.Tactic

/-!
  PROBE 2 (N388 arc-I I4). flat ⟺ zero curvature; singlet flat; no-flat-coloured floor.
-/

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- (d) FLAT (worlds glue) ⟺ curvature (associator) vanishes everywhere.
theorem flat_iff_curv (a b : O ℚ) : WorldsGlue a b ↔ ∀ x, assoc a b x = 0 := by
  unfold WorldsGlue worldMap assoc
  constructor
  · intro h x
    have := congrFun h x
    simp only [Function.comp_apply] at this
    rw [sub_eq_zero]; exact this.symm
  · intro h
    funext x
    simp only [Function.comp_apply]
    have := h x
    rw [sub_eq_zero] at this
    exact this.symm

-- no-flat-coloured: the witness pair is NOT flat (curvature nonzero at x=e₂).
example : ¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) := by
  rw [flat_iff_curv]
  intro h
  exact assoc_nonvanishing (h (CD.e2 : O ℚ))

end
end Phys.Algebra
