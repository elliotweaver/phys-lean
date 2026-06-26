# PREREG — N75 seed eigenpair extraction at general dimension (the cubic-root-via-IVT engine)

FROZEN BEFORE COMPUTE.

## Context (what is banked)
- N57 `cutSqrt`: the positive-definite SCALAR square root over the DERIVED ℝ `Cut`,
  built from `intermediate_value_Icc` riding Cut's banked order-completeness (N33 CCLO),
  order-topology (N34 OrderTopology/IsTopologicalRing), Archimedean (N35), CompleteSpace (N37).
  Degree-2 root engine.
- N68 `specOpN`, N71 `specOpN_eigen` (vector eigen-equation for a GIVEN orthonormal family),
  N72 constructed 2×2 octonion-coupling seed (discriminant radical R = cutSqrt(δ²+b²)),
  N70 `deflateC`, N73 closed descent, N74 GENERAL ITERATED DESCENT `deflateList`/`specOpN_full_descent`.
- The chain's seed extraction tops out at a 2×2 block (a single discriminant radical = degree-2).
  The missing SEED at dimension ≥ 3 needs an eigenvalue from the characteristic CUBIC — beyond a
  square-root radical. The ROADMAP §N75 names the exact reframe: "is the cubic root the banked
  cutSqrt-style order-completeness/IVT engine N57/N33–N37 applied to the characteristic cubic?"

## THE TARGET (the immediately-bankable theory-native piece — the eigenvalue half of the seed)
THE ONE LAW reframe: the eigenvalue-existence lever at dimension ≥ 3 is NOT a new posit and NOT a
Cardano radical grind. It DISSOLVES through the SAME order-completeness/IVT engine that built N57
`cutSqrt`, escalated from degree 2 to ODD degree. Bank:
- `cutCbrt a` : the real cube root over Cut (∀ a, including negatives — odd, defined everywhere)
  with `cutCbrt a ^ 3 = a`, via IVT on `x ↦ x^3` (continuous, surjective onto Cut by Archimedean
  ±∞ bounds). The direct degree-3 escalation of `cutSqrt`.
- `cut_cubic_has_root` : EVERY monic cubic `x³ + b x² + c x + d` over Cut HAS a root over Cut, via
  IVT (the cubic → +∞ and → −∞ by Archimedean bounds, so it crosses 0). THE eigenvalue-existence
  lever for an arbitrary self-adjoint operator on a 3-dim space (its characteristic polynomial is a
  monic cubic; a root is an eigenvalue). The genuine SEED-at-general-dimension half the chain lacked.
- A concrete non-vacuity witness (e.g. `cutCbrt 8 = 2`, and a concrete cubic with a known root)
  for the costume to bite.

## GO / NO-GO
- GO if the IVT engine closes `cutCbrt` existence + the general monic-cubic root over Cut,
  foundations-only (#print axioms ⊆ {propext, Classical.choice, Quot.sound}), in production under
  Phys/Algebra/, gate D0–D6 green, costume C106 bites a WRONG cube-root / cubic-root value
  (a false numeric DISTINCT from the banked battery incl C105 25=13).
- NO-GO / DECOMPOSE if the eigenVECTOR extraction (nonzero kernel of T−λ over STVC, a 10-dim
  product space) or the full existence ∀ g ∃ c u, g = specOpN c u resists in this run — bank the
  cubic-root engine (the eigenvalue half), child the eigenvector-extraction + full existence +
  global polar/KAK assembly + connectedness + reverse surjectivity + Spin(9) exhaustion.

## KILL (instrument-failure budget, W9)
- KILL = 45 s wall for any single obligation's elaboration. If IVT on the cubic blows past 45 s,
  it is an INSTRUMENT failure (framing wrong), NOT a theory failure: measure the smallest
  sub-obligation, decompose, never inflate maxHeartbeats, never brute. The cube-root case (`x^3 = a`)
  is the minimal odd-degree probe — measure it FIRST.
- If Mathlib already has an odd-degree-root theorem usable over Cut (a `LinearOrderedField` +
  IVT/`ConditionallyCompleteLinearOrder` instance), USE it as MACHINERY on the derived Cut (W2),
  do not re-derive.

## ANTI-DRIFT
- Cube root / cubic root over Cut is CONTENT derived from the trunk (the order-completeness the
  continuum was built with), NOT a Mathlib ℝ import. NO `import Mathlib.Data.Real`. The polynomial
  machinery (`Polynomial`, `intermediate_value`, `Continuous`) is standard MACHINERY on the DERIVED
  `Cut`. Words-removable: delete "eigenvalue/characteristic/cubic/spectral/seed/dimension" → pure
  math about roots of polynomials over the derived complete ordered field `Cut`.
