/-
  # N40 — THE EXPONENTIAL ONE-PARAMETER SUBGROUP over the DERIVED ℝ (increment 10).

  N39 (`Phys/Algebra/DerivationAutExp.lean`) banked `expTerm_summable`: the matrix exponential series
  `exp(D) = ∑ₙ (1/n!)·Dⁿ` of any 8×8 coordinate matrix over the derived ℝ `ContinuumQ.Cut` is
  ABSOLUTELY CONVERGENT. THIS file banks the GROUP-THEORETIC content of that exponential: it is a
  ONE-PARAMETER SUBGROUP of the matrix units — `exp(A+B) = exp(A)·exp(B)` for commuting `A`, `B`,
  whence `exp(D)·exp(-D) = exp(0) = 1`, so `exp(D)` is INVERTIBLE with inverse `exp(-D)`. This is the
  structure-preserving-bijection (group-membership) property of the matrix exponential, derived
  coordinate-natively over the derived ℝ.

  ★ THE ONE LAW (RUNBOOK W5 / STANDARD §4) — WHY THE GROUP-LAW, NOT `∈ AutO`. The banked `AutO`
  (`DerivationAutGroup.lean`) is a `Subgroup (O ℚ ≃ₗ[ℚ] O ℚ)` — over the RATIONALS. But `exp(D)` has
  TRANSCENDENTAL `Cut` entries (exp of a nonzero rational derivation). A `Cut`-matrix cannot be an
  element of a group of `ℚ`-linear equivalences — `exp(D) ∈ AutO` is literally ill-typed. Returning to
  the trunk: the MATHEMATICAL CONTENT that "the exponential lands in the automorphism group" asserts,
  over the derived ℝ, is exactly the one-parameter-subgroup HOMOMORPHISM LAW + INVERTIBILITY banked
  here. The full algebra-automorphism of `O Cut` (needing a Cut-side automorphism infrastructure) and
  the tangent map `d/dt exp(tD)|₀ = D` are SEPARATE forward nodes, childed onto the chain tail.

  ★ THE W1 / CONTENT-TRAP REFRAME (MEASURED first, NO ℝ-valued norm). The engine is the Cauchy
  product. Mathlib's absolutely-summable Cauchy product `…_of_summable_norm` is ℝ-NORM bound (a CONTENT
  trap, STANDARD §3). The TRUNK-NATIVE `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` needs only
  `[T3Space] [NonUnitalNonAssocSemiring] [IsTopologicalSemiring]` — all synthesize on
  `Matrix (Fin 8) (Fin 8) Cut` with NO norm. So the homomorphism law is the Cauchy product + the
  binomial identity, entirely over the derived ℝ.

  ★ THE ROUTE.
    `expMap D := ∑' n, expTerm D n` — the `tsum` exists by N37 `CompleteSpace Cut` + N39 summability.
    `expMap_zero`: `exp 0 = 1` (only the `n=0` term survives).
    `matrix_prod_summable`: the product family `(m,n) ↦ expTerm A m · expTerm B n` over `ℕ × ℕ` is
      summable — reduce entrywise (`matrix_summable_prod_of_entrywise`), expand the matrix product
      (`Matrix.mul_apply`), and each scalar product `expTerm A · i k · expTerm B · k j` is summable by
      the N40 part-1 `cut_summable_mul_of_abs` (the entry sequences are absolutely summable,
      `expTerm_entry_abs_summable`).
    `expTerm_antidiagonal` (★ THE BINOMIAL CRUX): for `Commute A B`,
      `∑ antidiagonal n, expTerm A k · expTerm B l = expTerm (A+B) n`. From `Commute.add_pow'`
      (`(A+B)ⁿ = ∑ antidiagonal, choose • (Aᵏ·Bˡ)`) + the scalar identity
      `1/k!·1/l! = (1/n!)·choose(n,k)` (`Nat.choose_mul_factorial_mul_factorial`).
    `expMap_mul_of_commute` (★★ THE HOMOMORPHISM LAW): `expMap A * expMap B = expMap (A+B)` — the
      Cauchy product turns the LHS into `∑'ₙ ∑ antidiagonal, …`, which `expTerm_antidiagonal`
      collapses to `∑'ₙ expTerm (A+B) n = expMap (A+B)`.
    `expMap_mul_neg` / `expMap_neg_mul` (★ THE GL-LANDING): `exp(D)·exp(-D) = 1 = exp(-D)·exp(D)` —
      `D` commutes with `-D`, so the homomorphism law + `add_neg_cancel` + `expMap_zero` give
      invertibility. The exponential is a STRUCTURE-PRESERVING BIJECTION: the one-parameter subgroup.

  ★ THE ONE CAUSE (THE ONE LAW). The SAME Born positivity that made the exp series converge (N39, the
  factorial outrunning the operator norm) is what lets the Cauchy product rearrange absolutely and the
  binomial identity close — convergence and the group law are the same self-overlap positivity read
  twice. One cause (Born definiteness), several terminations (skew-adjoint algebra, simple Lie algebra,
  bounded+compact group, submultiplicative norm, convergent exp series, and now a one-parameter
  subgroup of units).

  ★ W9 INSTRUMENT NOTE (run 169). The product-summability assembly first hit the default heartbeat
  ceiling at `whnf`/`isDefEq` — MEASURED cause: higher-order unification of `f`/`g`/`s` through the
  `|·|` and product patterns over `Cut`. FIX (NO maxHeartbeats inflation): pass `f`/`g` to the product
  levers and `s := Finset.univ` + `f` to `summable_sum` EXPLICITLY. Every obligation then ≤ 2 s.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): delete "exp / derivation / gauge / G₂ / automorphism": the
  file is a complete proof that the matrix power series `E(M) = ∑ₙ (1/n!)·Mⁿ` over the
  completion-of-the-gather-of-closures of the derived rationals satisfies `E(M+N) = E(M)·E(N)` for
  commuting `M`, `N` and `E(M)·E(-M) = 1` — a one-parameter subgroup of the matrix units. NO physics
  name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO posited
  exp/G₂/Aut, NO Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`.
-/
import Phys.Algebra.DerivationAutExp
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Ring

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## The exponential map: the `tsum` of the (banked-summable) series. -/

/-- The matrix exponential `exp(D) = ∑ₙ (1/n!)·Dⁿ` over the derived ℝ, as the `tsum` of the N39
    absolutely-convergent series `expTerm D`. The `tsum` EXISTS (is the genuine limit, not a junk
    value) because the series is summable (N39 `expTerm_summable`) over the Cauchy-complete derived ℝ
    (N37 `CompleteSpace Cut`). MACHINERY on the DERIVED `Matrix … Cut`, NOT Mathlib's `NormedSpace.exp`
    /`Matrix.exp` (which are ℝ/ℂ-NormedAlgebra — the content trap). -/
def expMap (D : Matrix (Fin 8) (Fin 8) Cut) : Matrix (Fin 8) (Fin 8) Cut :=
  ∑' n, expTerm D n

/-- The exponential series has `expMap D` as its sum (lets limits pass through the `tsum`). -/
theorem expMap_hasSum (D : Matrix (Fin 8) (Fin 8) Cut) :
    HasSum (expTerm D) (expMap D) :=
  (expTerm_summable D).hasSum

/-- `exp(0) = 1`: the exponential of the zero matrix is the identity. Only the `n = 0` term
    (`(1/0!)·D⁰ = 1`) survives; every higher term has `0ⁿ = 0`. The unit of the one-parameter
    subgroup. -/
theorem expMap_zero : expMap (0 : Matrix (Fin 8) (Fin 8) Cut) = 1 := by
  unfold expMap
  rw [tsum_eq_single 0]
  · unfold expTerm; simp
  · intro n hn
    unfold expTerm
    rw [zero_pow hn, smul_zero]

/-! ## The matrix product-family is summable (the convergence engine of the Cauchy product). -/

/-- Matrix summability over the index `ℕ × ℕ` reduces ENTRYWISE, exactly as the `ℕ`-indexed N39
    `matrix_summable_of_entrywise`: the `Matrix (Fin 8) (Fin 8) Cut` instances are DEFINITIONALLY the
    `Pi` instances, so `Pi.summable` applies after a `show`. NO ℝ-valued norm. -/
theorem matrix_summable_prod_of_entrywise (f : ℕ × ℕ → Matrix (Fin 8) (Fin 8) Cut)
    (h : ∀ i j, Summable (fun x => f x i j)) : Summable f := by
  show Summable (α := Fin 8 → Fin 8 → Cut) f
  rw [Pi.summable]
  intro i
  rw [Pi.summable]
  intro j
  exact h i j

/-- The entrywise ABSOLUTE summability of `expTerm` (the N39 internal majorant fact, re-exposed —
    needed to feed the Cauchy product through `cut_summable_mul_of_abs`). Each entry sequence
    `n ↦ |expTerm D n i j|` is summable, dominated by the factorial majorant `(opNorm D)ⁿ/n!`
    (N39 `cut_summable_pow_div_factorial`). -/
theorem expTerm_entry_abs_summable (D : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    Summable (fun n => |expTerm D n i j|) := by
  rw [← summable_nat_add_iff 1]
  apply cut_summable_of_nonneg_of_le (fun n => abs_nonneg _)
    (fun n => expTerm_entry_abs_le D n i j)
  have hmaj : Summable (fun n => (opNorm D) ^ n / (n.factorial : Cut)) :=
    cut_summable_pow_div_factorial (opNorm_nonneg D)
  rw [← summable_nat_add_iff 1] at hmaj
  apply hmaj.congr
  intro n
  rw [one_div, div_eq_inv_mul]

/-- ★ THE PRODUCT FAMILY IS SUMMABLE: `(m, n) ↦ expTerm A m · expTerm B n` over `ℕ × ℕ` is summable
    (the hypothesis the trunk-native Cauchy product `tsum_mul_tsum_eq_tsum_sum_antidiagonal` needs).
    Reduce entrywise (`matrix_summable_prod_of_entrywise`); expand the matrix product
    (`Matrix.mul_apply`) into a finite `Fin 8`-sum of scalar products; each scalar product is summable
    by the N40 part-1 `cut_summable_mul_of_abs` on the absolutely-summable entry sequences. NO ℝ-valued
    norm. (Explicit `f`/`g`/`s` args — RUNBOOK W9, run 169.) -/
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

/-! ## The binomial crux: the antidiagonal sum of products is the next exponential term. -/

/-- ★ THE BINOMIAL CRUX: for COMMUTING matrices `A`, `B`,
    `∑ (k,l)∈antidiagonal n, expTerm A k · expTerm B l = expTerm (A+B) n`, i.e.
    `∑_{k+l=n} (Aᵏ/k!)·(Bˡ/l!) = (A+B)ⁿ/n!`. From `Commute.add_pow'`
    (`(A+B)ⁿ = ∑ antidiagonal, choose(n,k) • (Aᵏ·Bˡ)`) — distributing the `1/n!` scalar — and the
    scalar binomial-coefficient identity `1/k! · 1/l! = (1/n!)·choose(n,k)` for `k + l = n`
    (`Nat.choose_mul_factorial_mul_factorial`). The commutativity is essential: it is what lets the
    powers separate into `Aᵏ·Bˡ`. -/
