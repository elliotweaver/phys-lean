# N235 — PREREG/FINDINGS: the g₂-invariant-form generator toolkit for the FFT ascent (27 irreducibility)

## The wall (inherited from N234, re-confirmed)
Target `tracelessSym_irreducible` reduces (N234 measurement) to `dim End_{g₂}(7⊗7) = 4`.
- LOWER bound ≥ 4: nearly free — N233's four mutually-orthogonal g₂-equivariant projectors give
  ≥ 4 independent g₂-endomorphisms (Σ mᵢ² ≥ 4 with ≥4 distinct-dimension summands).
- UPPER bound ≤ 4: this IS the g₂ First Fundamental Theorem of invariant theory — that δ (metric)
  and φ (associative 3-form) GENERATE all g₂-invariant tensors, and that the degree-4 contractions
  number exactly 4 (three δ-pairings (12)(34),(13)(24),(14)(23) + one independent φ·φ contraction).
- The pillar/decomposition route to ≤4 is CIRCULAR (needs End_{g₂}(27)=ℚ, i.e. the very
  irreducibility we want). Only the direct FFT count breaks the circularity.
- Mathlib has ZERO g₂ invariant theory (grep highestWeight|weightSpace|Casimir|invariantTheory ⟹ empty).
  This is a genuine multi-node ASCENT to a richer structure (the invariant algebra), per SOUL's
  repeated-deferral/named-ascent discipline.

## What THIS node banks (toolkit brick of the NAMED ascent — W1 step 1 / W9.8)
The FFT count cannot even be STATED without knowing the generators δ, φ (and ψ = *φ) LIE in the
g₂-invariant space. This node banks exactly that missing structural fact:
- `bornForm_g2_invariant`   — δ (= gForm) g₂-invariant: ⟨Dx,y⟩+⟨x,Dy⟩=0. Literally `gFormQ_skew` (N24).
- `assoc_deriv_leibniz` / `_lieQ` — associator [x,y,z] obeys 3rd-order Leibniz under any derivation.
- `assoc3_g2_invariant`     — φ (= assoc3) g₂-invariant. Route: octCross Leibniz (N207) + gFormQ_skew (N24).
- `coassoc4_g2_invariant`   — ψ (= coassoc4 = *φ) g₂-invariant. Route: assoc Leibniz + gFormQ_skew (N24).
- `invariantForms_nonvacuity` (φ = 1 on (u1,u2,u1×u2)) + `invariant_forms_g2_invariant_toolkit` bundle.

MEASURED tractability BEFORE committing (bounded probes, W9): φ-invariance 33s warm, ψ+δ+Leibniz 18s.
Both prerequisites (`gFormQ_skew` N24, `derivationLieQ_octCross_leibniz` N207) already banked ⟹ no
coordinate grind, no `ring`/`decide` blowup. Production whole-module olean 31s.

## The dissolution route TOOLKIT serves (childed as N236)
N236 (the dedicated dissolution node): prove `dim (ImO^{⊗4})^{g₂} = 4` (equivalently
`dim End_{g₂}(ImO ⊗ ImO) = 4`) from these generators — the g₂ FFT — then combine with N233's four
distinct-dimension summands (Σ mᵢ² = 4, ≥4 terms each ≥1 ⟹ four multiplicity-one irreducibles) to
force `tracelessSym_irreducible` and the capstone `irreducible_clebsch_gordan_structure`. If the FFT
count itself needs further Mathlib-absent tensor-invariant machinery, BUILD it forward (W1 step 1) or
child a further node on the tail — single-flight, TOWARD THE GATHER, lock in force.

## DISCIPLINE
No shrink to "semisimple", no bridge, no assert, no weaken. Toolkit explicitly framed as a step of
the NAMED ascent (cites N236), NOT undirected breadth. Strand UNBROKEN (imports only banked N24/N207/
N209/N210 objects). Words-removable: every theorem TYPE mentions banked tower objects
(gForm/assoc3/coassoc4/derivationLieQ/octCross/assoc on O ℚ) — no free-floating carrier.
