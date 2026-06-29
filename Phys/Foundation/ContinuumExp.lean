/-
  # N174 — THE CONTINUOUS EXPONENTIAL `cutExp` over the DERIVED ℝ `ContinuumQ.Cut`.

  The number tower ℕ → ℤ → ℚ → ℝ must DESCEND from the fold (STANDARD §3). N33–N37 derived the
  ORDER-complete, Cauchy-complete `Cut` (the completion-of-the-gather-of-closures); N39 banked the
  scalar SUMMABILITY levers over it (`cut_summable_pow_div_factorial`, the absolute/comparison/Cauchy
  -product levers). THIS file banks the next genuinely-missing number-tower PRIMITIVE: the continuous
  exponential `cutExp x = ∑' n, xⁿ/n!`, DERIVED from `Cut` via its own banked exp power series — NOT a
  `Mathlib.Real.exp`/`Real.rpow` import as content.

  ★ WHY THIS IS NOT A POSIT (STANDARD §3 — THE NUMBER-TOWER GATE). `cutExp` is the `tsum` of the series
  `xⁿ/n!`, which is summable for EVERY `x` by the BANKED `cut_summable_pow_div_factorial` (N39, itself
  derived from C6 order-completeness N33 + the order topology N34) composed with the absolute-comparison
  lever. The `tsum` is the genuine limit (not a junk value) because `Cut` is Cauchy-complete (N37
  `CompleteSpace Cut`). Every object here is a statement ABOUT the derived `Cut`; the only Mathlib used
  is the topological-semiring `tsum` MACHINERY (`Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal`, which
  synthesizes on `Cut` with NO ℝ-valued norm — verified) operating on the DERIVED object. NO Mathlib ℝ
  imported as content, NO `Real.exp`, NO posited exponential.

  ★ THE ROUTE (the SCALAR mirror of the banked MATRIX exponential N39/N40 — strictly simpler, since
  `Cut` is a commutative field so commutativity is automatic and there is no entrywise reduction).
    `expTermC x n := xⁿ/n!` — the n-th term.
    `expTermC_summable`: absolutely convergent — `|xⁿ/n!| = |x|ⁿ/n!` is majorized by the factorial
      majorant `cut_summable_pow_div_factorial` (at `c = |x| ≥ 0`), then `cut_summable_of_abs`.
    `cutExp x := ∑' n, expTermC x n` — the `tsum` (exists by N37 completeness + summability).
    `cutExp_zero`: `cutExp 0 = 1` (only the `n=0` term `0⁰/0! = 1` survives).
    `expTermC_antidiagonal` (★ THE BINOMIAL CRUX): `∑_{k+l=n} (aᵏ/k!)(bˡ/l!) = (a+b)ⁿ/n!` from
      `add_pow` (`Cut` commutative) + the scalar binomial-coefficient identity
      `Nat.choose_mul_factorial_mul_factorial`.
    `cutExp_add` (★★ THE HOMOMORPHISM LAW): `cutExp a · cutExp b = cutExp (a+b)` — the trunk-native
      Cauchy product `tsum_mul_tsum_eq_tsum_sum_antidiagonal` (NO ℝ-valued norm) rewrites the product
      as `∑'ₙ ∑ antidiagonal n, …`, collapsed by the binomial crux.
    `cutExp_mul_neg` (★ INVERTIBILITY): `cutExp x · cutExp (-x) = cutExp 0 = 1`.
    `cutExp_pos` (★ BORN POSITIVITY): `0 < cutExp x` since `cutExp x = (cutExp (x/2))²` and
      `cutExp (x/2) ≠ 0` (it has a multiplicative inverse `cutExp (-x/2)`).

  ★ THE ONE CAUSE (THE ONE LAW). The SAME C6 eternal-approach + order-completeness that built the
  derived ℝ and made its nonneg bounded series converge (N33/N34/N39) is what makes the exp series
  converge AND what makes the Cauchy product rearrange absolutely; the SAME Born self-overlap positivity
  that recurs everywhere downstream is what makes `cutExp x` strictly positive (it is a square of a
  unit). One engine, several terminations: a convergent series, a one-parameter homomorphism, an
  always-positive value.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): there are NO physics words in this file. Delete "exponential"
  and the file is the pure statement that over the completion-of-the-gather-of-closures of the derived
  rationals, the map `E(x) = ∑' n, xⁿ/n!` is well-defined, satisfies `E(0) = 1`, `E(a)·E(b) = E(a+b)`,
  `E(x)·E(-x) = 1`, and `0 < E(x)`. No name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no a-fully-proved-implication
  written without a proof, NO Mathlib number-system content import, NO ℝ-valued `Norm`, NO `Real.exp`.
