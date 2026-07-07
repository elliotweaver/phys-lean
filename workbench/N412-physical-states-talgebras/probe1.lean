import Phys.Algebra.TowerGatherBarMonad
import Phys.Algebra.ConfinementCriterion
import Mathlib.Tactic

namespace Phys.Algebra.ProbeN412

open Phys.Algebra
open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- STATE-level physicality: a's world composes strictly with every other. -/
def GluesGlobally {A : Type*} [Mul A] (a : A) : Prop := ∀ b : A, WorldsGlue a b

-- 1. physical ↔ obstruction vanishes universally
theorem gluesGlobally_iff_defect {A : Type*} [NonAssocRing A] (a : A) :
    GluesGlobally a ↔ ∀ b : A, gluingDefect a b = 0 := by
  simp only [GluesGlobally, worlds_glue_iff_gluingDefect_zero]

-- 2. physical ↔ monad μ-comparison fixed
theorem gluesGlobally_iff_barDefect {A : Type*} [NonAssocRing A] (a : A) :
    GluesGlobally a ↔ ∀ b : A, barMultDefect a b = 0 := by
  simp only [GluesGlobally, worlds_glue_iff_gluingDefect_zero, barMultDefect_eq_gluingDefect]

-- 3. unit always physical
theorem one_gluesGlobally {A : Type*} [MulOneClass A] : GluesGlobally (1 : A) := by
  intro b
  funext x
  simp only [WorldsGlue, worldMap, Function.comp_apply, one_mul]

-- 4. smooth rungs: all physical
theorem dbl_all_physical : ∀ a : Dbl ℚ, GluesGlobally a := fun a b => dbl_worlds_glue a b
theorem h_all_physical : ∀ a : H ℚ, GluesGlobally a := fun a b => h_worlds_glue a b

-- 5. octonion nucleus characterization
theorem o_gluesGlobally_iff_nucleus (a : O ℚ) :
    GluesGlobally a ↔ ∀ b : O ℚ, (fun x => Phys.Algebra.assoc a b x) = 0 := by
  simp only [GluesGlobally, worlds_glue_iff_gluingDefect_zero, o_gluingDefect_eq_assoc]

-- 6. octonion: not all physical (proper)
theorem o_not_all_physical : ¬ ∀ a : O ℚ, GluesGlobally a := by
  intro h
  obtain ⟨a, b, hab⟩ := o_worlds_not_glue
  exact hab (h a b)

-- 8. sector-gather ↔ all physical
theorem sectorGather_iff_all_physical (A : Type*) [Mul A] :
    SectorGlobalGather A ↔ ∀ a : A, GluesGlobally a := by
  rfl

-- 9. confines ↔ some unphysical
theorem confines_iff_some_unphysical (A : Type*) [Mul A] :
    SectorConfines A ↔ ∃ a : A, ¬ GluesGlobally a := by
  simp only [SectorConfines, SectorGlobalGather, GluesGlobally, not_forall]

end Phys.Algebra.ProbeN412
