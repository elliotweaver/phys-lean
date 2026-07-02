import Phys.Algebra.TowerGatherFaithfulColourRep

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def colourRepImgP : LieSubalgebra ℚ (Module.End ℚ Vsub) := colourRepV.range

-- OBLIGATION 1 variant A: calc with rfl reconciliation.
example : Module.finrank ℚ colourRepImgP.toSubmodule = 8 := by
  have e := colourRepV.equivRangeOfInjective colourRepV_faithful
  calc Module.finrank ℚ colourRepImgP.toSubmodule
      = Module.finrank ℚ (colourRepV.range) := rfl
    _ = Module.finrank ℚ (colourCentralizer) := e.toLinearEquiv.finrank_eq.symm
    _ = Module.finrank ℚ colourCentralizer.toSubmodule := rfl
    _ = 8 := finrank_colourCentralizer_eq_eight

end

end Phys.Algebra
