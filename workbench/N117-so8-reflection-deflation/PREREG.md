# N117 PREREG — THE OCTONION-BLOCK AXIS-FIXING REFLECTION DEFLATION (the SO(8) analogue of N115's x-deflation)

FROZEN before compute. Run 301. Task t_b440e547.

## The node (chosen front: ROADMAP §N117 priority (i) — the immediately-bankable structural piece)

N115 banked the x-deflation STEP and N116 banked the REASSEMBLY: the x-motion half of the
SO(9) exhaustion is COMPLETE. What remains is the inner BASE CASE — the x-fixing stabilizer =
the SO(8) octonion-block generation. The ROADMAP §N117 priority (i) names the immediately-
bankable piece: the OCTONION-BLOCK analogue of N115's x-deflation step — an octonion-block
QvC-isometry that MOVES a chosen octonion axis e back to FIXING e, via a block reflection,
reducing the octonion-block rank by one (the inductive STEP of the SO(8) exhaustion).

## THE OBSTRUCTION N116's recon flagged, and how this node navigates it

N116's recon found: the naive single-LEFT-multiplication deflation FAILS under non-associativity
((e·star w)·w ≠ e). The deflation must stay INSIDE the associative subalgebra ⟨e, image⟩ (Artin).
THE THEORY-NATIVE TOOL: the two-sided half-turn `biMulLin m m : v ↦ m·(v·m)` is, for a unit-
imaginary m, the IMAGINARY HOUSEHOLDER REFLECTION across m^⊥ — and it is governed ENTIRELY by
the banked ALTERNATIVE laws (`mul_flex`, `mul_mul_right`, `mul_mul_left`), which hold for ANY
two octonions (no associativity needed). It manifestly stays inside the associative subalgebra
because m ∈ ⟨e, w⟩ (m is a combination of e and w). This is the Cartan–Dieudonné route: every
rotation is a product of reflections, and a SINGLE reflection that maps the moved image back is
the octonion-block analogue of N115's single ninth rotation.

## THE STRUCTURAL FACT to bank (the crux)

THE REFLECTION IDENTITY (crux lemma `reflect_imag`): for unit-imaginary m (m·m = −1) and any v,

    m · (v · m) = (2 · gFormC v m) • m − v.

(The two-sided half-turn is `−(Householder reflection across m^⊥)`: it negates the m^⊥ component
and fixes m... up to the global sign that fixes the m-line and negates m^⊥. Concretely on the
imaginary subspace `biMulV m m` reflects through the m-AXIS.) Derivation: expand via flexibility
`m·(v·m) = (m·v)·m` (`mul_flex`), use the imaginary polarization `m·v + v·m = −(2 gFormC v m)•1`
(from `m·v = −v·m` adjusted by the real part 2 gFormC v m) ... then right-alternativity.

Cleaner route actually proven below by direct expansion through the banked half-turn facts:
  - The half-turn `biMulV m m` FIXES m^⊥ pointwise (`biMulFun_imag_fixes_anticomm`) — every z⊥m
    with m·z = −(z·m) is fixed.
  - The half-turn NEGATES m (`biMulFun_imag_negates_self`).
So `biMulV m m` is +1 on m^⊥, −1 on m-axis: it is the reflection R_m fixing the hyperplane m^⊥
and negating m. To send a UNIT e to a UNIT w (both imaginary, gFormC e e = gFormC w w = 1), pick
m := normalize(e − w) [the bisector-perp]; then R_m swaps e ↔ w. ★ This is exactly the N115
deflation pattern: the explicit reflection drawn from the banked block generators that maps the
moved image back to the chosen pole.

## THE DEFLATION STEP to bank (the goal, octonion-block analogue of `deflateNinth_step`)

For an octonion-block QvC-isometry T (acting on the v-block, fixing t,x) with T(0,0,e) = (0,0,w)
where e is a chosen UNIT-IMAGINARY axis and w ≠ e (so the axis MOVES), the explicit block
reflection `octDeflate e w := biMulLin m m` with m := normalize(e − w) rotates the moved image
back: `octDeflate e w (0,0,w) = (0,0,e)`, so `(octDeflate e w · T)(0,0,e) = (0,0,e)` — the
octonion-block axis-motion is PEELED OFF, reducing the SO(8) octonion-block rank by one. SOUND ∈
genIsomMonoidLin (a single two-sided Born-unit generator), a QvC-isometry.

CRUX swap identity: for unit-imaginary e, w with gFormC e e = gFormC w w = 1, m := (e−w)/|e−w|
(when e ≠ w), the reflection R_m (= biMulV m m as −reflection... resolved in probe) sends w ↦ e.

## GO / NO-GO / KILL (frozen)

GO (bank the node) iff ALL:
  (G1) The crux reflection/swap identity compiles foundations-only over the derived Cut + O Cut.
  (G2) The deflation step `octDeflate_step` (octonion-block axis-moving → axis-fixing) compiles.
  (G3) Soundness: octDeflate ∈ genIsomMonoidLin + QvC-isometry, both compile.
  (G4) A W8 concrete witness biting (a real axis-moving image deflated back, reads the right coord).
  (G5) Costume C149 bites a WRONG octonion-block-deflation/reflection/swap coordinate (false numeric
       DISTINCT from C148 3/5=107 and all prior).
  (G6) #print axioms ⊆ {propext, Classical.choice, Quot.sound} for every production decl.
  (G7) STANDARD: unbroken (every object derived back to the trunk / the banked N5b alternative laws
       + gFormC over the derived Cut), complete, physics-words-removable.

NO-GO / DECOMPOSE: if the crux reflection identity compiles but the FULL swap (general unit e→w via
the bisector) resists (e.g. the normalization of e−w fights, or the swap needs a heavy coordinate
identity), bank the crux reflection lemma(s) + the SPECIAL-axis deflation (a concrete e₂↔w case) and
child the general-bisector remainder. Bank SOMETHING structural; never empty.

KILL (per-obligation, W9): 90s elaboration per single obligation. If any single lemma's elaboration
exceeds 90s in an isolated `lake env lean` probe, that is an INSTRUMENT failure (framing wrong, not
theory) — MEASURE-DECOMPOSE-REFRAME, do NOT inflate maxHeartbeats, do NOT brute. The alternative
laws are the heavy `ext` decls (N5b, maxHeartbeats 4M) but they are ALREADY BANKED as oleans — this
node only COMPOSES them through gFormC bilinearity, which is LIGHT. Expect every new lemma ≤ 30s.

KILL (run-level, anti-timeout W9): checkpoint at ~50% turns; FINALIZE (commit + gate-bg + child +
complete) with turns to spare. Bank-as-you-go: the instant a lemma compiles clean, move to
production + wire + commit BEFORE chasing the full theorem. Run the gate in BACKGROUND.

## Anti-drift (THE ONE LAW)
If the swap/reflection fights: return to the trunk. The octonion reflection is governed by the
banked ALTERNATIVE laws (N5b) — the cap's positive lever — NOT by associativity. If a step seems
to need associativity, the framing is wrong: re-route through `mul_flex`/`mul_mul_right`/
`mul_mul_left`/the half-turn fix-anticomm + negate-self facts, which are associativity-free. NO new
hypothesis, NO weakened target, NO Mathlib ℝ/ℂ as content, NO posited Lorentz group, NO bridge.
