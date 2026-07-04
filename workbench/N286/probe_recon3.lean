import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
set_option synthInstance.maxSize 400000

-- probe: is star z definitionally the sign-flipped structure?
example (a b c d e f g h : ℚ) :
    star (⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ : O ℚ)
      = ⟨⟨⟨a, -b⟩, ⟨-c, -d⟩⟩, ⟨⟨-e, -f⟩, ⟨-g, -h⟩⟩⟩ := rfl

-- coordinate-extraction via mk.injEq
theorem self_adjoint_ocR (z : O ℚ) (hz : star z = z) : z = ocR (reQ z) := by
  obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := z
  have hstar : star (⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ : O ℚ)
      = ⟨⟨⟨a, -b⟩, ⟨-c, -d⟩⟩, ⟨⟨-e, -f⟩, ⟨-g, -h⟩⟩⟩ := rfl
  rw [hstar] at hz
  simp only [CD.mk.injEq, Dbl.mk.injEq] at hz
  simp only [ocR, reQ]
  obtain ⟨⟨⟨_, hb⟩, hc, hd⟩, ⟨he, hf⟩, hg, hh⟩ := hz
  have hb0 : b = 0 := by linarith
  have hc0 : c = 0 := by linarith
  have hd0 : d = 0 := by linarith
  have he0 : e = 0 := by linarith
  have hf0 : f = 0 := by linarith
  have hg0 : g = 0 := by linarith
  have hh0 : h = 0 := by linarith
  subst hb0 hc0 hd0 he0 hf0 hg0 hh0
  rfl

end Phys.Algebra.HJ
