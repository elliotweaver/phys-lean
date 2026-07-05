/-
  # N324 — THE DERIVED-ℝ TRIG ADDITION FORMULAS AND BOUNDEDNESS over the DERIVED ℝ `ContinuumQ.Cut`.

  N323 (`ContinuumTrig`) banked the derived circular functions `cutCos x = ∑' n, (-1)ⁿx²ⁿ/(2n)!`,
  `cutSin x = ∑' n, (-1)ⁿx²ⁿ⁺¹/(2n+1)!` over the derived ℝ `Cut`, with the Born-unit-circle Pythagorean
  identity `cutSin² + cutCos² = 1`. THIS file banks the GROUP LAW of the Born-circle orbit — the two
  addition formulas — and the orbit's confinement to `[-1,1]` (boundedness). It is the arc-B
  π-prerequisite's second half: the addition formulas are what `cutCos` continuity (and hence the IVT
  construction of `cutPi`, childed to the successor) rides, exactly as `cutExp_continuous` rode
  `cutExp_add` (N175).

  ★ WHY THIS IS NOT A POSIT (STANDARD §3 — THE NUMBER-TOWER GATE). The addition formulas are DERIVED
  from the banked `cutCos`/`cutSin` power series via the arena's OWN two-argument Cauchy product (the
  same `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` `cutExp_add` and the N323 Pythagorean identity
  rode, with NO ℝ-valued norm) and the purely-combinatorial even/odd binomial split (`add_pow` +
  `Nat.choose_mul_factorial_mul_factorial`). NO Mathlib ℝ imported as content, NO `Real.cos`/`Real.sin`/
  `Real.cos_add`, NO posited trig. Every object is a statement ABOUT the derived `Cut`.

  ★ THE THEORY-NATIVE READING. The addition formulas are the GROUP LAW of the one-parameter Born-circle
  orbit `t ↦ (cutCos t, cutSin t)` (N323): translating the parameter by `b` ROTATES the orbit by the
  `(cutCos b, cutSin b)` frame. They GENERALIZE the banked Pythagorean identity — that identity is the
  `b = -a` special case of `cutCos_add` (using `cutCos 0 = 1`, `cutCos` even, `cutSin` odd). The
  boundedness `|cutCos|, |cutSin| ≤ 1` is the orbit lying ON the unit self-overlap circle (each
  coordinate's square is ≤ the Born sum `= 1`).

  ★ THE ROUTE (the two-argument mirror of N323's one-argument Cauchy machinery).
    `ccCoeff a b N = ∑_{k+l=N} cosTermC a k · cosTermC b l` (and `ssCoeff`, `scCoeff`, `csCoeff`).
    Each closes to a two-variable binomial sum keeping `a`, `b` powers separate (mirror of
    `cosCoeff_closed`). The per-N assembly:
      `cosTermC (a+b) (N+1) = ccCoeff a b (N+1) − ssCoeff a b N`,  `cosTermC (a+b) 0 = ccCoeff a b 0`
      `sinTermC (a+b) N     = scCoeff a b N + csCoeff a b N`
    holds because `(a+b)^(2M)` expands (`add_pow`) into `∑_{j<2M+1} C(2M,j) aʲ b^(2M−j)`, whose range
    SPLITS into even-index (`j=2k`) + odd-index (`j=2k+1`) parts: the even part reassembles the `cc`
    (resp. `cs`) Cauchy sum, the odd part the `ss`-shifted (resp. `sc`) Cauchy sum. The alternating
    signs line up — `ssCoeff` carries `(-1)ᴺ` against `cosTermC`'s `(-1)ᴺ⁺¹`, giving the MINUS in the
    cosine law; `scCoeff`/`csCoeff` both carry `(-1)ᴺ`, giving the PLUS in the sine law. The `tsum`
    lift (`tsum_eq_zero_add`, `tsum_sub`, shifted summability, the two-argument Cauchy product) assembles
    the per-N identities into the full formulas.

  ★ THE ONE CAUSE (THE ONE LAW). The SAME C6 order/Cauchy-completeness that built the derived ℝ, made
  `cutExp`'s Cauchy product rearrange, and made cos²+sin² collapse to `1` now makes the two-argument
  Cauchy product rearrange and the even/odd binomial split close the group law. One engine, one more
  termination.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): there are NO physics words. Delete "Born" / "circle" / "orbit"
  and the file is the pure statement that over the completion-of-the-gather-of-closures of the derived
  rationals, `C(a+b) = C a·C b − S a·S b`, `S(a+b) = S a·C b + C a·S b`, and `|C x| ≤ 1`, `|S x| ≤ 1`.
  No name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system content
  import, NO ℝ-valued `Norm`, NO `Real.cos`/`Real.sin`/`Real.pi`.
-/
import Phys.Foundation.ContinuumTrig
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Data.Nat.Choose.Sum

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

/-! ## Generic even/odd splits of a finite range (MACHINERY over any `AddCommMonoid`). -/

/-- The even/odd split of a range of ODD length `2m+1`: `∑_{j<2m+1} g j =
    ∑_{k≤m} g(2k) + ∑_{k<m} g(2k+1)`. Reassociation closed by `abel`. -/
theorem sum_range_odd_split_gen {M : Type*} [AddCommMonoid M] (m : ℕ) (g : ℕ → M) :
    ∑ j ∈ range (2 * m + 1), g j
      = (∑ k ∈ range (m + 1), g (2 * k)) + ∑ k ∈ range m, g (2 * k + 1) := by
  induction m with
  | zero => simp
  | succ p ih =>
    have e : 2 * (p + 1) + 1 = (2 * p + 1) + 1 + 1 := by ring
    rw [e, sum_range_succ _ ((2 * p + 1) + 1), sum_range_succ _ (2 * p + 1), ih]
    rw [sum_range_succ (fun k => g (2 * k)) (p + 1), sum_range_succ (fun k => g (2 * k + 1)) p]
    simp only [show 2 * (p + 1) = 2 * p + 1 + 1 from by ring]
    abel

/-- The even/odd split of a range of EVEN length `2m+2`: `∑_{j<2m+2} g j =
    ∑_{k≤m} g(2k) + ∑_{k≤m} g(2k+1)`. -/
theorem sum_range_even_split_gen {M : Type*} [AddCommMonoid M] (m : ℕ) (g : ℕ → M) :
    ∑ j ∈ range (2 * m + 2), g j
      = (∑ k ∈ range (m + 1), g (2 * k)) + ∑ k ∈ range (m + 1), g (2 * k + 1) := by
  induction m with
  | zero => simp [Finset.sum_range_succ]
  | succ p ih =>
    have e : 2 * (p + 1) + 2 = (2 * p + 2) + 1 + 1 := by ring
    rw [e, sum_range_succ _ ((2 * p + 2) + 1), sum_range_succ _ (2 * p + 2), ih]
    rw [sum_range_succ (fun k => g (2 * k)) (p + 1), sum_range_succ (fun k => g (2 * k + 1)) (p + 1)]
    abel

/-! ## The four two-argument Cauchy coefficients and their summability. -/

/-- The `N`-th Cauchy coefficient of `cutCos a · cutCos b`. -/
def ccCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, cosTermC a kl.1 * cosTermC b kl.2

/-- The `N`-th Cauchy coefficient of `cutSin a · cutSin b`. -/
def ssCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, sinTermC a kl.1 * sinTermC b kl.2

/-- The `N`-th Cauchy coefficient of `cutSin a · cutCos b`. -/
def scCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, sinTermC a kl.1 * cosTermC b kl.2

/-- The `N`-th Cauchy coefficient of `cutCos a · cutSin b`. -/
def csCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, cosTermC a kl.1 * sinTermC b kl.2

theorem ccProd_summable (a b : Cut) :
    Summable (fun p : ℕ × ℕ => cosTermC a p.1 * cosTermC b p.2) :=
  cut_summable_mul_of_abs (cosTermC_abs_summable a) (cosTermC_abs_summable b)

theorem ssProd_summable (a b : Cut) :
    Summable (fun p : ℕ × ℕ => sinTermC a p.1 * sinTermC b p.2) :=
  cut_summable_mul_of_abs (sinTermC_abs_summable a) (sinTermC_abs_summable b)

theorem scProd_summable (a b : Cut) :
    Summable (fun p : ℕ × ℕ => sinTermC a p.1 * cosTermC b p.2) :=
  cut_summable_mul_of_abs (sinTermC_abs_summable a) (cosTermC_abs_summable b)

theorem csProd_summable (a b : Cut) :
    Summable (fun p : ℕ × ℕ => cosTermC a p.1 * sinTermC b p.2) :=
  cut_summable_mul_of_abs (cosTermC_abs_summable a) (sinTermC_abs_summable b)

theorem ccCoeff_summable (a b : Cut) : Summable (ccCoeff a b) :=
  summable_sum_mul_antidiagonal_of_summable_mul (ccProd_summable a b)

theorem ssCoeff_summable (a b : Cut) : Summable (ssCoeff a b) :=
  summable_sum_mul_antidiagonal_of_summable_mul (ssProd_summable a b)

theorem scCoeff_summable (a b : Cut) : Summable (scCoeff a b) :=
  summable_sum_mul_antidiagonal_of_summable_mul (scProd_summable a b)

theorem csCoeff_summable (a b : Cut) : Summable (csCoeff a b) :=
  summable_sum_mul_antidiagonal_of_summable_mul (csProd_summable a b)

/-- `cutCos a · cutCos b = ∑'_N ccCoeff a b N` (the two-argument Cauchy product). -/
theorem cutCos_mul_cutCos (a b : Cut) : cutCos a * cutCos b = ∑' N, ccCoeff a b N := by
  unfold cutCos ccCoeff
  rw [(cosTermC_summable a).tsum_mul_tsum_eq_tsum_sum_antidiagonal (cosTermC_summable b)
    (ccProd_summable a b)]

theorem cutSin_mul_cutSin (a b : Cut) : cutSin a * cutSin b = ∑' N, ssCoeff a b N := by
  unfold cutSin ssCoeff
  rw [(sinTermC_summable a).tsum_mul_tsum_eq_tsum_sum_antidiagonal (sinTermC_summable b)
    (ssProd_summable a b)]

theorem cutSin_mul_cutCos (a b : Cut) : cutSin a * cutCos b = ∑' N, scCoeff a b N := by
  unfold cutSin cutCos scCoeff
  rw [(sinTermC_summable a).tsum_mul_tsum_eq_tsum_sum_antidiagonal (cosTermC_summable b)
    (scProd_summable a b)]

theorem cutCos_mul_cutSin (a b : Cut) : cutCos a * cutSin b = ∑' N, csCoeff a b N := by
  unfold cutCos cutSin csCoeff
  rw [(cosTermC_summable a).tsum_mul_tsum_eq_tsum_sum_antidiagonal (sinTermC_summable b)
    (csProd_summable a b)]

/-! ## The Cauchy-coefficient closed forms (two-variable, `a`,`b` powers kept separate). -/

/-- `ccCoeff` closed form: `∑_{k≤N} (-1)ᴺ·(a²ᵏ b^(2(N−k)))/(2N)!·C(2N,2k)` (mirror of
    `cosCoeff_closed`, keeping `a`, `b` separate). -/
theorem ccCoeff_closed (a b : Cut) (N : ℕ) :
    ccCoeff a b N = ∑ k ∈ range (N + 1),
      (-1) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k))) / ((2 * N).factorial : Cut)
        * ((2 * N).choose (2 * k) : Cut) := by
  unfold ccCoeff
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold cosTermC
  have hsign : (-1 : Cut) ^ k * (-1) ^ (N - k) = (-1) ^ N := by rw [← pow_add]; congr 1; omega
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
  have hnum : (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k)))
      = (-1) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k))) := by
    have h : (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k)))
        = ((-1) ^ k * (-1) ^ (N - k)) * (a ^ (2 * k) * b ^ (2 * (N - k))) := by ring
    rw [h, hsign]
  show (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k)))
        / (((2 * k).factorial : Cut) * ((2 * (N - k)).factorial : Cut))
      = (-1) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k))) / ((2 * N).factorial : Cut)
          * ((2 * N).choose (2 * k) : Cut)
  rw [hnum, div_mul_eq_mul_div, div_eq_div_iff hden hn0]
  linear_combination (-((-1 : Cut) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k))))) * hcast

