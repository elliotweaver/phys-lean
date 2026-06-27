import Phys.Algebra.LorentzContinuumGenerationOctonionBlockTriple

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- Candidate fifth unit: ii5 := ii4 * je2 (the quaternion k = i·j embedded). -/
abbrev ii5p : O Cut := (ii4 : O Cut) * (je2 : O Cut)

-- square = -1 ?
theorem ii5p_sq : (ii5p : O Cut) * (ii5p : O Cut) = -1 := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

-- imaginary ?
theorem ii5p_imag : star (ii5p : O Cut) = -(ii5p : O Cut) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

-- gFormC self = 1 ?
theorem ii5p_gFormC_self : gFormC (ii5p : O Cut) (ii5p : O Cut) = 1 := by
  show reQC ((ii5p : O Cut) * star (ii5p : O Cut)) = 1
  rw [ii5p_imag]
  simp only [reQC]
  simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J, CD.mul_re, CD.neg_re]

-- anticommutes with e2 ?
theorem e2_ii5p_anticomm : (CD.e2 : O Cut) * ii5p = -(ii5p * (CD.e2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

-- anticommutes with je2 ?
theorem je2_ii5p_anticomm : (je2 : O Cut) * ii5p = -(ii5p * (je2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

-- anticommutes with ke2je2 ?
theorem ke2je2_ii5p_anticomm : (ke2je2 : O Cut) * ii5p = -(ii5p * (ke2je2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

-- anticommutes with ii4 ?
theorem ii4_ii5p_anticomm : (ii4 : O Cut) * ii5p = -(ii5p * (ii4 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

end

end Phys.Algebra
