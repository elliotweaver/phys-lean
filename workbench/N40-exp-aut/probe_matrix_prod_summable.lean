import Phys.Algebra.DerivationAutExp
open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open scoped Topology BigOperators
noncomputable section

axiom matrix_summable_prod_of_entrywise (f : ℕ × ℕ → Matrix (Fin 8) (Fin 8) Cut)
    (h : ∀ i j, Summable (fun x => f x i j)) : Summable f
axiom cut_summable_mul_of_abs {f g : ℕ → Cut}
    (hf : Summable (fun i => |f i|)) (hg : Summable (fun j => |g j|)) :
    Summable (fun x : ℕ × ℕ => f x.1 * g x.2)
axiom expTerm_entry_abs_summable (D : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    Summable (fun n => |expTerm D n i j|)

theorem matrix_prod_summable (A B : Matrix (Fin 8) (Fin 8) Cut) :
    Summable (fun x : ℕ × ℕ => expTerm A x.1 * expTerm B x.2) := by
  apply matrix_summable_prod_of_entrywise
  intro i j
  have hentry : (fun x : ℕ × ℕ => (expTerm A x.1 * expTerm B x.2) i j)
      = (fun x : ℕ × ℕ => ∑ k : Fin 8, expTerm A x.1 i k * expTerm B x.2 k j) := by
    funext x; rw [Matrix.mul_apply]
  rw [hentry]
  refine summable_sum (s := Finset.univ)
    (f := fun (k : Fin 8) (x : ℕ × ℕ) => expTerm A x.1 i k * expTerm B x.2 k j) ?_
  intro k _
  exact cut_summable_mul_of_abs (f := fun n => expTerm A n i k) (g := fun n => expTerm B n k j)
    (expTerm_entry_abs_summable A i k) (expTerm_entry_abs_summable B k j)
