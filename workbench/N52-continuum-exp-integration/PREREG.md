# N52 PREREG — THE GLOBAL EXP-INTEGRATION of the boost generator: the BOOST ONE-PARAMETER SUBGROUP
(frozen before production; GO/NO-GO + KILL fixed up front — W9)

## The node (specified against what the chain ACTUALLY produced, not the body's literal framing)

N51 banked the TANGENT (infinitesimal) algebra `infIsomLieAlg` over the derived ℝ `Cut`, with the
infinitesimal boost generator `boostGenC : (t,x,v) ↦ (x,t,0)` proved form-skew. N49 banked the
GLOBAL boost `boostFunC a b : (t,x,v) ↦ (a t+b x, b t+a x, v)`, its isometry `boostC_isom` (iff
`a²−b²=1`), and the continuum isometry monoid `qvIsomMonoidC : Submonoid (Function.End STVC)`.

N52 lifts the INFINITESIMAL boost generator to the GLOBAL ONE-PARAMETER SUBGROUP and proves the
exp-integration link to the N51 tangent.

### ★ THE ONE LAW / W1 REFRAME — the cosh/sinh exp is the rapidity habit; the theory-native exp is the hyperbola group
The ticket's literal framing `exp(s·boostGenC) = boostFunC (cosh s)(sinh s)` needs the
transcendental `cosh`/`sinh`, which are NOT banked over the derived ℝ `Cut` (importing them = Mathlib
ℝ content = the forbidden second posit; and N49 already DISSOLVED the rapidity into the algebraic
hyperbola point). Returning to the trunk: the boost generator `boostGenC` satisfies
`boostGenC² = tx-projection`, `boostGenC³ = boostGenC` (it is "nilpotent modulo the tx-projection"),
so its exponential CLOSES into a FINITE POLYNOMIAL in the generator, parametrized by the hyperbola
point `(a,b)` (`a²−b²=1`) instead of the rapidity `s`:

    boostFunC a b p = p + b • (boostGenC p) + (a−1) • (boostGenC (boostGenC p))          [EXP-POLY]

The one-parameter subgroup it sweeps is the abelian HYPERBOLA GROUP `{(a,b) | a²−b²=1}` under the
algebraic group law `(a,b)·(a',b') = (a a' + b b', a b' + b a')`, which lands back on the hyperbola
(`(aa'+bb')²−(ab'+ba')² = (a²−b²)(a'²−b'²)`), with identity `(1,0)` (`boostFunC 1 0 = id`) and inverse
`(a,−b)`. The composition law `boostFunC a b ∘ boostFunC a' b' = boostFunC (aa'+bb')(ab'+ba')` is the
theory-native `exp((s+t)T) = exp(sT)·exp(tT)`: the group parameter is the hyperbola point, not the
rapidity. No analysis, no transcendental, no Mathlib ℝ.

## GO / NO-GO

GO if ALL of the following compile foundations-only over the banked `Cut`/`O Cut`/`boostFunC`/
`boostGenC`/`qvIsomMonoidC` (no new posit, no Mathlib ℝ/ℂ content import):

  G1  boostFunC_comp     — `boostFunC a b ∘ boostFunC a' b' = boostFunC (a*a'+b*b') (a*b'+b*a')` (funext, ring)
  G2  boostParam_hyp_mul — `(a*a'+b*b')^2 − (a*b'+b*a')^2 = (a^2−b^2)*(a'^2−b'^2)` (ring) — hyperbola closure
  G3  boostFunC_one      — `boostFunC 1 0 = id`
  G4  boostFunC_inv      — `a²−b²=1 → boostFunC a b ∘ boostFunC a (−b) = id` (the group inverse)
  G5  boostGenC_sq_apply — `boostGenC (boostGenC p) = (p.1, p.2.1, 0)` (the tx-projection)
  G6  boostFunC_eq_gen_poly — [EXP-POLY] the GLOBAL boost is the finite exp-polynomial in the N51 generator
  G7  boostOPS           — the boost family `{T | ∃ a b, a²−b²=1 ∧ T = boostFunC a b}` is a `Submonoid (Function.End STVC)` (one_mem via G3, mul_mem via G1+G2)
  G8  boostOPS_le_isom   — `boostOPS ≤ qvIsomMonoidC` (every member is an isometry, banked `boostC_mem`)
  G9  boostOPS_ne_bot / non-vacuity — contains the irrational boost (banked `irrBoost_isom` is on the hyperbola) ⇒ ≠ ⊥; or a concrete (5/4,3/4)
  G10 (stretch) boostHypHom — the abelian hyperbola group as a bundled `CommGroup` + a `MonoidHom` into `Function.End STVC` landing in `qvIsomMonoidC` (the literal one-parameter subgroup). If the bundling is fussy/expensive, FALL BACK to G1–G9 (which fully capture the group law) and child the bundling.

