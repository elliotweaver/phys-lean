/-
  # N323 — THE DERIVED TRIGONOMETRIC FUNCTIONS `cutCos`/`cutSin` AND THE BORN-UNIT-CIRCLE over the
  DERIVED ℝ `ContinuumQ.Cut`.

  The number tower ℕ → ℤ → ℚ → ℝ must DESCEND from the fold (STANDARD §3). N33–N37 derived the
  order/Cauchy-complete `Cut`; N39 banked the scalar SUMMABILITY levers over it; N174 (`ContinuumExp`)
  banked the continuous exponential `cutExp x = ∑' n, xⁿ/n!` with its Cauchy-product homomorphism law.
  THIS file banks the next genuinely-missing number-tower PRIMITIVE: the continuous circular functions
  `cutCos x = ∑' n, (-1)ⁿx²ⁿ/(2n)!` and `cutSin x = ∑' n, (-1)ⁿx²ⁿ⁺¹/(2n+1)!`, DERIVED from `Cut` via
  their own banked alternating power series — NOT a `Mathlib.Real.cos`/`Real.sin` import as content.

  ★ WHY THIS IS NOT A POSIT (STANDARD §3 — THE NUMBER-TOWER GATE). `cutCos`/`cutSin` are `tsum`s of the
  alternating series, each of which is the BANKED factorial majorant `cut_summable_pow_div_factorial`
  (N39) COMPOSED with an INJECTIVE reindex (`n ↦ 2n`, `n ↦ 2n+1`) — summable by `Summable.comp_injective`
  + `cut_summable_of_abs`. The `tsum` is the genuine limit (not a junk value) because `Cut` is
  Cauchy-complete (N37 `CompleteSpace Cut`). Every object here is a statement ABOUT the derived `Cut`;
  the only Mathlib used is the topological-semiring `tsum` MACHINERY (the same Cauchy product
  `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` `cutExp_add` rode, with NO ℝ-valued norm) and the
  purely-combinatorial `Int.alternating_sum_range_choose` operating on the DERIVED object. NO Mathlib ℝ
  imported as content, NO `Real.cos`/`Real.sin`, NO posited trig, NO `Real.pi`.

  ★ THE THEORY-NATIVE READING (the Born-unit-circle). `(cutCos, cutSin)` parametrizes the
  BORN-SELF-OVERLAP circle `{(c,s) : c²+s²=1} ⊂ Cut²` — the positive self-overlap form (Born = positivity)
  as a closed one-parameter orbit. The Pythagorean identity `cutSin²+cutCos²=1` is LOAD-BEARING here: it
  is the statement that the orbit CLOSES on the Born circle (the return normalization / Gauss-sphere
  circumference the scale tower is expressed in). It is NOT decoration: delete every physics word and the
  content — that the derived-ℝ orbit `t ↦ (cutCos t, cutSin t)` lands on the unit self-overlap circle — is
  a proved analytic fact about `Cut`.

  ★ THE ROUTE (the alternating mirror of `cutExp`, strictly the same machinery).
    `cosTermC x n := (-1)ⁿ x²ⁿ/(2n)!`, `sinTermC x n := (-1)ⁿ x²ⁿ⁺¹/(2n+1)!` — the terms.
    summability by comp_injective on the banked factorial majorant (NO new majorant).
    `cutCos`/`cutSin` — the `tsum`s. Base values `cutCos 0 = 1`, `cutSin 0 = 0`; parity `cutCos` even,
    `cutSin` odd (termwise).
    ★ THE PYTHAGOREAN IDENTITY (the heart): via the trunk-native Cauchy product (the SAME one as
    `cutExp_add`), `cutCos² = ∑'_N cosCoeff N` and `cutSin² = ∑'_N sinCoeff N`, where each antidiagonal
    coefficient CLOSES (mirror of `expTermC_antidiagonal`) to `(±)x^(2N)/(2N)!·(∑_k C(2N,•))`. The `N=0`
    cos coefficient is `1`; for every `N≥1`, `cosCoeff (N+1) + sinCoeff N = 0` because the combinatorial
    identity `∑ (-1)ʲ C(2m,j) = 0` (`Int.alternating_sum_range_choose_of_ne`, m≥1) says the even-`j` and
    odd-`j` binomial sums are equal — the two Cauchy tails cancel termwise, leaving `1`.

  ★ THE ONE CAUSE (THE ONE LAW). The SAME C6 order/Cauchy-completeness that built the derived ℝ, made
  its nonneg bounded series converge, and made `cutExp`'s Cauchy product rearrange absolutely now makes
  the alternating series converge AND makes the cos²+sin² Cauchy product collapse to `1`; the SAME Born
  self-overlap positivity that recurs downstream is the circle `c²+s²=1` the orbit rides. One engine,
  several terminations: two convergent series, a closed orbit on the Born circle.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): there are NO load-bearing physics words. Delete "circle" /
  "Born" / "Gauss-sphere" and the file is the pure statement that over the completion-of-the-gather-of-
  closures of the derived rationals, the maps `C(x)=∑'(-1)ⁿx²ⁿ/(2n)!`, `S(x)=∑'(-1)ⁿx²ⁿ⁺¹/(2n+1)!` are
  well-defined, satisfy `C(0)=1`, `S(0)=0`, `C(-x)=C(x)`, `S(-x)=-S(x)`, and `S(x)²+C(x)²=1`. No name is
  load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system content
  import, NO ℝ-valued `Norm`, NO `Real.cos`/`Real.sin`/`Real.pi`.
