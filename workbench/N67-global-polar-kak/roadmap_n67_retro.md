  - **★ (N67 LANDED) THE FIRST 10-DIMENSION-MIXING SPECTRAL SQUARE ROOT (an EvC-orthonormal eigenbasis
    MIXING the `(t,x)` plane WITH the octonion block `O Cut`) + THE RANK-3 SPECTRAL OPERATOR `specOp3`,
    over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`
    (`Phys/Algebra/LorentzContinuumSpectralMix.lean`, 24 decls foundations-only, independently
    axiom-audited).** THE W1 REFRAME + W9 MEASURE-FIRST (ROADMAP §N67 priority (i)) + W3 DECOMPOSE: the
    ticket TARGET was the HEAVY group-manifold core (the GLOBAL polar/KAK assembly for an arbitrary `g`,
    connectedness, the GLOBAL reverse KAK surjectivity, the full `Spin(9)→SO(9)` exhaustion); MEASURE-FIRST
    confirmed the full n-dim spectral existence for an arbitrary `g*g` and the connectedness/surjectivity/
    exhaustion each need group-manifold machinery Mathlib lacks over `Cut` — the genuine HEAVY sub-nodes
    (childed N68). The chain had, across N63–N66, the rotated-basis spectral square root `specOp_op_sqrt`
    (general over ANY EvC-orthonormal PAIR), but EVERY concrete spectral witness lived purely in the `(t,x)`
    plane or in block-SEPARATED coordinate blocks — no witness coupled `(t,x)` to `O Cut`, and no spectral
    object existed beyond rank 2. The two immediately-bankable, theory-native STRUCTURAL escalations the
    full existence consumes are exactly: (A) a CONCRETE EvC-orthonormal eigenbasis MIXING the time axis with
    the octonion block, and (B) the rank-2 → rank-3 spectral operator. THE REFRAME: take `mixA := (3/5, 0,
    (4/5)·1)`, `mixB := (4/5, 0, (−3/5)·1)` — EvC-orthonormal via the banked octonion bilinear `gFormC`
    (`(3/5)² + (4/5)²·gFormC 1 1 = 1`, `mixA_norm`/`mixB_norm`/`mix_orth`); then `specOp 4 9 mixA mixB`
    sends the pure-time unit `(1,0,0)` to a vector with octonion component `(−12/5)·1 ≠ 0`
    (`specOp_mix_octBlock`) — the time axis maps INTO the octonion block, IMPOSSIBLE for any block-separated
    `coordDiag3`/`blockDiag`/`boostC`; its positive operator square root `specOp (cutSqrt c₁)(cutSqrt c₂)
    mixA mixB` is read off via N63 `specOp_op_sqrt` (`specOp_mix_op_sqrt`, the FIRST 10-dim-mixing spectral
    square root, concretely `specOp 2 3 mixA mixB` roots `specOp 4 9 mixA mixB`). For (B): `specOp3 l₁ l₂ l₃
    u₁ u₂ u₃ := l₁•projC u₁ + l₂•projC u₂ + l₃•projC u₃` is EvC-self-adjoint (`specOp3_isEvCSymm`, closure
    of `projC` symmetry), EvC-positive-semidefinite for `lᵢ ≥ 0` (`specOp3_nonneg`), composes by squaring
    eigenvalues over an EvC-orthonormal TRIPLE — all three cross terms vanish (`specOp3_comp`) — and has
    positive operator square root `specOp3 (cutSqrt c₁)(cutSqrt c₂)(cutSqrt c₃)` (`specOp3_op_sqrt`), the
    inductive step rank-2 → rank-n, non-vacuously over the time/space/octonion-mixing orthonormal triple
    `{mixA, mixB, mixW3}` (`mixW3 := (0,1,0)`, `specOp3_mix_witness`). PURE linear-algebra + ordered-field
    arithmetic over the derived ℝ `Cut`, the same engine as N56–N66 (two scratch probes + production
    compiled clean ≤9s, all 24 decls foundations-only at first compile, KILL=30s/obligation never approached,
    NO inflated maxHeartbeats / NO native_decide / NO brute; a `w3`→`mixW3` rename resolved a
    `Phys.Algebra.JordanTower` name collision — hygiene, not theory). Costume C98
    (`LorentzContinuumSpectralMixWrongRootCostume`) bites the WRONG 10-dim-mixing spectral root — that
    `specOp 2 7 mixA mixB` is a square root of `specOp 4 9 mixA mixB` (the genuine root is `specOp 2 3 mixA
    mixB`, `mixB` eigenvalue `3`, squared reading `9`); banked `specOp_comp`/`specOp_read₂` give `(specOp 2 7
    mixA mixB)²` reading `7·7 = 49` at `mixB`, against the `specOp 4 9 mixA mixB` reading `9`, so the wrong
    mixing root forces `49 = 9` (distinct from C84 `8=4`, …, C96 `25=30`, C97 `25=9`). Non-vacuity:
    `specOp_mix_octBlock` (the genuine 10-dim coupling) + `specOp_mix_witness`/`specOp3_mix_witness` (concrete
    roots) + `not_specOp_mix_2_6` (teeth, forces `36 = 9`). Words-removable: delete "Lorentz/boost/rotation/
    spectral/eigenspace/eigenvalue/eigenprojection/eigenbasis/diagonal/orthonormal/projection/square-root/
    self-adjoint/positive-semidefinite/isometry/Spin/SO(9)/KAK/polar/Cartan/mixing/dimension" → over the
    derived complete ordered field `Cut` and `O Cut`, for the symmetric positive-definite form `EvC` and the
    `Cut`-linear maps `projC`/`specOp`/`specOp3`: `mixA`,`mixB`,`mixW3` are EvC-orthonormal, `specOp 4 9 mixA
    mixB (1,0,0)` has octonion component `(−12/5)·1`, `specOp (cutSqrt c₁)(cutSqrt c₂) mixA mixB` squares to
    `specOp c₁ c₂ mixA mixB`, `specOp3` is EvC-symmetric, nonneg for `lᵢ ≥ 0`, composes by squaring
    eigenvalues over an orthonormal triple, and `specOp3 (cutSqrt c₁)(cutSqrt c₂)(cutSqrt c₃)` squares back;
    pure math. W3 DECOMPOSE: the FULL n-dim spectral EXISTENCE (an ARBITRARY EvC-self-adjoint operator
    decomposing as `Σᵢ λᵢ Pᵢ`) + the GLOBAL polar/KAK assembly for an arbitrary `g` + connectedness + the
    GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)` exhaustion is childed N68.

