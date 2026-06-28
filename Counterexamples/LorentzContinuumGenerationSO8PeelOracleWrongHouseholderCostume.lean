import Phys.Algebra.LorentzContinuumGenerationSO8PeelOracle

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C156): A BOGUS PEEL-ORACLE / HOUSEHOLDER-REFLECTION CLAIM — "THE HOUSEHOLDER
-- REFLECTION OF THE BORN FORM AT THE BANKED UNIT AXIS ke2je2 DOES NOT NEGATE IT CLEANLY: THE BORN
-- SELF-OVERLAP OF ITS IMAGE READS 123".
-- N124 banks THE PEEL ORACLE CONSTRUCTION — the fixed-subspace-growing Householder reflection
-- houseHolder a := v ↦ v − (2·(gFormC a a)⁻¹·gFormC a v)•a, the local step that DISCHARGES N123's
-- recursion oracle and closes the full octonion-block exhaustion (gFormC_isom_mem_closure: every
-- gFormC-isometry of O Cut is a finite product of Householder reflections). The reflection PRESERVES
-- the Born form (houseHolder_isom), is an INVOLUTION (houseHolder_involutive), FIXES the
-- Born-orthogonal hyperplane (houseHolder_fixes_ortho), and NEGATES the reflecting line
-- (houseHolder_neg_self). W8: at the banked unit-imaginary axis ke2je2 (Born self-overlap 1, so
-- gFormC ke2je2 ke2je2 ≠ 0) the reflection negates it, houseHolder ke2je2 ke2je2 = −ke2je2
-- (houseHolder_witness_neg), so the Born self-overlap of the image is
-- gFormC (−ke2je2) (−ke2je2) = gFormC ke2je2 ke2je2 = 1 (houseHolder_witness_self_overlap).
--   The BOGUS claim that gFormC (houseHolder ke2je2 ke2je2) (houseHolder ke2je2 ke2je2) = 123 (a
-- stand-in for ANY wrong peel-oracle / Householder / fixed-subspace-growth / reflect-back /
-- isometry / involution / operator-topology / Spin(9)-cover claim: the reflection does NOT preserve
-- the Born norm / does NOT negate the line / does NOT reflect the moved image back) forces 1 = 123,
-- and must NOT compile.
--   The bite is a true counterexample, not vacuous: houseHolder_witness_self_overlap is a banked
-- theorem (the image's Born self-overlap GENUINELY is 1 over the derived field), so the costume's
-- claim of 123 is genuinely FALSE.
--   The false numeric `1 = 123` is DISTINCT from the banked battery (… C153 1=117, C154 8=119,
-- C155 8=121).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/reflection/Householder/isometry/oracle/SO(8)/Spin/
-- octonion-block/exhaustion/peel/fixed/hyperplane/negate": over the derived complete ordered field
-- `Cut` and `O Cut := CD(H Cut)`, the map v ↦ v − (2·(gFormC a a)⁻¹·gFormC a v)•a at a := ke2je2
-- sends ke2je2 to −ke2je2, whose gFormC self-overlap equals gFormC ke2je2 ke2je2 = 1; claiming 123
-- forces 1 = 123. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the Born self-overlap of the Householder-reflected image `houseHolder ke2je2 ke2je2`
    (`= −ke2je2`, `houseHolder_witness_neg`) is `gFormC ke2je2 ke2je2 = 1`
    (`houseHolder_witness_self_overlap`). The WRONG claim that it reads `123` (the reflection does
    NOT negate the line / does NOT preserve the Born norm) forces the false numeric `1 = 123`, so
    this must NOT compile. -/
theorem so8_peel_oracle_wrong_householder_BOGUS :
    gFormC (houseHolder (ke2je2 : O Cut) (ke2je2 : O Cut))
           (houseHolder (ke2je2 : O Cut) (ke2je2 : O Cut)) = (123 : Cut) := by
  rw [houseHolder_witness_self_overlap]

end

end Counterexamples