NO-GO / DECOMPOSE: the HEAVY core (b) — that EVERY orientation/time-preserving continuum isometry is
a FINITE PRODUCT of boost + rotation one-parameter subgroups (Cartan/polar KAK) — is a deep global
Lie-group theorem (connectedness + polar decomposition + topology over the derived ℝ; Mathlib has no
`SO⁺(1,9)`, no octonionic spinor cover, no Lie-group integration over `Cut`). It is CHILDED N53, NOT
attempted here. Also childed: the rotation one-parameter subgroup (the compact generator — its naive
composition `rotFunC u ∘ rotFunC u' = rotFunC (u·u')` FAILS by octonion non-associativity, a genuine
subtlety needing alternativity/Moufang care, so it is its own node), and the LITERAL transcendental
`exp` over a derived-ℝ analytic `cosh`/`sinh` (needs the derived-ℝ exp series specialized — separate).

## KILL (W9 instrument budget)
- Each lemma G1–G9 is funext + `ring`/`nlinarith`/small `simp` on ≤3 coordinate blocks — KILL any
  single obligation at 60s wall. If any G1–G9 exceeds 60s, it is an instrument signal: decompose the
  block arithmetic, do NOT inflate heartbeats.
- G10 (Group bundle) KILL at 90s for the whole bundle; if fussy, DROP to fallback (G1–G9) and child.
- The node is LIGHT by design (all ring/funext over the derived field). If anything fights → THE ONE
  LAW: reframe, do not grind.

## Costume C83 (W8 — must BITE a WRONG exp-integration claim)
The WRONG exp-polynomial coefficient: claim `boostFunC a b p = p + b•(boostGenC p) + a•(boostGenC²p)`
(using `a` instead of `a−1` on the tx-projection term) — a WRONG integration of the generator. At
`p=(1,0,0)`, `a=2`, `b=0`: correct `boostFunC 2 0 (1,0,0) = (2,0,0)`; the wrong RHS gives
`(1,0,0)+0+2•(1,0,0) = (3,0,0)`. Routed through the banked correct `boostFunC_eq_gen_poly` it leaves
`2 = 3` (equivalently a false `Cut` numeric). Must FAIL to compile.

## Physics-words-removable (STANDARD §2)
Delete "Lorentz/boost/exp/one-parameter/subgroup/generator/isometry/SO⁺(1,9)/rapidity": what remains
is the theorem that, over the derived complete ordered field `Cut` and the Cayley–Dickson double³
`O Cut`, the `Cut`-maps `(t,x,v) ↦ (a t+b x, b t+a x, v)` with `a²−b²=1` form a submonoid of
`Function.End (Cut×Cut×O Cut)` under composition (with composition law `(a,b)(a',b')=(aa'+bb',ab'+ba')`,
unit `(1,0)`, inverse `(a,−b)`), contained in the submonoid preserving `t²−x²−gFormC v v`, and each
equals the finite polynomial `id + b•G + (a−1)•G²` in `G : (t,x,v)↦(x,t,0)` (`G²:(t,x,v)↦(t,x,0)`).
Pure math, no physics word in any STATEMENT.
