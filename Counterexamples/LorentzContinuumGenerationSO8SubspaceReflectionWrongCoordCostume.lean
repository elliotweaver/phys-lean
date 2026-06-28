import Phys.Algebra.LorentzContinuumGenerationSO8SubspaceReflection

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C153): A BOGUS SUBSPACE-PRESERVATION / REFLECTION-RESTRICTION COORD CLAIM —
-- "THE V-BLOCK BISECTOR REFLECTION octReflBlock e₂ je2 DOES NOT FIX THE BORN-ORTHOGONAL AXIS
-- ke2je2 / DOES NOT PRESERVE THE COMPLEMENT, ITS FIXED-IMAGE SELF-OVERLAP READING 117".
-- N121 banks THE SUBSPACE-PRESERVING REFLECTION-ON-ePerp — the finrank-recursion crux of the
-- global SO(8) octonion-block exhaustion (the obstruction N120's MEASURE-FIRST finding flagged:
-- "a reflection of two vectors lying inside a subspace W need not preserve W"). The bisector
-- reflection's octonion-block v-block octReflBlock e w := biMulV n n (n := r⁻¹•(e−w)) is a DIAGONAL
-- gFormC-isometry (octReflBlock_gFormC_diag, from biMul_gFormC at the Born-unit bisector
-- octBisector_unit) that FIXES any imaginary axis e₀ Born-orthogonal to the bisector e − w
-- (octReflBlock_fixes_orthogonal, via octRefl_reflect_imag: n·(e₀·n) = (gFormC n n)•e₀ −
-- (2·gFormC e₀ n)•n = e₀, the n-line term vanishing BECAUSE e₀ ⊥ n), and therefore MAPS the
-- Born-orthogonal complement ePerp e₀ INTO itself (octReflBlock_mapsTo_ePerp — N119's
-- isom_fixes_mapsTo_ePerp instantiated) and RESTRICTS to a gFormC-isometry on the codim-1
-- complement (octReflBlockRestrict / octReflBlockRestrict_gFormC_isom — N119's
-- isomRestrict_gFormC_isom instantiated). The fix is NON-VACUOUS: ke2je2 := e₂·je2 is Born-
-- orthogonal to the bisector e₂ − je2 (twoaxis_witness_self_overlap, gFormC ke2je2 (e₂ − je2) = 0),
-- so octReflBlock e₂ je2 FIXES ke2je2 (octReflBlock_witness), and the Born self-overlap of the
-- fixed image reads gFormC (octReflBlock e₂ je2 ke2je2) (octReflBlock e₂ je2 ke2je2) =
-- gFormC ke2je2 ke2je2 = 1 (octReflBlock_witness_self_overlap).
--   The BOGUS claim that this fixed-image self-overlap reads 117 (a stand-in for ANY wrong
-- subspace-preservation / reflection-restriction / finrank-recursion / orthogonal-axis-fixing /
-- complement-invariance / Cut-basis / spanning claim: the reflection does NOT fix the orthogonal
-- axis / does NOT preserve the complement / the descent does NOT stay in the subspace / the
-- finrank-recursion does NOT terminate) forces 1 = 117, and must NOT compile.
--   The bite is a true counterexample, not vacuous: octReflBlock_witness_self_overlap is a banked
-- theorem (octReflBlock e₂ je2 genuinely DOES fix ke2je2, so the fixed-image self-overlap is
-- genuinely 1), so the costume's claim of 117 is genuinely FALSE.
--   The false numeric `1 = 117` is DISTINCT from the banked battery (… C150 1=111, C151 1=113,
-- C152 0=115).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/reflection/isometry/SO(8)/subspace/
-- preservation/complement/finrank/recursion/orthogonal/axis/bisector/restriction/Cartan/Dieudonné/
-- Spin/generation/octonion-block/descent": over the derived complete ordered field `Cut` and
-- `O Cut := CD(H Cut)`, the Cut-linear map octReflBlock e₂ je2 := (v ↦ n·(v·n)) fixes ke2je2 and
-- gFormC (octReflBlock e₂ je2 ke2je2) (octReflBlock e₂ je2 ke2je2) = 1; claiming 117 forces
-- 1 = 117. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the v-block bisector reflection `octReflBlock e₂ je2` FIXES the Born-orthogonal axis
    `ke2je2` (`octReflBlock_witness`, since `ke2je2 ⊥ e₂ − je2`), so the Born self-overlap of the
    fixed image reads `gFormC (octReflBlock e₂ je2 ke2je2) (octReflBlock e₂ je2 ke2je2) = 1`
    (`octReflBlock_witness_self_overlap`) — the subspace-preservation content. The WRONG claim that
    this self-overlap reads `117` (the reflection does NOT fix the orthogonal axis / does NOT
    preserve the complement / the descent leaves the subspace) forces the false numeric `1 = 117`,
    so this must NOT compile. -/
theorem so8_subspace_reflection_wrong_coord_BOGUS :
    gFormC (octReflBlock (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut))
           (octReflBlock (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut)) = (117 : Cut) := by
  rw [octReflBlock_witness_self_overlap]

end

end Counterexamples
