/-
# N313 — THE OCTONION STRUCTURE 3-FORM `φ` AND ITS SQUARED NORM `‖φ‖² = 42 = n(n−1)`
## (SEEDED GAUGE ROUTE A1 — docs/SEED_GAUGE_SCALE_COSMOLOGY.md, ARC A)

Over the derived `ℚ` and the octonion rung `O ℚ = CD (H ℚ)`, the banked totally-antisymmetric
CALIBRATION 3-FORM `assoc3 x y z = gForm x (octCross y z)` (N209) — the `G₂`-invariant associative
structure tensor of the octonion product, `assoc3_g2_invariant` (N-TowerGatherInvariantFormsG2) —
has SQUARED NORM, summed over the banked orthonormal imaginary frame `imBasis : Fin 7 → O ℚ`
(N-DerivationStabilizerSplit, `gForm_imBasis i j = δ_ij`), equal to

      ‖φ‖² := Σ_{i,j,k : Fin 7} (assoc3 (imBasis i) (imBasis j) (imBasis k))² = 42 = n(n−1),  n = 7.

## THE THEORY-NATIVE COLLAPSE (Born self-overlap, NOT a 343-term coordinate bash)

The 42 is a COUNTING landing forced by the SAME Born = self-overlap composition law that stops the
cascade at the octonions. Three banked levers, no octonion-product expansion:

1. **Parseval on the first index** (`imParseval`, the ONE build): for `w ∈ ImO`,
   `gForm w w = Σ_i (gForm (imBasis i) w)²` — the imaginary frame `{u1,e₂,…,e₇}` is
   `gForm`-orthonormal and exhausts the 7 imaginary coordinate slots (the real slot is killed by
   `reQ w = 0`, `reQ_ImO_zero`). With `w = octCross eⱼ eₖ` and `assoc3 eᵢ eⱼ eₖ = gForm eᵢ w` (the
   definition), `Σ_i (assoc3 eᵢ eⱼ eₖ)² = gForm w w`.
2. **The banked Lagrange / Born composition law** (`octCross_lagrange`, N206, itself from the
   surviving multiplicativity `Nrm_mul_on_O`): `gForm (octCross eⱼ eₖ)(octCross eⱼ eₖ)
   = gForm eⱼ eⱼ · gForm eₖ eₖ − (gForm eⱼ eₖ)²`.
3. **Orthonormality** (`gForm_imBasis`): `= 1·1 − δ_jk = 1 − δ_jk`.

So the inner sum over `i` is `1 − δ_jk` (`assoc3InnerSum`), and the total is
`Σ_{j,k} (1 − δ_jk) = 49 − 7 = 42`.

## THE READING: `42 = n(n−1)` — the off-diagonal ordered pairs of the 7 imaginary units

The `7` DIAGONAL pairs `(j,j)` contribute `0` (`octCross eⱼ eⱼ = 0`, `octCross_self`); each of the
`7·6 = 42` OFF-DIAGONAL ordered pairs `(j,k)`, `j ≠ k`, contributes a UNIT-length cross product
(`1 − 0 = 1` by the composition law). Hence `‖φ‖² = n(n−1) = 42`. This is the octonion rung of the
interaction-channel count `n(n−1)` (`ℂ:0, ℍ:6, 𝕆:42`, the same 42 read as the pair count of the
terminal algebra — Arc A2 downstream). ONE CAUSE: the Born composition law surviving precisely to
`O ℚ` (and LOST at `S ℚ`, `Nrm_not_mul_on_S`, N200) forces every off-diagonal cross product to unit
length; without it the count would collapse.

## STANDARD compliance
- WORDS-REMOVABLE (§2): delete "structure constant / calibration / gauge / coupling / channel" — the
  statements stand as pure mathematics over `ℚ` and `O ℚ = CD (H ℚ)`: the trilinear form
  `(x,y,z) ↦ gForm x (octCross y z)` summed-squared over the banked frame `imBasis` equals `42`. No
  physics name is load-bearing.
- NOT FREE-FLOATING: the TYPE cites the CONCRETE banked octonion objects `assoc3` / `octCross` /
  `gForm` / `imBasis` on `O ℚ` — NOT a generic 7-dim cross-product algebra or an abstract 3-form.
