import Phys.Algebra.DerivationAutExp
open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open scoped Topology BigOperators
noncomputable section

-- Define the exp map as the tsum of the (summable) series.
def expMap (D : Matrix (Fin 8) (Fin 8) Cut) : Matrix (Fin 8) (Fin 8) Cut :=
  ∑' n, expTerm D n

-- The series has the tsum as its sum (foundational; lets us pass limits).
theorem expMap_hasSum (D : Matrix (Fin 8) (Fin 8) Cut) :
    HasSum (expTerm D) (expMap D) :=
  (expTerm_summable D).hasSum

#check @expMap_hasSum
