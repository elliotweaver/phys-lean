import Phys.Algebra.ConfinementCriterion
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.TowerWorldMapColourNeutralCore
import Mathlib.Tactic

namespace Phys.Algebra.Probe3

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

-- linearity + crux + glue (from probe2, confirmed)
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

theorem singlet_worlds_glue {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) :
    WorldsGlue a b := by
  rw [worlds_glue_iff_gluingDefect_zero, o_gluingDefect_eq_assoc]
  funext x
  simp only [Pi.zero_apply]
  exact singlet_assoc_vanishes ha hb x

def SectorGlobalGatherOn (S : Submodule ℚ (O ℚ)) : Prop :=
  ∀ a ∈ S, ∀ b ∈ S, WorldsGlue a b

theorem singlet_sheafifies :
    SectorGlobalGatherOn (Submodule.span ℚ {(1 : O ℚ), u1}) :=
  fun a ha b hb => singlet_worlds_glue ha hb

theorem full_not_sheafifies : ¬ SectorGlobalGatherOn (⊤ : Submodule ℚ (O ℚ)) := by
  intro h
  obtain ⟨a, b, hab⟩ := o_worlds_not_glue
  exact hab (h a Submodule.mem_top b Submodule.mem_top)

/-! ★ TIE TO THE DERIVED COLOUR-NEUTRAL CORE (N266): the colour-neutral core
    (joint kernel of every colour derivation) sheafifies — this is what "colour
    singlets are the physical states" MEANS, DERIVED not posited. -/
theorem colour_neutral_sheafifies : SectorGlobalGatherOn matterColourNeutral := by
  rw [SectorGlobalGatherOn]
  intro a ha b hb
  rw [matterColourNeutral_eq_span_one_u1] at ha hb
  exact singlet_worlds_glue ha hb

/-! ★ NO FREE COLOURED STATES (contrapositive): to fail to glue (be confined),
    a NON-singlet (coloured) standpoint must be involved. -/
theorem coloured_required_for_obstruction {a b : O ℚ} (h : ¬ WorldsGlue a b) :
    a ∉ Submodule.span ℚ {(1 : O ℚ), u1} ∨ b ∉ Submodule.span ℚ {(1 : O ℚ), u1} := by
  by_contra hcon
  push_neg at hcon
  exact h (singlet_worlds_glue hcon.1 hcon.2)

/-! ★ NON-VACUITY: the sheafifying sector is a PROPER subspace of the carrier —
    it is NOT all of O ℚ (else everything would glue, contradicting confinement). -/
theorem singlet_proper : Submodule.span ℚ {(1 : O ℚ), u1} ≠ (⊤ : Submodule ℚ (O ℚ)) := by
  intro h
  apply full_not_sheafifies
  rw [← h]
  exact singlet_sheafifies

end Phys.Algebra.Probe3
