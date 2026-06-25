/-
# N38 — THE AUTOMORPHISM GROUP, increment 8: the OPERATOR NORM (the operator-exp core, part b).

N37 banked `CompleteSpace Cut` — the derived ℝ `ContinuumQ.Cut` is now order-complete (N33),
Heine–Borel-compact (N34), Archimedean with monotone convergence (N35), uniform (N36) AND
Cauchy-complete (N37). The remaining analytic core is the operator-exp `Der(𝕆) → Aut(𝕆)`:
`exp(D) = ∑ Dⁿ/n!` for a skew-adjoint derivation `D`, landing in the banked automorphism group
`AutO`. The FIRST rung of that core — banked HERE — is a **Cut-valued operator norm** on the
8×8 coordinate matrices over the derived ℝ, the magnitude against which the power series
converges.

★ THE W1 / THE-ONE-LAW REFRAME THROUGH THE TRUNK (the content-trap dodge, measured first).
Mathlib's `Norm`/`NormedRing`/`NormedSpace` typeclass is **ℝ-VALUED** (`norm : α → ℝ`). Asking
for a `Norm (Matrix (Fin 8) (Fin 8) Cut)` instance would cast a `Cut`-valued magnitude into
Mathlib's ℝ — importing ℝ as CONTENT (STANDARD §3), the SAME trap the metric (N35→N36) and the
Cauchy-completeness (N37) had to dodge. The trunk dodges it again: the operator norm is a
**`Cut`-VALUED function** `opNorm : Matrix (Fin 8) (Fin 8) Cut → Cut`, built from the order-native
`abs` on the derived ℝ and finite `Finset.sum` — pure MACHINERY on the DERIVED `Cut`, NO `Norm`
typeclass, NO ℝ. (W9 MEASURE-FIRST: workbench/N38-operator-exp/PREREG.md + probe1..3, each
`lake env lean` ~2 s user CPU — submultiplicativity closes with ABSTRACT `Finset` lemmas,
never `Fin 8` expansion / `decide` / `ring`.)

THE NORM: the entrywise ℓ¹ sum `opNorm M = ∑ᵢⱼ |Mᵢⱼ|`. Chosen because it is **submultiplicative
with NO dimension factor** — the load-bearing property the convergence of `∑ Dⁿ/n!` rests on:
`opNorm (Dⁿ) ≤ (opNorm D)ⁿ` (for `n ≥ 1`), so `∑ opNorm(Dⁿ)/n! ≤ ∑ (opNorm D)ⁿ/n!` is bounded
by an absolutely convergent geometric-over-factorial majorant (the C6 eternal-approach as a
convergent series, banked N35 Archimedean + N37 Cauchy-complete). Banking the norm first is what
makes the next increment's convergence a one-line majorant comparison.

WHAT IS BANKED HERE (forward, foundations-only, Cut-valued — NO ℝ-valued `Norm`):
  • `opNorm`               — the Cut-valued entrywise ℓ¹ operator norm `∑ᵢⱼ |Mᵢⱼ|`.
  • `opNorm_nonneg`        — `0 ≤ opNorm M`.
  • `opNorm_zero`          — `opNorm 0 = 0`.
  • `opNorm_eq_zero`       — ★ DEFINITENESS: `opNorm M = 0 ↔ M = 0` (a genuine norm, not a hollow
                             seminorm — the W8 teeth).
  • `entry_abs_le_opNorm`  — `|M i j| ≤ opNorm M` (the norm dominates each entry — the unit-box
                             handle to the N32 boundedness).
  • `opNorm_add_le`        — ★ SUBADDITIVITY / triangle: `opNorm (M + N) ≤ opNorm M + opNorm N`.
  • `opNorm_smul`          — ★ ABSOLUTE HOMOGENEITY: `opNorm (c • M) = |c| * opNorm M`.
  • `opNorm_mul_le`        — ★★ SUBMULTIPLICATIVITY: `opNorm (M * N) ≤ opNorm M * opNorm N` — the
                             load-bearing convergence seed for the power series (next increment).
  • `opNorm_pow_le`        — `opNorm (M ^ (n+1)) ≤ opNorm M ^ (n+1)` (the series-term bound).
  • `opNorm_autMatrix_le`  — ★ the automorphism coordinate image is bounded in the new norm:
                             `opNorm (autMatrix φ) ≤ 64` (the N32 unit-box: 64 entries, each
                             `|·| ≤ 1` — the structure-preserving bijections sit in a banked
                             bounded region of the derived continuum).
  • `opNorm_one`           — NON-VACUITY: `opNorm 1 = 8` (the 8 diagonal ones — the norm is not the
                             zero map, and `opNorm(1) = 8 ≰ 1` is exactly why the power bound needs
                             `n ≥ 1`).

