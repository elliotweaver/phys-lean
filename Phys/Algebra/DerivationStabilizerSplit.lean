/-
  N42c — THE BRANCHING `7 = 3 ⊕ 3̄ ⊕ 1` of `Im(𝕆)` under the stabilizer, DERIVED from the
  chain by the complex structure `J = L_{u1}` (left-multiplication by the banked square-root
  of `−1`), NOT a posited `SU(3)`/`G₂`/`3 ⊕ 3̄`, NOT Mathlib `ℝ`/`ℂ` as content.

  WHAT THIS FILE BANKS (N42c, the third — final — increment of the colour-branching node):
    JO                     — the ℚ-linear left-multiplication `x ↦ u1 · x` (the complex
                             structure operator, the lever of the whole split).
    JO_sq                  — ★★ `J ∘ J = −id`: the COMPLEX STRUCTURE, trunk-native, from the
                             banked LEFT-ALTERNATIVE law (`mul_mul_left`: `u1·(u1·x)=(u1·u1)·x`)
                             and `complexUnit_sq` (`u1·u1 = −1`). NO coordinate bash on the
                             non-associative product — the trunk dissolves it (W1 reframe).
    JOequiv                — `J` is a LINEAR AUTOMORPHISM of `O ℚ` (inverse `−J`, since `J²=−1`).
    imBasis / span_imBasis_eq_ImO — the explicit 7-element basis `{u1,e₂,…,e₇}` of `Im(𝕆)`.
    singlet / Uhol / Uah   — the `1` (`⟨u1⟩`), the `3` (`⟨e₂,e₄,e₆⟩`), the `3̄` (`⟨e₃,e₅,e₇⟩`).
    finrank_singlet/_Uhol/_Uah/_Vsub — `1 / 3 / 3 / 6`, DERIVED.
    Uhol_map_JO_le_Uah, Uah_map_JO_le_Uhol — ★ `J` SWAPS the two triplets `3 ↔ 3̄`: this is
                             exactly the complex-conjugation relating a representation to its
                             conjugate. (`J·e₂=e₃, J·e₄=e₅, J·e₆=−e₇` and back.)
    Uhol_disj_Uah, Uhol_sup_Uah_eq_V — the `6 = 3 ⊕ 3̄` split of `V` (disjoint, sup = V).
    singlet_disj_V, singlet_sup_V_eq_ImO — the `7 = 1 ⊕ 6` split of `Im(𝕆)`.
    branching_7            — ★★★ THE HEADLINE: `Im(𝕆) = ⟨u1⟩ ⊕ (V = 3 ⊕ 3̄)` with the three
                             pieces pairwise disjoint, summing to `Im(𝕆)`, of dimensions
                             `1 + 3 + 3 = 7`, the `3̄` being the `J`-image of the `3`.

  THE ROUTE (reframe through the trunk — the complex structure is the lever, W1):
    `J = L_{u1}` is a square root of `−id` BECAUSE the octonions are LEFT-ALTERNATIVE — the
    banked `mul_mul_left` gives `u1·(u1·x) = (u1·u1)·x = (−1)·x = −x` for EVERY `x`, with no
    associativity and no coordinate expansion. `J` is then invertible (`J·(−J) = id`), so it
    is a linear automorphism; the `J`-image of the explicit `3 = ⟨e₂,e₄,e₆⟩` is the conjugate
    `3̄ = ⟨e₃,e₅,e₇⟩` (same dimension, by `LinearEquiv.finrank_map_eq`), and the two are disjoint
    subfamilies of the banked independent `imgUnit`, summing to the `6`-dim `V`. With the
    `1`-dim fixed line `⟨u1⟩` disjoint from `V` and summing to the banked `7`-dim `Im(𝕆)`, the
    branching `7 = 3 ⊕ 3̄ ⊕ 1` is forced.

  ★ THE MOAT: `SU(3) ⊂ G₂` with `7 → 3 ⊕ 3̄ ⊕ 1` is standard (Günaydin–Gürsey); here the split
  DESCENDS from the banked complex unit `u1` (a square-root of `−1` from the cascade) acting by
  left-multiplication on the banked `Im(𝕆)`, NOT a posited `SU(3)`/`3 ⊕ 3̄`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "colour/SU(3)/G₂/triplet/3/3̄/singlet/
  complex" → left-multiplication by a fixed square-root of `−1` on the 6-dim orthogonal
  complement of its own plane inside the imaginary part of the Cayley–Dickson double of a double
  of a double of ℚ squares to `−id`, making that complement the direct sum of an explicit 3-dim
  subspace and its image under that operator; with the 1-dim fixed line this splits the 7-dim
  imaginary part as `1 ⊕ (3 ⊕ 3)`. The names do zero logical work.

  Everything is over ℚ (pure algebra — NO continuum, NO Mathlib ℝ/ℂ as content; the
  complexification is the DERIVED `u1`-action, not a posited ℂ). `LinearMap`/`Submodule`/
  `Module.finrank`/`LinearEquiv` are MACHINERY on the DERIVED objects. NO posited
  `SU(3)`/`G₂`/`3`/`3̄`, NO bridge.
