# N108 PREREG — THE OCTONION-BLOCK SO(8)-GENERATION LEG (a concrete multi-block factorization)

Frozen BEFORE compute. Run 289. Clean git tree (no inherited WIP — fresh node, NOT a crime scene).

## TARGET (ROADMAP §N108 priority (i), the immediately-bankable structural piece)
N107 banked the abelian A-torus leg (the ninth-rotation circle subgroup ≅ SO(2)). The full
compact-SO(9) surjectivity needs the OCTONION-BLOCK SO(8)-GENERATION leg. The HEAVY full
Moufang/triality "biMulLin words generate SO(8)" is the W1 group-manifold core Mathlib lacks
over Cut. THE IMMEDIATELY-BANKABLE PIECE: a CONCRETE MULTI-BLOCK FACTORIZATION — a product of
TWO genTwoPlaneLin octonion-block 2-plane rotations of DISTINCT imaginary 2-planes, reaching a
HIGHER-RANK octonion-block compact rotation (the SO(8) analogue of N107's ninth composition).

`doubleBlockLin u w a b := genTwoPlaneLin a b * genTwoPlaneLin u w`
  = (biMulLin b b * biMulLin a a) * (biMulLin w w * biMulLin u u)
a Module.End Cut STVC that is a four-generator biMulLin word ∈ genIsomMonoidLin (mul_mem), a
QvC-isometry (genTwoPlaneLin_isQvIsomC composed), bridged ∈ genIsomMonoidC2, and — the STRUCTURAL
NOVELTY — when the two 2-planes span{u,w}, span{a,b} are DISJOINT, the composite rotates a 4-dim
imaginary subspace (rank ≥ 4), strictly higher than either single 2-plane block (rank 2). A single
block genTwoPlaneLin u w FIXES the {a,b} plane; the composite NEGATES it — the witness of higher rank.

## GO / NO-GO
GO if I bank, foundations-only [propext, Classical.choice, Quot.sound]:
  (1) doubleBlockLin def + apply (the four-generator octonion-block composite).
  (2) doubleBlockLin_mem_genLin — ∈ genIsomMonoidLin (a finite biMulLin word, mul_mem).
  (3) doubleBlockLin_isQvIsomC — a QvC-isometry (composition of two genTwoPlaneLin isometries).
  (4) doubleBlockLin_mem_gen2 — bridged ∈ genIsomMonoidC2 (the transport).
  (5) ★ W8 TEETH: a concrete two-distinct-plane composite NEGATES a unit that EITHER single block
      alone FIXES — the higher-rank witness, read as a concrete coordinate value, costume C140.
NO-GO / DECOMPOSE if the multi-block coordinate computation resists (octonion bookkeeping for a
disjoint second plane too heavy): bank the abstract doubleBlockLin structural lemmas (1)-(4) over
GENERAL u,w,a,b (which need no concrete coordinate compute, only mul_mem + composition), child the
concrete-teeth + the global SO(8)-generation remainder.

## KILL (W9 — instrument-failure classifier, NOT theory failure)
- Any single tactic > 60s wall on any sub-obligation = INSTRUMENT failure. STOP, measure, decompose.
- Structural lemmas (mem_genLin, isQvIsomC, mem_gen2) are pure mul_mem / composition over BANKED
  lemmas — they must be ~instant. If NOT instant → wrong framing, reframe through the banked
  genTwoPlaneLin_* not coordinate expansion.
- The concrete-teeth coordinate read-off is the only compute risk: if `ext <;> simp [CD...]` on the
  4-generator concrete composite blows past 60s → DECOMPOSE: pick a teeth that reuses a banked
  single-block coordinate fact, or child the concrete teeth.
- NO inflated maxHeartbeats. NO native_decide. NO monolithic brute on expanded coordinates.
- Checkpoint at ~50% turns/iterations; FINALIZE (commit + gate-bg + child + complete) with margin.

## STANDARD (the second gate)
UNBROKEN: every object from genTwoPlaneLin (N100) / biMulLin (N106) / the transport (N100) / the
derived ℝ Cut + O Cut. NO posited Lorentz group, NO Mathlib ℝ/ℂ as content, NO bridge.
COMPLETE: all decls foundations-only, #print axioms verified vs the built olean.
WORDS-REMOVABLE: delete rotation/SO(8)/block/plane/octonion/isometry/generator/word/compact — what
remains is pure linear algebra over Cut: a product of four biMulLin operators lies in the generated
submonoid, preserves QvC, and a concrete instance moves an octonion coordinate a single factor fixes.

## COSTUME C140
A WRONG multi-block-factorization coordinate claim: the concrete doubleBlockLin negates some unit to
−unit (coordinate −1); a wrong claim asserts a bogus numeric DISTINCT from the banked battery
(... C137 3/5=59, C138 5/13=61, C139 7/25=67). PASS_SIGNATURE an ERE matching a trailing substring,
false numeric e.g. `= 71` (prime, distinct).