- G1 NO ASSERTED VALUE: `42` FALLS OUT of `49 − 7`, never premised.
- UNEARNED-IMPORT: ground field `ℚ` (the banked `O ℚ`); NO Mathlib-ℝ/ℂ as content; `Finset`/`Fin`
  are MACHINERY on the derived object (STANDARD §3).
- Foundations-only `⊆ {propext, Classical.choice, Quot.sound}`: no posited axiom, no sorry, no
  compiled-kernel bypass, no heartbeat inflation, no bridge.

DERIVED from the trunk (`assoc3`/`assoc3_eq_neg_reQ` N209; `octCross`/`octCross_mem_ImO`/
`octCross_self`/`octCross_lagrange` N206; `gForm`/`gForm_polar`/`reQ`/`reQ_ImO_zero` N24/N208;
`imBasis`/`imBasis_mem_ImO`/`gForm_imBasis` N-DerivationStabilizerSplit/N-TowerGatherIsometry;
`Nrm_mul_on_O` the surviving Born composition law N-ForcedStop — standard Mathlib `Finset`/`Fin`
MACHINERY on the DERIVED objects, STANDARD §3). NO posited 3-form / calibration / cross-product
algebra / `G₂` as content, NO Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.TowerGatherIsometry
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

set_option linter.unusedSimpArgs false

/-! ## The one build: Parseval on the imaginary frame. -/

/-- ★ PARSEVAL ON THE IMAGINARY FRAME: for imaginary `w`, the Born self-overlap decomposes as the
    sum of squared coordinates in the banked orthonormal imaginary frame `imBasis = {u1,e₂,…,e₇}`:
    `gForm w w = Σ_i (gForm (imBasis i) w)²`. The seven imaginary units exhaust the seven imaginary
    coordinate slots of `O ℚ`; the real slot is killed by `reQ w = 0` (`w ∈ ImO`). The `Fin 7`
    restriction of the banked `gForm_polar` (Fin 8, the full-octonion Parseval). -/
theorem imParseval (w : O ℚ) (hw : w ∈ ImO) :
    gForm w w = ∑ i : Fin 7, (gForm (imBasis i) w)^2 := by
  have hr : reQ w = 0 := reQ_ImO_zero hw
  rw [Fin.sum_univ_seven]
  obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := w
  simp only [imBasis, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val, gForm, reQ, u1, e2O, e3O, e4O, e5O, e6O, e7O,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] at hr ⊢
  nlinarith [hr, sq_nonneg a]

/-! ## The per-pair inner sum: `1 − δ_jk` (the Born composition law + orthonormality). -/

/-- ★ THE INNER SUM over the first index: for each ordered pair `(j,k)` of imaginary units,
    `Σ_i (assoc3 eᵢ eⱼ eₖ)² = 1 − δ_jk`. Through `imParseval` (`= gForm w w`, `w = octCross eⱼ eₖ`)
    and the banked Lagrange / Born composition law `octCross_lagrange` (`= 1·1 − δ_jk²`), then
    orthonormality `gForm_imBasis`. The OFF-DIAGONAL cross products are unit-length; the diagonal
    `j = k` vanishes. -/
theorem assoc3InnerSum (j k : Fin 7) :
    (∑ i : Fin 7, (assoc3 (imBasis i) (imBasis j) (imBasis k))^2)
      = 1 - (if j = k then (1:ℚ) else 0) := by
  set w := octCross (imBasis j) (imBasis k) with hw
  have hwmem : w ∈ ImO := octCross_mem_ImO (imBasis_mem_ImO k)
  have hpar := imParseval w hwmem
  have hrw : (∑ i : Fin 7, (assoc3 (imBasis i) (imBasis j) (imBasis k))^2)
      = ∑ i : Fin 7, (gForm (imBasis i) w)^2 := by
    apply Finset.sum_congr rfl; intro i _; rfl
  rw [hrw, ← hpar, hw,
      octCross_lagrange (imBasis_mem_ImO j) (imBasis_mem_ImO k),
      gForm_imBasis j j, gForm_imBasis k k, gForm_imBasis j k]
  simp only [if_pos rfl]
  by_cases hjk : j = k <;> simp [hjk]

