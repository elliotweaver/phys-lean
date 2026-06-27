import Phys.Algebra.LorentzContinuumOpSqrtJConj

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C123): A BOGUS J-CONJUGATION SQUARING LAW — "THE J-CONJUGATE OF A SQUARE-ROOT-
-- SHAPED OPERATOR SQUARES BACK TO THE ORIGINAL OPERATOR (J s J)² = s², NOT TO ITS J-CONJUGATE".
-- N92 banks `opSqrt_sigOpC_conj`: the J-conjugate `J∘s∘J` of a positive operator square root `s`
-- of `q` is a positive operator square root of `J∘q∘J` — `(J∘s∘J)∘(J∘s∘J) = J∘(s∘s)∘J = J∘q∘J`,
-- the conjugation persists onto the SQUARE (`sigOpC_comp_self`: J∘J = id collapses only the INNER
-- pair, leaving the OUTER J's intact). A BOGUS claim that the conjugate squares back to the bare
-- `s∘s = q` (dropping the outer conjugation) contradicts this.
--   Take the concrete boost-shaped carrier `s := boostEndC 5 3` (a genuine non-identity operator
-- over the derived ℝ `Cut`) and the vector `(1,1,0)`. The genuine conjugate-square:
--     J(1,1,0)=(1,−1,0); s(1,−1,0)=(2,−2,0); J(2,−2,0)=(2,2,0)              [(J s J)(1,1,0)=(2,2,0)]
--     J(2,2,0)=(2,−2,0); s(2,−2,0)=(4,−4,0); J(4,−4,0)=(4,4,0)             [(J s J)²(1,1,0)=(4,4,0)]
-- so `((J∘s∘J)∘(J∘s∘J))(1,1,0)` has FIRST coordinate `4`. Meanwhile the bare square:
--     s(1,1,0)=(8,8,0); s(8,8,0)=(64,64,0)                                  [(s∘s)(1,1,0)=(64,64,0)]
-- has first coordinate `64`. The BOGUS claim `(J s J)² = s²` forces `4 = 64` and must NOT compile.
--   The false numeric `4 = 64` is DISTINCT from the banked battery (C115 1=7, C116 4=13,
-- C117 36=9, C118 21=1, C119 16=1, C120 25=1, C121 5=1, C122 2=8).
--   PHYSICS-WORDS-REMOVABLE: delete "square-root/conjugation/signature/involution/positive/
-- operator/spectral/Lorentz/boost" → over the derived complete ordered field `Cut`, the `Cut`-linear
-- map `(sigOpC ∘ (boostEndC 5 3) ∘ sigOpC)²` reads `4` in the first coordinate at `(1,1,0)`, not
-- `(boostEndC 5 3)²`'s `64`; pure linear-algebra arithmetic. The bite is a false NUMERIC,
-- name-independent.

/-- BOGUS: the J-conjugate of the boost-shaped carrier `s := boostEndC 5 3` is claimed to square
    BACK to the bare `s∘s` (`(J s J)² = s²`) at `(1,1,0)`, contradicting the genuine persistence of
    the conjugation onto the square `(J s J)² = J∘(s∘s)∘J`. The genuine conjugate-square first
    coordinate is `4` (`sigOpC_apply` + `boostEndC_apply`), while the bare square first coordinate is
    `64`; so this forces `4 = 64` and must NOT compile. -/
theorem opSqrt_J_conj_wrong_squares_bare_BOGUS :
    ((sigOpC.comp ((boostEndC 5 3).comp sigOpC)).comp
        (sigOpC.comp ((boostEndC 5 3).comp sigOpC))
        ((1 : Cut), (1 : Cut), (0 : O Cut))).1
      = (((boostEndC 5 3).comp (boostEndC 5 3))
        ((1 : Cut), (1 : Cut), (0 : O Cut))).1 := by
  have hconj : ((sigOpC.comp ((boostEndC 5 3).comp sigOpC)).comp
      (sigOpC.comp ((boostEndC 5 3).comp sigOpC))
      ((1 : Cut), (1 : Cut), (0 : O Cut))).1 = (4 : Cut) := by
    simp only [LinearMap.comp_apply, boostEndC_apply, sigOpC_apply]
    ring
  have hbare : (((boostEndC 5 3).comp (boostEndC 5 3))
      ((1 : Cut), (1 : Cut), (0 : O Cut))).1 = (64 : Cut) := by
    simp only [LinearMap.comp_apply, boostEndC_apply]
    ring
  rw [hconj, hbare]

end

end Counterexamples
