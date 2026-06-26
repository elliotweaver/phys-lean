/- N44 MEASUREMENT PROBE — bounded, throwaway. Measures the core obligations of the
   CHIRALITY BLOCK before committing to production (W9 measure-first). KILL = 60s/oblig. -/
import Phys.Algebra.DerivationStabilizerSplit
import Phys.Algebra.Alternative
import Phys.Algebra.JordanTower
import Phys.Cascade.Octonion

namespace N44Probe

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- LEFT regular representation: `x ↦ a · x`. -/
def LeftMul (a : O ℚ) : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := a * x
  map_add' x y := CD.mul_add_na a x y
  map_smul' c x := by
    show a * (c • x) = c • (a * x)
    exact qsmul_mul_right c a x

/-- RIGHT regular representation: `x ↦ x · b`. -/
def RightMul (b : O ℚ) : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := x * b
  map_add' x y := add_mul_na x y b
  map_smul' c x := by
    show (c • x) * b = c • (x * b)
    exact qsmul_mul_left c x b

@[simp] theorem LeftMul_apply (a x : O ℚ) : LeftMul a x = a * x := rfl
@[simp] theorem RightMul_apply (b x : O ℚ) : RightMul b x = x * b := rfl

/-- THE ONE-CAUSE BICONDITIONAL: L and R commute for all a,b ⟺ the algebra associates. -/
theorem chirality_commute_iff_assoc :
    (∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
      ↔ (∀ x y z : O ℚ, (x * y) * z = x * (y * z)) := by
  constructor
  · intro h x y z
    have := congrArg (fun f => f y) (h x z)
    simpa [LinearMap.comp_apply, LeftMul_apply, RightMul_apply] using this.symm
  · intro h a b
    refine LinearMap.ext (fun x => ?_)
    simp only [LinearMap.comp_apply, LeftMul_apply, RightMul_apply]
    exact (h a x b).symm

/-- THE HEADLINE BLOCK: L and R do NOT all commute, because `O ℚ` is non-associative. -/
theorem chirality_block :
    ¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a) := by
  intro h
  exact not_associative (chirality_commute_iff_assoc.mp h)

/-- ★ THE ONE-CAUSE LINK (candidate genuine novelty, a PROVED theorem): the failure of the
    left/right (chirality) commutation is EQUIVALENT to the generation-cap failure of the
    order-4 Hermitian-Jordan tower — both literally the SAME octonionic non-associativity.
    The chirality block holds IFF the Jordan-tower order-4 defect is nonzero. -/
theorem chirality_block_iff_jordan_cap :
    (¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
      ↔ (jdef Xwit Ywit ≠ 0) :=
  chirality_commute_iff_assoc.not.trans jordan_cap_iff_nonassoc.symm

/-- ★ THE CONCRETE WITNESS (sharpest non-vacuity, W8): the SAME specific non-associating
    triple that stops the cascade (`not_associative_witness`, base pair `(ιJ, e₂)`) gives an
    EXPLICIT pair `a = ι(ιJ), b = e₂` whose left- and right-multiplication operators do NOT
    commute — they disagree already at `x = ι(e₂)`. The block is not merely a `∀`-failure; it
    is realized by the cascade's own witness triple. -/
theorem chirality_block_witness :
    (LeftMul (CD.iota (ιJ ℚ))).comp (RightMul (CD.e2 : O ℚ))
      ≠ (RightMul (CD.e2 : O ℚ)).comp (LeftMul (CD.iota (ιJ ℚ))) := by
  intro h
  have hx := congrArg (fun f => f (CD.iota (CD.e2 : H ℚ))) h
  simp only [LinearMap.comp_apply, LeftMul_apply, RightMul_apply] at hx
  exact not_associative_witness hx.symm

end

#print axioms chirality_commute_iff_assoc
#print axioms chirality_block
#print axioms chirality_block_iff_jordan_cap
#print axioms chirality_block_witness

end N44Probe
