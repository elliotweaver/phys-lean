# N184 PREREG — Der(H ℚ) ≅ so(3) ≅ su(2): the WEAK-ISOSPIN gauge seed

Frozen BEFORE compute. The constitution: docs/STANDARD.md, RUNBOOK.md, ROADMAP.md §N184.

## W4.5 SUFFICIENCY DECISION (frozen)
N184 ROADMAP offered two fronts:
- **(i) the full 2-parameter group commutator `[exp(sD),exp(tE)] ≈ id + st·⁅D,E⁆`** — REJECTED.
  Two independent reasons: (a) RE-PIN — its `st`-coefficient IS the bracket `⁅D,E⁆`, which
  N181 `adjMap_tangent` already recovered first-order via the adjoint/conjugation flow
  (`d/dt Ad(exp tD)|₀ = ⁅D,·⁆`). (b) W9-HEAVY — needs a genuine 2-variable joint limit over
  `Cut × Cut` (product-filter Tendsto) the chain has NOT built. Both the task body and the
  ROADMAP flag this. Banking it would be the 9th consecutive g₂-flow lateral node (W4.5
  over-pinning of the already-pinned g₂/Aut(O)).
- **(ii) look WIDE** — CHOSEN. The major joints (cascade STOP N2c, gen cap N5, Der(O)=g₂ N20,
  SU(3)⊂G₂ colour N42, (1,9) N43, Pin/Spin/O(1,9) N142–173) are all banked; N176–N183 are
  EIGHT consecutive g₂-flow nodes. The SM gauge group SU(3)×SU(2)×U(1): COLOUR SU(3)⊂G₂=Der(O)
  is banked (N42a/b/c); the WEAK-ISOSPIN **SU(2) seed is genuinely UNBANKED**. ROADMAP line 527
  records "Der(H)=so(3)" as a known but un-built structure. This is a NEW physics joint, NOT a
  g₂ re-pin (it lives on the QUATERNION subalgebra `H ℚ = CD (Dbl ℚ)`, one rung below O).

## TARGET (the node)
The Lie algebra of INNER DERIVATIONS of the associative quaternion algebra `H ℚ = CD (Dbl ℚ)`,
`ad_q : x ↦ q·x − x·q`, carries the **so(3) ≅ su(2) bracket structure** — the weak-isospin
gauge-algebra seed. The classification-sufficient banked set (mirroring how N42a/b/c pinned
colour):
1. The quaternion units `i := iota J`, `j := e2`, `k := i*j` with `i²=j²=k²=−1`, `i*j=k`,
   `j*i=−k` (and the cyclic relations). [the quaternion multiplication table]
2. `adM q := (adHom q).toIntLinearMap : Module.End ℤ (H ℚ)` (reuse banked `adHom`), additive
   in `q` (`adM_add`).
3. ★★ THE Lie-HOM IDENTITY `adM_bracket : ⁅adM p, adM q⁆ = adM (p*q − q*p)` — `ad` carries the
   associative commutator to the End commutator (pure associative-ring identity, `noncomm_ring`).
4. ★★ THE so(3)/su(2) STRUCTURE CONSTANTS:
   `⁅adM i, adM j⁆ = adM k + adM k` (= `(2:ℤ)•adM k`), and the two cyclic `⁅adM j,adM k⁆=2•adM i`,
   `⁅adM k,adM i⁆=2•adM j`. [the so(3) bracket — the SU(2) algebra]
5. W8 NON-VACUITY: `adM k ≠ 0` (k does not commute with i: `ad_k(i) = 2j ≠ 0`), hence
   `⁅adM i, adM j⁆ ≠ 0` — the bracket is genuinely NON-ABELIAN (real so(3), not a vacuous 0=0).
   Optionally: `{adM i, adM j, adM k}` linearly independent over ℚ (dim ≥ 3) if cheap.

## GO / NO-GO
- GO if the probe typechecks the quaternion table + `adM_bracket` + the 3 structure constants
  + the W8 non-vacuity, foundations-only, each obligation under KILL.
- NO-GO → DECOMPOSE: bank the quaternion table + `adM_bracket` (the Lie hom) now; child the
  structure constants. OR if it measures as a re-pin/vacuous after all, look wider still.

## KILL (instrument-failure threshold, W9)
- 60s per obligation; 120s per file. Any single tactic exceeding 60s = INSTRUMENT failure →
  measure/decompose/reframe, NOT a longer grind. Default maxHeartbeats ONLY; never inflate.

## COSTUME (W8, next id C216)
A WRONG structure-constant / non-abelian claim reducing to a false numeric DISTINCT from the
battery (… C214 1=182, C215 1=183) — use 1=184. Candidate: the W8 witness `ad_k(i) = 2j` has a
coordinate reading `2 ≠ 0`; a WRONG claim that `⁅adM i,adM j⁆ = 0` (the bracket abelian / su(2)
trivial) forces a contradiction on that nonzero coordinate, → `1 = 184` in Cut/ℚ.

## DEPENDENCY GATE (number tower, STANDARD §3)
Pure algebra over the DERIVED ℚ (the cascade's number tower) and the derived `H ℚ = CD (Dbl ℚ)`.
NO `import Mathlib.Data.Real`/`Complex` as content. ℚ is the coefficient field the Module/finrank
statements are WRITTEN IN (metalanguage, following the N6/N16/N42 precedent that the concrete
Emergent witness ground is `H ℚ`/`O ℚ`), the OBJECT is the derived quaternions. Lie/Module/End
are MACHINERY on the derived object. NO posited su(2)/so(3)/SU(2)/Lie group, NO bridge.

## PHYSICS-WORDS-REMOVABLE
Delete "isospin / weak / gauge / su(2) / so(3) / SU(2)" → the pure statement that the inner maps
`ad_q` of the Cayley–Dickson double `CD (Dbl ℚ)` form a Lie algebra under the commutator with
`⁅ad_i, ad_j⁆ = 2·ad_k` cyclically, non-abelian. No theorem statement needs a physics word.
