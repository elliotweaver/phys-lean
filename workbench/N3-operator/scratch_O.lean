import Phys.Cascade.ForcedStop
import Mathlib.Tactic
import Mathlib.Algebra.Group.Hom.End

open Phys.Cascade
open Phys.Cascade.CD

namespace Phys.Cascade.ScratchO

-- e2 : O ℚ is imaginary
theorem star_e2_O : star (CD.e2 : O ℚ) = -(CD.e2 : O ℚ) := by
  ext <;> simp [CD.e2]

-- Nrm e2 = 1 (in H ℚ = CD (Dbl ℚ))
theorem Nrm_e2_O : CD.Nrm (CD.e2 : O ℚ) = (1 : H ℚ) := by
  rw [CD.Nrm_def]
  simp [CD.e2]

-- iota (Nrm e2) = 1 in O ℚ
theorem iota_Nrm_e2_O : (CD.iota (CD.Nrm (CD.e2 : O ℚ)) : O ℚ) = 1 := by
  rw [Nrm_e2_O]; ext <;> simp [CD.iota]

-- non-vacuity: associativity genuinely fails (operator level)
-- a*(b*y) ≠ (a*b)*y  for the banked witness
theorem nonassoc_pointwise :
    (CD.iota (ιJ ℚ)) * ((CD.iota (CD.e2 : H ℚ)) * (CD.e2 : O ℚ))
      ≠ ((CD.iota (ιJ ℚ)) * (CD.iota (CD.e2 : H ℚ))) * (CD.e2 : O ℚ) := by
  intro h
  exact not_associative_witness h.symm

end Phys.Cascade.ScratchO
