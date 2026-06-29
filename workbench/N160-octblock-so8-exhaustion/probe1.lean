import Phys.Algebra.LorentzContinuumOctBlockSO8Word
import Phys.Algebra.LorentzContinuumGenerationSO8PeelOracle

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- PROBE 1: the lift is multiplicative. -/
theorem octBlockEndC_mul (R S : O Cut →ₗ[Cut] O Cut) :
    octBlockEndC (R * S) = octBlockEndC R * octBlockEndC S := by
  apply LinearMap.ext; intro p
  rw [Module.End.mul_apply, octBlockEndC_apply, octBlockEndC_apply, octBlockEndC_apply]
  rfl

theorem octBlockEndC_one : octBlockEndC (1 : O Cut →ₗ[Cut] O Cut) = 1 := by
  apply LinearMap.ext; intro p
  rw [octBlockEndC_apply]; rfl

/-- PROBE 2: THE EVEN-PAIR = HALF-TURN identity. For orthonormal a,b,
    houseHolder a * houseHolder b = octPlaneRot a b (-1) 0. -/
theorem houseHolder_bireflection_eq_octPlaneRot (a b : O Cut)
    (haa : gFormC a a = 1) (hbb : gFormC b b = 1) (hab : gFormC a b = 0) :
    houseHolder a * houseHolder b = octPlaneRot a b (-1) 0 := by
  have hba : gFormC b a = 0 := by rw [gFormC_symm]; exact hab
  apply LinearMap.ext; intro v
  rw [Module.End.mul_apply, houseHolder_apply a (houseHolder b v), houseHolder_apply b v,
      octPlaneRot_apply, haa, hbb]
  simp only [inv_one, mul_one]
  -- reduce inner gFormC a (v - (2*gFormC b v)•b) = gFormC v a (using hba)
  have hinner : gFormC a (v - (2 * gFormC b v) • b) = gFormC v a := by
    rw [gFormC_symm a, gFormC_sub_left, gFormC_smul_left, hba]; ring
  rw [hinner]
  -- canonicalize the remaining gFormC b v to gFormC v b
  rw [gFormC_symm b v]
  -- both sides now: v - (2*gFormC v b)•b - (2*gFormC v a)•a  vs  octPlaneRot form
  module

end
end Phys.Algebra