-/
import Phys.Foundation.ContinuumExp
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Algebra.Ring.Parity

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

/-! ## The alternating cosine/sine terms and their absolute summability over the derived ℝ. -/

/-- The `n`-th cosine term over the derived ℝ: `(-1)ⁿ x²ⁿ/(2n)!`. MACHINERY (`pow`/`div`/factorial cast)
    on the DERIVED `Cut`, NOT a posited cosine. -/
def cosTermC (x : Cut) (n : ℕ) : Cut := (-1) ^ n * x ^ (2 * n) / ((2 * n).factorial : Cut)

/-- The `n`-th sine term over the derived ℝ: `(-1)ⁿ x²ⁿ⁺¹/(2n+1)!`. -/
def sinTermC (x : Cut) (n : ℕ) : Cut := (-1) ^ n * x ^ (2 * n + 1) / ((2 * n + 1).factorial : Cut)

/-- The absolute value of the `n`-th cosine term is the factorial majorant evaluated at `2n`:
    `|(-1)ⁿ x²ⁿ/(2n)!| = |x|²ⁿ/(2n)!`. -/
theorem cosTermC_abs_eq (x : Cut) (n : ℕ) :
    |cosTermC x n| = |x| ^ (2 * n) / ((2 * n).factorial : Cut) := by
  unfold cosTermC
  simp only [abs_div, abs_mul, abs_pow, abs_neg, abs_one, one_pow, one_mul]
  rw [abs_of_nonneg (show (0 : Cut) ≤ ((2 * n).factorial : Cut) by positivity)]

/-- The absolute value of the `n`-th sine term is the factorial majorant at `2n+1`. -/
theorem sinTermC_abs_eq (x : Cut) (n : ℕ) :
    |sinTermC x n| = |x| ^ (2 * n + 1) / ((2 * n + 1).factorial : Cut) := by
  unfold sinTermC
  simp only [abs_div, abs_mul, abs_pow, abs_neg, abs_one, one_pow, one_mul]
  rw [abs_of_nonneg (show (0 : Cut) ≤ ((2 * n + 1).factorial : Cut) by positivity)]

/-- The even reindex `n ↦ 2n` is injective. -/
theorem inj_two_mul : Function.Injective (fun n : ℕ => 2 * n) := by
  intro a b h; simpa using h

/-- The odd reindex `n ↦ 2n+1` is injective. -/
theorem inj_two_mul_add_one : Function.Injective (fun n : ℕ => 2 * n + 1) := by
  intro a b h; simp only at h; omega

/-- The cosine series is ABSOLUTELY summable over the derived ℝ: `∑ₙ |(-1)ⁿ x²ⁿ/(2n)!|` converges,
    being the BANKED factorial majorant `cut_summable_pow_div_factorial` (N39) precomposed with the
    injective even reindex `n ↦ 2n` (`Summable.comp_injective`). NO ℝ-valued norm, NO new majorant. -/
