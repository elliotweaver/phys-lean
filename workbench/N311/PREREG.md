# N311 PREREG — SEEDED FLAVOR ROUTE T8 (structural frame, ℚ-exact half)

## S1 arc synthesis (fresh worker — NOT the N310 worker)
Banked flavor stack (ns Phys.Algebra.HJ), all ℚ-exact:
- N305 CycleBornSplit: `gcyc` (closed ℤ₃ coherence cycle), `seeMat = Jall−1` (CLOSED cycle, all
  off-diag = 1), `Pdem/Poth`, Born weights 1/3⊕2/3.
- N306 CycleForm: `Pcyc`, ℤ₃-Fourier DC⊕cycle⊕nothing, `cosVec`.
- N307 Koide: `genVec M A p r = ![M+Ap, M−A(p+r)/2, M−A(p−r)/2]`, `Qkoide`, Koide 2/3 ∀δ.
- N308 CyclePhase: δ_B=2/9 from holonomy=statistics.
- N309 MassRatios: `massVec M A p r k = (genVec..k)²` (masses = Born squares), forced cubic,
  `sigma1_mass = 6M²`.
- N310 AssociatorDeviation: separation Q←I₂ ⊥ I₃←associator; leptons exact ℂ-line, quarks Fano.
Cascade grounding: `Phys.Algebra.cap_from_cascade_stop : jdef Xwit Ywit ≠ 0` — the octonion
non-associativity STOPS the cascade at 𝕆 (`not_associative`) and caps the Jordan tower at order 3
(exactly 3 generations). `jordan_fails_H4`.

## Target (seed §2 T8, §1 step 7) — frame overlap, LEADING ORDER (honest-status caveat)
Mixing = tridiagonal structure per sector: diagonal = sector masses, nearest-neighbour off-diag =
geometric-mean coupling √(dᵢdⱼ), corner **M₁₃ = 0 from cascade adjacency (ℂ→ℍ→𝕆)** — DERIVE the zero,
do NOT impose it. Frame overlap of the two diagonalized sectors dressed by the fold phase gives all
angles + the CP invariant. HONEST: lands at LEADING ORDER (~few %), NOT theorem-exact. STRUCTURE is
the bankable target; numerical angles need ℝ-descent (deferred, standing dep, NOT imported — the
N309 precedent).

## THE THEORY-NATIVE KEY (the crux new content, and why it dissolves over ℚ)
1. **Corner-zero M₁₃=0 = the cascade is an OPEN PATH, not a closed cycle.** Generations 1,2,3 = cascade
   rungs ℂ,ℍ,𝕆. The coupling follows the DOUBLING adjacency: rung n couples to n±1 (one doubling
   step); rungs 1 (ℂ) and 3 (𝕆) are two doubling-steps apart → no direct coupling. And the cascade
   does NOT wrap (𝕆↛ℂ) because it TERMINATES at 𝕆 (`cap_from_cascade_stop`/`not_associative` — the
   next double, sedenions, loses Born/division). So the coupling graph is the OPEN PATH P₃ (corner 0),
   NOT the closed cycle C₃ (= the banked `seeMat`, corner 1). This is DISTINCT from the closed
   coherence cycle `gcyc`/`seeMat` (which gives the Koide/mass amplitudes): the coherence cycle is
   closed (C6: best coherence cycles), the cascade COUPLING chain is open (the cascade terminates).
   **ONE CAUSE another termination**: the same cascade stop that caps generations at 3 also opens the
   coupling chain, forcing M₁₃=0.
2. **The geometric-mean coupling is ℚ-EXACT via the Born-square structure (ONE LAW/G7 reframe).**
   Masses are Born squares mₖ = aₖ² (N309). So √(mᵢmⱼ) = √(aᵢ²aⱼ²) = |aᵢaⱼ| = the ordinary product of
   the banked amplitudes — NO √ needed. The nearest-neighbour coupling xᵢⱼ = aᵢaⱼ = genVec i · genVec j
   is rational; its square (aᵢaⱼ)² = mᵢmⱼ IS the geometric-mean-of-masses relation (Born-squared form,
   like the N306 √2 handling). The √ dissolves through the Born framing.
