import Phys.Cascade.OctonionTopology
import Phys.Foundation.ContinuumTopology
import Phys.Algebra.LorentzContinuumSpectralPath

namespace Phys.Algebra.N152Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- GO-1: do the product-topology instances on STVC resolve?
example : TopologicalSpace STVC := inferInstance
example : TopologicalSpace Cut := inferInstance
example : ContinuousAdd STVC := inferInstance
example : ContinuousSMul Cut STVC := inferInstance
example : T2Space STVC := inferInstance

-- GO-1b: O Cut instances
example : ContinuousAdd (O Cut) := inferInstance
example : ContinuousSMul Cut (O Cut) := inferInstance

-- GO-2: define the operator topology as the induced topology along the coercion to STVC → STVC
-- The coercion ⇑ : Module.End Cut STVC → (STVC → STVC).
example : TopologicalSpace (Module.End Cut STVC) :=
  TopologicalSpace.induced (fun (g : Module.End Cut STVC) => (g : STVC → STVC)) inferInstance

-- GO-3 (the core continuity question): is fun t => (1-t) • A + t • B continuous Cut → Module.End?
-- First, the scalar smul on operators: is fun (t : Cut) => t • (A : Module.End Cut STVC) continuous
-- in the induced topology?  Measure via the Pi/eval characterization on the underlying function.

-- Continuity of t ↦ (1-t) : Cut → Cut
example : Continuous (fun t : Cut => (1 - t)) := by continuity

-- Continuity of affine combination of two FIXED points of STVC (eval at a fixed vector):
example (a b : STVC) : Continuous (fun t : Cut => (1 - t) • a + t • b) := by
  fun_prop

end

end Phys.Algebra.N152Probe
