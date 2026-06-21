# N2d — FINDINGS (frozen before production Lean)

## The decisive numerical picture (probe.py, exact rational, 400 samples/level)

Two self-overlap norms on the Cayley–Dickson double CD A, BOTH derived forward from
the banked `CD` product + `star`:
  - A-VALUED:  Nrm(z) := z.re·star(z.re) + star(z.im)·z.im   (∈ A); equivalently
               z · star z = ι(Nrm z)   [self-overlap is "real" — proved-clean identity]
  - SCALAR:    q(z) := projre(z · star z)   (the trunk's Born positivity, ∈ R)

Multiplicativity by rung (base → double):
  | rung | double = CD(base) | base assoc? | base comm? | A-valued Nrm mult | scalar q mult |
  |------|-------------------|-------------|------------|-------------------|---------------|
  | C    | CD(ℝ)             | yes         | yes        | YES               | YES           |
  | H    | CD(ℂ)             | yes         | yes        | YES               | YES           |
  | O    | CD(ℍ)             | yes (ℍ)     | NO (ℍ)     | YES               | YES           |
  | S    | CD(𝕆)             | NO  (𝕆)     | NO         | **NO**            | **NO**        |

★ THE LINK IS ASSOCIATIVITY, NOT COMMUTATIVITY. Both norms are multiplicative on
CD A through O (whose base ℍ is associative-but-noncommutative) and DIE at S (whose
base 𝕆 is the first NON-associative base). So the forced statement is:

   composition law holds on CD A   ⟺   A is associative.

  - EASY (forward): A associative (with central self-overlaps, true in the cascade)
    ⟹ Nrm multiplicative on CD A. Symbolically defect = 0 for COMMUTATIVE associative
    base (verify_easy.py). For the noncommutative-but-associative base ℍ the A-valued
    Nrm is still multiplicative on CD(ℍ)=O (probe.py level 3 = 0 fails) — ℍ's self-
    overlaps are central, which holds all the way up (identity.py: born_central holds
    on C/H/O/S).
  - HARD (contrapositive): A non-associative ⟹ Nrm NOT multiplicative on CD A. The
    SAME non-associativity proved at rung 𝕆 (`not_associative`) is EXACTLY what kills
    the composition law at S = CD(𝕆). One cause, both terminations.

## Trap avoided (THE ONE LAW, W5)
The A-valued defect over a BARE noncommutative *-ring is nonzero (12 terms,
verify_easy.py H) — it would look like multiplicativity needs COMMUTATIVITY. That is
the DRIFT: a bare *-ring is more general than the cascade. The cascade's self-overlap
is CENTRAL (Born = self-overlap positivity, the trunk) — returning to the trunk
(centrality of x·x*) is exactly what makes associativity, not commutativity, the true
governing property. The scalar norm q makes this cleanest: q is the literal Born
positivity (sum of squares) and q-multiplicativity ⟺ base associativity.

## N2c consistency (scalar_witness.py)
- O has 168/343 non-associating imaginary-unit triples.
- The N2c witnesses zdX=(e1,e2)_O, zdY=(e5,e6)_O in S=CD(O): q(zdX)=q(zdY)=2,
  zdX·zdY=0, q(zdX·zdY)=0 ≠ 4 — reproduced exactly. The generic q specializes to
  N2c's concrete `N`.
- Exactly 168/2401 index-quadruples (e_a,e_b),(e_c,e_d) have nonzero scalar defect —
  same count as non-associating triples: the defect tracks base non-association.

## GO / NO-GO (frozen)
GO iff:
  G1. selfMul identity z·star z = ι(Nrm z) holds generically (symbolic ✓, to prove in Lean).
  G2. EASY direction: CommRing+StarRing base ⟹ Nrm multiplicative on CD A (defect=0 ✓).
  G3. SCALAR q on CD A multiplicative ⟺ base associative, reproduced on C/H/O (✓) and
      failing at S (✓), with an explicit associator-witness for the hard direction.
  G4. Specialization: generic norm ↦ N2c concrete N on S ℚ.

## KILL (a fight = INSTRUMENT failure, return to trunk; never patch)
  K1. If the easy direction needs MORE than associativity+centrality, the norm form is
      mis-derived — re-read off banked z·star z; do NOT add a hypothesis.
  K2. If the hard direction won't close generically in this run, DECOMPOSE (W3): bank
      Nrm + selfMul identity + easy direction + specialization + the forced-link witness;
      child the full generic hard direction as the immediate next node, block on it.
      NEVER weaken to a one-directional or vacuous claim, NEVER bridge.
