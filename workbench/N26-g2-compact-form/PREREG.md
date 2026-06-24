# N26 — PREREG (frozen before production Lean)

Node: N26 — the next compact-form / type-G₂ invariant(s) of `derivationLieQ`, FORWARD
from banked semisimplicity (N25) + neg-definite trace form (N24) + perfectness (N23)
+ faithful 7-rep (N22). NO posited G₂.

## BOUNDED MEASUREMENTS DONE (workbench/N26-g2-compact-form/probe/P1.lean, route_probe.py)
All probes ≤ 8s. Default maxHeartbeats, never inflated.
1. `LieRingModule`/`LieModule ℚ derivationLieQ (O ℚ)` — SYNTHESIZE FREE.
2. `ImLie : LieSubmodule ℚ derivationLieQ (O ℚ)` (carrier = banked `ImO`) — CONSTRUCTS CLEAN
   via banked `derivLieQ_mapsTo`. `LieRingModule`/`LieModule`/`IsIrreducible` Prop on `↥ImLie`
   SYNTHESIZE FREE. ⟹ the ticket's guessed W3-decompose point (instance plumbing on the
   abstract 7-space) DISSOLVES — it is free. The real work is the MATHEMATICS.
3. Simplicity skeleton: `IsSimpleOrder (LieIdeal ℚ derivationLieQ) → IsSimple ℚ derivationLieQ`
   = ONE banked lemma `isSimple_iff_of_not_isLieAbelian` + banked `derivationLieQ_not_lieAbelian`.
   The `IsSimpleOrder(LieIdeal)` core is the hard lattice fact (NOT near-free) → childed.
4. route_probe.py (W6, re-verified the 14 banked derivation matrices restricted to ImO):
   - every ρ(D_k) is SKEW (Dᵀ = −D) on ImO ✓ (matches banked `gFormQ_skew`).
   - joint kernel of the 7-action = 0 (rank 7) ✓.
   - so(d)+so(7−d) dim count: d=0,1,6,7 give ≥14 (not excluded by count); d=2,3,4,5 give
     11,9,9,11 < 14 (excluded by count). d=1,6 excluded SEPARATELY by perfectness (below).

## THE GO (which invariants THIS node, decided by the measurements above — not a guess)

THIS NODE banks the cleanly-tractable, fully-closed, NEW compact-form / type-G₂ invariants,
in strict W9.8 bank-as-you-go order (commit each the instant it elaborates clean):

  T1 (measured free): `ImLie` the invariant 7-dim Lie submodule (the rep as a genuine
      `LieSubmodule`, the object N25's child needs), `ImLie` Nontrivial, `finrank ℚ ImLie = 7`
      (transport banked `finrank_ImO`); + the SIMPLICITY SKELETON
      `IsSimpleOrder (LieIdeal ℚ derivationLieQ) → IsSimple ℚ derivationLieQ`.
  T2 (the rep-level COMPACT SIGNATURE): the faithful 7-rep is ORTHOGONAL — every `imRep D`
      is SKEW-ADJOINT for the positive-definite Born form on ImO (directly from banked
      `gFormQ_skew`). The 14-dim algebra embeds (faithfully, banked) into the skew-adjoint
      operators of a positive-definite form = the compact embedding g₂ ↪ so(7). Recognizable,
      clean, directly banked.
  T3 (if clean, COMPLETE REDUCIBILITY / Weyl, theory-native via Born positivity): every
      L-invariant submodule N ⊆ ImO has an L-invariant complement (its Born-orthogonal
      complement) — measure the BilinForm-on-ImO obligation FIRST (T3 is gated on the
      measurement; if heavy → child).
  T4 (if T3 lands, the d∈{1,6} EXCLUSION — "one cause many terminations"): perfectness
      (banked N23) ⟹ a 1-dim invariant subspace is trivial ⟹ in joint kernel; joint kernel
      = 0 ⟹ no 1-dim invariant subspace; complete reducibility ⟹ no 6-dim either.

CHILD N27 (never asserted here, never a bridge): the d∈{2,3,4,5} dimension-count exclusion
  (needs dim so(d)+so(7−d) ≤ 11 < 14, an so(n) finrank fact Mathlib may lack → BUILD it, W1)
  ⟹ full `LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie`, and the `IsSimpleOrder (LieIdeal)`
  core ⟹ `IsSimple`. Then the automorphism Lie GROUP.

## NO-GO (do NOT do)
- NO posited G₂ / `LieAlgebra.g₂` imported to assert anything (D3 bridge).
- NO `IsSimpleOrder`/`IsIrreducible` asserted without proof.
- NO weakening of any target to make it close (W5 / THE ONE LAW).
- NO `LieEquiv` to the split `LieAlgebra.g₂ ℚ` (FALSE — compact ≇ split, locked N22).

## KILL BUDGET (compile-cost, W9)
- 90s / single obligation. Any obligation crossing 90s → STOP, measure smallest sub-piece,
  decompose or child. NEVER inflate maxHeartbeats.
- If the BilinForm-on-ImO / orthogonal-complement obligation (T3) crosses 90s in the scratch
  measurement → child T3+T4, bank T1+T2 only.

## TURN-BUDGET CHECKPOINT
- At ~55% of turns: FINALIZE whatever is banked (commit + child + complete). Do NOT chase the
  next tier past the checkpoint. The recurring lifecycle failure (N17/N22/N23/N24) is timing
  out on ITERATION budget before banking — checkpoint EARLY, finalize with turns to spare.

## W8 ANTI-VACUITY (the new costume C46 MUST bite)
- A WRONG invariant must FAIL to compile: e.g. the faithful nonzero witness `imRep witnessLieQ`
  asserted to be SELF-ADJOINT (symmetric, NOT skew) for the Born form → collides with banked
  skew-adjointness + nonzero, leaving a false core. (Or: ImLie asserted `= ⊥` / trivial,
  colliding with the banked nonzero generator u1 ∈ ImO.)

## PHYSICS-WORDS-REMOVABLE
Delete "g₂ / gauge / compact / exceptional / fundamental representation": what remains is the
pure statement that the 14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson double
of a double of a double of ℚ acts by skew-adjoint operators (for the anisotropic self-overlap
form) on its invariant 7-dim subspace, completely reducibly, with no 1- or 6-dim invariant
subspace; and that this algebra is simple iff its ideal lattice is simple. No physics word is
load-bearing in any theorem STATEMENT.
