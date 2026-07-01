import Phys.Cascade.Sedenion
import Phys.Algebra.Alternative
import Phys.Algebra.TowerGatherCoherence
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.OctonionCommutatorJacobiator

namespace Phys.Algebra.N220Probe2

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

/-! The Hochschild coboundary of the multiplication 2-cochain δμ = −2·assoc.
    (ring fails on non-assoc/non-comm O ℚ; abel treating products as atoms works.) -/
theorem mult_coboundary_generic {B : Type*} [CommRing B] [StarRing B]
    (a b c : CD (CD B)) :
    (a * (b * c) - (a * b) * c) + (a * (b * c) - (a * b) * c)
      = - (assoc a b c + assoc a b c) := by
  simp only [assoc]; abel

theorem mult_coboundary_O (a b c : O ℚ) :
    (a * (b * c) - (a * b) * c) + (a * (b * c) - (a * b) * c)
      = - (assoc a b c + assoc a b c) := by
  simp only [assoc]; abel

/-! The END-VALUED 2-cochain coboundary of gluingDefect: NOT a cocycle — its
    coboundary is the "associator of associators" term −(assoc a b c)·x. This is the
    other cohomological face: as a 2-cochain valued in End(A), the gluing defect is
    NOT closed; the defect-of-the-defect is the level-up associator. -/
theorem gluingDefect_2coboundary_O (a b c x : O ℚ) :
    a * (gluingDefect b c x) - gluingDefect (a*b) c x + gluingDefect a (b*c) x
      - gluingDefect a b (c*x) = - (assoc a b c * x) := by
  simp only [gluingDefect, assoc, mul_sub, sub_mul]; abel

/-! Non-vacuity: the 3-cocycle is a NONZERO cochain on O ℚ (banked). -/
theorem cocycle_nonzero_O : ∃ a b c : O ℚ, assoc a b c ≠ 0 :=
  ⟨_, _, _, assoc_nonvanishing⟩

/-! The 3-cocycle relates to gluingDefect definitionally on O ℚ. -/
theorem cocycle_is_gluingDefect_O (a b c : O ℚ) :
    assoc a b c = gluingDefect a b c := rfl

end Phys.Algebra.N220Probe2
