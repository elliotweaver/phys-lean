import Phys.Algebra.TowerGatherJointChargeIsospinWeights
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- MEASURE the irreducibility route on T1 = span{e1,e2,e3} using the qI Cmat/Imat calculus.
-- Strategy: work with the restricted 3x3 matrices directly as an abstract so(3) vector rep on Fin 3 -> Q.
-- The extraction identity: I (I v) = a1 e1 - (something)... test the RANK certificate route instead:
-- For the vector rep of so(3) on Q^3 with generators
--   I3 = ![![0,0,0],![0,0,-2],![0,2,0]], J3 = ![![0,0,2],![0,0,0],![-2,0,0]], K3 = ![![0,-2,0],![2,0,0],![0,0,0]]
-- show: any invariant subspace W ≠ ⊥ is ⊤.
-- Test the KEY algebraic lemma: I3 (I3 v) = (v 0)•e0 - ... let's just test the "extract basis vector" combination in Q^3.

abbrev V3 := Fin 3 → ℚ
def I3 : V3 →ₗ[ℚ] V3 := Matrix.toLin' !![0,0,0; 0,0,-2; 0,2,0]
def J3 : V3 →ₗ[ℚ] V3 := Matrix.toLin' !![0,0,2; 0,0,0; -2,0,0]
def K3 : V3 →ₗ[ℚ] V3 := Matrix.toLin' !![0,-2,0; 2,0,0; 0,0,0]

-- extraction: -(1/4)•(I3 (I3 v)) recovers the e1,e2,e3 combination? Test on a symbolic v via ext on Fin 3.
-- The cleaner claim: for W a submodule invariant under I3,J3,K3, containing v≠0, then ⊤ ≤ W.
-- Measure just the core linear identity we need:  I3(I3 v) = ![-4*v 2, 0? ]... compute.
example (v : V3) : I3 (I3 v) = ![0, -4 * v 1, -4 * v 2] := by
  ext i
  fin_cases i <;>
    simp [I3, Matrix.toLin'_apply, Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_three] <;> ring

example (v : V3) : J3 (J3 v) = ![-4 * v 0, 0, -4 * v 2] := by
  ext i
  fin_cases i <;>
    simp [J3, Matrix.toLin'_apply, Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_three] <;> ring

example (v : V3) : K3 (K3 v) = ![-4 * v 0, -4 * v 1, 0] := by
  ext i
  fin_cases i <;>
    simp [K3, Matrix.toLin'_apply, Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_three] <;> ring

end
end Phys.Algebra
