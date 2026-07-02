# N239 PREREG — the g₂ FFT count via the FINITE RATIONAL CERTIFICATE (dissolution)
Frozen: 2026-07-01, before compute. Operator: manager (human-authorized takeover).

## REFRAME (W5 — the route, decided before any Lean)
The FFT GENERATION lemma as posed (invariant-theory generation by δ,φ,ψ) fights the
anisotropic ℚ-form of g₂ (no rational weight vectors; Mathlib has zero invariant theory).
DISSOLUTION: reverse the dependency. Prove the summand irreducibilities/End=ℚ DIRECTLY by
finite rational certificates (Born positivity = the weapon: invariant ⟹ orthogonal
complement ⟹ commutant projector; commutant pinned to ℚ by explicit matrix certificates).
Then commutantG2 ≤ commutantSpan closes by the banked Peirce corners, and the banked
N237 reduction fires: finrank commutantG2 = 4. The FFT count is the OUTPUT, not the input.

## TARGETS (production, foundations-only)
1. cert27: every T ∈ End ℚ ↥tracelessSym commuting with the restricted adEnd DA, adEnd DB
   (two explicit banked-combo derivations) is a ℚ-scalar. (⟹ End_{g₂}(27) = ℚ.)
2. no_proper_invariant_tracelessSym (the N234 target): via trace-form positivity on the
   symmetric side + invariant orthogonal complement + the commutant projector + cert27.
3. cert7 / cert14: End = ℚ for the 7 (ImO) and the 14 (derivationLieQ adjoint) by the same
   certificate machinery (7×7 and 14×14).
4. commutantG2 ≤ commutantSpan (Peirce corners: off-diag Hom=0 from the four
   no-proper-invariants + distinct dims; diagonal = ℚ from cert7/cert14/cert27/dim-1).
5. finrank ℚ commutantG2 = 4 (banked finrank_commutantG2_eq_four_of_le_span) — N239's
   decided target (the ticket's own operative form of dim (ImO⊗⁴)^{g₂} = 4).

## GO / NO-GO GATES (numerics, exact ℚ, repo CD convention — NOT my earlier scratch convention)
- G1: transcribed D0E..D13E all satisfy Leibniz for the REPO product (fidelity check of
  convention). KILL if any fails ⟹ my transcription/convention is wrong (instrument).
- G2: a sparse integer combo pair (DA, DB) exists such that, simultaneously:
  (a) on the 27: orbit of a chosen w₀ spans (27 reachable), annihilator certificate rank 26;
  (b) on the 7: ker(ADmat) is 1-dim with integer generator; orbit spans 7;
  (c) on the 14: pin-system rank 13 with integer certificate; orbit spans 14.
  KILL: no such pair among the search space ⟹ enlarge combos (instrument, not theory).
- G3 (Lean instrument probe): `decide` (kernel) handles a 27×27 integer-ℚ matrix product
  equality in reasonable time. KILL ⟹ fall back to mulᵣ/norm_num/per-entry splits; if all
  fail, the certificate transport needs a different encoding (instrument failure only).

## KILL CLASSIFICATION
Any failure above is an INSTRUMENT failure (encoding, convention, kernel performance),
never a theory failure: the ground truth dim End_{g₂}(27) = 1 was verified exactly over ℚ
(manager recon, full 14-generator commutant, exact Fractions).

## NON-VACUITY / W8 TEETH (planned)
- garbage witness: a NON-symmetric or trace-nonzero matrix must FAIL tracelessSym membership;
  a fifth would-be projector combo must fail the certificate (the count is exactly 4, ≥ AND ≤).
- costume C270: wrong-value costume `finrank ℚ commutantG2 = 270` (or similar) must be
  kernel-rejected.

## DISCIPLINE
No new axioms; no maxHeartbeats proof-search raise beyond the inherited synthInstance
ceiling; decide allowed (kernel-checked, native_decide BANNED); words-removable statements
(types mention only banked tower objects); strand UNBROKEN (imports N238 tip).
