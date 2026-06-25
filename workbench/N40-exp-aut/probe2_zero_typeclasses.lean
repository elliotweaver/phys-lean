import Phys.Algebra.DerivationAutExp
open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open scoped Topology BigOperators
noncomputable section

def expMap (D : Matrix (Fin 8) (Fin 8) Cut) : Matrix (Fin 8) (Fin 8) Cut :=
  ∑' n, expTerm D n

-- exp(0) = 1 : the n=0 term is 1, all higher terms are 0.
theorem expMap_zero : expMap (0 : Matrix (Fin 8) (Fin 8) Cut) = 1 := by
  unfold expMap
  rw [tsum_eq_single 0]
  · unfold expTerm; simp
  · intro n hn
    unfold expTerm
    rw [zero_pow hn, smul_zero]

#check @expMap_zero

-- Probe the typeclasses the Cauchy product needs over Matrix Cut:
example : NonUnitalNonAssocSemiring (Matrix (Fin 8) (Fin 8) Cut) := inferInstance
example : TopologicalSpace (Matrix (Fin 8) (Fin 8) Cut) := inferInstance
example : IsTopologicalSemiring (Matrix (Fin 8) (Fin 8) Cut) := inferInstance
example : T3Space (Matrix (Fin 8) (Fin 8) Cut) := inferInstance
