import Phys.Algebra.DerivationAutOpNorm
import Mathlib.Topology.Algebra.InfiniteSum.Group
import Mathlib.Topology.Algebra.InfiniteSum.Constructions
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Instances.Matrix
namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- the banked-to-be scalar levers (in ContinuumExp.lean):
axiom cut_summable_of_nonneg_of_le {f g : ℕ → Cut} (hf : ∀ n, 0 ≤ f n)
    (hfg : ∀ n, f n ≤ g n) (hg : Summable g) : Summable f
axiom cut_summable_of_abs {f : ℕ → Cut} (h : Summable (fun n => |f n|)) : Summable f
axiom cut_summable_pow_div_factorial {c : Cut} (hc : 0 ≤ c) :
    Summable (fun n => c ^ n / (n.factorial : Cut))
axiom matrix_summable_of_entrywise (f : ℕ → Matrix (Fin 8) (Fin 8) Cut)
    (h : ∀ i j, Summable (fun n => f n i j)) : Summable f

def expTerm (D : Matrix (Fin 8) (Fin 8) Cut) (n : ℕ) : Matrix (Fin 8) (Fin 8) Cut :=
  (1 / (n.factorial : Cut)) • (D ^ n)

-- KEY entry bound: |(expTerm D n) i j| ≤ (1/n!) * (opNorm D)^n, for n ≥ 1.
-- (n = 0 handled separately by summable_nat_add_iff or finite-head insensitivity.)
theorem expTerm_entry_abs_le (D : Matrix (Fin 8) (Fin 8) Cut) (n : ℕ) (i j : Fin 8) :
    |expTerm D (n+1) i j| ≤ (1 / ((n+1).factorial : Cut)) * (opNorm D) ^ (n+1) := by
  unfold expTerm
  rw [Matrix.smul_apply, smul_eq_mul, abs_mul]
  have h1 : |1 / ((n+1).factorial : Cut)| = 1 / ((n+1).factorial : Cut) := by
    rw [abs_of_nonneg]; positivity
  rw [h1]
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  calc |(D ^ (n+1)) i j| ≤ opNorm (D ^ (n+1)) := entry_abs_le_opNorm _ i j
    _ ≤ (opNorm D) ^ (n+1) := opNorm_pow_le D n

-- TARGET (c): the matrix exponential series is Summable.
theorem expTerm_summable (D : Matrix (Fin 8) (Fin 8) Cut) : Summable (expTerm D) := by
  apply matrix_summable_of_entrywise
  intro i j
  -- shift by 1: the n+1 tail is summable, head is finite
  rw [← summable_nat_add_iff 1]
  -- compare |expTerm D (n+1) i j| to the factorial majorant
  apply cut_summable_of_abs
  apply cut_summable_of_nonneg_of_le (fun n => abs_nonneg _)
    (fun n => expTerm_entry_abs_le D n i j)
  -- the majorant (1/(n+1)!)*(opNorm D)^(n+1) is summable (tail of pow/factorial)
  have hmaj : Summable (fun n => (opNorm D) ^ n / (n.factorial : Cut)) :=
    cut_summable_pow_div_factorial (opNorm_nonneg D)
  rw [← summable_nat_add_iff 1] at hmaj
  apply hmaj.congr
  intro n
  rw [one_div, div_eq_inv_mul]

end
end Phys.Algebra
