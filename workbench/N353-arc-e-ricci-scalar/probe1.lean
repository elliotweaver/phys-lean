import Phys.Algebra.SpacetimeRicci
import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Phys.Algebra.LorentzContinuumCliffordSpinCover
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- PROBE 1: infrastructure.

example : FiniteDimensional Cut STVC := by infer_instance

theorem BvCBilin_nondeg : (BvCBilin : BilinForm Cut STVC).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro p hp
    apply BvC_nondegenerate p
    intro q
    have := hp q
    simpa [BvCBilin_apply] using this
  · intro q hq
    apply BvC_nondegenerate q
    intro p
    have := hq p
    rw [BvC_symm]
    simpa [BvCBilin_apply] using this

end

end Phys.Algebra
