import Phys.Algebra.Alternative

namespace Phys.Algebra.N205Probe

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

section Alt
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- the internal commutator bracket on the octonion shape -/
def octBracket (x y : CD (CD B)) : CD (CD B) := x * y - y * x

/-- the Jacobiator of the commutator bracket -/
def jacobiator (x y z : CD (CD B)) : CD (CD B) :=
  octBracket (octBracket x y) z + octBracket (octBracket y z) x + octBracket (octBracket z x) y

/-- MEASURE 1: the expansion identity — Jacobiator = signed sum of the six associators. -/
theorem jacobiator_eq_assoc_sum (x y z : CD (CD B)) :
    jacobiator x y z =
      assoc x y z - assoc y x z + assoc y z x - assoc z y x + assoc z x y - assoc x z y := by
  simp only [jacobiator, octBracket, assoc, sub_mul, mul_sub]
  abel

/-- MEASURE 2: the alternating collapse — six copies of assoc x y z. -/
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

#print axioms jacobiator_eq_assoc_sum
#print axioms jacobiator_eq_six_assoc

end Phys.Algebra.N205Probe