/-- `ccCoeff` factored: `(-1)ᴺ/(2N)! · ∑_{k≤N} C(2N,2k)·(a²ᵏ b^(2(N−k)))`. -/
theorem ccCoeff_factored (a b : Cut) (N : ℕ) :
    ccCoeff a b N = (-1) ^ N / ((2 * N).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N - k)))) := by
  rw [ccCoeff_closed, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k _; ring

/-- `ssCoeff` closed form (mirror of `sinCoeff_closed`, `a`,`b` separate): the two odd exponents
    `(2k+1)+(2(N−k)+1) = 2N+2` combine; sign `(-1)ᴺ`; denominator `(2N+2)!`. -/
theorem ssCoeff_closed (a b : Cut) (N : ℕ) :
    ssCoeff a b N = ∑ k ∈ range (N + 1),
      (-1) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)) / ((2 * N + 2).factorial : Cut)
        * ((2 * N + 2).choose (2 * k + 1) : Cut) := by
  unfold ssCoeff
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold sinTermC
  have hsign : (-1 : Cut) ^ k * (-1) ^ (N - k) = (-1) ^ N := by rw [← pow_add]; congr 1; omega
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
  have hnum : (-1 : Cut) ^ k * a ^ (2 * k + 1) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
      = (-1) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)) := by
    have h : (-1 : Cut) ^ k * a ^ (2 * k + 1) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
        = ((-1) ^ k * (-1) ^ (N - k)) * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)) := by ring
    rw [h, hsign]
  show (-1 : Cut) ^ k * a ^ (2 * k + 1) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
        / (((2 * k + 1).factorial : Cut) * ((2 * (N - k) + 1).factorial : Cut))
      = (-1) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)) / ((2 * N + 2).factorial : Cut)
          * ((2 * N + 2).choose (2 * k + 1) : Cut)
  rw [hnum, div_mul_eq_mul_div, div_eq_div_iff hden hn0]
  linear_combination (-((-1 : Cut) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)))) * hcast

