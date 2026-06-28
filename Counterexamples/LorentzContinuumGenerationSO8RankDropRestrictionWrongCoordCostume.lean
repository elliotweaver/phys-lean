import Phys.Algebra.LorentzContinuumGenerationSO8RankDropRestriction

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C151): A BOGUS RANK-DROP / ORTHOGONAL-COMPLEMENT COORD CLAIM —
-- "THE PEELED AXIS ke2je2 (FIXED BY THE BLOCK ISOMETRY vTwoPlane e₂ je2) HAS BORN SELF-OVERLAP
-- EQUAL TO 113".
-- N119 banks THE RANK-DROP RESTRICTION LEMMA (the octonion-block isometry strand) — the genuine
-- inductive content that makes the global SO(8) octonion-block exhaustion TERMINATE. The Born
-- functional gFormC e · bundled as gFormCRight e has kernel ePerp e (the Born-orthogonal
-- complement), of codimension EXACTLY one for a Born-unit e (ePerp_finrank, rank–nullity); a
-- gFormC-isometry S fixing e maps ePerp e into itself (isom_fixes_mapsTo_ePerp, the rank-DROP,
-- from the banked Born polarization gFormC_polarize), and its restriction stays a gFormC-isometry
-- (isomRestrict_gFormC_isom), so the exhaustion recurses one rank lower. The rank-DROP is
-- NON-VACUOUS: vTwoPlane e₂ je2 is a genuine octonion-block gFormC-isometry (vTwoPlane_gFormC_diag)
-- FIXING the third unit ke2je2 (vTwoPlane_e2je2_fixes_ke2je2), so it restricts to ePerp ke2je2
-- (rankdrop_witness_mapsTo). The peeled axis ke2je2 sits OUTSIDE its own complement because its
-- Born self-overlap is gFormC ke2je2 ke2je2 = 1 (rankdrop_witness_self_overlap / self_not_mem_ePerp)
-- — the codim-1 drop is genuine.
-- The BOGUS claim that this peeled-axis Born self-overlap reads 113 (a stand-in for ANY wrong
-- rank-drop / orthogonal-complement / codimension / restriction / spanning / closure claim: the
-- complement does NOT drop the rank / the axis lies inside its own complement / the isometry does
-- not restrict / the restriction breaks the form) forces 1 = 113, and must NOT compile.
--   The bite is a true counterexample, not vacuous: rankdrop_witness_self_overlap is a banked
-- theorem (ke2je2 genuinely IS a Born-unit, gFormC ke2je2 ke2je2 = 1, so it genuinely sits outside
-- ePerp ke2je2 and the codim-1 drop is real), so the costume's claim of 113 is genuinely FALSE.
--   The false numeric `1 = 113` is DISTINCT from the banked battery (… C147 1=103, C148 3/5=107,
-- C149 1=109, C150 1=111).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/reflection/isometry/SO(8)/rank/drop/
-- restriction/complement/codimension/orthogonal/deflation/peel/stabilizer/Cartan/Spin/generation/
-- octonion-block/overlap/spanning": over the derived complete ordered field `Cut` and
-- `O Cut := CD(H Cut)`, the unit ke2je2 := e₂·je2 (fixed by the block map vTwoPlane e₂ je2) has
-- gFormC ke2je2 ke2je2 = 1; claiming 113 forces 1 = 113. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the peeled axis `ke2je2` — fixed by the genuine block isometry `vTwoPlane e₂ je2`
    (`vTwoPlane_e2je2_fixes_ke2je2`) so the rank-DROP applies (`rankdrop_witness_mapsTo`) — has
    Born self-overlap `gFormC ke2je2 ke2je2 = 1` (`rankdrop_witness_self_overlap`), placing it
    OUTSIDE its own Born-orthogonal complement so the codim-1 drop is genuine; the WRONG claim that
    this peeled-axis self-overlap reads `113` (the complement does not drop the rank / the axis lies
    inside its own complement) forces the false numeric `1 = 113`, so this must NOT compile. -/
theorem so8_rank_drop_restriction_wrong_coord_BOGUS :
    gFormC (ke2je2 : O Cut) (ke2je2 : O Cut) = (113 : Cut) := by
  rw [rankdrop_witness_self_overlap]

end

end Counterexamples
