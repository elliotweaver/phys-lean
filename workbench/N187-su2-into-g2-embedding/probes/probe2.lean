/-
  N187 MEASUREMENT PROBE 2 — STRUCTURAL route (W9.4). su(2)=Der(H) ↪ Der(O)=g₂.
  liftEnd additive + multiplicative-on-composition ⟹ innerDeriv_bracket reduces to the
  base commutator (obligation 3, already measured clean) with NO O-coordinate expansion.
-/
import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationDblPhase
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

noncomputable section

variable {B : Type*} [CommRing B] [StarRing B]

-- liftEnd additive
example (δ ε : CD B →+ CD B) :
    liftEnd (δ + ε) = liftEnd δ + liftEnd ε := by
  refine LinearMap.ext fun z => ?_
  ext <;> simp [liftEnd_apply]

-- liftEnd neg
example (δ : CD B →+ CD B) :
    liftEnd (-δ) = - liftEnd δ := by
  refine LinearMap.ext fun z => ?_
  ext <;> simp [liftEnd_apply]

-- liftEnd multiplicative (composition → End multiplication)
example (δ ε : CD B →+ CD B) :
    (liftEnd δ) * (liftEnd ε) = liftEnd (δ.comp ε) := by
  refine LinearMap.ext fun z => ?_
  show liftEnd δ (liftEnd ε z) = liftEnd (δ.comp ε) z
  ext <;> simp [liftEnd_apply]

-- base commutator as AddMonoidHom equality (over associative CD B)
example (p q : CD B) :
    (adHom p).comp (adHom q) - (adHom q).comp (adHom p) = adHom (p * q - q * p) := by
  ext x
  show adHom p (adHom q x) - adHom q (adHom p x) = adHom (p * q - q * p) x
  simp only [adHom_apply]
  noncomm_ring

-- THE LIE-HOM, assembled structurally
example (p q : CD B) :
    ⁅innerDeriv p, innerDeriv q⁆ = innerDeriv (p * q - q * p) := by
  have hmul : ∀ δ ε : CD B →+ CD B, (liftEnd δ) * (liftEnd ε) = liftEnd (δ.comp ε) := by
    intro δ ε; refine LinearMap.ext fun z => ?_
    show liftEnd δ (liftEnd ε z) = liftEnd (δ.comp ε) z
    ext <;> simp [liftEnd_apply]
  have hsub : ∀ δ ε : CD B →+ CD B, liftEnd δ - liftEnd ε = liftEnd (δ - ε) := by
    intro δ ε; refine LinearMap.ext fun z => ?_
    ext <;> simp [liftEnd_apply, AddMonoidHom.sub_apply]
  have hcomm : (adHom p).comp (adHom q) - (adHom q).comp (adHom p) = adHom (p * q - q * p) := by
    ext x
    show adHom p (adHom q x) - adHom q (adHom p x) = adHom (p * q - q * p) x
    simp only [adHom_apply]; noncomm_ring
  show innerDeriv p * innerDeriv q - innerDeriv q * innerDeriv p = innerDeriv (p * q - q * p)
  unfold innerDeriv
  rw [hmul, hmul, hsub, hcomm]

end

end Phys.Algebra
