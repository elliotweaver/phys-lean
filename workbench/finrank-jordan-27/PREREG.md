# PREREG — N470: THE TERMINAL JORDAN ARENA DIMENSION (finrank J₃(𝕆) = 27, traceless = 26)

## SELECTION (see kanban comment for full S1–S4)
Node: N470. Module: `Phys/Algebra/JordanArenaDimension.lean`, ns `Phys.Algebra.HJ`.
Selected by the SELECT protocol as the sharpest NAMED-OPEN debt on the board: `finrank hermSub = 27`
is currently banked ONLY as a comment ("3 + 3·8 = 27", N267 Hm_slot_decomp) because N299/N300 hit
a W9 wall (27-dim coordinate basis times out). It is load-bearing: the F₄=Der(J₃(𝕆)) arena (N284/
N285), the observable-algebra reality (★12, N270), and the sole NAMED-OPEN cosmology frontier — the
ρ_Λ 26-channel mechanism (★10/★14, N337/N338, CosmologyContactConsolidation §67-86).

## THE FRONT (what is proved)
1. `selfconj_eq_ocR (x : O ℚ) (h : star x = x) : x = ocR (reQ x)` — a self-conjugate octonion is real.
2. `hermEquiv : hermSub ≃ₗ[ℚ] (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ)` — the fold's OWN slot decomposition
   (N267) AS a linear equivalence: real diagonal triple ⊕ three copies of the matter carrier.
3. `finrank_hermSub_eq_27 : Module.finrank ℚ hermSub = 27` — via `hermEquiv.finrank_eq` +
   `finrank_prod` + `finrank_pi` + the banked `finrank_O_eq_eight` (=8). 3·1 + 3·8 = 27.
4. `hermTrace : hermSub →ₗ[ℚ] ℚ` (real trace) + `hermTrace_surj` (surjective, hits 1).
5. `tracelessArena := LinearMap.ker hermTrace`; `finrank_tracelessArena_eq_26 = 26` via
   `finrank_range_add_finrank_ker` (range = ⊤, finrank 1; 27 − 1 = 26).
6. W8 non-vacuity teeth: `hermEquiv` genuinely bijective (a nonzero Hermitian in hermSub); the count
   is not the empty/degenerate 0.

## THE W9-DISSOLUTION ROUTE (the theory-native lever)
The field computes dim=27 with a 27-element coordinate basis (TIMES OUT — the wall N299/N300 avoided).
The theory reads the count off the fold's own structure: the slot decomposition IS a linear
equivalence, and finrank is ADDITIVE over ⊕. ZERO coordinate basis, ZERO decide. This is the EXACT
banked route of `finrank_O_eq_eight` (the `cdProdEquiv : CD A ≃ₗ A × A` chain 2→4→8, DerivationFinrank.lean).

## COST BUDGET + KILL (W9)
De-risked in scratch (workbench/finrank-jordan-27/Probe1.lean + Probe2.lean, BOTH EXIT 0, no sorry):
- selfconj_eq_ocR: field-component `linarith`, instant.
- hermEquiv left/right_inv: `fin_cases i <;> fin_cases j <;> simp only [...] <;> first | rfl | ...`, light.
- finrank chain: pure `rw` of banked lemmas, instant.
- hermTrace_surj: single Hermitian witness, light.
KILL: any single obligation exceeding ~30s / needing maxHeartbeats raise ⟹ STOP, decompose. NONE
expected (scratch built in seconds). NO brute `decide`, NO 27-dim basis, NO native_decide, NO
heartbeat raise. If the equiv fought, the route would be wrong — it did not.

## GUARDS
- G1 NO ASSERTED VALUE: 27 and 26 FALL OUT of finrank-additivity over the banked equivalence + the
  banked finrank_O_eq_eight; no literal dimension posited.
- G2 NO EMPIRICAL NUMBER: no physics constant; measured ρ_Λ / 26-channel value stays out entirely
  (this node does NOT produce ρ_Λ — it pays the finrank prerequisite only, exactly as named-deferred).
- ℝ-VIGILANCE: all over ℚ / O ℚ (banked derived octonion); NO Mathlib-ℝ, NO Cut needed. `finrank`,
  `Matrix`, `LinearEquiv`, `LinearMap.ker` are standard Mathlib MACHINERY on the DERIVED carrier.
- FREE-FLOATING RAIL: every production TYPE mentions the banked derived objects (`hermSub` on
  `Matrix (Fin 3) (Fin 3) (O ℚ)`, `Hm`/`ocR`/`reQ`, `finrank_O_eq_eight`) — NOT a generic
  finite-dim statement. hermSub IS the concrete banked Jordan arena.
- PHYSICS-WORDS-REMOVABLE: delete "Jordan/matter/arena/octonion/generation/cosmology" → "the ℚ-
  submodule of self-adjoint 3×3 matrices over the banked 8-dim algebra O ℚ has finrank 27, its
  trace-zero subspace 26". Pure linear algebra survives.
- FOUNDATIONS-ONLY: #print axioms ⊆ {propext, Classical.choice, Quot.sound}; NO foldRetention;
  import guard NOT MassGapOne.

## SUCCESSOR (one, on tail)
Generic SELECTION ticket — this pays a self-contained finrank debt; the ρ_Λ mechanism (the 26-channel
fourth power) is a SEPARATE downstream node the seed flags permanent-inception (NEVER fit). A fresh
worker selects next.
