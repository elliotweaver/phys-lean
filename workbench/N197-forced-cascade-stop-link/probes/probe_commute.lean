import Phys.Algebra.DerivationStabilizerSplit
import Phys.Algebra.DerivationSO4TwoSU2
import Phys.Algebra.DerivationRep7SU2TBranching
import Mathlib.Tactic

open Phys.Cascade
namespace Phys.Algebra

-- JO is ℚ-linear: O ℚ →ₗ[ℚ] O ℚ ; innerDeriv/leftImDeriv are ℤ-linear (additive).
-- Both are additive endos of O ℚ. Compute the additive commutator on witnesses.

-- u1 = iotaO hI? check coordinates: u1 = ⟨⟨⟨0,1⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩
-- The colour complex structure JO z = u1 * z.

-- PROBE A: does JO commute with the isospin generator innerDeriv hI on the singlet u1?
example : JO ((innerDeriv hI) u1) = (innerDeriv hI) (JO u1) := by
  show u1 * ((innerDeriv hI) u1) = (innerDeriv hI) (u1 * u1)
  sorry

-- PROBE B: commutator on e2O (a colour-3 direction).
example : JO ((innerDeriv hI) e2O) = (innerDeriv hI) (JO e2O) := by
  sorry

-- PROBE C: leftImDeriv hI version on u1.
example : JO ((leftImDeriv hI) u1) = (leftImDeriv hI) (JO u1) := by
  sorry

end Phys.Algebra
