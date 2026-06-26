# N61 PREREG — frozen before compute

## Node
N61 — the next forced node after N60 (the structured/scalar operator square root).
Ticket target: the FULL spectral operator square root over the 10-dim form space (general
non-scalar `g*g`) → the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the connected
component ≤ `genIsomMonoidC2`) + the full `Spin(9)→SO(9)` exhaustion.

## MEASURE-FIRST decision (ROADMAP §N61 priority (i))
The FULL spectral root (arbitrary self-adjoint positive-semidefinite operator, simultaneous
diagonalization, no Mathlib spectral theory over `Cut`) is the genuine HEAVY part and is a
sub-node. The immediately-bankable STRUCTURAL piece, extending N60's scalar case toward the
full spectrum, is the **2-block diagonal operator that is NOT a single scalar**:

`blockDiag a b : Module.End Cut STVC`, `(t,x,v) ↦ (a•t, a•x, b•v)` — scalar `a` on the
EvC-orthogonal `(t,x)` plane, scalar `b` on the octonion block `v`. The EvC form
`EvC p q = t·t' + x·x' + gFormC v v'` makes `(t,x)` and `v` EvC-orthogonal, so the operator
is diagonal in this banked splitting. When `a = b` it collapses to N60's `c•id` (so it is a
genuine extension). Its positive operator square root is the blockwise scalar root
`blockDiag (cutSqrt c₁)(cutSqrt c₂)` — N60 `scalar_op_sqrt` applied blockwise + N57 `cutSqrt`.

## THE TRUNK REFRAME (THE ONE LAW)
The operator root of a diagonal (non-scalar) operator IS the scalar `cutSqrt` applied
eigenvalue-by-eigenvalue on the EvC-orthogonal eigenblocks. Self-adjointness = EvC bilinearity
blockwise; positive-semidefiniteness = `a·t² + a·x² + b·gFormC v v ≥ 0` for `a,b ≥ 0` (N57
`cutSqrt_nonneg` × N58 `EvC_nonneg`/N56 `gFormC_nonneg` = THE TRUNK POSITIVITY); squaring back
= block scalar multiplication. NO Mathlib spectral theory, NO posited operator calculus, NO
Mathlib ℝ/ℂ as content. DERIVED over the derived ℝ `Cut` + the terminal algebra `O Cut`.

## GO / NO-GO
- GO if: `blockDiag` constructs as a `Module.End Cut STVC`; `blockDiag_isEvCSymm`,
  `blockDiag_comp`, `blockDiag_id_inj`, `blockDiag_nonneg` (a,b≥0), and ★ `blockDiag_op_sqrt`
  (`IsEvCOpSqrt (blockDiag (cutSqrt c₁)(cutSqrt c₂)) (blockDiag c₁ c₂)` for c₁,c₂≥0) all
  compile foundations-only; the scalar collapse `blockDiag c c = c•id` holds; a genuine
  NON-scalar witness (`blockDiag 2 3` roots `blockDiag 4 9`, 2≠3) and W8 teeth bite.
- NO-GO / DECOMPOSE if: the b-block scalar reader (`gFormC (b•1) 1 = b`) or the LinearMap
  construction resists → smaller piece (just the EvC-symmetry + comp), child the root.
- The FULL spectral root (arbitrary orthogonal decomposition) + global reverse KAK
  surjectivity + connectedness + full `Spin(9)→SO(9)` exhaustion is childed N62 REGARDLESS
  (it is the genuine heavy remainder, never closed here).

## KILL budget (W9)
Pure linear-algebra + ordered-field arithmetic, same engine as N58–N60 (which compiled ≤9s).
KILL = any single obligation exceeding **60s** compile is an INSTRUMENT failure → measure /
decompose / reframe, NOT a longer grind. NO `maxHeartbeats` inflation, NO `native_decide`, NO
`sorry`, NO monolithic brute normalizer on a fully-expanded coordinate goal. Probe each lemma
in an isolated scratch file (`lake env lean`), bank-as-you-go the instant it compiles clean.

## W8 costume (C92)
Must bite a WRONG block-root claim reducing to a false numeric DISTINCT from the banked battery
{C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0, C90 1=-1, C91 25=7}.
Plan: `IsEvCOpSqrt (blockDiag 2 3) (blockDiag 4 10)` is WRONG — `(blockDiag 2 3)² = blockDiag 4 9`,
so it forces `9 = 10` at the octonion block (exercising the new b-block reader). `9 = 10` distinct.

## Physics-words-removable
Delete "Lorentz/boost/rotation/spectral/eigenspace/eigenvalue/diagonal/block/Cartan/polar/KAK/
square-root/self-adjoint/positive-semidefinite/isometry/Spin/SO(9)": what remains is pure math
about the derived complete ordered field `Cut`, the Cayley–Dickson triple `O Cut`, the symmetric
positive-(semi)definite form `EvC`, and the scalar root `cutSqrt`.

## Standard check (applied before commit)
unbroken (every object from the banked chain or standard Mathlib machinery on derived objects) /
complete (#print axioms ⊆ {propext, Classical.choice, Quot.sound}, no sorry/axiom/native_decide) /
physics-words-removable (above).
