import Phys.Algebra.DerivationAutExpHom
import Phys.Cascade.ForcedStop
import Phys.Foundation.ContinuumComplete
import Phys.Foundation.ContinuumUniform
import Mathlib.Topology.Constructions
import Mathlib.Topology.Algebra.Ring.Basic
import Mathlib.Topology.Algebra.Star
import Mathlib.Topology.Algebra.IsUniformGroup.Basic
import Mathlib.Topology.UniformSpace.Cauchy
import Mathlib.Topology.Algebra.InfiniteSum.Ring

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped Topology

noncomputable section

-- ===== Dbl layer (base, over Cut) =====
namespace Dbl
variable {R : Type*} [CommRing R]
def toProd (z : Dbl R) : R × R := (z.re, z.im)
theorem toProd_inj : Function.Injective (toProd : Dbl R → R × R) := by
  intro a b h; simp only [toProd, Prod.mk.injEq] at h; cases a; cases b; simp_all
instance instTop [TopologicalSpace R] : TopologicalSpace (Dbl R) :=
  TopologicalSpace.induced toProd inferInstance
theorem continuous_toProd [TopologicalSpace R] : Continuous (toProd : Dbl R → R × R) :=
  continuous_induced_dom
theorem continuous_re [TopologicalSpace R] : Continuous (Dbl.re : Dbl R → R) :=
  continuous_fst.comp continuous_toProd
theorem continuous_im [TopologicalSpace R] : Continuous (Dbl.im : Dbl R → R) :=
  continuous_snd.comp continuous_toProd
theorem isEmbedding_toProd [TopologicalSpace R] : Topology.IsEmbedding (toProd : Dbl R → R × R) :=
  ⟨⟨rfl⟩, toProd_inj⟩
theorem continuous_mk [TopologicalSpace R] {X : Type*} [TopologicalSpace X]
    (f g : X → R) (hf : Continuous f) (hg : Continuous g) :
    Continuous (fun x => (⟨f x, g x⟩ : Dbl R)) := by
  rw [continuous_induced_rng]; exact hf.prodMk hg
instance instT2 [TopologicalSpace R] [T2Space R] : T2Space (Dbl R) := isEmbedding_toProd.t2Space
instance instT3 [TopologicalSpace R] [T3Space R] : T3Space (Dbl R) := isEmbedding_toProd.t3Space
instance instContAdd [TopologicalSpace R] [ContinuousAdd R] : ContinuousAdd (Dbl R) :=
  ⟨continuous_mk _ _ ((continuous_re.comp continuous_fst).add (continuous_re.comp continuous_snd))
    ((continuous_im.comp continuous_fst).add (continuous_im.comp continuous_snd))⟩
instance instContNeg [TopologicalSpace R] [ContinuousNeg R] : ContinuousNeg (Dbl R) :=
  ⟨continuous_mk _ _ continuous_re.neg continuous_im.neg⟩
-- Dbl star = (re, -im): needs ContinuousNeg only.
instance instContStar [TopologicalSpace R] [ContinuousNeg R] : ContinuousStar (Dbl R) :=
  ⟨continuous_mk _ _ continuous_re continuous_im.neg⟩
-- Dbl mul = (re*re - im*im, re*im + im*re): needs ContinuousMul + Add + Neg.
instance instContMul [TopologicalSpace R] [ContinuousMul R] [ContinuousAdd R] [ContinuousNeg R] :
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

-- ===== CD layer =====
namespace CD
variable {A : Type*}
def toProd (z : CD A) : A × A := (z.re, z.im)
theorem toProd_inj : Function.Injective (toProd : CD A → A × A) := by
  intro a b h; simp only [toProd, Prod.mk.injEq] at h; cases a; cases b; simp_all
instance instTop [TopologicalSpace A] : TopologicalSpace (CD A) :=
  TopologicalSpace.induced toProd inferInstance
theorem continuous_toProd [TopologicalSpace A] : Continuous (toProd : CD A → A × A) :=
  continuous_induced_dom
