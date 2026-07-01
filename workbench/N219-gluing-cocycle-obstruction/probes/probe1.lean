/-
  N219 PROBE 1 (v2) — measure: the explicit gluing-obstruction cocycle = the associator.
-/
import Phys.Cascade.Sedenion
import Phys.Algebra.Alternative
import Phys.Algebra.TowerGatherCoherence

namespace Phys.Algebra.N219Probe

open Phys.Cascade
open Phys.Cascade.CD

/-- The EXPLICIT gluing obstruction: the map whose vanishing is `WorldsGlue a b`. -/
def gluingDefect {A : Type*} [Mul A] [Sub A] (a b : A) : A → A :=
  fun x => (a * b) * x - a * (b * x)

section AnyRing
variable {A : Type*} [NonAssocRing A]

/-- The N218T predicate IS the vanishing of the explicit obstruction. -/
theorem worlds_glue_iff_gluingDefect_zero (a b : A) :
    WorldsGlue a b ↔ gluingDefect a b = 0 := by
  constructor
  · intro h
    funext x
    have hx := congrFun h x
    simp only [worldMap, Function.comp_apply] at hx
    simp only [gluingDefect, Pi.zero_apply]
    rw [hx, sub_self]
  · intro h
    funext x
    have hx := congrFun h x
    simp only [gluingDefect, Pi.zero_apply, sub_eq_zero] at hx
    simp only [worldMap, Function.comp_apply]
    exact hx.symm

end AnyRing

/-! ## RUNG `Dbl ℚ` and `H ℚ` — the obstruction is IDENTICALLY ZERO (associative). -/

theorem dbl_gluingDefect_zero (a b : Dbl ℚ) : gluingDefect a b = 0 := by
  funext x; simp only [gluingDefect, Pi.zero_apply]; rw [mul_assoc, sub_self]

theorem h_gluingDefect_zero (a b : H ℚ) : gluingDefect a b = 0 := by
  funext x; simp only [gluingDefect, Pi.zero_apply]; rw [mul_assoc, sub_self]

/-! ## RUNG `O ℚ` — the obstruction is the ASSOCIATOR: nonzero but ALTERNATING. -/

attribute [local instance] CD.narCD CD.srCD

/-- THE IDENTIFICATION: on the octonion shape the gluing obstruction IS the banked
    associator `[a,b,·]`. Definitional. -/
theorem o_gluingDefect_eq_assoc (a b : O ℚ) :
    gluingDefect a b = fun x => Phys.Algebra.assoc a b x := by
  funext x; rfl

/-- SELF-obstruction vanishes on `O ℚ` (left-alternativity: the associator alternates). -/
theorem o_gluingDefect_self (a : O ℚ) : gluingDefect a a = 0 := by
  funext x
  have h := Phys.Algebra.alt_left a x
  simp only [Phys.Algebra.assoc] at h
  simp only [gluingDefect, Pi.zero_apply]
  exact h

/-- The obstruction is ANTISYMMETRIC in the two standpoints (banked `assoc_swap12`). -/
theorem o_gluingDefect_antisymm (a b x : O ℚ) :
    gluingDefect a b x + gluingDefect b a x = 0 := by
  have h := Phys.Algebra.assoc_swap12 a b x
  simp only [Phys.Algebra.assoc] at h
  simp only [gluingDefect]
  exact h

/-- The obstruction is genuinely NONZERO on `O ℚ` (banked `assoc_nonvanishing`). -/
theorem o_gluingDefect_ne_zero :
    ∃ a b : O ℚ, gluingDefect a b ≠ 0 := by
  refine ⟨CD.iota (ιJ ℚ), CD.iota (CD.e2 : H ℚ), ?_⟩
  intro h
  have hx := congrFun h (CD.e2 : O ℚ)
  simp only [gluingDefect, Pi.zero_apply] at hx
  exact Phys.Algebra.assoc_nonvanishing hx

/-! ## RUNG `S ℚ` — the obstruction LOSES its alternating diagonal: self-defect nonzero. -/

theorem s_gluingDefect_self_ne_zero :
    ∃ a : S ℚ, gluingDefect a a ≠ 0 := by
  refine ⟨zdX, ?_⟩
  intro h
  have hx := congrFun h wY
  simp only [gluingDefect, Pi.zero_apply, sub_eq_zero] at hx
  exact s_self_glue_fail_coord (congrArg (fun z : S ℚ => z.im.im.im.im) hx.symm)

/-! ## CAPSTONE — the single explicit obstruction cocycle degrading across the tower. -/

theorem gluing_obstruction_staircase :
    (∀ a b : Dbl ℚ, gluingDefect a b = 0) ∧
    (∀ a b : H ℚ, gluingDefect a b = 0) ∧
    (∃ a b : O ℚ, gluingDefect a b ≠ 0) ∧
    (∀ a : O ℚ, gluingDefect a a = 0) ∧
    (∀ a b x : O ℚ, gluingDefect a b x + gluingDefect b a x = 0) ∧
    (∃ a : S ℚ, gluingDefect a a ≠ 0) :=
  ⟨dbl_gluingDefect_zero, h_gluingDefect_zero, o_gluingDefect_ne_zero,
    o_gluingDefect_self, o_gluingDefect_antisymm, s_gluingDefect_self_ne_zero⟩

end Phys.Algebra.N219Probe
