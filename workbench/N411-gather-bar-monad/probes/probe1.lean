/- N411 MEASURE-FIRST probe1: unit + faithfulness + unit-sector-defect-free split + concrete rungs. -/
import Phys.Cascade.Sedenion
import Phys.Algebra.Alternative
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.TowerGatherCoherence
import Phys.Algebra.TowerGatherCocycle
import Phys.Algebra.ConfinementCriterion

namespace Phys.Algebra.ProbeN411

open Phys.Cascade
open Phys.Cascade.CD

/-! ## Generic backbone — the look-back η = worldMap into (End A, ∘, id). -/

/-- η UNIT coherence: the trivial standpoint opens the identity world. -/
theorem worldMap_one {A : Type*} [MulOneClass A] : worldMap (1 : A) = id := by
  funext x; simp only [worldMap, one_mul, id_eq]

/-- η is FAITHFUL: the look-back loses nothing (evaluate at 1). -/
theorem worldMap_faithful {A : Type*} [MulOneClass A] :
    Function.Injective (worldMap : A → (A → A)) := by
  intro a b h
  have := congrFun h 1
  simpa only [worldMap, mul_one] using this

/-- The bar MULTIPLICATION-face defect: the μ-comparison `η(ab) − η(a)∘η(b)`. -/
def barMultDefect {A : Type*} [NonAssocRing A] (a b : A) : A → A :=
  fun x => worldMap (a * b) x - (worldMap a ∘ worldMap b) x

/-- The multiplication defect IS the banked gluing obstruction (N219 tie). -/
theorem barMultDefect_eq_gluingDefect {A : Type*} [NonAssocRing A] (a b : A) :
    barMultDefect a b = gluingDefect a b := by
  funext x; rfl

/-- ★ THE UNIT SECTOR IS OBSTRUCTION-FREE (left): the defect VANISHES with a unit factor. -/
theorem barMultDefect_unit_left {A : Type*} [NonAssocRing A] (a : A) :
    barMultDefect (1 : A) a = 0 := by
  funext x; simp only [barMultDefect, worldMap, Function.comp_apply, one_mul, sub_self, Pi.zero_apply]

/-- ★ THE UNIT SECTOR IS OBSTRUCTION-FREE (right). -/
theorem barMultDefect_unit_right {A : Type*} [NonAssocRing A] (a : A) :
    barMultDefect a (1 : A) = 0 := by
  funext x; simp only [barMultDefect, worldMap, Function.comp_apply, mul_one, one_mul, sub_self, Pi.zero_apply]

/-! ## Concrete rungs. -/

attribute [local instance] CD.narCD CD.srCD

/-- Unit coherence on `O ℚ`. -/
theorem o_worldMap_one : worldMap (1 : O ℚ) = id := by
  funext x; simp only [worldMap, one_mul, id_eq]

/-- Faithfulness on `O ℚ`. -/
theorem o_worldMap_faithful : Function.Injective (worldMap : O ℚ → (O ℚ → O ℚ)) := by
  intro a b h
  have := congrFun h 1
  simpa only [worldMap, mul_one] using this

/-- The O-rung defect IS the banked associator (N219 tie). -/
theorem o_barMultDefect_eq_assoc (a b : O ℚ) :
    barMultDefect a b = fun x => Phys.Algebra.assoc a b x := by
  rw [barMultDefect_eq_gluingDefect]; exact o_gluingDefect_eq_assoc a b

/-- STRICT (smooth, no obstruction) on `Dbl ℚ`. -/
theorem dbl_barStrict (a b : Dbl ℚ) : barMultDefect a b = 0 := by
  rw [barMultDefect_eq_gluingDefect]; exact dbl_gluingDefect_zero a b

/-- STRICT on `H ℚ`. -/
theorem h_barStrict (a b : H ℚ) : barMultDefect a b = 0 := by
  rw [barMultDefect_eq_gluingDefect]; exact h_gluingDefect_zero a b

/-- ★ GENUINELY OBSTRUCTED on `O ℚ` (W8 non-vacuity). -/
theorem o_bar_obstructed : ∃ a b : O ℚ, barMultDefect a b ≠ 0 := by
  obtain ⟨a, b, hab⟩ := o_gluingDefect_ne_zero
  exact ⟨a, b, by rw [barMultDefect_eq_gluingDefect]; exact hab⟩

/-- ★★ THE SOLE OBSTRUCTION (closed 3-cocycle): the O-rung obstruction is Hochschild-closed
    (banked `teich_cocycle_O`), so the pentagon coherence holds and the associator is the
    SOLE obstruction to strictness. Phrased on the gluing obstruction map. -/
theorem o_bar_sole_obstruction (a b c x : O ℚ) :
    a * gluingDefect b c x - gluingDefect (a * b) c x + gluingDefect a (b * c) x
      - gluingDefect a b (c * x) + gluingDefect a b c * x = 0 := by
  simp only [gluingDefect_is_assoc_O]; exact teich_cocycle_O a b c x

/-- ★ THE SOLE GATHER OBSTRUCTION IS A PHYSICS TERMINATION: the O-rung obstruction being
    genuinely nonzero is exactly confinement (banked N385). -/
theorem o_bar_obstruction_is_confinement : SectorConfines (O ℚ) :=
  o_confines_from_cascade_stop

end Phys.Algebra.ProbeN411