/-- `ssCoeff` factored. -/
theorem ssCoeff_factored (a b : Cut) (N : ℕ) :
    ssCoeff a b N = (-1) ^ N / ((2 * N + 2).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N + 2).choose (2 * k + 1) : Cut)
        * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1))) := by
  rw [ssCoeff_closed, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k _; ring

/-- `scCoeff` factored: sin `a^(2k+1)`, cos `b^(2(N−k))` → power `2N+1`, sign `(-1)ᴺ`, denom `(2N+1)!`,
    binomial `C(2N+1,2k+1)`. -/
theorem scCoeff_factored (a b : Cut) (N : ℕ) :
    scCoeff a b N = (-1) ^ N / ((2 * N + 1).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N + 1).choose (2 * k + 1) : Cut)
        * (a ^ (2 * k + 1) * b ^ (2 * (N - k)))) := by
  unfold scCoeff
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold sinTermC cosTermC
  have hsign : (-1 : Cut) ^ k * (-1) ^ (N - k) = (-1) ^ N := by rw [← pow_add]; congr 1; omega
  have hchoose : (2 * N + 1).choose (2 * k + 1) * (2 * k + 1).factorial * (2 * (N - k)).factorial
      = (2 * N + 1).factorial := by
    have hle : 2 * k + 1 ≤ 2 * N + 1 := by omega
    have := Nat.choose_mul_factorial_mul_factorial hle
    rw [show 2 * N + 1 - (2 * k + 1) = 2 * (N - k) from by omega] at this
    exact this
  have hk0 : ((2 * k + 1).factorial : Cut) ≠ 0 := by positivity
  have hl0 : ((2 * (N - k)).factorial : Cut) ≠ 0 := by positivity
  have hn0 : ((2 * N + 1).factorial : Cut) ≠ 0 := by positivity
  have hden : ((2 * k + 1).factorial : Cut) * ((2 * (N - k)).factorial : Cut) ≠ 0 :=
    mul_ne_zero hk0 hl0
  have hcast : ((2 * N + 1).choose (2 * k + 1) : Cut) * ((2 * k + 1).factorial : Cut)
      * ((2 * (N - k)).factorial : Cut) = ((2 * N + 1).factorial : Cut) := by
    have := congrArg (fun z : ℕ => (z : Cut)) hchoose
    push_cast at this ⊢; linarith [this]
  rw [div_mul_div_comm]
  have hnum : (-1 : Cut) ^ k * a ^ (2 * k + 1) * ((-1) ^ (N - k) * b ^ (2 * (N - k)))
      = (-1) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k))) := by
    have h : (-1 : Cut) ^ k * a ^ (2 * k + 1) * ((-1) ^ (N - k) * b ^ (2 * (N - k)))
        = ((-1) ^ k * (-1) ^ (N - k)) * (a ^ (2 * k + 1) * b ^ (2 * (N - k))) := by ring
    rw [h, hsign]
  show (-1 : Cut) ^ k * a ^ (2 * k + 1) * ((-1) ^ (N - k) * b ^ (2 * (N - k)))
        / (((2 * k + 1).factorial : Cut) * ((2 * (N - k)).factorial : Cut))
      = (-1) ^ N / ((2 * N + 1).factorial : Cut)
          * (((2 * N + 1).choose (2 * k + 1) : Cut) * (a ^ (2 * k + 1) * b ^ (2 * (N - k))))
  rw [hnum]
  rw [show (-1 : Cut) ^ N / ((2 * N + 1).factorial : Cut)
      * (((2 * N + 1).choose (2 * k + 1) : Cut) * (a ^ (2 * k + 1) * b ^ (2 * (N - k))))
      = ((2 * N + 1).choose (2 * k + 1) : Cut) * ((-1) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k))))
        / ((2 * N + 1).factorial : Cut) by ring]
  rw [div_eq_div_iff hden hn0]
  linear_combination (-(-1 : Cut) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k)))) * hcast

