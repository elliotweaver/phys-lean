import Phys.Algebra.DerivationAutExpHom
import Phys.Cascade.ForcedStop
import Phys.Foundation.ContinuumComplete
import Phys.Foundation.ContinuumUniform
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
theorem toProd_inj : Function.Injective (toProd : CD A → A × A) := by
  intro a b h; simp only [toProd, Prod.mk.injEq] at h; cases a; cases b; simp_all

-- Define ONLY the UniformSpace via comap; the topology comes from .toTopologicalSpace.
instance instUnif [UniformSpace A] : UniformSpace (CD A) := UniformSpace.comap toProd inferInstance

-- Is the induced topology defeq to the comap-uniformity's topology?
example [UniformSpace A] :
    (instUnif : UniformSpace (CD A)).toTopologicalSpace
      = TopologicalSpace.induced toProd inferInstance := rfl

theorem isUniformInducing_toProd [UniformSpace A] :
    IsUniformInducing (toProd : CD A → A × A) := ⟨rfl⟩

theorem continuous_toProd [UniformSpace A] : Continuous (toProd : CD A → A × A) :=
  isUniformInducing_toProd.uniformContinuous.continuous

instance instComplete [UniformSpace A] [CompleteSpace A] : CompleteSpace (CD A) := by
  rw [completeSpace_iff_isComplete_range isUniformInducing_toProd]
  have hr : Set.range (toProd : CD A → A × A) = Set.univ := by
    rw [Set.eq_univ_iff_forall]; intro p; exact ⟨⟨p.1, p.2⟩, rfl⟩
  rw [hr]; exact complete_univ

end CD

-- Now Dbl layer too with uniform.
namespace Dbl
variable {R : Type*} [CommRing R]
def toProd (z : Dbl R) : R × R := (z.re, z.im)
theorem toProd_inj : Function.Injective (toProd : Dbl R → R × R) := by
  intro a b h; simp only [toProd, Prod.mk.injEq] at h; cases a; cases b; simp_all
instance instUnif [UniformSpace R] : UniformSpace (Dbl R) := UniformSpace.comap toProd inferInstance
theorem isUniformInducing_toProd [UniformSpace R] :
    IsUniformInducing (toProd : Dbl R → R × R) := ⟨rfl⟩
instance instComplete [UniformSpace R] [CompleteSpace R] : CompleteSpace (Dbl R) := by
  rw [completeSpace_iff_isComplete_range isUniformInducing_toProd]
  have hr : Set.range (toProd : Dbl R → R × R) = Set.univ := by
    rw [Set.eq_univ_iff_forall]; intro p; exact ⟨⟨p.1, p.2⟩, rfl⟩
  rw [hr]; exact complete_univ
end Dbl

attribute [local instance] CD.narCD CD.srCD

-- Does CompleteSpace (O Cut) synthesize through both layers?
example : UniformSpace (O Cut) := inferInstance
example : CompleteSpace (O Cut) := inferInstance
example : TopologicalSpace (O Cut) := inferInstance

end
