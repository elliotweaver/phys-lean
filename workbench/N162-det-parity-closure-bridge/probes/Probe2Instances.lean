import Phys.Algebra.LorentzContinuumOctBlockSO8ClosureWord
import Mathlib.LinearAlgebra.Matrix.SchurComplement

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- MEASURE: do the basis / Free / Finite instances resolve over Cut?
example : Module.Free Cut (O Cut) := by infer_instance
example : Module.Finite Cut (O Cut) := by infer_instance
example : Fintype (Module.Free.ChooseBasisIndex Cut (O Cut)) := by infer_instance
example : DecidableEq (Module.Free.ChooseBasisIndex Cut (O Cut)) := by infer_instance

-- the 1-dim basis of Cut over Cut
example : Module.Basis Unit Cut Cut := Module.Basis.singleton Unit Cut

-- the factor maps
example (a : O Cut) : Cut →ₗ[Cut] O Cut := LinearMap.toSpanSingleton Cut (O Cut) a
example (a : O Cut) : O Cut →ₗ[Cut] Cut := (2 * (gFormC a a)⁻¹) • gFormCRight a

end
