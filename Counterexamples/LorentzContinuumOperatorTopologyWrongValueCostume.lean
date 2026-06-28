import Phys.Algebra.LorentzContinuumOperatorTopology

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C184): A BOGUS OPERATOR-TOPOLOGY / CONTINUITY / CONNECTEDNESS / CONTINUOUS-PATH
-- READ-OFF — "THE CONTINUOUS AFFINE SPECTRAL PATH DOES NOT BEGIN AT THE IDENTITY (so the boost part
-- is NOT topologically path-joined to the identity, the operator topology over Cut fails to make
-- the path continuous, the image is NOT preconnected)".
-- N152 banks THE OPERATOR TOPOLOGY over the derived ℝ Cut (endOpC, the topology induced on
-- Module.End Cut STVC from the function space STVC → STVC), the CONTINUITY of the N96 affine spectral
-- path in it (specPathOp_cont), and the PRECONNECTEDNESS of its image on Set.Icc (0:Cut) 1
-- (specPathOp_image_preconnected, specPathOp_joins_id_sqrt): the boost part γ1 = p^{1/2} is
-- topologically path-joined to the identity γ0 = id through the cone. The concrete W8 non-vacuity
-- anchor is the continuous path on the rank-4 octonionic frame mix4 reading, at its START t = 0 on
-- the first frame vector, the eigenvalue (1 − 0)·1 + 0·cutSqrt 4 = 1 — the identity endpoint of the
-- continuous path (specOpN_read mix4_orthonormal 0). The path GENUINELY begins at the identity, so
-- the connectedness construction is real, not vacuous.
--   THE BOGUS claim that this continuous-path start read-off reads 152 (a stand-in for ANY wrong
-- operator-topology / continuity / connectedness / continuous-path value: the path is not continuous
-- in the operator topology / does not begin at the identity / the image is not preconnected / the
-- boost part is not path-joined to the identity) forces, after rewriting by the genuine values
-- (specOpN_read at t = 0), the false numeric `(1 : Cut) = 152` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the continuous path GENUINELY reads 1 at its
-- start (a banked read-off over the derived field Cut), so the claim of 152 is genuinely FALSE
-- (1 ≠ 152 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 152` is DISTINCT from the banked battery (… C181 1=149, C182 2=150,
-- C183 1=151).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/operator-topology/continuity/connectedness/path/
-- isometry/spectral/cone/preconnected/identity-component": over the derived complete ordered field
-- Cut, the affine family specPathOp ![4,9,25,64] mix4 at parameter 0 reads, on the first frame
-- vector, (1 − 0)·1 + 0·cutSqrt 4 = 1; claiming it equals 152 forces the false numeric. The bite is
-- a false NUMERIC, name-independent.

/-- BOGUS: the continuous affine spectral path's START read-off
    `EvC (specPathOp ![4,9,25,64] mix4 0 (mix4 0)) (mix4 0)` equals `152`. It GENUINELY equals `1`
    (the path begins at the identity; `specOpN_read` at `t = 0` gives `(1−0)·1 + 0·cutSqrt 4 = 1`).
    The WRONG claim that it is `152` (the path is not continuous in the operator topology / does not
    begin at the identity / the image is not preconnected / the boost part is not topologically
    path-joined to the identity) reduces, after rewriting by the genuine values, to the false numeric
    `(1 : Cut) = 152`, so this must NOT compile. -/
theorem operator_topology_wrong_value_BOGUS :
    EvC (specPathOp ![(4:Cut),9,25,64] mix4 0 (mix4 0)) (mix4 0) = (152 : Cut) := by
  unfold specPathOp
  rw [specOpN_read mix4_orthonormal 0]
  show (1 - (0:Cut)) * 1 + (0:Cut) * cutSqrt (![(4:Cut),9,25,64] 0) = 152
  simp only [sub_zero, mul_one, zero_mul, add_zero]

end

end Counterexamples
