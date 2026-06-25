import Phys.Algebra.DerivationAutExp
import Phys.Foundation.ContinuumSummable
open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open scoped Topology BigOperators
noncomputable section

axiom expMap_mul_of_commute (A B : Matrix (Fin 8) (Fin 8) Cut) (h : Commute A B) :
    (∑' n, expTerm A n) * (∑' n, expTerm B n) = (∑' n, expTerm (A+B) n)
axiom expMap_zero : (∑' n, expTerm (0 : Matrix (Fin 8) (Fin 8) Cut) n) = 1

def expMap (D : Matrix (Fin 8) (Fin 8) Cut) : Matrix (Fin 8) (Fin 8) Cut := ∑' n, expTerm D n

-- exp(D)·exp(-D)=1 : the GL-landing (exp is invertible, inverse exp(-D)).
theorem expMap_mul_neg (D : Matrix (Fin 8) (Fin 8) Cut) :
    expMap D * expMap (-D) = 1 := by
  unfold expMap
  have hc : Commute D (-D) := (Commute.refl D).neg_right
  rw [expMap_mul_of_commute D (-D) hc, add_neg_cancel]
  exact expMap_zero

theorem expMap_neg_mul (D : Matrix (Fin 8) (Fin 8) Cut) :
    expMap (-D) * expMap D = 1 := by
  unfold expMap
  have hc : Commute (-D) D := (Commute.refl D).neg_left
  rw [expMap_mul_of_commute (-D) D hc, neg_add_cancel]
  exact expMap_zero

#check @expMap_mul_neg
