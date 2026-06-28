# N137 PREREG — THE OCTONION-BLOCK STABILIZER's GAUGE CONTENT

FROZEN before compute. KILL classifies any fight as INSTRUMENT failure, not theory.

## THE MEASURED TARGET (W1/W9 measure-first, against what the chain ACTUALLY holds)

The double cover Pin(1,9) ↠ SO⁺(1,9) is now CLOSED end-to-end (group N132, generator cover
N133, even/Spin cover N134, global surjectivity N135, {±1} kernel N136). W4.5 SUFFICIENCY:
do NOT re-pin the cover. ADVANCE to the FORWARD joint (i): THE OCTONION-BLOCK STABILIZER's
GAUGE CONTENT — what the now-complete Lorentz cover OPENS.

THE STRUCTURE (forced, measured against the banked chain):
- `STVC = Cut × Cut × O Cut` (N-LorentzContinuum), `BvC p q = p.1*q.1 − p.2.1*q.2.1 − gFormC p.2.2 q.2.2`.
- The (t,x) plane is the span of `mTimeUnit=(1,0,0)` and `mSpaceUnit=(0,1,0)`; the octonion
  block is `{(0,0,v)}`. N129 `bvC_tx_oct_orthogonal`: the (t,x) plane is BvC-ORTHOGONAL to the
  octonion block.
- THE STABILIZER `octStab` := the BvC-isometries of STVC (`bvIsomLinMonoid`, the full Lorentz
  group SO⁺(1,9), N132) that FIX the (t,x) plane pointwise (`S mTimeUnit = mTimeUnit ∧ S mSpaceUnit
  = mSpaceUnit`). This is the gauge subgroup: the part of the Lorentz cover that touches ONLY the
  internal (octonion) directions, the SO(8)/Spin(7)/G₂ tower (N16–N21/N124), Aut(O)=G₂ = Der(O)=g₂
  (N20).

THE FORCED CLAIM (the gauge content): a BvC-isometry `S` fixing `mTimeUnit` and `mSpaceUnit`
PRESERVES the octonion block — `S (0,0,v) = (0,0,?)` — and the induced map on `O Cut` is a
gFormC-isometry. PROOF (forced, no grind): for `S` a BvC-isometry fixing the (t,x) axes, the
image `S (0,0,v)` has time component `BvC (S(0,0,v)) (S mTimeUnit) = BvC (S(0,0,v)) mTimeUnit`
and `BvC (S(0,0,v)) mTimeUnit = (S(0,0,v)).1`. But `BvC (S(0,0,v)) (S mTimeUnit) = BvC (0,0,v)
mTimeUnit = 0` (the (t,x)/oct orthogonality). So `(S(0,0,v)).1 = 0`; likewise `(S(0,0,v)).2.1 = 0`
(via `mSpaceUnit`). Hence `S` maps the octonion block INTO itself, and on the block the BvC-isometry
condition `BvC (S(0,0,v))(S(0,0,w)) = BvC (0,0,v)(0,0,w)` reads `−gFormC ... = −gFormC v w`, i.e.
the induced block map is a gFormC-isometry. THE GAUGE GROUP.

THE SECTION (the converse / non-emptiness): the embedding `octBlockEndC R` (N129) of a gFormC-
isometry `R` is a BvC-isometry fixing the (t,x) plane — so it LANDS in the stabilizer. The
stabilizer ⊇ the embedded O(8) gauge group; and (the forward content) every stabilizer element
restricts to one. The stabilizer's gauge content IS the octonion-block gFormC-isometry group.

## DECLS PLANNED (production file Phys/Algebra/LorentzContinuumOctStabilizerGauge.lean)

1. `bvC_oct_time` / `bvC_oct_space` — BvC (0,0,v) mTimeUnit = 0, BvC(0,0,v) mSpaceUnit = 0
   (the orthogonality read-offs the stabilizer argument uses).
2. `octStab` — the submonoid of bvIsomLinMonoid fixing mTimeUnit and mSpaceUnit (or a predicate
   `IsOctStab S := IsBvIsomLin S ∧ S mTimeUnit = mTimeUnit ∧ S mSpaceUnit = mSpaceUnit`).
3. ★ `octStab_fixes_time_comp` / `octStab_fixes_space_comp` — a stabilizer element sends the
   octonion block into itself: `(S (0,0,v)).1 = 0`, `(S (0,0,v)).2.1 = 0`.
4. ★★ `octStab_block_gFormC_isom` — THE GAUGE CONTENT: the induced octonion-block map of a
   stabilizer element preserves gFormC (is a gFormC-isometry up to the block projection).
5. ★ `octBlockEndC_mem_octStab` — THE SECTION: octBlockEndC R (R a gFormC-isometry) is in octStab
   (fixes mTimeUnit, mSpaceUnit; is a BvC-isometry by N129 octBlockEndC_isBvIsomLin).
6. `octStab` is a submonoid / closed under composition + identity.
7. W8 teeth: a CONCRETE non-identity gauge element — `octBlockEndC (houseHolder e2)` — fixes
   the (t,x) plane, genuinely MOVES the octonion axis e2 → −e2 (`houseHolder_neg_self`), and its
   octonion-block self-overlap reads `1` (gFormC e2 e2 = 1, e2_gFormC_self), the costume anchor.

## COSTUME C169 (must BITE)
A WRONG octonion-block-stabilizer / gauge-content / SO(8)/G₂ claim. Anchor: the concrete gauge
element `octBlockEndC (houseHolder e2)` preserves the octonion-block self-overlap of e2, reading
`gFormC e2 e2 = 1`. A wrong claim that it reads `137` forces `1 = 137`. PASS_SIGNATURE matches a
trailing substring `1 = 137`, distinct from C168 `1=136`, C167 `1=135`, … (all banked).

## GO / NO-GO
GO if probe closes all decls first-try with structural rewrites (no brute, no native-kernel-bypass,
no inflated maxHeartbeats). KILL = 90s/obligation: any single obligation exceeding 90s ⟹ INSTRUMENT
failure ⟹ decompose/reframe, NOT a longer grind. Expected: a LIGHT node (every step a one-rewrite
reduction through banked bilinearity + the N129 orthogonality + octBlockEndC).

## W4.5 ADVANCE (not re-pin)
The cover sector is closed; this node does NOT add another cover/kernel identity. It OPENS the
gauge sector: the stabilizer subgroup of the Lorentz cover IS the internal-symmetry (octonion-
block gFormC-isometry, SO(8)⊃Spin(7)⊃G₂) gauge group — the next physics-recognized structure,
DERIVED, no posited gauge group.
