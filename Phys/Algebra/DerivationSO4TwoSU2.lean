/-
  Phys.Algebra.DerivationSO4TwoSU2 — N191: TWO COMMUTING su(2)'s inside g₂ = Der(O ℚ)
  — the so(4) = su(2)_S × su(2)_T whose DIAGONAL is the embedded weak-isospin su(2) (N187).
  ===========================================================================
  N187 banked the embedded weak-isospin `su(2) = ⟨innerDeriv hI, innerDeriv hJ, innerDeriv hK⟩
  ↪ g₂ = Der(O ℚ)`; N188 the lower-rung intertwiner; N189/N190 the branching of the `7`
  (`7 = 1 ⊕ 3 ⊕ 3`). The embedded su(2) acts COMPONENTWISE on the octonion rung
  `O ℚ = CD (H ℚ) = ⟨H, H⟩` — `innerDeriv P ⟨a,b⟩ = ⟨ad_P a, ad_P b⟩` (N6) — i.e. it is the
  DIAGONAL of two independent quaternion-adjoint actions, one on each coordinate slot. THIS
  node OPENS that diagonal: it derives the FULL `so(4) = su(2) × su(2)` of TWO COMMUTING
  su(2)'s inside `g₂`, of which the embedded isospin su(2) is precisely the diagonal.

  ★ MEASURE-FIRST verdict on the ticket's named fronts (W4.5 / W9). Front (i), the centralizer
  of the embedded su(2) in g₂, MEASURES VACUOUS *as posed* — the diagonal su(2)'s commutant in
  `so(4)` is trivial, and the front named a degenerate object. But the front was groping for the
  RIGHT structure one level out: the embedded su(2) does not sit alone — it is the diagonal of a
  6-dimensional `so(4)` of two MUTUALLY COMMUTING su(2)'s, and THAT commuting pair is the genuine
  new g₂-subalgebra structure the chain opens. Front (ii) (a single g₂ hosting commuting
  `su(3) × su(2)`) MEASURES FALSE (the diagonal su(2) restricts the 14 with no su(3) commutant),
  so it is rejected. The honest, non-vacuous, light NEW content is the so(4).

  ★ THE MECHANISM (W9.4 structure-over-coordinate-expansion; THE ONE LAW reframe). Beyond the
  inner derivations `innerDeriv P = liftEnd (ad_P)` (which act on BOTH slots), the doubling
  `CD (CD B) = ⟨CD B, CD B⟩` carries a SECOND family of Leibniz-derivations that touch only the
  second ("im") slot:

      leftImDeriv Q : ⟨a, b⟩ ↦ ⟨0, Q · b⟩            (imaginary `Q`).

  It is a genuine derivation: in the banked CD product (`(z·w).re = z.re·w.re − star w.im · z.im`,
  `(z·w).im = w.im·z.re + z.im·star w.re`) the re-slot of the Leibniz defect cancels using
  `star Q = −Q` and base associativity, the im-slot by distributivity — NO associator, NO
  octonion-coordinate expansion. Then the two families assemble into the so(4):

      ⁅leftImDeriv Q, leftImDeriv Q'⁆ = leftImDeriv (Q·Q' − Q'·Q)         [su(2)_T closes]
      ⁅innerDeriv P, leftImDeriv Q⁆   = leftImDeriv (P·Q − Q·P)           [cross]
      secondSU2 P := innerDeriv P − leftImDeriv P
      ⁅secondSU2 P, secondSU2 P'⁆     = secondSU2 (P·P' − P'·P)           [su(2)_S closes]
      ★★ ⁅secondSU2 P, leftImDeriv Q⁆ = 0                                 [su(2)_S ⊥ su(2)_T]
      innerDeriv P = secondSU2 P + leftImDeriv P                          [isospin = diagonal]

  So `g₂ = Der(O ℚ)` contains two commuting copies `su(2)_S`, `su(2)_T` (a 6-dim `so(4)`), and the
  N187 weak-isospin su(2) is their diagonal `S ⊕ T`. At the cascade's quaternion units the
  structure constants of each factor are the su(2) ≅ so(3) ones (`⁅·hI, ·hJ⁆ = 2·(·hK)` cyclic).

  THE MOAT — posit-vs-derive (docs/STANDARD §0, the UNBROKEN-STRAND novelty). The
  division-algebra-physics field reads each gauge factor off the octonions BY HAND and never
  exhibits this internal so(4). Here it is DERIVED from the cascade's OWN doubling: the second
  slot of `O ℚ = CD (H ℚ)` carries its own quaternion-adjoint su(2) that commutes with the
  "difference" su(2), and the embedded isospin is the diagonal. ONE cause (the doubling),
  several consequences — the embedding (N187), the lower rung (N188), the branching (N189/N190),
  and now the commuting so(4) (N191). NO posited su(2)/so(4)/g₂/Lie-group as content, NO Mathlib
  ℝ/ℂ as content (ℚ/ℤ are the coefficient systems the `Module.End` statements are WRITTEN IN;
  the OBJECTS are the derived rungs `H ℚ = CD (Dbl ℚ)`, `O ℚ = CD (H ℚ)`).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "isospin / colour / gauge / su(2) / so(4) /
  g₂ / weak / diagonal / commuting-as-physics": what remains is the pure statement that for the
  Cayley–Dickson double `CD (CD B)`, the second-slot maps `⟨a,b⟩ ↦ ⟨0, Q·b⟩` (imaginary `Q`) are
  Leibniz-derivations forming a bracket-closed family that commutes with the family
  `innerDeriv P − leftImDeriv P`, while the inner derivations are their sum. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## THE SECOND-SLOT DERIVATION FAMILY + the so(4) over a general commutative `*`-base. -/
