import Phys.Algebra.DerivationAutExpHom
import Phys.Cascade.ForcedStop
import Phys.Foundation.ContinuumComplete
import Phys.Foundation.ContinuumUniform
import Mathlib.Topology.Constructions
import Mathlib.Topology.Algebra.Ring.Basic
import Mathlib.Topology.Algebra.IsUniformGroup.Basic
import Mathlib.Topology.UniformSpace.Cauchy
import Mathlib.Topology.Algebra.InfiniteSum.Ring

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped Topology

noncomputable section

-- ===== Dbl layer (uniform design) =====
namespace Dbl
variable {R : Type*} [CommRing R]
def toProd (z : Dbl R) : R × R := (z.re, z.im)
theorem toProd_inj : Function.Injective (toProd : Dbl R → R × R) := by
  intro a b h; simp only [toProd, Prod.mk.injEq] at h; cases a; cases b; simp_all
instance instUnif [UniformSpace R] : UniformSpace (Dbl R) := UniformSpace.comap toProd inferInstance
theorem topology_eq_induced [UniformSpace R] :
    (instUnif : UniformSpace (Dbl R)).toTopologicalSpace
      = TopologicalSpace.induced toProd inferInstance := rfl
theorem isUniformInducing_toProd [UniformSpace R] :
    IsUniformInducing (toProd : Dbl R → R × R) := ⟨rfl⟩
theorem continuous_toProd [UniformSpace R] : Continuous (toProd : Dbl R → R × R) :=
  isUniformInducing_toProd.uniformContinuous.continuous
theorem continuous_re [UniformSpace R] : Continuous (Dbl.re : Dbl R → R) :=
  continuous_fst.comp continuous_toProd
theorem continuous_im [UniformSpace R] : Continuous (Dbl.im : Dbl R → R) :=
  continuous_snd.comp continuous_toProd
theorem continuous_mk [UniformSpace R] {X : Type*} [TopologicalSpace X]
    (f g : X → R) (hf : Continuous f) (hg : Continuous g) :
    Continuous (fun x => (⟨f x, g x⟩ : Dbl R)) := by
  rw [continuous_def]; intro s hs
  rw [topology_eq_induced, isOpen_induced_iff] at hs
  obtain ⟨t, ht, rfl⟩ := hs
  exact (hf.prodMk hg).isOpen_preimage t ht
instance instComplete [UniformSpace R] [CompleteSpace R] : CompleteSpace (Dbl R) := by
  rw [completeSpace_iff_isComplete_range isUniformInducing_toProd]
  have hr : Set.range (toProd : Dbl R → R × R) = Set.univ := by
    rw [Set.eq_univ_iff_forall]; intro p; exact ⟨⟨p.1, p.2⟩, rfl⟩
  rw [hr]; exact complete_univ
instance instT2 [UniformSpace R] [T2Space R] : T2Space (Dbl R) :=
  (Topology.IsEmbedding.mk ⟨topology_eq_induced⟩ toProd_inj).t2Space
instance instContMul [UniformSpace R] [ContinuousMul R] [ContinuousAdd R] [ContinuousNeg R] :
    ContinuousMul (Dbl R) := by
  constructor
  apply continuous_mk
  · have hzre : Continuous (fun p : Dbl R × Dbl R => p.1.re) := continuous_re.comp continuous_fst
    have hzim : Continuous (fun p : Dbl R × Dbl R => p.1.im) := continuous_im.comp continuous_fst
    have hwre : Continuous (fun p : Dbl R × Dbl R => p.2.re) := continuous_re.comp continuous_snd
    have hwim : Continuous (fun p : Dbl R × Dbl R => p.2.im) := continuous_im.comp continuous_snd
    simp only [sub_eq_add_neg]
    exact (hzre.mul hwre).add (hzim.mul hwim).neg
  · have hzre : Continuous (fun p : Dbl R × Dbl R => p.1.re) := continuous_re.comp continuous_fst
    have hzim : Continuous (fun p : Dbl R × Dbl R => p.1.im) := continuous_im.comp continuous_fst
    have hwre : Continuous (fun p : Dbl R × Dbl R => p.2.re) := continuous_re.comp continuous_snd
    have hwim : Continuous (fun p : Dbl R × Dbl R => p.2.im) := continuous_im.comp continuous_snd
    exact (hzre.mul hwim).add (hzim.mul hwre)
end Dbl

example : CompleteSpace (Dbl Cut) := inferInstance
example : T2Space (Dbl Cut) := inferInstance
example : ContinuousMul (Dbl Cut) := inferInstance

end
