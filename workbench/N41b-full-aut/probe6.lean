import Phys.Algebra.DerivationAutExpHom
import Phys.Cascade.ForcedStop
import Phys.Foundation.ContinuumComplete
import Phys.Foundation.ContinuumUniform
import Mathlib.Topology.Constructions
import Mathlib.Topology.Algebra.Ring.Basic
import Mathlib.Topology.Algebra.Module.Basic
import Mathlib.Topology.Algebra.MulAction

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped Topology

noncomputable section

-- Measure: does Cut have ContinuousSMul over itself / is smul continuous?
example : ContinuousSMul Cut Cut := inferInstance

namespace CD
variable {A : Type*}
def toProd (z : CD A) : A × A := (z.re, z.im)
instance instTop [TopologicalSpace A] : TopologicalSpace (CD A) :=
  TopologicalSpace.induced toProd inferInstance
theorem continuous_toProd [TopologicalSpace A] : Continuous (toProd : CD A → A × A) :=
  continuous_induced_dom
theorem continuous_re [TopologicalSpace A] : Continuous (CD.re : CD A → A) :=
  continuous_fst.comp continuous_toProd
theorem continuous_im [TopologicalSpace A] : Continuous (CD.im : CD A → A) :=
  continuous_snd.comp continuous_toProd
theorem continuous_mk [TopologicalSpace A] {X : Type*} [TopologicalSpace X]
    (f g : X → A) (hf : Continuous f) (hg : Continuous g) :
    Continuous (fun x => (⟨f x, g x⟩ : CD A)) := by
  rw [continuous_induced_rng]; exact hf.prodMk hg

-- generic SMul
instance instSMul {R : Type*} [SMul R A] : SMul R (CD A) := ⟨fun r z => ⟨r • z.re, r • z.im⟩⟩
@[simp] theorem smul_re {R : Type*} [SMul R A] (r : R) (z : CD A) : (r • z).re = r • z.re := rfl
@[simp] theorem smul_im {R : Type*} [SMul R A] (r : R) (z : CD A) : (r • z).im = r • z.im := rfl

-- ContinuousSMul transfer: scalar action continuous if base action continuous.
instance instContSMul {R : Type*} [TopologicalSpace R] [TopologicalSpace A] [SMul R A]
    [ContinuousSMul R A] : ContinuousSMul R (CD A) := by
  constructor
  apply continuous_mk
  · exact (continuous_fst).smul (continuous_re.comp continuous_snd)
  · exact (continuous_fst).smul (continuous_im.comp continuous_snd)

end CD
end
