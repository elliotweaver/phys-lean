import Phys.Algebra.DerivationAutExp
import Phys.Foundation.ContinuumSummable
open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- assume the levers (probed green above); just measure the assembly skeleton.
axiom matrix_prod_summable (A B : Matrix (Fin 8) (Fin 8) Cut) :
    Summable (fun x : ℕ × ℕ => expTerm A x.1 * expTerm B x.2)
axiom expTerm_antidiagonal (A B : Matrix (Fin 8) (Fin 8) Cut) (h : Commute A B) (n : ℕ) :
    ∑ kl ∈ Finset.antidiagonal n, expTerm A kl.1 * expTerm B kl.2 = expTerm (A + B) n

def expMap (D : Matrix (Fin 8) (Fin 8) Cut) : Matrix (Fin 8) (Fin 8) Cut := ∑' n, expTerm D n

-- THE HOMOMORPHISM LAW
theorem expMap_mul_of_commute (A B : Matrix (Fin 8) (Fin 8) Cut) (h : Commute A B) :
    expMap A * expMap B = expMap (A + B) := by
  unfold expMap
  rw [(expTerm_summable A).tsum_mul_tsum_eq_tsum_sum_antidiagonal (expTerm_summable B)
        (matrix_prod_summable A B)]
  apply tsum_congr
  intro n
  exact expTerm_antidiagonal A B h n

#check @expMap_mul_of_commute