theorem cosTermC_abs_summable (x : Cut) : Summable (fun n => |cosTermC x n|) := by
  have hmaj : Summable (fun m => |x| ^ m / (m.factorial : Cut)) :=
    cut_summable_pow_div_factorial (abs_nonneg x)
  have hcomp := hmaj.comp_injective inj_two_mul
  refine hcomp.congr ?_
  intro n; rw [cosTermC_abs_eq]; rfl

/-- The sine series is ABSOLUTELY summable, via the banked majorant precomposed with `n ↦ 2n+1`. -/
theorem sinTermC_abs_summable (x : Cut) : Summable (fun n => |sinTermC x n|) := by
  have hmaj : Summable (fun m => |x| ^ m / (m.factorial : Cut)) :=
    cut_summable_pow_div_factorial (abs_nonneg x)
  have hcomp := hmaj.comp_injective inj_two_mul_add_one
  refine hcomp.congr ?_
  intro n; rw [sinTermC_abs_eq]; rfl

/-- The cosine series is summable for EVERY `x` (absolute summability lifts by `cut_summable_of_abs`). -/
theorem cosTermC_summable (x : Cut) : Summable (cosTermC x) :=
  cut_summable_of_abs (cosTermC_abs_summable x)

/-- The sine series is summable for EVERY `x`. -/
theorem sinTermC_summable (x : Cut) : Summable (sinTermC x) :=
  cut_summable_of_abs (sinTermC_abs_summable x)

/-! ## The continuous circular functions and their base values / parity. -/

/-- ★ THE DERIVED COSINE `cutCos x = ∑' n, (-1)ⁿ x²ⁿ/(2n)!` over the derived ℝ, as the `tsum` of the
    absolutely-convergent alternating series. The `tsum` is the GENUINE limit over the Cauchy-complete
    derived ℝ (N37). MACHINERY on the DERIVED `Cut`, NOT Mathlib's `Real.cos`. -/
def cutCos (x : Cut) : Cut := ∑' n, cosTermC x n

/-- ★ THE DERIVED SINE `cutSin x = ∑' n, (-1)ⁿ x²ⁿ⁺¹/(2n+1)!`. -/
def cutSin (x : Cut) : Cut := ∑' n, sinTermC x n

/-- The cosine series has `cutCos x` as its sum. -/
theorem cutCos_hasSum (x : Cut) : HasSum (cosTermC x) (cutCos x) :=
  (cosTermC_summable x).hasSum

/-- The sine series has `cutSin x` as its sum. -/
theorem cutSin_hasSum (x : Cut) : HasSum (sinTermC x) (cutSin x) :=
  (sinTermC_summable x).hasSum

/-- ★ `cutCos 0 = 1`: only the `n = 0` term `(-1)⁰·0⁰/0! = 1` survives. The value of the orbit at the
    fold's own basepoint. -/
theorem cutCos_zero : cutCos 0 = 1 := by
  unfold cutCos
  rw [tsum_eq_single 0]
  · unfold cosTermC; simp
  · intro n hn
    unfold cosTermC
    have h0 : (0 : Cut) ^ (2 * n) = 0 := by rw [zero_pow]; omega
    rw [h0]; ring

/-- ★ `cutSin 0 = 0`: every term has a positive power of `0`. -/
theorem cutSin_zero : cutSin 0 = 0 := by
  unfold cutSin
  have h : ∀ n, sinTermC (0 : Cut) n = 0 := by
    intro n; unfold sinTermC
    have h0 : (0 : Cut) ^ (2 * n + 1) = 0 := by rw [zero_pow]; omega
    rw [h0]; ring
  simp only [h]; exact tsum_zero

/-- ★ PARITY: `cutCos` is EVEN — `cutCos (-x) = cutCos x`. Termwise `(-x)²ⁿ = x²ⁿ`. -/
theorem cutCos_neg (x : Cut) : cutCos (-x) = cutCos x := by
  unfold cutCos
  apply tsum_congr; intro n; unfold cosTermC
  have hev : (-x) ^ (2 * n) = x ^ (2 * n) := by rw [pow_mul, neg_sq, ← pow_mul]
  rw [hev]