3. **GST θᵢⱼ ~ √(mᵢ/mⱼ) is ℚ-exact at leading order.** The 2×2 small-angle mixing θᵢⱼ ≈ offdiag/mⱼ =
   aᵢaⱼ/aⱼ² = aᵢ/aⱼ, and (aᵢ/aⱼ)² = mᵢ/mⱼ — ℚ-exact. The EXACT angle (arctan of the ratio) needs ℝ
   (deferred). The leading-order structural relation is ℚ-exact.

## Scope decision (W3 — DECOMPOSE, the EXPECTED T8 shape)
THIS node banks the ℚ-EXACT SINGLE-SECTOR TRIDIAGONAL FRAME (the load-bearing NEW content: the
cascade-path corner-zero derivation + tridiagonal-from-doubling + geometric-mean coupling as
Born-squared + GST leading angle). The two-sector FRAME OVERLAP (the actual CKM/PMNS matrix = misalignment
of up & down frames) + the CP-phase-as-cascade-angle need the ℝ diagonalization → CHILD as the T8-remainder,
the SINGLE directed successor (do NOT also emit a SELECTION/A1 ticket — ONE-SUCCESSOR RAIL; A1 gauge
child only after T8 fully completes).

## Production: Phys/Algebra/OctonionJordanGenerationMixingFrame.lean (ns Phys.Algebra.HJ)
- `cascadePath : Matrix (Fin 3)(Fin 3) ℚ` = !![0,1,0;1,0,1;0,1,0] (open path P₃, doubling adjacency).
- `cascadePath_corner_zero`, `cascadePath_nn` (nearest-neighbour = 1), `cascadePath_diag_zero`.
- `cascadePath_ne_seeMat : cascadePath ≠ seeMat` (open ≠ closed; differ at corner 0≠1) — corner-zero
  DERIVED, grounded on banked `seeMat`.
- `massMat M A p r : Matrix (Fin 3)(Fin 3) ℚ` = tridiagonal: diag = massVec, nn = amplitude product
  aᵢaⱼ, corner 0.
- `massMat_diag`, `massMat_corner_zero`, `massMat_symm`, `massMat_nn_born`:
  `(massMat..0 1)² = massVec 0 · massVec 1` (geometric-mean = Born-squared), same (1,2).
- `massMat_pattern : massMat i j ≠ 0 offdiag ⟺ cascadePath i j = 1` (tridiagonal from doubling).
- `gstAngleSq : (genVec i / genVec j)² = massVec i / massVec j` (GST leading, ℚ-exact).
- non-vacuity: corner 0 ≠ closed-cycle 1; massMat genuinely tridiagonal not full (offdiag 0 1 ≠ 0 for
  generic A while corner = 0); a wrong coupling-squared (mᵢ+mⱼ) fails.
- capstone TYPE carries `jdef Xwit Ywit ≠ 0` (cascade stop / cap-forced 3, grounding, N5).

## Guards
G1 corner-zero/tridiagonal/geometric-mean FALL OUT of cascade adjacency + Born squares (never premised,
never reverse-engineered from CKM data). G2 no measured CKM/PMNS/Jarlskog in any proof (removable prose).
G3 the structural frame is the target; per-sector scale M is a legit input. G4 the tridiagonal is the
cascade-adjacency object EVALUATED, not a fitted ansatz. G5 words-removable (delete
generation/mass/mixing/CKM/CP: statements are about genVec/massVec/seeMat adjacency over ℚ). G6
foundations-only ⊆ {propext,Classical.choice,Quot.sound}, no sorry/axiom/compiled-kernel-bypass/
heartbeat-raise. G7 ONE LAW: the √ dissolved through the Born-square framing (amplitude product),
never reached for ℝ; the exact numerical angles honestly deferred to the standing ℝ-descent.
FREE-FLOATING RAIL: TYPE cites banked genVec/massVec/seeMat/jdef — NOT a generic tridiagonal statement.

## Cost budget (W9): all decls are ℚ-matrix `Fin 3` `fin_cases`/`decide`/`ring` — trivially bounded.
KILL: if any single decl needs >30s or a heartbeat raise → STOP, decompose. (Not expected — all ≤3×3
rational, like N305/N306.)

## Costume: C340 (next free; C339 = N310). Wrong coupling-squared (aᵢaⱼ)² = mᵢ+mⱼ instead of mᵢmⱼ fails.
