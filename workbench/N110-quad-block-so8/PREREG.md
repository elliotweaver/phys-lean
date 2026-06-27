# N110 PREREG — THE QUAD-BLOCK SO(8)-GENERATION LEG (rank ≥ 8 — the TOP of the explicit witness ladder)

FROZEN BEFORE COMPUTE. KILL classifies a fight as INSTRUMENT failure, not theory.

## THE NODE (ROADMAP §N110 priority (i), immediately-bankable structural piece)
N107 banked the A-torus (rank-2 ninth circle). N108 banked `doubleBlockLin` (rank ≥ 4, witness
`ke2je2` fixed by single / negated by double). N109 banked `tripleBlockLin` (rank ≥ 6, witness
`ii4` fixed by single+double / negated by triple). N110 banks the NEXT and FINAL explicit rung:

  `quadBlockLin u w a b c d e f := genTwoPlaneLin e f * tripleBlockLin u w a b c d`

an EIGHT-generator `biMulLin` word — a product of FOUR octonion-block 2-plane rotations of
DISTINCT imaginary 2-planes, reaching rank ≥ 8 — the FULL rank on the 8-dim octonion space
`O Cut` (the explicit-witness ladder rank 2→4→6→8 TOPS OUT here; this is the highest concrete
octonion-block rotation rank). The genuinely-general "words generate ALL of SO(8)"
(Moufang/triality) + the KAK assembly + the operator topology remain the HEAVY childed remainder.

## THE RANK-≥8 WITNESS (W8 teeth)
The FIFTH octonion unit `ii5 := ii4 * je2` (= the quaternion `k = i·j` embedded in `O Cut`,
reusing banked units exactly as `ke2je2 = e₂·je2`), a Born-unit-imaginary anticommuting with ALL
FOUR of `e₂, je2, ke2je2, ii4`. The TRIPLE block `tripleBlockLin e₂ je2 ke2je2 e₂ ii4 e₂` FIXES
`ii5` (it lies in the common anticommuting complement of all three lower 2-planes — every one of
the six half-turns fixes it). The QUAD block
`quadBlockLin e₂ je2 ke2je2 e₂ ii4 e₂ ii5 e₂ = genTwoPlaneLin ii5 e₂ * tripleBlockLin e₂ je2 ke2je2 e₂ ii4 e₂`
NEGATES it (the fourth block's `biMulFun ii5 ii5` half-turn negates `ii5`, `biMulComp_negates_u`):
applied to `(0,0,ii5)` reads `(0,0,−ii5)`. A FOURTH 2-plane all three lower blocks leave fixed —
a strictly-higher-rank (rank ≥ 8) octonion-block compact rotation.

## DECLS TO BANK (mirror N109 exactly, one layer deeper)
- `ii5` / `ii5_imag` / `ii5_sq` / `ii5_alt` / `ii5_gFormC_self` — the fifth unit is a Born-unit-imaginary
- `quadBlockLin` / `quadBlockLin_apply`
- `quadBlockLin_mem_genLin` (mul_mem of genTwoPlaneLin_mem_genLin + tripleBlockLin_mem_genLin)
- `quadBlockLin_isQvIsomC` (composition of four genTwoPlaneLin isometries, N103)
- `quadBlockLin_mem_gen2` (N100 transport)
- `quadBlock_bridge_eq` / `quadBlock_bridge_apply` (nested EIGHT-factor biMulFun composite)
- `e2_ii5_anticomm` / `je2_ii5_anticomm` / `ke2je2_ii5_anticomm` / `ii4_ii5_anticomm`
- `block3_fixes_ii5` (the TRIPLE block fixes ii5 — six biMulFun_imag_fixes_anticomm)
- `quadBlock_negates_ii5` (W8 TEETH) / `quadBlock_ii5_coord` (W8 ANCHOR)

## GO / NO-GO
- GO: `ii5 := ii4 * je2` closes `ii5_sq = -1`, `ii5_imag`, and all four anticommutators by
  `ext <;> simp [...]`; the structural decls copy the N109 proof skeleton with one more layer.
- NO-GO / reframe: if `ii5 := ii4 * je2` does NOT anticommute with `ke2je2` (or its simp does not
  close), probe alternative fifth units (`iota(...)`-fresh unit, or `e₂ * ii4`, or a second-copy
  `il/kl` unit) until one anticommutes with all four. The fifth unit MUST exist (the 7-dim
  imaginary octonion space has ≥ 4 mutually-anticommuting units beyond any given three; this is
  the standard octonion Fano structure, DERIVED here over `Cut`).

## KILL BUDGET (W9 — instrument failure, NOT theory failure)
- Each `ext <;> simp` octonion identity is CHEAP (N108/N109 compiled cached ~7-27s).
- KILL line: if any single `ext <;> simp` octonion identity probe runs > 90s, OR a full lemma-file
  build runs > 4 min, OR ii5 anticommutation does not close after trying 3 candidate units → that
  is an INSTRUMENT/framing signal: STOP, do NOT inflate maxHeartbeats, do NOT brute. Reframe: the
  witness coordinate read-off is the structural route (collapse via block3_fixes_ii5 +
  biMulComp_negates_u), NOT a coordinate `decide`. If the rank-8 witness genuinely resists after
  reframe, DECOMPOSE: bank the structural quadBlockLin lemmas (mem/isometry/bridge — these do NOT
  need ii5) + child the witness/abstract-generation remainder.
- NEVER run an unbounded compile in the turn budget — measure each lemma in a bounded `lake env lean`
  probe first, graduate to production + commit the instant it compiles clean.

## COSTUME (next id C142)
Must bite a WRONG quad-block-factorization / rank-8 coordinate claim: the concrete quad octonion-block
rotation applied to `(0,0,ii5)` reads deep slot `−1` (`quadBlock_ii5_coord`), NOT a bogus value.
False numeric DISTINCT from every banked value incl C141 `−1=73` and C140 `1=71`. Use e.g. `−1 = 79`
(or another distinct prime), trailing-substring ERE.

## ANTI-TIMEOUT (W9)
Checkpoint ~50% iterations. Bank-as-you-go: production file
`Phys/Algebra/LorentzContinuumGenerationOctonionBlockQuad.lean`, wire Phys.lean + Audits/AxiomAudit.lean
(import AT END of import list + #print axioms lines), commit BEFORE chasing the full witness. Gate in
BACKGROUND. Child N111 + complete with iterations to spare.