/-- `csCoeff` factored: cos `a^(2k)`, sin `b^(2(N−k)+1)` → power `2N+1`, sign `(-1)ᴺ`, denom `(2N+1)!`,
    binomial `C(2N+1,2k)`. -/
theorem csCoeff_factored (a b : Cut) (N : ℕ) :
    csCoeff a b N = (-1) ^ N / ((2 * N + 1).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N + 1).choose (2 * k) : Cut)
        * (a ^ (2 * k) * b ^ (2 * (N - k) + 1))) := by
  unfold csCoeff
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold cosTermC sinTermC
  have hsign : (-1 : Cut) ^ k * (-1) ^ (N - k) = (-1) ^ N := by rw [← pow_add]; congr 1; omega
  have hchoose : (2 * N + 1).choose (2 * k) * (2 * k).factorial * (2 * (N - k) + 1).factorial
      = (2 * N + 1).factorial := by
    have hle : 2 * k ≤ 2 * N + 1 := by omega
    have := Nat.choose_mul_factorial_mul_factorial hle
    rw [show 2 * N + 1 - 2 * k = 2 * (N - k) + 1 from by omega] at this
    exact this
  have hk0 : ((2 * k).factorial : Cut) ≠ 0 := by positivity
  have hl0 : ((2 * (N - k) + 1).factorial : Cut) ≠ 0 := by positivity
  have hn0 : ((2 * N + 1).factorial : Cut) ≠ 0 := by positivity
  have hden : ((2 * k).factorial : Cut) * ((2 * (N - k) + 1).factorial : Cut) ≠ 0 :=
    mul_ne_zero hk0 hl0
  have hcast : ((2 * N + 1).choose (2 * k) : Cut) * ((2 * k).factorial : Cut)
      * ((2 * (N - k) + 1).factorial : Cut) = ((2 * N + 1).factorial : Cut) := by
    have := congrArg (fun z : ℕ => (z : Cut)) hchoose
    push_cast at this ⊢; linarith [this]
  rw [div_mul_div_comm]
  have hnum : (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
      = (-1) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)) := by
    have h : (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
        = ((-1) ^ k * (-1) ^ (N - k)) * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)) := by ring
    rw [h, hsign]
  show (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
        / (((2 * k).factorial : Cut) * ((2 * (N - k) + 1).factorial : Cut))
      = (-1) ^ N / ((2 * N + 1).factorial : Cut)
          * (((2 * N + 1).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)))
  rw [hnum]
  rw [show (-1 : Cut) ^ N / ((2 * N + 1).factorial : Cut)
      * (((2 * N + 1).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)))
      = ((2 * N + 1).choose (2 * k) : Cut) * ((-1) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)))
        / ((2 * N + 1).factorial : Cut) by ring]
  rw [div_eq_div_iff hden hn0]
  linear_combination (-(-1 : Cut) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k) + 1))) * hcast

