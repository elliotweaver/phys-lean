/-
# N261 — THE GATHER WORLDMAP IS A CLIFFORD MODULE (`O ℚ` is a spinor)

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)`, imaginary part `ImO`: the gather's own
inner-world map — the LEFT-REGULAR action `LeftMul a = worldMap a = (a · ·)` (N44/N218T, the
fold-generated inner world) — assembled as a ℚ-linear map `leftReg : ImO →ₗ End ℚ (O ℚ)`,
satisfies the CLIFFORD anticommutation relation for the fold's Born self-overlap form `gForm`:

    `(leftReg a).comp (leftReg b) + (leftReg b).comp (leftReg a) = (-(2 · gForm a b)) • id`

for all `a b : ImO` (`leftReg_clifford`), with diagonal `(leftReg a)² = (- gForm a a) • id`
(`leftReg_sq`). So the derived 8-dimensional `O ℚ` is a Clifford module (a spinor) for `gForm` on
`ImO` — DERIVED, not posited.

THE DISSOLUTION (STANDARD §0). The gather (N218T `TowerGatherCoherence`) asks whether distinct
fold-generated inner worlds GLUE: `WorldsGlue a b ⟺ L_a∘L_b = L_{a·b}`; N219 identified the
OBSTRUCTION with the banked associator. On `O ℚ` the worlds FAIL to glue (non-associativity). The
field reads that failure as a defect and IMPORTS a separate Clifford/Dirac apparatus to build
spinors. The theory INVERTS + DISSOLVES it: the gluing obstruction lives entirely in the
ANTISYMMETRIC part of worldMap composition, while the SYMMETRIC part is FORCED by the fold metric
alone — `L_a∘L_b + L_b∘L_a = L_{a·b + b·a} = -(2·gForm a b)·id` — which IS the Clifford relation.
The spinor is not imported; it is the gather obstruction read symmetrically.

ONE CAUSE MANY TERMINATIONS: the SAME octonion alternativity that stops the cascade (N2c), blocks
one chirality from a second commuting action (N44 `chirality_block`), and caps the generation tower
here PROMOTES the (failed, non-associative) worldMap representation to a Clifford/spinor
representation. The left-alternative law `alt_left` (`mul_mul_left`, N5b) — all that survives of
associativity — is exactly what forces `x·(x·y) = (x·x)·y = (-gForm x x)·y` on the imaginary part.

THE OBJECTS (all derived, foundations-only):
  ⭐   `key_sq`          — for `x ∈ ImO`, `x·(x·y) = (- gForm x x) • y` (left-alt + imaginary square).
  ⭐⭐  `leftReg`         — the gather worldMap assembled as `ImO →ₗ[ℚ] End ℚ (O ℚ)`, `a ↦ L_a`.
  ⭐⭐  `leftReg_sq`      — the DIAGONAL `(leftReg a)² = (- gForm a a) • id`.
  ⭐⭐⭐ `leftReg_clifford`— THE HEADLINE Clifford anticommutation relation (polarization of `key_sq`).
  ⭐⭐  `leftReg_clifford_diag_witness` — W8: `{L_(imBasis i), L_(imBasis i)} = (-2) • id` (nonzero).
  ⭐⭐  `leftReg_clifford_offdiag_witness` — W8: `i ≠ j ⟹ {L_(imBasis i), L_(imBasis j)} = 0`
        (`gForm`-orthonormal frame — the genuine Clifford relation, not a degenerate ∀-triviality).
  ⭐⭐⭐ `worldMap_clifford_module` — capstone bundling the relation + the two witnesses.

⚠ FREE-FLOATING check (SOUL rail): every headline TYPE mentions the banked tower objects — the
CONCRETE left-regular action of the banked `O ℚ`/`ImO`, the banked `gForm`, the banked `imBasis`
frame — NOT a carrier-agnostic "an algebra with a quadratic form gives a Clifford module".
PHYSICS-WORDS-REMOVABLE (STANDARD §2): delete "spinor / matter / generation / Dirac / worldMap" —
the pure statement "the left-regular representation of the derived non-associative `O ℚ`, restricted
to imaginary elements, satisfies `L_a∘L_b + L_b∘L_a = -(2·gForm a b)·id`, so `O ℚ` is a Clifford
module for `gForm`" stands as pure mathematics with every property proved.

Everything is over ℚ (pure algebra — NO continuum, NO Mathlib ℝ/ℂ/Clifford as content). `LinearMap`/
`Module.End`/`.comp` are MACHINERY on the DERIVED `O ℚ` (STANDARD §3). NO posited Clifford algebra,
NO bridge. Foundations-only: `[propext, Classical.choice, Quot.sound]`.
-/
import Phys.Algebra.ChiralityBlock
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.TowerGatherIsometry

open scoped Classical BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-search budget bump (instance search only, NOT the proof kernel) — the banked
-- N255/N257/N258/N259/N260 precedent for the End-of-O / octonion-tower instance diamonds.
set_option synthInstance.maxHeartbeats 400000

noncomputable section

/-! ## (A) The key left-alternative square identity on the imaginary part. -/

/-- ★ THE KEY STEP: for imaginary `x ∈ ImO`, the doubled left action collapses to the negative
    Born norm — `x · (x · y) = (- gForm x x) • y`. Route: LEFT ALTERNATIVITY `mul_mul_left`
    (`x·(x·y) = (x·x)·y`, the `(x,x,y)` associator vanishing — N5b) then the imaginary square
    `octSq_ImO` (`x·x = (- gForm x x)•1`) then `qsmul_mul_left`/`one_mul`. -/
theorem key_sq {x : O ℚ} (hx : x ∈ ImO) (y : O ℚ) :
    x * (x * y) = (- gForm x x) • y := by
  rw [mul_mul_left, octSq_ImO hx, qsmul_mul_left, one_mul]

/-! ## (B) The gather worldMap assembled as a linear map `ImO →ₗ End ℚ (O ℚ)`. -/

/-- ★★ THE GATHER WORLDMAP as a ℚ-linear map: `a ↦ LeftMul a` (the left-regular action / inner
    world, N44/N218T), restricted to the imaginary part `ImO`. Additive and ℚ-linear via the banked
    distributivity `add_mul_na` and scalar law `qsmul_mul_left`. -/
def leftReg : ImO →ₗ[ℚ] Module.End ℚ (O ℚ) where
  toFun a := LeftMul (a : O ℚ)
  map_add' a b := by
    apply LinearMap.ext; intro y
    simp only [LinearMap.add_apply, LeftMul_apply, Submodule.coe_add, add_mul_na]
  map_smul' c a := by
    apply LinearMap.ext; intro y
    simp only [LinearMap.smul_apply, LeftMul_apply, SetLike.val_smul, qsmul_mul_left,
      RingHom.id_apply]

@[simp] theorem leftReg_apply (a : ImO) (y : O ℚ) : leftReg a y = (a : O ℚ) * y := rfl

/-! ## (C) The Clifford anticommutation relation. -/

/-- ★★ THE DIAGONAL: `(leftReg a).comp (leftReg a) = (- gForm a a) • id` — the square of the
    worldMap action is the negative Born norm (the `a = b` case of the Clifford relation, up to the
    doubling). Directly `key_sq`. -/
theorem leftReg_sq (a : ImO) :
    (leftReg a).comp (leftReg a) = (- gForm (a : O ℚ) (a : O ℚ)) • LinearMap.id := by
  apply LinearMap.ext; intro y
  simp only [LinearMap.comp_apply, leftReg_apply, LinearMap.smul_apply, LinearMap.id_apply,
    smul_eq_mul]
  exact key_sq a.2 y

/-- ★★★ THE HEADLINE — THE CLIFFORD ANTICOMMUTATION RELATION for the fold's Born form:
    `(leftReg a).comp (leftReg b) + (leftReg b).comp (leftReg a) = (-(2 · gForm a b)) • id`
    for all imaginary `a b : ImO`. So `O ℚ` is a Clifford module (spinor) for `gForm` on `ImO`.
    Route: POLARIZATION of `key_sq` — apply `key_sq` at `x = ↑a + ↑b ∈ ImO`, expand the doubled
    action into four terms (`add_mul_na`/`mul_add_na`), subtract `key_sq` at `↑a` and `↑b`, and use
    `gForm (a+b)(a+b) = gForm a a + 2·gForm a b + gForm b b` (bilinearity + `gForm_symm`). NO
    coordinate bash of the non-associative product. -/
theorem leftReg_clifford (a b : ImO) :
    (leftReg a).comp (leftReg b) + (leftReg b).comp (leftReg a)
      = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • LinearMap.id := by
  apply LinearMap.ext; intro y
  have hab : ((a : O ℚ) + b) ∈ ImO := add_mem a.2 b.2
  have hk := key_sq hab y
  have hka := key_sq a.2 y
  have hkb := key_sq b.2 y
  have hexp : ((a : O ℚ) + b) * (((a : O ℚ) + b) * y)
      = (a : O ℚ) * ((a : O ℚ) * y) + (a : O ℚ) * ((b : O ℚ) * y)
        + ((b : O ℚ) * ((a : O ℚ) * y) + (b : O ℚ) * ((b : O ℚ) * y)) := by
    simp only [add_mul_na, mul_add_na]; abel
  rw [hexp, hka, hkb] at hk
  have hg : gForm ((a : O ℚ) + b) ((a : O ℚ) + b)
      = gForm (a : O ℚ) a + 2 * gForm (a : O ℚ) b + gForm (b : O ℚ) b := by
    rw [gForm_add_left, gForm_add_right, gForm_add_right, gForm_symm (b : O ℚ) a]; ring
  simp only [LinearMap.add_apply, LinearMap.comp_apply, leftReg_apply, LinearMap.smul_apply,
    LinearMap.id_apply, smul_eq_mul]
  rw [hg] at hk
  linear_combination (norm := module) hk

/-! ## (D) W8 non-vacuity teeth on the `gForm`-orthonormal frame `imBasis`. -/

/-- ★★ W8 DIAGONAL WITNESS: at a frame vector, `{L_(imBasis i), L_(imBasis i)} = (-2) • id ≠ 0`.
    The frame is `gForm`-orthonormal (`gForm_imBasis i i = 1`, N257), so the relation is a genuine
    nonzero Clifford relation, not a vacuous `∀`-triviality. -/
theorem leftReg_clifford_diag_witness (i : Fin 7) :
    (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩).comp (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩)
        + (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩).comp (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩)
      = (-2 : ℚ) • LinearMap.id := by
  rw [leftReg_clifford ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis i, imBasis_mem_ImO i⟩]
  simp only [gForm_imBasis]
  norm_num

/-- ★★ W8 OFF-DIAGONAL WITNESS: for `i ≠ j`, `{L_(imBasis i), L_(imBasis j)} = 0` — the frame is
    `gForm`-orthonormal (`gForm_imBasis i j = 0` for `i ≠ j`, N257), so the Clifford relation of the
    frame is exactly `{L_i, L_j} = -2 δ_{ij}` — the genuine relation of an orthonormal basis. -/
theorem leftReg_clifford_offdiag_witness {i j : Fin 7} (hij : i ≠ j) :
    (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩).comp (leftReg ⟨imBasis j, imBasis_mem_ImO j⟩)
        + (leftReg ⟨imBasis j, imBasis_mem_ImO j⟩).comp (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩)
      = 0 := by
  rw [leftReg_clifford ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis j, imBasis_mem_ImO j⟩]
  simp only [gForm_imBasis, if_neg hij]
  norm_num

/-! ## (E) The capstone: `O ℚ` is a Clifford module (spinor) for the fold metric. -/

/-- ★★★ THE CAPSTONE — the derived terminal algebra `O ℚ` is a CLIFFORD MODULE (spinor) for the
    fold's Born form `gForm` on `ImO`: the gather worldMap `leftReg` satisfies the Clifford
    anticommutation relation, with a nonzero diagonal witness and the orthonormal off-diagonal
    vanishing. DERIVED from the gather worldMap, forced by octonion alternativity — not posited. -/
theorem worldMap_clifford_module :
    (∀ a b : ImO,
      (leftReg a).comp (leftReg b) + (leftReg b).comp (leftReg a)
        = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • LinearMap.id)
    ∧ (∀ i : Fin 7,
      (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩).comp (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩)
          + (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩).comp (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩)
        = (-2 : ℚ) • LinearMap.id)
    ∧ (∀ i j : Fin 7, i ≠ j →
      (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩).comp (leftReg ⟨imBasis j, imBasis_mem_ImO j⟩)
          + (leftReg ⟨imBasis j, imBasis_mem_ImO j⟩).comp (leftReg ⟨imBasis i, imBasis_mem_ImO i⟩)
        = 0) :=
  ⟨leftReg_clifford, leftReg_clifford_diag_witness,
    fun _ _ hij => leftReg_clifford_offdiag_witness hij⟩

end

end Phys.Algebra
