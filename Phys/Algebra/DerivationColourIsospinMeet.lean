/-
  N202 — THE MEET OF THE TWO NON-ABELIAN DERIVATION SUBALGEBRAS OF `O ℚ = CD (H ℚ)`:
  the embedded weak-isospin `su(2) = ⟨innerDeriv hI, innerDeriv hJ, innerDeriv hK⟩` (N187) and the
  colour `su(3) = colourCentralizer = stabLieQ = {D ∈ g₂ : D u1 = 0}` (N201/N42a) intersect inside
  `g₂ = Der(O ℚ)` in EXACTLY the 1-dimensional isospin Cartan line `ℚ ∙ (innerDeriv hI)`.

  THE JOINT (physics reading, removable). The Standard-Model gauge algebra has two non-abelian
  factors — colour `su(3)` and weak-isospin `su(2)`. The division-algebra programme realizes BOTH
  inside the single octonion derivation algebra `g₂`: colour as the centralizer of the complex
  structure `J = L_{u1}` (N201), isospin as the image of `Der(H ℚ) = su(2)` under the
  Cayley–Dickson doubling `H ℚ ↪ O ℚ` (N187). This node measures HOW the two sit relative to one
  another: they are neither transverse (the meet is nonzero) nor nested (the meet is neither
  factor) — they share PRECISELY a one-dimensional `u(1)`, the isospin Cartan. The shared line is
  the isospin Cartan generator `innerDeriv hI`, the SAME element `hI` whose octonion embedding
  `u1 = ιO hI` (N197) generates the colour complex structure.

  WHY GENUINELY NEW (not a re-pin, not mechanical, not vacuous).
  • N197 banked only PER-GENERATOR facts: `innerDeriv hI u1 = 0` (commutes with `J`),
    `innerDeriv hJ u1 ≠ 0` (off-Cartan rotates `J`). It NEVER realized `su(2)` as a ℚ-subobject of
    `derivationLieQ`, NEVER handled a general combination `a·DI + b·DJ + c·DK`, NEVER computed
    `innerDeriv hK u1`, and NEVER computed the dimension of the colour-commuting part of `su(2)`.
  • N201 banked the colour side alone (`colourCentralizer = stabLieQ`, dim 8) — never its MEET with
    isospin.
  • NEW here: (a) the ℚ-linear realization `innerDerivQ` of the (a-priori ℤ-linear) inner
    derivations as genuine elements of `derivationLieQ = g₂` (N187 carried only their ℤ-bracket
    constants); (b) `innerDeriv hK u1 = ιO(2•hJ)`; (c) the general-combination colour-membership
    characterization `b = c = 0`; (d) the submodule identity
    `isospinSpan ⊓ colourCentralizer.toSubmodule = ℚ ∙ DI` and its dimension `1`.

  THE MECHANISM (THE ONE LAW reframe — the banked derivation-vs-left-multiplication law, NOT a
  coordinate bash). The colour-membership of a derivation `D ∈ g₂` is `D u1 = 0` (`commutes_JO_iff`,
  N201). On the isospin generators: `DI u1 = 0` (N197 `innerDeriv_hI_u1`),
  `DJ u1 = ιO(−2•hK)` (N197 `innerDeriv_hJ_u1`), and `DK u1 = ιO(2•hJ)` (here, via
  `innerDeriv_u1` + the quaternion table `hK·hI = hJ`, `hI·hK = −hJ`). A combination kills `u1`
  iff `ιO(−2b•hK + 2c•hJ) = 0`, i.e. (by `iotaO` injectivity and the independence of `hJ`, `hK`)
  iff `b = c = 0` — leaving exactly `ℚ ∙ DI`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "colour / isospin / su(3) / su(2) / u(1) /
  g₂ / Cartan / gauge / complex structure / SU(3) / SU(2) / U(1)": what remains is the pure
  statement that, over the derived field ℚ and the Cayley–Dickson double `O ℚ = CD (H ℚ)`, the
  ℚ-span of the three inner derivations `innerDeriv hI/hJ/hK` meets the centralizer of left-
  multiplication by `u1` in exactly the one-dimensional ℚ-span of `innerDeriv hI`. No theorem
  STATEMENT needs a physics word.

  DERIVED from the trunk (the banked `JO`/`u1`/`iotaO`/`iotaO_injective`/`innerDeriv_iotaO` N42c/N197;
  `innerDeriv`/`innerDeriv_isDeriv`/`adHom`/`adHom_apply` N6; the quaternion units `hI`/`hJ`/`hK` and
  table `hK_hI`/`hI_hK` N184; `hI_imag`/`hJ_imag`/`hK_imag`/`innerDeriv_hI_ne_zero` N187;
  `innerDeriv_hI_u1`/`innerDeriv_hJ_u1`/`JO_isospin_not_commute`/`innerDeriv_u1` N197;
  `colourCentralizer`/`mem_colourCentralizer`/`commutes_JO_iff`/`isDerivQ_of_mem` N201;
  `derivationLieQ`/`IsDerivQ` N16–N21; `AddMonoidHom.toRatLinearMap`/`Submodule.span`/`finrank_span_singleton`/
  `LieSubalgebra.toSubmodule` standard Mathlib MACHINERY on the DERIVED objects, STANDARD §3),
  NOT a posited su(2)/su(3)/u(1)/Lie-group/Cartan/complex-structure as content, NOT Mathlib ℝ/ℂ as
  content (ℚ is the coefficient field the `Module.End`/`Submodule`/`finrank` statements are WRITTEN
  IN — the N6/N42/N197/N201 precedent; the OBJECTS are the derived rung `O ℚ`, the derivation Lie
  algebra `derivationLieQ`, the colour centralizer, the isospin inner derivations), NOT a bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no native-kernel-bypass, no bridge.
