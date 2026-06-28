# N119 PREREG — THE RANK-DROP RESTRICTION LEMMA (the gFormC-isometry strand)

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure (W9), not theory.

## THE NODE (W1 decomposition of the §N119 forward frontier)
ROADMAP §N119 names the GLOBAL SO(8) octonion-block exhaustion / operator topology over Cut as
the HEAVY group-manifold core, with MEASURE-FIRST priority (i) and the named immediately-bankable
structural pieces: (b)/(c) **the rank-DROP restriction lemma** — does an e-FIXING octonion-block
isometry RESTRICT to a smaller-rank isometry on the e-orthogonal complement (the rank-DROP that
makes the induction TERMINATE)?

## THE MEASURE (done — git clean, N118 landed, no inherited WIP)
- The N79 `uPerp`/`deflateRestrict`/`uPerp_finrank` rank-drop is on the **EvC self-adjoint
  SPECTRAL strand** (`deflateC` operators), NOT the **gFormC ISOMETRY/REFLECTION strand** that
  N115–N118 built (`octDeflate` / `vTwoPlane` / `blockWordLin`). So the rank-DROP on the isometry
  strand is genuinely NOT banked → must be BUILT (W1: build, don't posit; don't panic).
- ALL prerequisites banked: `gFormC` bilinearity (`gFormC_add_left/right`, `gFormC_symm`,
  `gFormC_smul_left/right`, `gFormC_neg_left`, N-LieAlgebra); ★ `gFormC_polarize` (N112, the
  bilinear-preservation from the diagonal); `Module.Finite Cut (O Cut)` (`instFiniteOCut`,
  N-SeedVector) → `LinearMap.finrank_range_add_finrank_ker`; the block isometries `vTwoPlane` +
  `vTwoPlane_gFormC_diag` + `vTwoPlane_fix_one` (N112/KAK); the N79 `uPerp`/`deflateRestrict`
  TEMPLATE to mirror exactly; `EvCRight` bundling style (N-SpectralN) to mirror for `gFormC`.
- Units banked: `e₂`/`je2`(=ιe₂)/`ke2je2`/`ii4`/`ii5`, their `*_imag`/`*_alt`/`*_sq`/`*_gFormC_self`
  + anticommutators; `block1_fixes_ke2je2` (genTwoPlaneLin e₂ ιe₂ FIXES ke2je2).

## GO / NO-GO
GO = bank the gFormC-isometry-strand RANK-DROP RESTRICTION LEMMA as production decls,
foundations-only, gate D0–D6 green, costume C151 bites a WRONG rank-drop/complement/restriction
coordinate, STANDARD applied, child the GLOBAL remainder (the full iteration + operator topology)
onto the chain tail.

The spine (mirror of N79 `Reseed`, on the gFormC block strand `O Cut →ₗ[Cut] O Cut`):
- `gFormCRight (e : O Cut) : O Cut →ₗ[Cut] Cut` — bundle `p ↦ gFormC e p` (mirror `EvCRight`).
- `ePerp (e : O Cut) : Submodule Cut (O Cut) := ker (gFormCRight e)` — the Born-orthogonal
  complement of `e` within the octonion block.
- `mem_ePerp` — `p ∈ ePerp e ↔ gFormC e p = 0`.
- `gFormCRight_surjective` — for a unit `e` (`gFormC e e = 1`), surjective (witness `c ↦ c•e`).
- ★★ `ePerp_finrank` — THE CODIM-ONE DROP: `finrank (ePerp e) = finrank (O Cut) − 1` (rank–nullity).
- ★★ `isom_fixes_mapsTo_ePerp` — THE KEY (the genuine inductive content): a gFormC-isometry `S`
  (`gFormC (S v) (S v) = gFormC v v`) that FIXES `e` (`S e = e`) maps `ePerp e` INTO `ePerp e`,
  via `gFormC_polarize`: `gFormC e (S p) = gFormC (S e) (S p) = gFormC e p = 0`. The rank-DROP.
- `isomRestrict` — the restricted block operator on the codim-1 invariant subspace.
- `isomRestrict_coe`.
- ★ `isomRestrict_gFormC_isom` — the restriction is STILL a gFormC-isometry (closure → recursion).
- `ePerp_finite` — `Module.Finite Cut (ePerp e)`.
- W8: `self_not_mem_ePerp` (`e ∉ ePerp e`), `ePerp_ne_top`.
- W8 concrete teeth: a genuine block isometry fixing a unit-imaginary axis (`vTwoPlane e₂ je2`
  FIXES `ke2je2` via block1_fixes_ke2je2 analogue) → the rank-drop applies non-vacuously; a deep
  coordinate read-off the costume falsifies.

NO-GO / DECOMPOSE further: if the spine fragments, bank the achievable prefix (the
complement + codim drop + the KEY mapsTo) and child the rest.

W1 HONEST BLOCK: only if the KEY `isom_fixes_mapsTo_ePerp` genuinely resists after reframe —
NOT expected (it is a 3-line `gFormC_polarize` application).

## KILL (W9 — instrument budget)
- KILL = 90s wall per single obligation. Every obligation here is pure linear-algebra mirroring
  N79 (which compiled fast); expected ≤ 10s each.
- If ANY obligation exceeds 90s → INSTRUMENT failure: measure the smallest sub-obligation,
  decompose, prefer the banked structural lemma over coordinate expansion. NO inflated
  maxHeartbeats, NO monolithic brute, NO native_decide.
- Bank-as-you-go: the instant the spine compiles clean → production file + wire + commit BEFORE
  chasing the W8 witness polish. Checkpoint ~50% turns.

## W8 anti-vacuity
Costume C151 (next id) — a WRONG rank-drop / orthogonal-complement / restriction / codim /
spanning coordinate, reducing to a false numeric DISTINCT from C115 1=7 … C149 1=109, C150 1=111.
Candidate: `1 = 113` (the genuine self-overlap `gFormC ke2je2 ke2je2 = 1` that puts the peeled
axis OUTSIDE its own complement — a wrong claim it is 113). PASS_SIGNATURE matches a trailing
substring (no leading `-`).

## Physics-words-removable
Delete rank/drop/restriction/complement/orthogonal/isometry/SO(8)/octonion-block/deflation/
generation/Cartan/Dieudonné/codimension/peel/stabilizer/spectral → pure linear algebra over the
derived field `Cut`: for the bundled functional `gFormCRight e := p ↦ gFormC e p` on `O Cut`,
`ePerp e := ker (gFormCRight e)` has `finrank = finrank (O Cut) − 1` for `gFormC e e = 1`; a
`Cut`-linear `S` with `gFormC (S v)(S v) = gFormC v v` and `S e = e` maps `ePerp e` into itself
and its restriction preserves `gFormC` diagonally. No theorem STATEMENT needs a physics word.
