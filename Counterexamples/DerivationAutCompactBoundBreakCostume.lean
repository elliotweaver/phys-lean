/-
  Counterexamples.DerivationAutCompactBoundBreakCostume — N32 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N32 continuum-free COMPACTNESS SKELETON. N32 banks that an
  automorphism of the terminal Cayley–Dickson algebra `O ℚ` is an ISOMETRY of the orthonormal
  coordinate frame `bO`: each of its coordinate columns is a UNIT vector
  (`aut_col_unit : ∑ i, (coordO (φ (bO j)) i)² = 1`), so every coordinate entry is bounded by `1`
  (`aut_entry_sq_le_one`/`aut_entry_abs_le_one`) — the algebraic skeleton of COMPACTNESS, from the
  definite Born form.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that an automorphism's coordinate
  column is NOT a unit vector — concretely that the column sum of squares equals `2` instead of
  `1`. Applied to a GENUINE automorphism (the identity `1 ∈ AutO`, `isAlgAut_one`) at column
  `j = 0`, the banked `aut_col_unit` rewrites the LHS to `1`, collapsing the bogus claim to
  `1 = 2`, which cannot be discharged. If an automorphism did NOT preserve the Born form — if
  `aut_col_unit` were false or vacuous — this costume would be provable; W8 demands it bite.
  (A column whose squared-norm is not `1` is exactly what is NOT an isometry, the whole content
  of the boundedness/compactness skeleton.)

  The manifest's PASS_SIGNATURE matches the elaboration error below (`⊢ 1 = 2`).
-/
import Phys.Algebra.DerivationAutCompact

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- WRONG: claiming a (genuine) automorphism's coordinate column is NOT a unit vector — that the
    column sum of squares equals `2`. The banked `aut_col_unit` proves it equals `1`, so at the
    identity automorphism (`isAlgAut_one`) and column `j = 0` the claim reduces to `1 = 2`. Must
    FAIL to compile. -/
theorem aut_col_unit_BOGUS :
    ∑ i : Fin 8, (coordO ((1 : O ℚ ≃ₗ[ℚ] O ℚ) (bO 0)) i)^2 = 2 := by
  rw [aut_col_unit isAlgAut_one 0]

end

end Counterexamples