/-! ## The squared norm of the calibration 3-form. -/

/-- THE SQUARED NORM of the octonion structure 3-form `φ = assoc3`, summed over the banked
    orthonormal imaginary frame: `‖φ‖² = Σ_{i,j,k} (assoc3 eᵢ eⱼ eₖ)²`. -/
def assoc3NormSq : ℚ :=
  ∑ i : Fin 7, ∑ j : Fin 7, ∑ k : Fin 7,
    (assoc3 (imBasis i) (imBasis j) (imBasis k))^2

/-- ★★★ THE HEADLINE: `‖φ‖² = 42`. The squared norm of the octonion calibration 3-form equals the
    count of nonzero structure constants = the number of off-diagonal ordered pairs of the seven
    imaginary units = `n(n−1) = 42` for `n = 7`. DERIVED (never asserted): `Σ_{j,k}(1 − δ_jk)
    = 49 − 7 = 42`. -/
theorem assoc3NormSq_eq_42 : assoc3NormSq = 42 := by
  unfold assoc3NormSq
  rw [Finset.sum_comm]
  have hstep : (∑ j : Fin 7, ∑ i : Fin 7, ∑ k : Fin 7,
        (assoc3 (imBasis i) (imBasis j) (imBasis k))^2)
      = ∑ j : Fin 7, ∑ k : Fin 7, (1 - (if j = k then (1:ℚ) else 0)) := by
    apply Finset.sum_congr rfl; intro j _
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl; intro k _
    exact assoc3InnerSum j k
  rw [hstep]
  simp only [Finset.sum_sub_distrib, Finset.sum_ite_eq', Finset.mem_univ, if_true,
    Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  norm_num

/-- THE `n(n−1)` READING: `42 = 7 · (7 − 1)` — the squared norm is the count of off-diagonal ordered
    pairs of the seven imaginary units, the octonion rung of the interaction-channel count. -/
theorem assoc3NormSq_eq_n_times_n_sub_one : assoc3NormSq = 7 * (7 - 1) := by
  rw [assoc3NormSq_eq_42]; norm_num

/-! ## W8 non-vacuity teeth. -/

/-- W8: the DIAGONAL pair contributes `0` — the self cross product is degenerate
    (`octCross eⱼ eⱼ = 0`), so `Σ_i (assoc3 eᵢ eⱼ eⱼ)² = 0`. The `7` diagonal terms genuinely drop;
    the `42` is NOT `49`. -/
theorem assoc3InnerSum_diag (j : Fin 7) :
    (∑ i : Fin 7, (assoc3 (imBasis i) (imBasis j) (imBasis j))^2) = 0 := by
  rw [assoc3InnerSum j j]; simp only [if_pos rfl]; norm_num

/-- W8: the OFF-DIAGONAL pair contributes `1` — the cross product of two distinct imaginary units is
    unit-length. E.g. `(j,k) = (0,1)`: `Σ_i (assoc3 eᵢ e₀ e₁)² = 1`. -/
theorem assoc3InnerSum_offdiag_01 :
    (∑ i : Fin 7, (assoc3 (imBasis i) (imBasis 0) (imBasis 1))^2) = 1 := by
  rw [assoc3InnerSum 0 1]
  norm_num

/-- W8 NON-VACUITY: `‖φ‖² ≠ 0` (it is `42`) — the calibration 3-form is genuinely non-degenerate. -/
theorem assoc3NormSq_ne_zero : assoc3NormSq ≠ 0 := by
  rw [assoc3NormSq_eq_42]; norm_num

/-- W8 TEETH: `‖φ‖² ≠ 49` — the diagonal really drops, distinguishing `n(n−1) = 42` from the naive
    `n² = 49` (all ordered pairs including the degenerate diagonal). -/
theorem assoc3NormSq_ne_49 : assoc3NormSq ≠ 49 := by
  rw [assoc3NormSq_eq_42]; norm_num

end

end Phys.Algebra
