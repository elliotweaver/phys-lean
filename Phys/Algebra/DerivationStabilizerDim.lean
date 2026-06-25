/-
  N42b — THE DIMENSION `dim stabLieQ = 8 = dim su(3)` of the stabilizer Lie subalgebra
  of a fixed imaginary unit inside `Der(𝕆)`, DERIVED from the chain by rank–nullity.

  WHAT THIS FILE BANKS (N42b, the second increment of the colour-branching node):
    imgUnit                — the `Fin 6` family `{e₂,e₃,e₄,e₅,e₆,e₇}` of imaginary units
                             orthogonal to the `⟨1,u1⟩ = ⟨e₀,e₁⟩` complex line.
    imgUnit_indep          — those 6 units are linearly independent (coordinate read-off).
    range_evalU1_eq        — `range evalU1 = span ℚ {e₂,…,e₇}`: the image of the
                             evaluation-at-`u1` map is exactly the 6-dim complement, computed
                             from the explicit images of the banked 14-element basis `bL`.
    finrank_range_evalU1   — `finrank ℚ (range evalU1) = 6`.
    finrank_stabLieQ       — ★★ THE TARGET: `finrank ℚ stabLieQ.toSubmodule = 8`, by
                             rank–nullity on `evalU1` (`14 − 6 = 8`). DERIVED, NOT a posited
                             `dim su(3) = 8`.

  THE ROUTE (rank–nullity, reframed through the trunk — NO posited dimension):
    The banked 14 explicit derivations `D0E..D13E` form a `Module.Basis (Fin 14) ℚ derivationLieQ`
    (`bLbasis`, N23), so `range evalU1 = span { evalU1 (bL i) | i } = span { D_iE u1 | i }`. The
    14 images compute exactly — `D0E,D1E,D2E,D13E ↦ 0`, and the other ten land in (and span) the
    6-dim space `span{e₂,e₃,e₄,e₅,e₆,e₇}` of imaginary units orthogonal to `u1`'s quaternion
    plane. So `finrank (range evalU1) = 6`, and `LinearMap.finrank_range_add_finrank_ker evalU1`
    with `finrank ℚ derivationLieQ = 14` (banked `bLbasis`) and `stabLieQ_toSubmodule_eq_ker`
    (N42a) gives `finrank stabLieQ.toSubmodule = 14 − 6 = 8`.

  ★ THE MOAT: `dim su(3) = 8` is standard; here the 8 DESCENDS from the banked `derivationLieQ`
  basis and the explicit 6-dim range of evaluation-at-a-vector, NOT posited to "match" su(3).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "colour/SU(3)/G₂/triplet/complex unit"
  → the dimension of the kernel of the evaluation-at-a-fixed-vector linear map on the 14-dim
  Leibniz-derivation Lie algebra of the Cayley–Dickson double of a double of a double of ℚ is 8.
  The names do zero logical work.

  Everything is over ℚ (pure algebra — NO continuum, NO Mathlib ℝ as content). `Module.finrank`,
  `LinearMap.finrank_range_add_finrank_ker`, `Submodule.span`, `finrank_span_eq_card` are
  MACHINERY on the DERIVED objects. NO posited `SU(3)`/`G₂`/`su(3)`/`g₂`/`dim`, NO bridge.
-/
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationPerfect

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The 6 imaginary units orthogonal to the `⟨1, u1⟩ = ⟨e₀, e₁⟩` complex line. -/

/-- `e₂` (the first imaginary unit beyond the `u1`-plane). -/
def e2O : O ℚ := ⟨⟨⟨0,0⟩, ⟨1,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
/-- `e₃`. -/
def e3O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,1⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
/-- `e₄`. -/
def e4O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨1,0⟩, ⟨0,0⟩⟩⟩
/-- `e₅`. -/
def e5O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,1⟩, ⟨0,0⟩⟩⟩
/-- `e₆`. -/
def e6O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨1,0⟩⟩⟩
/-- `e₇` (the last Cayley–Dickson coordinate). -/
def e7O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,1⟩⟩⟩

/-- The `Fin 6` family of the 6 imaginary units `{e₂,e₃,e₄,e₅,e₆,e₇}`. -/
def imgUnit : Fin 6 → O ℚ := ![e2O, e3O, e4O, e5O, e6O, e7O]

