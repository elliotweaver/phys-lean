/-
  N204 — THE CANONICAL INVARIANT-FORM NORMALIZATION OF THE WEAK-ISOSPIN `su(2)` INSIDE
  `g₂ = Der(O ℚ)`. The defining trace form takes the GRAM MATRIX `−16 • I₃` on the embedded
  weak-isospin triple `DI, DJ, DK` — an orthogonal, equinormalized, compact frame.

  THE JOINT (physics reading, removable). N23/N24 (`DerivationCompact`) banked the Killing-type
  defining trace form `B = LieModule.traceForm ℚ derivationLieQ (O ℚ)` of the derivation Lie
  algebra and proved it negative-definite and nondegenerate ON THE WHOLE ALGEBRA — but evaluated
  it only on an abstract witness (`B w w < 0`), never on a named gauge generator, never producing
  an explicit value. N187/N202/N203 worked the BRACKET / SUBMODULE / NORMALIZER layer (the Lie
  skeleton). THIS node is the METRIC layer: the invariant bilinear form evaluated ON the gauge
  generators. The result is the Gram matrix
      `B(DI,DI) = B(DJ,DJ) = B(DK,DK) = −16`,   `B(DI,DJ) = B(DJ,DK) = B(DK,DI) = 0`,
  i.e. `B ↾ ⟨DI,DJ,DK⟩` is `−16 • I₃`. Physically: the three weak-isospin generators form a
  CANONICALLY-NORMALIZED ORTHOGONAL COMPACT frame inside `g₂` — the convention-free relative
  normalization the Standard Model POSITS by hand (a choice of length/orthogonality for the gauge
  generators) is here FORCED by the UNIQUE invariant form of the simple ambient algebra.

  WHY GENUINELY NEW (not a re-pin of N201/N202/N203, not gold-plating N24).
  • The NON-MECHANICAL DATUM is the explicit value `B(DI,DI) = −16`. The structure constants ALONE
    do NOT fix it — they are invariant under rescaling each generator, so any positive multiple of
    the brackets is the "same" abstract `su(2)`. The value `−16` is the EMBEDDING / NORMALIZATION
    INDEX: it records metrically WHICH `su(2)` the weak isospin is inside `g₂`. N24's negative-
    definiteness gives only the SIGN; this gives the magnitude on a named generator.
  • Equinormalization and orthogonality then propagate from that ONE value THROUGH THE TRUNK — the
    invariance identity `B ⁅x,y⁆ z = B x ⁅y,z⁆` (Mathlib `traceForm_apply_lie_apply`) combined with
    the banked structure constants `⁅DI,DJ⁆ = 2•DK` (cyclic). This is a genuine CONNECTION between
    N24 (the metric) and N187/N203 (the brackets), NOT a coordinate juxtaposition: only the single
    diagonal value is computed; the remaining five Gram entries are derived structurally.
  • NON-VACUOUS WITH TEETH: `B(DI,DI) = −16 ≠ 0` and `B(DI,DI) < 0` — the frame is genuinely a
    NONZERO, COMPACT (negative-definite) one, not a null/degenerate restriction.

  THE ROUTE (THE ONE LAW reframe — invariance, not six coordinate bashes).
  1. Lift the two missing cyclic brackets into `g₂` (`bracket_DJ_DK_eq`, `bracket_DK_DI_eq` — the
     N203 `bracket_DI_DJ_eq` shape, off the banked ℤ-level `struct_jk` / `struct_ki`).
  2. ONE coordinate computation: `traceForm_DI_DI : B DI DI = −16` via the banked
     `traceForm_apply_neg` (`B(D,D) = −Σ_j gForm (D bO_j)(D bO_j)`) + `gForm_self_sum_sq` + the
     explicit basis vectors + `norm_num`.
  3. Equinorm: `2•B(DK,DK) = B(⁅DI,DJ⁆,DK) = B(DI,⁅DJ,DK⁆) = B(DI,2•DI) = 2•B(DI,DI)` (and cyclic).
  4. Orthogonality: e.g. `−2•B(DI,DJ) = B(⁅DI,DK⁆,DI) = B(DI,⁅DK,DI⁆) = 2•B(DI,DJ)` via symmetry,
     forcing `B(DI,DJ) = 0` (and cyclic).
  5. Assemble the Gram matrix `isospinGram = −16 • (1 : Matrix (Fin 3) (Fin 3) ℚ)`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "colour / isospin / su(2) / g₂ / gauge /
  Cartan / normalization / compact / Killing / Standard Model": what remains is — over the derived
  field ℚ and the Cayley–Dickson double `O ℚ = CD (H ℚ)`, the defining trace form of the inner-
  derivation Lie algebra takes value `−16` on each of the three inner derivations
  `innerDeriv hI / hJ / hK` and `0` on each distinct pair, so its Gram matrix on that triple is
  `−16 • I₃`. No theorem STATEMENT needs a physics word.

  DERIVED from the trunk (the banked trace form `traceForm_apply_neg` / `gForm` / `gForm_self_sum_sq`
  / `bO` / `coordO` N23/N24 `DerivationCompact`; the structure constants `struct_jk` / `struct_ki`
  N187 `DerivationHIntoO`; the ℚ-realization `innerDerivQ` / `DI` / `DJ` / `DK` N202; the N203
  `bracket_DI_DJ_eq`; `derivationLieQ` / `IsDerivQ` N16–N21; the quaternion units `hI` / `hJ` / `hK`
  N184; `LieModule.traceForm_apply_lie_apply` / `traceForm_comm` / `lie_skew` / `Subtype.ext` /
  `LinearMap.ext` standard Mathlib MACHINERY on the DERIVED objects, STANDARD §3), NOT a posited
  su(2) / su(3) / Lie-group / Killing-form / normalization convention as content, NOT Mathlib ℝ/ℂ
  as content (ℚ is the coefficient field the `traceForm` / `Matrix` / `finrank` statements are
  WRITTEN IN — the N6/N24/N187/N202/N203 precedent; the OBJECTS are the derived rung `O ℚ`, the
  derivation Lie algebra `derivationLieQ`, the trace form, the isospin inner derivations), NOT a
  bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no native-kernel-bypass, no bridge.
