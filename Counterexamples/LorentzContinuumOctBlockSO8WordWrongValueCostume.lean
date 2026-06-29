import Phys.Algebra.LorentzContinuumOctBlockSO8Word

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C191): A BOGUS OCTONION-BLOCK 2-PLANE-ROTATION / LIFT / CAYLEY-PATH / JoinedIdQvC
-- READ-OFF — "THE OCTONION-BLOCK ROTATION GENERATOR octPlaneRot DOES NOT GENUINELY MOVE THE OCTONION
-- AXIS, ITS LIFT octBlockEndC IS NOT A QvC-ISOMETRY FIXING TIME AND x, THE CAYLEY-STEERED PATH IS NOT
-- A PATH OF ISOMETRIES, AND THE LIFTED GENERATOR IS NOT JoinedIdQvC".
-- N159 banks the OCTONION-BLOCK 2-PLANE ROTATION GENERATION into the NON-VACUOUS JoinedIdQvC (N157):
-- the octonion-block 2-plane rotation octPlaneRot e f c s (x-fixing, time-fixing, acting purely on
-- the 8-dim octonion block 𝕆) is a gFormC-isometry for orthonormal e,f and a circle point c²+s²=1
-- (octPlaneRot_isGFormCIsom), its lift octBlockEndC (octPlaneRot e f c s) is a QvC-isometry fixing
-- the (t,x) plane (isQvIsomC_octBlockEndC_octPlaneRot), the cayley-steered path octPlaneRotPath is
-- continuous and lies in the isometry group (octPlaneRotPath_isQvIsomC), and the lifted generator is
-- JoinedIdQvC off the antipode (joinedIdQvC_octBlockEndC_octPlaneRot, joinedIdQvC_octPlaneRotWord) —
-- NON-VACUOUSLY (the connecting set is a preconnected set OF ISOMETRIES, NOT the ambient vector
-- space's vacuous connectedness). The W8 NON-VACUITY anchor: the concrete lifted quarter-turn
-- octBlockEndC (octPlaneRot e₂ je2 0 1) GENUINELY MOVES the octonion axis e₂ ↦ je2
-- (octPlaneRot_e2je2_quarter_moves), reading 1 on the moved je2 slot
--   gFormC ((octBlockEndC (octPlaneRot e₂ je2 0 1) (0,0,e₂)).2.2) je2 = 1
-- (octBlockEndC_octPlaneRot_e2je2_moves_read), for the banked orthonormal pair e₂,je2
-- (e2_gFormC_self, je2_gFormC_self, octDeflate_e2_je2_gFormC_zero), AND is JoinedIdQvC
-- (joinedIdQvC_octBlockEndC_octPlaneRot_e2je2_quarter).
--   THE BOGUS claim that the moved je2 slot of the lifted quarter-turn reads 159 (a stand-in for ANY
-- wrong octonion-block-rotation / lift / cayley-path / JoinedIdQvC value: the generator does not move
-- the octonion axis / the lift is not a QvC-isometry / the path is not isometric / the lifted
-- generator is not JoinedIdQvC) forces, after rewriting by the genuine value, the false numeric
-- `(1 : Cut) = 159` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the lifted quarter-turn genuinely sends e₂ to je2
-- reading the je2 slot 1 (octBlockEndC_octPlaneRot_e2je2_moves_read, a banked read-off over the
-- derived field Cut), so the claim of 159 is genuinely FALSE (1 ≠ 159 in the derived ordered field
-- Cut, char 0).
--   The false numeric `1 = 159` is DISTINCT from the banked battery (… C189 1=157, C190 1=158).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/Givens/plane/axis/lift/isometry/compact/
-- time-fixing/x-fixing/word/path-connected/topology/JoinedIdQvC/cayley/SO(8)/Spin/octonion/block":
-- over the derived complete ordered field Cut, the explicit linear operator
-- octBlockEndC (octPlaneRot e₂ je2 0 1) applied to (0,0,e₂) has octonion-block je2-overlap 1;
-- claiming it equals 159 forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the lifted octonion-block quarter-turn `octBlockEndC (octPlaneRot e₂ je2 0 1)` applied to
    `(0,0,e₂)` has `je2`-overlap `159`. It GENUINELY equals `1` (the quarter-turn rotates `e₂ ↦ je2`,
    reading `1` on the `je2` slot, `octBlockEndC_octPlaneRot_e2je2_moves_read`). The WRONG claim that
    it is `159` (the generator does not move the octonion axis / the lift is not a `QvC`-isometry /
    the path is not isometric / the lifted generator is not `JoinedIdQvC`) reduces, after rewriting by
    the genuine value, to the false numeric `(1 : Cut) = 159`, so this must NOT compile. -/
theorem octBlockSO8Word_wrong_value_BOGUS :
    gFormC ((octBlockEndC (octPlaneRot (CD.e2 : O Cut) (je2 : O Cut) 0 1)
      ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.2) (je2 : O Cut) = (159 : Cut) := by
  rw [octBlockEndC_octPlaneRot_e2je2_moves_read]

end

end Counterexamples
