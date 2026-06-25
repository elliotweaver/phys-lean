import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationLowerBound

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

namespace N42Probe

-- MEASURE: u1 squares to -1 (the banked complex unit).
example : u1 * u1 = (-1 : O ℚ) := by
  ext <;> simp [u1] <;> rfl

-- MEASURE: D0E kills u1 (∈ stabilizer).
example : D0E u1 = 0 := by
  ext <;> simp [D0E, u1, c2, c3, c4, c5]

-- MEASURE: D3E does NOT kill u1 (∉ stabilizer): its c6 coordinate is 1.
example : c6 (D3E u1) = 1 := by
  simp [D3E, u1, c1, c3, c4, c6]

-- hence D3E u1 ≠ 0
example : D3E u1 ≠ 0 := by
  intro h
  have : c6 (D3E u1) = c6 (0 : O ℚ) := by rw [h]
  simp [D3E, u1, c1, c3, c4, c6] at this

end N42Probe