-/
import Phys.Algebra.DerivationColourIsospinCommutator
import Phys.Algebra.DerivationColourCentralizer
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Module.LinearMap.Rat
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## The ℚ-linear realization of the inner derivations as elements of `g₂`. -/

/-- ★ THE ℚ-LINEAR INNER DERIVATION. The inner derivation `innerDeriv q` is built as a ℤ-linear
    map; since `O ℚ` is a ℚ-vector space, that additive map is automatically ℚ-linear. This makes
    `innerDeriv q` a genuine element of `Module.End ℚ (O ℚ)` (the ambient space of `g₂`), so the
    embedded isospin can be measured against the colour centralizer over the field ℚ. -/
noncomputable def innerDerivQ (q : H ℚ) : Module.End ℚ (O ℚ) :=
  ((innerDeriv q).toAddMonoidHom).toRatLinearMap

@[simp] theorem innerDerivQ_apply (q : H ℚ) (z : O ℚ) : innerDerivQ q z = innerDeriv q z := rfl

/-- The ℚ-linear inner derivation satisfies the Leibniz law (transferred from N6's ℤ-Leibniz
    `innerDeriv_isDeriv`), so it lands in `derivationLieQ = g₂` when `q` is imaginary. -/
theorem innerDerivQ_isDerivQ (q : H ℚ) (hq : star q = -q) : IsDerivQ (innerDerivQ q) := by
  intro x y
  show (innerDeriv q) (x * y) = (innerDeriv q) x * y + x * (innerDeriv q) y
  exact innerDeriv_isDeriv q hq x y

/-- The isospin Cartan generator `innerDeriv hI` as an element of `g₂`. -/
noncomputable def DI : derivationLieQ := ⟨innerDerivQ hI, innerDerivQ_isDerivQ hI hI_imag⟩
/-- The off-Cartan isospin generator `innerDeriv hJ` as an element of `g₂`. -/
noncomputable def DJ : derivationLieQ := ⟨innerDerivQ hJ, innerDerivQ_isDerivQ hJ hJ_imag⟩
/-- The off-Cartan isospin generator `innerDeriv hK` as an element of `g₂`. -/
noncomputable def DK : derivationLieQ := ⟨innerDerivQ hK, innerDerivQ_isDerivQ hK hK_imag⟩

/-! ## The values of the isospin generators on the colour complex unit `u1`. -/

