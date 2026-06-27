import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle
import Phys.Algebra.LorentzContinuumGenerationSO8RankInduction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- THE GENERAL COMMUTATION: a Cut-linear operator K that (i) fixes the time coord t,
    (ii) fixes the x coord, (iii) maps (t,x,v) to (t,x, Kblock v) acting only on the v-block,
    (iv) fixes the real octonion axis (Kblock 1 = 1), (v) preserves reQC,
    COMMUTES with planeRotLin c s.  (The single real-axis plane and the v-block-fixing-1 sector
    are complementary, so the sandwich degenerates.) -/
theorem commute_probe (K : Module.End Cut STVC)
    (Kblock : O Cut →ₗ[Cut] O Cut)
    (hK : ∀ t x : Cut, ∀ v : O Cut, K (t, x, v) = (t, x, Kblock v))
    (h1 : Kblock 1 = 1)
    (hre : ∀ v : O Cut, reQC (Kblock v) = reQC v)
    (c s : Cut) :
    K * planeRotLin c s = planeRotLin c s * K := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [Module.End.mul_apply, Module.End.mul_apply]
  rw [planeRotLin_apply, hK, hK, planeRotLin_apply]
  -- LHS: K (t, cx - s reQC v, v + α•1) = (t, cx-s reQC v, Kblock(v + α•1))
  -- RHS: planeRotLin (t, x, Kblock v) = (t, cx - s reQC(Kblock v), Kblock v + α'•1)
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show c * x - s * reQC v = c * x - s * reQC (Kblock v)
    rw [hre]
  · show Kblock (v + (s * x + (c - 1) * reQC v) • (1 : O Cut))
        = Kblock v + (s * x + (c - 1) * reQC (Kblock v)) • (1 : O Cut)
    rw [map_add, map_smul, h1, hre]

end

end Phys.Algebra
