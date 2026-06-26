# N79 PREREG — THE DEFLATION RE-SEEDING INDUCTION LEVER (frozen before compute)

## MEASURE-FIRST verdict (W1/W9)
- **(0) the real-closed FACTORIZATION** of `g.charpoly` into linear × neg-disc-quadratic factors
  is GENUINE Artin–Schreier content Mathlib LACKS. `Mathlib/FieldTheory/IsRealClosed/Basic.lean`
  is a 127-line STUB: the `IsRealClosed` class + `of_linearOrderedField` + square-root helpers ONLY.
  NO `R[i]` algebraically-closed (Artin–Schreier), NO degree-≤2 irreducible-factor theorem, NO
  polynomial factorization. Building it is a Mathlib-PR-sized formalization (R real closed ⟹
  R[i]=R(√−1) alg. closed ⟹ every monic poly factors into linear × irreducible-quadratic). This is
  the genuine W1 dissolution blocker gating the EVEN-dim real-eigenvalue seed. → childed N80.
- **(i) the DEFLATION RE-SEEDING INDUCTION LEVER** is the immediately-bankable structural piece,
  INDEPENDENT of (0). It is exactly the ROADMAP's named deep joint: "threading the EvC-orthogonal-
  complement finrank bookkeeping." N70 `deflateC_image_orth` already gives that the deflated
  operator's whole image is EvC-orthogonal to `u` (so `uPerp u` is invariant). What is MISSING and
  this node banks: the deflated operator RESTRICTS to `uPerp u` as an EvC-self-adjoint endomorphism,
  on a space whose finrank DROPS BY EXACTLY ONE (codimension one) — the bookkeeping the re-seeding
  induction runs on — plus the re-seeding corollary (N77 `dim_odd_has_eigenvector` on the restricted
  operator at any odd rung produces an ambient eigenvector inside `uPerp u`).

## THE TARGET (the bankable lever — `Phys/Algebra/LorentzContinuumReseed.lean`)
Over the derived ℝ `Cut` + the terminal algebra `O Cut`, banked N49–N78:
1. `uPerp u := LinearMap.ker (EvCRight u)` — the EvC-orthogonal complement of `u`.
2. `evCRight_surjective` — for `EvC u u = 1`, `EvCRight u` is SURJECTIVE onto `Cut` (`c ↦ c • u`).
3. `uPerp_finrank` — ★ THE CODIM-ONE DROP: `finrank Cut (uPerp u) = finrank Cut STVC − 1` for a
   unit `u` (rank–nullity on the surjective functional `EvCRight u`, range finrank 1).
4. `deflateC_mapsTo_uPerp` — the deflated operator maps `uPerp u` into `uPerp u` (from
   `deflateC_image_orth`: its WHOLE image is in `uPerp u`).
5. `deflateRestrict g l u := (deflateC g l u).restrict deflateC_mapsTo_uPerp` — the restricted
   operator on the codim-1 invariant subspace.
6. `deflateRestrict_apply` — `↑(deflateRestrict … p) = deflateC g l u ↑p` (the restriction coercion).
7. `deflateRestrict_isEvCSymm` — ★ the restricted operator is EvC-self-adjoint:
   `EvC (↑(deflateRestrict … p)) ↑q = EvC ↑p (↑(deflateRestrict … q))` (from `deflateC_isEvCSymm`).
8. `uPerp_finite` — `Module.Finite Cut (uPerp u)` (submodule of the finite `STVC`, N76).
9. `deflateRestrict_odd_reseed` — ★★ THE RE-SEEDING COROLLARY: if `finrank Cut (uPerp u)` is ODD,
   the restricted operator has a nonzero `v ∈ uPerp u` and `lam` with
   `deflateC g l u ↑v = lam • ↑v` — re-seeding via N77 `dim_odd_has_eigenvector`. The eigenvector
   lives in the EvC-orthogonal complement: the descent stays inside the strictly-smaller space.
10. NON-VACUITY (W8): `uPerp_ne_top` — `uPerp u ≠ ⊤` for a unit `u` (`u ∉ uPerp u`, since
    `EvC u u = 1 ≠ 0`) — the complement is a PROPER subspace, the finrank genuinely drops.

## GO / NO-GO
- GO if items 1–10 compile foundations-only `[propext, Classical.choice, Quot.sound]`, no sorry,
  no Mathlib ℝ/ℂ content import, words-removable, costume C110 bites a WRONG finrank-drop /
  re-seeding / invariance claim with a false numeric DISTINCT from C84..C109.
- NO-GO / DECOMPOSE if the codim-1 finrank or the restriction self-adjointness resists: bank the
  sub-piece that compiles (at least `uPerp`, `evCRight_surjective`, `deflateC_mapsTo_uPerp`,
  `deflateRestrict`, `deflateRestrict_isEvCSymm`) + child the remainder.

## KILL (instrument-failure budget, W9)
- Any single obligation that does not compile in < 90s in a bounded `lake env lean` probe is an
  INSTRUMENT failure (not a theory failure): MEASURE the smallest sub-obligation, DECOMPOSE into
  separately-banked lemmas, PREFER structural reduction (rank–nullity lemma, restrict coercion)
  over coordinate expansion. NEVER inflate maxHeartbeats. NEVER re-run a route shown to blow up.
- Checkpoint EARLY (~50% turns): the instant production + wiring compile clean, COMMIT, run the
  gate in BACKGROUND, child N80, complete with turns to spare.

## THE CHILD (N80, honest W1 dissolution ticket)
The real-closed Artin–Schreier FACTORIZATION (the Mathlib-lacking content) → the full even-dim
real-eigenvalue seed → the full existence `∀ g, ∃ c u, g = specOpN c u` (assembling this re-seeding
lever + the seed + the N74 iterated descent) → the GLOBAL polar/KAK assembly → connectedness →
the GLOBAL reverse KAK surjectivity → the full `Spin(9)→SO(9)` exhaustion.
