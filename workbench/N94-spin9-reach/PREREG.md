# N94 PREREG — A CONCRETE biMulFun 2-PLANE ROTATION WITNESS (the SO(9) reachability piece)

Frozen BEFORE compute. Node t_a14f0970, run 266. Over the derived ℝ `Cut` + terminal algebra `O Cut`.
HEAD 0cb4df0 (N93 finalized), tree clean. Fresh run, not a retry.

## TARGET (ROADMAP §N94 FORWARD FRONTIER, priority (i) — the immediately-bankable structural witness)
A CONCRETE `biMulFun` 2-plane rotation: a specific 2-plane rotation (the order-2 half-turn) realized
as a single two-sided `biMulFun` generator `biMulFun u u`, lying in `genIsomMonoidC2`, and PROVED to
be a genuine 2-plane rotation (negates the `{1,u}` plane, FIXES the anticommuting complement) — NOT
the whole-block negation `−id` that the single-unit circle subgroup's half-turn `(rotFunC u)² = −id`
produces. The structural witness toward the `Spin(9)→SO(9)` exhaustion.

## MEASURE-FIRST FINDING (trunk reframe, THE ONE LAW — no analysis, no topology)
The full connectedness / global reverse KAK surjectivity over `Cut` is the genuine W1 HEAVY remainder
(Mathlib has no SO⁺(1,9), no Lie-group integration over `Cut`). The immediately-bankable, FORCED,
clean piece is the CONCRETE 2-plane rotation realized as a single `biMulFun` generator. The two-sided
`biMulFun u u : v ↦ u·(v·u)` for a UNIT-IMAGINARY `u` (`u·(u·v) = −v`, `u·u = −1`) DISSOLVES
structurally through the banked octonion alternative laws (`Phys/Algebra/Alternative.lean`:
`mul_flex` x·(y·x)=(x·y)·x, `mul_mul_right` (x·y)·y=x·(y·y)):

  (biMulFun u u)²(v) = u·((u·(v·u))·u)
    = u·(u·((v·u)·u))      [mul_flex u (v·u): (u·(v·u))·u = u·((v·u)·u)]
    = u·(u·(v·(u·u)))      [mul_mul_right v u: (v·u)·u = v·(u·u)]
    = u·(u·(v·(−1)))       [hsq u·u = −1]
    = u·(u·(−v))           [mul_neg_one]
    = −(u·(u·v)) = −(−v)   [hL: u·(u·v) = −v]
    = v.

So `biMulFun u u` is an INVOLUTION — a concrete order-2 rotation (180° = π half-turn). Its 2-plane
geometry, all pure composition algebra from the SAME alternative laws:
  • NEGATES the plane: `biMulFun u u (1) = u·(1·u) = u·u = −1`; `biMulFun u u (u) = u·(u·u) = u·(−1) = −u`.
  • FIXES the complement: for `w` anticommuting (`u·w = −(w·u)`):
    `biMulFun u u (w) = u·(w·u) = u·(−(u·w)) = −(u·(u·w)) = −(−w) = w`.
This is a 2-plane half-turn: it negates `span{1,u}` (2-dim) and fixes the orthogonal 6-plane —
a genuine element of SO(9) acting in one coordinate 2-plane.

## THE DISTINGUISHING FACT (W8 teeth + the genuine novelty)
The single-unit circle subgroup's half-turn is `(rotFunC u)²(v) = u·(u·v) = −v` for ALL v — the
WHOLE-block negation `−id` (a central element), NOT a 2-plane rotation. The two-sided `biMulFun u u`
negates ONLY the 2-plane and FIXES the complement. So the two-sided generator REACHES a 2-plane
rotation the single-unit family does not — the forward step toward the full non-associative SO(9).

## DELIVERABLE (production `Phys/Algebra/LorentzContinuumSpin9Reach.lean`)
  1. `biMulFun_imag_involutive` — generic (hyps `hsq : u·u = −1`, `hL : ∀ v, u·(u·v) = −v`):
     `biMulFun u u (biMulFun u u p) = p` (the order-2 half-turn), and the `Function.End` form
     `biMulFun u u ∘ biMulFun u u = id`.
  2. `biMulFun_imag_negates_one` / `biMulFun_imag_negates_self` — the half-turn negates `1` and `u`.
  3. `biMulFun_imag_fixes_anticomm` — generic (hyps `hL`, `hac : u·w = −(w·u)`): fixes `w`.
  4. `biMulFun_imag_mem_gen2` — generic (hyp `gFormC u u = 1`): the half-turn lies in genIsomMonoidC2.
  5. Concrete `e₂` realization: `biMulFun_e2_involutive`, `biMulFun_e2_half_turn_ne_neg_id`
     (the 2-plane half-turn is NOT the whole-block negation `−id` = `(rotCircFun e₂ 0 1)²` style).

## GO / NO-GO
- GO if `biMulFun_imag_involutive` + the geometry lemmas compile clean (foundations-only) in a
  bounded probe. BANK immediately in production, wire (Phys.lean + AxiomAudit + #print axioms),
  costume, gate, commit. It is FORCED new content (the concrete 2-plane half-turn from the
  two-sided generator, via the alternative laws).
- THEN child the W1 HEAVY remainder: connectedness / spectral-power path / global reverse KAK
  surjectivity / Spin(9)→SO(9) exhaustion onto the chain tail.

## KILL (W9 — instrument-failure classifier)
- KILL = 180s per single obligation. These are light: each new lemma COMPOSES already-banked
  `ext <;> ring` octonion identities (mul_flex/mul_mul_right banked); NO new coordinate grind.
- If any single new lemma exceeds 180s → INSTRUMENT failure, decompose (it should not; the heavy
  octonion lemmas are already `.olean`-banked). NO inflated maxHeartbeats. NO monolithic brute.
- ANTI-TIMEOUT: checkpoint at ~50% turns; bank-as-you-go (move to production + commit the instant a
  lemma compiles); run gate D0–D6 in BACKGROUND; finalize with turns to spare.

## COSTUME C126 (W8 — must BITE, false numeric DISTINCT from C115 1=7 … C125 6=5)
A WRONG 2-plane-rotation claim: e.g. "the two-sided half-turn `biMulFun e₂ e₂` negates the WHOLE
space block like the single-unit half-turn (fixes nothing / `biMulFun e₂ e₂ (w) = −w` for an
anticommuting `w`)" — but it FIXES `w`. Track at a concrete anticommuting unit, reducing to a false
numeric distinct from the banked battery. Reuse banked objects (biMulFun, e₂, a concrete unit).

## PHYSICS-WORDS-REMOVABLE
Delete "Lorentz/boost/rotation/half-turn/plane/SO(9)/Spin/isometry/generator/Moufang/
bimultiplication/reflection/involution/order/2-plane": what remains is the theorem that over the
derived complete ordered field `Cut` and `O Cut := CD(CD(CD Cut))`, for `u` with `u·u = −1` and
`u·(u·v) = −v`, the map `v ↦ u·(v·u)` composed with itself is the identity, negates `1` and `u`,
fixes every `w` with `u·w = −(w·u)`, and lies in the generated submonoid `genIsomMonoidC2`. Pure
non-associative-algebra math; no theorem STATEMENT needs a physics word.
