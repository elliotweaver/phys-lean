# N178 PREREG — THE DISCRETE COMPONENT-GROUP as the ABSTRACT GROUP OBJECT ℤ/2 × ℤ/2

Frozen BEFORE compute (W9 measure-first; GO/NO-GO + KILL).

## Front chosen (after W4.5 measurement)
Front (i): the DISCRETE COMPONENT-GROUP STRUCTURE — abstract the banked Klein-four
`kleinFour` (N141, `Subgroup (O Cut ≃ₗ[Cut] O Cut)`) as the canonical abstract group
object: it is a Mathlib `IsKleinFour` group (cardinality 4, exponent 2), hence
`Nonempty (kleinFour ≃* Multiplicative (ZMod 2 × ZMod 2))` — the explicit ℤ/2 × ℤ/2.

### Why this OPENS (not re-pin — W4.5 verified)
N141 banked ONLY the carrier `{1, octTopNeg, octInnerNeg, octCompNeg}` as a `Subgroup`,
the generation `kleinFour_eq_closure`, and `kleinFour_elem_involution` (each squares to 1).
It NEVER computed the CARDINALITY (`Nat.card = 4`), NEVER the EXPONENT
(`Monoid.exponent = 2`), NEVER the abstract group-object class `IsKleinFour`, and NEVER
the iso to the canonical `ZMod 2 × ZMod 2`. The abstract group object (the π₀-type
classification "this concrete subgroup of G₂ = Aut(O) IS the Klein four-group") is the
genuinely-unbanked structure. The distinctness facts it needs (the four elements pairwise
distinct → card 4, the elementary-abelian fingerprint → exponent 2) are exactly what
upgrades the concrete carrier to the abstract group object.

### Mathlib levers (machinery over the DERIVED object, NOT content)
`Mathlib.GroupTheory.SpecificGroups.KleinFour`: `IsKleinFour` mixin (`card_four` +
`exponent_two`), `IsAddKleinFour (ZMod 2 × ZMod 2)` instance, `IsKleinFour.mulEquiv` /
`IsKleinFour.nonempty_mulEquiv` (any two IsKleinFour groups are isomorphic). The ground
object `kleinFour` is fully DERIVED (octTopNeg/octInnerNeg N139/N140 over the derived ℝ
Cut + the terminal algebra O Cut + G₂ = Aut(O) N20). NO Mathlib ℝ/ℂ as content; NO posited
group/topology/π₀ — the group is the banked Subgroup, the count is computed from banked
distinctness.

## GO / NO-GO
GO if a bounded probe shows `IsKleinFour ↥kleinFour` (card 4 + exponent 2) closes
foundations-only from the banked carrier + distinctness facts, and the abstract iso to
`Multiplicative (ZMod 2 × ZMod 2)` follows from `nonempty_mulEquiv`.
NO-GO → fall back to front (ii) flow-bracket or front (iii) spectral↔exp connection.

## KILL (instrument-failure threshold)
KILL = 90s for any SINGLE obligation. If any one lemma exceeds 90s compile → declare W9
instrument failure → MEASURE smallest sub-obligation, DECOMPOSE (card / exponent / iso as
separate banked lemmas), or reframe. Whole-module warm target < 60s. NEVER inflate
maxHeartbeats; NEVER monolithic brute on a coordinate goal.

## Production
`Phys/Algebra/LorentzContinuumKleinFourGroupObject.lean`, namespace `Phys.Algebra`,
preamble `attribute [local instance] CD.narCD CD.srCD`. Wire into Phys.lean +
Audits/AxiomAudit.lean (END of import list + #print axioms lines). Costume C210
(next free id), a WRONG component-count claim reducing to a false numeric DISTINCT from
the battery (… C208 1=176, C209 177=1 → use `4 = 1`).

## DONE
The abstract group-object identification PROVED (card 4, exponent 2, `IsKleinFour`,
`Nonempty (≃* Multiplicative (ZMod 2 × ZMod 2))`), gate D0–D6 green, costume C210 bites
`4 = 1`, foundations-only, NON-VACUOUS, committed + LEDGER + ROADMAP, STANDARD applied,
next node childed onto the chain tail.
