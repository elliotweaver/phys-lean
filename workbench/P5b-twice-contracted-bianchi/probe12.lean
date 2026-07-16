import Phys.Algebra.SpacetimeDivergence
import Phys.Algebra.SpacetimeRicci

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def symShear : MetricEnd where
  toFun p := (p.2.1, p.1, 0)
  map_add' p q := by refine Prod.ext rfl (Prod.ext rfl ?_); simp
  map_smul' c p := by refine Prod.ext rfl (Prod.ext rfl ?_); simp

theorem symShear_apply (p : STVC) : symShear p = (p.2.1, p.1, 0) := rfl

example : IsEvCAdjoint timeProj timeProj := by
  intro p q
  simp only [EvC, timeProj_apply]
  rw [gFormC_zero_left, gFormC_zero_right']
  ring

example : IsEvCAdjoint symShear symShear := by
  intro p q
  simp only [EvC, symShear_apply]
  rw [gFormC_zero_left, gFormC_zero_right']
  ring

end

end Phys.Algebra
