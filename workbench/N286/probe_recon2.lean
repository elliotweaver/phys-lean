import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
set_option synthInstance.maxSize 400000

-- fully-destructured approach: reduce star z = z to 8 rational coord equations.
theorem self_adjoint_ocR (z : O ℚ) (hz : star z = z) : z = ocR (reQ z) := by
  obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := z
  -- reduce hz to coordinate equalities via CD.ext_iff / Dbl.ext_iff simp
  simp only [ocR, reQ]
  -- goal now: ⟨⟨⟨a,b⟩,⟨c,d⟩⟩,⟨⟨e,f⟩,⟨g,h⟩⟩⟩ = ⟨⟨⟨a,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩
  -- from hz, extract b=0,c=0,d=0,e=0,f=0,g=0,h=0
  have key : (star (⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ : O ℚ))
      = (⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ : O ℚ) := hz
  simp only [star, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im',
    CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] at key
  sorry

end Phys.Algebra.HJ
