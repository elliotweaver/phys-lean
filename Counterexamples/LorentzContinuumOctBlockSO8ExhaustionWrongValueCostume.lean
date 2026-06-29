import Phys.Algebra.LorentzContinuumOctBlockSO8Exhaustion

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C192): A BOGUS OCTONION-BLOCK SO(8)-EXHAUSTION / EVEN-PAIR / HOUSEHOLDER-OCTPLANEROT
-- / LIFTED-BIREFLECTION / JoinedIdQvC READ-OFF — "THE ORTHOGONAL BIREFLECTION houseHolder a ·
-- houseHolder b IS NOT THE PLANE HALF-TURN octPlaneRot a b (-1) 0, ITS LIFT octBlockEndC IS NOT A
-- MONOID HOM, AND THE LIFTED BIREFLECTION DOES NOT GENUINELY MOVE THE OCTONION AXIS NOR LAND IN THE
-- NON-VACUOUS JoinedIdQvC".
-- N160 banks THE OCTONION-BLOCK SO(8) EXHAUSTION CORE: the even-pair = plane half-turn identity
-- (houseHolder_bireflection_eq_octPlaneRot: for orthonormal a,b, houseHolder a · houseHolder b =
-- octPlaneRot a b (-1) 0), lifting the BANKED Householder reflection word (N124
-- gFormC_isom_mem_closure) into the NON-VACUOUS JoinedIdQvC (N157/N159). The lift octBlockEndC is a
-- monoid hom (octBlockEndC_mul / octBlockEndC_one); the half-turn = quarter-turn squared
-- (octPlaneRot_quarter_sq); the lifted orthogonal bireflection octBlockEndC (houseHolder a ·
-- houseHolder b) is JoinedIdQvC NON-vacuously (joinedIdQvC_octBlockEndC_orthoBireflection). The W8
-- NON-VACUITY anchor: the concrete e₂,je2 orthogonal bireflection octBlockEndC (houseHolder e₂ ·
-- houseHolder je2) GENUINELY MOVES the octonion axis e₂ ↦ −e₂ (orthoBireflection_e2je2_moves), the
-- moved slot's Born self-overlap reading
--   gFormC (moved slot) (moved slot) = gFormC (−e₂) (−e₂) = gFormC e₂ e₂ = 1
-- (det +1 isometry, the half-turn negates the in-plane axis), for the banked orthonormal pair e₂,je2
-- (e2_gFormC_self, je2_gFormC_self, octDeflate_e2_je2_gFormC_zero), AND is JoinedIdQvC
-- (joinedIdQvC_octBlockEndC_orthoBireflection_e2je2).
--   THE BOGUS claim that the moved slot's Born self-overlap reads 160 (a stand-in for ANY wrong
-- octonion-block-SO(8)-exhaustion / even-pair / houseHolder-octPlaneRot / lifted-bireflection /
-- JoinedIdQvC value: the bireflection is not the half-turn / the lift is not a monoid hom / the
-- lifted bireflection is not an isometry / it is not JoinedIdQvC) forces, after rewriting by the
-- genuine value, the false numeric `(1 : Cut) = 160` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the lifted bireflection genuinely sends e₂ to
-- −e₂, whose Born self-overlap is gFormC e₂ e₂ = 1 (banked read-offs over the derived field Cut), so
-- the claim of 160 is genuinely FALSE (1 ≠ 160 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 160` is DISTINCT from the banked battery (… C190 1=158, C191 1=159).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/reflection/Householder/bireflection/half-turn/
-- isometry/SO(8)/even-pair/JoinedIdQvC/octonion/block/det": over the derived complete ordered field
-- Cut, the explicit linear operator octBlockEndC (houseHolder e₂ · houseHolder je2) applied to
-- (0,0,e₂) has octonion-block self-overlap 1; claiming it equals 160 forces the false numeric. The
-- bite is a false NUMERIC, name-independent.

/-- BOGUS: the lifted octonion-block orthogonal bireflection `octBlockEndC (houseHolder e₂ ·
    houseHolder je2)` applied to `(0,0,e₂)` has octonion-block self-overlap `160`. It GENUINELY
    equals `1` (the bireflection = half-turn sends `e₂ ↦ −e₂`, whose Born self-overlap is
    `gFormC e₂ e₂ = 1`). The WRONG claim that it is `160` (the bireflection is not the half-turn /
    the lift is not a monoid hom / the lifted bireflection is not an isometry / it is not
    `JoinedIdQvC`) reduces, after rewriting by the genuine value, to the false numeric
    `(1 : Cut) = 160`, so this must NOT compile. -/
theorem octBlockSO8Exhaustion_wrong_value_BOGUS :
    gFormC ((octBlockEndC (houseHolder (CD.e2 : O Cut) * houseHolder (je2 : O Cut))
              ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.2)
           ((octBlockEndC (houseHolder (CD.e2 : O Cut) * houseHolder (je2 : O Cut))
              ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.2) = (160 : Cut) := by
  rw [octBlockEndC_apply]
  show gFormC ((houseHolder (CD.e2 : O Cut) * houseHolder (je2 : O Cut)) (CD.e2 : O Cut))
              ((houseHolder (CD.e2 : O Cut) * houseHolder (je2 : O Cut)) (CD.e2 : O Cut)) = 160
  rw [orthoBireflection_e2je2_moves, gFormC_neg_left, octRefl_gFormC_neg_right, neg_neg,
      e2_gFormC_self]

end

end Counterexamples
