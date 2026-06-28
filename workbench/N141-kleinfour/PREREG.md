# N141 PREREG — THE COMPOSITION GROUP ℤ/2 × ℤ/2 ⊂ G₂ (Klein four-group)

FROZEN before compute. KILL classifies a fight as INSTRUMENT failure, not theory failure.

## NODE
The §N141 (i) FORWARD joint the second independent G₂ direction opens: the COMPOSITION GROUP the
two banked involutions generate. With N139 `octTopNeg` (outer CD top-half negation) and N140
`octInnerNeg` (inner CD top-half negation) both concrete non-identity octonion algebra-automorphisms
in `octStab`, their product `octCompNeg := octTopNeg ∘ octInnerNeg` is a THIRD series-free involution.
The four maps {id, octTopNeg, octInnerNeg, octCompNeg} form a KLEIN FOUR-GROUP ℤ/2 × ℤ/2 ⊂ G₂ = Aut(O)
— pinning the gauge group as ≥ ℤ/2×ℤ/2 (4 elements) with an abstract group law, strictly more than
N140's "≥ 3 elements / strictly larger than ℤ/2".

## WHY THIS IS THE ADVANCE (W4.5 — opens structure, not a re-pin)
N140 pinned "gauge group strictly larger than ℤ/2" (3 distinct elements, no group law among them).
This node ADVANCES: it gives the FOURTH element (octCompNeg ≠ id, octTopNeg, octInnerNeg) AND the
ABSTRACT GROUP STRUCTURE (the Klein-four multiplication table: each non-id element is an involution,
the product of any two distinct non-id elements is the third, they commute). That is NEW structure —
a derived subgroup ℤ/2×ℤ/2 of G₂, not another lateral non-identity automorphism re-confirming
"> ℤ/2". The §N141 frontier names this explicitly ("the COMPOSITION group these generate, e.g. that
octTopNeg, octInnerNeg and their product give a ℤ/2 × ℤ/2 ⊂ G₂").

## TRUNK REFRAME (W1 step 2 / THE ONE LAW)
NO new construction needed beyond composition of two BANKED series-free involutions. octCompNeg
acts as `⟨a,b⟩ ↦ ⟨hTopNeg a, −hTopNeg b⟩` (negate inner im of each H-component AND outer im-half).
It is an automorphism as the composition of two IsAlgAutCut maps (general lemma: IsAlgAutCut is
closed under LinearEquiv.trans). NO tsum, NO exponential, NO W9 risk. The two involutions COMMUTE
(hTopNeg commutes with neg), giving the abelian Klein-four.

## GO / NO-GO
- GO if: octCompNeg is IsAlgAutCut (composition lemma), is a non-identity involution distinct from
  octTopNeg/octInnerNeg (4 distinct elements via action on e₂ and innerGen), the Klein-four
  multiplication table closes (octTopNeg∘octInnerNeg = octCompNeg, octCompNeg∘octCompNeg = id,
  octCompNeg∘octTopNeg = octInnerNeg, etc.), they commute, AND octCompNeg lands in octStab.
- NO-GO / fall back to a leaner advance (just the third automorphism octCompNeg + its independence,
  childing the full group-table/Subgroup object) if the Subgroup/MulEquiv wrapping proves heavy.

## KILL (W9 instrument budget)
- KILL any single obligation at 90s compile. If a `simp`/`ring` over the CD coordinates blows past
  90s → INSTRUMENT failure, decompose (it is pure componentwise algebra, must be cheap like N139/N140).
- If the abstract `Subgroup`/`MulEquiv` to a Mathlib Klein-four object resists → that is the
  childable remainder; bank the CONCRETE group-table facts (closure + involution + distinctness +
  commutativity + octStab membership) which ALREADY pin "ℤ/2×ℤ/2 ⊂ G₂" classification-sufficiently.
- Never inflate maxHeartbeats. Never re-run a route shown to blow up.

## DELIVERABLE (classification-sufficient)
Minimal banked set that pins "the two banked involutions generate a Klein four-group ℤ/2×ℤ/2 ⊂ G₂":
1. `IsAlgAutCut.trans` (composition of automorphisms is an automorphism) — general lever.
2. `octCompNeg` : the third map (as octTopNeg.trans octInnerNeg or direct def) + IsAlgAutCut.
3. octCompNeg action on e₂ and innerGen (negates BOTH) → distinct from id/octTopNeg/octInnerNeg.
4. Involution: octCompNeg ∘ octCompNeg = refl (and the other three are involutions — banked/easy).
5. Klein-four closure table: octTopNeg∘octInnerNeg = octCompNeg, and the commuting products.
6. octBlockEndC octCompNeg ∈ octStab (the third concrete gauge element).
7. W8 anchor: octCompNeg_gFormC_e2 = 1 (it negates e₂ but preserves Born self-overlap) — costume C173.

## COSTUME C173
Wrong composition-group / third-automorphism / Klein-four / group-structure claim → false numeric
1 = 141, DISTINCT from C115 1=7 … C172 1=140. Anchor: octCompNeg preserves e₂'s Born self-overlap = 1;
claiming it reads 141 forces 1 = 141. Rejected at the math field.
