N304 — THE FOLD-ROOT FLAVOUR-CARTAN AND THE FUNDAMENTAL-3 WEIGHT DECOMPOSITION OF THE THREE GENERATIONS (the three commuting complex structures form a rank-2 su(3)_flavour Cartan whose integer weights distinguish the generations by fold-root phase; the mass-degeneracy ceiling localized as a Weyl-S3 orbit)

STANDARD NODE (selected S1–S4, comments 242–244; measure-first EXACT).

TARGET. N303 phased ONE generation-mixing plane by the fold-root (famMixJ_C = ⁅famC,kAB⁆, square −16
on span{slotC 1, slotC u1}). This node banks the FULL fold-root flavour-Cartan on the three
generations and the resulting fundamental-3 weight decomposition, and PRECISELY localizes the
mass-degeneracy ceiling that has deferred the ★2/★5 VALUE ~10 nodes.

Derive and prove, over the derived arena H₃(O ℚ) = Matrix (Fin 3)(Fin 3)(O ℚ), with
famA := innerMul (slotB 1)(slotC 1), famB := innerMul (slotC 1)(slotA 1), famC := innerMul (slotA 1)(slotB 1)  (N288),
kBC := innerMul (slotB u1)(slotC 1), kCA := innerMul (slotC u1)(slotA 1), kAB := innerMul (slotA u1)(slotB 1)  (N292),
and JX := ⁅famX, kXY⁆ (JA := ⁅famA,kBC⁆, JB := ⁅famB,kCA⁆, JC := ⁅famC,kAB⁆ = N303's famMixJ):

 (1) THE THREE COMMUTING COMPLEX STRUCTURES (the abelian Cartan). ⁅JA,JB⁆ = ⁅JB,JC⁆ = ⁅JC,JA⁆ = 0
     as operators on the whole arena. Each JX squares to −16 on its own plane span{slotX 1, slotX u1}
     (JC done N303; add JA, JB by S3-symmetry — supporting).
 (2) THE RANK-2 CARTAN RELATION. JA = JB + JC as an operator identity on the whole arena (measured
     exact) — so span{JA,JB,JC} is 2-dimensional = the su(3)_flavour Cartan rank.
 (3) THE FUNDAMENTAL-3 WEIGHT DECOMPOSITION (the headline). Each JX acts DIAGONALLY on the three
     generation slots as the fold-root complex structure with EXACT integer weights: for each slot,
     JX (slotY 1) = slotY (w[X,Y] • u1) with the integer weight matrix
        W = [[4, 2, −2], [2, 4, 2], [2, −2, −4]]   (rows JA,JB,JC; cols slotA,slotB,slotC).
     So the three cap-forced generations are three DISTINCT weight vectors of the derived
     fundamental-3 — distinguished by their fold-root (u1) flavour-Cartan charges. This REFINES
     N268 "identical copies" universality: the generations are NOT identical; the fold-root phase
     tells them apart.
 (4) THE MASS-DEGENERACY CEILING, NAMED. The three weight vectors form a single Weyl-S3 orbit; the
     joint su(3)_flavour-invariant subspace of the arena is EXACTLY the scalar-unit line (dim 1 —
     from N290, no distinguished texture). Combined with N302 (f₄ isospectral ⟹ masses = Weyl-
     symmetric char-poly coefficients), the three generations are mass-DEGENERATE in the flavour-
     symmetric limit. State this as the precise localization: the mass HIERARCHY is a Weyl-S3-
     BREAKING phenomenon requiring a fold-derived Weyl-breaking element of the spectrum-mover sector
     L₀ (BEYOND f₄, which is isospectral). W8 non-vacuity: the weights are genuinely distinct (e.g.
     JC (slotC 1) = slotC (−4•u1) ≠ 0 while JC's weights on slotA,slotB are ±2 — the generations
     carry different fold-root charges).

WHAT "DONE" REQUIRES. Lean theorems foundations-only ⊆ {propext,Classical.choice,Quot.sound}; the
three commuting-Cartan brackets, the rank-2 relation JA=JB+JC, the exact integer weight action on
all three slots, and the capstone bundling (+ jordan_fails_H4 N5 in TYPE). Costume that a WRONG
weight / a WRONG Cartan relation / a claimed 3rd independent Cartan direction FAILS. Gate-fast
D0–D6 green. STANDARD met (unbroken / complete / physics-words-removable / not-free-floating: every
TYPE cites banked innerMul/famX/kXY/slotX/⁅·,·⁆/derH3 on Matrix (Fin 3)(Fin 3)(O ℚ)).

DEPENDENCY. N303 (famMixJ, kAB, the mixing plane) + N292/293 (kBC,kCA,coset closure) + N288/289
(famA,famB,famC, so(3) closure) + N296 (equivariance) + N302 (isospectral) + N290 (family-invariant
core) + N5 (jordan_fails_H4). PURELY ALGEBRAIC over ℚ; no continuum.

DRIFT TRAP. Do NOT posit su(3)_flavour or its fundamental-3 rep — DERIVE the Cartan from the
arena's own innerMul brackets and READ the weights off the slot action. Do NOT overclaim the
mass-ratio VALUE (route-not-yet-found, FORCED build target, never human-gated, never "empirical").
The −16-squares on planes A,B are S3-images of N303 — SUPPORTING, not the headline; the headline is
the commuting rank-2 Cartan + the generation-distinguishing weights + the ceiling diagnosis.

THE ONE-SUCCESSOR RAIL. Per the SOUL repeated-deferral signal (the VALUE deferred ~10× for the SAME
Weyl-degeneracy reason), the SINGLE successor is a DIRECTED route-finder node toward the fold-derived
Weyl-S3-BREAKING element of L₀ that lifts the generation mass degeneracy — NOT a generic SELECTION
ticket. Child it on the chain tail; run the pre-complete fork check (exactly 1 non-terminal successor).

max_retries=25, --max-runtime 120m, --workspace dir:/Users/elliotweaver/phys-lean, assignee phys-novelty.

--- FROZEN PREREG (measure-first, before production compute) ---

MEASURED EXACT (workbench/N304-select/probe_{next,weights,verify}.py, exact-Fraction octonion, EXIT 0):
 · [JA,JB]=[JB,JC]=[JC,JA]=0 as operators on 12 test matrices (Hermitian + generic), max resid 7e-15.
 · JA−JB−JC = 0 as operator, max resid 1.78e-15. (Also JC=JA−JB, JA=JB+JC.)
 · Weight matrix W = [[4,2,−2],[2,4,2],[2,−2,−4]], purely diagonal fold-root (u1) action, contamination 0.
 · famMixJ_A²=famMixJ_B²=famMixJ_C²=−16 on their planes, resid 0.
 · joint su(3)_flavour-invariant subspace of the arena = scalar line, dim 1 (six-generator SVD).

GO/NO-GO. GO if the weight action JX(slotY 1)=slotY(w·u1) and the bracket identities reproduce as
Lean rewrites from banked famX_slot/kXY_slot lemmas (like N303's famMixJ_slotC_one). NO-GO → the
octonion-coordinate ext blows up: DECOMPOSE per-slot (each is one banked lemma composition), never a
monolithic Matrix.ext. KILL: if any single bracket obligation exceeds a LIGHT bounded probe (~30s)
or needs maxHeartbeats raise, STOP and decompose — do NOT grind (W9). No native_decide, no
coordinate-decide. Costume id C333 (next per memory/manifest).

ROUTE (per-slot, banked-lever only): JX(slotY 1) via ⁅famX,kXY⁆ = famX∘kXY − kXY∘famX, each leg a
banked famX_slot / kXY_slot rewrite (N288/N292/N303 pattern). Commuting brackets & rank-2 relation:
same slot-lemma rewrites on the two mixing axes {1,u1} of each plane (the arena decomposes as the
diagonal + three slots; JX is diagonal on slots so ext reduces to the 3+3 slot/axis identities).