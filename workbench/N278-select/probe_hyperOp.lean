import Phys.Algebra.TowerGatherForcedHyperchargeDirection
import Phys.Algebra.TowerGatherIsospinMultiplet
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

set_option maxHeartbeats 800000

example : hyperOp u1M = -e5I := by
  apply Subtype.ext; show octCross (kappaO 1) (u1 : O ℚ) = (-(e5O) : O ℚ)
  rw [octCross]; ext <;> simp only [kappaO, u1, e5O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

example : hyperOp e2I = -e6I := by
  apply Subtype.ext; show octCross (kappaO 1) (e2O : O ℚ) = (-(e6O) : O ℚ)
  rw [octCross]; ext <;> simp only [kappaO, e2O, e6O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

example : hyperOp e3I = -e7I := by
  apply Subtype.ext; show octCross (kappaO 1) (e3O : O ℚ) = (-(e7O) : O ℚ)
  rw [octCross]; ext <;> simp only [kappaO, e3O, e7O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

example : hyperOp e4I = 0 := by
  apply Subtype.ext; show octCross (kappaO 1) (e4O : O ℚ) = (0 : O ℚ)
  rw [octCross]; ext <;> simp only [kappaO, e4O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im, CD.zero_re, Dbl.zero_re] <;> norm_num

example : hyperOp e5I = u1M := by
  apply Subtype.ext; show octCross (kappaO 1) (e5O : O ℚ) = (u1 : O ℚ)
  rw [octCross]; ext <;> simp only [kappaO, e5O, u1, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

example : hyperOp e6I = e2I := by
  apply Subtype.ext; show octCross (kappaO 1) (e6O : O ℚ) = (e2O : O ℚ)
  rw [octCross]; ext <;> simp only [kappaO, e6O, e2O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

example : hyperOp e7I = e3I := by
  apply Subtype.ext; show octCross (kappaO 1) (e7O : O ℚ) = (e3O : O ℚ)
  rw [octCross]; ext <;> simp only [kappaO, e7O, e3O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num