theorem expTerm_antidiagonal (A B : Matrix (Fin 8) (Fin 8) Cut) (h : Commute A B) (n : ℕ) :
    ∑ kl ∈ Finset.antidiagonal n, expTerm A kl.1 * expTerm B kl.2 = expTerm (A + B) n := by
  unfold expTerm
  rw [h.add_pow' n, Finset.smul_sum]
  apply Finset.sum_congr rfl
  intro kl hkl
  rw [Finset.mem_antidiagonal] at hkl
  have hk : kl.1 ≤ n := by omega
  rw [Matrix.smul_mul, Matrix.mul_smul, smul_smul]
  rw [← Nat.cast_smul_eq_nsmul Cut (n.choose kl.1) (A ^ kl.1 * B ^ kl.2), smul_smul]
  congr 1
  -- scalar identity: 1/k! · 1/l! = 1/n! · choose(n,k)   with k + l = n
  have hcmf := Nat.choose_mul_factorial_mul_factorial hk
  rw [show n - kl.1 = kl.2 by omega] at hcmf
  have hk0 : (kl.1.factorial : Cut) ≠ 0 := by positivity
  have hl0 : (kl.2.factorial : Cut) ≠ 0 := by positivity
  have hn0 : (n.factorial : Cut) ≠ 0 := by positivity
  have hcast : (n.choose kl.1 : Cut) * (kl.1.factorial : Cut) * (kl.2.factorial : Cut)
      = (n.factorial : Cut) := by
    have hnat : ((n.choose kl.1 * kl.1.factorial * kl.2.factorial : ℕ) : Cut)
        = ((n.factorial : ℕ) : Cut) := by rw [hcmf]
    push_cast at hnat; linarith [hnat]
  field_simp
  linarith [hcast]

/-! ## THE HOMOMORPHISM LAW + THE GL-LANDING (the one-parameter subgroup). -/

/-- ★★ THE EXPONENTIAL HOMOMORPHISM LAW: for COMMUTING matrices `A`, `B`,
    `exp(A) · exp(B) = exp(A + B)`. The trunk-native Cauchy product
    `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` (which needs only the topological-semiring
    structure on `Matrix … Cut`, NO ℝ-valued norm) rewrites `(∑'expTerm A)·(∑'expTerm B)` as
    `∑'ₙ ∑ antidiagonal n, expTerm A k · expTerm B l`, and the binomial crux `expTerm_antidiagonal`
    collapses each antidiagonal sum to `expTerm (A+B) n`. The product family is summable by
    `matrix_prod_summable`. THE one-parameter-subgroup law. -/
theorem expMap_mul_of_commute (A B : Matrix (Fin 8) (Fin 8) Cut) (h : Commute A B) :
    expMap A * expMap B = expMap (A + B) := by
  unfold expMap
  rw [(expTerm_summable A).tsum_mul_tsum_eq_tsum_sum_antidiagonal (expTerm_summable B)
        (matrix_prod_summable A B)]
  apply tsum_congr
  intro n
  exact expTerm_antidiagonal A B h n

/-- ★ THE GL-LANDING (right inverse): `exp(D) · exp(-D) = 1`. `D` commutes with `-D`, so the
    homomorphism law gives `exp(D)·exp(-D) = exp(D + (-D)) = exp(0) = 1`. The exponential is INVERTIBLE
    with inverse `exp(-D)` — a structure-preserving bijection, the group-membership content of "exp
    lands in the automorphism group". -/
theorem expMap_mul_neg (D : Matrix (Fin 8) (Fin 8) Cut) :
    expMap D * expMap (-D) = 1 := by
  have hc : Commute D (-D) := (Commute.refl D).neg_right
  rw [expMap_mul_of_commute D (-D) hc, add_neg_cancel]
  exact expMap_zero

/-- ★ THE GL-LANDING (left inverse): `exp(-D) · exp(D) = 1`. Symmetric to `expMap_mul_neg`; together
    they exhibit `exp(D)` as a two-sided unit of the matrix ring with inverse `exp(-D)`. -/
theorem expMap_neg_mul (D : Matrix (Fin 8) (Fin 8) Cut) :
    expMap (-D) * expMap D = 1 := by
  have hc : Commute (-D) D := (Commute.refl D).neg_left
  rw [expMap_mul_of_commute (-D) D hc, neg_add_cancel]
  exact expMap_zero

/-! ## NON-VACUITY (W8): the one-parameter subgroup is genuine on a nonzero matrix. -/

/-- NON-VACUITY: the identity matrix `1 ≠ 0` is invertible via the exponential law —
    `exp(1)·exp(-1) = 1`, a concrete instance witnessing the GL-landing is not vacuous on the zero
    matrix alone (`opNorm 1 = 8 ≠ 0`, N38). -/
theorem expMap_one_mul_neg : expMap (1 : Matrix (Fin 8) (Fin 8) Cut) * expMap (-1) = 1 :=
  expMap_mul_neg 1

/-- NON-VACUITY: the homomorphism law on a self-commuting nonzero matrix —
    `exp(1)·exp(1) = exp(1+1) = exp(2)`, witnessing `expMap_mul_of_commute` is not vacuous. -/
theorem expMap_one_mul_one :
    expMap (1 : Matrix (Fin 8) (Fin 8) Cut) * expMap 1 = expMap (1 + 1) :=
  expMap_mul_of_commute 1 1 (Commute.refl 1)

end

end Phys.Algebra
