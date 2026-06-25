import Phys.Algebra.DerivationOTangent

namespace Counterexamples
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Filter
open scoped Topology
noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- BOGUS: derivative is 2•(D' x) instead of D' x. Route through banked, leaves 2•(D'x)=D'x (false).
theorem scratch_BOGUS (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Tendsto (fun t : Cut => t⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x))
      (𝓝[≠] (0 : Cut)) (𝓝 ((2 : Cut) • D' x)) := by
  have h := expO_tangent D' x
  convert h using 2

end
end Counterexamples
