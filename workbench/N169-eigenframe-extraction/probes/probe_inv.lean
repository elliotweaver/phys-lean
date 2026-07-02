import Phys.Algebra.LorentzContinuumGeneralAxisBoostPath

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- The reverse boost `a(−b)` inverts the forward boost `a b` along the same unit axis. -/
theorem genBoostLin_comp_inv (wx : Cut) (wv : O Cut)
    (hw : wx ^ 2 + gFormC wv wv = 1) {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    genBoostLin wx wv a b * genBoostLin wx wv a (-b) = 1 := by
  apply LinearMap.ext; intro p
  obtain ⟨t, x, v⟩ := p
  rw [Module.End.mul_apply, genBoostLin_apply, genBoostLin_apply]
  -- the composite ŵ-component for any scalar d: wx*(x+d*wx) + gFormC (v+d•wv) wv = σ + d
  have key : ∀ d : Cut,
      wx * (x + d * wx) + gFormC (v + d • wv) wv
        = (wx * x + gFormC v wv) + d := by
    intro d
    rw [gFormC_add_left, gFormC_smul_left]
    linear_combination d * hw
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · -- t-coordinate
    show a * (a * t + (-b) * (wx * x + gFormC v wv))
          + b * (wx * (x + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) * wx)
              + gFormC (v + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) • wv) wv) = t
    rw [key]
    linear_combination t * hab
  · -- x-coordinate
    show (x + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) * wx)
          + (b * (a * t + (-b) * (wx * x + gFormC v wv))
              + (a - 1) * (wx * (x + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) * wx)
                  + gFormC (v + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) • wv) wv)) * wx = x
    rw [key]
    linear_combination ((wx * x + gFormC v wv) * wx) * hab
  · -- v-coordinate
    show (v + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) • wv)
          + (b * (a * t + (-b) * (wx * x + gFormC v wv))
              + (a - 1) * (wx * (x + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) * wx)
                  + gFormC (v + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) • wv) wv)) • wv = v
    rw [key]
    -- combine the two wv-scalars; their sum is 0 by a²−b²=1
    rw [add_assoc, ← add_smul]
    have hzero : ((-b) * t + (a - 1) * (wx * x + gFormC v wv))
        + (b * (a * t + (-b) * (wx * x + gFormC v wv))
            + (a - 1) * ((wx * x + gFormC v wv) + ((-b) * t + (a - 1) * (wx * x + gFormC v wv))))
        = 0 := by
      linear_combination (wx * x + gFormC v wv) * hab
    rw [hzero, zero_smul, add_zero]
