import Phys.Algebra.LorentzContinuumReseed

namespace Probe

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def u0 : STVC := ((1:Cut), (0:Cut), (0:O Cut))

theorem u0_unit : EvC u0 u0 = 1 := by
  show (1:Cut)*1 + (0:Cut)*0 + gFormC (0:O Cut) 0 = 1
  rw [gFormC_zero_left]; ring

theorem finrank_stvc : Module.finrank Cut STVC = 10 := by
  show Module.finrank Cut (Cut × Cut × O Cut) = 10
  rw [Module.finrank_prod, Module.finrank_prod, Module.finrank_self,
    oProdEquivCut.finrank_eq, Module.finrank_prod, hProdEquivCut.finrank_eq,
    Module.finrank_prod, dblProdEquivCut.finrank_eq, Module.finrank_prod, Module.finrank_self]

-- the TRUE codim-one drop: finrank (uPerp u0) = 10 - 1 = 9
theorem true_drop : Module.finrank Cut (uPerp u0) = 9 := by
  rw [uPerp_finrank u0_unit, finrank_stvc]

-- BOGUS: claim it's 14 → reduces to 9 = 14
theorem bogus_drop : Module.finrank Cut (uPerp u0) = 14 := by
  rw [uPerp_finrank u0_unit, finrank_stvc]

end

end Probe
