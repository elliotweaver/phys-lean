import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Ring

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

/-- the n-th scalar exponential term over the derived ℝ: xⁿ/n!. -/
def expTermC (x : Cut) (n : ℕ) : Cut := x ^ n / (n.factorial : Cut)

theorem expTermC_abs_le (x : Cut) (n : ℕ) :
    |expTermC x n| ≤ |x| ^ n / (n.factorial : Cut) := by
  unfold expTermC
  rw [abs_div]
  have hfac : |((n.factorial : Cut))| = (n.factorial : Cut) := by
    rw [abs_of_nonneg]; positivity
  rw [hfac, abs_pow]

theorem expTermC_abs_summable (x : Cut) : Summable (fun n => |expTermC x n|) := by
  apply cut_summable_of_nonneg_of_le (fun n => abs_nonneg _)
    (fun n => expTermC_abs_le x n)
  exact cut_summable_pow_div_factorial (abs_nonneg x)

theorem expTermC_summable (x : Cut) : Summable (expTermC x) :=
  cut_summable_of_abs (expTermC_abs_summable x)

/-- THE continuous exponential over the derived ℝ. -/
def cutExp (x : Cut) : Cut := ∑' n, expTermC x n

theorem cutExp_hasSum (x : Cut) : HasSum (expTermC x) (cutExp x) :=
  (expTermC_summable x).hasSum

theorem cutExp_zero : cutExp 0 = 1 := by
  unfold cutExp
  rw [tsum_eq_single 0]
  · unfold expTermC; simp
  · intro n hn
    unfold expTermC
    rw [zero_pow hn, zero_div]

theorem expTermC_prod_summable (a b : Cut) :
    Summable (fun x : ℕ × ℕ => expTermC a x.1 * expTermC b x.2) :=
  cut_summable_mul_of_abs (f := expTermC a) (g := expTermC b)
    (expTermC_abs_summable a) (expTermC_abs_summable b)

/-- THE BINOMIAL CRUX (scalar): ∑_{k+l=n} (aᵏ/k!)(bˡ/l!) = (a+b)ⁿ/n!. -/
theorem expTermC_antidiagonal (a b : Cut) (n : ℕ) :
    ∑ kl ∈ Finset.antidiagonal n, expTermC a kl.1 * expTermC b kl.2 = expTermC (a + b) n := by
  unfold expTermC
  rw [add_pow]
  rw [Finset.sum_div]
  -- LHS sum over antidiagonal, RHS sum over range n+1; reindex antidiagonal to range
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ n := by omega
  -- RHS term: a^k * b^(n-k) * choose(n,k) / n!
  -- LHS term: (a^k/k!) * (b^(n-k)/(n-k)!)
  have hcmf := Nat.choose_mul_factorial_mul_factorial hk'
  have hk0 : (k.factorial : Cut) ≠ 0 := by positivity
  have hl0 : ((n - k).factorial : Cut) ≠ 0 := by positivity
  have hn0 : (n.factorial : Cut) ≠ 0 := by positivity
  have hcast : (n.choose k : Cut) * (k.factorial : Cut) * ((n-k).factorial : Cut)
      = (n.factorial : Cut) := by
    have hnat : ((n.choose k * k.factorial * (n-k).factorial : ℕ) : Cut)
        = ((n.factorial : ℕ) : Cut) := by rw [hcmf]
    push_cast at hnat; linarith [hnat]
  field_simp
  linear_combination (-(a ^ k * b ^ (n - k))) * hcast

/-- THE HOMOMORPHISM LAW: cutExp a * cutExp b = cutExp (a+b). -/
theorem cutExp_add (a b : Cut) : cutExp a * cutExp b = cutExp (a + b) := by
  unfold cutExp
  rw [(expTermC_summable a).tsum_mul_tsum_eq_tsum_sum_antidiagonal (expTermC_summable b)
        (expTermC_prod_summable a b)]
  apply tsum_congr
  intro n
  exact expTermC_antidiagonal a b n

/-- INVERTIBILITY: cutExp x * cutExp (-x) = 1. -/
theorem cutExp_mul_neg (x : Cut) : cutExp x * cutExp (-x) = 1 := by
  rw [cutExp_add, add_neg_cancel]; exact cutExp_zero

/-- POSITIVITY (Born = self-overlap): 0 < cutExp x. cutExp x = (cutExp (x/2))², and that square is
    positive since cutExp(x/2)·cutExp(-x/2)=1 forces cutExp(x/2) ≠ 0. -/
theorem cutExp_pos (x : Cut) : 0 < cutExp x := by
  have hhalf : cutExp x = cutExp (x / 2) * cutExp (x / 2) := by
    rw [cutExp_add]; congr 1; ring
  have hne : cutExp (x / 2) ≠ 0 := by
    intro h
    have := cutExp_mul_neg (x / 2)
    rw [h, zero_mul] at this
    exact zero_ne_one this
  rw [hhalf]
  exact mul_self_pos.mpr hne

/-- NON-VACUITY: cutExp 1 is genuinely positive (and ≠ its junk). -/
theorem cutExp_one_pos : 0 < cutExp 1 := cutExp_pos 1

end
end ContinuumQ
end Phys.Foundation
