# N111 PREREG — THE GENERAL SO(8)-GENERATION RANK-INDUCTION (abstract, arbitrary-length octonion-block word)

FROZEN before compute. KILL classifies a fight as INSTRUMENT failure (W9), not theory failure.

## THE NODE (chosen front, ROADMAP §N111 priority (i))
The EXPLICIT-witness ladder rank 2→4→6→8 (N100/N103, N108, N109, N110) has TOPPED OUT
(`O Cut` is 8-dimensional, four orthogonal 2-planes exhaust it). So the immediately-bankable
next piece is NO LONGER another explicit rung but the **ABSTRACT rank-induction**: the
arbitrary-length octonion-block word and its generation/isometry/fixes/negates structure proved
by LIST INDUCTION, generalizing the hand-unrolled `block1/2/3_fixes_*` /
`double/triple/quadBlock_negates_*` / `*BlockLin_mem_genLin` witnesses to ALL k at once.

This is genuine structural advance: the explicit lemmas prove the reach for k≤4 by hand; the
abstract lemma proves the reach + the rank-fixes structure at EVERY length k via one induction.

## THE OBJECTS (all DERIVED, banked N49–N110, over the derived ℝ `Cut` + terminal `O Cut`)
- `blockWordLin : List (O Cut × O Cut) → Module.End Cut STVC` — the arbitrary-length octonion-block
  word: `[] ↦ 1`, `(u,w)::rest ↦ genTwoPlaneLin u w * blockWordLin rest`. Generalizes
  genTwoPlaneLin (1 block) / doubleBlockLin (2) / tripleBlockLin (3) / quadBlockLin (4).
- All built from banked `genTwoPlaneLin` (N100), `genTwoPlaneLin_mem_genLin`/`_isQvIsomC` (N100/N103),
  `endToFunEnd`/`genIsomMonoidLin` (N100), `biMulFun_imag_fixes_anticomm` (N94), `biMulComp_negates_u` (N95).

## THE TARGETS (the abstract rank-induction theorem set, all by LIST INDUCTION)
1. `blockWordLin` def + `blockWordLin_nil`/`_cons` unfolds.
2. ★ `blockWordLin_mem_genLin` — every-pair-Born-unit ⇒ `∈ genIsomMonoidLin` AT ARBITRARY LENGTH
   (the FULL generation reach, list induction: nil→one_mem, cons→mul_mem). The generalization of
   the k≤4 explicit membership lemmas.
3. ★ `blockWordLin_isQvIsomC` — QvC-isometry at arbitrary length (list induction).
4. `blockWordLin_mem_gen2` — bridge transport (the N100 transport applied to the arbitrary word).
5. `blockWordFun_apply`/bridge-unfold — the bridge applies as the nested biMulFun composite.
6. ★★ `blockWordLin_fixes_anticomm` (THE RANK-FIXES — the abstract generalization of
   block1/2/3_fixes): if `z` anticommutes with every unit in `L` (+ left-square laws), the word
   FIXES `(0,0,z)`. Arbitrary length, ONE list induction.
7. ★★ `blockWordLin_negates` (THE RANK-STEP — abstract generalization of double/triple/quad_negates):
   prepend a `z`-block onto a word that fixes `z` ⇒ the (k+1)-block word NEGATES `(0,0,z)`.
8. W8 / non-vacuity: a CONCRETE instance reproducing the explicit witness (the 4-block word on
   `ii5`, recovering `block3_fixes_ii5` / `quadBlock_negates_ii5` as the L-of-length-4 case), reading
   the deep coordinate.

## GO / NO-GO
- GO: targets 1–7 compile foundations-only `[propext, Classical.choice, Quot.sound]`, plus the W8
  concrete instance (8) reads the correct deep-slot value, gate D0–D6 green, costume C143 bites a
  WRONG rank-induction coordinate.
- NO-GO / DECOMPOSE: if the bridge coercion chain on the arbitrary-length word resists (the N107–110
  `Module.End`-coercion wall at arbitrary length), bank what compiles (the mem_genLin + isQvIsomC
  reach, which need no bridge) and child the bridge-side fixes/negates remainder.
- W1 DISSOLUTION: if the abstract induction genuinely resists after measure+reframe through the
  trunk, honest block + child — NOT a grind, NOT a weaker claim.

## KILL (W9 INSTRUMENT budget)
- KILL = 90s per single obligation. List induction over already-banked lemmas should be CHEAP
  (each step is a banked rewrite). The only cost risk is the bridge `map_mul`/coercion chain — the
  SAME wall N107/N108/N109/N110 hit, DISSOLVED there by the structural route (`map_mul`,
  `genTwoPlaneLin_apply`, `Module.End.mul_apply`), NOT by inflating maxHeartbeats.
- If any obligation approaches 90s: STOP, measure the smallest sub-obligation, decompose. NEVER
  inflate maxHeartbeats. NEVER monolithic brute. NEVER re-run a route already shown to blow up.

## ANTI-VACUITY (W8)
The costume C143 must bite a WRONG abstract rank-induction / rank-fixes / rank-negation coordinate,
reducing to a false numeric DISTINCT from C140 1=71, C141 −1=73, C142 −1=79. Reuse banked objects
(the concrete 4-block word on ii5; deep slot reads −1 for the negation). Physics-words-removable:
delete every physics word ⇒ pure math about `blockWordLin`/`genTwoPlaneLin`/`genIsomMonoidLin`/
`biMulFun`/`QvC`/`gFormC`/`ii5` over the derived `Cut` + `O Cut`.
