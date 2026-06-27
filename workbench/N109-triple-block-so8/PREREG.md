# N109 PREREG — THE TRIPLE-BLOCK SO(8)-GENERATION LEG (a concrete rank-≥6 octonion-block factorization)

FROZEN before compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## ROADMAP §N109 spec, priority (i)
The full compact-SO(9) surjectivity needs the FULL SO(8)-generation. N108 banked a concrete
HIGHER-RANK TWO-block octonion factorization (doubleBlockLin reaches a 2-plane the single block
fixes — rank ≥ 4). The immediately-bankable NEXT structural piece (ROADMAP priority (i)
verbatim): "a THREE-or-more-block composite reaching rank ≥ 6 (extending the N108 two-block
higher-rank witness toward the full rank-8 octonion-block rotation — measure whether a
tripleBlockLin = genTwoPlaneLin · doubleBlockLin reaching a DISTINCT third 2-plane closes
cleanly, the SO(8) analogue of stacking more N107-style compositions)."

## THE TARGET (N109 — chosen front)
Bank a concrete TRIPLE-block octonion factorization:

    tripleBlockLin u w a b c d := genTwoPlaneLin c d * doubleBlockLin u w a b
        = genTwoPlaneLin c d * (genTwoPlaneLin a b * genTwoPlaneLin u w)

a SIX-generator biMulLin word (three octonion-block 2-plane rotations of distinct 2-planes),
which:
  1. lies in genIsomMonoidLin (mul_mem of genTwoPlaneLin_mem_genLin + doubleBlockLin_mem_genLin);
  2. is a QvC-isometry (composition of three genTwoPlaneLin isometries N103);
  3. bridges ∈ genIsomMonoidC2 (the N100 transport);
  4. bridges to the nested SIX-factor biMulFun composite (map_mul + genTwoPlaneLin_apply thrice).

THE HIGHER-RANK WITNESS (W8 teeth — rank ≥ 6). The fourth octonion unit
    ii := CD.iota (CD.iota Dbl.J)         (the embedded complex unit i₁, a Born-unit-imaginary)
lies OUTSIDE the quaternion span{e₂, ιe₂, ke2je2} and anticommutes with all three. It is:
  • FIXED by the FIRST block genTwoPlaneLin e₂ ιe₂ (anticommutes with e₂, ιe₂ — biMulComp_fixes_common);
  • FIXED by the DOUBLE block doubleBlockLin e₂ ιe₂ ke2je2 e₂ (anticommutes with ke2je2, e₂ too);
  • NEGATED by the TRIPLE block (third block genTwoPlaneLin ii e₂ negates ii via biMulComp_negates_u).
So the triple block reaches a THIRD distinct 2-plane (span{ii, ...}) that BOTH the single AND the
double block leave fixed — a STRICTLY HIGHER-RANK (rank ≥ 6) octonion-block compact rotation. The
distinguishing coordinate: the deep slot of ii reads the negated value where the double block fixed it.

## GO / NO-GO (decided BEFORE compute)
- GO if: tripleBlockLin compiles, all four structural lemmas (mem_genLin / isQvIsomC / mem_gen2 /
  bridge) close by the SAME structural route as N108 (Module.End.mul_apply, map_mul,
  genTwoPlaneLin_apply — NO rfl on nested coercion, NO inflated maxHeartbeats), AND the witness
  ii is a clean Born-unit-imaginary anticommuting with e₂/ιe₂/ke2je2 (each by one `ext <;> simp`),
  AND the triple block negates ii while the double block fixes it.
- NO-GO / DECOMPOSE if: the fourth unit ii does NOT cleanly anticommute / square to −1 (then pick a
  different unit, or DECOMPOSE — bank the four structural triple-block lemmas WITHOUT the rank-6
  witness, child the witness). The structural triple-block lemmas alone are bankable (they extend
  the submonoid/isometry/bridge machinery to a six-generator word) even if the specific witness needs
  a different unit.

## KILL (instrument-failure budget, W9)
- KILL any single tactic that does not return in < 60s in a bounded probe → it is an INSTRUMENT
  failure (wrong framing), NOT a theory failure. The N108/N107 wall was rfl-on-nested-Module.End-
  coercion at whnf-200000; the cure is the STRUCTURAL route (Module.End.mul_apply / map_mul /
  genTwoPlaneLin_apply), already banked. Do NOT inflate maxHeartbeats. Do NOT brute a coordinate goal.
- If the `ext <;> simp [...]` for ii's anticommutations does not close in < 30s, MEASURE which simp
  lemmas are missing (likely Dbl.J unfold) and add them; if still stuck, switch ii to a different unit.
- Checkpoint at ~50% turns/iterations. Bank-as-you-go: the instant the structural lemmas compile,
  MOVE to production + wire + commit BEFORE chasing the witness.

## COSTUME (next id C141) — must BITE (W8)
A WRONG triple-block-factorization / rank-6 coordinate claim. The concrete triple octonion-block
rotation applied to (0,0,ii) reads the NEGATED deep slot; a wrong numeric (DISTINCT from C138 5/13=61,
C139 7/25=67, C140 1=71) must fail to compile. Candidate false numeric: a wrong coordinate value
like `1 = 73` or `(-ii).<slot> = <wrong>`.

## STANDARD self-check (applied before commit)
- UNBROKEN: every object from N95/N100/N103/N108 + the derived Cut + Module.End/Submonoid/map_mul
  machinery + Dbl.J (the DERIVED complex unit). No posited Lorentz group, no Mathlib ℝ/ℂ as content.
- COMPLETE: all decls foundations-only [propext, Classical.choice, Quot.sound], independently audited.
- WORDS-REMOVABLE: delete rotation/isometry/block/SO(8)/rank/octonion/word/... → pure linear algebra
  over the derived complete ordered field Cut: a product of six biMulLin operators lies in the
  generated submonoid, preserves QvC, bridges to a nested self-map composite, and sends (0,0,z) to
  (0,0,−z) for a specific z that a four-factor sub-composite fixes.
