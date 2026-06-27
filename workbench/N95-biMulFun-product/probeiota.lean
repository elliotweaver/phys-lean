import Phys.Algebra.LorentzContinuumSpin9Reach
import Phys.Algebra.Alternative
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- iota e2 over Cut
abbrev je2 : O Cut := (CD.iota (CD.e2 : H Cut) : O Cut)
-- is it imaginary?
theorem je2_imag : star (je2 : O Cut) = -(je2 : O Cut) := by ext <;> simp [CD.e2, CD.iota]
-- alt law via L_sq_imag
theorem je2_alt (v : O Cut) : (je2:O Cut) * ((je2:O Cut) * v) = -v := by
  have h := L_sq_imag (je2 : O Cut) je2_imag v
  rw [h]
  have hN : (CD.iota (CD.Nrm (je2 : O Cut)) : O Cut) = 1 := by
    rw [show CD.Nrm (je2 : O Cut) = (1 : H Cut) by rw [CD.Nrm_def]; ext <;> simp [CD.e2, CD.iota]]
    ext <;> simp [CD.iota]
  rw [hN, one_mul]
-- square = -1
theorem je2_sq : (je2:O Cut) * (je2:O Cut) = -1 := by
  have h := je2_alt (1 : O Cut); rwa [mul_one] at h
-- gFormC self = 1
theorem je2_gFormC_self : gFormC (je2 : O Cut) (je2 : O Cut) = 1 := by
  show reQC ((je2:O Cut) * star (je2:O Cut)) = 1
  rw [je2_imag]
  simp only [reQC]
  simp [CD.e2, CD.iota, CD.mul_re, CD.neg_re]
end
end Phys.Algebra
