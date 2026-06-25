import Phys.Algebra.DerivationAutExpHom
import Phys.Cascade.ForcedStop
import Phys.Foundation.ContinuumComplete
import Phys.Foundation.ContinuumUniform
import Mathlib.Topology.Constructions
import Mathlib.Topology.Algebra.Ring.Basic
import Mathlib.Topology.Algebra.IsUniformGroup.Basic
import Mathlib.Topology.UniformSpace.Cauchy
import Mathlib.Topology.Algebra.Module.Basic

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped Topology

noncomputable section

namespace CD
variable {A : Type*}

def toProd (z : CD A) : A × A := (z.re, z.im)
theorem toProd_inj : Function.Injective (toProd : CD A → A × A) := by
  intro a b h; simp only [toProd, Prod.mk.injEq] at h; cases a; cases b; simp_all

instance instUnif [UniformSpace A] : UniformSpace (CD A) := UniformSpace.comap toProd inferInstance
theorem uniformInducing_toProd [UniformSpace A] :
    IsUniformInducing (toProd : CD A → A × A) := ⟨rfl⟩

instance instComplete [UniformSpace A] [CompleteSpace A] : CompleteSpace (CD A) := by
  rw [completeSpace_iff_isComplete_range uniformInducing_toProd]
  have hr : Set.range (toProd : CD A → A × A) = Set.univ := by
    rw [Set.eq_univ_iff_forall]; intro p; exact ⟨⟨p.1, p.2⟩, rfl⟩
  rw [hr]; exact complete_univ

-- Generic SMul + Module via narCD (base is NonAssocRing+StarRing, like Dbl Cut / H Cut).
attribute [local instance] CD.narCD CD.srCD
instance instSMul {R : Type*} [SMul R A] : SMul R (CD A) := ⟨fun r z => ⟨r • z.re, r • z.im⟩⟩
@[simp] theorem smul_re {R : Type*} [SMul R A] (r : R) (z : CD A) : (r • z).re = r • z.re := rfl
@[simp] theorem smul_im {R : Type*} [SMul R A] (r : R) (z : CD A) : (r • z).im = r • z.im := rfl

@[reducible] def cdModule {R : Type*} [Semiring R] [NonAssocRing A] [StarRing A] [Module R A] :
    Module R (CD A) where
  one_smul := by intro z; ext <;> simp
  mul_smul := by intro a b z; ext <;> simp [mul_smul]
  smul_zero := by intro a; ext <;> simp
  smul_add := by intro a x y; ext <;> simp [smul_add]
  add_smul := by intro a b z; ext <;> simp [add_smul]
  zero_smul := by intro z; ext <;> simp

end CD
end