/-! ## The per-N assembly identities (even/odd binomial split of `(a+b)`-powers). -/

/-- The `N=0` cosine base: `cosTermC (a+b) 0 = ccCoeff a b 0`. -/
theorem cosTermC_add_zero (a b : Cut) : cosTermC (a + b) 0 = ccCoeff a b 0 := by
  unfold cosTermC ccCoeff
  simp [cosTermC]

/-- ★ THE COSINE PER-N ASSEMBLY: `cosTermC (a+b) (N+1) = ccCoeff a b (N+1) − ssCoeff a b N`.
    `(a+b)^(2N+2)` splits (`add_pow` + odd-length even/odd split) into the even-index `cc` sum plus the
    odd-index `ss`-shifted sum; the alternating sign `(-1)ᴺ` on `ss` against `(-1)ᴺ⁺¹` on the cosine
    term produces the MINUS. -/
theorem cosTermC_add_succ (a b : Cut) (N : ℕ) :
    cosTermC (a + b) (N + 1) = ccCoeff a b (N + 1) - ssCoeff a b N := by
  unfold cosTermC
  rw [ccCoeff_factored, ssCoeff_factored]
  have hexp : (a + b) ^ (2 * (N + 1))
      = ∑ j ∈ range (2 * (N + 1) + 1),
          a ^ j * b ^ (2 * (N + 1) - j) * ((2 * (N + 1)).choose j : Cut) := by
    rw [add_pow]
  rw [hexp, sum_range_odd_split_gen (N + 1)
    (fun j => a ^ j * b ^ (2 * (N + 1) - j) * ((2 * (N + 1)).choose j : Cut))]
  simp only [show 2 * (N + 1) = 2 * N + 2 from by ring]
  have hEven : (∑ k ∈ range (N + 1 + 1),
        a ^ (2 * k) * b ^ (2 * N + 2 - 2 * k) * ((2 * N + 2).choose (2 * k) : Cut))
      = ∑ k ∈ range (N + 1 + 1),
        ((2 * N + 2).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N + 1 - k))) := by
    apply Finset.sum_congr rfl
    intro k hk
    rw [Finset.mem_range] at hk
    have : 2 * (N + 1 - k) = 2 * N + 2 - 2 * k := by omega
    rw [this]; ring
  have hOdd : (∑ k ∈ range (N + 1),
        a ^ (2 * k + 1) * b ^ (2 * N + 2 - (2 * k + 1)) * ((2 * N + 2).choose (2 * k + 1) : Cut))
      = ∑ k ∈ range (N + 1),
        ((2 * N + 2).choose (2 * k + 1) : Cut) * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)) := by
    apply Finset.sum_congr rfl
    intro k hk
    rw [Finset.mem_range] at hk
    have : 2 * (N - k) + 1 = 2 * N + 2 - (2 * k + 1) := by omega
    rw [this]; ring
  rw [hEven, hOdd]
  have hd : ((2 * N + 2).factorial : Cut) ≠ 0 := by positivity
  field_simp
  ring

