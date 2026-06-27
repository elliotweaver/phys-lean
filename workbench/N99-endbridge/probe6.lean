import Phys.Algebra.LorentzContinuumIsomCompact
import Phys.Algebra.LorentzContinuumSpin9DistinctPlane

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

def endToFunEnd : Module.End Cut STVC →* Function.End STVC where
  toFun k := (k : STVC → STVC)
  map_one' := rfl
  map_mul' _ _ := rfl

-- biMulLin: the explicit Module.End whose underlying fn is biMulFun u u'.
def biMulLin (u u' : O Cut) : Module.End Cut STVC where
  toFun p := (p.1, p.2.1, u * (p.2.2 * u'))
  map_add' p q := by
    have hsc := smulCompat_oCut
    refine Prod.ext rfl (Prod.ext rfl ?_)
    show u * ((p.2.2 + q.2.2) * u') = u * (p.2.2 * u') + u * (q.2.2 * u')
    rw [add_mul, mul_add]
  map_smul' c p := by
    have hsc := smulCompat_oCut
    refine Prod.ext rfl (Prod.ext rfl ?_)
    show u * ((c • p.2.2) * u') = c • (u * (p.2.2 * u'))
    rw [hsc.hl c p.2.2 u', hsc.hr c u (p.2.2 * u')]

-- the bridge image is exactly biMulFun
example (u u' : O Cut) : endToFunEnd (biMulLin u u') = biMulFun u u' := rfl

-- biMulLin u u' as a Function.End ∈ genIsomMonoidC2 when Born units? It equals biMulFun,
-- and biMulFun_distinct_mem_gen2 gives membership. Check the bridge transports it.
example (u u' : O Cut) (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    endToFunEnd (biMulLin u u') ∈ genIsomMonoidC2 := by
  show (biMulFun u u' : Function.End STVC) ∈ genIsomMonoidC2
  exact biMulFun_distinct_mem_gen2 u u' hu hu'

-- W8 concrete coordinate: endToFunEnd (biMulLin e2 e2) at (0,0,1) third coord = e2*e2 = -1
example : (endToFunEnd (biMulLin (CD.e2 : O Cut) (CD.e2 : O Cut))
    ((0:Cut),(0:Cut),(1:O Cut))).2.2 = (CD.e2 : O Cut) * (CD.e2 : O Cut) := by
  show (CD.e2 : O Cut) * ((1 : O Cut) * (CD.e2 : O Cut)) = (CD.e2 : O Cut) * (CD.e2 : O Cut)
  rw [one_mul]

-- reduce to -1 via e2_alt, and read a numeric coordinate (the W8 anchor)
example : ((endToFunEnd (biMulLin (CD.e2 : O Cut) (CD.e2 : O Cut))
    ((0:Cut),(0:Cut),(1:O Cut))).2.2).re.re.re = (-1 : Cut) := by
  show ((CD.e2 : O Cut) * ((1 : O Cut) * (CD.e2 : O Cut))).re.re.re = (-1 : Cut)
  rw [one_mul]
  have h : (CD.e2 : O Cut) * (CD.e2 : O Cut) = (-1 : O Cut) := by
    have h := e2_alt (1 : O Cut); rwa [mul_one] at h
  rw [h]
  show ((-1 : O Cut)).re.re.re = (-1 : Cut)
  rw [CD.neg_re, CD.neg_re, Dbl.neg_re]; rfl

end
end Phys.Algebra
