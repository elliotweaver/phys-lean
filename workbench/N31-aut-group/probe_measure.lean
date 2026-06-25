import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationCompact
import Mathlib.Algebra.Algebra.Equiv
import Mathlib.LinearAlgebra.GeneralLinearGroup.Basic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- MEASUREMENT PROBE (W9, bounded). What synthesizes on O ℚ for the aut-group carrier?

-- (b) LinearEquiv automorphism group of O ℚ as a ℚ-module:
#synth Group (O ℚ ≃ₗ[ℚ] O ℚ)

-- (c) RingEquiv on O ℚ:
#check (O ℚ ≃+* O ℚ)
#check (RingEquiv.refl (O ℚ))

-- (d) typeclasses
#synth NonAssocRing (O ℚ)
#synth Module ℚ (O ℚ)
#synth AddCommGroup (O ℚ)

-- (e) a unital algebra automorphism predicate on a ℚ-linear equiv:
example (φ : O ℚ ≃ₗ[ℚ] O ℚ) (hmul : ∀ x y, φ (x * y) = φ x * φ y) (hone : φ 1 = 1) : True := trivial

-- (g) does Algebra ℚ (O ℚ) synthesize? try it explicitly
-- #synth Algebra ℚ (O ℚ)

-- (h) Can we build a Submonoid of (O ℚ ≃ₗ[ℚ] O ℚ) by the mult+unital predicate? probe the
--     group identity (refl) satisfies it, for non-vacuity:
example : (LinearEquiv.refl ℚ (O ℚ)) 1 = 1 := rfl
example (x y : O ℚ) : (LinearEquiv.refl ℚ (O ℚ)) (x * y) = (LinearEquiv.refl ℚ (O ℚ)) x * (LinearEquiv.refl ℚ (O ℚ)) y := rfl

end
end Phys.Algebra
