import Phys.Algebra.DerivationOCommutingFlow

namespace Counterexamples

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C212): A BOGUS COMMUTING-GENERATOR FLOW CLAIM — "THE EXPONENTIAL FLOWS OF TWO
-- COMMUTING DERIVATIONS DO NOT COMPOSE BY ADDING THEIR GENERATORS / THE COMMUTING-GENERATOR PRODUCT
-- LAW LANDS AT THE WRONG GENERATOR".
-- N180 banks the COMMUTING-GENERATOR FLOW LAW expOLin D' ∘ expOLin E' = expOLin (D' + E') for two
-- DIFFERENT derivations whose operators COMMUTE (expOLin_comm_flow_apply / expOLin_comm_flow), the
-- flows-commute corollary (expOLin_comm_flow_comm), the bundled one-parameter-subgroup form
-- (expOEquiv_comm_flow), and ★★ the abelian BCH first order: ⁅D',E'⁆ = 0 forces the two flows to
-- commute (expOLin_bracket_zero_flows_commute). The GENUINELY-NEW structure vs N177 (which handled
-- only the SAME generator s•D', t•D') is the RING-HOM lever: derivMatrix is multiplicative on
-- composition (derivMatrix_mul) and additive (derivMatrix_add), so OPERATOR commutation transports to
-- MATRIX commutation (derivMatrix_commute), feeding the banked matrix one-parameter-subgroup law
-- expMap_mul_of_commute (N40). The DEFINING content — the piece the same-generator law and the static
-- N41 automorphism do NOT express — is that two COMMUTING generators combine ADDITIVELY in the flow:
-- the proof rests on `← derivMatrix_add` re-assembling derivMatrix D' + derivMatrix E' into
-- derivMatrix (D' + E'). So the generator at which the composed commuting flow lands is the EXACT sum
-- D' + E' — at the SCALAR/eigenvalue level (the additive parameter the additive-group homomorphism
-- t ↦ expOEquiv (t•D') produces, the same `add_smul`/`derivMatrix_add` additivity) the combined
-- parameter (1 : Cut) + (179 : Cut) is (180 : Cut) EXACTLY, never (1 : Cut) (which a wrong
-- non-additive / idempotent commuting-flow law would claim).
--   THE BOGUS claim that the additive combined flow value (1 : Cut) + (179 : Cut) (a stand-in for ANY
-- wrong commuting-flow law: the flows have no additivity in their generators / composing two commuting
-- flows does not add the generators / the product law lands at the wrong generator) equals (1 : Cut)
-- forces, after evaluating the genuine additive value (which is exactly 180 = 1 + 179), the false
-- numeric `(1 : Cut) = (180 : Cut)` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine additive combined value
-- (1 : Cut) + (179 : Cut) is 180 (it GENUINELY is the additive combination the abelian flow law
-- produces — the SAME `derivMatrix_add` / `add_smul` additivity that closes expOLin_comm_flow_apply),
-- so claiming it collapses back to (1 : Cut) is genuinely FALSE (1 ≠ 180 in the derived ordered field
-- Cut, characteristic 0).
--   The false numeric `1 = 180` is DISTINCT from the banked battery (… C209 177=1, C210 4=1,
-- C211 4=179).
--   PHYSICS-WORDS-REMOVABLE: there are NO physics words; delete "exp"/"flow"/"derivation"/
-- "automorphism"/"one-parameter group"/"Lie bracket"/"generator" and the value (1 : Cut) + (179 : Cut)
-- over the derived ordered field Cut equals 180; claiming it equals 1 forces the false numeric. The
-- bite is a false NUMERIC, name-independent.

/-- BOGUS: the additive combined commuting-flow value `(1 : Cut) + (179 : Cut)` — the generator value
    at which the composition `expOLin D' ∘ expOLin E'` of two commuting flows lands by the N180 law
    `expOLin_comm_flow_apply` (`expOLin D' ∘ expOLin E' = expOLin (D' + E')`, the additive combination
    via `← derivMatrix_add`) — equals `(1 : Cut)`. It GENUINELY equals `180` (`(1 : Cut) + (179 : Cut)
    = 180`, the literal additive combination the abelian flow law collects). The WRONG claim that it is
    `1` (the commuting flows are non-additive in their generators / the product law lands at the wrong
    generator / the flows do not compose) reduces to the false numeric `(1 : Cut) = (180 : Cut)`, so
    this must NOT compile. -/
theorem expOLin_comm_flow_additive_wrong_value_BOGUS :
    ((1 : Cut) + (179 : Cut)) = (1 : Cut) := by
  rw [show (1 : Cut) + (179 : Cut) = (180 : Cut) by norm_num]

end

end Counterexamples
