# N64 — PREREG (frozen before compute)

## Node
The next forced node after N63 (the EvC-orthogonal eigenprojection `projC` + the
rotated-basis spectral square root `specOp_op_sqrt`). The HEAVY remainder is the
EXISTENCE of an EvC-orthonormal eigenbasis for an ARBITRARY EvC-self-adjoint
operator (`g = Σ λᵢ Pᵢ`) → polar/KAK → connectedness → full Spin(9)→SO(9)
exhaustion. MEASURE-FIRST priority (i): exhibit an explicit EvC-orthonormal
eigenbasis for a concrete/parametrized isometry-derived self-adjoint operator so
N63 `specOp_op_sqrt` delivers its root directly.

## The W1 reframe (THE ONE LAW) — what is immediately bankable, theory-native, radical-free
The full spectral existence over `Cut` (arbitrary self-adjoint operator has an
EvC-orthonormal eigenbasis) needs characteristic-polynomial roots / a discriminant
radical in the GENERAL (unequal-diagonal) case — the genuine HEAVY part (childed).
BUT a genuinely-GENERAL (2-parameter) PARAMETRIZED family is diagonalized into a
FIXED off-axis EvC-orthonormal eigenbasis with NO discriminant radical:

  Define the (t,x)-plane symmetric operator `txOp a b d : (t,x,v) ↦ (a·t+b·x, b·t+d·x, 0)`.
  The EQUAL-DIAGONAL family `txOp a b a` (a,b FREE) is, for EVERY a,b, diagonalized
  by the FIXED 45° EvC-orthonormal pair
      s := cutSqrt (1/2),  u₊ := (s, s, 0),  u₋ := (s, -s, 0)   (EvC-orthonormal: s²=1/2)
  with eigenvalues a+b and a−b:
      txOp a b a = specOp (a+b) (a−b) u₊ u₋          [the GENERAL parametrized eigendecomposition]
  and hence (for a ≥ |b|, i.e. a+b ≥ 0 ∧ a−b ≥ 0) its positive operator square root is
      specOp (cutSqrt (a+b)) (cutSqrt (a−b)) u₊ u₋   [via N63 specOp_op_sqrt]
  — the first GENERAL (whole-family) eigenbasis-existence result over the derived ℝ Cut,
  with an IRRATIONAL (cutSqrt-valued) off-axis eigenbasis (escalating N63's rational u35),
  constructed entirely from the banked `cutSqrt` (N57) + `EvC` (N58) + N63 `specOp`,
  NO Mathlib spectral theory, NO discriminant, NO posited inner product.

The ISOMETRY-DERIVED concrete case the ticket names explicitly:
  `boostGenC ∘ boostGenC = txOp 1 0 1 = specOp 1 1 u₊ u₋`  (the (t,x)-plane projection — a
  banked isometry generator's square IS a spectral operator; its root is itself).
A concrete NON-TRIVIAL root witness:
  `txOp 5 4 5 = specOp 9 1 u₊ u₋`, positive root `specOp 3 1 u₊ u₋`  (eigenvalues 9,1; clean).

## GO / NO-GO
- GO if `txOp a b a = specOp (a+b)(a−b) u₊ u₋` (general) PLUS the EvC-orthonormality of
  {u₊,u₋} PLUS `boostGenC∘boostGenC = txOp 1 0 1` PLUS the concrete root witness all
  compile foundations-only, the costume C95 bites a WRONG diagonalization, gate D0–D6 green.
- NO-GO / DECOMPOSE if the general identity resists: fall back to the CONCRETE off-axis
  witness (txOp 5 4 5 = specOp 9 1 u₊ u₋ alone) as the bankable piece; child the rest.

## KILL (classifies a fight as INSTRUMENT failure, not theory)
- The identities are pure (t,x)-block field arithmetic with the single nonrational fact
  s·s = 1/2 (cutSqrt_sq). Each obligation is an `ext` + `rw`/`ring` over ≤ 3 components.
- KILL BUDGET: if ANY single obligation does NOT close under `ext; … ; ring`-class tactics
  within a bounded scratch probe (≤ ~30s each, default maxHeartbeats), STOP — do NOT inflate
  maxHeartbeats, do NOT brute. That is an INSTRUMENT signal: re-express through the banked
  `specOp_apply`/`EvC_smul_*`/`cutSqrt_sq` structurally rather than coordinate-bash.
- NO inflated maxHeartbeats, NO native_decide, NO monolithic brute. Bank-as-you-go: the
  instant a lemma compiles, productionize + wire + commit BEFORE chasing the next.

## The heavy remainder (childed N65 — honest W1 dissolution)
The GENERAL (unequal-diagonal) 2×2 symmetric eigendecomposition (discriminant radical),
the full n-dim eigenbasis existence over Cut, the polar/KAK assembly, connectedness, and
the full Spin(9)→SO(9) exhaustion remain the genuine HEAVY group-manifold core.

## Costume C95 (must BITE)
A WRONG diagonalization of the concretely-presented operator: claim
`txOp 5 4 5 = specOp 9 2 u₊ u₋` (u₋ eigenvalue wrong: 1 vs claimed 2). Banked
`txOp 5 4 5 = specOp 9 1 u₊ u₋`; reading at the u₋ eigenblock (specOp_read₂) forces
`1 = 2` — a false numeric DISTINCT from the banked battery (C84 8=4 … C94 16=15).
(Final numeric fixed during build.)

## Physics-words-removable
Delete "Lorentz/boost/rotation/Spin/SO(9)/isometry/spectral/eigenbasis/eigenvalue/
eigenprojection/diagonal/orthonormal/projection/square-root/self-adjoint": the statements
stand as pure math about `txOp`/`specOp`/`projC`/`EvC`/`cutSqrt`/`IsEvCOpSqrt` over the
derived ℝ Cut + the terminal algebra O Cut.