/-- ★ THE SINE PER-N ASSEMBLY: `sinTermC (a+b) N = scCoeff a b N + csCoeff a b N`.
    `(a+b)^(2N+1)` splits (`add_pow` + even-length even/odd split) into the even-index `cs` sum plus the
    odd-index `sc` sum; both carry `(-1)ᴺ`, producing the PLUS. -/
theorem sinTermC_add (a b : Cut) (N : ℕ) :
    sinTermC (a + b) N = scCoeff a b N + csCoeff a b N := by
  unfold sinTermC
  rw [scCoeff_factored, csCoeff_factored]
  have hexp : (a + b) ^ (2 * N + 1)
      = ∑ j ∈ range (2 * N + 1 + 1),
          a ^ j * b ^ (2 * N + 1 - j) * ((2 * N + 1).choose j : Cut) := by
    rw [add_pow]
  rw [show 2 * N + 1 + 1 = 2 * N + 2 from by ring] at hexp
  rw [hexp, sum_range_even_split_gen N
    (fun j => a ^ j * b ^ (2 * N + 1 - j) * ((2 * N + 1).choose j : Cut))]
  have hEven : (∑ k ∈ range (N + 1),
        a ^ (2 * k) * b ^ (2 * N + 1 - 2 * k) * ((2 * N + 1).choose (2 * k) : Cut))
      = ∑ k ∈ range (N + 1),
        ((2 * N + 1).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)) := by
    apply Finset.sum_congr rfl
    intro k hk; rw [Finset.mem_range] at hk
    have : 2 * (N - k) + 1 = 2 * N + 1 - 2 * k := by omega
    rw [this]; ring
  have hOdd : (∑ k ∈ range (N + 1),
        a ^ (2 * k + 1) * b ^ (2 * N + 1 - (2 * k + 1)) * ((2 * N + 1).choose (2 * k + 1) : Cut))
      = ∑ k ∈ range (N + 1),
        ((2 * N + 1).choose (2 * k + 1) : Cut) * (a ^ (2 * k + 1) * b ^ (2 * (N - k))) := by
    apply Finset.sum_congr rfl
    intro k hk; rw [Finset.mem_range] at hk
    have : 2 * (N - k) = 2 * N + 1 - (2 * k + 1) := by omega
    rw [this]; ring
  rw [hEven, hOdd]
  have hd : ((2 * N + 1).factorial : Cut) ≠ 0 := by positivity
  field_simp
  ring

