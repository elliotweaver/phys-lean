import Phys.Algebra.LorentzContinuumCliffordSpinGroup
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- (A) iota-injectivity over derived Cut
theorem cliff_iota_injective :
    Function.Injective (CliffordAlgebra.ι (R := Cut) QvCQuad) := by
  haveI : Invertible (2 : Cut) := invertibleOfNonzero two_ne_zero
  intro x y h
  have hx : CliffordAlgebra.equivExterior QvCQuad (CliffordAlgebra.ι QvCQuad x)
          = CliffordAlgebra.equivExterior QvCQuad (CliffordAlgebra.ι QvCQuad y) := by rw [h]
  simp only [CliffordAlgebra.equivExterior, CliffordAlgebra.changeFormEquiv_apply,
    CliffordAlgebra.changeForm_ι] at hx
  exact (ExteriorAlgebra.ι_inj Cut x y).mp hx

-- (B) cover uniqueness: a unit's twisted-adjoint-covered operator is unique
theorem cliffCovers_unique {u : CliffCˣ} {g h : Module.End Cut STVC}
    (hg : CliffCovers u g) (hh : CliffCovers u h) : g = h := by
  apply LinearMap.ext
  intro v
  apply cliff_iota_injective
  rw [← hg v, ← hh v]

-- (C) THE COVERING SUBMONOID of units that cover an isometry
def CoversSub : Submonoid CliffCˣ where
  carrier := {u | ∃ g, g ∈ bvIsomLinMonoid ∧ CliffCovers u g}
  one_mem' := ⟨1, one_mem _, cliffCovers_one⟩
  mul_mem' := by
    rintro a b ⟨g, hg, hcg⟩ ⟨h, hh, hch⟩
    exact ⟨g * h, mul_mem hg hh, cliffCovers_mul hcg hch⟩

-- the covered operator (well-defined by uniqueness; chosen here, pinned by lemmas)
def coverOp (u : CoversSub) : Module.End Cut STVC := u.prop.choose
theorem coverOp_mem (u : CoversSub) : coverOp u ∈ bvIsomLinMonoid := u.prop.choose_spec.1
theorem coverOp_covers (u : CoversSub) : CliffCovers (u : CliffCˣ) (coverOp u) :=
  u.prop.choose_spec.2

-- THE GROUP MAP: the cover as a MonoidHom onto SO⁺(1,9)
def coverMap : CoversSub →* bvIsomLinMonoid where
  toFun u := ⟨coverOp u, coverOp_mem u⟩
  map_one' := by
    apply Subtype.ext
    show coverOp 1 = _
    have : CliffCovers ((1 : CoversSub) : CliffCˣ) (1 : Module.End Cut STVC) := by
      rw [Submonoid.coe_one]; exact cliffCovers_one
    exact cliffCovers_unique (coverOp_covers 1) this
  map_mul' u w := by
    apply Subtype.ext
    show coverOp (u * w) = coverOp u * coverOp w
    have : CliffCovers ((u * w : CoversSub) : CliffCˣ) (coverOp u * coverOp w) := by
      rw [Submonoid.coe_mul]
      exact cliffCovers_mul (coverOp_covers u) (coverOp_covers w)
    exact cliffCovers_unique (coverOp_covers (u * w)) this

-- surjectivity onto SO⁺(1,9): the cover is surjective (every isometry covered, N135)
theorem coverMap_surjective : Function.Surjective coverMap := by
  rintro ⟨g, hg⟩
  obtain ⟨u, hu⟩ := cover_global_bvIsom hg
  refine ⟨⟨u, g, hg, hu⟩, ?_⟩
  apply Subtype.ext
  show coverOp ⟨u, g, hg, hu⟩ = g
  exact cliffCovers_unique (coverOp_covers ⟨u, g, hg, hu⟩) hu

end

end Phys.Algebra
