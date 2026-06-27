import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle
import Phys.Algebra.LorentzContinuumGenerationSO8RankInduction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## PROBE A: polarization helper — diagonal gFormC-preservation ⟹ bilinear preservation. -/

-- A Cut-linear self-map of O Cut that preserves the diagonal form preserves it bilinearly.
theorem polarize_probe (T : O Cut →ₗ[Cut] O Cut)
    (hdiag : ∀ v : O Cut, gFormC (T v) (T v) = gFormC v v) (a b : O Cut) :
    gFormC (T a) (T b) = gFormC a b := by
  have hab := hdiag (a + b)
  rw [map_add] at hab
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right] at hab
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right] at hab
  rw [hdiag a, hdiag b] at hab
  -- hab : gFormC a a + (gFormC (T a) (T b) + (gFormC (T b) (T a) + gFormC b b))
  --       = gFormC a a + (gFormC a b + (gFormC b a + gFormC b b))
  rw [gFormC_symm (T b) (T a), gFormC_symm b a] at hab
  -- now: gFormC a a + (X + (X + gFormC b b)) = gFormC a a + (Y + (Y + gFormC b b))
  linarith [hab]

end

end Phys.Algebra
