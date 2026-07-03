import Phys.Algebra.TowerGatherFaithfulColourRep
import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

namespace Phys.Algebra
open scoped Classical
open Phys.Cascade
set_option synthInstance.maxHeartbeats 400000

-- Does the banked colourVFun still typecheck here (both import sets present)?
example (D : colourCentralizer) : Module.End ℚ Vsub := colourVFun D
example (D : colourCentralizer) : Module.End ℚ Vsub := colourRepV D

-- Does the generic dimension bound accept an arbitrary V?
example : True := trivial

-- Does gBil.restrict Vsub as a BilinForm ℚ Vsub work + skew for colourRepV?
noncomputable def bV : BilinForm ℚ Vsub := gBil.restrict Vsub

end Phys.Algebra
