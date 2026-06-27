import Phys.Algebra.LorentzContinuumSpin9DistinctPlane

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- W8 sanity: confirm the off-diagonal generator's image of 1 (= e₂·ιe₂) is GENUINELY DIFFERENT
-- from what the diagonal half-turn (N94) gives (−1, scalar) and what N95's product gives (1).
-- diagonal half-turn biMulFun e₂ e₂ (0,0,1) = (0,0,−1): scalar re.re.re = −1.
example : (biMulFun (CD.e2:O Cut) (CD.e2:O Cut) ((0:Cut),(0:Cut),(1:O Cut))).2.2.re.re.re = -1 := by
  rw [biMulFun_imag_negates_one (CD.e2:O Cut) biMulFun_e2_sq]; simp

-- off-diagonal biMulFun e₂ ιe₂ (0,0,1) = (0,0, e₂·ιe₂): scalar re.re.re = 0 (OFF-axis, NEW).
example : (biMulFun (CD.e2:O Cut) (je2:O Cut) ((0:Cut),(0:Cut),(1:O Cut))).2.2.re.re.re = 0 := by
  rw [biMulFun_distinct_swap_one]; exact biMulFun_e2je2_offaxis

-- so the off-diagonal image (re.re.re = 0) ≠ the diagonal image (re.re.re = −1): genuinely new.
-- Confirm 0 ≠ -1 over Cut.
example : (0 : Cut) ≠ (-1 : Cut) := by norm_num

-- NON-VACUITY: confirm the off-diagonal generator is NOT the identity on the real axis
-- (its image of 1 is NOT 1 — it genuinely MOVES the real axis, unlike N95's product which fixes it).
-- e₂·ιe₂ ≠ 1 because its re.re.re = 0 ≠ 1.
example : (biMulFun (CD.e2:O Cut) (je2:O Cut) ((0:Cut),(0:Cut),(1:O Cut))).2.2 ≠ (1:O Cut) := by
  intro h
  have := congrArg (fun z => z.re.re.re) h
  rw [biMulFun_e2je2_offaxis] at this
  simp at this

end

end Phys.Algebra
