/-
# N32 — THE AUTOMORPHISM GROUP of the terminal algebra, increment 2:
  the continuum-free COMPACTNESS SKELETON (the orthogonal-group / boundedness core)

The N31 group `AutO` (the ℚ-linear ring automorphisms of the terminal Cayley–Dickson algebra
`O ℚ`) PRESERVES the Born self-overlap form `gForm` (`aut_gForm`, N31). Here we extract the
ALGEBRAIC heart of "the definite Born form makes the automorphism group COMPACT" — entirely over
the derived `ℚ`, with NO continuum, NO analytic exp:

THE TRUNK CONNECTION (THE ONE LAW, ONE CAUSE). The SAME Born positivity (`gForm`, a sum of
coordinate squares, `gForm_self_sum_sq`, N24) that
  • made every derivation SKEW-ADJOINT (`gFormQ_skew`/`derivationLieQ_le_skewAdjoint`, N26) and
  • forced the negative-definite trace form ⟹ the Lie algebra SEMISIMPLE (N24),
is what an automorphism PRESERVES — so in the `gForm`-orthonormal coordinate frame `bO` (N24),
every automorphism is an ISOMETRY: its coordinate columns are an orthonormal system, hence each
matrix entry is bounded by `1`. BOUNDEDNESS of the automorphism group is the algebraic skeleton of
its COMPACTNESS, and it descends from Born definiteness exactly as the skew-adjointness did — ONE
cause, the trunk's positivity, no new hypothesis.

WHAT IS BANKED HERE (forward, foundations-only, continuum-free):
  • `gForm_polar`        — ★ the Born form IS the standard inner product in the orthonormal frame:
                            `gForm v w = ∑ i, coordO v i * coordO w i`.
  • `gForm_orthonormal`  — the coordinate frame is `gForm`-orthonormal: `gForm (bO i) (bO j) = δ`.
  • `coordO_bO`          — `coordO (bO i) = Pi.single i 1` (the frame is the coordinate basis).
  • `aut_col_unit`       — ★ each coordinate column of an automorphism is a UNIT vector:
                            `∑ i, (coordO (φ (bO j)) i)^2 = 1`.
  • `aut_col_orthogonal` — ★ the columns are mutually ORTHONORMAL:
                            `∑ i, coordO (φ (bO j)) i * coordO (φ (bO k)) i = δ` (the algebraic
                            orthogonal-group relation).
  • `aut_entry_sq_le_one`/`aut_entry_abs_le_one` — ★★ THE BOUNDEDNESS: every coordinate entry of an
                            automorphism satisfies `(coordO (φ (bO j)) i)^2 ≤ 1`, hence `|·| ≤ 1`
                            — the algebraic skeleton of COMPACTNESS, from the definite Born form.
  • member-level corollaries on `AutO` and a non-vacuity check (the identity saturates the bound).

CHILDED onto the chain tail (NEVER asserted here, NEVER a bridge): N33 — the analytic exp
`Der(𝕆) → Aut(𝕆)` realizing the Lie-algebra ↔ Lie-group correspondence + the TOPOLOGICAL
compactness (Heine–Borel) over the DERIVED continuum `ContinuumQ.Cut`. The W9 measurement (see
workbench/N32-aut-exp/PREREG.md) showed the derived ℝ carries no topology/norm/Archimedean
structure out of the box and Mathlib's `exp` wants a normed/topological field — so the analytic exp
is a genuine BUILD of an analytic sub-tower over the derived ℝ, correctly scoped to its own node.

Physics-words-removable (STANDARD §2): delete "compact / orthogonal-group / gauge / G₂ / colour" →
the file is a complete proof that the structure-preserving ℚ-linear bijections of the Cayley–Dickson
double-of-a-double-of-a-double of `ℚ` have coordinate columns of unit Born-length, mutually
orthogonal, with every coordinate entry bounded by `1`. NO physics name is load-bearing.

Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationAutGroup
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The Born form is the inner product in the orthonormal coordinate frame. -/

/-- `gForm` is additive in the right argument. -/
theorem gForm_add_right (v w₁ w₂ : O ℚ) :
    gForm v (w₁ + w₂) = gForm v w₁ + gForm v w₂ := by
  unfold gForm; rw [star_add, mul_add, reQ_add]

