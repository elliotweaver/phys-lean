import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementCriterion
import Phys.Algebra.ConfinementMassGap
import Phys.Cascade.Octonion
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationCompact
import Phys.Algebra.OctonionJordanTraceFormInvariance

namespace Phys.Algebra.ProbeN413

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

noncomputable section
attribute [local instance] CD.narCD CD.srCD

/-- The common obstruction locus: the associator fails somewhere on `O ℚ`. -/
def GatherFailsO : Prop :=
  ∃ a b c : O ℚ, assoc a b c ≠ 0

-- P1: confinement instance ⟺ locus nonempty
example : SectorConfines (O ℚ) ↔ GatherFailsO := by
  rw [confines_iff_not_assoc]
  unfold SectorAssoc GatherFailsO assoc
  push_neg
  constructor
  · rintro ⟨a,b,c,h⟩; exact ⟨a,b,c, sub_ne_zero.mpr h⟩
  · rintro ⟨a,b,c,h⟩; exact ⟨a,b,c, fun he => h (sub_eq_zero.mpr he)⟩

-- P2: cascade stop ⟺ locus nonempty
example : (¬ ∀ x y z : O ℚ, (x * y) * z = x * (y * z)) ↔ GatherFailsO := by
  unfold GatherFailsO assoc
  push_neg
  constructor
  · rintro ⟨a,b,c,h⟩; exact ⟨a,b,c, sub_ne_zero.mpr h⟩
  · rintro ⟨a,b,c,h⟩; exact ⟨a,b,c, fun he => h (sub_eq_zero.mpr he)⟩

-- P3: curvature (non-gluing of a pair) ⟺ locus at that pair
example (a b : O ℚ) : (¬ WorldsGlue a b) ↔ ∃ x, assoc a b x ≠ 0 := by
  rw [flat_iff_curvature_zero]
  push_neg
  rfl

-- P4: locus nonempty (from banked witness)
example : GatherFailsO :=
  ⟨_, _, _, assoc_nonvanishing⟩

theorem reQ_sub' (a b : O ℚ) : reQ (a - b) = reQ a - reQ b := by
  rw [sub_eq_add_neg, reQ_add, reQ_neg, ← sub_eq_add_neg]

-- P5 CP: the associator's REAL channel always gathers (θ̄=0), imaginary channel obstructed
example (a b c : O ℚ) : reQ (assoc a b c) = 0 := by
  unfold assoc
  rw [reQ_sub', reQ_mul_assoc3, sub_self]

-- P6 CP together: real gathers everywhere, but the whole associator is nonzero on O
example : (∀ a b c : O ℚ, reQ (assoc a b c) = 0) ∧ (∃ a b c : O ℚ, assoc a b c ≠ 0) := by
  refine ⟨fun a b c => ?_, ⟨_, _, _, assoc_nonvanishing⟩⟩
  unfold assoc
  rw [reQ_sub', reQ_mul_assoc3, sub_self]

end
end Phys.Algebra.ProbeN413
