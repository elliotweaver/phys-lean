import Phys.Algebra.LorentzContinuumGenerationTotallyIsotropic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

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

def blockDiagC (a b : Cut) (R : O Cut →ₗ[Cut] O Cut) : Module.End Cut STVC :=
  boostEndC a b * octBlockEndC R

theorem blockDiagC_apply (a b : Cut) (R : O Cut →ₗ[Cut] O Cut) (p : STVC) :
    blockDiagC a b R p = (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, R p.2.2) := by
  show boostEndC a b (octBlockEndC R p) = _
  rw [octBlockEndC_apply, boostEndC_apply]

theorem blockDiagC_isBvIsomLin {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1)
    {R : O Cut →ₗ[Cut] O Cut} (hR : IsGFormCIsom R) :
    IsBvIsomLin (blockDiagC a b R) :=
  IsBvIsomLin.comp (boostEndC_isBvIsomLin hab) (octBlockEndC_isBvIsomLin hR)

-- IsGFormCIsom for the identity rotation (trivial).
theorem id_isGFormCIsom : IsGFormCIsom (LinearMap.id : O Cut →ₗ[Cut] O Cut) :=
  fun _ _ => rfl

-- W8 (a) non-vacuity: the boost GENUINELY MOVES the timelike axis (mixes t,x).
theorem blockDiagC_boost_witness_image :
    blockDiagC ((5 : Cut) / 3) ((4 : Cut) / 3) LinearMap.id (mTimeUnit : STVC)
      = ((5 : Cut) / 3, (4 : Cut) / 3, (0 : O Cut)) := by
  rw [blockDiagC_apply]
  show ((5:Cut)/3 * 1 + (4:Cut)/3 * 0, (4:Cut)/3 * 1 + (5:Cut)/3 * 0, (LinearMap.id : O Cut →ₗ[Cut] O Cut) 0)
      = _
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show (5:Cut)/3 * 1 + (4:Cut)/3 * 0 = (5:Cut)/3; ring
  · show (4:Cut)/3 * 1 + (5:Cut)/3 * 0 = (4:Cut)/3; ring
  · show (LinearMap.id : O Cut →ₗ[Cut] O Cut) 0 = 0; rw [map_zero]

-- W8 (b) the boost PRESERVES the indefinite Minkowski self-overlap = 1 (genuinely indefinite).
theorem blockDiagC_boost_witness_self_overlap :
    BvC (blockDiagC ((5 : Cut) / 3) ((4 : Cut) / 3) LinearMap.id (mTimeUnit : STVC))
        (blockDiagC ((5 : Cut) / 3) ((4 : Cut) / 3) LinearMap.id (mTimeUnit : STVC))
      = 1 := by
  have hab : ((5 : Cut) / 3) ^ 2 - ((4 : Cut) / 3) ^ 2 = 1 := by ring
  rw [blockDiagC_isBvIsomLin hab id_isGFormCIsom, BvC_mTimeUnit_self]

end
end Phys.Algebra