/-- ★ PARITY: `cutSin` is ODD — `cutSin (-x) = -cutSin x`. Termwise `(-x)²ⁿ⁺¹ = -x²ⁿ⁺¹`. -/
theorem cutSin_neg (x : Cut) : cutSin (-x) = -cutSin x := by
  unfold cutSin
  rw [← tsum_neg]
  apply tsum_congr; intro n; unfold sinTermC
  have hod : (-x) ^ (2 * n + 1) = -(x ^ (2 * n + 1)) := by
    rw [pow_succ, pow_succ, pow_mul, pow_mul, neg_sq]; ring
  rw [hod]; ring

/-! ## THE PYTHAGOREAN IDENTITY: the Born-unit-circle closure `cutSin² + cutCos² = 1`. -/

/-- The `N`-th Cauchy coefficient of `cutCos · cutCos`. -/
def cosCoeff (x : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, cosTermC x kl.1 * cosTermC x kl.2

/-- The `N`-th Cauchy coefficient of `cutSin · cutSin`. -/
def sinCoeff (x : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, sinTermC x kl.1 * sinTermC x kl.2

/-- The cos-product family over `ℕ × ℕ` is summable (both factors absolutely summable). -/
theorem cosProd_summable (x : Cut) :
    Summable (fun p : ℕ × ℕ => cosTermC x p.1 * cosTermC x p.2) :=
  cut_summable_mul_of_abs (cosTermC_abs_summable x) (cosTermC_abs_summable x)

/-- The sin-product family is summable. -/
theorem sinProd_summable (x : Cut) :
    Summable (fun p : ℕ × ℕ => sinTermC x p.1 * sinTermC x p.2) :=
  cut_summable_mul_of_abs (sinTermC_abs_summable x) (sinTermC_abs_summable x)

/-- The cos Cauchy-coefficient sequence is summable. -/
theorem cosCoeff_summable (x : Cut) : Summable (cosCoeff x) :=
  summable_sum_mul_antidiagonal_of_summable_mul (cosProd_summable x)

/-- The sin Cauchy-coefficient sequence is summable. -/
theorem sinCoeff_summable (x : Cut) : Summable (sinCoeff x) :=
  summable_sum_mul_antidiagonal_of_summable_mul (sinProd_summable x)

/-- ★ THE COSINE CAUCHY-COEFFICIENT CLOSED FORM (mirror of `expTermC_antidiagonal`):
    `∑_{k+l=N} cosTermC x k · cosTermC x l = (-1)ᴺ x²ᴺ/(2N)! · (∑_{k≤N} C(2N,2k))`. From the sign law
    `(-1)ᵏ(-1)ᴺ⁻ᵏ = (-1)ᴺ`, the power law `x²ᵏ·x²⁽ᴺ⁻ᵏ⁾ = x²ᴺ`, and the binomial-coefficient identity
    `C(2N,2k)·(2k)!·(2(N-k))! = (2N)!`. -/
theorem cosCoeff_closed (x : Cut) (N : ℕ) :
    cosCoeff x N = (-1) ^ N * x ^ (2 * N) / ((2 * N).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N).choose (2 * k) : Cut)) := by
  unfold cosCoeff
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold cosTermC
  have hsign : (-1 : Cut) ^ k * (-1) ^ (N - k) = (-1) ^ N := by rw [← pow_add]; congr 1; omega
  have hx : x ^ (2 * k) * x ^ (2 * (N - k)) = x ^ (2 * N) := by
    rw [← pow_add]; congr 1; omega
  have hchoose : (2 * N).choose (2 * k) * (2 * k).factorial * (2 * (N - k)).factorial
      = (2 * N).factorial := by
    have h2k : 2 * k ≤ 2 * N := by omega
    have := Nat.choose_mul_factorial_mul_factorial h2k
    rw [show 2 * N - 2 * k = 2 * (N - k) from by omega] at this
    exact this
  have hk0 : ((2 * k).factorial : Cut) ≠ 0 := by positivity
  have hl0 : ((2 * (N - k)).factorial : Cut) ≠ 0 := by positivity
  have hn0 : ((2 * N).factorial : Cut) ≠ 0 := by positivity
  have hden : ((2 * k).factorial : Cut) * ((2 * (N - k)).factorial : Cut) ≠ 0 := mul_ne_zero hk0 hl0
  have hcast : ((2 * N).choose (2 * k) : Cut) * ((2 * k).factorial : Cut)
      * ((2 * (N - k)).factorial : Cut) = ((2 * N).factorial : Cut) := by
    have := congrArg (fun z : ℕ => (z : Cut)) hchoose
    push_cast at this ⊢; linarith [this]
  rw [div_mul_div_comm]
  have hnum : (-1 : Cut) ^ k * x ^ (2 * k) * ((-1) ^ (N - k) * x ^ (2 * (N - k)))
      = (-1) ^ N * x ^ (2 * N) := by
    have h : (-1 : Cut) ^ k * x ^ (2 * k) * ((-1) ^ (N - k) * x ^ (2 * (N - k)))
        = ((-1) ^ k * (-1) ^ (N - k)) * (x ^ (2 * k) * x ^ (2 * (N - k))) := by ring
    rw [h, hsign, hx]
  show (-1 : Cut) ^ k * x ^ (2 * k) * ((-1) ^ (N - k) * x ^ (2 * (N - k)))
        / (((2 * k).factorial : Cut) * ((2 * (N - k)).factorial : Cut))
      = (-1) ^ N * x ^ (2 * N) / ((2 * N).factorial : Cut) * ((2 * N).choose (2 * k) : Cut)
  rw [hnum, div_mul_eq_mul_div, div_eq_div_iff hden hn0]
  linear_combination (-(((-1 : Cut)) ^ N * x ^ (2 * N))) * hcast

