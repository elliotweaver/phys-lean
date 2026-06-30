import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

noncomputable section

section General
variable {B : Type*} [CommRing B] [StarRing B]

/-- The left-im map `⟨a,b⟩ ↦ ⟨0, Q·b⟩` on the double, as a ℤ-linear endomorphism. -/
def leftImDeriv (Q : CD B) : Module.End ℤ (CD (CD B)) :=
  (AddMonoidHom.mk' (fun z => (⟨0, Q * z.im⟩ : CD (CD B)))
    (by intro a b; ext <;> simp [CD.add_re, CD.add_im, mul_add])).toIntLinearMap

@[simp] theorem leftImDeriv_apply (Q : CD B) (z : CD (CD B)) :
    leftImDeriv Q z = (⟨0, Q * z.im⟩ : CD (CD B)) := rfl

theorem leftImDeriv_add (Q Q' : CD B) : leftImDeriv (Q + Q') = leftImDeriv Q + leftImDeriv Q' := by
  refine LinearMap.ext fun z => ?_
  ext <;> simp [leftImDeriv_apply, add_mul]

theorem leftImDeriv_neg (Q : CD B) : leftImDeriv (-Q) = -leftImDeriv Q := by
  refine LinearMap.ext fun z => ?_
  ext <;> simp [leftImDeriv_apply]

theorem leftImDeriv_two_zsmul (Q : CD B) :
    leftImDeriv ((2 : ℤ) • Q) = (2 : ℤ) • leftImDeriv Q := by
  rw [two_zsmul, two_zsmul, leftImDeriv_add]

/-- ★ leftImDeriv Q is a Leibniz-derivation of CD (CD B) for imaginary Q. -/
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

/-- ★ T-factor bracket: ⁅leftImDeriv Q, leftImDeriv Q'⁆ = leftImDeriv (Q·Q' − Q'·Q). -/
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

/-- ★ cross bracket: ⁅innerDeriv P, leftImDeriv Q⁆ = leftImDeriv (P·Q − Q·P). -/
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

/-- ★ swapped cross bracket: ⁅leftImDeriv Q, innerDeriv P⁆ = leftImDeriv (Q·P − P·Q). -/
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

/-- The S-factor derivation `secondSU2 P := innerDeriv P − leftImDeriv P`. -/
def secondSU2 (P : CD B) : Module.End ℤ (CD (CD B)) := innerDeriv P - leftImDeriv P

theorem secondSU2_isDeriv (P : CD B) (hP : star P = -P) : IsDeriv (secondSU2 P) := by
  unfold secondSU2
  rw [sub_eq_add_neg]
  exact isDeriv_add _ _ (innerDeriv_isDeriv P hP) (isDeriv_neg _ (leftImDeriv_isDeriv P hP))

theorem secondSU2_add (P P' : CD B) : secondSU2 (P + P') = secondSU2 P + secondSU2 P' := by
  unfold secondSU2; rw [innerDeriv_addCD, leftImDeriv_add]; abel

theorem secondSU2_two_zsmul (P : CD B) :
    secondSU2 ((2 : ℤ) • P) = (2 : ℤ) • secondSU2 P := by
  rw [two_zsmul, two_zsmul, secondSU2_add]

/-- ★★ S-factor bracket: ⁅secondSU2 P, secondSU2 P'⁆ = secondSU2 (P·P' − P'·P). -/
theorem secondSU2_bracket (P P' : CD B) :
    ⁅secondSU2 P, secondSU2 P'⁆ = secondSU2 (P * P' - P' * P) := by
  unfold secondSU2
  rw [sub_lie, lie_sub, lie_sub, innerDeriv_bracket, innerDeriv_leftImDeriv_bracket,
    leftImDeriv_innerDeriv_bracket, leftImDeriv_bracket,
    show (P : CD B) * P' - P' * P = -(P' * P - P * P') by rw [neg_sub],
    leftImDeriv_neg]
  abel

/-- ★★ COMMUTING — the so(4): ⁅secondSU2 P, leftImDeriv Q⁆ = 0. -/
theorem secondSU2_commutes_leftImDeriv (P Q : CD B) :
    ⁅secondSU2 P, leftImDeriv Q⁆ = 0 := by
  unfold secondSU2
  rw [sub_lie, innerDeriv_leftImDeriv_bracket, leftImDeriv_bracket, sub_self]

/-- The embedded inner derivation is the DIAGONAL: innerDeriv P = secondSU2 P + leftImDeriv P. -/
theorem innerDeriv_eq_diagonal (P : CD B) :
    innerDeriv P = secondSU2 P + leftImDeriv P := by
  unfold secondSU2; abel

end General

-- AXIOM AUDIT
#print axioms leftImDeriv_isDeriv
#print axioms leftImDeriv_bracket
#print axioms innerDeriv_leftImDeriv_bracket
#print axioms leftImDeriv_innerDeriv_bracket
#print axioms secondSU2_isDeriv
#print axioms secondSU2_bracket
#print axioms secondSU2_commutes_leftImDeriv
#print axioms innerDeriv_eq_diagonal

end

end Phys.Algebra
