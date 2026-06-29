# N180 PREREG — frozen GO/NO-GO + KILL before compute

## Target (the genuinely-new front (i) core, MEASURED light)
N177 banked the one-parameter flow law ONLY for the SAME generator: `expOLin (s•D') ∘ expOLin (t•D') = expOLin ((s+t)•D')`.
The genuinely-UNBANKED structure: the **COMMUTING-GENERATOR FLOW LAW** — for two DIFFERENT derivations
`D' E' : Module.End Cut (O Cut)` that COMMUTE as operators (`Commute D' E'`, i.e. the Lie bracket
`⁅D',E'⁆ = 0` — the abelian case of `isDeriv_bracket`):
  (A) `derivMatrix` is a RING HOM on composition: `derivMatrix (D'*E') = derivMatrix D' * derivMatrix E'`
      (via `toMatrixAlgEquiv'` map_mul + `conjRingEquiv` map_mul) and additive `derivMatrix_add`.
  (B) operator-commute transports to matrix-commute: `Commute D' E' → Commute (derivMatrix D') (derivMatrix E')`.
  (C) THE PRODUCT LAW: `expOLin D' ∘ expOLin E' = expOLin (D' + E')` (commuting generators), generalizing
      N177's same-generator special case (`D'=s•D₀, E'=t•D₀` always commute).
  (D) THE FLOWS COMMUTE: `expOLin D' ∘ expOLin E' = expOLin E' ∘ expOLin D'`.
  (E) THE GROUP COMMUTATOR VANISHES: the bundled `expOEquiv` group commutator of two commuting flows is `id`
      — the BCH first order in the abelian case: `⁅D,E⁆ = 0 ⟹ [flow,flow] = id = expOEquiv 0`.
      This is the honest CONNECTION expO_tangent N41g + isDeriv_bracket → expOEquiv_flow N177 the task names.

## Why NOT the full non-abelian BCH first-order
The headline "[exp(sD),exp(tE)] first order = st·[D,E]" for NON-commuting D,E needs the SECOND-order Taylor
expansion of exp over Cut, which is NOT banked (expO_tangent gives only the FIRST derivative d/dt exp(tD)|₀ = D).
That is a W9-HEAVY node requiring a dedicated 2nd-order-tangent/Taylor sub-node. The ABELIAN case (E above) is
the genuinely-LIGHT, non-vacuous, theory-faithful core that connects all three banked pieces NOW.

## GO / NO-GO (frozen)
GO if the probe compiles (A)+(B)+(C) clean foundations-only in a bounded `lake env lean` probe (≤ KILL).
Then bank (A)-(E) as production. NON-GO→ if (C) resists, decompose: bank (A)(B) (the ring-hom lever) and child (C)+.

## KILL (instrument-failure thresholds — W9)
- KILL per obligation: 90s `lake env lean`. KILL whole-file probe: 150s.
- If any single obligation exceeds KILL → it is an INSTRUMENT failure (NOT theory): measure smallest sub-obligation,
  decompose, NEVER inflate maxHeartbeats, NEVER monolithic brute. This node is expected LIGHT (finite rw chains over
  banked lemmas, same shape as expOLin_flow_apply N177 which was 8.7s).

## Costume (next id C212)
Must bite a WRONG claim of the commuting-flow law, reducing to a false numeric DISTINCT from the battery
(… C210 4=1, C211 4=179). Use `1 = 180` (or `180 = 1`). Anchor: the additive generator-sum parameter the
product law collects (`Commute → expOLin D' ∘ expOLin E' = expOLin (D'+E')`), the genuine bite being the
flow combines the generators ADDITIVELY (the wrong claim it does not → false numeric).

## Anti-vacuity (W8)
Witness with a CONCRETE commuting pair (e.g. `D' = E'` or `D', 0`) where the product law GENUINELY composes a
non-trivial flow, plus the group-commutator-vanishes statement on a genuine commuting pair (NON-vacuous: the
hypothesis `Commute` is satisfiable and the conclusion is a real identity, not `0=0`).
