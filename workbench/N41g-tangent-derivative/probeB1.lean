import Phys.Algebra.DerivationOAutomorphism

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators Topology
noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- RISK 1: derivMatrix homogeneity  derivMatrix (t • D') = t • derivMatrix D'
example (t : Cut) (D' : Module.End Cut (O Cut)) :
    derivMatrix (t • D') = t • derivMatrix D' := by
  unfold derivMatrix
  rw [map_smul, map_smul]

-- RISK 2a: (t • M)^n entrywise = t^n * (M^n) i j
example (t : Cut) (M : Matrix (Fin 8) (Fin 8) Cut) (n : ℕ) (i j : Fin 8) :
    ((t • M) ^ n) i j = t ^ n * (M ^ n) i j := by
  rw [smul_pow]
  rfl

-- RISK 2b: expTerm (t • M) n i j = t^n * expTerm M n i j
example (t : Cut) (M : Matrix (Fin 8) (Fin 8) Cut) (n : ℕ) (i j : Fin 8) :
    expTerm (t • M) n i j = t ^ n * expTerm M n i j := by
  unfold expTerm
  rw [smul_pow]
  simp [Matrix.smul_apply]

end
end Phys.Algebra
