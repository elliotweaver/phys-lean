import Phys.Algebra.Alternative

namespace Phys.Algebra.N205Probe2

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

section Alt
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

def octBracket (x y : CD (CD B)) : CD (CD B) := x * y - y * x

def jacobiator (x y z : CD (CD B)) : CD (CD B) :=
  octBracket (octBracket x y) z + octBracket (octBracket y z) x + octBracket (octBracket z x) y

theorem jacobiator_eq_assoc_sum (x y z : CD (CD B)) :
    jacobiator x y z =
      assoc x y z - assoc y x z + assoc y z x - assoc z y x + assoc z x y - assoc x z y := by
  simp only [jacobiator, octBracket, assoc, sub_mul, mul_sub]
  abel

theorem jacobiator_eq_six_assoc (x y z : CD (CD B)) :
    jacobiator x y z =
      assoc x y z + assoc x y z + assoc x y z + assoc x y z + assoc x y z + assoc x y z := by
  rw [jacobiator_eq_assoc_sum]
  have h12 : assoc y x z = -assoc x y z := by
    linear_combination (norm := abel) assoc_swap12 x y z
  have h23 : assoc x z y = -assoc x y z := by
    linear_combination (norm := abel) assoc_swap23 x y z
  have hzxy : assoc z x y = assoc x y z := by
    linear_combination (norm := abel) assoc_swap12 x z y - assoc_swap23 x y z
  have hzyx : assoc z y x = -assoc x y z := by
    linear_combination (norm := abel)
      assoc_swap23 z x y - assoc_swap12 x z y + assoc_swap23 x y z
  have hyzx : assoc y z x = assoc x y z := by
    linear_combination (norm := abel) assoc_swap23 y x z - assoc_swap12 x y z
  rw [h12, h23, hzxy, hzyx, hyzx]
  abel

end Alt

section Concrete
attribute [local instance] CD.narCD CD.srCD

/-- the witness triple (cascade's non-associating triple, banked Alternative.lean). -/
noncomputable def wx : O ℚ := CD.iota (ιJ ℚ)
noncomputable def wy : O ℚ := CD.iota (CD.e2 : H ℚ)
noncomputable def wz : O ℚ := (CD.e2 : O ℚ)

/-- W8 teeth: the Jacobiator's `im.im.im` coordinate at the witness equals 12 (= 6·2). -/
theorem jacobiator_witness_coord :
    (jacobiator wx wy wz).im.im.im = 12 := by
  have hsix : (jacobiator wx wy wz).im.im.im
      = 6 * (assoc wx wy wz).im.im.im := by
    rw [jacobiator_eq_six_assoc]
    simp only [CD.add_im, Dbl.add_im]
    ring
  rw [hsix]
  show 6 * (assoc (CD.iota (ιJ ℚ)) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im = 12
  rw [assoc_witness_coord]
  norm_num

/-- W8 teeth: the Jacobiator is NONZERO at the witness — Jacobi FAILS, not a Lie algebra. -/
theorem jacobiator_witness_ne_zero : jacobiator wx wy wz ≠ 0 := by
  intro h
  have hz : (jacobiator wx wy wz).im.im.im = 12 := jacobiator_witness_coord
  rw [h] at hz
  norm_num [CD.zero_im] at hz

end Concrete

#print axioms jacobiator_witness_coord
#print axioms jacobiator_witness_ne_zero

end Phys.Algebra.N205Probe2
