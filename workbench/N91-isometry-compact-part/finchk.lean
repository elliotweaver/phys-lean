import Phys.Algebra.LorentzContinuumIsomMetricChar
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD Phys.Algebra.dblModuleCut
noncomputable section
-- confirm STVC is a finite-dim module over the DERIVED Cut (not Mathlib ℝ)
example : Module.Finite Cut STVC := by infer_instance
#print axioms Phys.Algebra.linIsom_inverse_metric_condition
end
end Phys.Algebra