-/
import Phys.Algebra.DerivationColourIsospinNonNormalize
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- The defining trace form of the derivation Lie algebra (banked negative-definite & nondegenerate,
    N24). Abbreviation local to this file. -/
noncomputable abbrev isospinTraceForm := LieModule.traceForm ℚ derivationLieQ (O ℚ)

local notation "B" => isospinTraceForm

/-! ## The explicit orthonormal coordinate vectors (`coordO`-preimages of `Pi.single`). -/

private lemma bO0_eq : (bO 0 : O ℚ) = ⟨⟨⟨1,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 0 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma bO1_eq : (bO 1 : O ℚ) = ⟨⟨⟨0,1⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 1 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma bO2_eq : (bO 2 : O ℚ) = ⟨⟨⟨0,0⟩,⟨1,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 2 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma bO3_eq : (bO 3 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,1⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 3 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma bO4_eq : (bO 4 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨1,0⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 4 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma bO5_eq : (bO 5 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,1⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 5 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma bO6_eq : (bO 6 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨1,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 6 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma bO7_eq : (bO 7 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,1⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 7 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]

/-! ## The two missing cyclic structure constants, lifted into `g₂ = derivationLieQ`. -/

/-- `⁅DJ, DK⁆ = 2 • DI` in `g₂` (the N187 ℤ-level `struct_jk` transported through the N202
    `innerDerivQ` ℚ-realization — the N203 `bracket_DI_DJ_eq` shape, cyclic `jk`). -/
theorem bracket_DJ_DK_eq : (⁅DJ, DK⁆ : derivationLieQ) = (2:ℚ) • DI := by
  apply Subtype.ext
  show ((⁅DJ, DK⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (((2:ℚ) • DI : derivationLieQ) : Module.End ℚ (O ℚ))
  have hbr : ((⁅DJ, DK⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (DJ : Module.End ℚ (O ℚ)) * (DK : Module.End ℚ (O ℚ))
        - (DK : Module.End ℚ (O ℚ)) * (DJ : Module.End ℚ (O ℚ)) := rfl
  have hrhs : (((2:ℚ) • DI : derivationLieQ) : Module.End ℚ (O ℚ)) = (2:ℚ) • (innerDerivQ hI) := rfl
  rw [hbr, hrhs]
  refine LinearMap.ext fun z => ?_
  simp only [LinearMap.sub_apply, Module.End.mul_apply, LinearMap.smul_apply]
  show (innerDeriv (hJ:H ℚ)) ((innerDeriv hK) z) - (innerDeriv hK) ((innerDeriv hJ) z)
      = (2:ℚ) • (innerDeriv hI) z
  have hz : (innerDeriv (hJ:H ℚ)) ((innerDeriv hK) z) - (innerDeriv hK) ((innerDeriv hJ) z)
      = (2:ℤ) • (innerDeriv hI) z := by
    have h := congrArg (fun (f : Module.End ℤ (O ℚ)) => f z) struct_jk
    simpa [Ring.lie_def, sub_eq_iff_eq_add] using h
  rw [hz, show ((2:ℤ) • (innerDeriv hI) z) = (innerDeriv hI) z + (innerDeriv hI) z by rw [two_zsmul],
      show ((2:ℚ) • (innerDeriv hI) z) = (innerDeriv hI) z + (innerDeriv hI) z by rw [two_smul]]

/-- `⁅DK, DI⁆ = 2 • DJ` in `g₂` (the N187 ℤ-level `struct_ki` transported through `innerDerivQ`). -/
theorem bracket_DK_DI_eq : (⁅DK, DI⁆ : derivationLieQ) = (2:ℚ) • DJ := by
  apply Subtype.ext
  show ((⁅DK, DI⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (((2:ℚ) • DJ : derivationLieQ) : Module.End ℚ (O ℚ))
  have hbr : ((⁅DK, DI⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (DK : Module.End ℚ (O ℚ)) * (DI : Module.End ℚ (O ℚ))
        - (DI : Module.End ℚ (O ℚ)) * (DK : Module.End ℚ (O ℚ)) := rfl
  have hrhs : (((2:ℚ) • DJ : derivationLieQ) : Module.End ℚ (O ℚ)) = (2:ℚ) • (innerDerivQ hJ) := rfl
  rw [hbr, hrhs]
  refine LinearMap.ext fun z => ?_
  simp only [LinearMap.sub_apply, Module.End.mul_apply, LinearMap.smul_apply]
  show (innerDeriv (hK:H ℚ)) ((innerDeriv hI) z) - (innerDeriv hI) ((innerDeriv hK) z)
      = (2:ℚ) • (innerDeriv hJ) z
  have hz : (innerDeriv (hK:H ℚ)) ((innerDeriv hI) z) - (innerDeriv hI) ((innerDeriv hK) z)
      = (2:ℤ) • (innerDeriv hJ) z := by
    have h := congrArg (fun (f : Module.End ℤ (O ℚ)) => f z) struct_ki
    simpa [Ring.lie_def, sub_eq_iff_eq_add] using h
  rw [hz, show ((2:ℤ) • (innerDeriv hJ) z) = (innerDeriv hJ) z + (innerDeriv hJ) z by rw [two_zsmul],
      show ((2:ℚ) • (innerDeriv hJ) z) = (innerDeriv hJ) z + (innerDeriv hJ) z by rw [two_smul]]

/-! ## THE NON-MECHANICAL DATUM: the explicit invariant length of the shared Cartan generator. -/

set_option maxHeartbeats 2000000 in
/-- ★★★ THE INVARIANT LENGTH: `B(DI,DI) = −16`. The single coordinate computation of the node:
    the banked formula `traceForm_apply_neg` reduces `B(D,D)` to `−Σ_j gForm (D bO_j)(D bO_j)`,
    each summand a `gForm`-square computed via `gForm_self_sum_sq` on the explicit basis vectors;
    `ad_{hI}` rotates the four planes `(e₂,e₃)`, `(e₆,e₇)` by `±2`, giving four contributions of
    `4`, sum `16`, negated. This magnitude — invisible to the scale-covariant structure constants —
    is the metric embedding index of the weak-isospin generator inside `g₂`. -/
theorem traceForm_DI_DI : B DI DI = -16 := by
  show LieModule.traceForm ℚ derivationLieQ (O ℚ) DI DI = -16
  rw [show DI = ⟨innerDerivQ hI, innerDerivQ_isDerivQ hI hI_imag⟩ from rfl,
      traceForm_apply_neg (innerDerivQ hI) (innerDerivQ_isDerivQ hI hI_imag)]
  rw [Fin.sum_univ_eight, bO0_eq, bO1_eq, bO2_eq, bO3_eq, bO4_eq, bO5_eq, bO6_eq, bO7_eq]
  simp only [innerDerivQ_apply, gForm, reQ, innerDeriv_apply, adHom_apply, hI, CD.iota, Dbl.J,
    sub_eq_add_neg,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
    Dbl.star_re', Dbl.star_im']
  norm_num

/-! ## EQUINORMALIZATION (the other two diagonal lengths, by invariance). -/

/-- `B(DK,DK) = −16`. From the single value `traceForm_DI_DI` and invariance
    `B ⁅DI,DJ⁆ DK = B DI ⁅DJ,DK⁆` with the banked brackets `⁅DI,DJ⁆ = 2•DK`, `⁅DJ,DK⁆ = 2•DI`. -/
theorem traceForm_DK_DK : B DK DK = -16 := by
  have key : B (⁅DI, DJ⁆ : derivationLieQ) DK = B DI (⁅DJ, DK⁆ : derivationLieQ) :=
    LieModule.traceForm_apply_lie_apply ℚ derivationLieQ (O ℚ) DI DJ DK
  rw [bracket_DI_DJ_eq, bracket_DJ_DK_eq, LinearMap.map_smul₂, LinearMap.map_smul,
      traceForm_DI_DI] at key
  exact smul_right_injective ℚ (by norm_num : (2:ℚ) ≠ 0) key

/-- `B(DJ,DJ) = −16`. From `traceForm_DK_DK` and invariance `B ⁅DK,DI⁆ DJ = B DK ⁅DI,DJ⁆` with
    `⁅DK,DI⁆ = 2•DJ`, `⁅DI,DJ⁆ = 2•DK`. -/
theorem traceForm_DJ_DJ : B DJ DJ = -16 := by
  have key : B (⁅DK, DI⁆ : derivationLieQ) DJ = B DK (⁅DI, DJ⁆ : derivationLieQ) :=
    LieModule.traceForm_apply_lie_apply ℚ derivationLieQ (O ℚ) DK DI DJ
  rw [bracket_DK_DI_eq, bracket_DI_DJ_eq, LinearMap.map_smul₂, LinearMap.map_smul,
      traceForm_DK_DK] at key
  exact smul_right_injective ℚ (by norm_num : (2:ℚ) ≠ 0) key

/-! ## ORTHOGONALITY (the off-diagonal entries vanish, by invariance + symmetry). -/

/-- `B(DI,DJ) = 0`. Invariance `B ⁅DI,DK⁆ DI = B DI ⁅DK,DI⁆` with `⁅DI,DK⁆ = −2•DJ`,
    `⁅DK,DI⁆ = 2•DJ`, and symmetry of `B`, forces `−2•B(DI,DJ) = 2•B(DI,DJ)`. -/
theorem traceForm_DI_DJ : B DI DJ = 0 := by
  have key : B (⁅DI, DK⁆ : derivationLieQ) DI = B DI (⁅DK, DI⁆ : derivationLieQ) :=
    LieModule.traceForm_apply_lie_apply ℚ derivationLieQ (O ℚ) DI DK DI
  have hIK : (⁅DI, DK⁆ : derivationLieQ) = -(2:ℚ) • DJ := by
    rw [← neg_neg (⁅DI, DK⁆ : derivationLieQ), lie_skew, bracket_DK_DI_eq, neg_smul]
  rw [hIK, bracket_DK_DI_eq, LinearMap.map_smul₂, LinearMap.map_smul,
      LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DJ DI] at key
  have : (-2:ℚ) • B DI DJ = (2:ℚ) • B DI DJ := key
  simp only [smul_eq_mul] at this; linarith [this]

/-- `B(DJ,DK) = 0`. Invariance `B ⁅DJ,DI⁆ DJ = B DJ ⁅DI,DJ⁆` with `⁅DJ,DI⁆ = −2•DK`,
    `⁅DI,DJ⁆ = 2•DK`, and symmetry. -/
theorem traceForm_DJ_DK : B DJ DK = 0 := by
  have key : B (⁅DJ, DI⁆ : derivationLieQ) DJ = B DJ (⁅DI, DJ⁆ : derivationLieQ) :=
    LieModule.traceForm_apply_lie_apply ℚ derivationLieQ (O ℚ) DJ DI DJ
  have hJI : (⁅DJ, DI⁆ : derivationLieQ) = -(2:ℚ) • DK := by
    rw [← neg_neg (⁅DJ, DI⁆ : derivationLieQ), lie_skew, bracket_DI_DJ_eq, neg_smul]
  rw [hJI, bracket_DI_DJ_eq, LinearMap.map_smul₂, LinearMap.map_smul,
      LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DK DJ] at key
  have : (-2:ℚ) • B DJ DK = (2:ℚ) • B DJ DK := key
  simp only [smul_eq_mul] at this; linarith [this]

/-- `B(DK,DI) = 0`. Invariance `B ⁅DK,DJ⁆ DK = B DK ⁅DJ,DK⁆` with `⁅DK,DJ⁆ = −2•DI`,
    `⁅DJ,DK⁆ = 2•DI`, and symmetry. -/
theorem traceForm_DK_DI : B DK DI = 0 := by
  have key : B (⁅DK, DJ⁆ : derivationLieQ) DK = B DK (⁅DJ, DK⁆ : derivationLieQ) :=
    LieModule.traceForm_apply_lie_apply ℚ derivationLieQ (O ℚ) DK DJ DK
  have hKJ : (⁅DK, DJ⁆ : derivationLieQ) = -(2:ℚ) • DI := by
    rw [← neg_neg (⁅DK, DJ⁆ : derivationLieQ), lie_skew, bracket_DJ_DK_eq, neg_smul]
  rw [hKJ, bracket_DJ_DK_eq, LinearMap.map_smul₂, LinearMap.map_smul,
      LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DI DK] at key
  have : (-2:ℚ) • B DK DI = (2:ℚ) • B DK DI := key
  simp only [smul_eq_mul] at this; linarith [this]

/-! ## THE HEADLINE: the Gram matrix of the weak-isospin triple is `−16 • I₃`. -/

/-- The Gram matrix of the invariant trace form on the ordered triple `(DI, DJ, DK)`. -/
noncomputable def isospinGram : Matrix (Fin 3) (Fin 3) ℚ :=
  !![B DI DI, B DI DJ, B DI DK;
     B DJ DI, B DJ DJ, B DJ DK;
     B DK DI, B DK DJ, B DK DK]

/-- ★★★ THE HEADLINE: the Gram matrix of the defining trace form on the three weak-isospin
    generators is `−16 • I₃` — an orthogonal, equinormalized, compact (negative-definite) frame.
    The convention-free relative normalization of the gauge generators, FORCED by the unique
    invariant form of the simple ambient `g₂`, not posited. -/
theorem isospinGram_eq : isospinGram = (-16 : ℚ) • (1 : Matrix (Fin 3) (Fin 3) ℚ) := by
  have hIJ : B DI DJ = 0 := traceForm_DI_DJ
  have hJK : B DJ DK = 0 := traceForm_DJ_DK
  have hKI : B DK DI = 0 := traceForm_DK_DI
  have hJI : B DJ DI = 0 := by
    rw [LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DJ DI]; exact hIJ
  have hKJ : B DK DJ = 0 := by
    rw [LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DK DJ]; exact hJK
  have hIK : B DI DK = 0 := by
    rw [LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DI DK]; exact hKI
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp only [isospinGram, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.of_apply,
      Matrix.smul_apply, Matrix.one_apply, smul_eq_mul]
  · rw [traceForm_DI_DI]; norm_num
  · rw [hIJ]; norm_num
  · rw [hIK]; norm_num
  · rw [hJI]; norm_num
  · rw [traceForm_DJ_DJ]; norm_num
  · rw [hJK]; norm_num
  · rw [hKI]; norm_num
  · rw [hKJ]; norm_num
  · rw [traceForm_DK_DK]; norm_num

/-! ## W8 NON-VACUITY WITH TEETH: the frame is genuinely nonzero and compact. -/

/-- ★ W8: the invariant length is NONZERO (`B(DI,DI) ≠ 0`) — the trace form does not restrict
    trivially to the isospin generator. -/
theorem traceForm_DI_DI_ne_zero : B DI DI ≠ 0 := by rw [traceForm_DI_DI]; norm_num

/-- ★ W8: the invariant length is STRICTLY NEGATIVE (`B(DI,DI) < 0`) — the frame is COMPACT
    (negative-definite), not null/indefinite. The magnitude `−16`, not merely a sign. -/
theorem traceForm_DI_DI_neg : B DI DI < 0 := by rw [traceForm_DI_DI]; norm_num

end Phys.Algebra