-/
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Ring

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## The scalar exponential term and its absolute summability over the derived ℝ. -/

/-- The `n`-th term of the scalar exponential series `cutExp x = ∑ₙ xⁿ/n!` over the derived ℝ:
    `xⁿ/n!`. MACHINERY (`pow`/`div`/factorial cast) on the DERIVED `Cut`, NOT a posited exponential. -/
def expTermC (x : Cut) (n : ℕ) : Cut := x ^ n / (n.factorial : Cut)

/-- The absolute value of the `n`-th term is bounded by the factorial majorant `|x|ⁿ/n!`. From
    `abs_div` + `abs_pow` (the factorial cast is nonneg). -/
theorem expTermC_abs_le (x : Cut) (n : ℕ) :
    |expTermC x n| ≤ |x| ^ n / (n.factorial : Cut) := by
  unfold expTermC
  rw [abs_div]
  have hfac : |((n.factorial : Cut))| = (n.factorial : Cut) := by
    rw [abs_of_nonneg]; positivity
  rw [hfac, abs_pow]

/-- The series is ABSOLUTELY summable: `∑ₙ |xⁿ/n!|` converges, majorized by the factorial majorant
    `|x|ⁿ/n!` summable via the banked N39 `cut_summable_pow_div_factorial` (at `c = |x| ≥ 0`) and the
    nonneg comparison lever. NO ℝ-valued norm. -/
theorem expTermC_abs_summable (x : Cut) : Summable (fun n => |expTermC x n|) := by
  apply cut_summable_of_nonneg_of_le (fun n => abs_nonneg _)
    (fun n => expTermC_abs_le x n)
  exact cut_summable_pow_div_factorial (abs_nonneg x)

/-- The exponential series is summable for EVERY `x` over the (N37 Cauchy-complete) derived ℝ —
    absolute summability (`expTermC_abs_summable`) lifts to summability by `cut_summable_of_abs`. -/
theorem expTermC_summable (x : Cut) : Summable (expTermC x) :=
  cut_summable_of_abs (expTermC_abs_summable x)

/-! ## The continuous exponential and its base value. -/

/-- ★ THE CONTINUOUS EXPONENTIAL `cutExp x = ∑' n, xⁿ/n!` over the derived ℝ, as the `tsum` of the
    absolutely-convergent series `expTermC x`. The `tsum` is the GENUINE limit (not a junk value)
    because the series is summable (`expTermC_summable`) over the Cauchy-complete derived ℝ (N37
    `CompleteSpace Cut`). MACHINERY on the DERIVED `Cut`, NOT Mathlib's `Real.exp` (the content trap). -/
def cutExp (x : Cut) : Cut := ∑' n, expTermC x n

/-- The exponential series has `cutExp x` as its sum (lets limits pass through the `tsum`). -/
theorem cutExp_hasSum (x : Cut) : HasSum (expTermC x) (cutExp x) :=
  (expTermC_summable x).hasSum

/-- ★ `cutExp 0 = 1`: only the `n = 0` term `0⁰/0! = 1` survives; every higher term has `0ⁿ = 0`.
    The unit of the one-parameter family. -/
theorem cutExp_zero : cutExp 0 = 1 := by
  unfold cutExp
  rw [tsum_eq_single 0]
  · unfold expTermC; simp
  · intro n hn
    unfold expTermC
    rw [zero_pow hn, zero_div]

/-! ## The Cauchy-product family and the binomial crux. -/

/-- The product family `(k,l) ↦ expTermC a k · expTermC b l` over `ℕ × ℕ` is summable — the hypothesis
    the trunk-native Cauchy product needs. Both entry sequences are absolutely summable
    (`expTermC_abs_summable`), so `cut_summable_mul_of_abs` (N39, NO ℝ-valued norm) closes it. -/
