import Phys.Algebra.LorentzContinuumIsomMetricChar

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C122): A BOGUS J-CONJUGATION — "CONJUGATING THE POSITIVE PART BY THE SIGNATURE
-- INVOLUTION GIVES IT BACK (J p J = p), NOT ITS INVERSE".
-- N91 banks `linIsom_posPart_J_conj_inv`: for the positive part `p := g*g` of a linear isometry,
-- conjugating by the signature involution `J = sigOpC` INVERTS it — `J p J = p⁻¹`, stated as
-- `(J ∘ p ∘ J) ∘ p = id`. The conjugation is NOT trivial: `J ∘ (boostEndC A B) ∘ J =
-- boostEndC A (−B)` (the signature involution flips the off-diagonal boost coefficient, purely
-- algebraically, for ALL `A,B`) — it gives the x-flipped boost, which is the INVERSE exactly on
-- the unit hyperbola `A² − B² = 1`. A BOGUS claim that conjugation gives `p` back (J p J = p)
-- contradicts the flip.
--   Take the concrete boost-shaped operator `p := boostEndC 5 3` and the vector `(1,1,0)`:
--     J(1,1,0)        = (1, −1, 0)                                   [sigOpC_apply]
--     p(1,−1,0)       = (5·1+3·(−1), 3·1+5·(−1), 0) = (2, −2, 0)     [boostEndC_apply]
--     J(2,−2,0)       = (2, 2, 0)                                    [sigOpC_apply]
-- so the genuine conjugate `(J ∘ p ∘ J)(1,1,0)` has FIRST coordinate `5 − 3 = 2` (the x-flipped
-- boost `boostEndC 5 (−3)` value), whereas `p(1,1,0) = (5·1+3·1, …) = (8, …)` has first
-- coordinate `5 + 3 = 8`. The BOGUS claim `J p J = p` forces `2 = 8` and must NOT compile.
--   The false numeric `2 = 8` is DISTINCT from the banked battery (C115 1=7, C116 4=13,
-- C117 36=9, C118 21=1, C119 16=1, C120 25=1, C121 5=1).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/isometry/signature/conjugation/inverse/
-- positive-part/spectral/square-root" → over the derived complete ordered field `Cut`, the
-- `Cut`-linear map `sigOpC ∘ (boostEndC 5 3) ∘ sigOpC` reads `5 − 3 = 2` in the first coordinate
-- at `(1,1,0)`, not `boostEndC 5 3`'s `5 + 3 = 8`; pure linear-algebra arithmetic. The bite is a
-- false NUMERIC, name-independent.

/-- BOGUS: conjugating the boost-shaped operator `p := boostEndC 5 3` by the signature involution
    `J = sigOpC` is claimed to give `p` back (`J p J = p`) at `(1,1,0)`, contradicting the genuine
    flip `J ∘ (boostEndC 5 3) ∘ J = boostEndC 5 (−3)`. The genuine conjugate first coordinate is
    `5 − 3 = 2` (`sigOpC_apply` + `boostEndC_apply`), while `p(1,1,0)` first coordinate is
    `5 + 3 = 8`; so this forces `2 = 8` and must NOT compile. -/
theorem posPart_J_conj_wrong_preserves_BOGUS :
    (sigOpC.comp ((boostEndC 5 3).comp sigOpC)
        ((1 : Cut), (1 : Cut), (0 : O Cut))).1
      = ((boostEndC 5 3) ((1 : Cut), (1 : Cut), (0 : O Cut))).1 := by
  have hconj : (sigOpC.comp ((boostEndC 5 3).comp sigOpC)
      ((1 : Cut), (1 : Cut), (0 : O Cut))).1 = (2 : Cut) := by
    simp only [LinearMap.comp_apply, boostEndC_apply, sigOpC_apply]
    ring
  have hp : ((boostEndC 5 3) ((1 : Cut), (1 : Cut), (0 : O Cut))).1 = (8 : Cut) := by
    simp only [boostEndC_apply]
    ring
  rw [hconj, hp]

end

end Counterexamples
