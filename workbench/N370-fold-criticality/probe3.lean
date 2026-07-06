import Phys.Foundation.ContinuumExpDeriv
import Phys.Algebra.CosmoInflationPlateauExclusion

namespace Phys.Foundation.ContinuumQ

open Filter Set
open Phys.Algebra
open scoped Topology BigOperators

noncomputable section

-- const_mul rule
theorem p_const_mul {f : Cut → Cut} {df x : Cut} (a : Cut) (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => a * f y) (a * df) x := by
  unfold CutHasDerivAt at *
  have := hf.const_mul a
  refine this.congr' ?_
  filter_upwards with h; ring

-- neg
theorem p_neg {f : Cut → Cut} {df x : Cut} (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => - f y) (- df) x := by
  unfold CutHasDerivAt at *
  have := hf.neg
  refine this.congr' ?_
  filter_upwards with h; ring

-- sub
theorem p_sub {f g : Cut → Cut} {df dg x : Cut}
    (hf : CutHasDerivAt f df x) (hg : CutHasDerivAt g dg x) :
    CutHasDerivAt (fun y => f y - g y) (df - dg) x := by
  have hng := p_neg hg
  have := hf.add hng
  refine this.congr' ?_
  · unfold CutHasDerivAt at *; filter_upwards with h; ring

-- add-const
theorem p_add_const {f : Cut → Cut} {df x : Cut} (c : Cut) (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => c + f y) df x := by
  have hc := cutHasDerivAt_const c x
  have := hc.add hf
  simpa using this

-- KEY HELPER: derivative of φ ↦ a·cutExp(k·φ) is a·k·cutExp(k·φ), for k ≠ 0.
theorem p_scaleExp (a k φ : Cut) (hk : k ≠ 0) :
    CutHasDerivAt (fun y => a * cutExp (k * y)) (a * (k * cutExp (k * φ))) φ :=
  p_const_mul a (cutExp_scale_hasDerivAt k φ hk)

-- the sum-form of the plateau potential
theorem plateau_sumform (c φ : Cut) :
    plateauApproachPot c φ = 1 - 2 * cutExp ((-c) * φ) + cutExp ((-(2*c)) * φ) := by
  unfold plateauApproachPot
  have h1 : -(c * φ) = (-c) * φ := by ring
  rw [h1]
  set e := cutExp ((-c) * φ) with he
  have h2 : e * e = cutExp ((-(2*c)) * φ) := by
    rw [he, cutExp_add]; congr 1; ring
  have : (1 - e) ^ 2 = 1 - 2 * e + e * e := by ring
  rw [this, h2]

end
end Phys.Foundation.ContinuumQ