/-- ★ THE SINE CAUCHY-COEFFICIENT CLOSED FORM:
    `∑_{k+l=N} sinTermC x k · sinTermC x l = (-1)ᴺ x²ᴺ⁺²/(2N+2)! · (∑_{k≤N} C(2N+2,2k+1))`. The two odd
    exponents `(2k+1)+(2(N-k)+1) = 2N+2` combine; the sign is still `(-1)ᴺ`. -/
theorem sinCoeff_closed (x : Cut) (N : ℕ) :
    sinCoeff x N = (-1) ^ N * x ^ (2 * N + 2) / ((2 * N + 2).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N + 2).choose (2 * k + 1) : Cut)) := by
  unfold sinCoeff
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold sinTermC
  have hsign : (-1 : Cut) ^ k * (-1) ^ (N - k) = (-1) ^ N := by rw [← pow_add]; congr 1; omega
  have hx : x ^ (2 * k + 1) * x ^ (2 * (N - k) + 1) = x ^ (2 * N + 2) := by
    rw [← pow_add]; congr 1; omega
  have hchoose : (2 * N + 2).choose (2 * k + 1) * (2 * k + 1).factorial * (2 * (N - k) + 1).factorial
      = (2 * N + 2).factorial := by
    have hle : 2 * k + 1 ≤ 2 * N + 2 := by omega
    have := Nat.choose_mul_factorial_mul_factorial hle
    rw [show 2 * N + 2 - (2 * k + 1) = 2 * (N - k) + 1 from by omega] at this
    exact this
  have hk0 : ((2 * k + 1).factorial : Cut) ≠ 0 := by positivity
  have hl0 : ((2 * (N - k) + 1).factorial : Cut) ≠ 0 := by positivity
  have hn0 : ((2 * N + 2).factorial : Cut) ≠ 0 := by positivity
  have hden : ((2 * k + 1).factorial : Cut) * ((2 * (N - k) + 1).factorial : Cut) ≠ 0 :=
    mul_ne_zero hk0 hl0
  have hcast : ((2 * N + 2).choose (2 * k + 1) : Cut) * ((2 * k + 1).factorial : Cut)
      * ((2 * (N - k) + 1).factorial : Cut) = ((2 * N + 2).factorial : Cut) := by
    have := congrArg (fun z : ℕ => (z : Cut)) hchoose
    push_cast at this ⊢; linarith [this]
  rw [div_mul_div_comm]
  have hnum : (-1 : Cut) ^ k * x ^ (2 * k + 1) * ((-1) ^ (N - k) * x ^ (2 * (N - k) + 1))
      = (-1) ^ N * x ^ (2 * N + 2) := by
    have h : (-1 : Cut) ^ k * x ^ (2 * k + 1) * ((-1) ^ (N - k) * x ^ (2 * (N - k) + 1))
        = ((-1) ^ k * (-1) ^ (N - k)) * (x ^ (2 * k + 1) * x ^ (2 * (N - k) + 1)) := by ring
    rw [h, hsign, hx]
  show (-1 : Cut) ^ k * x ^ (2 * k + 1) * ((-1) ^ (N - k) * x ^ (2 * (N - k) + 1))
        / (((2 * k + 1).factorial : Cut) * ((2 * (N - k) + 1).factorial : Cut))
      = (-1) ^ N * x ^ (2 * N + 2) / ((2 * N + 2).factorial : Cut)
          * ((2 * N + 2).choose (2 * k + 1) : Cut)
  rw [hnum, div_mul_eq_mul_div, div_eq_div_iff hden hn0]
  linear_combination (-(((-1 : Cut)) ^ N * x ^ (2 * N + 2))) * hcast