/-- `gForm` is ℚ-homogeneous in the right argument. -/
theorem gForm_smul_right (v w : O ℚ) (c : ℚ) :
    gForm v (c • w) = c * gForm v w := by
  unfold gForm
  rw [show star (c • w) = c • star w by rw [star_smul]; rfl, qsmul_mul_right, reQ_smul]

/-- `gForm` is additive in the left argument (by symmetry). -/
theorem gForm_add_left (v₁ v₂ w : O ℚ) :
    gForm (v₁ + v₂) w = gForm v₁ w + gForm v₂ w := by
  rw [gForm_symm, gForm_add_right, gForm_symm v₁ w, gForm_symm v₂ w]

/-- `gForm` is ℚ-homogeneous in the left argument (by symmetry). -/
theorem gForm_smul_left (v w : O ℚ) (c : ℚ) :
    gForm (c • v) w = c * gForm v w := by
  rw [gForm_symm, gForm_smul_right, gForm_symm w v]

/-- ★ THE BORN FORM IS THE STANDARD INNER PRODUCT IN THE ORTHONORMAL FRAME:
    `gForm v w = ∑ i, (coordO v i) * (coordO w i)`. The polarization of the banked
    `gForm_self_sum_sq` (N24) — in the coordinate frame `bO`, the trunk's self-overlap form is the
    Euclidean dot product. PROVED by the same coordinate expansion that banked `gForm_self_sum_sq`. -/
theorem gForm_polar (v w : O ℚ) :
    gForm v w = ∑ i : Fin 8, (coordO v i) * (coordO w i) := by
  have hraw : gForm v w = c0 v * c0 w + c1 v * c1 w + c2 v * c2 w + c3 v * c3 w
      + c4 v * c4 w + c5 v * c5 w + c6 v * c6 w + c7 v * c7 w := by
    obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := v
    obtain ⟨⟨⟨a', b'⟩, ⟨c', d'⟩⟩, ⟨⟨e', f'⟩, ⟨g', h'⟩⟩⟩ := w
    simp only [gForm, reQ, c0, c1, c2, c3, c4, c5, c6, c7, sub_eq_add_neg,
      CD.mul_re, CD.star_re, CD.star_im, CD.add_re, CD.neg_re, CD.neg_im,
      Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
      Dbl.neg_re, Dbl.neg_im]
    ring
  rw [hraw, Fin.sum_univ_eight]
  simp only [coordO, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk, Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.cons_val]

/-- `coordO (bO i) = Pi.single i 1`: the coordinate frame `bO` IS the coordinate basis (the
    `j`-th coordinate of the `i`-th basis vector is `δᵢⱼ`). -/
theorem coordO_bO (i : Fin 8) : coordO (bO i) = (Pi.single i 1 : Fin 8 → ℚ) := by
  simp only [bO, Module.Basis.coe_ofEquivFun]
  rw [LinearEquiv.apply_symm_apply]

