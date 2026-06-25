import Phys.Algebra.DerivationAutExpHom
import Phys.Cascade.ForcedStop
import Mathlib.Topology.Constructions
import Mathlib.Topology.Algebra.Ring.Basic
import Mathlib.Topology.UniformSpace.Cauchy

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped Topology

noncomputable section

-- What does Fin 8 → Cut already have for free? (the target carrier for transfer)
example : TopologicalSpace (Fin 8 → Cut) := inferInstance
example : T2Space (Fin 8 → Cut) := inferInstance
example : CompleteSpace (Fin 8 → Cut) := inferInstance
example : UniformSpace (Fin 8 → Cut) := inferInstance
example : ContinuousAdd (Fin 8 → Cut) := inferInstance
example : Module Cut (Fin 8 → Cut) := inferInstance
example : T3Space (Fin 8 → Cut) := inferInstance

-- Is Cut itself T3 / regular?
example : T3Space Cut := inferInstance
example : RegularSpace Cut := inferInstance

-- O Cut algebraic structure available?
attribute [local instance] CD.narCD CD.srCD
example : NonAssocRing (O Cut) := inferInstance
example : StarRing (O Cut) := inferInstance
example (x y : O Cut) : O Cut := x * y

end