/-- The even/odd split of a range of odd length `2m+1`: `∑_{j<2m+1} g j = ∑_{k≤m} g(2k) + ∑_{k<m} g(2k+1)`. -/
theorem sum_range_odd_split (m : ℕ) (g : ℕ → ℤ) :
    ∑ j ∈ range (2 * m + 1), g j
      = (∑ k ∈ range (m + 1), g (2 * k)) + ∑ k ∈ range m, g (2 * k + 1) := by
  induction m with
  | zero => simp
  | succ p ih =>
    have e : 2 * (p + 1) + 1 = (2 * p + 1) + 1 + 1 := by ring
    rw [e, sum_range_succ _ ((2 * p + 1) + 1), sum_range_succ _ (2 * p + 1), ih]
    rw [sum_range_succ (fun k => g (2 * k)) (p + 1), sum_range_succ (fun k => g (2 * k + 1)) p]
    simp only [show 2 * (p + 1) = 2 * p + 1 + 1 from by ring]
    ring

/-- ★ THE COMBINATORIAL CANCELLATION (over ℤ): for `m ≥ 1`, the even-index and odd-index binomial sums
    of `C(2m, ·)` are EQUAL, because `∑_j (-1)ʲ C(2m,j) = (1-1)²ᵐ = 0`
    (`Int.alternating_sum_range_choose_of_ne`). This is what makes the cos²+sin² Cauchy tails cancel. -/
theorem even_choose_eq_odd_choose (m : ℕ) (hm : m ≠ 0) :
    (∑ k ∈ range (m + 1), ((2 * m).choose (2 * k) : ℤ))
      = ∑ k ∈ range m, ((2 * m).choose (2 * k + 1) : ℤ) := by
  have halt : (∑ j ∈ range (2 * m + 1), ((-1) ^ j * (2 * m).choose j : ℤ)) = 0 :=
    Int.alternating_sum_range_choose_of_ne (by omega)
  rw [sum_range_odd_split m (fun j => (-1) ^ j * (2 * m).choose j)] at halt
  have heven : (∑ k ∈ range (m + 1), ((-1) ^ (2 * k) * (2 * m).choose (2 * k) : ℤ))
      = ∑ k ∈ range (m + 1), ((2 * m).choose (2 * k) : ℤ) := by
    apply sum_congr rfl; intro k _; rw [pow_mul]; norm_num
  have hodd : (∑ k ∈ range m, ((-1) ^ (2 * k + 1) * (2 * m).choose (2 * k + 1) : ℤ))
      = -(∑ k ∈ range m, ((2 * m).choose (2 * k + 1) : ℤ)) := by
    rw [← sum_neg_distrib]; apply sum_congr rfl; intro k _; rw [pow_succ, pow_mul]; norm_num
  rw [heven, hodd] at halt
  linarith [halt]

/-- The cast of `even_choose_eq_odd_choose` to the derived ℝ `Cut`. -/
theorem even_choose_eq_odd_choose_cut (m : ℕ) (hm : m ≠ 0) :
    (∑ k ∈ range (m + 1), ((2 * m).choose (2 * k) : Cut))
      = ∑ k ∈ range m, ((2 * m).choose (2 * k + 1) : Cut) := by
  have hz := even_choose_eq_odd_choose m hm
  have hcast := congrArg (fun z : ℤ => (z : Cut)) hz
  push_cast at hcast
  convert hcast using 2

