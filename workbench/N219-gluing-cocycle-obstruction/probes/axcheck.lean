import Phys.Cascade.Sedenion
import Phys.Algebra.Alternative
import Phys.Algebra.TowerGatherCoherence
namespace Phys.Algebra.N219Probe
open Phys.Cascade
open Phys.Cascade.CD
def gluingDefect {A : Type*} [Mul A] [Sub A] (a b : A) : A → A :=
  fun x => (a * b) * x - a * (b * x)
attribute [local instance] CD.narCD CD.srCD
theorem o_gluingDefect_self (a : O ℚ) : gluingDefect a a = 0 := by
  funext x
  have h := Phys.Algebra.alt_left a x
  simp only [Phys.Algebra.assoc] at h
  simp only [gluingDefect, Pi.zero_apply]
  exact h
theorem o_gluingDefect_ne_zero : ∃ a b : O ℚ, gluingDefect a b ≠ 0 := by
  refine ⟨CD.iota (ιJ ℚ), CD.iota (CD.e2 : H ℚ), ?_⟩
  intro h
  have hx := congrFun h (CD.e2 : O ℚ)
  simp only [gluingDefect, Pi.zero_apply] at hx
  exact Phys.Algebra.assoc_nonvanishing hx
theorem s_gluingDefect_self_ne_zero : ∃ a : S ℚ, gluingDefect a a ≠ 0 := by
  refine ⟨zdX, ?_⟩
  intro h
  have hx := congrFun h wY
  simp only [gluingDefect, Pi.zero_apply, sub_eq_zero] at hx
  exact s_self_glue_fail_coord (congrArg (fun z : S ℚ => z.im.im.im.im) hx.symm)
#print axioms o_gluingDefect_self
#print axioms o_gluingDefect_ne_zero
#print axioms s_gluingDefect_self_ne_zero
end Phys.Algebra.N219Probe
