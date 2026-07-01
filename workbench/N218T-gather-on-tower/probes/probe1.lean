import Phys.Cascade.Sedenion
import Phys.Algebra.Alternative

/-! PROBE — N218T gather staircase. De-risk: does every rung behavior close foundations-only,
    citing banked theorems, with only the S self-glue failure as new computation? -/

namespace Phys.GatherProbe

open Phys.Cascade
open Phys.Cascade.CD

/-- The world a standpoint `a` opens: the whole algebra reorganized through `a`
    (the left regular action). Physics-word-removable: this is `leftAct`. -/
def worldMap {A : Type*} [Mul A] (a : A) : A → A := fun x => a * x

/-- Two worlds GLUE when the composite of their reorganizations is the reorganization of
    the composite standpoint (the world-assignment is a homomorphism into (End A, ∘)). -/
def WorldsGlue {A : Type*} [Mul A] (a b : A) : Prop :=
  worldMap a ∘ worldMap b = worldMap (a * b)

/-! ### Dbl ℚ — worlds glue AND glue symmetrically -/
theorem dbl_glue (a b : Dbl ℚ) : WorldsGlue a b := by
  funext x; simp only [WorldsGlue, worldMap, Function.comp_apply]; exact (mul_assoc a b x).symm

theorem dbl_symm (a b : Dbl ℚ) : worldMap a ∘ worldMap b = worldMap b ∘ worldMap a := by
  funext x; simp only [worldMap, Function.comp_apply]
  rw [← mul_assoc, mul_comm a b, mul_assoc]

/-! ### H ℚ — worlds glue but NOT symmetrically -/
theorem h_glue (a b : H ℚ) : WorldsGlue a b := by
  funext x; simp only [WorldsGlue, worldMap, Function.comp_apply]; exact (mul_assoc a b x).symm

theorem h_not_symm :
    ∃ a b : H ℚ, worldMap a ∘ worldMap b ≠ worldMap b ∘ worldMap a := by
  refine ⟨ιJ ℚ, CD.e2, ?_⟩
  intro h
  have := congrFun h 1
  simp only [worldMap, Function.comp_apply, mul_one] at this
  exact not_commutative_witness this

/-! ### O ℚ — distinct worlds do NOT glue pairwise, but a world SELF-glues -/
attribute [local instance] CD.narCD CD.srCD

theorem o_self_glue (a : O ℚ) : WorldsGlue a a := by
  funext x; simp only [WorldsGlue, worldMap, Function.comp_apply]
  exact Phys.Algebra.mul_mul_left a x

theorem o_pair_not_glue :
    ∃ a b : O ℚ, ¬ WorldsGlue a b := by
  refine ⟨CD.iota (ιJ ℚ), CD.iota (CD.e2 : H ℚ), ?_⟩
  intro h
  have := congrFun h (CD.e2 : O ℚ)
  simp only [worldMap, Function.comp_apply] at this
  exact not_associative_witness this.symm

/-! ### S ℚ — even SELF-gluing fails (NEW computation) -/
/-- e4 in S ℚ, the self-glue-failure witness point (measured probes/probe2.py). -/
def wY : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨1, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩

set_option maxHeartbeats 1000000 in
theorem s_self_glue_fail_coord :
    (zdX * (zdX * wY)).im.im.im.im ≠ ((zdX * zdX) * wY).im.im.im.im := by
  simp only [zdX, wY, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
  norm_num

set_option maxHeartbeats 1000000 in
theorem s_self_not_glue : ∃ a : S ℚ, ¬ WorldsGlue a a := by
  refine ⟨zdX, ?_⟩
  intro h
  have := congrFun h wY
  simp only [worldMap, Function.comp_apply] at this
  exact s_self_glue_fail_coord (congrArg (fun z : S ℚ => z.im.im.im.im) this)

#print axioms dbl_glue
#print axioms dbl_symm
#print axioms h_glue
#print axioms h_not_symm
#print axioms o_self_glue
#print axioms o_pair_not_glue
#print axioms s_self_not_glue

end Phys.GatherProbe