theorem continuous_re [TopologicalSpace A] : Continuous (CD.re : CD A → A) :=
  continuous_fst.comp continuous_toProd
theorem continuous_im [TopologicalSpace A] : Continuous (CD.im : CD A → A) :=
  continuous_snd.comp continuous_toProd
theorem isEmbedding_toProd [TopologicalSpace A] : Topology.IsEmbedding (toProd : CD A → A × A) :=
  ⟨⟨rfl⟩, toProd_inj⟩
theorem continuous_mk [TopologicalSpace A] {X : Type*} [TopologicalSpace X]
    (f g : X → A) (hf : Continuous f) (hg : Continuous g) :
    Continuous (fun x => (⟨f x, g x⟩ : CD A)) := by
  rw [continuous_induced_rng]; exact hf.prodMk hg
instance instT2 [TopologicalSpace A] [T2Space A] : T2Space (CD A) := isEmbedding_toProd.t2Space
instance instT3 [TopologicalSpace A] [T3Space A] : T3Space (CD A) := isEmbedding_toProd.t3Space
instance instContAdd [TopologicalSpace A] [Add A] [ContinuousAdd A] : ContinuousAdd (CD A) :=
  ⟨continuous_mk _ _ ((continuous_re.comp continuous_fst).add (continuous_re.comp continuous_snd))
    ((continuous_im.comp continuous_fst).add (continuous_im.comp continuous_snd))⟩
instance instContNeg [TopologicalSpace A] [Neg A] [ContinuousNeg A] : ContinuousNeg (CD A) :=
  ⟨continuous_mk _ _ continuous_re.neg continuous_im.neg⟩
instance instContStar [TopologicalSpace A] [Star A] [Neg A] [ContinuousStar A] [ContinuousNeg A] :
    ContinuousStar (CD A) :=
  ⟨continuous_mk _ _ (continuous_star.comp continuous_re) continuous_im.neg⟩
instance instContMul [TopologicalSpace A] [Mul A] [Add A] [Neg A] [Star A]
    [ContinuousMul A] [ContinuousAdd A] [ContinuousNeg A] [ContinuousStar A] : ContinuousMul (CD A) := by
  constructor
  apply continuous_mk
  · have hzre : Continuous (fun p : CD A × CD A => p.1.re) := continuous_re.comp continuous_fst
    have hzim : Continuous (fun p : CD A × CD A => p.1.im) := continuous_im.comp continuous_fst
    have hwre : Continuous (fun p : CD A × CD A => p.2.re) := continuous_re.comp continuous_snd
    have hwim : Continuous (fun p : CD A × CD A => p.2.im) := continuous_im.comp continuous_snd
    exact (hzre.mul hwre).add ((hwim.star.mul hzim).neg)
  · have hzre : Continuous (fun p : CD A × CD A => p.1.re) := continuous_re.comp continuous_fst
    have hzim : Continuous (fun p : CD A × CD A => p.1.im) := continuous_im.comp continuous_fst
    have hwre : Continuous (fun p : CD A × CD A => p.2.re) := continuous_re.comp continuous_snd
    have hwim : Continuous (fun p : CD A × CD A => p.2.im) := continuous_im.comp continuous_snd
    exact (hwim.mul hzre).add (hzim.mul hwre.star)
end CD

-- ===== Assemble on O Cut =====
attribute [local instance] CD.narCD CD.srCD

-- Does the topology synthesize for O Cut?
example : TopologicalSpace (O Cut) := inferInstance
example : T3Space (O Cut) := inferInstance
example : ContinuousAdd (O Cut) := inferInstance
example : ContinuousMul (O Cut) := inferInstance

-- IsTopologicalSemiring from ContinuousAdd + ContinuousMul (explicit, generic).
instance instTopSemiring {S : Type*} [TopologicalSpace S] [NonUnitalNonAssocSemiring S]
    [ContinuousAdd S] [ContinuousMul S] : IsTopologicalSemiring S := ⟨⟩
example : IsTopologicalSemiring (O Cut) := inferInstance

end
