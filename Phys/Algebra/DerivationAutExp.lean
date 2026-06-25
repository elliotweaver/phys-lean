/-
  # N39 — THE POWER-SERIES EXP, increment 9 (part c·2): the MATRIX EXPONENTIAL SERIES CONVERGES.

  Part c·1 (`Phys/Foundation/ContinuumSummable.lean`) banked the scalar summability levers over the
  derived ℝ. THIS file banks the matrix-level target: the matrix exponential series
  `exp(D) = ∑ₙ (1/n!)·Dⁿ` of any 8×8 coordinate matrix `D` over the derived ℝ is `Summable` —
  ABSOLUTELY convergent, majorized entrywise by the banked N38 operator norm.

  ★ THE ROUTE (trunk-native, measured first, NO ℝ-valued norm).
    (L6) `matrix_summable_of_entrywise`: the `Matrix (Fin 8) (Fin 8) Cut` `AddCommMonoid` and
         `TopologicalSpace` instances are LITERALLY the Pi instances (verified by `rfl`), so matrix
         `Summable` reduces ENTRYWISE through `Pi.summable` — NO ℝ-valued norm, NO ported matrix
         analysis.
    (entry bound) `expTerm_entry_abs_le`: each entry of the `(n+1)`-th term is bounded
         `|((1/(n+1)!)·D^(n+1)) i j| ≤ (1/(n+1)!)·(opNorm D)^(n+1)` — `abs_mul` + the banked N38
         `entry_abs_le_opNorm` (the norm dominates each entry) + `opNorm_pow_le` (submultiplicativity
         iterated, `n ≥ 1`).
    (TARGET c) `expTerm_summable`: reduce entrywise (L6); shift the index by 1
         (`summable_nat_add_iff` — the `n = 0` head `= 1` is a finite term, summability is a tail
         property); the shifted entry is absolutely bounded by the factorial majorant `(1/(n+1)!)·
         (opNorm D)^(n+1)`, which is summable by part-c·1 `cut_summable_pow_div_factorial` (with
         `opNorm_nonneg`). The absolute-comparison lever (`cut_summable_of_abs` ∘
         `cut_summable_of_nonneg_of_le`) closes the entry.

  ★ THE ONE CAUSE (THE ONE LAW). The SAME Born positivity (self-overlap) that gave the submultiplicative
  operator norm (N38) — `opNorm (Dⁿ) ≤ (opNorm D)ⁿ` — is exactly what makes the exponential series
  absolutely convergent: the factorial outruns `(opNorm D)ⁿ`. The norm built to control convergence
  controls it. One cause (Born definiteness), several terminations (skew-adjoint algebra, simple Lie
  algebra, bounded + compact group, submultiplicative norm, and now a CONVERGENT exponential series).

  ★ MACHINERY, NOT A POSIT (STANDARD §3). `expTerm` is `(1/n!) • Dⁿ` — `Finset`/`smul`/`pow` machinery
  on the DERIVED `Matrix … Cut`. Its summability is a THEOREM about that matrix series, NOT Mathlib's
  `NormedSpace.exp` / `Matrix.exp` (which are ℝ/ℂ-NormedAlgebra — the content trap, dodged). NO Mathlib
  ℝ imported as content, NO ℝ-valued `Norm`, NO posited exp.

  ★ WHAT THIS NODE DOES NOT DO (childed). `exp(D) ∈ AutO` (the derivation-flow preserves the product)
  and `d/dt exp(tD)|₀ = D` (the derivative at identity recovers the derivation) are NOT here. This file
  banks the CONVERGENCE; the homomorphism property and the derivative are childed onto the chain tail.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): delete "exp / gauge / G₂ / colour / derivation": the file is a
  complete proof that the matrix power series `∑ₙ (1/n!)·Mⁿ` of any 8×8 matrix `M` over the
  completion-of-the-gather-of-closures of the derived rationals is absolutely convergent, majorized
  entrywise by `(1/n!)·(∑ᵢⱼ|Mᵢⱼ|)ⁿ`. NO physics name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO posited exp/G₂,
  NO Mathlib ℝ as content, NO ℝ-valued `Norm`.
-/
import Phys.Algebra.DerivationAutOpNorm
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Group
import Mathlib.Topology.Algebra.InfiniteSum.Constructions
import Mathlib.Topology.Instances.Matrix

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## The entrywise reduction of matrix summability (NO ℝ-valued norm). -/

/-- ★ MATRIX SUMMABILITY IS ENTRYWISE over the derived ℝ: a sequence of `8×8` matrices is `Summable`
    iff each of its `64` entry-sequences is `Summable`. The `Matrix (Fin 8) (Fin 8) Cut`
    `AddCommMonoid` and `TopologicalSpace` instances are DEFINITIONALLY the `Pi` instances (the matrix
    type is reducibly `Fin 8 → Fin 8 → Cut`), so `Pi.summable` applies after a `show`. MACHINERY on
    the DERIVED matrices — NO ℝ-valued norm, NO ported matrix analysis. -/
