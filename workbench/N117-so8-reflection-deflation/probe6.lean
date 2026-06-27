import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section
open scoped BigOperators

-- scaling: (s•m)*(v*(s•m)) = s^2 • (m*(v*m))  via smulCompat_oCut twice
theorem biMul_scale (s : Cut) (m v : O Cut) :
    (s • m) * (v * (s • m)) = (s * s) • (m * (v * m)) := by
  rw [smulCompat_oCut.hr s v m, smulCompat_oCut.hl s m (s • (v * m)),
      smulCompat_oCut.hr s m (v * m), smul_smul]

-- gFormC (s•m)(s•m) = s^2 * gFormC m m
theorem gFormC_smul_smul (s : Cut) (m : O Cut) :
    gFormC (s • m) (s • m) = (s * s) * gFormC m m := by
  rw [gFormC_smul_left, gFormC_smul_right]; ring

-- star (s • z) = s • star z over Cut (s : Cut scalar)
example (s : Cut) (z : O Cut) : star (s • z) = s • star z := by
  exact star_smul' s z

end
end Phys.Algebra
