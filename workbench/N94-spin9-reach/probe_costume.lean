import Phys.Algebra.LorentzContinuumSpin9Reach
namespace Counterexamples
open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section

-- Probe: surface the bite as a clean numeric `1 = 9` via norm_num after reducing the coordinate.
theorem half_turn_wrong_scale_BOGUS :
    (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
        ((0:Cut),(0:Cut),(CD.iota (CD.e2 : H Cut) : O Cut))).2.2.re.im.re = 9 := by
  rw [biMulFun_e2_fixes_j]
  show (CD.iota (CD.e2 : H Cut) : O Cut).re.im.re = 9
  rw [show (CD.iota (CD.e2 : H Cut) : O Cut).re.im.re = 1 from by simp [CD.iota, CD.e2]]

end
end Counterexamples