/-- ★ THE COORDINATE FRAME IS `gForm`-ORTHONORMAL: `gForm (bO i) (bO j) = if i = j then 1 else 0`.
    The orthonormality of the frame the Born form is computed in (N24's positivity, polarized). -/
theorem gForm_orthonormal (i j : Fin 8) :
    gForm (bO i) (bO j) = if i = j then 1 else 0 := by
  rw [← coord_eq_gForm, coordO_bO, Pi.single_apply]
  by_cases h : i = j <;> simp [h, eq_comm]

/-! ## An automorphism is an isometry: its coordinate columns are orthonormal. -/

/-- ★ EACH COORDINATE COLUMN OF AN AUTOMORPHISM IS A UNIT VECTOR:
    `∑ i, (coordO (φ (bO j)) i)^2 = 1`. From form-preservation (`aut_gForm`, N31) + the
    polarization (`gForm_polar`) + orthonormality (`gForm_orthonormal`): the automorphism maps the
    unit basis vector `bO j` to a vector of unit Born-length. The isometry property, in coordinates. -/
theorem aut_col_unit {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (j : Fin 8) :
    ∑ i : Fin 8, (coordO (φ (bO j)) i)^2 = 1 := by
  have hpres : gForm (φ (bO j)) (φ (bO j)) = gForm (bO j) (bO j) := aut_gForm h _ _
  rw [gForm_polar] at hpres
  rw [gForm_orthonormal, if_pos rfl] at hpres
  rw [← hpres]
  apply Finset.sum_congr rfl
  intro i _; rw [sq]

/-- ★ THE COORDINATE COLUMNS ARE MUTUALLY ORTHONORMAL:
    `∑ i, coordO (φ (bO j)) i * coordO (φ (bO k)) i = if j = k then 1 else 0`. The algebraic
    orthogonal-group relation `MᵀM = I` for the automorphism's coordinate matrix `M` — from
    form-preservation + the polarization + orthonormality of the frame. -/
theorem aut_col_orthogonal {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (j k : Fin 8) :
    ∑ i : Fin 8, (coordO (φ (bO j)) i) * (coordO (φ (bO k)) i) = if j = k then 1 else 0 := by
  have hpres : gForm (φ (bO j)) (φ (bO k)) = gForm (bO j) (bO k) := aut_gForm h _ _
  rw [gForm_polar, gForm_orthonormal] at hpres
  exact hpres

/-! ## THE BOUNDEDNESS — the algebraic skeleton of compactness. -/

/-- ★★ EVERY COORDINATE ENTRY OF AN AUTOMORPHISM IS BOUNDED: `(coordO (φ (bO j)) i)^2 ≤ 1`. A
    single squared entry cannot exceed the unit column-sum it is a (nonnegative) summand of
    (`aut_col_unit`). THE BOUNDEDNESS OF THE AUTOMORPHISM GROUP — the algebraic skeleton of its
    COMPACTNESS, descending from the definite Born form exactly as the skew-adjointness did. -/
theorem aut_entry_sq_le_one {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (i j : Fin 8) :
    (coordO (φ (bO j)) i)^2 ≤ 1 := by
  have hsum := aut_col_unit h j
  have hmem : i ∈ (Finset.univ : Finset (Fin 8)) := Finset.mem_univ i
  have hle : (coordO (φ (bO j)) i)^2
      ≤ ∑ i' : Fin 8, (coordO (φ (bO j)) i')^2 :=
    Finset.single_le_sum (f := fun i' => (coordO (φ (bO j)) i')^2)
      (fun i' _ => sq_nonneg _) hmem
  rw [hsum] at hle
  exact hle

/-- ★★ EVERY COORDINATE ENTRY OF AN AUTOMORPHISM HAS ABSOLUTE VALUE AT MOST `1`:
    `|coordO (φ (bO j)) i| ≤ 1`. The `abs` form of the boundedness — the automorphism group sits
    inside the unit box of the coordinate frame (the compactness skeleton). -/
theorem aut_entry_abs_le_one {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (i j : Fin 8) :
    |coordO (φ (bO j)) i| ≤ 1 := by
  have h2 := aut_entry_sq_le_one h i j
  nlinarith [abs_nonneg (coordO (φ (bO j)) i), sq_abs (coordO (φ (bO j)) i),
    abs_nonneg (coordO (φ (bO j)) i)]

/-! ## Member-level corollaries on the group `AutO`. -/

theorem AutO_col_unit (φ : AutO) (j : Fin 8) :
    ∑ i : Fin 8, (coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i)^2 = 1 :=
  aut_col_unit φ.2 j

theorem AutO_col_orthogonal (φ : AutO) (j k : Fin 8) :
    ∑ i : Fin 8, (coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i) * (coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO k)) i)
      = if j = k then 1 else 0 :=
  aut_col_orthogonal φ.2 j k

theorem AutO_entry_abs_le_one (φ : AutO) (i j : Fin 8) :
    |coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i| ≤ 1 :=
  aut_entry_abs_le_one φ.2 i j

/-! ## NON-VACUITY (W8) — the bound is genuine (the identity saturates it). -/

/-- NON-VACUITY: the identity automorphism's columns are `Pi.single`, so its diagonal entries are
    `1` — the boundedness `|entry| ≤ 1` is SATURATED, not vacuous (a wrong strict bound `< 1` would
    fail). The unit column-sum is exactly `1`, witnessed. -/
theorem one_col_unit (j : Fin 8) :
    ∑ i : Fin 8, (coordO ((1 : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i)^2 = 1 :=
  aut_col_unit isAlgAut_one j

/-- NON-VACUITY: the identity automorphism's diagonal coordinate entry is exactly `1`, saturating
    the boundedness `|entry| ≤ 1`. -/
theorem one_entry_diag (j : Fin 8) :
    coordO ((1 : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) j = 1 := by
  show coordO (bO j) j = 1
  rw [coordO_bO, Pi.single_apply, if_pos rfl]

end

end Phys.Algebra
