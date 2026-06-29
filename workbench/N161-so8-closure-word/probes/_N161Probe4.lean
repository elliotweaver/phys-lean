import Phys.Algebra.LorentzContinuumOctBlockSO8Exhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- W8 witness: gFormC (e2+je2) (e2+je2) = 2 ≠ 0  (the non-orthonormal pair's norm)
example : gFormC ((CD.e2:O Cut) + (je2:O Cut)) ((CD.e2:O Cut) + (je2:O Cut)) = 2 := by
  have h1 : gFormC (je2:O Cut) (CD.e2:O Cut) = 0 := by
    rw [gFormC_symm]; exact octDeflate_e2_je2_gFormC_zero
  simp only [gFormC_add_left, gFormC_add_right, je2_gFormC_self, e2_gFormC_self,
    octDeflate_e2_je2_gFormC_zero, h1]
  ring

-- the bireflection moves b: (houseHolder e2 * houseHolder (e2+je2)) (e2+je2) = e2 - je2
example :
    (houseHolder (CD.e2:O Cut) * houseHolder ((CD.e2:O Cut) + (je2:O Cut)))
      ((CD.e2:O Cut) + (je2:O Cut)) = (CD.e2:O Cut) - (je2:O Cut) := by
  have hbb : gFormC ((CD.e2:O Cut) + (je2:O Cut)) ((CD.e2:O Cut) + (je2:O Cut)) = 2 := by
    rw [gFormC_add_left, gFormC_add_right, gFormC_add_right, e2_gFormC_self,
        octDeflate_e2_je2_gFormC_zero, gFormC_symm (je2:O Cut) (CD.e2:O Cut),
        octDeflate_e2_je2_gFormC_zero, je2_gFormC_self]
    ring
  have hbne : gFormC ((CD.e2:O Cut) + (je2:O Cut)) ((CD.e2:O Cut) + (je2:O Cut)) ≠ 0 := by
    rw [hbb]; norm_num
  rw [Module.End.mul_apply, houseHolder_neg_self hbne]
  rw [show -((CD.e2:O Cut) + (je2:O Cut)) = (-1:Cut) • ((CD.e2:O Cut) + (je2:O Cut)) by module]
  rw [map_smul, houseHolder_apply, e2_gFormC_self]
  rw [gFormC_add_right, e2_gFormC_self, octDeflate_e2_je2_gFormC_zero]
  rw [show (2 * (1:Cut)⁻¹ * (1 + 0)) = 2 by norm_num]
  module

end
end Phys.Algebra