THE ONE CAUSE (THE ONE LAW). The SAME Born positivity (self-overlap = a sum of coordinate
squares) that made every derivation SKEW-ADJOINT (N26), forced the SIMPLE type-G₂ Lie algebra
(N24/N30b), bounded every automorphism entry `|·| ≤ 1` (N32) and made the automorphism group
TOPOLOGICALLY COMPACT (N34), now — read through the `abs` of the derived ℝ — gives the
Cut-valued submultiplicative operator norm in which the exponential series will converge. One
cause (Born definiteness = self-overlap positivity), several terminations (skew-adjoint algebra,
simple Lie algebra, bounded + compact group, and now a convergence-controlling norm).

PHYSICS-WORDS-REMOVABLE (STANDARD §2): delete "operator / exp / gauge / G₂ / colour /
automorphism" → the file is a complete proof that `∑ᵢⱼ |Mᵢⱼ|` on 8×8 matrices over the
completion-of-the-gather-of-closures of the derived rationals is a definite, subadditive,
absolutely-homogeneous, SUBMULTIPLICATIVE, Cut-valued norm dominating each entry and finite on
the orthonormal-isometry image. NO physics name is load-bearing.

Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO posited
exp/G₂/Aut/metric/norm-system, NO Mathlib ℝ as content, NO ℝ-valued `Norm` typeclass.
-/
import Phys.Algebra.DerivationAutCompactTopo
import Mathlib.Data.Matrix.Basic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The Cut-valued operator norm (entrywise ℓ¹ — NO ℝ-valued `Norm` typeclass). -/

/-- The Cut-VALUED operator norm on the 8×8 coordinate matrices over the derived ℝ: the entrywise
    ℓ¹ sum `∑ᵢⱼ |Mᵢⱼ|`. Built from the order-native `abs` on `Cut` and finite `Finset.sum` —
    MACHINERY on the DERIVED `Cut`, NOT a Mathlib `Norm` instance (which is ℝ-valued = a content
    trap, STANDARD §3). -/
def opNorm (M : Matrix (Fin 8) (Fin 8) Cut) : Cut := ∑ i, ∑ j, |M i j|

/-- The operator norm is nonnegative (a finite sum of absolute values). -/
theorem opNorm_nonneg (M : Matrix (Fin 8) (Fin 8) Cut) : 0 ≤ opNorm M := by
  unfold opNorm
  exact Finset.sum_nonneg (fun i _ => Finset.sum_nonneg (fun j _ => abs_nonneg _))

/-- The operator norm of the zero matrix is zero. -/
theorem opNorm_zero : opNorm (0 : Matrix (Fin 8) (Fin 8) Cut) = 0 := by
  unfold opNorm
  apply Finset.sum_eq_zero; intro i _
  apply Finset.sum_eq_zero; intro j _
  simp [Matrix.zero_apply]

/-- ★ DEFINITENESS: `opNorm M = 0 ↔ M = 0`. A genuine norm, not a hollow seminorm — every
    entrywise summand `|Mᵢⱼ|` is nonnegative, so the total vanishes iff every entry does. -/
theorem opNorm_eq_zero (M : Matrix (Fin 8) (Fin 8) Cut) : opNorm M = 0 ↔ M = 0 := by
  unfold opNorm
  rw [Finset.sum_eq_zero_iff_of_nonneg
        (fun i _ => Finset.sum_nonneg (fun _ _ => abs_nonneg _))]
  constructor
  · intro h
    ext i j
    have hi := h i (Finset.mem_univ i)
    rw [Finset.sum_eq_zero_iff_of_nonneg (fun _ _ => abs_nonneg _)] at hi
    have := hi j (Finset.mem_univ j)
    simpa [abs_eq_zero] using this
  · intro h i _
    apply Finset.sum_eq_zero; intro j _
    simp [h, Matrix.zero_apply]

