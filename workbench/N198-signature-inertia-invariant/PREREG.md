# N198 — PREREG (frozen before compute)

## Node
THE SYLVESTER INERTIA INVARIANCE OF THE (1,9) DETERMINANT FORM — the positive
(timelike) index is EXACTLY 1 (a UNIQUE time dimension is forced, not chosen) and
the negative (spacelike) index is EXACTLY 9. N43 (`SpacetimeSignature.lean`) only
EXHIBITS one (1,9) decomposition (`signature_one_nine`); it never proves the inertia
is INVARIANT — that no 2-dim subspace can be timelike and no 10-dim subspace can be
spacelike. This node banks that invariance: the (1,9) is THE signature, with a
single forced time.

## MEASURE-FIRST (W9) — verdict on the three fronts, frozen
- Front (i) THE LORENTZIAN-SIGNATURE JOINT (N43/N44/N5). The body's preferred shape
  is "an Iff putting (1,9) into the non-assoc 'one cause' web". MEASURED: a TRUE Iff
  "(1,9) signature ↔ O non-associative" would be FALSE — the 2×2 Hermitian
  determinant gives a Lorentzian signature (1, dim A + 1) over ℂ (→(1,3)), H (→(1,5)),
  O (→(1,9)) ALIKE; the signature is NOT caused by non-associativity (a 2×2 fact;
  non-assoc bites at order ≥ 4, N5). Forcing that Iff is the W8 vacuity/falsity trap
  (THE ONE LAW). REJECTED in that form. BUT a genuinely-new, forced, LIGHT,
  non-vacuous result ON the signature termination IS available and unbanked: the
  INERTIA INVARIANCE (positive index = 1, negative index = 9). N43 only exhibits a
  split. CHOSEN.
- Front (ii) THE FORCED GENERIC CASCADE-STOP LINK (Sedenion.lean L55–61). MEASURED
  HARD at N197 (classical composition⟹alternative polarization). DEFERRED (a future
  W1 dissolution node).
- Front (iii) THE COLOUR⊗ISOSPIN COMMUTANT / hypercharge. The centralizer-is-a-
  subalgebra is a near-automatic Lie fact (risks mechanical-consequence-of-N197, W8);
  no hypercharge file exists (from-scratch, charge-normalization subtle). DEFERRED.

## What this banks (production `Phys/Algebra/SpacetimeSignatureInertia.lean`)
- `IsTimelikeSub W` := ∀ w ∈ W, w ≠ 0 → 0 < Qv w   (positive-definite subspace)
- `IsSpacelikeSub W` := ∀ w ∈ W, w ≠ 0 → Qv w < 0  (negative-definite subspace)
- `timeSub_timelike` / `spaceSub_spacelike` — the banked blocks are definite (achievement)
- `timelike_inf_spaceSub_eq_bot` / `spacelike_inf_timeSub_eq_bot` — disjointness
  (a timelike vector cannot be spacelike: 0<Qv and Qv≤0 contradict)
- ★★ `timelike_index_le_one` — EVERY timelike subspace has finrank ≤ 1 (via
  `finrank_sup_add_finrank_inf_eq` + `finrank_spaceSub`=9 + `finrank_STV`=10:
  finrank W + 9 = finrank(W⊔spaceSub) ≤ 10). THE UNIQUE TIME.
- ★★ `spacelike_index_le_nine` — EVERY spacelike subspace has finrank ≤ 9 (dual, via
  `finrank_timeSub`=1).
- ★ `timelike_index_eq_one` / `spacelike_index_eq_nine` — bound + achievement: indices
  are EXACTLY 1 and 9.
- ★★★ `signature_inertia_one_nine` — THE HEADLINE: (1,9) is the inertia invariant.
- W8 `timePlusSpace_not_timelike` — the concrete 2-dim subspace ⟨(1,0,0),(0,1,0)⟩ is
  NOT timelike (it contains the genuinely spacelike (0,1,0), Qv=-1<0): the bound has teeth.

## GO / NO-GO
GO if all obligations compile foundations-only [propext, Classical.choice, Quot.sound]
in a `lake env lean` probe, no sorry/axiom/native bypass, costume C230 bites.
NO-GO / reframe if any obligation fights (THE ONE LAW: instrument wrong, return to trunk).

## KILL (instrument-failure threshold, per obligation)
90s wall / 400000 heartbeats per obligation. These are standard finrank linear-algebra
goals over ℚ (rank-nullity / submodule lattice) — each expected < 15s. If any exceeds
the KILL, it is an INSTRUMENT failure (W9): MEASURE the smallest sub-obligation,
DECOMPOSE, prefer a structural reduction; never inflate the ceiling and grind.

## Costume (C230) — W8 anti-vacuity
Genuine: `Module.finrank ℚ timeSub = 1` (the positive index, maximal). Bogus claim:
it is 198 (time is not unique / a higher-dim timelike subspace exists / the index is
larger) → reduces to the false numeric `198 = 1`. DISTINCT pair from the battery
(… C228 196=1, C229 197=-2): (198, 1), LHS 198 fresh.

## Physics-words-removable
Delete "time/space/Lorentzian/signature/Minkowski/timelike/spacelike/inertia": over the
derived field ℚ and the terminal algebra O ℚ = CD(H ℚ), for the quadratic form Qv on the
10-dim ℚ-space STV = ℚ×ℚ×O ℚ, every subspace on which Qv is positive-definite has finrank
≤ 1 and every subspace on which Qv is negative-definite has finrank ≤ 9, both achieved —
pure inertia/linear-algebra over the derived field. No theorem statement needs a physics word.
