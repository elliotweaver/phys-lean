import Phys.Algebra.LorentzContinuumGenerationSO8SubspaceReflection

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- PROBE A: rung dimensions over the derived Cut (mirror the ℚ proofs with the Cut equivalences)
theorem finrank_dbl_eq_two_Cut : Module.finrank Cut (Dbl Cut) = 2 := by
  rw [dblProdEquivCut.finrank_eq, Module.finrank_prod, Module.finrank_self]

theorem finrank_H_eq_four_Cut : Module.finrank Cut (H Cut) = 4 := by
  rw [hProdEquivCut.finrank_eq, Module.finrank_prod, finrank_dbl_eq_two_Cut]

-- PROBE B: THE NAMED GAP — the terminal algebra dimension over the derived Cut
theorem finrank_O_eq_eight_Cut : Module.finrank Cut (O Cut) = 8 := by
  rw [oProdEquivCut.finrank_eq, Module.finrank_prod, finrank_H_eq_four_Cut]

-- PROBE C: STVC = Cut × Cut × O Cut spacetime dimension over the derived field
theorem finrank_STVC : Module.finrank Cut (STVC) = 10 := by
  show Module.finrank Cut (Cut × Cut × O Cut) = 10
  rw [Module.finrank_prod, Module.finrank_prod, Module.finrank_self, finrank_O_eq_eight_Cut]

-- PROBE D: the concrete depth bound — ePerp of a Born-unit is 7-dimensional
theorem ePerp_finrank_value {e : O Cut} (he : gFormC e e = 1) :
    Module.finrank Cut (ePerp e) = 7 := by
  rw [ePerp_finrank he, finrank_O_eq_eight_Cut]

-- PROBE E: operator-space dimension (optional)
theorem finrank_End_O_Cut : Module.finrank Cut (Module.End Cut (O Cut)) = 64 := by
  rw [Module.finrank_linearMap, finrank_O_eq_eight_Cut]

-- PROBE F (W8 teeth): concrete moved-axis complement dimension
theorem ePerp_finrank_witness : Module.finrank Cut (ePerp (ke2je2 : O Cut)) = 7 :=
  ePerp_finrank_value ke2je2_gFormC_self

end

end Phys.Algebra
