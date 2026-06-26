# N50 PREREG — frozen GO/NO-GO + KILL before compute

## NODE
The next forced node after N49 (the continuum re-grounding LANDED). Two fronts, in order:
  (a) THE CONTINUUM ROTATION generator over `Cut` (LIGHT, `boostC_isom`'s sibling):
      re-ground the N45/N47 Born-unit space rotation `v ↦ u·v` (`gFormC u u = 1`) over
      `O Cut`, proving it preserves `QvC`. Requires a `Cut`-pinned Born composition law
      `gFormC_comp : gFormC (u·v)(u·v) = gFormC u u · gFormC v v`. Bank `rotFunC` /
      `rotC_isom` / `rotC_mem` into the continuum isometry monoid `qvIsomMonoidC`.
  (b) THE FULL SURJECTIVITY (HEAVY): every orientation/time-preserving continuum isometry
      of `QvC` is a finite product of the continuum boost + rotation generators. Deep
      Cartan/polar-decomposition / generation-by-one-parameter-subgroups theorem. Mathlib
      has no SO⁺(1,9), no octonionic spinor cover, no Lie machinery.

## PLAN (W1/W3 — decompose aggressively, bank (a) first)
1. MEASURE FIRST (W9): probe `gFormC_comp` over `O Cut`. The N45 `gForm_comp` route uses
   ℚ-PINNED smul lemmas (`cd_qsmul_re`, `Dbl.smul_re`, `qsmul_mul_right`, `selfMul_eq_smul`
   via `selfconj_eq_smul`/`trace_id`), which do NOT transfer to `Cut` directly. Find the
   `Cut`-native route through the GENERIC CD facts:
     - `CD.selfMul z : z * star z = iota (Nrm z)` (generic [Ring][StarRing], A = H Cut). ✓
     - `CD.Nrm_mul_of_doubled_base : Nrm (x*y) = Nrm x * Nrm y` over `O Cut = CD (CD (Dbl Cut))`
       (measured AVAILABLE in N49 probe2). ✓
     - `gFormC z z = (Nrm z).re.re` should be `rfl` (gFormC = reQC(z·star z), reQC = .re.re.re,
       Nrm z = (z·star z).re, so (Nrm z).re.re = (z·star z).re.re.re = reQC = gFormC). ✓
   The crux: `(Nrm x * Nrm y).re.re = (Nrm x).re.re * (Nrm y).re.re` for `Nrm x, Nrm y : H Cut`.
   `Nrm z` is SELF-CONJUGATE in H Cut (generic: star(z·star z)=z·star z, iota injective). Route:
   establish `Nrm z` is "doubly real" (im components vanish over char-0 `Cut`) OR prove the
   scalar form `Nrm z = (gFormC z z) • (1:H Cut)` over `Cut` with the ring/field smul.
2. The moment `gFormC_comp` compiles clean → BANK it (new file Phys/Algebra/LorentzContinuumRotation.lean).
3. Then `rotFunC u : STVC → STVC := fun p => (p.1, p.2.1, u * p.2.2)`, `rotC_isom` via gFormC_comp
   + `gFormC u u = 1`, `rotC_mem`. Bank. Commit.
4. (b): MEASURE whether a one-parameter subgroup over Cut lands in qvIsomMonoidC. If the full
   surjectivity RESISTS after measure + reframe through the derived-ℝ exp stack / Der(𝕆)=g₂
   correspondence → HONEST W1 dissolution ticket + child + block. NOT a grind.

## GO / NO-GO
- GO for (a) if `gFormC_comp` compiles foundations-only over `O Cut` (no ℚ-pinning, no sorry).
- (b) is EITHER banked (if it dissolves through the trunk cheaply) OR childed as a W1
  dissolution ticket. Decomposition (bank (a); child (b)) is the EXPECTED W3 outcome.

## KILL (instrument-failure thresholds — classify a fight as INSTRUMENT not theory)
- KILL-1: any single probe tactic on `gFormC_comp` running > 60s or needing inflated
  `maxHeartbeats` → INSTRUMENT wall (W9). STOP, decompose the obligation (prove the
  self-conjugate/doubly-real lemma separately), do NOT inflate the ceiling.
- KILL-2: if the coordinate `ext <;> simp <;> ring` blowup on `gFormC_comp` exceeds default
  heartbeats → it is the W9 brute smell; route STRUCTURALLY through Nrm/selfMul instead.
- KILL-3: front (b) — if no one-parameter-subgroup-lands-in-monoid probe compiles within
  2 bounded probes, it is the heavy Cartan core → child as W1 dissolution ticket, block. Do
  NOT grind a polar decomposition.

## ANTI-VACUITY (W8) — costume C81 MUST bite
The new costume bites a WRONG rotation claim: the FALSE claim that `rotFunC u` preserves
`QvC` for a NON-Born-unit `u` (dropping `gFormC u u = 1`). The wrong claim MUST fail to
compile. (Reuse banked objects; e.g. a `u` with `gFormC u u ≠ 1` breaks the isometry.)

## WORDS-REMOVABLE
Delete "Lorentz/boost/spinor/rotation/SO⁺(1,9)/isometry/cover/surjectivity": the statement
must stand as pure math — over the derived field `Cut` and `O Cut = CD(H Cut)`, the map
`(t,x,v) ↦ (t,x,u·v)` with `gFormC u u = 1` preserves `t² − x² − gFormC v v`, and the
`QvC`-preservers form a submonoid of `Function.End STVC`.

## ANTI-TIMEOUT (W9) — predecessors N43/N44/N46/N49 ALL timed out on gate ceremony
- `lake build Phys` is CACHED (~22s measured this run). Gate D6 (cold) ~6min → run in BACKGROUND.
- BANK-AS-YOU-GO: gFormC_comp compiles → production file + wire (Phys.lean + AxiomAudit) + commit
  BEFORE chasing rotC_isom. Then rotC_isom → commit. checkpoint ~50% turns, finalize with margin.