-/
import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationRep7

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The complex structure `J = L_{u1}` and its square `J² = −1`. -/

/-- The ℚ-linear left-multiplication by the fixed complex unit `u1`, `x ↦ u1 · x`. This is the
    complex structure operator whose square is `−id` (the lever of the `3 ⊕ 3̄` split). -/
def JO : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := u1 * x
  map_add' x y := CD.mul_add_na u1 x y
  map_smul' c x := by
    show u1 * (c • x) = c • (u1 * x)
    ext <;> simp [u1]

@[simp] theorem JO_apply (x : O ℚ) : JO x = u1 * x := rfl

/-- ★★ THE COMPLEX STRUCTURE: `J ∘ J = −id`. Trunk-native — the banked LEFT-ALTERNATIVE law
    `mul_mul_left` (`u1·(u1·x) = (u1·u1)·x`) and `complexUnit_sq` (`u1·u1 = −1`) give
    `u1·(u1·x) = −x` for every `x`, with NO associativity and NO coordinate expansion (W1: the
    trunk dissolves what would be a brutal non-associative bash). -/
theorem JO_sq : JO.comp JO = -LinearMap.id := by
  refine LinearMap.ext (fun x => ?_)
  show u1 * (u1 * x) = -x
  rw [mul_mul_left, complexUnit_sq, neg_one_mul]

/-- `J · (−J) = id`: the inverse of `J` is `−J` (since `J² = −1`). -/
theorem JO_comp_negJO : JO.comp (-JO) = LinearMap.id := by
  rw [LinearMap.comp_neg, JO_sq, neg_neg]

/-- `(−J) · J = id`. -/
theorem negJO_comp_JO : (-JO).comp JO = LinearMap.id := by
  rw [LinearMap.neg_comp, JO_sq, neg_neg]

/-- ★ `J` IS A LINEAR AUTOMORPHISM of `O ℚ` (inverse `−J`). The complex structure is invertible,
    so its image of any subspace has the same dimension — the mechanism that makes the conjugate
    triplet `3̄` automatically `3`-dimensional. -/
def JOequiv : O ℚ ≃ₗ[ℚ] O ℚ := LinearEquiv.ofLinear JO (-JO) JO_comp_negJO negJO_comp_JO

@[simp] theorem JOequiv_apply (x : O ℚ) : JOequiv x = u1 * x := rfl

@[simp] theorem JOequiv_toLinearMap : (JOequiv : O ℚ →ₗ[ℚ] O ℚ) = JO := rfl

/-! ## The explicit 7-element basis of `Im(𝕆)`. -/

