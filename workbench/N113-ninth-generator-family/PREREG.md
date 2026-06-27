# N113 PREREG — THE GENERAL NINTH-DIRECTION GENERATOR x↔eᵢ AND THE NON-COMMUTATION
## (the structural complement to N112's commuting single A-plane)

FROZEN before compute. KILL classifies a fight as INSTRUMENT failure, not theory failure.

## THE SETUP (what N112 produced)

N112's measure-first FINDING: the single A-plane `planeRotLin c s` (= the `x ↔ 1` REAL-axis ninth
rotation, rotating `span{x, 1}`) COMMUTES with every octonion-block word `blockWordLin L`, because
each word FIXES the real axis `1` (`vTwoPlane_fix_one`) and PRESERVES `reQC` (`vTwoPlane_reQC`).
So the banked generators reach only the PRODUCT sector `SO(8)·A`, NOT full compact `SO(9)`
(`kakWordLin_degenerate`). The genuine remainder, pinned by the finding, is the FULL ninth-generator
family: the `x ↔ eᵢ` rotation against a GENERAL octonion axis `eᵢ`, NOT just the real axis `1`.

N112's note (ROADMAP §N113 (i)): for a GENERAL `eᵢ` a word generally does NOT fix `eᵢ` — that is
exactly why `x ↔ eᵢ` should NOT commute, the structural opposite of N112.

## THE TARGET (N113, priority (i) — the immediately-bankable structural piece)

Build the GENERAL-AXIS ninth-direction rotation and bank the NON-COMMUTATION:

1. `axisRotLin (e : O Cut) (c s : Cut) : Module.End Cut STVC` — the `SO(2)` rotation of the 2-plane
   `span{x, e}` (the `x`-axis and a general unit octonion axis `e`), defined by analogy to
   N105's `planeRotLin` (which is the `e = 1` case) but reading the `e`-component `gFormC v e`
   instead of `reQC v = gFormC v 1`:
       `(t,x,v) ↦ (t, c·x − s·gFormC v e, v + (s·x + (c−1)·gFormC v e)•e)`.
   `Cut`-linear (additivity via `gFormC_add_right`, homogeneity via `gFormC_smul_right`).

2. `axisRotLin_one_eq_planeRotLin` (or a defeq note) — for `e = 1`, `axisRotLin 1 c s = planeRotLin c s`
   (using `gFormC v 1 = reQC v`, `gFormC_one_right`). Confirms it GENERALIZES N112's plane.

3. `axisRotLin_isQvIsomC (e : O Cut) (he : gFormC e e = 1) (h : c²+s²=1)` — it is a `QvC`-isometry.
   The negative-definite `−x² − (gFormC v e)²`-style block is preserved by the circular rotation;
   the completing-the-square identity is `gFormC (v + a•e) (v + a•e) = gFormC v v + 2a·gFormC v e + a²·gFormC e e`
   with `gFormC e e = 1`. (a general-axis `gFormC_add_axis_self` analogue of `gFormC_add_one_self`.)

4. ★★ THE NON-COMMUTATION (the genuine N113 joint, the structural opposite of N112): exhibit a
   concrete general-axis ninth rotation `axisRotLin e₂ c s` that does NOT commute with the banked
   octonion-block word `genTwoPlaneLin e₂ je2`. The word NEGATES `e₂` (`biMulComp_e2_je2_negates_e2`
   ⇒ `vTwoPlane e₂ je2 e₂ = −e₂`), so it does NOT fix `e₂` — breaking the N112 commutation hypothesis.
   Concretely, apply both orders to a probe point and read off DIFFERENT coordinates.
   Target witness: `axisRotLin e₂ c s * genTwoPlaneLin e₂ je2 ≠ genTwoPlaneLin e₂ je2 * axisRotLin e₂ c s`
   by evaluating at a chosen `(t,x,v)` and a chosen `(c,s)` (e.g. `(3/5,4/5)`) where the two outputs
   differ in a readable slot.

5. Membership/soundness: `axisRotLin e c s ∈ genIsomMonoidLinPlus2` (a NEW enlarged monoid adjoining
   the general-axis family) OR show it as a QvC-isometry adjoinable. The immediately-bankable claim
   is (3) + (4): a concrete second ninth-direction generator that is a QvC-isometry AND does NOT
   commute with a banked octonion-block word.

## GO / NO-GO

GO if: `axisRotLin` is `Cut`-linear (the def elaborates), is a `QvC`-isometry (3 closes by the
completing-the-square identity + `c²+s²=1`, like `planeRotLin_isQvIsomC`), and the NON-COMMUTATION
(4) evaluates to a concrete pair of distinct coordinates. The non-commutation is the genuine joint.

NO-GO / DECOMPOSE if: the isometry (3) genuinely resists (then bank `axisRotLin` + linearity +
the non-commutation (4) as the structural piece, child the isometry); OR the global SO(8)-generation
completeness / operator topology is the heavy remainder (child it — it is W1 dissolution material:
Mathlib has NO operator topology over Cut).

## KILL BUDGET (W9)

KILL = 90s per single obligation. The whole node is LIGHT (linear algebra over Cut, NO native_decide,
NO inflated maxHeartbeats, NO brute over fully-expanded coordinates — every step is a structural
rewrite through banked gFormC bilinearity + the banked unit anticommutation). If any obligation
fights past 90s, it is an INSTRUMENT failure: STOP, measure the smallest sub-obligation, decompose.
The non-commutation evaluates by `genTwoPlaneLin_vblock` + `biMulComp_e2_je2_negates_e2` + `decide`-free
coordinate arithmetic — bounded. Expected: ≤30s scratch probe, ≤40s production build (oleans warm).

## W8 ANTI-VACUITY

Costume C145, false numeric `1 = 97` (DISTINCT from C143 −1=83, C144 3/5=89; 97 is the next prime,
unused). It must bite a WRONG general-ninth-generator / non-commutation / strictly-higher-sector
claim: a bogus coordinate of the non-commutation witness (the two orders genuinely differ; the bogus
claim that a difference-slot is `97` when it is the true value forces a false numeric). Reduces to a
false NUMERIC, name-independent. The WRONG claim MUST fail to compile.

## STANDARD CHECK (applied before commit)

- UNBROKEN: `axisRotLin` derives from `gFormC`/`reQC`/`planeRotLin`/`genTwoPlaneLin`/`vTwoPlane`/
  `biMulComp_e2_je2_negates_e2` — all banked N49–N112 over the derived ℝ Cut + O Cut. NO posited
  Lorentz group, NO Mathlib ℝ/ℂ as content, NO bridge.
- COMPLETE: every claim proved, `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`, no sorry/
  axiom/native_decide. Verify against the built olean.
- PHYSICS-WORDS-REMOVABLE: delete rotation/axis/ninth-direction/isometry/commute/octonion-block/word/
  generator/2-plane/SO(8)/SO(9)/Lorentz → a `Module.End Cut STVC` reading the `gFormC v e` component,
  a QvC-preserver, that does NOT commute with a banked operator. No theorem STATEMENT needs a physics
  word.
