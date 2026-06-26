import Phys.Algebra.LorentzContinuumEigenBasisGen

namespace Phys.Algebra.ProbeN66

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- The boost operator as a `Module.End`: `(t,x,v) ↦ (a•t+b•x, b•t+a•x, v)`, octonion block fixed. -/
def boostC (a b : Cut) : Module.End Cut STVC where
  toFun p := (a • p.1 + b • p.2.1, b • p.1 + a • p.2.1, p.2.2)
  map_add' p q := by
    obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a • (t + t') + b • (x + x') = (a • t + b • x) + (a • t' + b • x')
      rw [smul_add, smul_add]; ring
    · show b • (t + t') + a • (x + x') = (b • t + a • x) + (b • t' + a • x')
      rw [smul_add, smul_add]; ring
    · show v + v' = v + v'; rfl
  map_smul' c p := by
    obtain ⟨t, x, v⟩ := p
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a • (c • t) + b • (c • x) = c • (a • t + b • x)
      rw [smul_add, smul_comm a c t, smul_comm b c x]
    · show b • (c • t) + a • (c • x) = c • (b • t + a • x)
      rw [smul_add, smul_comm b c t, smul_comm a c x]
    · show c • v = c • v; rfl

theorem boostC_apply (a b : Cut) (p : STVC) :
    boostC a b p = (a • p.1 + b • p.2.1, b • p.1 + a • p.2.1, p.2.2) := rfl

end

end Phys.Algebra.ProbeN66
