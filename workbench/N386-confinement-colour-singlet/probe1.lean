import Phys.Algebra.ConfinementCriterion
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.TowerWorldMapColourNeutralCore
import Mathlib.Tactic

namespace Phys.Algebra.Probe

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

/-! Step 1: associator linearity in the first two slots (build if not banked). -/

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
  simp only [assoc, qsmul_mul_left, qsmul_mul_right, smul_sub]

/-! Step 2: the crux — the associator vanishes when its first two args are in span{1,u1}. -/

theorem singlet_assoc_vanishes {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) :
    assoc a b x = 0 := by
  rw [Submodule.mem_span_pair] at ha hb
  obtain ⟨s, t, hst⟩ := ha
  obtain ⟨p, q, hpq⟩ := hb
  subst hst; subst hpq
  -- expand trilinearly in the first two slots; base associators all vanish:
  -- [1,1,x]=0, [1,u1,x]=0, [u1,1,x]=0, [u1,u1,x]=0
  simp only [assoc_add_left, assoc_add_mid, assoc_smul_left, assoc_smul_mid,
    assoc_one_left, assoc_one_mid, alt_left, smul_zero, add_zero, zero_add]

end Phys.Algebra.Probe
