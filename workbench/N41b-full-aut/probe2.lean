import Phys.Algebra.DerivationAutExpHom
import Phys.Cascade.ForcedStop
import Phys.Foundation.ContinuumComplete
import Mathlib.Topology.Constructions
import Mathlib.Topology.Algebra.Ring.Basic
import Mathlib.Topology.Algebra.IsUniformGroup.Basic
import Mathlib.Topology.UniformSpace.Cauchy

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped Topology

noncomputable section

namespace CD

variable {A : Type*}

def toProd (z : CD A) : A × A := (z.re, z.im)

theorem toProd_injective : Function.Injective (toProd : CD A → A × A) := by
  intro a b h
  simp only [toProd, Prod.mk.injEq] at h
  cases a; cases b; simp_all

-- Topology via induced from the pair projection.
instance instTop [TopologicalSpace A] : TopologicalSpace (CD A) :=
  TopologicalSpace.induced toProd inferInstance

theorem isInducing_toProd [TopologicalSpace A] :
    Topology.IsInducing (toProd : CD A → A × A) := ⟨rfl⟩

theorem isEmbedding_toProd [TopologicalSpace A] :
    Topology.IsEmbedding (toProd : CD A → A × A) :=
  ⟨isInducing_toProd, toProd_injective⟩

-- T2 transfer
instance instT2 [TopologicalSpace A] [T2Space A] : T2Space (CD A) :=
  isEmbedding_toProd.t2Space

-- ContinuousAdd transfer (toProd is an add hom + embedding)
example [TopologicalSpace A] [Add A] [ContinuousAdd A] : Continuous (toProd : CD A → A × A) :=
  continuous_induced_dom

end CD
end
