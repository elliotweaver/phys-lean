# N106 PREREG — THE ENLARGED-ALPHABET CONVERSE GENERATION (immediately-bankable structural piece)

FROZEN before compute. ROADMAP priority (i): adjoin the x↔𝕆 ninth-direction rotation
generator (`planeRotLin`, banked N105) to the biMulLin generating alphabet, extending the
generated submonoid toward the full compact SO(9), and bank the IMMEDIATELY-BANKABLE
structural pieces — NO operator topology, NO posited Lorentz group, NO Mathlib ℝ/ℂ as content.

## THE THEORY-NATIVE FRAMING (W1 reframe through the trunk)
N105 PROVED the literal residual (R) FALSE for the biMulLin alphabet: every biMulLin word is
x-rigid (`genIsomMonoidLin_fixes_snd`), reaching at most the octonion-block SO(8); the genuine
ninth-direction rotation `planeRotLin c s` (c≠1, c²+s²=1) and `xNegLin` are QvC-isometries
OUTSIDE the word reach. The missing x↔𝕆 generator is a gap in the GENERATING SET. N106 closes
that gap structurally: ADJOIN the ninth generator, prove the enlargement is SOUND (every
enlarged word is still a QvC-isometry), STRICT (it now reaches what the obstruction excluded),
and CONCRETELY WITNESSED (a higher-rank compact rotation = octonion-block SO(8) word · ninth
rotation, factors as an enlarged word and genuinely moves x).

## GO / NO-GO (frozen)
GO if ALL of the following compile foundations-only [propext, Classical.choice, Quot.sound]:
  G1. `biMulLin_isQvIsomC` — the FULL two-sided generator biMulLin u u' is a QvC-isometry
      (general u,u'; the half-turn case biMulLin_imag_isQvIsomC is the u=u' special case).
  G2. `genIsomMonoidLinPlus := closure (biMulGenSetLin ∪ ninthGenSetLin)` — the enlarged
      generated submonoid, with ninthGenSetLin = {planeRotLin c s | c²+s²=1}.
  G3. `genIsomMonoidLinPlus_isQvIsomC` — ★ SOUNDNESS: every K ∈ genIsomMonoidLinPlus is a
      QvC-isometry (closure_induction; generators sound, identity + products preserve).
  G4. `genIsomMonoidLin_le_genIsomMonoidLinPlus` (closure_mono) + `genIsomMonoidLin_lt_…` —
      ★ STRICT enlargement (SetLike.lt_iff_le_and_exists, witness = planeRotLin (3/5)(4/5) ∉
      genIsomMonoidLin by N105 obstruction but ∈ Plus by subset_closure).
  G5. `enlargedTwoPlaneNinth := genTwoPlaneLin u w * planeRotLin c s` ∈ genIsomMonoidLinPlus +
      moves x to c + ∉ genIsomMonoidLin for c≠1 — ★ the concrete SO(8)·ninth higher-rank
      compact rotation: an enlarged word NO biMulLin word realises (W8 teeth).

NO-GO / reframe: if soundness closure_induction or the strict-enlargement witness fights →
THE ONE LAW: the framing (not the theory) is wrong; return to the trunk. The full SO(9)
SURJECTIVITY (enlarged alphabet generates ALL compact rotations of x⊕𝕆) is the GENUINE global
remainder — Mathlib has NO operator topology / no 2-plane-rotation exhaustion over the derived
Cut — and is CHILDED N107 (operator topology over Cut / Spin(9)→SO(9) exhaustion), NOT ground
here. Banking G1–G5 is the immediately-bankable structural piece per the ticket; the global
surjectivity is the childed forward frontier.

## KILL (W9 instrument budget — frozen)
All proofs are light algebra (closure inductions w/ rfl/rewrite bases; delegate isometry to
banked biMulFun_isom / planeRotLin_isQvIsomC). NO monolithic ring over expanded coords, NO
native_decide, NO inflated maxHeartbeats. KILL: if ANY single decl fails to elaborate within
~60s in isolation (`lake env lean` on the scratch probe), that is an INSTRUMENT wall — STOP,
measure the sub-obligation, decompose; do NOT inflate the ceiling or re-grind. Expected total
build cost: trivial (warm oleans, all deps banked).

## COSTUME C138 (W8 anti-vacuity — frozen)
Bites a WRONG SO(8)·ninth-rotation factorization coordinate: the concrete
`enlargedTwoPlaneNinth u w (5/13) (12/13)` applied to (0,1,0) reads x-image 5/13
(enlargedTwoPlaneNinth_moves_x: the genTwoPlaneLin octonion-block factor fixes x while the
ninth rotation sends x→c). A bogus claim forces `5 / 13 = 61` (61 = next prime after C137's
59; DISTINCT from every banked false numeric C115 1=7 … C128 3/2=13, C129 4/3=40, C137 3/5=59).
Must fail to compile at the derived math field.

## PHYSICS-WORDS-REMOVABLE
Delete Lorentz/rotation/isometry/compact/SO(9)/SO(8)/SO(2)/ninth-direction/octonion-block/
generator/alphabet/word/Spin: what remains is pure linear algebra over the derived complete
ordered field Cut — a strictly larger submonoid of Module.End Cut (Cut×Cut×O Cut) whose every
element preserves the quadratic form QvC, strictly containing the biMulLin-word submonoid, with
a concrete member that moves the second coordinate projection. No theorem STATEMENT needs a
physics word.
