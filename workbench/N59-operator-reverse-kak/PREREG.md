# N59 PREREG — frozen before compute

## Node
N59: the operator-level core of the reverse KAK. MEASURE-FIRST priority (i) from the ticket:
THE OPERATOR FORM-ADJOINT `g*` w.r.t. the positive-definite Euclidean reference form `EvC` (N58),
lifting the N58 infinitesimal `IsEvCSymm`/`IsEvCSkew` to the GROUP/operator level, with `g*∘g`
self-adjoint (EvC-symmetric) and EvC-positive-semidefinite — the trunk-positivity heart of the
polar/KAK `g = k·exp(p)`: the positive part `exp(p) = √(g*g)` rests on `g*g ⪰ 0`, and THAT is
exactly the Born positivity the chain already banked (N56 `gFormC_nonneg`, N58 `EvC_nonneg`).

## What is bankable THIS node (the immediately-available structural piece)
A new production file `Phys/Algebra/LorentzContinuumAdjoint.lean`:
  • `IsEvCAdjoint g h := ∀ p q, EvC (g p) q = EvC p (h q)` — `h` is the EvC-adjoint of `g`.
  • `IsEvCAdjoint.symm` — adjunction is symmetric (`h` adjoint of `g` ⟹ `g` adjoint of `h`).
  • `IsEvCAdjoint.comp_isEvCSymm` — `h∘g` (= `g*g`) is EvC-SYMMETRIC (self-adjoint).
  • `IsEvCAdjoint.comp_nonneg` — ★ `0 ≤ EvC ((h∘g) p) p` — `g*g` is EvC-POSITIVE-SEMIDEFINITE,
    reducing to `EvC (g p)(g p) ≥ 0` via N58 `EvC_nonneg` (THE TRUNK POSITIVITY at operator level).
  • boost witness: `boostGenC` is its own EvC-adjoint (`= boostGenC_EvC_symm`); `boostGenC∘boostGenC`
    self-adjoint + nonneg; a concrete strictly-positive value (`= 9` at `(3,0,0)`) — non-vacuity.
  • rotation witness: for imaginary `a` (`gFormC a 1 = 0`), `-rotGenC a` is the EvC-adjoint of
    `rotGenC a` (skew-adjoint, via N58 `rotGenC_EvC_skew` + `EvC_neg_right`); `(-rotGenC a)∘(rotGenC a)`
    self-adjoint + nonneg.
  • W8 teeth IN-FILE: `rotGenC e₂` is NOT EvC-symmetric (`¬ IsEvCSymm`) — the rotation is genuinely
    skew-adjoint (`g* = -g ≠ g`), the operator analogue of N58 `boostGenC_not_EvC_skew`; reduces to
    `1 = -1` via `e2_alt`/`e2_gFormC_self`/`gFormC_one`.

## Costume C90
`LorentzContinuumAdjointRotSelfAdjointCostume.lean`: the WRONG operator-adjoint claim that the
imaginary rotation `rotGenC e₂` is SELF-adjoint (EvC-symmetric, putting the compact/skew-adjoint
generator into the noncompact/self-adjoint part — the operator-level version of C89's mis-split).
Read at `p=(0,0,1)`, `q=(0,0,e₂)`: LHS `= gFormC (e₂·1) e₂ = gFormC e₂ e₂ = 1`; RHS
`= gFormC 1 (e₂·e₂) = gFormC 1 (−1) = −1`. The wrong self-adjoint claim asserts `1 = −1`. MUST fail
to compile. Bite `1 = -1` — DISTINCT from the battery (C84 8=4, C85 0=2, C86 27=9, C87 10=8,
C88 9=4, C89 50=0).

## GO / NO-GO
GO if: the adjoint package + both witnesses + the W8 negation compile foundations-only
`[propext, Classical.choice, Quot.sound]`, costume C90 bites `1 = -1`, gate D0–D6 green.
NO-GO (decompose/child) if: the OPERATOR SQUARE ROOT over the 10-dim form space, the polar/KAK
ASSEMBLY, CONNECTEDNESS, or the full `Spin(9)→SO(9)` exhaustion is reached — those are the genuine
heavy remainder (no Mathlib spectral theory / Lie integration over `Cut`); child N60, do NOT grind.

## KILL (W9 instrument budget)
Each obligation here is pure field/`gFormC` arithmetic on small blocks (the N58 engine). KILL = 90s
wall for any single obligation. If any obligation exceeds 90s OR needs an inflated `maxHeartbeats`
OR a monolithic brute normalizer → INSTRUMENT failure: stop, measure, decompose; never grind.
Expectation (from N56–N58): probe + production ~8s, KILL never approached.

## Standing gates
No Mathlib ℝ/ℂ as content (the continuum is the DERIVED `Cut`; `Module.End`/`LinearMap.comp` are
MACHINERY on the derived objects). No posited Lorentz group / adjoint / inner product. No bridge.
Physics-words-removable: delete "Lorentz/boost/rotation/adjoint/self-adjoint/skew/Cartan/KAK/polar/
compact/noncompact/positive-semidefinite/Spin/SO(9)" → the statements stand as pure math about
`EvC`/`boostGenC`/`rotGenC`/`gFormC` over the derived `Cut` and the terminal algebra `O Cut`.