/-! ## THE ADDITION FORMULAS (the group law of the Born-circle orbit). -/

/-- ★★ THE COSINE ADDITION FORMULA over the derived ℝ:
    `cutCos (a+b) = cutCos a · cutCos b − cutSin a · cutSin b`. The `tsum` of the per-N cosine assembly
    `cosTermC (a+b) (N+1) = ccCoeff (N+1) − ssCoeff N` (with base `cosTermC (a+b) 0 = ccCoeff 0`) splits
    (`tsum_sub`, shifted summability, `tsum_eq_zero_add`) into `(∑' ccCoeff) − (∑' ssCoeff)`, which are
    the two-argument Cauchy products `cutCos a·cutCos b` and `cutSin a·cutSin b`. GENERALIZES the banked
    Pythagorean identity (its `b = -a` case). -/
theorem cutCos_add (a b : Cut) :
    cutCos (a + b) = cutCos a * cutCos b - cutSin a * cutSin b := by
  rw [cutCos_mul_cutCos, cutSin_mul_cutSin]
  have hsum : cutCos (a + b) = cosTermC (a + b) 0 + ∑' N, cosTermC (a + b) (N + 1) := by
    unfold cutCos; exact (cosTermC_summable (a + b)).tsum_eq_zero_add
  rw [hsum, cosTermC_add_zero]
  have hcongr : (fun N => cosTermC (a + b) (N + 1))
      = fun N => ccCoeff a b (N + 1) - ssCoeff a b N := by
    funext N; exact cosTermC_add_succ a b N
  rw [hcongr]
  have hccshift : Summable (fun N => ccCoeff a b (N + 1)) :=
    (ccCoeff_summable a b).comp_injective (add_left_injective 1)
  have hsplit : (∑' N, (ccCoeff a b (N + 1) - ssCoeff a b N))
      = (∑' N, ccCoeff a b (N + 1)) - ∑' N, ssCoeff a b N :=
    hccshift.tsum_sub (ssCoeff_summable a b)
  rw [hsplit]
  have hccfull : ccCoeff a b 0 + ∑' N, ccCoeff a b (N + 1) = ∑' N, ccCoeff a b N :=
    ((ccCoeff_summable a b).tsum_eq_zero_add).symm
  rw [← add_sub_assoc, hccfull]

/-- ★★ THE SINE ADDITION FORMULA over the derived ℝ:
    `cutSin (a+b) = cutSin a · cutCos b + cutCos a · cutSin b`. The `tsum` of the per-N sine assembly
    `sinTermC (a+b) N = scCoeff N + csCoeff N` splits (`tsum_add`) into `(∑' scCoeff) + (∑' csCoeff)`,
    the two-argument Cauchy products `cutSin a·cutCos b` and `cutCos a·cutSin b`. -/
theorem cutSin_add (a b : Cut) :
    cutSin (a + b) = cutSin a * cutCos b + cutCos a * cutSin b := by
  rw [cutSin_mul_cutCos, cutCos_mul_cutSin]
  have hsum : cutSin (a + b) = ∑' N, sinTermC (a + b) N := rfl
  rw [hsum]
  have hcongr : (fun N => sinTermC (a + b) N)
      = fun N => scCoeff a b N + csCoeff a b N := by
    funext N; exact sinTermC_add a b N
  rw [hcongr]
  exact (scCoeff_summable a b).tsum_add (csCoeff_summable a b)

/-! ## BOUNDEDNESS: the orbit lies on the unit self-overlap circle (from the banked Pythagorean id). -/

/-- `cutCos x · cutCos x ≤ 1` — a coordinate square is at most the Born sum `= 1`. -/
theorem cutCos_sq_le_one (x : Cut) : cutCos x * cutCos x ≤ 1 := by
  have h := cutSin_sq_add_cutCos_sq x
  nlinarith [mul_self_nonneg (cutSin x)]

/-- `cutSin x · cutSin x ≤ 1`. -/
theorem cutSin_sq_le_one (x : Cut) : cutSin x * cutSin x ≤ 1 := by
  have h := cutSin_sq_add_cutCos_sq x
  nlinarith [mul_self_nonneg (cutCos x)]

/-- `cutCos x ≤ 1`. -/
theorem cutCos_le_one (x : Cut) : cutCos x ≤ 1 := by
  nlinarith [cutCos_sq_le_one x, mul_self_nonneg (cutCos x - 1), mul_self_nonneg (cutCos x + 1)]

/-- `-1 ≤ cutCos x`. -/
theorem neg_one_le_cutCos (x : Cut) : -1 ≤ cutCos x := by
  nlinarith [cutCos_sq_le_one x, mul_self_nonneg (cutCos x - 1), mul_self_nonneg (cutCos x + 1)]

/-- `cutSin x ≤ 1`. -/
theorem cutSin_le_one (x : Cut) : cutSin x ≤ 1 := by
  nlinarith [cutSin_sq_le_one x, mul_self_nonneg (cutSin x - 1), mul_self_nonneg (cutSin x + 1)]

/-- `-1 ≤ cutSin x`. -/
theorem neg_one_le_cutSin (x : Cut) : -1 ≤ cutSin x := by
  nlinarith [cutSin_sq_le_one x, mul_self_nonneg (cutSin x - 1), mul_self_nonneg (cutSin x + 1)]

/-- ★ BOUNDEDNESS: `|cutCos x| ≤ 1`. -/
theorem abs_cutCos_le_one (x : Cut) : |cutCos x| ≤ 1 :=
  abs_le.mpr ⟨neg_one_le_cutCos x, cutCos_le_one x⟩

/-- ★ BOUNDEDNESS: `|cutSin x| ≤ 1`. -/
theorem abs_cutSin_le_one (x : Cut) : |cutSin x| ≤ 1 :=
  abs_le.mpr ⟨neg_one_le_cutSin x, cutSin_le_one x⟩

/-! ## NON-VACUITY (W8): the addition formulas are genuine on nonzero arguments. -/

/-- NON-VACUITY: the cosine addition formula at `a = b = 1` (a nonzero argument, `1 + 1 = 2`),
    witnessing `cutCos_add` is not vacuous at the zero argument. -/
theorem cutCos_add_one_one :
    cutCos (1 + 1) = cutCos 1 * cutCos 1 - cutSin 1 * cutSin 1 := cutCos_add 1 1

/-- NON-VACUITY: the sine addition formula at `a = b = 1`. -/
theorem cutSin_add_one_one :
    cutSin (1 + 1) = cutSin 1 * cutCos 1 + cutCos 1 * cutSin 1 := cutSin_add 1 1

end

end ContinuumQ
end Phys.Foundation
