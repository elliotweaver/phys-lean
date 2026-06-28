import Phys.Algebra.LorentzContinuumOctStabilizerG2SecondAut

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- Probe the automorphism group instance and the mul convention.
example : Group (O Cut ≃ₗ[Cut] O Cut) := by infer_instance

-- What is the mul convention?  Check (f * g) x = ?
example (f g : O Cut ≃ₗ[Cut] O Cut) (x : O Cut) : (f * g) x = f (g x) := by
  rfl

-- one = refl?
example : (1 : O Cut ≃ₗ[Cut] O Cut) = LinearEquiv.refl Cut (O Cut) := by rfl

#check @LinearEquiv.automorphismGroup

end
end Phys.Algebra
