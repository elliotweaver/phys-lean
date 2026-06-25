/-
  N32 W9 PROBE 6b — gForm_polar via DIRECT coordinate computation (the gForm_self_sum_sq machinery).
-/
import Phys.Algebra.DerivationAutGroup

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
open scoped BigOperators
noncomputable section

-- DIRECT: gForm v w = ∑ coords product, expanded
theorem gForm_polar_raw (v w : O ℚ) :
    gForm v w = c0 v * c0 w + c1 v * c1 w + c2 v * c2 w + c3 v * c3 w
      + c4 v * c4 w + c5 v * c5 w + c6 v * c6 w + c7 v * c7 w := by
  obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := v
  obtain ⟨⟨⟨a', b'⟩, ⟨c', d'⟩⟩, ⟨⟨e', f'⟩, ⟨g', h'⟩⟩⟩ := w
  simp only [gForm, reQ, c0, c1, c2, c3, c4, c5, c6, c7, sub_eq_add_neg,
    CD.mul_re, CD.star_re, CD.star_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  ring

end
end Phys.Algebra