set_option linter.unusedSimpArgs false in
/-- ★ THE 6 UNITS ARE LINEARLY INDEPENDENT (coordinate read-off `cₖ(eⱼ) = δ`). -/
theorem imgUnit_indep : LinearIndependent ℚ imgUnit := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero, imgUnit] at hg
  have h2 := congrArg c2 hg
  have h3 := congrArg c3 hg
  have h4 := congrArg c4 hg
  have h5 := congrArg c5 hg
  have h6 := congrArg c6 hg
  have h7 := congrArg c7 hg
  simp only [e2O, e3O, e4O, e5O, e6O, e7O, c2, c3, c4, c5, c6, c7,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h2 h3 h4 h5 h6 h7
  intro i
  fin_cases i
  · simpa using h2
  · simpa using h3
  · simpa using h4
  · simpa using h5
  · simpa using h6
  · simpa using h7

/-! ## The 14 explicit images `evalU1 (bL i) = D_iE u1`. -/

set_option linter.unusedSimpArgs false in
theorem img_0  : evalU1 (bL 0)  = 0   := by
  rw [evalU1_apply, bL_coe]; show D0E u1 = 0
  ext <;> simp [D0E, u1, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_1  : evalU1 (bL 1)  = 0   := by
  rw [evalU1_apply, bL_coe]; show D1E u1 = 0
  ext <;> simp [D1E, u1, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_2  : evalU1 (bL 2)  = 0   := by
  rw [evalU1_apply, bL_coe]; show D2E u1 = 0
  ext <;> simp [D2E, u1, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_3  : evalU1 (bL 3)  = e6O := by
  rw [evalU1_apply, bL_coe]; show D3E u1 = e6O
  ext <;> simp [D3E, u1, e6O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_4  : evalU1 (bL 4)  = -e5O := by
  rw [evalU1_apply, bL_coe]; show D4E u1 = -e5O
  ext <;> simp [D4E, u1, e5O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_5  : evalU1 (bL 5)  = -e4O := by
  rw [evalU1_apply, bL_coe]; show D5E u1 = -e4O
  ext <;> simp [D5E, u1, e4O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_6  : evalU1 (bL 6)  = e3O := by
  rw [evalU1_apply, bL_coe]; show D6E u1 = e3O
  ext <;> simp [D6E, u1, e3O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_7  : evalU1 (bL 7)  = e2O := by
  rw [evalU1_apply, bL_coe]; show D7E u1 = e2O
  ext <;> simp [D7E, u1, e2O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_8  : evalU1 (bL 8)  = e7O := by
  rw [evalU1_apply, bL_coe]; show D8E u1 = e7O
  ext <;> simp [D8E, u1, e7O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_9  : evalU1 (bL 9)  = e4O := by
  rw [evalU1_apply, bL_coe]; show D9E u1 = e4O
  ext <;> simp [D9E, u1, e4O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_10 : evalU1 (bL 10) = -e5O := by
  rw [evalU1_apply, bL_coe]; show D10E u1 = -e5O
  ext <;> simp [D10E, u1, e5O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_11 : evalU1 (bL 11) = -e2O := by
  rw [evalU1_apply, bL_coe]; show D11E u1 = -e2O
  ext <;> simp [D11E, u1, e2O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_12 : evalU1 (bL 12) = e3O := by
  rw [evalU1_apply, bL_coe]; show D12E u1 = e3O
  ext <;> simp [D12E, u1, e3O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_13 : evalU1 (bL 13) = 0   := by
  rw [evalU1_apply, bL_coe]; show D13E u1 = 0
  ext <;> simp [D13E, u1, c0, c1, c2, c3, c4, c5, c6, c7]

/-! ## `range evalU1 = span {e₂,…,e₇}` and its dimension 6. -/

/-- ★★ THE IMAGE OF `evalU1` IS THE 6-DIM COMPLEMENT. `range evalU1 = span {e₂,…,e₇}`: the
    14 basis images span exactly the imaginary units orthogonal to `u1`'s quaternion plane. -/
theorem range_evalU1_eq :
    LinearMap.range evalU1 = Submodule.span ℚ (Set.range imgUnit) := by
  have hU2 : e2O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨0, rfl⟩
  have hU3 : e3O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨1, rfl⟩
  have hU4 : e4O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨2, rfl⟩
  have hU5 : e5O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨3, rfl⟩
  have hU6 : e6O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨4, rfl⟩
  have hU7 : e7O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨5, rfl⟩
  apply le_antisymm
  · -- range evalU1 = map evalU1 (span (range bL)) = span (evalU1 '' range bL) ⊆ span {e₂,…,e₇}
    rw [LinearMap.range_eq_map, ← bL_span_top, Submodule.map_span]
    apply Submodule.span_le.mpr
    rw [Set.image_subset_iff, Set.range_subset_iff]
    intro i
    rw [Set.mem_preimage, SetLike.mem_coe]
    fin_cases i
    · show evalU1 (bL 0) ∈ _; rw [img_0]; exact Submodule.zero_mem _
    · show evalU1 (bL 1) ∈ _; rw [img_1]; exact Submodule.zero_mem _
    · show evalU1 (bL 2) ∈ _; rw [img_2]; exact Submodule.zero_mem _
    · show evalU1 (bL 3) ∈ _; rw [img_3]; exact hU6
    · show evalU1 (bL 4) ∈ _; rw [img_4]; exact Submodule.neg_mem _ hU5
    · show evalU1 (bL 5) ∈ _; rw [img_5]; exact Submodule.neg_mem _ hU4
    · show evalU1 (bL 6) ∈ _; rw [img_6]; exact hU3
    · show evalU1 (bL 7) ∈ _; rw [img_7]; exact hU2
    · show evalU1 (bL 8) ∈ _; rw [img_8]; exact hU7
    · show evalU1 (bL 9) ∈ _; rw [img_9]; exact hU4
    · show evalU1 (bL 10) ∈ _; rw [img_10]; exact Submodule.neg_mem _ hU5
    · show evalU1 (bL 11) ∈ _; rw [img_11]; exact Submodule.neg_mem _ hU2
    · show evalU1 (bL 12) ∈ _; rw [img_12]; exact hU3
    · show evalU1 (bL 13) ∈ _; rw [img_13]; exact Submodule.zero_mem _
  · -- each unit e_k is ± an image, so span {e₂,…,e₇} ⊆ range evalU1
    rw [Submodule.span_le, Set.range_subset_iff]
    intro j
    rw [SetLike.mem_coe]
    fin_cases j
    · show e2O ∈ _; exact LinearMap.mem_range.mpr ⟨bL 7, img_7⟩
    · show e3O ∈ _; exact LinearMap.mem_range.mpr ⟨bL 6, img_6⟩
    · show e4O ∈ _; exact LinearMap.mem_range.mpr ⟨bL 9, img_9⟩
    · show e5O ∈ _
      refine LinearMap.mem_range.mpr ⟨-(bL 4), ?_⟩
      rw [map_neg, img_4, neg_neg]
    · show e6O ∈ _; exact LinearMap.mem_range.mpr ⟨bL 3, img_3⟩
    · show e7O ∈ _; exact LinearMap.mem_range.mpr ⟨bL 8, img_8⟩

/-- ★ `finrank ℚ (range evalU1) = 6`. -/
theorem finrank_range_evalU1 : Module.finrank ℚ (LinearMap.range evalU1) = 6 := by
  rw [range_evalU1_eq, finrank_span_eq_card imgUnit_indep]
  rfl

/-! ## THE DIMENSION: rank–nullity. -/

/-- ★★★ THE TARGET (N42b): `dim stabLieQ = 8 = dim su(3)`. DERIVED by rank–nullity on the
    evaluation-at-`u1` map: `finrank (range evalU1) + finrank (ker evalU1) = finrank derivationLieQ`
    is `6 + dim stabLieQ = 14` (the banked basis `bLbasis` gives `finrank derivationLieQ = 14`;
    `stabLieQ_toSubmodule_eq_ker` identifies `ker evalU1` with the stabilizer), so `dim stabLieQ = 8`.
    NOT a posited `dim su(3) = 8` — the 8 descends from the explicit `14 − 6`. -/
theorem finrank_stabLieQ : Module.finrank ℚ stabLieQ.toSubmodule = 8 := by
  haveI : FiniteDimensional ℚ derivationLieQ := Module.Basis.finiteDimensional_of_finite bLbasis
  have h14 : Module.finrank ℚ derivationLieQ = 14 := by
    rw [Module.finrank_eq_card_basis bLbasis]; rfl
  have hrk := LinearMap.finrank_range_add_finrank_ker evalU1
  rw [finrank_range_evalU1, ← stabLieQ_toSubmodule_eq_ker, h14] at hrk
  omega

end

end Phys.Algebra
