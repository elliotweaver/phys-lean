import Phys.Algebra.Operator
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

-- The 7 imaginary coordinate units of O ℚ. (re.re.re is the real coordinate.)
def f1 : O ℚ := ⟨⟨⟨0,1⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩   -- re.re.im
def f2 : O ℚ := ⟨⟨⟨0,0⟩,⟨1,0⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩   -- re.im.re
def f3 : O ℚ := ⟨⟨⟨0,0⟩,⟨0,1⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩   -- re.im.im
def f4 : O ℚ := ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨1,0⟩,⟨0,0⟩⟩⟩   -- im.re.re
def f5 : O ℚ := ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,1⟩,⟨0,0⟩⟩⟩   -- im.re.im
def f6 : O ℚ := ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨1,0⟩⟩⟩   -- im.im.re
def f7 : O ℚ := ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨0,1⟩⟩⟩   -- im.im.im

set_option maxHeartbeats 1000000

-- imaginary
example : star f1 = -f1 := by ext <;> simp [f1]
example : star f7 = -f7 := by ext <;> simp [f7]

-- Nrm = 1
example : Nrm f1 = (1 : H ℚ) := by rw [Nrm_def]; ext <;> simp [f1, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
example : Nrm f7 = (1 : H ℚ) := by rw [Nrm_def]; ext <;> simp [f7, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

-- bilin (a deep pair) = 0
example : bilin f1 f7 = (0 : H ℚ) := by
  simp only [bilin]
  ext <;> simp [f1, f7, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

example : bilin f4 f5 = (0 : H ℚ) := by
  simp only [bilin]
  ext <;> simp [f4, f5, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
