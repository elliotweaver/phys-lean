import Phys.Algebra.LorentzContinuumGenerationTotallyIsotropic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- MEASURE: are all the banked names in scope from the tail import?
example (a b : Cut) : Module.End Cut STVC := boostEndC a b
example {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) : IsQvIsomC (boostEndC a b) :=
  boostEndC_isQvIsomC hab
example {g : Module.End Cut STVC} (hg : IsQvIsomC g) (p q : STVC) :
    BvC (g p) (g q) = BvC p q := linIsom_BvC_preserved hg p q
example (S : O Cut →ₗ[Cut] O Cut) (hS : IsGFormCIsom S) :
    S ∈ Submonoid.closure houseHolderSet := gFormC_isom_mem_closure S hS
example (S : Module.End Cut STVC) (hS : IsBvIsomLin S) :
    S ∈ Submonoid.closure houseHolderMSet := lorentz_exhaustion_M S hS

-- DECL 1: octonion-block embedding endomorphism (t,x,v) ↦ (t,x,R v).
def octBlockEndC (R : O Cut →ₗ[Cut] O Cut) : Module.End Cut STVC where
  toFun p := (p.1, p.2.1, R p.2.2)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext rfl ?_)
    show R (p.2.2 + q.2.2) = R p.2.2 + R q.2.2
    rw [map_add]
  map_smul' c p := by
    refine Prod.ext rfl (Prod.ext rfl ?_)
    show R (c • p.2.2) = c • R p.2.2
    rw [map_smul]

theorem octBlockEndC_apply (R : O Cut →ₗ[Cut] O Cut) (p : STVC) :
    octBlockEndC R p = (p.1, p.2.1, R p.2.2) := rfl

-- DECL 2: octBlock preserves BvC when R is a gFormC-isometry.
theorem octBlockEndC_isBvIsomLin {R : O Cut →ₗ[Cut] O Cut} (hR : IsGFormCIsom R) :
    IsBvIsomLin (octBlockEndC R) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show BvC (t, x, R v) (t', x', R v') = BvC (t, x, v) (t', x', v')
  show t * t' - x * x' - gFormC (R v) (R v') = t * t' - x * x' - gFormC v v'
  rw [hR v v']

-- DECL 3: boost preserves BvC on the unit hyperbola.
theorem boostEndC_isBvIsomLin {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    IsBvIsomLin (boostEndC a b) :=
  fun p q => linIsom_BvC_preserved (boostEndC_isQvIsomC hab) p q

end
end Phys.Algebra