/-- `DI u1 = 0`: the Cartan generator commutes with the colour complex structure (N197). -/
theorem DI_u1 : (DI : Module.End ℚ (O ℚ)) u1 = 0 := innerDeriv_hI_u1
/-- `DJ u1 = ιO(−2•hK) ≠ 0`: the off-Cartan generator rotates the colour complex structure (N197). -/
theorem DJ_u1 : (DJ : Module.End ℚ (O ℚ)) u1 = iotaO (-(2:ℚ) • hK) := innerDeriv_hJ_u1
/-- ★ `DK u1 = ιO(2•hJ)`: the third isospin generator's value on `u1`, via `innerDeriv_u1` and the
    quaternion table `hK·hI = hJ`, `hI·hK = −hJ`. -/
theorem DK_u1 : (DK : Module.End ℚ (O ℚ)) u1 = iotaO ((2:ℚ) • hJ) := by
  show (innerDeriv hK) u1 = iotaO ((2 : ℚ) • hJ)
  rw [innerDeriv_u1, adHom_apply, hK_hI, hI_hK]
  congr 1
  show hJ - -hJ = (2 : ℚ) • hJ
  module

/-- ★ THE VALUE OF A GENERAL ISOSPIN COMBINATION ON `u1`:
    `(a•DI + b•DJ + c•DK) u1 = ιO(−2b•hK + 2c•hJ)`. The Cartan part `a•DI` drops out; the
    obstruction to colour-commuting is the off-Cartan part. -/
theorem comb_u1 (a b c : ℚ) :
    ((a • DI + b • DJ + c • DK : derivationLieQ) : Module.End ℚ (O ℚ)) u1
      = iotaO ((-(2:ℚ)*b) • hK + ((2:ℚ)*c) • hJ) := by
  have hcoe : ((a • DI + b • DJ + c • DK : derivationLieQ) : Module.End ℚ (O ℚ))
      = a • (DI : Module.End ℚ (O ℚ)) + b • (DJ : Module.End ℚ (O ℚ))
        + c • (DK : Module.End ℚ (O ℚ)) := rfl
  rw [hcoe]
  simp only [LinearMap.add_apply, LinearMap.smul_apply, DI_u1, DJ_u1, DK_u1]
  rw [smul_zero, zero_add, ← map_smul, ← map_smul, ← map_add]
  congr 1
  rw [smul_smul, smul_smul]
  module

/-! ## The off-Cartan generators are linearly independent in `H ℚ`. -/

/-- The quaternion units `hK = ⟨0,⟨0,1⟩⟩` and `hJ = ⟨0,⟨1,0⟩⟩` are ℚ-linearly independent:
    `x•hK + y•hJ = 0 ⟹ x = 0 ∧ y = 0`. -/
theorem hJK_indep (x y : ℚ) (h : x • hK + y • hJ = 0) : x = 0 ∧ y = 0 := by
  constructor
  · have := congrArg (fun w : H ℚ => w.im.im) h
    simpa [hK, hJ, hI, CD.iota, CD.e2, Dbl.J, Dbl.smul_re, Dbl.smul_im, cd_qsmul_re, cd_qsmul_im,
      CD.add_re, CD.add_im] using this
  · have := congrArg (fun w : H ℚ => w.im.re) h
    simpa [hK, hJ, hI, CD.iota, CD.e2, Dbl.J, Dbl.smul_re, Dbl.smul_im, cd_qsmul_re, cd_qsmul_im,
      CD.add_re, CD.add_im] using this

/-- ★★ THE COLOUR-MEMBERSHIP OF A GENERAL ISOSPIN COMBINATION. An element
    `a•DI + b•DJ + c•DK` of the isospin span commutes with the colour complex structure
    (`(…) u1 = 0`) IF AND ONLY IF `b = c = 0` — i.e. it lies on the Cartan line `ℚ ∙ DI`. -/
