import Phys.Algebra.LorentzContinuumTimeFixingResidualSO9

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C202): A BOGUS TIME-FIXING-RESIDUAL / SPATIAL-FORM / SO(9)-RESTRICTION / det-PARITY
-- / JoinedIdQvC CLAIM — "THE TIME-FIXING QvC-ISOMETRY RESIDUAL k FAILS TO RESTRICT TO THE SPATIAL
-- BLOCK / THE x-MOVING WITNESS VIOLATES THE UNIT-SPHERE LAW / THE EvC-FREE SO(9) CLOSURE IS
-- VACUOUS". N170 banks THE TIME-FIXING SPATIAL RESIDUAL CLOSURE (EvC-orthogonality DISSOLVED): a
-- TIME-FIXING QvC-isometry k (k e₀ = e₀) restricts to the spatial block — (k(0,1,0)).1 = 0 — from
-- the INDEFINITE Born form BvC ALONE (linIsom_BvC_preserved, N51), with NO EvC-orthogonality, and
-- such a k whose x-axis moves (v' ≠ 0) with deflated-stabilizer v-block det = 1 is JoinedIdQvC
-- (joinedIdQvC_of_timeFixing_SO9). The W8 witness inflateNinth (3/5)((4/5)•e₂) is a GENUINE
-- x-moving time-fixing QvC-isometry on the UNIT SPHERE: its x-image (0, 3/5, (4/5)•e₂) obeys the
-- unit-sphere law (3/5)² + gFormC((4/5)•e₂)((4/5)•e₂) = 9/25 + (4/5)²·1 = 1 EXACTLY
-- (deflate_witness_norm, e2_gFormC_self = 1).
--   THE BOGUS claim that the unit-sphere read-off (3/5)² + gFormC((4/5)•e₂)((4/5)•e₂) of the
-- x-moving time-fixing witness (a stand-in for ANY wrong time-fixing-residual / spatial-form /
-- SO(9)-restriction / det-parity / JoinedIdQvC value: the residual fails to restrict to the spatial
-- block / the witness leaves the unit sphere / the closure is vacuous) equals 170 forces, after
-- evaluating the genuine read-off (which is exactly 9/25 + 16/25 = 1), the false numeric
-- `(1 : Cut) = 170` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine unit-sphere read-off at the witness
-- (3/5, (4/5)•e₂) is 1, so the claim of 170 is genuinely FALSE (1 ≠ 170 in the derived ordered
-- field Cut, char 0).
--   The false numeric `1 = 170` is DISTINCT from the banked battery (… C199 1=167, C200 1=168,
-- C201 1=169).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/rotation/isometry/time-fixing/spatial/timelike/
-- SO(9)/stabilizer/deflation/unit-sphere/JoinedIdQvC": over the derived ordered field Cut and the
-- terminal algebra O Cut, the value (3/5)² + gFormC((4/5)•e₂)((4/5)•e₂) equals 1; claiming it
-- equals 170 forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the unit-sphere read-off `(3/5)² + gFormC((4/5)•e₂)((4/5)•e₂)` of the x-moving time-fixing
    witness equals `170`. It GENUINELY equals `1` (the unit-sphere law every compact isometry's
    x-image obeys, `deflate_witness_norm`). The WRONG claim that it is `170` (the time-fixing residual
    fails to restrict to the spatial block / the witness leaves the unit sphere / the SO(9) closure is
    vacuous) reduces to the false numeric `(1 : Cut) = 170`, so this must NOT compile. -/
theorem timeFixingResidualSO9_wrong_value_BOGUS :
    ((3:Cut)/5) ^ 2 + gFormC (((4:Cut)/5) • (CD.e2 : O Cut)) (((4:Cut)/5) • (CD.e2 : O Cut))
      = (170 : Cut) := by
  rw [deflate_witness_norm]

end

end Counterexamples
