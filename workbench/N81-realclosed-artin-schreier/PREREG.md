# N81 PREREG — frozen before compute

## TARGET (specified against what the chain ACTUALLY produced — N49–N80 banked)
The genuine W1 BUILD-don't-posit content gating the EVEN-DIM real-eigenvalue seed:
the real-closed Artin–Schreier factorization, isolated to `cut_has_factor_le_two`
(equivalently `Cut[i] = Cut[X]/(X²+1)` algebraically closed).

## MEASUREMENT (recorded N80, re-confirmed this run)
- `IsRealClosed` occurs in EXACTLY ONE Mathlib file: the 127-line stub
  `FieldTheory/IsRealClosed/Basic.lean` (class + `of_linearOrderedField` + square
  helpers ONLY). NO real-closed → R[i] alg-closed theorem, NO factorization API.
- `grep Sylow FieldTheory/` → NOTHING. Mathlib has NO Sylow-in-field-theory glue,
  so the full algebraic Artin–Schreier (Galois group is a 2-group → trivial) is a
  MULTI-NODE build, not a single-node grind.
- `Analysis/Polynomial/Factorization.lean` has degree-≤2 factorization ONLY over
  concrete `ℝ` (`-- TODO: generalize to real closed fields`).
- Route (b) variational/Rayleigh needs the FULL topology stack on `STVC` (product
  topology, continuity of `EvC` and `g`, sphere ⊆ box compactness) — also multi-node.

## DECISION (W3 decompose + W1 build-don't-posit)
Both full routes are multi-node. The disciplined move is to BANK the
immediately-bankable trunk-native STRUCTURAL piece that maximally advances route
(a), and CHILD the heavy remainder. The chosen bankable piece:

**The `Cut[i]` quadratic field extension + its degree-2 structure + the trunk-native
Artin–Schreier degree-2 input: every element of `Cut[i]` is a square in `Cut[i]`.**

This is PURE ALGEBRA riding the banked `cutSqrt` (N57) — over `Cut` every nonneg is
a square, so for `z = a + b·i` the modulus `√(a²+b²)` exists (a²+b² ≥ 0), and the
classical formula `√((|z|+a)/2) + sign·√((|z|−a)/2)·i` is a square root of `z`. This
is the genuine "no degree-2 extension of `Cut[i]`" half of Artin–Schreier; combined
with N77 odd-degree-root it reduces alg-closure to the Sylow 2-group glue (childed).
NO topology needed. Trunk-native (rides `cutSqrt` directly).

## GO / NO-GO
- GO if: `Cut[i] := AdjoinRoot (cutQuad 0 1)` is a Field (from N80 irreducibility via
  `Fact`), `Module.finrank Cut Cut[i] = 2`, and the square-existence lemma compiles
  foundations-only. Bank it, child the alg-closure(Sylow)+even-seed+existence remainder.
- NO-GO / fallback: if the square-existence formula over `AdjoinRoot` is fiddly
  (coordinate extraction painful), bank the SMALLER piece — the `Cut[i]` Field +
  `[Cut[i]:Cut]=2` degree fact alone (the construction skeleton) — and child the rest.

## KILL BUDGET (W9 — instrument-failure thresholds)
- Any SINGLE proof obligation that does not elaborate within **120s** in a bounded
  probe → declare INSTRUMENT failure, decompose that obligation, do NOT inflate
  maxHeartbeats, do NOT re-run the same blob.
- Cold `lake env lean` on a probe importing the Reseed/Factor chain: expect ~60–120s
  (warm oleans). If a probe exceeds **240s** total → it is the topology/heavy import,
  reframe.
- CHECKPOINT at ~50% of turn budget: the instant production + costume + wiring
  compile clean, COMMIT, run gate in BACKGROUND, child + complete with turns to spare.

## COSTUME (W8 — next id C112)
Must bite a WRONG `Cut[i]` degree / square-existence / alg-closure claim, reducing to
a false numeric DISTINCT from the banked battery (… C111 17=40). Candidate: a WRONG
`finrank Cut Cut[i]` value, or a wrong evaluation in the square-root formula.

## PHYSICS-WORDS-REMOVABLE
Delete "Lorentz/spectral/eigen*/real-closed/Artin-Schreier/algebraic-closure/seed/
even-dim/Spin/SO(9)/isometry": what remains is the theorem that over the derived
complete ordered field `Cut` (every nonneg a square), the quadratic extension
`Cut[X]/(X²+1)` is a degree-2 field in which every element is a square. Pure
field/algebra math. No theorem STATEMENT needs a physics word.
