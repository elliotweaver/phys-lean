# PREREG — N234 (retargeted): THE IRREDUCIBLE 27 via the trunk's own instrument
**Frozen before production compute. Manager-operated takeover (owner-authorized, board stopped).**
Date: 2026-07-01. Operator: phys-novelty-mgr (witness protocol suspended by owner for this node;
full takeover authorized: "fully take over with this directive and get it done").

## THE RETARGET (what N234 really wants — its arc independent of the N235–N239 framing)

N234's desire is ATOMICITY of the gather's standpoint-comparison arena: the banked four-way tear
`7⊗7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` (N233, DirectSum.IsInternal) is into ATOMS — no invariant seam hides
inside the 27 (`tracelessSym`), the space of traceless Born quadrics. The N235→N239 dissolution
arc borrowed the FIELD's instrument (the g₂ First Fundamental Theorem, a 2401-dim invariant-theory
statement) and spiraled: each dissolution landed on a HARDER classical theorem. Diagnosis: W5 —
the instrument was fighting, not the theory. The trunk's OWN instrument — the one that already
closed the 7 (N28 `no_proper_invariant_ImO`) and the 14 (`ImLie_isIrreducible`): Born anisotropy
over ℚ + the CONCRETE banked derivations acting — extends to the 27 directly. The FFT count
(dim commutantG2 = 4, `commutantG2 ≤ commutantSpan`) then falls out as a SCHUR COROLLARY of four
atoms of distinct dimensions + the banked N237 Peirce reduction. The arrow reversed: the spiral
tried to buy atomicity with the count; the theory buys the count with atomicity.

## THE ROUTE (recon-verified exact-ℚ, ~/phys-recon-n234, 2.6s; certificate in cert_repo.pkl)

Carrier: `tracelessSym ⊆ End ℚ ImO` (banked N228), g₂-action `adEnd D : X ↦ ⁅imRep D, X⁆`
(banked N228), generators = the 14 banked explicit derivations D0E–D13E (N16,
DerivationLowerBound.lean) lifted to `derivationLieQ` via banked `DkE_isDerivQ`.

1. **Cartan pin (rank-1 element of the generated algebra).** D0E, D3E commute (recon: the banked
   nullbasis contains 7 commuting pairs; (0,3) chosen). On the 27, S := −(adD0)² − (adD3)² has
   exact spectrum {0³, 1⁸, 2⁶, 4⁴, 5⁴, 8²}; K := ker S is 3-dim; Mpin := PK∘(adD1)²∘PK has
   spectrum {−4¹, 0²⁶}; P0 := (−1/4)·PK∘Mpin∘PK is IDEMPOTENT RANK-1: P0 = X0 ⊗ τ0 with
   X0 = the integer quadric diag(0,−1,1,1,−1,0,0) on ImO (coords e1..e7), τ0(X0) = 1.
2. **Walk.** Words of length ≤ 2 in {adDkE} carry X0 to a 27-element spanning family of
   tracelessSym; dual words of length ≤ 2 carry τ0 to a 27-element spanning family of the dual.
3. **Assembly (structural, no search).** W invariant, 0 ≠ w ∈ W ⟹ some dual word gives
   τ0(A_w w) ≠ 0 (else the 27 dual functionals kill w) ⟹ P0(A_w w) = τ0(A_w w)•X0 ∈ W
   (P0 ∈ generated algebra ⟹ P0(W) ⊆ W) ⟹ X0 ∈ W ⟹ walk ⟹ W = tracelessSym. IRREDUCIBLE.
4. **Corollaries.** (a) End_{g₂}(27) = ℚ·id by the same certificate (φ commutes with P0 ⟹
   φX0 = τ0(φX0)•X0; walk propagates). (b) With banked N238 three-summand irreducibilities +
   banked N237 Peirce `T = Σᵢⱼ eᵢTeⱼ` + off-diagonal Hom-vanishing (distinct dims), close
   `commutantG2 ≤ commutantSpan` ⟹ banked `finrank_commutantG2_eq_four_of_le_span` fires ⟹
   dim commutantG2 = 4 — N239's target as a COROLLARY.

## LEAN OBLIGATIONS (all in the banked DerivationLowerBound idiom: explicit coordinate
shuffles, `ext`+`simp [defs]`+`ring`, `linear_combination` with recon-computed coefficients;
NO Basis object, NO matrix decide, NO native_decide, NO new axioms)

- O1: X0 and the 27 basis quadrics B_k as explicit `Module.End ℚ (O ℚ)` coordinate shuffles
  restricted to ImO; membership in tracelessSym (self-adjoint + traceless + preserves ImO).
- O2: bracket-transport lemma (restriction commutes with bracket) — or work upstairs on
  ImO-preserving endos throughout.
- O3: the ≤2-length walk identities: each B_k = Σ c_kj·(ad-word_j X0) — 27 explicit-operator
  identities (ext+simp+ring).
- O4: the dual pairing system: τ0 explicit functional; τ0(word_j B_k) values; injectivity of
  T ↦ (τ0(A_j T))_j on tracelessSym via 27 linear_combination calls (recon-computed inverse).
- O5: the pin: P0 B_k = τ0(B_k)•X0 for the 27 basis quadrics, computed through the composed
  projector chain (PK₁ deg-2, PK₂ deg-2, pin, ≈8–18 brackets per element; most die early).
- O6: assembly theorems: `no_proper_invariant_tracelessSym`, `tracelessSym_isIrreducible`-shape
  statement matching the banked N228/N233 invariance notion (adEnd).
- O7: corollaries: `endG2_tracelessSym_eq_rat` (End = ℚ·id), `commutantG2_le_commutantSpan`,
  `finrank_commutantG2_eq_four` via banked N237/N238.
- O8: costume + manifest row + Phys.lean/AxiomAudit append + gate-fast + #print axioms.

## GO / NO-GO GATES & KILLS (instrument-failure classification, never theory-failure)

- GO1 (scratch): X0/B_k defs compile; one walk identity closes with ext+simp+ring. KILL if the
  CD instance diamonds make even single-bracket identities not close ⟹ instrument wrong ⟹ switch
  coordinate layer (work on O ℚ endos preserving ImO, restrict once at the end).
- GO2 (scratch): one full P0-chain on a K-component B_k closes within reasonable elaboration
  time (< ~60s/lemma). KILL ⟹ split chains into more, smaller lemmas (pure W3 decompose, not a
  route change).
- GO3: total build of the new leaf < gate budget. KILL ⟹ split the leaf into 2–3 chained files
  (append-only, still one node).
- No new axioms at any point; `#print axioms` ⊆ {propext, Classical.choice, Quot.sound} verified
  independently before commit.

## WHAT THIS NODE DOES NOT DO
No modification of any banked module (append-only). No Phase/ import into Phys/. No physics
words load-bearing (the statement is pure: a 27-dim space of traceless symmetric operators has
no proper nonzero invariant subspace under 14 explicit derivations). No FFT/invariant-theory
import. The OVERNIGHT LOCK's gather-side intent is served: this closes the gather arc's
Clebsch–Gordan atomicity, not a gauge/hypercharge ascent.