theorem matrix_summable_of_entrywise (f : ℕ → Matrix (Fin 8) (Fin 8) Cut)
    (h : ∀ i j, Summable (fun n => f n i j)) : Summable f := by
  show Summable (α := Fin 8 → Fin 8 → Cut) f
  rw [Pi.summable]
  intro i
  rw [Pi.summable]
  intro j
  exact h i j

/-! ## The matrix exponential term and its entrywise bound. -/

/-- The `n`-th term of the matrix exponential series `exp(D) = ∑ₙ (1/n!)·Dⁿ`: `(1/n!) • Dⁿ`. A
    `Cut`-scalar multiple of a matrix power — MACHINERY on the DERIVED `Matrix … Cut`, NOT a posited
    exponential. -/
def expTerm (D : Matrix (Fin 8) (Fin 8) Cut) (n : ℕ) : Matrix (Fin 8) (Fin 8) Cut :=
  (1 / (n.factorial : Cut)) • (D ^ n)

/-- ★ THE ENTRYWISE BOUND: each entry of the `(n+1)`-th exponential term is dominated by the factorial
    majorant `|expTerm D (n+1) i j| ≤ (1/(n+1)!)·(opNorm D)^(n+1)`. From `abs_mul` (the `Cut`-scalar
    factor is nonneg) + the banked N38 `entry_abs_le_opNorm` (the operator norm dominates each entry)
    composed with `opNorm_pow_le` (submultiplicativity iterated). The `n ≥ 1` shift is because
    `opNorm 1 = 8 ≰ 1` (N38 `opNorm_one`). -/
theorem expTerm_entry_abs_le (D : Matrix (Fin 8) (Fin 8) Cut) (n : ℕ) (i j : Fin 8) :
    |expTerm D (n + 1) i j| ≤ (1 / ((n + 1).factorial : Cut)) * (opNorm D) ^ (n + 1) := by
  unfold expTerm
  rw [Matrix.smul_apply, smul_eq_mul, abs_mul]
  have h1 : |1 / ((n + 1).factorial : Cut)| = 1 / ((n + 1).factorial : Cut) := by
    rw [abs_of_nonneg]; positivity
  rw [h1]
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  calc |(D ^ (n + 1)) i j| ≤ opNorm (D ^ (n + 1)) := entry_abs_le_opNorm _ i j
    _ ≤ (opNorm D) ^ (n + 1) := opNorm_pow_le D n

/-! ## THE TARGET (c): the matrix exponential series is absolutely convergent. -/

/-- ★★ THE MATRIX EXPONENTIAL SERIES CONVERGES: `Summable (expTerm D)` — the series
    `exp(D) = ∑ₙ (1/n!)·Dⁿ` of any `8×8` coordinate matrix `D` over the derived ℝ is absolutely
    convergent. Reduce entrywise (`matrix_summable_of_entrywise`); summability is a tail property, so
    shift the index by `1` (`summable_nat_add_iff`); the shifted entry is absolutely bounded by the
    factorial majorant `(1/(n+1)!)·(opNorm D)^(n+1)` (`expTerm_entry_abs_le`), which is summable by the
    banked part-c·1 `cut_summable_pow_div_factorial` (at `c = opNorm D ≥ 0`, the banked N38
    `opNorm_nonneg`). The absolute-comparison levers (`cut_summable_of_abs` ∘
    `cut_summable_of_nonneg_of_le`) close each entry. The C6 eternal-approach as a convergent series:
    the factorial outruns `(opNorm D)ⁿ`. NO ℝ-valued norm, NO posited exp. -/
theorem expTerm_summable (D : Matrix (Fin 8) (Fin 8) Cut) : Summable (expTerm D) := by
  apply matrix_summable_of_entrywise
  intro i j
  rw [← summable_nat_add_iff 1]
  apply cut_summable_of_abs
  apply cut_summable_of_nonneg_of_le (fun n => abs_nonneg _)
    (fun n => expTerm_entry_abs_le D n i j)
  have hmaj : Summable (fun n => (opNorm D) ^ n / (n.factorial : Cut)) :=
    cut_summable_pow_div_factorial (opNorm_nonneg D)
  rw [← summable_nat_add_iff 1] at hmaj
  apply hmaj.congr
  intro n
  rw [one_div, div_eq_inv_mul]

/-! ## NON-VACUITY (W8): the convergence is genuine on a nonzero derivation matrix. -/

/-- NON-VACUITY: the exponential series of the IDENTITY matrix converges — a concrete nonzero instance
    (`opNorm 1 = 8 ≠ 0`, N38 `opNorm_one`), witnessing that `expTerm_summable` is not vacuous on the
    zero matrix alone. -/
theorem expTerm_summable_one : Summable (expTerm (1 : Matrix (Fin 8) (Fin 8) Cut)) :=
  expTerm_summable 1

end

end Phys.Algebra