/-- Each entry is dominated by the operator norm: `|M i j| ≤ opNorm M`. The norm bounds the
    coordinates — the handle to the N32 unit-box boundedness. -/
theorem entry_abs_le_opNorm (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    |M i j| ≤ opNorm M := by
  unfold opNorm
  calc |M i j| ≤ ∑ j', |M i j'| :=
        Finset.single_le_sum (f := fun j' => |M i j'|)
          (fun j' _ => abs_nonneg _) (Finset.mem_univ j)
    _ ≤ ∑ i', ∑ j', |M i' j'| :=
        Finset.single_le_sum (f := fun i' => ∑ j', |M i' j'|)
          (fun i' _ => Finset.sum_nonneg (fun _ _ => abs_nonneg _))
          (Finset.mem_univ i)

/-! ## The norm axioms: subadditivity, homogeneity, submultiplicativity. -/

/-- ★ SUBADDITIVITY (triangle inequality): `opNorm (M + N) ≤ opNorm M + opNorm N`, from the
    entrywise `abs_add`. -/
theorem opNorm_add_le (M N : Matrix (Fin 8) (Fin 8) Cut) :
    opNorm (M + N) ≤ opNorm M + opNorm N := by
  unfold opNorm
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_le_sum; intro i _
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_le_sum; intro j _
  exact abs_add_le _ _

/-- ★ ABSOLUTE HOMOGENEITY: `opNorm (c • M) = |c| * opNorm M`, from the entrywise `abs_mul`. -/
theorem opNorm_smul (c : Cut) (M : Matrix (Fin 8) (Fin 8) Cut) :
    opNorm (c • M) = |c| * opNorm M := by
  unfold opNorm
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl; intro i _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl; intro j _
  simp [Matrix.smul_apply, abs_mul, smul_eq_mul]

/-- ★★ SUBMULTIPLICATIVITY: `opNorm (M * N) ≤ opNorm M * opNorm N`. THE load-bearing property the
    convergence of the exponential series rests on. Proof: `|(MN)ᵢₖ| = |∑ⱼ MᵢⱼNⱼₖ| ≤ ∑ⱼ |Mᵢⱼ||Nⱼₖ|`
    (triangle), then reorder `k,j`, factor `|Mᵢⱼ|` out of the `k`-sum, bound the row-sum
    `∑ₖ|Nⱼₖ| ≤ opNorm N`, and collapse to `(∑ᵢⱼ|Mᵢⱼ|) · opNorm N = opNorm M · opNorm N`. Closes
    with ABSTRACT `Finset` lemmas (`sum_comm`, `mul_sum`, `abs_sum_le`, `single_le_sum`) — no
    `Fin 8` expansion, NO ℝ. -/
theorem opNorm_mul_le (M N : Matrix (Fin 8) (Fin 8) Cut) :
    opNorm (M * N) ≤ opNorm M * opNorm N := by
  have hrow : ∀ j : Fin 8, ∑ k, |N j k| ≤ opNorm N := by
    intro j
    exact Finset.single_le_sum (f := fun j' => ∑ k, |N j' k|)
      (fun j' _ => Finset.sum_nonneg (fun _ _ => abs_nonneg _)) (Finset.mem_univ j)
  have step1 : opNorm (M * N) ≤ ∑ i, ∑ k, ∑ j, |M i j| * |N j k| := by
    unfold opNorm
    apply Finset.sum_le_sum; intro i _
    apply Finset.sum_le_sum; intro k _
    rw [Matrix.mul_apply]
    calc |∑ j, M i j * N j k| ≤ ∑ j, |M i j * N j k| := Finset.abs_sum_le_sum_abs _ _
      _ = ∑ j, |M i j| * |N j k| := by simp [abs_mul]
  refine step1.trans ?_
  calc ∑ i, ∑ k, ∑ j, |M i j| * |N j k|
      = ∑ i, ∑ j, ∑ k, |M i j| * |N j k| := by
        apply Finset.sum_congr rfl; intro i _; exact Finset.sum_comm
    _ = ∑ i, ∑ j, |M i j| * (∑ k, |N j k|) := by
        apply Finset.sum_congr rfl; intro i _
        apply Finset.sum_congr rfl; intro j _
        rw [Finset.mul_sum]
    _ ≤ ∑ i, ∑ j, |M i j| * opNorm N := by
        apply Finset.sum_le_sum; intro i _
        apply Finset.sum_le_sum; intro j _
        exact mul_le_mul_of_nonneg_left (hrow j) (abs_nonneg _)
    _ = (∑ i, ∑ j, |M i j|) * opNorm N := by
        rw [Finset.sum_mul]; apply Finset.sum_congr rfl; intro i _; rw [Finset.sum_mul]
    _ = opNorm M * opNorm N := by unfold opNorm; rfl

/-- The series-term bound `opNorm (M ^ (n+1)) ≤ opNorm M ^ (n+1)` (for `n ≥ 1`), by induction on
    the submultiplicativity. (Stated from `n+1` because `opNorm 1 = 8 ≰ 1` — see `opNorm_one`.) -/
theorem opNorm_pow_le (M : Matrix (Fin 8) (Fin 8) Cut) (n : ℕ) :
    opNorm (M ^ (n + 1)) ≤ opNorm M ^ (n + 1) := by
  induction n with
  | zero => simp
  | succ k ih =>
    rw [pow_succ, pow_succ]
    calc opNorm (M ^ (k + 1) * M) ≤ opNorm (M ^ (k + 1)) * opNorm M := opNorm_mul_le _ _
      _ ≤ opNorm M ^ (k + 1) * opNorm M :=
          mul_le_mul_of_nonneg_right ih (opNorm_nonneg M)

/-! ## The automorphism coordinate image is bounded in the new norm (the N32 unit-box). -/

/-- ★ The coordinate matrix of every automorphism is bounded in the operator norm:
    `opNorm (autMatrix φ) ≤ 64`. Each of the 64 entries is the `ℚ → Cut` cast of an automorphism
    coordinate with `|·| ≤ 1` (the banked N32 `AutO_entry_abs_le_one`), so the ℓ¹ sum is at most
    `64`. The structure-preserving bijections sit in a banked bounded region of the derived
    continuum — the boundedness that, with the topological compactness (N34), controls the
    1-parameter flow. -/
theorem opNorm_autMatrix_le (φ : AutO) : opNorm (autMatrix φ) ≤ 64 := by
  unfold opNorm autMatrix
  have hentry : ∀ i j : Fin 8,
      |((coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i : ℚ) : Cut)| ≤ 1 := by
    intro i j
    rw [← Rat.cast_abs]
    have h := AutO_entry_abs_le_one φ i j
    calc ((|coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i| : ℚ) : Cut)
        ≤ ((1 : ℚ) : Cut) := by exact_mod_cast h
      _ = 1 := by norm_num
  calc ∑ i : Fin 8, ∑ j : Fin 8, |((coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i : ℚ) : Cut)|
      ≤ ∑ _i : Fin 8, ∑ _j : Fin 8, (1 : Cut) := by
        apply Finset.sum_le_sum; intro i _
        apply Finset.sum_le_sum; intro j _
        exact hentry i j
    _ = 64 := by simp; norm_num

/-! ## NON-VACUITY (W8): the norm is not the zero map. -/

/-- NON-VACUITY: `opNorm 1 = 8` — the identity matrix's 8 diagonal entries are `1`, all off-diagonal
    are `0`, so the ℓ¹ sum is `8`. The norm is genuinely nonzero on a nonzero matrix (a hollow
    seminorm would give `0`), and `8 ≰ 1` is exactly why `opNorm_pow_le` is stated for `n ≥ 1`. -/
theorem opNorm_one : opNorm (1 : Matrix (Fin 8) (Fin 8) Cut) = 8 := by
  unfold opNorm
  have hrow : ∀ i : Fin 8, ∑ j : Fin 8, |(1 : Matrix (Fin 8) (Fin 8) Cut) i j| = 1 := by
    intro i
    rw [Finset.sum_eq_single i]
    · simp [Matrix.one_apply_eq]
    · intro j _ hj; simp [Matrix.one_apply, Ne.symm hj]
    · intro h; exact absurd (Finset.mem_univ i) h
  rw [Finset.sum_congr rfl (fun i _ => hrow i)]
  simp

end

end Phys.Algebra
