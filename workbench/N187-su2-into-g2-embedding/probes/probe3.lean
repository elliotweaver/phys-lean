/-
  N187 MEASUREMENT PROBE 3 — STRUCTURAL route (W9.4). su(2)=Der(H) ↪ Der(O)=g₂.
-/
import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationDblPhase
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

noncomputable section

variable {B : Type*} [CommRing B] [StarRing B]

-- liftEnd multiplicative (composition → End multiplication)  [PASSED in probe2]
theorem liftEnd_mul (δ ε : CD B →+ CD B) :
    (liftEnd δ) * (liftEnd ε) = liftEnd (δ.comp ε) := by
  refine LinearMap.ext fun z => ?_
  show liftEnd δ (liftEnd ε z) = liftEnd (δ.comp ε) z
  ext <;> simp [liftEnd_apply]

-- liftEnd respects subtraction
theorem liftEnd_sub (δ ε : CD B →+ CD B) :
    liftEnd δ - liftEnd ε = liftEnd (δ - ε) := by
  refine LinearMap.ext fun z => ?_
  simp only [LinearMap.sub_apply, liftEnd_apply, AddMonoidHom.sub_apply]
  ext <;> simp [sub_eq_add_neg, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im]

-- base commutator as AddMonoidHom equality (over associative CD B)
theorem adHom_comp_comm (p q : CD B) :
    (adHom p).comp (adHom q) - (adHom q).comp (adHom p) = adHom (p * q - q * p) := by
  refine AddMonoidHom.ext fun x => ?_
  simp only [AddMonoidHom.sub_apply, AddMonoidHom.comp_apply, adHom_apply]
  noncomm_ring

-- THE LIE-HOM
theorem innerDeriv_bracket (p q : CD B) :
    ⁅innerDeriv p, innerDeriv q⁆ = innerDeriv (p * q - q * p) := by
  show innerDeriv p * innerDeriv q - innerDeriv q * innerDeriv p = innerDeriv (p * q - q * p)
  unfold innerDeriv
  rw [liftEnd_mul, liftEnd_mul, liftEnd_sub, adHom_comp_comm]

end

end Phys.Algebra
