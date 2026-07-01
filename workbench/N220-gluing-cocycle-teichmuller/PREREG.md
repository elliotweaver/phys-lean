# PREREG — N220: THE GLUING-OBSTRUCTION COCYCLE STRUCTURE (deeper cut of N219)

## Front selection (measure-first, W4.5, under the OVERNIGHT LOCK)

The HEAD commit is a **TEMPORARY OVERNIGHT PRIORITY LOCK** (owner-directed): the chain
STAYS on the gather; do NOT switch to hypercharge / Freudenthal / Peirce / isospin /
gauge-completion, even if lighter. The prior run 462 started `_PARKED-N220-freudenthal-sharp-map/`
(a Freudenthal/hypercharge front) — a **LOCK VIOLATION** — and was manually reclaimed by the
owner. That parked work is OFF-LIMITS. This run selects a **gather front**.

The LOCK explicitly authorizes and NAMES this front:
> "the obstruction's cocycle/irreducibility structure (is it a genuine class, not a coboundary;
>  the banked Jacobiator N205 relation; the calibration-form shape of the associator)"

and the N219 handoff childed exactly this as N220:
> "the associator cocycle's Jacobi/cocycle-identity structure — is `[a,b,·]` a genuine 2-cocycle
>  whose coboundary is the associator-of-associators / does the banked Jacobiator relate to it".

CHOSEN: **the Hochschild-cohomological structure of the N219 gluing obstruction on the banked
tower O ℚ**, connecting it to the banked Jacobiator N205. Fronts (hypercharge/Freudenthal)
FORBIDDEN by the LOCK; a genuinely-different physics joint not cleaner/more-forced than this.

## The claim (all headlines ON the banked O ℚ / banked objects — no free-floating carrier)

The N219 gluing obstruction `gluingDefect a b : x ↦ (a·b)·x − a·(b·x)`, which on `O ℚ` IS the
banked associator `[a,b,·]` (`o_gluingDefect_eq_assoc`), has this Hochschild-cohomological
structure over the derived `O ℚ = CD (H ℚ)`:

1. **`teich_cocycle_O`** — as an `A`-valued 3-cochain the associator is a genuine Hochschild
   3-**cocycle**: `δ(assoc)(a,b,c,x) = a·[b,c,x] − [ab,c,x] + [a,bc,x] − [a,b,cx] + [a,b,c]·x = 0`.
   (The Teichmüller cocycle identity; formal backbone `teich_cocycle_generic`.)
2. **`mult_coboundary_O`** — that cocycle is EXACT: it is the Hochschild coboundary of the
   derived-multiplication 2-cochain, `δμ = −2·assoc`
   (`a·(bc) − (ab)·c + a·(bc) − (ab)·c = −(assoc + assoc)`). So on `O ℚ` the gluing obstruction
   is cohomologically the coboundary of the multiplication — the precise homological status of
   the local→global obstruction.
3. **`gluingDefect_2coboundary_O`** — but as the N219 `End(A)`-valued 2-cochain `b ↦ gluingDefect a b`
   the obstruction is NOT closed: its coboundary is the LEVEL-UP associator,
   `a·(gluingDefect b c x) − gluingDefect (ab) c x + gluingDefect a (bc) x − gluingDefect a b (cx)
    = −([a,b,c]·x)` — the "defect of the defect" = the associator-of-associators.
4. **`jacobiator_eq_six_gluingDefect_O`** — the banked Jacobiator (N205) equals `6 • gluingDefect`
   on `O ℚ`: `jacobiator x y z = gluingDefect x y z + … (6 copies)`. The banked Malcev/cyclic
   face of the SAME obstruction map (`jacobiator_eq_six_assoc` N205 + `gluingDefect = assoc`).
5. **`gluing_cocycle_nonzero_O`** (W8 teeth) — the 3-cocycle is a genuinely NONZERO cochain via
   banked `assoc_nonvanishing`; so none of the above is vacuous.
6. Capstone **`gluing_cocycle_structure`** bundling (1)–(5) on `O ℚ`.

## Measured (W9), BEFORE committing
- probe1 (`teich_generic`, `teich_O`, `jac_eq_six_gluingDefect`): compiled; probe2 failed ONLY
  on a mis-used `ring` (non-comm/non-assoc) → fixed to `abel`.
- probe2 (all coboundary/End-2-cochain/non-vacuity statements over O ℚ, `abel`): compiled clean 8.2s.
- Every obligation is a one-line banked citation (`simp [assoc/gluingDefect, mul_sub, sub_mul]; abel`
  or `rw [jacobiator_eq_six_assoc]; rfl` or `assoc_nonvanishing`). NO coordinate ring, NO W9 risk.
- KILL budget: 90s/obligation. Never approached (each ≤10s).

## STANDARD self-check
- UNBROKEN: imports only banked `Sedenion` + `Alternative` + `TowerGatherObstruction`(N219) +
  `OctonionCommutatorJacobiator`(N205); every object is the banked derived tower `O ℚ`, the banked
  `assoc`/`assoc_swap*`/`alt_left`/`assoc_nonvanishing` (N5b), the banked N219 `gluingDefect`, the
  banked N205 `jacobiator`/`jacobiator_eq_six_assoc`; ground = derived ℚ; nothing posited; no bridge.
- COMPLETE: all decls foundations-only; no sorry/axiom/native_decide; no maxHeartbeats raise.
- WORDS-REMOVABLE: delete "world/gather/glue/cocycle/obstruction/coboundary/Jacobiator" → these are
  pure algebraic identities of the associator `(x·y)·z − x·(y·z)` and the commutator's cyclic sum on
  `CD (CD B)`: δ(assoc)=0, δμ = −2·assoc, the End-2-cochain coboundary = −[a,b,c]·x, the cyclic sum
  = 6·assoc, and assoc ≠ 0 on O ℚ. No theorem STATEMENT needs a physics word.
- FREE-FLOATING check: the generic `teich_cocycle_generic`/`mult_coboundary_generic` are formal
  backbone lemmas (like a ring identity); ALL headlines + the capstone are stated ON `O ℚ` and
  reference the banked `assoc`/`gluingDefect`/`jacobiator`. The node is ABOUT the banked tower.

## Costume C252
Genuine: `(gluingDefect (ι(ιJ)) (ι(e2)) e2).im.im.im = 2` (= `assoc_witness_coord`, since
gluingDefect = assoc on O ℚ — the obstruction cocycle is genuinely nonzero at the witness).
Bogus: claims it `= 252` (a stand-in for "the gluing-obstruction cocycle is trivial / vanishes /
the cohomological content is vacuous"). Reduces to the false `2 = 252` in ℚ; signature `2 = 252`
(dash-free, RHS 252 fresh vs every prior costume).
