import Phys.Algebra.OctonionCoassociative4Form
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.DerivationCompact

namespace Phys.Algebra.ProbeN221c

open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD

abbrev wa : O ℚ := (CD.iota (ιJ ℚ) : O ℚ)
abbrev wb : O ℚ := (CD.iota (CD.e2 : H ℚ) : O ℚ)
abbrev wc : O ℚ := (CD.e2 : O ℚ)

-- Candidate W8 tooth: the g₂-equivariance RHS sum at DI (=innerDerivQ hI) on the witness,
-- coordinate im.im.im. Measure whether it is definite/nonzero.
set_option maxHeartbeats 2000000 in
theorem measure_di_coord :
    (assoc (DI.1 wa) wb wc + assoc wa (DI.1 wb) wc + assoc wa wb (DI.1 wc)).im.im.im
      = (DI.1 (assoc wa wb wc)).im.im.im := by
  rw [assoc_derivQ_equivariant DI.1 DI.2 wa wb wc]

-- simplest non-vacuity: the coassoc4 invariance is non-vacuous because assoc is nonzero.
-- Anchor the costume on the banked witness coordinate = 2 (like N220 C252).
set_option maxHeartbeats 2000000 in
theorem witness_coord_is_two :
    (assoc wa wb wc).im.im.im = 2 :=
  Phys.Algebra.assoc_witness_coord

end Phys.Algebra.ProbeN221c
