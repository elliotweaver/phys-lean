# N142 PREREG — THE EVEN/SPIN GRADING OF THE CLIFFORD COVER (frozen before compute)

## NODE (specified against what the chain ACTUALLY produced)
N141 banked the gauge-side Klein-four ℤ/2×ℤ/2 ⊂ G₂. The §N142 FORWARD FRONTIER (priority i)
names as its FIRST candidate joint: **THE EVEN subalgebra `CliffC⁰` Spin structure as a Mathlib
even-grade object** (`CliffordAlgebra.even` / `evenOdd`, the Spin group as the even-grade
covering units; `cover_neg_unit`/`{±1}`-kernel N136 giving the Spin/Pin index-2 relation).

MEASURED what the chain holds (N133-N136): the generator-level cover (`reflection_clifford_conj`),
the even/Spin two-generator homomorphism (`cover_compose_two`/`cover_conj_even`), the GLOBAL Pin
cover surjectivity (`cover_global_bvIsom`: every isometry has a covering unit `CliffCˣ`), the {±1}
cover kernel (`cover_neg_unit`/`cover_kernel_distinct`/`cover_kernel_neg_one_sq`). NOT yet banked:
the ℤ/2 PARITY GRADING that separates Spin (even, proper) from improper (odd) — the even
subalgebra `even QvCQuad` as the Spin grade, the `involute`-fixed characterization, the abstract
Lipschitz/Clifford-group identification, and the {±1} kernel sitting inside the even (Spin) part.

This is genuinely NEW structure (W4.5 ADVANCE not re-pin): N133-N136 pinned the cover + its kernel
as a SET-level two-to-one map; N142 banks the ℤ/2-GRADED (even/odd = Spin/improper) structure of
that cover — the even subalgebra `CliffC⁰` IS the Spin grade, separated from the odd grade by the
grade involution, with the {±1} kernel living in the even part (the Spin/Pin index-2 datum).

## THE TRUNK REFRAME (W1 step 2 / THE ONE LAW — no new construction, no W9 risk)
Pure Mathlib grading machinery (`evenOdd`, `even`, `involute`) applied to the DERIVED Clifford
algebra `CliffC = CliffordAlgebra QvCQuad` over the DERIVED ℝ `Cut` and the cascade's OWN covering
units (`cliffUnitOf`, N135). No tsum, no exponential, no coordinate brute. Every fact is one
`Submodule`/`Subalgebra`/`AlgHom` lemma chained on the banked `cliffUnitOf`/`CliffCovers` family.

## GO / NO-GO (frozen)
GO if ALL of these compile foundations-only over CliffC:
  1. cliffUnitOf_mem_lipschitzGroup : cliffUnitOf a ha ∈ lipschitzGroup QvCQuad
     (the derived covering generator IS an element of Mathlib's abstract Lipschitz/Clifford group)
  2. cliffUnit_two_mem_even : (cliffUnitOf a ha * cliffUnitOf b hb : CliffC) ∈ even QvCQuad
     (the even = Spin two-generator product lands in the even subalgebra — the Spin grade)
  3. even_involute_fixed : x ∈ even QvCQuad → involute x = x  (Spin = involute-fixed)
  4. gen_involute_neg : involute (ι QvCQuad a) = -(ι QvCQuad a)  (a single reflection = odd/improper)
  5. cover_kernel_neg_one_mem_even / cover_kernel_one_mem_even : ±1 ∈ even QvCQuad
     (the {±1} cover kernel lies in the even/Spin part — the Spin/Pin index-2 datum)
  6. HEADLINE: cover_compose_two's even unit (cliffUnitOf a ha * cliffUnitOf b hb) BOTH covers the
     composite proper isometry (houseHolderM a ∘ houseHolderM b) AND is even-graded — a PROPER
     (even-reflection-word) isometry is covered by an EVEN (Spin-grade) unit.
NO-GO if the Mathlib grading API does not apply to CliffC's instances (Invertible (2:Cut) etc.)
without a content import of ℝ/ℂ — then reframe / decompose.

## KILL (instrument-failure budget, W9)
KILL = 90s per single obligation in a bounded probe. If any ONE lemma's smallest sub-obligation
exceeds 90s in an isolated `lake env lean` probe, declare INSTRUMENT failure (not theory): STOP,
do not inflate maxHeartbeats, decompose or reframe. No monolithic brute (`decide`/`ring` on a
fully-expanded ground goal). Expected: every obligation is a Submodule/AlgHom lemma, sub-second to
a few seconds. ≥2 probe runs ending at full budget banking nothing ⇒ W1 dissolution ticket.

## COSTUME (C174 — must BITE)
A WRONG even/Spin-grading / parity / Spin-group / index-2 / cover-kernel claim must FAIL to
compile, reducing to a false numeric `1 = 142` DISTINCT from C115 1=7 … C173 1=141. Anchor: a
banked even-grade read-off (e.g. the even product / kernel even-membership / involute-fixed). The
wrong claim mis-reads it forcing `1 = 142`.

## PHYSICS-WORDS-REMOVABLE
Delete Spin/Pin/cover/spinor/even/odd/grade/parity/involution/Lipschitz/Clifford/reflection/
Lorentz/gauge/index/kernel/proper/improper → pure algebra over the derived field `Cut`, the
Clifford algebra `CliffC` of `QvCQuad`, Mathlib's `evenOdd`/`even`/`involute`/`lipschitzGroup`:
the unit `ι a` is in the subgroup-closure of vector-units; `ι a · ι b` is in the even subalgebra;
even elements are `involute`-fixed; `ι a` is `involute`-negated; `±1` are in the even subalgebra.
No theorem STATEMENT needs a physics word.