theorem comb_mem_colour_iff (a b c : ℚ) :
    ((a • DI + b • DJ + c • DK : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0 ↔ b = 0 ∧ c = 0 := by
  rw [comb_u1]
  constructor
  · intro h
    have h0 : ((-(2:ℚ)*b) • hK + ((2:ℚ)*c) • hJ) = 0 :=
      iotaO_injective (a₁ := (-(2:ℚ)*b) • hK + ((2:ℚ)*c) • hJ) (a₂ := 0)
        (by rw [h]; ext <;> simp [iotaO])
    obtain ⟨h1, h2⟩ := hJK_indep _ _ h0
    exact ⟨by linarith, by linarith⟩
  · rintro ⟨rfl, rfl⟩
    simp only [mul_zero, zero_smul, add_zero]
    ext <;> simp [iotaO]

/-! ## The isospin span and its meet with the colour centralizer. -/

/-- ★ THE EMBEDDED ISOSPIN `su(2)` AS A ℚ-SUBMODULE of `g₂`: the ℚ-span of the three inner
    derivations `innerDeriv hI/hJ/hK`. (N187 banked only their ℤ-bracket constants; here they are
    realized as a ℚ-subobject of `derivationLieQ`.) -/
noncomputable def isospinSpan : Submodule ℚ derivationLieQ := Submodule.span ℚ {DI, DJ, DK}

/-- ★★ THE HEADLINE: the embedded isospin `su(2)` and the colour centralizer `su(3)` meet inside
    `g₂` in EXACTLY the one-dimensional Cartan line `ℚ ∙ DI`:
    `isospinSpan ⊓ colourCentralizer.toSubmodule = ℚ ∙ (innerDeriv hI)`. -/
theorem meet_eq_span_DI :
    isospinSpan ⊓ (colourCentralizer.toSubmodule) = Submodule.span ℚ {DI} := by
  apply le_antisymm
  · rintro x ⟨hxspan, hxcol⟩
    rw [SetLike.mem_coe, isospinSpan, Submodule.mem_span_triple] at hxspan
    obtain ⟨a, b, c, rfl⟩ := hxspan
    have hcol : ((a • DI + b • DJ + c • DK : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0 := by
      have hmem : (a • DI + b • DJ + c • DK : derivationLieQ) ∈ colourCentralizer :=
        (LieSubalgebra.mem_toSubmodule _).mp hxcol
      exact (commutes_JO_iff (isDerivQ_of_mem _)).mp (mem_colourCentralizer.mp hmem)
    obtain ⟨rfl, rfl⟩ := (comb_mem_colour_iff a b c).mp hcol
    simp only [zero_smul, add_zero]
    exact Submodule.mem_span_singleton.mpr ⟨a, rfl⟩
  · rw [Submodule.span_singleton_le_iff_mem]
    refine ⟨?_, ?_⟩
    · exact Submodule.subset_span (by simp)
    · rw [SetLike.mem_coe, LieSubalgebra.mem_toSubmodule, mem_colourCentralizer]
      exact (commutes_JO_iff (isDerivQ_of_mem DI)).mpr DI_u1

/-! ## Non-vacuity. -/

/-- ★ W8 NON-VACUITY (lower): the Cartan generator is a NONZERO element of `g₂` (it is the lift of
    the banked `innerDeriv hI ≠ 0`), so the meet is not the trivial subspace. -/
theorem DI_ne_zero : DI ≠ 0 := by
  intro h
  apply innerDeriv_hI_ne_zero
  have hq : innerDerivQ hI = 0 := by
    have := congrArg (Subtype.val) h
    simpa [DI] using this
  refine LinearMap.ext fun z => ?_
  have hz : innerDerivQ hI z = (0 : Module.End ℚ (O ℚ)) z := by rw [hq]
  simpa [innerDerivQ] using hz

/-- ★★ W8 NON-VACUITY (upper): the off-Cartan generator `DJ` does NOT lie in the colour
    centralizer (`JO_isospin_not_commute`, N197), so the meet is a PROPER subspace of isospin — the
    two factors are genuinely NOT nested. Together with `DI_ne_zero`: `0 ⊊ meet ⊊ isospin`. -/
theorem DJ_not_mem_colour : DJ ∉ colourCentralizer := by
  rw [mem_colourCentralizer]
  intro h
  have : (DJ : Module.End ℚ (O ℚ)) u1 = 0 := (commutes_JO_iff (isDerivQ_of_mem DJ)).mp h
  exact JO_isospin_not_commute this

/-- ★★ THE DIMENSION OF THE MEET IS EXACTLY 1: the colour `su(3)` and the weak-isospin `su(2)`
    share precisely a `u(1)` inside `g₂`. -/
theorem finrank_meet_eq_one :
    Module.finrank ℚ (isospinSpan ⊓ (colourCentralizer.toSubmodule)
      : Submodule ℚ derivationLieQ) = 1 := by
  rw [meet_eq_span_DI, finrank_span_singleton DI_ne_zero]

end Phys.Algebra
