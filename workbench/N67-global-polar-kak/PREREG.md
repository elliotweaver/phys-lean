# N67 PREREG — frozen GO/NO-GO + KILL before compute

Date: 2026-06-26
Node: N67 — the next forced node after N66 (the concrete polar/KAK assembly `g = k·exp(p)`).

## What the chain ACTUALLY produced (re-read of ROADMAP §N67 + N63/N66 source)
- N63 `specOp l₁ l₂ u₁ u₂ := l₁•projC u₁ + l₂•projC u₂` is ALREADY general over any pair of
  vectors; `specOp_op_sqrt` proves the positive operator square root for ANY EvC-orthonormal
  pair `{u₁,u₂}` and `c₁,c₂ ≥ 0`. BUT every banked concrete spectral witness (N63 `u35a/u35b`,
  N64 `uP/uM`, N65 `rotA/rotB`, N66 `boostC`/`R`) lives PURELY in the `(t,x)` plane or in
  block-SEPARATED coordinate blocks. NO banked object yet exhibits the spectral square root of
  an EvC-self-adjoint operator that genuinely MIXES the `(t,x)` plane WITH the octonion block
  `O Cut` (a genuinely 10-dim-mixing `g`). That is exactly ROADMAP §N67 MEASURE-FIRST option (i).
- N66 banked the first CONCRETE polar factorization, but only for the boost family (positive
  part `boostC a b`, block-separated: octonion block fixed by R).

## THE TARGET (this node, the immediately-bankable theory-native structural piece)
A: THE FIRST 10-DIM-MIXING SPECTRAL SQUARE ROOT. A CONCRETE EvC-orthonormal eigenbasis
   `{mixA, mixB}` whose vectors MIX the time component with the octonion block
   (`mixA = (3/5, 0, (4/5)•1₍O₎)`, `mixB = (4/5, 0, (-3/5)•1₍O₎)`), the spectral operator
   `specOp c₁ c₂ mixA mixB` over it shown GENUINELY 10-dim-mixing (the `(t ↦ octonion)`
   off-diagonal entry nonzero — the time axis maps INTO the octonion block, impossible for any
   block-separated `coordDiag3`/`blockDiag`/`boostC`), and its positive operator square root
   `√(g) = specOp (cutSqrt c₁)(cutSqrt c₂) mixA mixB` read off via the banked `specOp_op_sqrt`.
   The FIRST spectral square root of a time↔octonion-mixing operator in the chain.
B (structural escalation, attempt only after A is committed): THE 3-TERM SPECTRAL OPERATOR
   `specOp3 l₁ l₂ l₃ u₁ u₂ u₃ := l₁•projC u₁ + l₂•projC u₂ + l₃•projC u₃`, with EvC-self-
   adjointness, positivity, the composition law (orthonormal TRIPLE → eigenvalues square,
   all 3 cross terms vanish), and the square root via `cutSqrt` per eigenvalue — the genuine
   structural lever rank-2 → rank-3 toward the full n-dim spectral existence. A concrete
   EvC-orthonormal TRIPLE mixing time/space/octonion.

## GO / NO-GO
GO if: deliverable A compiles foundations-only `{propext, Classical.choice, Quot.sound}` over
the derived ℝ `Cut` + `O Cut`, every object from the banked N57 `cutSqrt`/N58 `EvC`/N63
`projC`/`specOp`/`specOp_op_sqrt` + the banked `gFormC_smul_left`/`gFormC_one` — NO new posit,
NO Mathlib ℝ/ℂ as content, NO bridge. Costume C98 bites a WRONG 10-dim-mixing square root
(false numeric DISTINCT from the banked battery incl C97 25=9, C96 25=30).
NO-GO if: A cannot be proved without a posited inner product / Mathlib spectral theory / a
posited Lie group.

## KILL budget (W9 — INSTRUMENT failure classifier, NOT theory)
- KILL = 30s per single proof obligation. The N56–N66 engine (linear-algebra + ordered-field
  arithmetic over `Cut`) closes every such obligation in << 30s. If ANY obligation exceeds 30s,
  it is an INSTRUMENT failure (wrong tactic / coordinate-expansion blowup), NOT a theory failure:
  MEASURE the smallest sub-obligation, DECOMPOSE, reframe through banked identities — do NOT
  inflate maxHeartbeats, do NOT throw a monolithic brute at an expanded coordinate goal.
- NO inflated `maxHeartbeats`, NO `native_decide`, NO `sorry`, NO brute monolith.
- The specOp3 composition (deliverable B) is the only W9 risk (more cross terms). If it exceeds
  30s/obligation or resists, DROP it, bank A, and child the n-term generalization.

## ANTI-TIMEOUT (W9)
Bank-as-you-go: get A compiling → MOVE to production `Phys/Algebra/LorentzContinuumSpectralMix.lean`
→ wire (Phys.lean + AxiomAudit import AT END + #print axioms) → COMMIT before chasing B. Gate in
BACKGROUND (process wait 60s slices). The instant production + gate committed → child N68 + complete.

## THE CHILD (N68 — the honest W1 heavy remainder)
The FULL n-dim spectral EXISTENCE (that an ARBITRARY EvC-self-adjoint operator HAS an
EvC-orthonormal eigenbasis decomposition `Σᵢ λᵢ Pᵢ` — no Mathlib analogue over `Cut`) + the
GLOBAL polar/KAK assembly for an arbitrary `g` + the compact part via CONNECTEDNESS + the
GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the connected component `≤ genIsomMonoidC2`)
+ the full `Spin(9)→SO(9)` exhaustion. Childed onto the chain tail, max_retries=25.
