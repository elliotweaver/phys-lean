# N128 PREREG — DISCHARGING `haniso_exists` (the totally-isotropic existence question)

FROZEN before compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## THE MEASURE-FIRST FINDING (by hand, against the banked machinery)

Priority (i) — THE TOTALLY-ISOTROPIC EXISTENCE QUESTION. The negation of `haniso_exists`
is a `BvC`-isometry `T ≠ id` with EVERY moved `v` having `BvC (T v − v)(T v − v) = 0`.
Write `N := T − id`. The bad hypothesis says `BvC (N p)(N p) = 0` for all `p`; polarization
(`BvC` already bilinear) gives `BvC (N p)(N q) = 0` for all `p,q` — i.e. the image of `N` is
**totally isotropic**.

THE TRUNK DISSOLUTION (Born = self-overlap = positivity): `BvC(p,q) = t·t' − x·x' − gFormC(v,v')`,
signature (1,9); the SPATIAL part `x·x' + gFormC(v,v')` is POSITIVE-DEFINITE (`gFormC_nonneg`,
`mul_self_nonneg`, `gFormC_eq_zero_iff`). Hence: a vector `w` with `BvC(w,w)=0` and `w.1 = 0`
(zero time component) must be `0` (`x²+gFormC(v,v)=0`, both ≥0 ⇒ both 0). So the time-coordinate
functional `τ : w ↦ w.1` is INJECTIVE on any totally-isotropic subspace. The light cone of (1,9)
carries no two linearly-independent mutually-`BvC`-orthogonal null directions — Witt index 1 —
WITHOUT any finrank computation.

THE RANK-1 EXTRACTION (avoids finrank). Pick `w := N p₀ ≠ 0` (exists if `N ≠ 0`); then `w.1 ≠ 0`
(else `w = 0` by the positivity core). For any `q`, the vector
`u_q := w.1 • N q − (N q).1 • w = N(w.1 • q − (N q).1 • p₀)` lies in `im N`, is isotropic, and has
`u_q.1 = 0`, hence `u_q = 0`. So `w.1 • N q = (N q).1 • w` for all `q` — `im N` is rank-1, spanned
by `w`.

THE SKEW FINISH. The isometry equation `BvC(Tp,Tq)=BvC(p,q)` with `Tp = Np+p` and isotropy gives
`BvC(N p) q + BvC p (N q) = 0` (`N` is `BvC`-skew-adjoint). Multiply by `w.1` and substitute the
rank-1 relation: `(N q).1 · BvC w q = 0` for all `q` (the diagonal `q=r`). With `(N p₀).1 = w.1 ≠ 0`
and `w ≠ 0 ⇒ ∃ r₀, BvC w r₀ ≠ 0` (`BvC` non-degenerate, from `gFormC` non-degenerate), evaluate at
`p₀`, `r₀`, `p₀ + r₀`: contradiction. Hence `N = 0`, i.e. `T = id`.

CONCLUSION (proved): `isom_bad_eq_id` — a `BvC`-isometry with all moved differences isotropic IS
the identity. Contrapositive ⇒ `haniso_exists`. Then `reflection_exhaustion_M_aniso` (N127) fires
UNCONDITIONALLY: every `BvC`-isometry `S ∈ Submonoid.closure houseHolderMSet`. THE FULL INDEFINITE
CARTAN–DIEUDONNÉ / `SO⁺(1,9)` EXHAUSTION, CLOSED — the cleanest priority-(i) outcome.

## GO / NO-GO

GO if: the positivity core + polarization + rank-1 extraction + skew finish all compile clean
(foundations-only), yielding `isom_bad_eq_id`, `haniso_exists_thm`, and the unconditional
`lorentz_exhaustion_M` (every `BvC`-isometry ∈ `Submonoid.closure houseHolderMSet`).

NO-GO / DECOMPOSE if: any single obligation exceeds the KILL budget, OR the positivity core does
NOT close (a sign error makes the totally-isotropic case non-vacuous) — then it is priority (ii)
the dimension-restriction recursion; bank the structural reduction (isotropic image + skew +
positivity-kills-time) and child the finish.

## KILL BUDGET (W9)

- Per-obligation compile KILL: 90 s. Any single lemma exceeding it ⇒ INSTRUMENT failure ⇒
  measure/decompose, NOT a longer grind. No `maxHeartbeats` inflation, no `native_decide`, no brute
  `decide`/monolithic `ring` over expanded coordinates.
- The whole development is pure bilinear algebra + order positivity over already-banked lemmas;
  expected LIGHT (each lemma a handful of rewrites + `linarith`/`nlinarith`). If it is NOT light,
  that is the signal to stop and reframe.
- Checkpoint at ~50% iterations; finalize (commit + gate-bg + child + complete) with budget to spare.

## W8 COSTUME (next id C160)

Must bite a WRONG totally-isotropic / Witt-index / SO⁺(1,9)-exhaustion / rank-1 claim, reducing to
a false numeric DISTINCT from C159 `1=127` (and all prior). Candidate: the unconditional exhaustion
realized on `mTimeUnit` reads its Minkowski self-overlap `1`, costume asserts `1 = 128`.

## PHYSICS-WORDS-REMOVABLE

Delete Lorentz/Minkowski/timelike/spacelike/null/isotropic/anisotropic/Witt/signature/reflection/
Householder/isometry/exhaustion/Cartan/Dieudonné/SO⁺(1,9): what remains is pure linear algebra over
the derived complete ordered field `Cut` — for `BvC` on `STVC = Cut × Cut × O Cut`, a `Cut`-linear
`BvC`-preserving `S` with `BvC (S p − p)(S p − p) = 0` for all `p` equals `LinearMap.id`; hence every
`BvC`-preserving `S` lies in `Submonoid.closure houseHolderMSet`. No theorem STATEMENT needs a
physics word.
