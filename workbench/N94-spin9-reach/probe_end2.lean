import Phys.Algebra.LorentzContinuumSpin9
import Phys.Algebra.Alternative
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- inspect how (f*g) p reduces for Function.End
example (f g : Function.End STVC) (p : STVC) : (f * g) p = f (g p) := by
  rfl
example (p : STVC) : (1 : Function.End STVC) p = p := by rfl
end
end Phys.Algebra
