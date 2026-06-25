import Phys.Cascade.OctonionTopology
import Phys.Algebra.DerivationLeibnizPow
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section
attribute [local instance] CD.narCD CD.srCD
-- confirm O Cut = CD (CD (Dbl Cut)) and B = Dbl Cut is CommRing + StarRing
example : O Cut = CD (CD (Dbl Cut)) := rfl
example : CommRing (Dbl Cut) := inferInstance
example : StarRing (Dbl Cut) := inferInstance
-- the IsDeriv predicate lives at Module.End ℤ (CD (CD (Dbl Cut))) = Module.End ℤ (O Cut)
example (D : Module.End ℤ (CD (CD (Dbl Cut)))) (x : O Cut) : O Cut := (D^3) x
-- the Cut-scalar action on O Cut
example (c : Cut) (x : O Cut) : O Cut := c • x
end