theorem expTermC_prod_summable (a b : Cut) :
    Summable (fun x : ℕ × ℕ => expTermC a x.1 * expTermC b x.2) :=
  cut_summable_mul_of_abs (f := expTermC a) (g := expTermC b)
    (expTermC_abs_summable a) (expTermC_abs_summable b)

/-- ★ THE BINOMIAL CRUX (scalar): `∑_{k+l=n} (aᵏ/k!)·(bˡ/l!) = (a+b)ⁿ/n!`. From `add_pow`
    (`Cut` is a commutative field) — `(a+b)ⁿ = ∑_{k≤n} aᵏ·bⁿ⁻ᵏ·choose(n,k)` — reindexing the
    antidiagonal to `range (n+1)` (`Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk`), and the scalar
    binomial-coefficient identity `1/k!·1/l! = (1/n!)·choose(n,k)` for `k + l = n`
    (`Nat.choose_mul_factorial_mul_factorial`). -/
theorem expTermC_antidiagonal (a b : Cut) (n : ℕ) :
    ∑ kl ∈ Finset.antidiagonal n, expTermC a kl.1 * expTermC b kl.2 = expTermC (a + b) n := by
  unfold expTermC
  rw [add_pow, Finset.sum_div, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ n := by omega
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

/-! ## THE HOMOMORPHISM LAW + INVERTIBILITY + BORN POSITIVITY. -/

/-- ★★ THE EXPONENTIAL HOMOMORPHISM LAW over the derived ℝ: `cutExp a · cutExp b = cutExp (a + b)`.
    The trunk-native Cauchy product `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` (which needs only
    the topological-semiring structure on `Cut`, NO ℝ-valued norm) rewrites `(∑'expTermC a)·(∑'expTermC b)`
    as `∑'ₙ ∑ antidiagonal n, expTermC a k · expTermC b l`, and the binomial crux collapses each
    antidiagonal sum to `expTermC (a+b) n`. THE one-parameter additive→multiplicative law. -/
theorem cutExp_add (a b : Cut) : cutExp a * cutExp b = cutExp (a + b) := by
  unfold cutExp
  rw [(expTermC_summable a).tsum_mul_tsum_eq_tsum_sum_antidiagonal (expTermC_summable b)
        (expTermC_prod_summable a b)]
  apply tsum_congr
  intro n
  exact expTermC_antidiagonal a b n

/-- ★ INVERTIBILITY: `cutExp x · cutExp (-x) = 1`. The homomorphism law + `add_neg_cancel` +
    `cutExp_zero` give that `cutExp x` is a two-sided unit with inverse `cutExp (-x)`. -/
theorem cutExp_mul_neg (x : Cut) : cutExp x * cutExp (-x) = 1 := by
  rw [cutExp_add, add_neg_cancel]; exact cutExp_zero

/-- ★ BORN POSITIVITY (self-overlap): `0 < cutExp x`. `cutExp x = (cutExp (x/2))²` by the
    homomorphism law, and `cutExp (x/2) ≠ 0` because it has a multiplicative inverse `cutExp (-x/2)`
    (`cutExp_mul_neg`); a nonzero square in a `LinearOrder` field is positive (`mul_self_pos`). The
    self-overlap positivity that recurs through the chain, here forcing the exponential strictly
    positive. -/
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

/-! ## NON-VACUITY (W8): the exponential is genuine on a nonzero argument. -/

/-- NON-VACUITY: `cutExp 1` is strictly positive — a concrete nonzero argument witnessing `cutExp_pos`
    is not vacuous at `x = 0` alone (where `cutExp 0 = 1` is the bare unit). -/
theorem cutExp_one_pos : 0 < cutExp 1 := cutExp_pos 1

/-- NON-VACUITY: the homomorphism law on a nonzero argument — `cutExp 1 · cutExp 1 = cutExp (1+1)`,
    witnessing `cutExp_add` is not vacuous at the zero argument. -/
theorem cutExp_one_add_one : cutExp 1 * cutExp 1 = cutExp (1 + 1) :=
  cutExp_add 1 1

end

end ContinuumQ
end Phys.Foundation
