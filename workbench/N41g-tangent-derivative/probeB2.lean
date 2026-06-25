import Phys.Algebra.DerivationOAutomorphism
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix Filter
open scoped BigOperators Topology
noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- B1: derivMatrix homogeneity (conjRingEquiv is a RingEquiv, not Cut-linear; prove via entries)
example (t : Cut) (D' : Module.End Cut (O Cut)) :
    derivMatrix (t • D') = t • derivMatrix D' := by
  unfold derivMatrix
  ext i j
  simp only [Matrix.smul_apply, smul_eq_mul, LinearMap.toMatrix'_apply]
  rw [LinearEquiv.conjRingEquiv_apply_apply, LinearEquiv.conjRingEquiv_apply_apply]
  simp [LinearMap.smul_apply, map_smul]

-- B2: expTerm (t • M) n i j = t^n * expTerm M n i j
example (t : Cut) (M : Matrix (Fin 8) (Fin 8) Cut) (n : ℕ) (i j : Fin 8) :
    expTerm (t • M) n i j = t ^ n * expTerm M n i j := by
  unfold expTerm
  rw [smul_pow]
  simp only [Matrix.smul_apply, smul_eq_mul]
  ring

-- B3: entry-tsum  expMap (t•M) i j = ∑' n, t^n * expTerm M n i j
example (t : Cut) (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    expMap (t • M) i j = ∑' n, t ^ n * expTerm M n i j := by
  unfold expMap
  have hsm : Summable (expTerm (t • M)) := expTerm_summable (t • M)
  rw [tsum_apply hsm.apply, tsum_apply ((hsm.apply (i := i)))]
  apply tsum_congr
  intro n
  unfold expTerm
  rw [smul_pow]
  simp only [Matrix.smul_apply, smul_eq_mul]
  ring

end
end Phys.Algebra
