import Mathlib.Algebra.BigOperators.NatAntidiagonal
import Mathlib.Data.Nat.Choose.Sum

open Finset
open scoped BigOperators

-- PROBE B: the pure Pascal ℕ-smul identity, the combinatorial heart of iterated Leibniz.
-- Works for any g : ℕ → M into an AddCommMonoid.
theorem pascal_smul_sum {M : Type*} [AddCommMonoid M] (g : ℕ → M) (N : ℕ) :
    (∑ m ∈ range (N + 1), (N.choose m) • g (m + 1))
      + (∑ m ∈ range (N + 1), (N.choose m) • g m)
    = ∑ m ∈ range (N + 2), ((N+1).choose m) • g m := by
  -- RHS: peel m=0 via sum_range_succ'
  rw [Finset.sum_range_succ' (fun m => ((N+1).choose m) • g m) (N+1)]
  simp only [Nat.choose_zero_right, one_nsmul]
  -- now RHS = (∑ m∈range(N+1), C(N+1,m+1)•g(m+1)) + g 0
  -- expand C(N+1,m+1) = C(N,m)+C(N,m+1)
  have hpascal : ∀ m ∈ range (N+1),
      ((N+1).choose (m+1)) • g (m+1)
        = (N.choose m) • g (m+1) + (N.choose (m+1)) • g (m+1) := by
    intro m _
    rw [Nat.choose_succ_succ' N m, add_nsmul]
  rw [Finset.sum_congr rfl hpascal, Finset.sum_add_distrib]
  -- RHS = [∑ C(N,m)•g(m+1)] + [∑ C(N,m+1)•g(m+1)] + g 0
  -- LHS = [∑ C(N,m)•g(m+1)] + [∑ C(N,m)•g m]
  -- cancel the common first sum; reduce to:
  -- ∑_{range(N+1)} C(N,m)•g m = ∑_{range(N+1)} C(N,m+1)•g(m+1) + g 0
  rw [add_assoc]
  congr 1
  -- ∑ C(N,m)•g m = ∑ C(N,m+1)•g(m+1) + g 0
  rw [Finset.sum_range_succ' (fun m => (N.choose m) • g m) N]
  simp only [Nat.choose_zero_right, one_nsmul]
  -- LHS = ∑_{range N} C(N,m+1)•g(m+1) + g 0
  -- RHS = ∑_{range(N+1)} C(N,m+1)•g(m+1) + g 0
  congr 1
  rw [Finset.sum_range_succ (fun m => (N.choose (m+1)) • g (m+1)) N]
  simp [Nat.choose_succ_self]
