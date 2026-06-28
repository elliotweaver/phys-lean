import Phys.Algebra.LorentzContinuumGenerationTotallyIsotropic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- (recap from probe1, all clean)
def octBlockEndC (R : O Cut →ₗ[Cut] O Cut) : Module.End Cut STVC where
  toFun p := (p.1, p.2.1, R p.2.2)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext rfl ?_); show R (p.2.2 + q.2.2) = R p.2.2 + R q.2.2; rw [map_add]
  map_smul' c p := by
    refine Prod.ext rfl (Prod.ext rfl ?_); show R (c • p.2.2) = c • R p.2.2; rw [map_smul]

theorem octBlockEndC_apply (R : O Cut →ₗ[Cut] O Cut) (p : STVC) :
    octBlockEndC R p = (p.1, p.2.1, R p.2.2) := rfl

theorem octBlockEndC_isBvIsomLin {R : O Cut →ₗ[Cut] O Cut} (hR : IsGFormCIsom R) :
    IsBvIsomLin (octBlockEndC R) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * t' - x * x' - gFormC (R v) (R v') = t * t' - x * x' - gFormC v v'
  rw [hR v v']

theorem boostEndC_isBvIsomLin {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    IsBvIsomLin (boostEndC a b) :=
  fun p q => linIsom_BvC_preserved (boostEndC_isQvIsomC hab) p q

-- DECL 4: the block-diagonal boost×rotation endomorphism.
def blockDiagC (a b : Cut) (R : O Cut →ₗ[Cut] O Cut) : Module.End Cut STVC :=
  boostEndC a b * octBlockEndC R

theorem blockDiagC_apply (a b : Cut) (R : O Cut →ₗ[Cut] O Cut) (p : STVC) :
    blockDiagC a b R p = (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, R p.2.2) := by
  show boostEndC a b (octBlockEndC R p) = _
  rw [octBlockEndC_apply, boostEndC_apply]

-- DECL 5: the block factors COMMUTE.
theorem boostEndC_octBlockEndC_commute (a b : Cut) (R : O Cut →ₗ[Cut] O Cut) :
    boostEndC a b * octBlockEndC R = octBlockEndC R * boostEndC a b := by
  apply LinearMap.ext; intro p
  show boostEndC a b (octBlockEndC R p) = octBlockEndC R (boostEndC a b p)
  rw [octBlockEndC_apply, boostEndC_apply, boostEndC_apply, octBlockEndC_apply]

-- DECL 6: blockDiag preserves BvC.
theorem blockDiagC_isBvIsomLin {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1)
    {R : O Cut →ₗ[Cut] O Cut} (hR : IsGFormCIsom R) :
    IsBvIsomLin (blockDiagC a b R) :=
  IsBvIsomLin.comp (boostEndC_isBvIsomLin hab) (octBlockEndC_isBvIsomLin hR)

-- DECL 7: ★ THE STITCH — the closed exhaustion covers the block-diagonal subgroup.
theorem blockDiagC_mem_closure {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1)
    {R : O Cut →ₗ[Cut] O Cut} (hR : IsGFormCIsom R) :
    blockDiagC a b R ∈ Submonoid.closure houseHolderMSet :=
  lorentz_exhaustion_M (blockDiagC a b R) (blockDiagC_isBvIsomLin hab hR)

-- DECL 8: ★ BvC block-orthogonality: (t,x)-plane ⟂ octonion block.
theorem bvC_tx_oct_orthogonal (t x : Cut) (v : O Cut) :
    BvC ((t, x, (0 : O Cut)) : STVC) ((0, 0, v) : STVC) = 0 := by
  show t * 0 - x * 0 - gFormC 0 v = 0
  rw [gFormC_zero_left]; ring

end
end Phys.Algebra
