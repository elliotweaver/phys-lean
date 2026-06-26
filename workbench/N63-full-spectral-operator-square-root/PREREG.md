# N63 PREREG — frozen before compute

## Node
N63 — the next forced node after N62 (octonion-internal coordinate-diagonal operator square root,
`coordDiag3_op_sqrt`). The ticket TARGET is the FULL spectral operator square root over an ARBITRARY
(non-coordinate-diagonal) `g*g` → global reverse KAK surjectivity + full Spin(9)→SO(9) exhaustion.

## MEASURE-FIRST decision (W1/W9, ROADMAP §N63 priority (i))
N60 banked the SCALAR root, N61 the 2-block, N62 the octonion-internal (3-eigenvalue) coordinate-
diagonal root — all DIAGONAL IN THE STANDARD COORDINATE BASIS. The genuine remaining heavy core is
the CHANGE OF BASIS: an arbitrary self-adjoint operator brought to diagonal form by a ROTATION
(EvC-orthogonal change of basis). The immediately-bankable, theory-native, genuinely-NEW structural
lever (priority (i)) is:

  THE EvC-ORTHOGONAL EIGENPROJECTION + THE SPECTRAL SQUARE ROOT IN A ROTATED ORTHONORMAL BASIS.

- `projC u : p ↦ (EvC u p) • u` — the EvC-orthogonal projection onto the line `span(u)`. THE
  spectral building block. NEW: nothing in the chain has a projection; all of coordDiag3 was
  diagonal in the FIXED standard basis. `projC` works for an ARBITRARY EvC-unit `u`, including a `u`
  NOT in the standard basis — that IS the rotated-basis lever.
  Properties (each a theorem): EvC-self-adjoint (any u), idempotent (EvC u u = 1),
  EvC-positive-semidefinite (any u), orthogonal composition (EvC u₁ u₂ = 0 ⟹ projC u₁ ∘ projC u₂ = 0).
- `specOp λ₁ λ₂ u₁ u₂ := λ₁ • projC u₁ + λ₂ • projC u₂` — the spectral operator diagonal in the
  EvC-ORTHONORMAL eigenbasis {u₁,u₂} (NOT the standard coordinate basis). The genuine generalization
  beyond coordDiag3.
  Properties: EvC-self-adjoint (any u₁,u₂); EvC-positive-semidefinite for λᵢ≥0 (any u₁,u₂);
  composition law `specOp λ₁ λ₂ ∘ specOp λ₁ λ₂ = specOp (λ₁²) (λ₂²)` REQUIRES orthonormality
  (EvC u₁ u₁ = EvC u₂ u₂ = 1, EvC u₁ u₂ = 0); eigenblock reader `EvC (specOp .. u₂) u₂ = λ₂`.
- ★★ THE HEART `specOp_op_sqrt`: for an EvC-orthonormal pair and c₁,c₂ ≥ 0,
  `specOp (cutSqrt c₁)(cutSqrt c₂) u₁ u₂` is a positive operator square root of `specOp c₁ c₂ u₁ u₂`
  — THE SPECTRAL SQUARE ROOT IN A ROTATED BASIS, the scalar cutSqrt applied per eigenprojection.
- CONCRETE WITNESS (genuinely non-coordinate-diagonal): the Pythagorean (3,4,5) EvC-orthonormal pair
  u₁=(3/5,4/5,0), u₂=(4/5,-3/5,0). `specOp 4 9 u₁ u₂` is the symmetric operator (t,x,0) ↦
  ((36/5)t−(12/5)x, −(12/5)t+(29/5)x, 0) — OFF-DIAGONAL −12/5 ≠ 0, genuinely NOT coordinate-diagonal,
  eigenvalues 4,9. Its rotated-basis spectral square root is `specOp 2 3 u₁ u₂` (eigenvalues 2,3).

## What this OPENS (W4.5 sufficiency — not a re-confirm)
coordDiag3 (N62) only diagonalizes in the FIXED standard basis. `specOp` diagonalizes in an
ARBITRARY EvC-orthonormal pair — the FIRST rotated-basis spectral object in the chain, and the first
concrete NON-coordinate-diagonal self-adjoint operator with a proved spectral square root. This is
the structural lever the full spectral root needs.

## What stays CHILDED (honest W1/W3 remainder → N64)
The FULL spectral square root for an ARBITRARY self-adjoint operator needs the EXISTENCE of an
EvC-orthonormal eigenbasis (that every such operator HAS eigenvectors / decomposes as Σλᵢ Pᵢ) — no
Mathlib spectral theory over `Cut`. Plus the polar/KAK assembly, connectedness, full Spin(9)→SO(9)
exhaustion. Childed N64.

## GO / NO-GO
GO if: projC + its 4 properties + specOp + its self-adjoint/positivity/comp/reader + specOp_op_sqrt
+ the concrete (3,4,5) orthonormality + the witness all compile foundations-only
[propext, Classical.choice, Quot.sound], the costume C94 bites a FRESH false numeric, gate D0–D6 green.
NO-GO / DECOMPOSE if the comp law or the concrete witness resists.

## KILL budget (W9)
- KILL = 60s wall per single proof obligation. No `maxHeartbeats` inflation. No monolithic brute over
  expanded octonion coordinates — all general specOp proofs are STRUCTURAL (EvC bilinearity +
  sq_nonneg + orthonormality hyps), the witness keeps v=0 (gFormC 0 0 = 0).
- If any obligation exceeds 60s: STOP, measure the smallest sub-obligation, decompose, do NOT grind.
- Risk note: the only arithmetic risk is field division (3/5 : Cut) in the concrete witness —
  Cut is the derived complete LinearOrderedField, norm_num expected to close. Probe FIRST.

## Costume C94 (W8 — must BITE, fresh numeric)
A WRONG rotated-basis spectral-root claim: `specOp 2 4 u₁ u₂` is an operator square root of
`specOp 4 15 u₁ u₂`. Banked comp law: (specOp 2 4)∘(specOp 2 4) = specOp (4)(16), and reading the u₂
eigenblock forces 4·4 = 16 = 15. Reduces to the FALSE numeric `16 = 15` — DISTINCT from the banked
battery (C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0, C90 1=−1, C91 25=7, C92 9=10,
C93 9=11). MUST fail to compile.

## Physics-words-removable
Delete "Lorentz/boost/rotation/spectral/eigenspace/eigenvalue/eigenprojection/eigenbasis/diagonal/
orthonormal/projection/square-root/self-adjoint/isometry/Spin/SO(9)/KAK/polar/Cartan": what remains
is pure math about the symmetric positive-definite bilinear form EvC, the Cut-linear maps
`projC u : p ↦ (EvC u p)•u` and `specOp λ₁ λ₂ u₁ u₂ := λ₁•projC u₁ + λ₂•projC u₂`, their
self-adjointness / idempotence / nonnegativity / composition, and cutSqrt over the derived ℝ Cut.
No theorem STATEMENT needs a physics word.
