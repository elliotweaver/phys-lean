# N199 PREREG — THE LIGHT CONE / NULL STRUCTURE + THE WITT INDEX of the (1,9) determinant form

Frozen BEFORE compute. GO/NO-GO + KILL classify a fight as INSTRUMENT failure, never theory failure.

## THE MEASURE-FIRST VERDICT (the fronts, W9 + W4.5 look WIDEST)

What is BANKED on the (1,9) Born determinant form `Qv` on `STV = ℚ × ℚ × O ℚ`:
- N43 `signature_one_nine`: ONE split `timeSub ⊕ spaceSub`, form positive-definite on dim-1 `timeSub`,
  negative-definite on dim-9 `spaceSub`.
- N198 `signature_inertia_one_nine`: the INERTIA INDICES — every positive-definite (timelike) subspace
  has `finrank ≤ 1`, every negative-definite (spacelike) one has `finrank ≤ 9`, both achieved.

Both N43 and N198 touch ONLY definite subspaces. NEITHER ever exhibited a NULL vector, addressed the
form's ISOTROPY, or measured the totally-isotropic dimension. THE LIGHT CONE is an unbanked, genuinely
DIFFERENT face of the same termination.

- Front (i) THE FORCED GENERIC CASCADE-STOP LINK (Sedenion.lean L55-61) — MEASURED HARD at N197/N198,
  needs the classical composition⟹alternative polarization. A dedicated W1 dissolution node, NOT a light
  increment. DEFERRED.
- Front (ii) HYPERCHARGE NORMALIZATION — no file exists; risks a posited normalization. DEFERRED.
- Front (iii) THE LIGHT CONE / NULL STRUCTURE + WITT INDEX of the (1,9) — CHOSEN. Genuinely NEW (isotropy,
  null vectors, Witt index — none banked), genuinely DIFFERENT invariant (Witt index of totally-isotropic
  subspaces ≠ inertia indices of definite ones N198), genuinely DIFFERENT geometric object (the light cone
  vs the two definite cones). The causal structure of the derived Lorentzian form.

## W8 ANTI-VACUITY / NOT-A-RE-PIN (the explicit guard)

The inertia-index bound (N198) measures how big a DEFINITE subspace can be. The Witt index measures how
big a TOTALLY-NULL subspace can be — a DIFFERENT invariant. The genuinely-new content N198 cannot supply:
1. ISOTROPY / the light cone is NON-EMPTY: ∃ nonzero `v`, `Qv v = 0`. N43/N198 have NO null vectors at all
   (a definite form is anisotropic; an indefinite one is isotropic — this is the new property).
2. A concrete totally-null line achieving the Witt index (the existence half).
3. The Witt index = EXACTLY 1.
The `wittIndex_le_one` bound reuses the N198 transversality PATTERN (a totally-null subspace meets the
negative-definite `spaceSub` only at 0, since `Qv w = 0` and `Qv w < 0` clash) — that pattern-reuse is
FINE; what makes the node non-re-pin is that the HEADLINE theorem (light cone exists / form isotropic /
Witt index = 1) is a genuinely different invariant + object, ABSENT from N43/N198. Teeth: a concrete null
vector with `Qv` EXACTLY 0, and a 2-plane spanned by two null vectors that is NOT totally null (it contains
`(2,0,0)`, `Qv = 4 ≠ 0`) — the `≤ 1` bound is not about an empty set of 2-planes.

## THE OBJECTS (all over the DERIVED ℚ + terminal O ℚ = CD (H ℚ); ℚ is the coefficient system, the OBJECT
   is the derived algebra — N6/N16/N22/N42/N43/N198 precedent; NO Mathlib ℝ/ℂ as content)

- `lightVec := ((1:ℚ),(1:ℚ),(0:O ℚ))`, `lightVecMinus := ((1:ℚ),(-1:ℚ),(0:O ℚ))`.
- `IsTotallyNull W := ∀ w ∈ W, Qv w = 0`.
- `nullLine := Submodule.span ℚ {lightVec}`.

## THE DERIVATION (each a theorem, foundations-only, forward from N43/N198 objects)

- `lightVec_null` : `Qv lightVec = 0`  (`Qform 1 1 0 = 1 - 1 - gForm 0 0 = 0`).
- `lightVecMinus_null` : `Qv lightVecMinus = 0`.
- `lightVec_ne_zero` : `lightVec ≠ 0`.
- ★ `form_isotropic` : `∃ v : STV, v ≠ 0 ∧ Qv v = 0`  (THE LIGHT CONE EXISTS / the form is ISOTROPIC).
- `lightVec_not_mem_timeSub` / `lightVec_not_mem_spaceSub` : a null vector is neither timelike nor
  spacelike (the light cone is a genuinely new region, disjoint from both definite cones off 0).
- `nullLine_totallyNull` : every `c • lightVec` has `Qv = 0` (`Qv (c•lightVec) = c² · 0 = 0`).
- `finrank_nullLine` : `Module.finrank ℚ nullLine = 1`.
- ★★ `wittIndex_le_one` : `∀ W, IsTotallyNull W → finrank ≤ 1` (transversality to `spaceSub` + the N198
  dimension-formula pattern: `W ⊓ spaceSub = ⊥`, `finrank W + 9 ≤ 10`).
- ★ `witt_index_eq_one` : `nullLine` totally null ∧ `finrank = 1` ∧ the `≤ 1` bound — the Witt index is
  EXACTLY 1.
- W8 ★ `twoNull_span_not_totallyNull` : `span {lightVec, lightVecMinus}` is NOT totally null (contains
  `lightVec + lightVecMinus = (2,0,0)`, `Qv = 4 ≠ 0`).

## GO / NO-GO

- GO: all decls compile foundations-only `[propext, Classical.choice, Quot.sound]`; costume C231 bites;
  no name collisions (all 15 candidate names verified FREE across Phys/ Counterexamples/ Audits/ Phys.lean);
  the headline is genuinely-new (isotropy + Witt index, absent from N43/N198), NON-VACUOUS (teeth above).
- NO-GO / re-measure: if the Witt bound turns out to need the FULL Witt decomposition machinery (hyperbolic
  plane ⊕ anisotropic) and that is heavy → decompose, bank the isotropy + null-line + Witt-≤-1 now, child
  the decomposition. If isotropy itself somehow needs ℝ (it does NOT — `(1,1,0)` is a rational null vector)
  → THE ONE LAW, return to the trunk.

## KILL (instrument-failure thresholds — per obligation)

- KILL = 90s / 400000 heartbeats per obligation. If any single obligation exceeds this, it is an INSTRUMENT
  failure (W9): MEASURE the smallest sub-obligation, decompose, never inflate the ceiling. Expected LIGHT:
  every obligation is a finite `Qform`/`gForm` coordinate fact or the banked N198 dimension-formula pattern.
- O ℚ has NO Ring/Sub instance for the octonion slot — but `STV`'s ℚ and ℚ slots do; the octonion slot is
  `0` throughout `lightVec`, so all arithmetic is over ℚ. Use ADDITIVE forms where O ℚ appears.

## COSTUME C231 — `199 = 0`

Genuine: `Qv lightVec = 0` (the light cone vector is null, `lightVec_null`). Bogus: `(199 : ℚ) = Qv lightVec`
reduces to `199 = 0` — a stand-in for ANY wrong reading (the cone is empty / the form is anisotropic / no
null vector exists / the (1,9) form does not represent zero). DISTINCT from the battery (… C229 197=-2,
C230 198=1): pair `(199, 0)` fresh, LHS 199 and RHS 0 both distinct from every prior pair.
