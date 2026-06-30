/-
  N187 MEASUREMENT PROBE — su(2) = Der(H) ↪ Der(O) = g₂ via the CD doubling lift.
  Isolated scratch. NOT production. Measures the smallest obligations BEFORE committing (W9).
-/
import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationDblPhase
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- ============ OBLIGATION 1: liftEnd is additive ============
example (δ ε : Dbl ℚ →+ Dbl ℚ) :
    liftEnd (B := Dbl ℚ) (δ + ε) = liftEnd δ + liftEnd ε := by
  refine LinearMap.ext fun z => ?_
  ext <;> simp [liftEnd_apply]

-- ============ OBLIGATION 2: liftEnd is multiplicative (composition) ============
-- liftEnd δ ∘ liftEnd ε = liftEnd (δ ∘ ε) as Module.End ℤ
example (δ ε : Dbl ℚ →+ Dbl ℚ) :
    (liftEnd (B := Dbl ℚ) δ) * (liftEnd ε) = liftEnd (δ.comp ε) := by
  refine LinearMap.ext fun z => ?_
  show liftEnd δ (liftEnd ε z) = liftEnd (δ.comp ε) z
  ext <;> simp [liftEnd_apply]

-- ============ OBLIGATION 3: base End-commutator identity on associative H ℚ ============
-- (adHom p).comp (adHom q) - (adHom q).comp (adHom p)  as additive maps, applied pointwise,
-- equals adHom (p*q - q*p).  Use the AddMonoidHom level.
example (p q : H ℚ) (x : H ℚ) :
    adHom p (adHom q x) - adHom q (adHom p x) = adHom (p * q - q * p) x := by
  simp only [adHom_apply]
  noncomm_ring

-- ============ OBLIGATION 4: THE LIE-HOM — ⁅innerDeriv p, innerDeriv q⁆ = innerDeriv (p*q - q*p) ============
example (p q : H ℚ) :
    ⁅innerDeriv (B := Dbl ℚ) p, innerDeriv q⁆ = innerDeriv (p * q - q * p) := by
  refine LinearMap.ext fun z => ?_
  show (innerDeriv p * innerDeriv q - innerDeriv q * innerDeriv p) z = innerDeriv (p * q - q * p) z
  simp only [LinearMap.sub_apply, Module.End.mul_apply, innerDeriv_apply]
  ext <;>
    simp only [CD.sub_re, CD.sub_im] <;>
    · simp only [adHom_apply]; noncomm_ring

end

end Phys.Algebra