/-- The 7-element family `{u1, e₂, e₃, e₄, e₅, e₆, e₇}` of imaginary units — a basis of `Im(𝕆)`. -/
def imBasis : Fin 7 → O ℚ := ![u1, e2O, e3O, e4O, e5O, e6O, e7O]

set_option linter.unusedSimpArgs false in
/-- The 7 imaginary units are linearly independent (coordinate read-off). -/
theorem imBasis_indep : LinearIndependent ℚ imBasis := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero, imBasis] at hg
  have h1 := congrArg c1 hg
  have h2 := congrArg c2 hg
  have h3 := congrArg c3 hg
  have h4 := congrArg c4 hg
  have h5 := congrArg c5 hg
  have h6 := congrArg c6 hg
  have h7 := congrArg c7 hg
  simp only [u1, e2O, e3O, e4O, e5O, e6O, e7O, c1, c2, c3, c4, c5, c6, c7,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h1 h2 h3 h4 h5 h6 h7
  intro i
  fin_cases i
  · simpa using h1
  · simpa using h2
  · simpa using h3
  · simpa using h4
  · simpa using h5
  · simpa using h6
  · simpa using h7

set_option linter.unusedSimpArgs false in
/-- Each of the 7 basis units is imaginary (lies in the banked `ImO`). -/
theorem imBasis_mem_ImO (i : Fin 7) : imBasis i ∈ ImO := by
  fin_cases i
  · exact u1_mem_ImO
  · show e2O ∈ ImO; rw [mem_ImO]; show star e2O = -e2O
    ext <;> simp [e2O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
  · show e3O ∈ ImO; rw [mem_ImO]; show star e3O = -e3O
    ext <;> simp [e3O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
  · show e4O ∈ ImO; rw [mem_ImO]; show star e4O = -e4O
    ext <;> simp [e4O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
  · show e5O ∈ ImO; rw [mem_ImO]; show star e5O = -e5O
    ext <;> simp [e5O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
  · show e6O ∈ ImO; rw [mem_ImO]; show star e6O = -e6O
    ext <;> simp [e6O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
  · show e7O ∈ ImO; rw [mem_ImO]; show star e7O = -e7O
    ext <;> simp [e7O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']

/-- `span {u1,e₂,…,e₇} ≤ Im(𝕆)`. -/
theorem span_imBasis_le_ImO : Submodule.span ℚ (Set.range imBasis) ≤ ImO := by
  rw [Submodule.span_le, Set.range_subset_iff]
  intro i; exact imBasis_mem_ImO i

/-- ★ `span {u1,e₂,…,e₇} = Im(𝕆)`: the 7 independent imaginary units exhaust the 7-dim `ImO`. -/
theorem span_imBasis_eq_ImO : Submodule.span ℚ (Set.range imBasis) = ImO := by
  apply Submodule.eq_of_le_of_finrank_eq span_imBasis_le_ImO
  rw [finrank_span_eq_card imBasis_indep, finrank_ImO, Fintype.card_fin]

/-! ## The three pieces: the singlet `⟨u1⟩` (1), and the triplets `Uhol` (3), `Uah` (3̄). -/

/-- The SINGLET `1`: the fixed line `⟨u1⟩` (the imaginary unit defining the complex structure). -/
def singlet : Submodule ℚ (O ℚ) := Submodule.span ℚ {u1}

/-- The TRIPLET `3`: `⟨e₂, e₄, e₆⟩` (the `J`-holomorphic half of `V`). -/
def Uhol : Submodule ℚ (O ℚ) := Submodule.span ℚ (Set.range (![e2O, e4O, e6O] : Fin 3 → O ℚ))

/-- The CONJUGATE TRIPLET `3̄`: `⟨e₃, e₅, e₇⟩` (the `J`-antiholomorphic half — the `J`-image of `3`). -/
def Uah : Submodule ℚ (O ℚ) := Submodule.span ℚ (Set.range (![e3O, e5O, e7O] : Fin 3 → O ℚ))

/-- `V`: the 6-dim Born-orthogonal complement `⟨e₂,…,e₇⟩` (the banked `imgUnit` span). -/
def Vsub : Submodule ℚ (O ℚ) := Submodule.span ℚ (Set.range imgUnit)

theorem u1_ne_zero : u1 ≠ (0 : O ℚ) := by
  intro h; have : c1 u1 = c1 (0 : O ℚ) := by rw [h]
  simp [u1, c1] at this

/-- `dim ⟨u1⟩ = 1` (the singlet). -/
theorem finrank_singlet : Module.finrank ℚ singlet = 1 :=
  finrank_span_singleton u1_ne_zero

set_option linter.unusedSimpArgs false in
/-- `{e₂,e₄,e₆}` are linearly independent. -/
theorem uhol_indep : LinearIndependent ℚ (![e2O, e4O, e6O] : Fin 3 → O ℚ) := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero] at hg
  have h2 := congrArg c2 hg
  have h4 := congrArg c4 hg
  have h6 := congrArg c6 hg
  simp only [e2O, e4O, e6O, c2, c4, c6,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h2 h4 h6
  intro i
  fin_cases i
  · simpa using h2
  · simpa using h4
  · simpa using h6

set_option linter.unusedSimpArgs false in
/-- `{e₃,e₅,e₇}` are linearly independent. -/
theorem uah_indep : LinearIndependent ℚ (![e3O, e5O, e7O] : Fin 3 → O ℚ) := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero] at hg
  have h3 := congrArg c3 hg
  have h5 := congrArg c5 hg
  have h7 := congrArg c7 hg
  simp only [e3O, e5O, e7O, c3, c5, c7,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h3 h5 h7
  intro i
  fin_cases i
  · simpa using h3
  · simpa using h5
  · simpa using h7

/-- ★ `dim 3 = 3` (the holomorphic triplet). -/
theorem finrank_Uhol : Module.finrank ℚ Uhol = 3 := by
  rw [Uhol, finrank_span_eq_card uhol_indep]; rfl

/-- ★ `dim 3̄ = 3` (the conjugate triplet). -/
theorem finrank_Uah : Module.finrank ℚ Uah = 3 := by
  rw [Uah, finrank_span_eq_card uah_indep]; rfl

/-- `dim V = 6`. -/
theorem finrank_Vsub : Module.finrank ℚ Vsub = 6 := by
  rw [Vsub, finrank_span_eq_card imgUnit_indep]; rfl

/-! ## `J` swaps the two triplets `3 ↔ 3̄` (the conjugation). -/

/-- `J · e₂ = e₃`. -/
theorem JO_e2 : JO e2O = e3O := by show u1 * e2O = e3O; ext <;> simp [u1, e2O, e3O]
/-- `J · e₄ = e₅`. -/
theorem JO_e4 : JO e4O = e5O := by show u1 * e4O = e5O; ext <;> simp [u1, e4O, e5O]
/-- `J · e₆ = −e₇`. -/
theorem JO_e6 : JO e6O = -e7O := by show u1 * e6O = -e7O; ext <;> simp [u1, e6O, e7O]
/-- `J · e₃ = −e₂`. -/
theorem JO_e3 : JO e3O = -e2O := by show u1 * e3O = -e2O; ext <;> simp [u1, e2O, e3O]
/-- `J · e₅ = −e₄`. -/
theorem JO_e5 : JO e5O = -e4O := by show u1 * e5O = -e4O; ext <;> simp [u1, e4O, e5O]
/-- `J · e₇ = e₆`. -/
theorem JO_e7 : JO e7O = e6O := by show u1 * e7O = e6O; ext <;> simp [u1, e6O, e7O]

/-- ★ `J` MAPS `3` INTO `3̄`: `J·⟨e₂,e₄,e₆⟩ ⊆ ⟨e₃,e₅,e₇⟩`. The complex structure carries the
    holomorphic triplet to the antiholomorphic one — the relation between a representation and
    its complex conjugate. -/
theorem Uhol_map_JO_le_Uah : Uhol.map JO ≤ Uah := by
  rw [Uhol, Submodule.map_span, Submodule.span_le]
  rintro _ ⟨_, ⟨i, rfl⟩, rfl⟩
  have hU3 : e3O ∈ Uah := Submodule.subset_span ⟨0, rfl⟩
  have hU5 : e5O ∈ Uah := Submodule.subset_span ⟨1, rfl⟩
  have hU7 : e7O ∈ Uah := Submodule.subset_span ⟨2, rfl⟩
  fin_cases i
  · show JO e2O ∈ Uah; rw [JO_e2]; exact hU3
  · show JO e4O ∈ Uah; rw [JO_e4]; exact hU5
  · show JO e6O ∈ Uah; rw [JO_e6]; exact Submodule.neg_mem _ hU7

/-- ★ `J` MAPS `3̄` BACK INTO `3`: `J·⟨e₃,e₅,e₇⟩ ⊆ ⟨e₂,e₄,e₆⟩`. With the previous lemma, `J`
    swaps the two triplets — they are genuine complex conjugates under the complex structure. -/
theorem Uah_map_JO_le_Uhol : Uah.map JO ≤ Uhol := by
  rw [Uah, Submodule.map_span, Submodule.span_le]
  rintro _ ⟨_, ⟨i, rfl⟩, rfl⟩
  have hU2 : e2O ∈ Uhol := Submodule.subset_span ⟨0, rfl⟩
  have hU4 : e4O ∈ Uhol := Submodule.subset_span ⟨1, rfl⟩
  have hU6 : e6O ∈ Uhol := Submodule.subset_span ⟨2, rfl⟩
  fin_cases i
  · show JO e3O ∈ Uhol; rw [JO_e3]; exact Submodule.neg_mem _ hU2
  · show JO e5O ∈ Uhol; rw [JO_e5]; exact Submodule.neg_mem _ hU4
  · show JO e7O ∈ Uhol; rw [JO_e7]; exact hU6

/-! ## The `6 = 3 ⊕ 3̄` split of `V`. -/

/-- `Uhol ≤ V`. -/
theorem Uhol_le_Vsub : Uhol ≤ Vsub := by
  rw [Uhol, Vsub, Submodule.span_le]
  rintro _ ⟨i, rfl⟩
  fin_cases i
  · exact Submodule.subset_span ⟨0, rfl⟩
  · exact Submodule.subset_span ⟨2, rfl⟩
  · exact Submodule.subset_span ⟨4, rfl⟩

/-- `Uah ≤ V`. -/
theorem Uah_le_Vsub : Uah ≤ Vsub := by
  rw [Uah, Vsub, Submodule.span_le]
  rintro _ ⟨i, rfl⟩
  fin_cases i
  · exact Submodule.subset_span ⟨1, rfl⟩
  · exact Submodule.subset_span ⟨3, rfl⟩
  · exact Submodule.subset_span ⟨5, rfl⟩

/-- ★ `3 ⊓ 3̄ = 0`: the two triplets are DISJOINT (linearly independent subfamilies of the
    banked `imgUnit`). -/
theorem Uhol_disj_Uah : Disjoint Uhol Uah := by
  have key : Disjoint (Submodule.span ℚ (imgUnit '' {0, 2, 4}))
      (Submodule.span ℚ (imgUnit '' {1, 3, 5})) := by
    refine imgUnit_indep.disjoint_span_image ?_
    rw [Set.disjoint_left]; decide
  have e1 : Submodule.span ℚ (imgUnit '' {0, 2, 4}) = Uhol := by
    rw [Uhol]; congr 1; ext x
    simp only [Set.mem_image, Set.mem_insert_iff, Set.mem_singleton_iff, Set.mem_range]
    constructor
    · rintro ⟨i, hi, rfl⟩
      rcases hi with h | h | h <;> subst h
      · exact ⟨0, rfl⟩
      · exact ⟨1, rfl⟩
      · exact ⟨2, rfl⟩
    · rintro ⟨i, rfl⟩; fin_cases i
      · exact ⟨0, by tauto, rfl⟩
      · exact ⟨2, by tauto, rfl⟩
      · exact ⟨4, by tauto, rfl⟩
  have e2 : Submodule.span ℚ (imgUnit '' {1, 3, 5}) = Uah := by
    rw [Uah]; congr 1; ext x
    simp only [Set.mem_image, Set.mem_insert_iff, Set.mem_singleton_iff, Set.mem_range]
    constructor
    · rintro ⟨i, hi, rfl⟩
      rcases hi with h | h | h <;> subst h
      · exact ⟨0, rfl⟩
      · exact ⟨1, rfl⟩
      · exact ⟨2, rfl⟩
    · rintro ⟨i, rfl⟩; fin_cases i
      · exact ⟨1, by tauto, rfl⟩
      · exact ⟨3, by tauto, rfl⟩
      · exact ⟨5, by tauto, rfl⟩
  rwa [e1, e2] at key

/-- ★★ `3 ⊕ 3̄ = V` (the `6 = 3 + 3` split). The two disjoint triplets, each of dim 3, sum to
    the 6-dim `V`: `Uhol ⊔ Uah ≤ V` and equal dimensions force equality. -/
theorem Uhol_sup_Uah_eq_Vsub : Uhol ⊔ Uah = Vsub := by
  apply Submodule.eq_of_le_of_finrank_eq (sup_le Uhol_le_Vsub Uah_le_Vsub)
  have hdisj : Module.finrank ℚ (Uhol ⊔ Uah : Submodule ℚ (O ℚ))
      = Module.finrank ℚ Uhol + Module.finrank ℚ Uah := by
    have h1 := Submodule.finrank_sup_add_finrank_inf_eq Uhol Uah
    rw [Uhol_disj_Uah.eq_bot, finrank_bot, add_zero] at h1
    omega
  rw [hdisj, finrank_Uhol, finrank_Uah, finrank_Vsub]

/-! ## The `7 = 1 ⊕ 6` split of `Im(𝕆)`. -/

/-- `⟨u1⟩ ≤ Im(𝕆)`. -/
theorem singlet_le_ImO : singlet ≤ ImO := by
  rw [singlet, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
  exact u1_mem_ImO

/-- `V ≤ Im(𝕆)`. -/
theorem Vsub_le_ImO : Vsub ≤ ImO := by
  rw [Vsub, Submodule.span_le, Set.range_subset_iff]
  intro i
  have : imgUnit i = imBasis i.succ := by fin_cases i <;> rfl
  rw [SetLike.mem_coe, this]
  exact imBasis_mem_ImO _

/-- `u1 ∉ V` (the singlet axis is not in the complement). -/
theorem u1_not_mem_Vsub : u1 ∉ Vsub := by
  intro h
  -- c1 is a linear functional that is 1 on u1 but 0 on every imgUnit, hence 0 on Vsub.
  have hfun : ∀ x ∈ Vsub, c1 x = 0 := by
    intro x hx
    rw [Vsub] at hx
    refine Submodule.span_induction (p := fun y _ => c1 y = 0) ?_ ?_ ?_ ?_ hx
    · rintro _ ⟨i, rfl⟩; fin_cases i <;>
        simp [imgUnit, e2O, e3O, e4O, e5O, e6O, e7O, c1]
    · simp [c1]
    · intro a b _ _ ha hb
      simp only [c1, CD.add_re, Dbl.add_im] at *
      rw [ha, hb]; ring
    · intro r a _ ha
      simp only [c1, cd_qsmul_re, Dbl.smul_im] at *
      rw [ha]; simp
  have := hfun u1 h
  simp [u1, c1] at this

/-- ★ `⟨u1⟩ ⊓ V = 0`: the singlet axis is DISJOINT from the complement. -/
theorem singlet_disj_Vsub : Disjoint singlet Vsub := by
  rw [singlet, disjoint_comm]
  exact (Submodule.disjoint_span_singleton' u1_ne_zero).mpr u1_not_mem_Vsub

/-- ★★ `⟨u1⟩ ⊕ V = Im(𝕆)` (the `7 = 1 ⊕ 6` split). The singlet and the 6-dim complement are
    disjoint and sum (`1 + 6 = 7 = dim Im(𝕆)`) to the whole imaginary part. -/
theorem singlet_sup_Vsub_eq_ImO : singlet ⊔ Vsub = ImO := by
  apply Submodule.eq_of_le_of_finrank_eq (sup_le singlet_le_ImO Vsub_le_ImO)
  have hsumeq : Module.finrank ℚ (singlet ⊔ Vsub : Submodule ℚ (O ℚ))
      = Module.finrank ℚ singlet + Module.finrank ℚ Vsub := by
    have h1 := Submodule.finrank_sup_add_finrank_inf_eq singlet Vsub
    rw [singlet_disj_Vsub.eq_bot, finrank_bot, add_zero] at h1
    omega
  rw [hsumeq, finrank_singlet, finrank_Vsub, finrank_ImO]

/-! ## ★★★ THE HEADLINE: the branching `7 = 3 ⊕ 3̄ ⊕ 1`. -/

/-- ★★★ THE BRANCHING `7 = 3 ⊕ 3̄ ⊕ 1` of `Im(𝕆)` under the complex structure `J = L_{u1}`.
    DERIVED from the chain — packaged as: the three pieces `⟨u1⟩` (the `1`), `Uhol` (the `3`),
    `Uah` (the `3̄`) have dimensions `1, 3, 3`; the complex structure `J` (with `J² = −1`) swaps
    the two triplets `3 ↔ 3̄`; `Uhol` and `Uah` are disjoint and sum to the 6-dim `V`; and `⟨u1⟩`
    and `V` are disjoint and sum to the 7-dim `Im(𝕆)`. So `Im(𝕆) = ⟨u1⟩ ⊕ (Uhol ⊕ Uah)` with
    `dim = 1 + (3 + 3) = 7`. NOT a posited `SU(3)`/`3 ⊕ 3̄`; the complex `3` descends from the
    banked square-root-of-`−1` `u1` acting on the banked `Im(𝕆)`. -/
theorem branching_7 :
    -- dimensions: 1, 3, 3, summing to 7
    Module.finrank ℚ singlet = 1 ∧
    Module.finrank ℚ Uhol = 3 ∧
    Module.finrank ℚ Uah = 3 ∧
    Module.finrank ℚ ImO = 7 ∧
    Module.finrank ℚ singlet + (Module.finrank ℚ Uhol + Module.finrank ℚ Uah) = 7 ∧
    -- the complex structure J² = −1 and its swap of the two triplets 3 ↔ 3̄
    JO.comp JO = -LinearMap.id ∧
    Uhol.map JO ≤ Uah ∧ Uah.map JO ≤ Uhol ∧
    -- the 6 = 3 ⊕ 3̄ split of V
    Disjoint Uhol Uah ∧ Uhol ⊔ Uah = Vsub ∧
    -- the 7 = 1 ⊕ 6 split of Im(𝕆)
    Disjoint singlet Vsub ∧ singlet ⊔ Vsub = ImO := by
  refine ⟨finrank_singlet, finrank_Uhol, finrank_Uah, finrank_ImO, ?_, JO_sq,
    Uhol_map_JO_le_Uah, Uah_map_JO_le_Uhol, Uhol_disj_Uah, Uhol_sup_Uah_eq_Vsub,
    singlet_disj_Vsub, singlet_sup_Vsub_eq_ImO⟩
  rw [finrank_singlet, finrank_Uhol, finrank_Uah]

end

end Phys.Algebra
