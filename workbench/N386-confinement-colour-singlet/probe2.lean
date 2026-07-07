import Phys.Algebra.ConfinementCriterion
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.TowerWorldMapColourNeutralCore
import Mathlib.Tactic

namespace Phys.Algebra.Probe2

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

-- linearity (from probe1)
theorem assoc_add_left (x x' y z : O ℚ) :
    assoc (x + x') y z = assoc x y z + assoc x' y z := by
  simp only [assoc, add_mul]; abel
theorem assoc_smul_left (c : ℚ) (x y z : O ℚ) :
    assoc (c • x) y z = c • assoc x y z := by
  simp only [assoc, qsmul_mul_left, smul_sub]
theorem assoc_add_mid (x y y' z : O ℚ) :
    assoc x (y + y') z = assoc x y z + assoc x y' z := by
  simp only [assoc, mul_add, add_mul]; abel
theorem assoc_smul_mid (c : ℚ) (x y z : O ℚ) :
    assoc x (c • y) z = c • assoc x y z := by
  simp only [assoc, qsmul_mul_right, qsmul_mul_left, smul_sub]

theorem singlet_assoc_vanishes {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) :
    assoc a b x = 0 := by
  rw [Submodule.mem_span_pair] at ha hb
  obtain ⟨s, t, hst⟩ := ha
  obtain ⟨p, q, hpq⟩ := hb
  subst hst; subst hpq
  simp only [assoc_add_left, assoc_add_mid, assoc_smul_left, assoc_smul_mid,
    assoc_one_left, assoc_one_mid, alt_left, smul_zero, add_zero]

/-! The gluing defect vanishes on singlet worlds (via o_gluingDefect_eq_assoc). -/

theorem singlet_gluingDefect_zero {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) :
    gluingDefect a b = 0 := by
  rw [o_gluingDefect_eq_assoc]
  funext x
  simp only [Pi.zero_apply]
  exact singlet_assoc_vanishes ha hb x

/-! Singlet worlds GLUE. -/

theorem singlet_worlds_glue {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) :
    WorldsGlue a b := by
  rw [worlds_glue_iff_gluingDefect_zero]
  exact singlet_gluingDefect_zero ha hb

/-! The restricted global-gather predicate on a subalgebra: sections valued in S glue. -/

def SectorGlobalGatherOn (S : Submodule ℚ (O ℚ)) : Prop :=
  ∀ a ∈ S, ∀ b ∈ S, WorldsGlue a b

/-! ★ THE SINGLET SECTOR SHEAFIFIES: all singlet worlds glue to a global section. -/

theorem singlet_sheafifies :
    SectorGlobalGatherOn (Submodule.span ℚ {(1 : O ℚ), u1}) := by
  intro a ha b hb
  exact singlet_worlds_glue ha hb

/-! ★ THE FULL (COLOURED) SECTOR DOES NOT SHEAFIFY: some pair of O ℚ worlds fails to glue. -/

theorem full_not_sheafifies : ¬ SectorGlobalGatherOn (⊤ : Submodule ℚ (O ℚ)) := by
  intro h
  obtain ⟨a, b, hab⟩ := o_worlds_not_glue
  exact hab (h a Submodule.mem_top b Submodule.mem_top)

end Phys.Algebra.Probe2
