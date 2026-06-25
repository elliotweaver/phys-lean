import Phys.Algebra.DerivationAutExpHom
import Phys.Cascade.ForcedStop
import Phys.Foundation.ContinuumComplete
import Mathlib.Topology.Constructions
import Mathlib.Topology.Algebra.Ring.Basic
import Mathlib.Topology.Algebra.Star
import Mathlib.Topology.Algebra.IsUniformGroup.Basic

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped Topology

noncomputable section

namespace CD
variable {A : Type*}

def toProd (z : CD A) : A × A := (z.re, z.im)

instance instTop [TopologicalSpace A] : TopologicalSpace (CD A) :=
  TopologicalSpace.induced toProd inferInstance

theorem continuous_toProd [TopologicalSpace A] : Continuous (toProd : CD A → A × A) :=
  continuous_induced_dom

theorem continuous_re [TopologicalSpace A] : Continuous (CD.re : CD A → A) :=
  (continuous_fst.comp continuous_toProd)

theorem continuous_im [TopologicalSpace A] : Continuous (CD.im : CD A → A) :=
  (continuous_snd.comp continuous_toProd)

-- to prove continuity INTO CD A, use continuous_induced_rng: continuity of toProd ∘ f
theorem continuous_mk [TopologicalSpace A] {X : Type*} [TopologicalSpace X]
    (f g : X → A) (hf : Continuous f) (hg : Continuous g) :
    Continuous (fun x => (⟨f x, g x⟩ : CD A)) := by
  rw [continuous_induced_rng]
  exact (hf.prodMk hg)

-- ContinuousAdd transfer
instance instContAdd [TopologicalSpace A] [Add A] [ContinuousAdd A] : ContinuousAdd (CD A) := by
  constructor
  apply continuous_mk
  · exact (continuous_re.comp continuous_fst).add (continuous_re.comp continuous_snd)
  · exact (continuous_im.comp continuous_fst).add (continuous_im.comp continuous_snd)

-- ContinuousNeg transfer
instance instContNeg [TopologicalSpace A] [Neg A] [ContinuousNeg A] : ContinuousNeg (CD A) := by
  constructor
  apply continuous_mk
  · exact (continuous_re).neg
  · exact (continuous_im).neg

-- ContinuousStar transfer (star z = ⟨star z.re, -z.im⟩)
instance instContStar [TopologicalSpace A] [Star A] [Neg A] [ContinuousStar A] [ContinuousNeg A] :
    ContinuousStar (CD A) := by
  constructor
  apply continuous_mk
  · exact continuous_star.comp continuous_re
  · exact (continuous_im).neg

-- ★ ContinuousMul transfer — the W9 crux.
instance instContMul [TopologicalSpace A] [Mul A] [Add A] [Neg A] [Star A]
    [ContinuousMul A] [ContinuousAdd A] [ContinuousNeg A] [ContinuousStar A] :
    ContinuousMul (CD A) := by
  constructor
  apply continuous_mk
  · -- (z*w).re = z.re*w.re + -(star w.im * z.im)
    have hzre : Continuous (fun p : CD A × CD A => p.1.re) := continuous_re.comp continuous_fst
    have hzim : Continuous (fun p : CD A × CD A => p.1.im) := continuous_im.comp continuous_fst
    have hwre : Continuous (fun p : CD A × CD A => p.2.re) := continuous_re.comp continuous_snd
    have hwim : Continuous (fun p : CD A × CD A => p.2.im) := continuous_im.comp continuous_snd
    exact (hzre.mul hwre).add ((hwim.star.mul hzim).neg)
  · -- (z*w).im = w.im*z.re + z.im*star w.re
    have hzre : Continuous (fun p : CD A × CD A => p.1.re) := continuous_re.comp continuous_fst
    have hzim : Continuous (fun p : CD A × CD A => p.1.im) := continuous_im.comp continuous_fst
    have hwre : Continuous (fun p : CD A × CD A => p.2.re) := continuous_re.comp continuous_snd
    have hwim : Continuous (fun p : CD A × CD A => p.2.im) := continuous_im.comp continuous_snd
    exact (hwim.mul hzre).add (hzim.mul hwre.star)

end CD
end
