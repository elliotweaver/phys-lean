import Phys.Algebra.LorentzContinuumGenerationFullSO9Assembly

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C146): A BOGUS FULL-SO(9)-ASSEMBLY / HIGHER-SECTOR COORD CLAIM — "THE GENERAL-AXIS
-- ENLARGED ELEMENT enlargedAxisNinth e₂ u w (5/13)(12/13), APPLIED TO (0,1,0), HAS v-BLOCK WHOSE
-- e₂-COMPONENT gFormC (·) e₂ = 101".
-- N114 banks THE FULL-SO(9) ASSEMBLY THROUGH THE GENERAL-AXIS FAMILY: the NON-DEGENERATE enlarged
-- element enlargedAxisNinth e u w c s := axisRotLin e c s · genTwoPlaneLin u w (where N112's
-- enlargedTwoPlaneNinth = planeRotLin c s · genTwoPlaneLin u w is the DEGENERATE e = 1 slice,
-- planeRotLin = axisRotLin 1, which lands in the SO(8)·A product sector). The general-axis witness
-- moves BOTH x AND a DEEP octonion slot: enlargedAxisNinth e₂ u w c s (0,1,0) = (0, c, s•e₂) — the
-- octonion-block word fixes the zero-v point, the general-axis rotation reads gFormC 0 e₂ = 0 and
-- deposits s•e₂. THE DEEP-SLOT READING: the e₂-component of the moved v-block is gFormC (s•e₂) e₂ =
-- s·gFormC e₂ e₂ = s (enlargedAxisNinth_e2_reads_s). THE COMPLEMENT: the single A-plane element leaves
-- the e₂ slot at 0 (enlargedTwoPlaneNinth_e2_reads_zero, the real-axis plane deposits a 1-component,
-- orthogonal to e₂). THE SEPARATOR: for s ≠ 0 the general-axis witness DIFFERS from EVERY single-A-plane
-- element (reads s vs 0) — strictly beyond the SO(8)·A sector. For the concrete (c,s) = (5/13,12/13)
-- the deep e₂-slot reads 12/13 (enlargedAxisNinth_e2_deep_val), DISTINCT from the 0 of every single
-- A-plane element — the sector separation made concrete. The BOGUS claim that this deep slot reads 101
-- (a stand-in for ANY wrong "the assembly degenerates to SO(8)·A / the general axis cannot reach the
-- deep slot / the witness equals a single-A-plane element / the sector is not strictly higher") forces
-- 12/13 = 101, and must NOT compile.
--   The bite is a true counterexample, not vacuous: enlargedAxisNinth_e2_deep_val is a banked theorem
-- (the general-axis witness's v-block genuinely has e₂-component 12/13, via the proved deposit s•e₂ and
-- gFormC e₂ e₂ = 1), so the coordinate genuinely IS 12/13, and the costume's claim of 101 is genuinely
-- FALSE.
--   The false numeric `12 / 13 = 101` is DISTINCT from the banked battery (… C143 −1=83, C144 3/5=89,
-- C145 4/5=97).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/axis/isometry/compact/orthogonal/word/sector/
-- assembly/generator/2-plane/block/octonion-block/Spin/SO(9)/SO(8)/A-plane/ninth-direction/family/
-- separator": over the derived complete ordered field `Cut` and `O Cut := CD(H Cut)`, the operator
-- axisRotLin e₂ (5/13)(12/13) · (biMulLin w w · biMulLin u u), applied to (0,1,0), has third-coordinate
-- block whose gFormC with e₂ is 12/13; claiming 101 forces 12/13 = 101. The bite is a false NUMERIC,
-- name-independent.

/-- BOGUS: the general-axis enlarged element `enlargedAxisNinth e₂ u w (5/13)(12/13)`, applied to
    `(0,1,0)`, has a `v`-block whose `e₂`-component `gFormC (·) e₂ = 12/13`
    (`enlargedAxisNinth_e2_deep_val`, the general axis reaches the deep slot with coefficient
    `s = 12/13`); the WRONG claim that this deep slot reads `101` (the assembly degenerates / the
    general axis cannot reach the deep slot / the witness equals a single-`A`-plane element) forces the
    false numeric `12 / 13 = 101`, so this must NOT compile. -/
theorem full_so9_assembly_wrong_deep_coord_BOGUS :
    gFormC ((enlargedAxisNinth (CD.e2 : O Cut) (CD.e2 : O Cut) (je2 : O Cut)
        ((5:Cut)/13) ((12:Cut)/13) ((0:Cut), (1:Cut), (0:O Cut))).2.2) (CD.e2 : O Cut)
      = (101 : Cut) := by
  rw [enlargedAxisNinth_e2_deep_val]

end

end Counterexamples
