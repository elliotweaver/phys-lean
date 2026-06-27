import Phys.Algebra.LorentzContinuumIsomCompact
import Phys.Algebra.LorentzContinuumSpin9DistinctPlane

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! PROBE 1: the coercion Module.End → Function.End as a monoid hom. -/

-- the map_mul' obligation: ⇑(a * b) = ⇑a * ⇑b in Function.End, where Function.End mul = ∘.
example (a b : Module.End Cut STVC) :
    (⇑(a * b) : Function.End STVC) = (⇑a : Function.End STVC) * (⇑b : Function.End STVC) := by
  funext p; rw [Module.End.mul_apply]; rfl

-- map_one'
example : (⇑(1 : Module.End Cut STVC) : Function.End STVC) = (1 : Function.End STVC) := by
  rfl

-- Build the monoid hom directly
def endToFunEndProbe : Module.End Cut STVC →* Function.End STVC where
  toFun k := (⇑k : Function.End STVC)
  map_one' := rfl
  map_mul' _ _ := by funext p; rw [Module.End.mul_apply]; rfl

-- injectivity
example : Function.Injective endToFunEndProbe := by
  intro a b hab
  exact DFunLike.coe_injective hab

/-! PROBE 2: biMulLin — the Module.End whose underlying fn is biMulFun. Needs Cut-linearity. -/

-- The two-sided multiplication on O Cut is Cut-linear (using smulCompat_oCut).
-- biMulFun u u' : (t,x,v) ↦ (t,x, u*(v*u')). The first two coords are identity (linear),
-- the third is v ↦ u*(v*u') which is additive and smul-compatible.

def biMulLinProbe (u u' : O Cut) : Module.End Cut STVC where
  toFun p := (p.1, p.2.1, u * (p.2.2 * u'))
  map_add' p q := by
    obtain ⟨pt, px, pv⟩ := p
    obtain ⟨qt, qx, qv⟩ := q
    have hsc := smulCompat_oCut
    simp only [Prod.mk_add_mk]
    refine Prod.ext rfl (Prod.ext rfl ?_)
    show u * ((pv + qv) * u') = u * (pv * u') + u * (qv * u')
    rw [add_mul, mul_add]
  map_smul' c p := by
    obtain ⟨pt, px, pv⟩ := p
    have hsc := smulCompat_oCut
    simp only [RingHom.id_apply]
    show ((c • pt, c • px, u * ((c • pv) * u')) : STVC)
        = (c • pt, c • px, c • (u * (pv * u')))
    refine Prod.ext rfl (Prod.ext rfl ?_)
    show u * ((c • pv) * u') = c • (u * (pv * u'))
    rw [hsc.hl c pv u', hsc.hr c u (pv * u')]

-- check the underlying fn matches biMulFun
example (u u' : O Cut) : (⇑(biMulLinProbe u u') : STVC → STVC) = biMulFun u u' := by
  rfl

end

end Phys.Algebra