section General
variable {B : Type*} [CommRing B] [StarRing B]

/-- THE SECOND-SLOT MAP `⟨a,b⟩ ↦ ⟨0, Q·b⟩` on the double, as a ℤ-linear endomorphism. The
    complement of the inner derivation: it touches only the second coordinate slot. -/
def leftImDeriv (Q : CD B) : Module.End ℤ (CD (CD B)) :=
  (AddMonoidHom.mk' (fun z => (⟨0, Q * z.im⟩ : CD (CD B)))
    (by intro a b; ext <;> simp [CD.add_re, CD.add_im, mul_add])).toIntLinearMap

@[simp] theorem leftImDeriv_apply (Q : CD B) (z : CD (CD B)) :
    leftImDeriv Q z = (⟨0, Q * z.im⟩ : CD (CD B)) := rfl

/-- `leftImDeriv` is additive in the generator. -/
theorem leftImDeriv_add (Q Q' : CD B) :
    leftImDeriv (Q + Q') = leftImDeriv Q + leftImDeriv Q' := by
  refine LinearMap.ext fun z => ?_
  ext <;> simp [leftImDeriv_apply, add_mul]

/-- `leftImDeriv` respects negation. -/
theorem leftImDeriv_neg (Q : CD B) : leftImDeriv (-Q) = -leftImDeriv Q := by
  refine LinearMap.ext fun z => ?_
  ext <;> simp [leftImDeriv_apply]

/-- `leftImDeriv` carries `2·Q` to `2·leftImDeriv Q` (the structure-constant scaling). -/
theorem leftImDeriv_two_zsmul (Q : CD B) :
    leftImDeriv ((2 : ℤ) • Q) = (2 : ℤ) • leftImDeriv Q := by
  rw [two_zsmul, two_zsmul, leftImDeriv_add]

/-- ★ `leftImDeriv Q` IS A LEIBNIZ-DERIVATION of `CD (CD B)` for imaginary `Q` (`star Q = −Q`).
    The re-slot defect cancels via `star Q = −Q` + base associativity; the im-slot by
    distributivity. No associator, no octonion-coordinate expansion. -/
theorem leftImDeriv_isDeriv (Q : CD B) (hQ : star Q = -Q) : IsDeriv (leftImDeriv Q) := by
  intro x y
  refine CD.ext ?_ ?_
  · show (0 : CD B) = ((leftImDeriv Q x) * y + x * (leftImDeriv Q y)).re
    simp only [mul_re, leftImDeriv_apply, add_re]
    rw [star_mul, hQ]
    noncomm_ring
  · show Q * (x * y).im = ((leftImDeriv Q x) * y + x * (leftImDeriv Q y)).im
    simp only [mul_im, leftImDeriv_apply, add_im]
    rw [star_zero]
    noncomm_ring

/-- ★ su(2)_T CLOSES: `⁅leftImDeriv Q, leftImDeriv Q'⁆ = leftImDeriv (Q·Q' − Q'·Q)`. -/
theorem leftImDeriv_bracket (Q Q' : CD B) :
    ⁅leftImDeriv Q, leftImDeriv Q'⁆ = leftImDeriv (Q * Q' - Q' * Q) := by
  refine LinearMap.ext fun z => ?_
  show (leftImDeriv Q * leftImDeriv Q' - leftImDeriv Q' * leftImDeriv Q) z
      = leftImDeriv (Q * Q' - Q' * Q) z
  rw [LinearMap.sub_apply, Module.End.mul_apply, Module.End.mul_apply]
  simp only [leftImDeriv_apply]
  refine CD.ext ?_ ?_
  · simp [sub_eq_add_neg]
  · rw [sub_eq_add_neg, CD.add_im, CD.neg_im]; noncomm_ring

/-- ★ THE CROSS BRACKET: `⁅innerDeriv P, leftImDeriv Q⁆ = leftImDeriv (P·Q − Q·P)`. -/
theorem innerDeriv_leftImDeriv_bracket (P Q : CD B) :
    ⁅innerDeriv P, leftImDeriv Q⁆ = leftImDeriv (P * Q - Q * P) := by
  refine LinearMap.ext fun z => ?_
  show (innerDeriv P * leftImDeriv Q - leftImDeriv Q * innerDeriv P) z
      = leftImDeriv (P * Q - Q * P) z
  rw [LinearMap.sub_apply, Module.End.mul_apply, Module.End.mul_apply]
  simp only [leftImDeriv_apply, innerDeriv_apply, adHom_apply]
  refine CD.ext ?_ ?_
  · simp [sub_eq_add_neg]
  · rw [sub_eq_add_neg, CD.add_im, CD.neg_im]; noncomm_ring

/-- ★ THE SWAPPED CROSS BRACKET: `⁅leftImDeriv Q, innerDeriv P⁆ = leftImDeriv (Q·P − P·Q)`. -/
theorem leftImDeriv_innerDeriv_bracket (Q P : CD B) :
    ⁅leftImDeriv Q, innerDeriv P⁆ = leftImDeriv (Q * P - P * Q) := by
  refine LinearMap.ext fun z => ?_
  show (leftImDeriv Q * innerDeriv P - innerDeriv P * leftImDeriv Q) z
      = leftImDeriv (Q * P - P * Q) z
  rw [LinearMap.sub_apply, Module.End.mul_apply, Module.End.mul_apply]
  simp only [leftImDeriv_apply, innerDeriv_apply, adHom_apply]
  refine CD.ext ?_ ?_
  · simp [sub_eq_add_neg]
  · rw [sub_eq_add_neg, CD.add_im, CD.neg_im]; noncomm_ring

/-- THE SECOND su(2) GENERATOR `secondSU2 P := innerDeriv P − leftImDeriv P` (the "difference"
    family — the inner-derivation action with the second-slot part subtracted off, leaving the
    first-slot action plus the conjugating cross-term). -/
def secondSU2 (P : CD B) : Module.End ℤ (CD (CD B)) := innerDeriv P - leftImDeriv P

/-- ★ `secondSU2 P` IS A LEIBNIZ-DERIVATION for imaginary `P` (difference of two derivations). -/
theorem secondSU2_isDeriv (P : CD B) (hP : star P = -P) : IsDeriv (secondSU2 P) := by
  unfold secondSU2
  rw [sub_eq_add_neg]
  exact isDeriv_add _ _ (innerDeriv_isDeriv P hP) (isDeriv_neg _ (leftImDeriv_isDeriv P hP))

/-- `secondSU2` is additive in the generator. -/
theorem secondSU2_add (P P' : CD B) : secondSU2 (P + P') = secondSU2 P + secondSU2 P' := by
  unfold secondSU2; rw [innerDeriv_addCD, leftImDeriv_add]; abel

/-- `secondSU2` carries `2·P` to `2·secondSU2 P`. -/
theorem secondSU2_two_zsmul (P : CD B) :
    secondSU2 ((2 : ℤ) • P) = (2 : ℤ) • secondSU2 P := by
  rw [two_zsmul, two_zsmul, secondSU2_add]

/-- ★★ su(2)_S CLOSES: `⁅secondSU2 P, secondSU2 P'⁆ = secondSU2 (P·P' − P'·P)`. The difference
    family is itself a su(2): the cross terms reassemble into the inner-derivation bracket minus
    the second-slot bracket. -/
theorem secondSU2_bracket (P P' : CD B) :
    ⁅secondSU2 P, secondSU2 P'⁆ = secondSU2 (P * P' - P' * P) := by
  unfold secondSU2
  rw [sub_lie, lie_sub, lie_sub, innerDeriv_bracket, innerDeriv_leftImDeriv_bracket,
    leftImDeriv_innerDeriv_bracket, leftImDeriv_bracket,
    show (P : CD B) * P' - P' * P = -(P' * P - P * P') by rw [neg_sub],
    leftImDeriv_neg]
  abel

/-- ★★ THE so(4) — THE TWO su(2)'s COMMUTE: `⁅secondSU2 P, leftImDeriv Q⁆ = 0`. The cross
    bracket of the difference family with the second-slot family cancels exactly:
    `⁅innerDeriv P, leftImDeriv Q⁆ − ⁅leftImDeriv P, leftImDeriv Q⁆ = leftImDeriv (P·Q − Q·P)
    − leftImDeriv (P·Q − Q·P) = 0`. This is the orthogonality `su(2)_S ⊥ su(2)_T` that makes the
    span a `so(4) = su(2) × su(2)`. -/
theorem secondSU2_commutes_leftImDeriv (P Q : CD B) :
    ⁅secondSU2 P, leftImDeriv Q⁆ = 0 := by
  unfold secondSU2
  rw [sub_lie, innerDeriv_leftImDeriv_bracket, leftImDeriv_bracket, sub_self]

/-- ★★ THE EMBEDDED isospin su(2) IS THE DIAGONAL: `innerDeriv P = secondSU2 P + leftImDeriv P`.
    The N187 inner-derivation generator is the sum of the two commuting factors. -/
theorem innerDeriv_eq_diagonal (P : CD B) :
    innerDeriv P = secondSU2 P + leftImDeriv P := by
  unfold secondSU2; abel

end General

/-! ## AT THE CASCADE'S RUNGS `B := Dbl ℚ` (`CD B = H ℚ`, `CD (CD B) = O ℚ`):
    membership in `Der(O ℚ) = g₂`, the su(2) ≅ so(3) structure constants of each factor, and the
    so(4) relations specialized to the quaternion units. -/
section Cascade

/-- ★ `leftImDeriv hI` LANDS in `Der(O ℚ) = g₂` (a genuine Leibniz-derivation of `O ℚ`). -/
theorem leftImDeriv_hI_isDerivO : IsDeriv (leftImDeriv (hI : H ℚ)) :=
  leftImDeriv_isDeriv hI hI_imag
theorem leftImDeriv_hJ_isDerivO : IsDeriv (leftImDeriv (hJ : H ℚ)) :=
  leftImDeriv_isDeriv hJ hJ_imag
theorem leftImDeriv_hK_isDerivO : IsDeriv (leftImDeriv (hK : H ℚ)) :=
  leftImDeriv_isDeriv hK hK_imag

/-- Membership of the second-slot generators in the banked octonion derivation Lie algebra. -/
theorem leftImDeriv_hI_mem : leftImDeriv (hI : H ℚ) ∈ derivation (B := Dbl ℚ) :=
  leftImDeriv_hI_isDerivO
theorem leftImDeriv_hJ_mem : leftImDeriv (hJ : H ℚ) ∈ derivation (B := Dbl ℚ) :=
  leftImDeriv_hJ_isDerivO
theorem leftImDeriv_hK_mem : leftImDeriv (hK : H ℚ) ∈ derivation (B := Dbl ℚ) :=
  leftImDeriv_hK_isDerivO

/-- ★ `secondSU2 hI` LANDS in `Der(O ℚ) = g₂`. -/
theorem secondSU2_hI_isDerivO : IsDeriv (secondSU2 (hI : H ℚ)) :=
  secondSU2_isDeriv hI hI_imag
theorem secondSU2_hJ_isDerivO : IsDeriv (secondSU2 (hJ : H ℚ)) :=
  secondSU2_isDeriv hJ hJ_imag
theorem secondSU2_hK_isDerivO : IsDeriv (secondSU2 (hK : H ℚ)) :=
  secondSU2_isDeriv hK hK_imag

theorem secondSU2_hI_mem : secondSU2 (hI : H ℚ) ∈ derivation (B := Dbl ℚ) :=
  secondSU2_hI_isDerivO
theorem secondSU2_hJ_mem : secondSU2 (hJ : H ℚ) ∈ derivation (B := Dbl ℚ) :=
  secondSU2_hJ_isDerivO
theorem secondSU2_hK_mem : secondSU2 (hK : H ℚ) ∈ derivation (B := Dbl ℚ) :=
  secondSU2_hK_isDerivO

/-- ★★ su(2)_T STRUCTURE CONSTANT: `⁅leftImDeriv hI, leftImDeriv hJ⁆ = 2·leftImDeriv hK`. -/
theorem leftImDeriv_struct_ij :
    ⁅leftImDeriv (hI : H ℚ), leftImDeriv hJ⁆ = (2 : ℤ) • leftImDeriv hK := by
  rw [leftImDeriv_bracket,
    show (hI : H ℚ) * hJ - hJ * hI = (2 : ℤ) • hK by rw [hI_hJ, hJ_hI, sub_neg_eq_add, two_zsmul]]
  exact leftImDeriv_two_zsmul hK

theorem leftImDeriv_struct_jk :
    ⁅leftImDeriv (hJ : H ℚ), leftImDeriv hK⁆ = (2 : ℤ) • leftImDeriv hI := by
  rw [leftImDeriv_bracket,
    show (hJ : H ℚ) * hK - hK * hJ = (2 : ℤ) • hI by rw [hJ_hK, hK_hJ, sub_neg_eq_add, two_zsmul]]
  exact leftImDeriv_two_zsmul hI

theorem leftImDeriv_struct_ki :
    ⁅leftImDeriv (hK : H ℚ), leftImDeriv hI⁆ = (2 : ℤ) • leftImDeriv hJ := by
  rw [leftImDeriv_bracket,
    show (hK : H ℚ) * hI - hI * hK = (2 : ℤ) • hJ by rw [hK_hI, hI_hK, sub_neg_eq_add, two_zsmul]]
  exact leftImDeriv_two_zsmul hJ

/-- ★★ su(2)_S STRUCTURE CONSTANT: `⁅secondSU2 hI, secondSU2 hJ⁆ = 2·secondSU2 hK`. -/
theorem secondSU2_struct_ij :
    ⁅secondSU2 (hI : H ℚ), secondSU2 hJ⁆ = (2 : ℤ) • secondSU2 hK := by
  rw [secondSU2_bracket,
    show (hI : H ℚ) * hJ - hJ * hI = (2 : ℤ) • hK by rw [hI_hJ, hJ_hI, sub_neg_eq_add, two_zsmul]]
  exact secondSU2_two_zsmul hK

theorem secondSU2_struct_jk :
    ⁅secondSU2 (hJ : H ℚ), secondSU2 hK⁆ = (2 : ℤ) • secondSU2 hI := by
  rw [secondSU2_bracket,
    show (hJ : H ℚ) * hK - hK * hJ = (2 : ℤ) • hI by rw [hJ_hK, hK_hJ, sub_neg_eq_add, two_zsmul]]
  exact secondSU2_two_zsmul hI

theorem secondSU2_struct_ki :
    ⁅secondSU2 (hK : H ℚ), secondSU2 hI⁆ = (2 : ℤ) • secondSU2 hJ := by
  rw [secondSU2_bracket,
    show (hK : H ℚ) * hI - hI * hK = (2 : ℤ) • hJ by rw [hK_hI, hI_hK, sub_neg_eq_add, two_zsmul]]
  exact secondSU2_two_zsmul hJ

/-! ## W8 — non-vacuity: BOTH factors genuinely nonzero, and the diagonal does NOT commute. -/

/-- ★ W8: `leftImDeriv hK ≠ 0` — the su(2)_T factor is genuinely nonzero. Reading the second
    slot at `⟨0,1⟩` recovers `hK·1 = hK ≠ 0`, whose deep coordinate is `1`. -/
theorem leftImDeriv_hK_ne_zero : leftImDeriv (hK : H ℚ) ≠ 0 := by
  intro h
  have hc : (leftImDeriv (hK : H ℚ) (⟨0, 1⟩ : O ℚ)).im.im.im = (1 : ℚ) := by
    rw [leftImDeriv_apply]; simp [hK_def, Dbl.J]
  rw [h] at hc; simp at hc

/-- ★ W8: `secondSU2 hK ≠ 0` — the su(2)_S factor is genuinely nonzero. At `⟨0,1⟩` the inner part
    gives `hK·1 − 1·hK = 0`, so `secondSU2 hK ⟨0,1⟩ = ⟨0, −hK⟩`, whose deep coordinate is `−1`. -/
theorem secondSU2_hK_ne_zero : secondSU2 (hK : H ℚ) ≠ 0 := by
  intro h
  have hc : (secondSU2 (hK : H ℚ) (⟨0, 1⟩ : O ℚ)).im.im.im = (-1 : ℚ) := by
    show ((innerDeriv hK - leftImDeriv hK) (⟨0, 1⟩ : O ℚ)).im.im.im = (-1 : ℚ)
    rw [LinearMap.sub_apply]
    simp only [innerDeriv_apply, adHom_apply, leftImDeriv_apply, mul_zero, zero_mul,
      mul_one, one_mul, sub_self]
    rw [sub_eq_add_neg, CD.add_im, CD.neg_im]
    simp [hK_def, Dbl.J]
  rw [h] at hc; simp at hc

/-- ★★ W8 — THE COMMUTING IS A GENUINE SELECTION: the embedded isospin diagonal does NOT commute
    with su(2)_T: `⁅innerDeriv hI, leftImDeriv hJ⁆ ≠ 0`. So `secondSU2 ⊥ su(2)_T` is real
    structure (the so(4) factorization), not a degeneracy where everything commutes. -/
theorem diagonal_not_commute_leftImDeriv :
    ⁅innerDeriv (hI : H ℚ), leftImDeriv hJ⁆ ≠ 0 := by
  rw [innerDeriv_leftImDeriv_bracket]
  intro h
  have hc : (leftImDeriv ((hI : H ℚ) * hJ - hJ * hI) (⟨0, 1⟩ : O ℚ)).im.im.im = (2 : ℚ) := by
    rw [leftImDeriv_apply]
    simp [hI_hJ, hJ_hI, hK_def, Dbl.J]; norm_num
  rw [h] at hc; simp at hc

/-- THE COSTUME WITNESS COORDINATE: the su(2)_T structure-constant coordinate recovered from
    `⁅leftImDeriv hI, leftImDeriv hJ⁆ ⟨0,1⟩ = leftImDeriv (hI·hJ − hJ·hI) ⟨0,1⟩ = ⟨0, 2·hK⟩` is
    `(...).im.im.im = 2`. -/
theorem leftImDeriv_struct_ij_coord :
    (⁅leftImDeriv (hI : H ℚ), leftImDeriv hJ⁆ (⟨0, 1⟩ : O ℚ)).im.im.im = 2 := by
  rw [leftImDeriv_bracket, leftImDeriv_apply]
  simp [hI_hJ, hJ_hI, hK_def, Dbl.J]; norm_num

end Cascade

end

end Phys.Algebra
