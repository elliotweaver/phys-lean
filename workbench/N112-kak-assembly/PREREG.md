# N112 — PREREG (frozen before compute)

## Target (per ROADMAP §N112 FORWARD FRONTIER, priority (i) the KAK assembly)
Measure whether a compact QvC-isometry factors as (octonion-block word)·(ninth rotation)·
(octonion-block word) — SO(9)=SO(8)·A·SO(8) — over the banked N111 `blockWordLin` (arbitrary-
length SO(8) word) + N107 `planeRotLin` A-torus. Bank the immediately-bankable structural piece.

## THE MEASURED GEOMETRIC FACT to probe FIRST (THE ONE LAW — listen to resistance)
The blockWordLin words are products of DIAGONAL half-turns `genTwoPlaneLin u w =
biMulLin w w · biMulLin u u`. Each:
  - FIXES x (genIsomMonoidLin_fixes_snd, N105),
  - FIXES the real octonion axis (biMulFun u u : 1 ↦ u² = −1, two of them → +1).
So the words act ONLY on the imaginary octonion block, fixing {x, real-axis}.
The single ninth rotation `planeRotLin c s` acts ONLY on the {x, real-axis} plane, FIXING the
imaginary octonion block.
⟹ HYPOTHESIS: blockWordLin words COMMUTE with planeRotLin (complementary sectors).

## GO / NO-GO
- GO-A (the clean assembly, ⊇ direction — expected to close regardless):
  `kakWordLin L₁ L₂ c s := blockWordLin L₂ * planeRotLin c s * blockWordLin L₁`
  ∈ genIsomMonoidLinPlus (mul_mem of three banked memberships) AND is a QvC-isometry (soundness
  genIsomMonoidLinPlus_isQvIsomC). Every SO(8)·A·SO(8) triple IS a valid compact enlarged isometry.
- GO-B (the structural commutation, IF it measures true): blockWordLin L commutes with
  planeRotLin c s. This is the genuine forward FINDING: the single-plane A-torus + the octonion-
  block words generate only a PRODUCT sector (SO(8)×SO(2)-flavoured), NOT the full SO(9) — forcing
  the additional ninth generators (x against each octonion axis) as the childed remainder. An
  honest "measure reveals the real target" result.
- W8 WITNESS (teeth): a concrete kakWordLin triple MOVES x (strictly beyond the x-rigid words),
  deep coordinate reads a specific value; the costume (C144) bites a WRONG value, DISTINCT from
  C143 −1=83.

## NO-GO / KILL (instrument-failure classification, NOT theory failure)
- KILL budget: 90s per obligation. The assembly facts (mul_mem, soundness) are O(1) structural —
  if ANY single obligation exceeds 90s of compile, it is an INSTRUMENT failure (W9): measure the
  smallest sub-obligation, decompose, NEVER inflate maxHeartbeats, NEVER monolithic brute.
- If the commutation (GO-B) does NOT measure true (words and ninth interact), DROP GO-B and bank
  GO-A + the x-reach witness only; the genuine two-sided content is then the heavy remainder to
  child as a dissolution ticket.
- If GO-A itself resists after reframe through the trunk → honest W1 dissolution ticket + block.
  Failure / silent scope-reduction NOT on the menu.

## ANTI-DRIFT
DERIVE from banked N49–N111 + the derived ℝ `ContinuumQ.Cut` + terminal algebra `O Cut`. NO
posited Lorentz group / SO⁺(1,9), NO Mathlib ℝ/ℂ as content, NO bridge. Physics-words-removable:
delete KAK/Cartan/SO(9)/SO(8)/A-torus/rotation/isometry/compact/octonion-block/word/ninth → the
statements stand as pure linear algebra over the derived `Cut` about `blockWordLin`/`planeRotLin`/
`genIsomMonoidLinPlus`/`QvC`.

## ANTI-TIMEOUT (W9)
Bank-as-you-go: the instant a lemma compiles clean → production file Phys/Algebra/
LorentzContinuumGenerationKAK.lean + wire (Phys.lean + Audits/AxiomAudit.lean import-at-END +
#print axioms) + commit BEFORE chasing more. Checkpoint ~50% budget. Gate in BACKGROUND. Child
N113 + complete with turns/iterations to spare.
