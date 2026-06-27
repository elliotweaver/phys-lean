# N105 — PREREG (frozen before compute)

## The inherited reduction (N104)
N104 reduced the FULL converse `qvIsomMonoidC ≤ genIsomMonoidC2` to ONE residual:
> **(R)** every EvC-orthogonal `QvC`-isometry IS a `biMulLin` word (∈ `genIsomMonoidLin`).

The ticket's priority (i): MEASURE whether a structural reduction of (R) closes via the
banked deflation / 2-plane-generator machinery (a rank-induction over 2-plane rotations,
the Cartan/Euler-angle decomposition).

## MEASURE-FIRST FINDING (the decisive structural fact — THE ONE LAW)
`STVC = Cut × Cut × O Cut` = (t, x, v) — the (1,9) Minkowski space: 1 time `t`,
**1 space `x`**, 8 octonion space directions `v ∈ O Cut`. The 9 SPACE directions split
as `x ⊕ 𝕆` (1 + 8).

EVERY generator of `genIsomMonoidC2 = ⟨boostOPS ∪ rotGenSetC ∪ biMulGenSetC⟩` is
BLOCK-DIAGONAL w.r.t. the splitting `(t,x) ⊕ 𝕆`:
  • `boostFunC a b (t,x,v) = (a·t+b·x, b·t+a·x, v)`     — mixes (t,x), FIXES v.
  • `rotCircFun a c s (t,x,v) = (t, x, c•v + s•(a·v))`  — FIXES (t,x), rotates v.
  • `rotFunC u (t,x,v) = (t, x, u·v)`                    — FIXES (t,x), rotates v.
  • `biMulFun u u' (t,x,v) = (t, x, u·(v·u'))`           — FIXES (t,x), rotates v.

So NO generator mixes the `x`-axis with the octonion block `v`. The `x`-coordinate is moved
ONLY by boosts (which mix it with `t`, never with `v`), and the `biMulLin` words (the closure
of `biMulGenSetLin`) ALL FIX BOTH `t` AND `x` and only rotate `v`.

### Consequence: the literal residual (R) is FALSE for the current generating set.
A compact `QvC`-isometry that rotates the `x`-axis INTO the octonion block (e.g. the SO(2)
rotation of `span{x, e_v}` for an octonion unit `e_v`, fixing `t`) is EvC-orthogonal and a
`QvC`-isometry, but is NOT a `biMulLin` word (every `biMulLin` word fixes `x`). The two-sided
Born-unit generators reach the SO(8) of the octonion block `𝕆`, NOT the full compact SO(9) of
the 9-dim space `x ⊕ 𝕆`. The ninth-direction generator (mixing `x` with `𝕆`) is genuinely
MISSING — there is no word over the current generating set that moves `x` off the `(t,x)` plane.

This is exactly what MEASURE-FIRST exists to catch: pushing toward the literal surjectivity
would have been the drift (the theory says the generators reach a definite subgroup, and the
instrument — "is every isometry a word?" with the WRONG word alphabet — was the wrong framing).

## THE NODE (forward, immediately bankable, theory-native)
Bank the PROVED structural invariant that pins exactly what the `biMulLin` words reach:

  **(I) `biMulLin`-WORD `x`-RIGIDITY** — every `K ∈ genIsomMonoidLin` FIXES the `x`-coordinate:
       `∀ K ∈ genIsomMonoidLin, ∀ p : STVC, (K p).2.1 = p.2.1`
       (and likewise the `t`-coordinate: `(K p).1 = p.1`).
  A `Submonoid.closure_induction`: each generator `biMulLin u u'` fixes `t` and `x` by `rfl`
  on the first two coordinates; identity and products preserve the property.

  **(C) THE OBSTRUCTION (W8 teeth, non-vacuity)** — exhibit a CONCRETE EvC-orthogonal
       `QvC`-isometry `R` that MOVES `x` (rotates `span{x, e_v}` for a concrete octonion unit),
       hence is NOT a `biMulLin` word. `R` witnesses that (R) FAILS: it is a genuine compact
       isometry whose `x`-coordinate image differs from its `x`-coordinate, so by (I) it cannot
       be any word in `genIsomMonoidLin`. This is the honest proof that the literal surjectivity
       is false for the current alphabet — the missing ninth-direction generator is real.

This BANKS the precise reach of the current generators (the SO(8) octonion-block rotation
sector, x-rigid) and pins the genuine remaining gap (the x↔𝕆 ninth-direction generator) as a
crisp, well-posed forward node — instead of grinding a literally-false surjectivity.

## GO / NO-GO (frozen)
- GO if: (I) the `x`-rigidity (and `t`-rigidity) of `genIsomMonoidLin` compiles foundations-only
  via closure_induction, AND (C) a concrete `x`-moving EvC-orthogonal `QvC`-isometry compiles
  with its `x`-image ≠ `x`-coordinate, proving it ∉ `genIsomMonoidLin` via (I).
- NO-GO / reframe if: the rigidity does NOT hold (i.e. some generator secretly moves x — would
  refute the finding; re-measure). [Measured false: all four generator families fix x by their
  definitions — rigidity is forced.]

## KILL (instrument-failure budget — W9)
- Each probe lemma must compile in < 30s. The rigidity is a `closure_induction` with `rfl`
  base cases (the generators fix the first two coords definitionally) — must be FAST.
- If ANY single obligation exceeds 60s or needs maxHeartbeats above default, that is an
  INSTRUMENT failure: STOP, the framing is wrong (a coordinate grind is being attempted where a
  structural `rfl` should close). The rigidity is structural — it must not need a coordinate bash.
- The concrete obstruction witness `R` reads ONE coordinate (the `x`-image of a fixed input);
  it must close by `rfl`/`norm_num` — no spectral machinery.

## Costume (next id C137)
A WRONG `x`-rigidity / obstruction claim: the concrete `x`-moving rotation `R` sends a fixed
input's `x`-coordinate to a definite value `v_true` (e.g. with a (3/5,4/5) circle point,
`x=1, e_v=0 ↦ x' = 3/5`); a BOGUS value forces `3/5 = N` (N distinct from all banked numerics
through C136 `-1=53`). The wrong claim fails to compile at the math field.

## Physics-words-removable
Delete "Lorentz/boost/rotation/isometry/compact/orthogonal/Spin/SO(9)/SO(8)/2-plane/
ninth-direction/word/generation/half-turn/octonion-block": what remains is pure linear algebra —
every element of the submonoid `genIsomMonoidLin ⊆ Module.End Cut (Cut×Cut×O Cut)` fixes the
second coordinate projection; a concrete `Cut`-linear `QvC`-preserving map moves the second
coordinate, hence is not in that submonoid. No theorem STATEMENT needs a physics word.
