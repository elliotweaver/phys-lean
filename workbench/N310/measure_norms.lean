import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationStabilizer
import Mathlib.Tactic
namespace M
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD
-- measure gForm u1 u1
example : gForm u1 u1 = 1 := by unfold gForm; simp [u1, reQ, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
-- octCross u1 u1 = 0 via octCross_self
example : octCross u1 u1 = 0 := octCross_self u1_mem_ImO
end M
