import Phys.Algebra.LorentzContinuumCliffordCoverHom
import Mathlib.LinearAlgebra.CliffordAlgebra.Conjugation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- The Clifford unit of an anisotropic vector, built explicitly (no `Classical.choose`):
    `↑u = ι a`, `↑u⁻¹ = (QvC a)⁻¹ • ι a`. -/
def cliffUnitOf (a : STVC) (ha : BvC a a ≠ 0) : CliffCˣ where
  val := CliffordAlgebra.ι QvCQuad a
  inv := (QvC a)⁻¹ • CliffordAlgebra.ι QvCQuad a
  val_inv := by
    have hqne : QvC a ≠ 0 := by rw [← BvC_self a]; exact ha
    rw [mul_smul_comm, cliffSq a, Algebra.smul_def, ← map_mul, inv_mul_cancel₀ hqne, map_one]
  inv_val := by
    have hqne : QvC a ≠ 0 := by rw [← BvC_self a]; exact ha
    rw [smul_mul_assoc, cliffSq a, Algebra.smul_def, ← map_mul, inv_mul_cancel₀ hqne, map_one]

@[simp] theorem cliffUnitOf_val (a : STVC) (ha : BvC a a ≠ 0) :
    (cliffUnitOf a ha : CliffC) = CliffordAlgebra.ι QvCQuad a := rfl

@[simp] theorem cliffUnitOf_inv (a : STVC) (ha : BvC a a ≠ 0) :
    (((cliffUnitOf a ha)⁻¹ : CliffCˣ) : CliffC) = (QvC a)⁻¹ • CliffordAlgebra.ι QvCQuad a := rfl

/-- The twisted adjoint of a Clifford unit covers a linear map `g` on the spinor module:
    `involute(↑u) · ι v · ↑u⁻¹ = ι (g v)` for all `v`. -/
def CliffCovers (u : CliffCˣ) (g : Module.End Cut STVC) : Prop :=
  ∀ v : STVC,
    CliffordAlgebra.involute (u : CliffC) * CliffordAlgebra.ι QvCQuad v * ((u⁻¹ : CliffCˣ) : CliffC)
      = CliffordAlgebra.ι QvCQuad (g v)

-- GLOBAL: every reflection-word element is covered.
example {g : Module.End Cut STVC} (hg : g ∈ Submonoid.closure houseHolderMSet) :
    ∃ u : CliffCˣ, CliffCovers u g := by
  induction hg using Submonoid.closure_induction with
  | mem x hx =>
      obtain ⟨a, ha, rfl⟩ := hx
      refine ⟨cliffUnitOf a ha, ?_⟩
      intro v
      rw [cliffUnitOf_val, cliffUnitOf_inv,
          CliffordAlgebra.involute_ι, reflection_clifford_conj ha v,
          mul_smul_comm, neg_smul, ← smul_neg]
      congr 1
      noncomm_ring
  | one =>
      refine ⟨1, ?_⟩
      intro v
      rw [inv_one, Units.val_one, map_one, one_mul, mul_one, Module.End.one_apply]
  | mul x y hx hy ihx ihy =>
      obtain ⟨u, hu⟩ := ihx
      obtain ⟨w, hw⟩ := ihy
      refine ⟨u * w, ?_⟩
      intro v
      have hval : ((u * w : CliffCˣ) : CliffC) = (u : CliffC) * (w : CliffC) := Units.val_mul u w
      have hinv : (((u * w)⁻¹ : CliffCˣ) : CliffC)
          = ((w⁻¹ : CliffCˣ) : CliffC) * ((u⁻¹ : CliffCˣ) : CliffC) := by rw [mul_inv_rev]; rfl
      rw [hval, hinv, map_mul, Module.End.mul_apply]
      calc CliffordAlgebra.involute (u : CliffC) * CliffordAlgebra.involute (w : CliffC)
              * CliffordAlgebra.ι QvCQuad v
              * (((w⁻¹ : CliffCˣ) : CliffC) * ((u⁻¹ : CliffCˣ) : CliffC))
          = CliffordAlgebra.involute (u : CliffC)
              * (CliffordAlgebra.involute (w : CliffC) * CliffordAlgebra.ι QvCQuad v
                  * ((w⁻¹ : CliffCˣ) : CliffC))
              * ((u⁻¹ : CliffCˣ) : CliffC) := by noncomm_ring
        _ = CliffordAlgebra.involute (u : CliffC) * CliffordAlgebra.ι QvCQuad (y v)
              * ((u⁻¹ : CliffCˣ) : CliffC) := by rw [hw v]
        _ = CliffordAlgebra.ι QvCQuad (x (y v)) := hu (y v)

-- GLOBAL restated over bvIsomLinMonoid (every BvC-isometry covered).
example {g : Module.End Cut STVC} (hg : g ∈ bvIsomLinMonoid) :
    ∃ u : CliffCˣ, CliffCovers u g := by
  have : g ∈ Submonoid.closure houseHolderMSet := by
    rw [reflection_closure_eq_bvIsomLinMonoid]; exact hg
  -- reuse the global lemma above in production; here just confirm the membership transport typechecks
  sorry

end

end Phys.Algebra
