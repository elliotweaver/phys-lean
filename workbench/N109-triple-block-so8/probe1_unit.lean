import Phys.Algebra.LorentzContinuumGenerationOctonionBlockSO8

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- The fourth octonion imaginary unit `ii := iota(iota(Dbl.J))` — the embedded complex unit "i",
    lying OUTSIDE the quaternion span{e₂, ιe₂, ke2je2}. -/
abbrev ii4 : O Cut :=
  (CD.iota (CD.iota (Phys.Cascade.Dbl.J : Phys.Cascade.Dbl Cut)) : O Cut)

-- PROBE 1: ii4 is a unit imaginary (square -1)
example : (ii4 : O Cut) * (ii4 : O Cut) = -1 := by
  ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]

-- PROBE 2: ii4 is imaginary
example : star (ii4 : O Cut) = -(ii4 : O Cut) := by
  ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]

-- PROBE 3: ii4 anticommutes with e₂
example : (CD.e2 : O Cut) * (ii4 : O Cut) = -((ii4 : O Cut) * (CD.e2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

-- PROBE 4: ii4 anticommutes with je2
example : (je2 : O Cut) * (ii4 : O Cut) = -((ii4 : O Cut) * (je2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

-- PROBE 5: ii4 anticommutes with ke2je2
example : (ke2je2 : O Cut) * (ii4 : O Cut) = -((ii4 : O Cut) * (ke2je2 : O Cut)) := by
  ext <;> simp [CD.e2, CD.iota, Phys.Cascade.Dbl.J]

-- PROBE 6: gFormC ii4 ii4 = 1
example : gFormC (ii4 : O Cut) (ii4 : O Cut) = 1 := by
  show reQC ((ii4 : O Cut) * star (ii4 : O Cut)) = 1
  rw [show star (ii4 : O Cut) = -(ii4 : O Cut) by ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]]
  simp only [reQC]
  simp [CD.iota, Phys.Cascade.Dbl.J, CD.mul_re, CD.neg_re]

-- PROBE 7: left-mult square law ii4·(ii4·v) = -v  (needed for biMulComp_negates_u / fixes_common)
example (v : O Cut) : (ii4 : O Cut) * ((ii4 : O Cut) * v) = -v := by
  have h := L_sq_imag (ii4 : O Cut)
    (show star (ii4 : O Cut) = -(ii4 : O Cut) by ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]) v
  rw [h]
  have hN : (CD.iota (CD.Nrm (ii4 : O Cut)) : O Cut) = 1 := by
    rw [show CD.Nrm (ii4 : O Cut) = (1 : H Cut) by
          rw [CD.Nrm_def]; ext <;> simp [CD.iota, Phys.Cascade.Dbl.J]]
    ext <;> simp [CD.iota]
  rw [hN, one_mul]

end

end Phys.Algebra
