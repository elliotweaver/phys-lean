import Phys.Algebra.DerivationOAdjointFlow

namespace Counterexamples

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C213): A BOGUS ADJOINT-FLOW DERIVATIVE CLAIM — "THE ADJOINT (CONJUGATION) FLOW
-- DERIVATIVE IS TRIVIAL / THE NON-ABELIAN BRACKET VANISHES / THE FLOW IS ABELIAN".
-- N181 banks the ADJOINT-FLOW DERIVATIVE adjMap_tangent: d/dt (expMap(t•M)·A·expMap(t•(−M)))|₀ =
-- M·A − A·M = ⁅M,A⁆ — the genuine first-order content, the derivative of the conjugation flow IS
-- the Lie bracket (recovered with ONLY the first-order tangent, the conjugation flow making the
-- non-abelian bracket first-order), plus matrix-mul continuity (matrix_mul_tendsto), exponential
-- continuity at 0 (expMap_tendsto_one), the matrix tangent (expMap_smul_tangent), and the operator
-- transport (derivMatrix_bracket / adjMap_tangent_deriv: derivMatrix carries the operator Lie
-- bracket to the matrix commutator). The DEFINING NON-ABELIAN content — the piece the N180 ABELIAN
-- (commuting) case CANNOT express — is that for a NON-COMMUTING pair the adjoint-flow derivative is a
-- NONZERO bracket. The W8 witness witM := single 0 1 1, witA := single 1 0 1 is non-commuting: the
-- bracket witM*witA − witA*witM reads GENUINELY 1 at entry (0,0) ((witM*witA) 0 0 = 1·1 = 1, while
-- (witA*witM) 0 0 = 0 since witA has no nonzero entry in row 0), so ⁅witM,witA⁆ 0 0 = 1 − 0 = 1 ≠ 0
-- (wit_bracket_ne) — the adjoint-flow derivative the limit lands at is non-vanishing.
--   THE BOGUS claim that the witness bracket entry (witM*witA − witA*witM) 0 0 (a stand-in for ANY
-- wrong adjoint-flow claim: the conjugation-flow derivative is trivial / the non-abelian bracket
-- vanishes / the flow is abelian / the adjoint tangent does not recover the commutator) equals
-- (181 : Cut) forces, after evaluating the genuine value (which is exactly 1), the false numeric
-- `(1 : Cut) = (181 : Cut)` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine witness bracket entry GENUINELY is 1
-- (the non-abelian commutator value the adjoint-flow derivative recovers), so claiming it is 181 is
-- genuinely FALSE (1 ≠ 181 in the derived ordered field Cut, characteristic 0).
--   The false numeric `1 = 181` is DISTINCT from the banked battery (… C210 4=1, C211 4=179,
-- C212 180=1).
--   PHYSICS-WORDS-REMOVABLE: there are NO physics words; delete "exp"/"adjoint"/"flow"/"derivation"/
-- "automorphism"/"Lie bracket"/"commutator"/"gauge" and the matrix-commutator entry
-- (witM*witA − witA*witM) 0 0 over the derived ordered field Cut equals 1; claiming it equals 181
-- forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the witness matrix-commutator entry `(witM * witA − witA * witM) 0 0` — the value the
    adjoint-flow derivative `adjMap_tangent` recovers at entry `(0,0)` for the non-commuting witness
    pair (`⁅witM,witA⁆`, the non-abelian first-order content) — equals `(181 : Cut)`. It GENUINELY
    equals `1` (`wit_bracket_ne`'s anchor: `(witM*witA) 0 0 = 1`, `(witA*witM) 0 0 = 0`). The WRONG
    claim that it is `181` (the adjoint flow is trivial / the non-abelian bracket vanishes / the flow
    is abelian) reduces to the false numeric `(1 : Cut) = (181 : Cut)`, so this must NOT compile. -/
theorem adjMap_bracket_wrong_value_BOGUS :
    (witM * witA - witA * witM) (0 : Fin 8) (0 : Fin 8) = (181 : Cut) := by
  rw [show (witM * witA - witA * witM) (0 : Fin 8) (0 : Fin 8) = (1 : Cut) from by
    simp only [witM, witA, Matrix.sub_apply, Matrix.mul_apply, Matrix.single, Matrix.of_apply]
    norm_num [Finset.sum_ite_eq, Finset.sum_ite_eq']]

end

end Counterexamples