/-- ★ THE PER-INDEX CANCELLATION: for every `N`, `cosCoeff x (N+1) + sinCoeff x N = 0`. The cos
    coefficient at `N+1` and the sin coefficient at `N` both carry `x^(2N+2)/(2N+2)!·(-1)^(N+1)`, and
    their binomial sums (`∑ C(2N+2, 2k)` vs `∑ C(2N+2, 2k+1)`) are EQUAL by the combinatorial
    cancellation — so the two terms are exact negatives (the alternating sign `(-1)^(N+1)` vs `(-1)^N`). -/
theorem cosCoeff_succ_add_sinCoeff (x : Cut) (N : ℕ) :
    cosCoeff x (N + 1) + sinCoeff x N = 0 := by
  rw [cosCoeff_closed, sinCoeff_closed]
  have e1 : 2 * (N + 1) = 2 * N + 2 := by ring
  rw [e1]
  have hev : (∑ k ∈ range (N + 1 + 1), ((2 * N + 2).choose (2 * k) : Cut))
      = ∑ k ∈ range (N + 1), ((2 * N + 2).choose (2 * k + 1) : Cut) := by
    have := even_choose_eq_odd_choose_cut (N + 1) (by omega)
    rw [show 2 * (N + 1) = 2 * N + 2 from by ring] at this
    exact this
  rw [hev]
  -- both terms now: (-1)^(N+1)·x^(2N+2)/(2N+2)!·S  and  (-1)^N·x^(2N+2)/(2N+2)!·S
  rw [pow_succ]
  ring

/-- ★★ THE PYTHAGOREAN IDENTITY over the derived ℝ — the BORN-UNIT-CIRCLE closure:
    `cutSin x² + cutCos x² = 1`. Both squares expand by the trunk-native Cauchy product into
    `∑'_N cosCoeff`, `∑'_N sinCoeff`; the `N=0` cos coefficient is `1`, and every higher pair cancels
    (`cosCoeff (N+1) + sinCoeff N = 0`), leaving exactly `1`. The orbit `t ↦ (cutCos t, cutSin t)` lands
    on the unit self-overlap circle. -/
theorem cutSin_sq_add_cutCos_sq (x : Cut) :
    cutSin x * cutSin x + cutCos x * cutCos x = 1 := by
  have hcos : cutCos x * cutCos x = ∑' N, cosCoeff x N := by
    unfold cutCos cosCoeff
    rw [(cosTermC_summable x).tsum_mul_tsum_eq_tsum_sum_antidiagonal (cosTermC_summable x)
      (cosProd_summable x)]
  have hsin : cutSin x * cutSin x = ∑' N, sinCoeff x N := by
    unfold cutSin sinCoeff
    rw [(sinTermC_summable x).tsum_mul_tsum_eq_tsum_sum_antidiagonal (sinTermC_summable x)
      (sinProd_summable x)]
  rw [hsin, hcos, add_comm, (cosCoeff_summable x).tsum_eq_zero_add]
  have hzero : cosCoeff x 0 = 1 := by
    unfold cosCoeff
    simp [cosTermC]
  rw [hzero, add_assoc]
  have hshift : Summable (fun n => cosCoeff x (n + 1)) :=
    (cosCoeff_summable x).comp_injective (add_left_injective 1)
  have hcombine : (∑' n, cosCoeff x (n + 1)) + (∑' n, sinCoeff x n)
      = ∑' n, (cosCoeff x (n + 1) + sinCoeff x n) := (hshift.tsum_add (sinCoeff_summable x)).symm
  rw [hcombine]
  have hz : (fun n => cosCoeff x (n + 1) + sinCoeff x n) = (fun _ => (0 : Cut)) := by
    funext n; exact cosCoeff_succ_add_sinCoeff x n
  rw [hz, tsum_zero, add_zero]

/-! ## NON-VACUITY (W8): the identities are genuine on nonzero arguments. -/

/-- NON-VACUITY: the Pythagorean identity holds at `x = 1` — a concrete nonzero argument where both
    `cutCos 1` and `cutSin 1` are nontrivial series, witnessing `cutSin_sq_add_cutCos_sq` is not vacuous
    at `x = 0` alone (where `cutSin 0 = 0`, `cutCos 0 = 1` make it the bare `0 + 1 = 1`). -/
theorem cutSin_sq_add_cutCos_sq_one : cutSin 1 * cutSin 1 + cutCos 1 * cutCos 1 = 1 :=
  cutSin_sq_add_cutCos_sq 1

end

end ContinuumQ
end Phys.Foundation
