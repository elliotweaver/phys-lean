import Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

theorem gFormC_one_right (v : O Cut) : gFormC v (1 : O Cut) = reQC v := by
  unfold gFormC; rw [star_one, mul_one]

theorem gFormC_one_left (v : O Cut) : gFormC (1 : O Cut) v = reQC v := by
  rw [gFormC_symm]; exact gFormC_one_right v

-- the key expansion, term by term, fully reduced
example (v : O Cut) (a : Cut) :
    gFormC (v + a • (1 : O Cut)) (v + a • (1 : O Cut))
      = gFormC v v + 2 * (a * reQC v) + a^2 := by
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right]
  rw [gFormC_smul_right a v (1:O Cut), gFormC_one_right v]
  rw [gFormC_smul_left a (1:O Cut) v, gFormC_one_left v]
  rw [gFormC_smul_left a (1:O Cut) (a • (1:O Cut)), gFormC_smul_right a (1:O Cut) (1:O Cut), gFormC_one]
  ring

end

end Phys.Algebra
