import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

-- isolate the v-block congr to see if it emits the Try this
theorem axisRotLin_comp_same_axis (e : O Cut) (he : gFormC e e = 1) (c1 s1 c2 s2 : Cut) :
    axisRotLin e c1 s1 * axisRotLin e c2 s2
      = axisRotLin e (c1 * c2 - s1 * s2) (c1 * s2 + s1 * c2) := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [Module.End.mul_apply, axisRotLin_apply, axisRotLin_apply, axisRotLin_apply]
  have hread : gFormC (v + (s2 * x + (c2 - 1) * gFormC v e) • e) e
      = c2 * gFormC v e + s2 * x := by
    rw [gFormC_add_left, gFormC_smul_left, he]; ring
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show c1 * (c2 * x - s2 * gFormC v e) - s1 * gFormC (v + (s2 * x + (c2 - 1) * gFormC v e) • e) e
        = (c1 * c2 - s1 * s2) * x - (c1 * s2 + s1 * c2) * gFormC v e
    rw [hread]; ring
  · show (v + (s2 * x + (c2 - 1) * gFormC v e) • e)
          + (s1 * (c2 * x - s2 * gFormC v e)
             + (c1 - 1) * gFormC (v + (s2 * x + (c2 - 1) * gFormC v e) • e) e) • e
        = v + ((c1 * s2 + s1 * c2) * x + ((c1 * c2 - s1 * s2) - 1) * gFormC v e) • e
    rw [hread, add_assoc, ← add_smul]
    congr 1
    ring

end
end Phys.Algebra
