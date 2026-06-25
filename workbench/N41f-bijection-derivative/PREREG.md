# N41f PREREG — the BIJECTION / Cut-side ≃ₗ[Cut]/IsAlgAut automorphism + d/dt exp(tD)|₀=D

FROZEN before compute. Run 182. Git clean at HEAD=5a05abe (NOT a crime scene — fresh build).

## THE TARGET (two parts over the DERIVED ℝ `ContinuumQ.Cut`)

PART 1 — THE AUTOMORPHISM (the headline; the gateway to SU(3)⊂G₂):
  `expO (D'.restrictScalars ℤ)` (for `D'` Cut-linear, `D'.restrictScalars ℤ` a Leibniz derivation)
  is a genuine Cut-side `≃ₗ[Cut]` / `IsAlgAutCut` automorphism of `O Cut`:
  - Cut-LINEAR (map_add + map_smul),
  - structure-preserving (banked N41e `expO_mul`),
  - UNITAL (`expO D 1 = 1`, via `D 1 = 0` from Leibniz),
  - INVERTIBLE with inverse `expO ((-D').restrictScalars ℤ)`.

PART 2 — THE DERIVATIVE (the Der→Aut tangent half; the W9 RISK):
  `d/dt exp(tD)|₀ = D` as a trunk-native `Tendsto` of the difference quotient over the N36
  uniform structure, NOT Mathlib `HasDerivAt` (an ℝ/NormedField-content trap).

## THE ROUTE (MEASURED; matrix-transport, reframe-through-trunk)

The crux of Part 1 is ONE new analytic lemma (the rest is assembly on banked levers):
  ★ `coordOCut_expO` : `coordOCut (expO (D'.restrictScalars ℤ) x) = expMap (derivMatrix D') *ᵥ coordOCut x`
    — the tsum analogue of the banked per-power `expO_matrix_rep`. Proof: `coordOCut` (a `≃ₗ[Cut]`,
    continuous additive) commutes with the `tsum` (summability `expO_summable_restrict`); each term
    transports by banked `expO_term_coord` (+ `restrictScalars_pow_apply`) to `expTerm M n *ᵥ v`; the
    `tsum` of `(· *ᵥ v) = mulVecHom v` (continuous additive, banked) pulls out as
    `(∑' expTerm M n) *ᵥ v = expMap M *ᵥ v`.

Then the BIJECTION is FREE from the banked N40 matrix GL-law:
  - `derivMatrix_neg` : `derivMatrix (-D') = - derivMatrix D'` (additivity of conjRingEquiv + toMatrix').
  - `coordOCut (expO D (expO (-D) x)) = expMap M *ᵥ (expMap (-M) *ᵥ v) = (expMap M * expMap (-M)) *ᵥ v
     = 1 *ᵥ v = v = coordOCut x` (banked `expMap_mul_neg` + `Matrix.mulVec_mulVec` + `one_mulVec`),
     so by injectivity of `coordOCut` (LinearEquiv): `expO D (expO (-D) x) = x` and reverse.

Then ASSEMBLE:
  - `expO_add_apply`/`expO_smul_apply` (map_add/map_smul, via tsum_add / tsum smul + banked summability)
    → `expOLin D' : O Cut →ₗ[Cut] O Cut`.
  - `LinearEquiv.ofLinear` with inverse `expOLin (-D')` + the two bijection identities → `expOEquiv D'`.
  - `IsAlgAutCut` def (mirror of ℚ-side `IsAlgAut`: `(∀ x y, φ(x*y)=φx*φy) ∧ φ 1 = 1`).
  - `expO_one` (unital, via `deriv_apply_one_eq_zero`) + banked `expO_mul` → `expOEquiv_isAlgAut`.

## GO / NO-GO  (decided by a bounded MEASUREMENT)

GO scope: PART 1 (the automorphism) is the bankable node N41f, IF the intertwining `coordOCut_expO`
  + the bijection + the ≃ₗ/IsAlgAut assembly all elaborate under the KILL budget.
PART 2 (the derivative `d/dt exp(tD)|₀=D`): MEASURE the cleanest trunk-native statement. The matrix
  difference-quotient remainder bound `∑_{n≥2}(tM)ⁿ/n! = O(t²)` is genuine analysis. IF it does not
  close cheaply after measure+reframe → it is the genuine W1 hard core → CHILD it as N41g (the Der→Aut
  tangent half), block nothing (Part 1 stands alone as the automorphism node), advance the chain tail.

## KILL (W9 compile-cost budget)

- Per-obligation KILL = 60s. Any single lemma exceeding 60s in a bounded probe → STOP, do not inflate
  maxHeartbeats, decompose or reframe.
- The `coordOCut_expO` tsum-continuity is the only piece with W9 exposure; measure it FIRST in scratch.
- NEVER an unbounded compile in the turn budget; measure in a bounded probe.

## TURN CHECKPOINT (anti-timeout, W9)

- Checkpoint at ~55% of turn budget: whatever of Part 1 compiles clean → MOVE to production, wire,
  COMMIT (bank-as-you-go). Do NOT hoard for a grand assembly.
- FINALIZE (commit + LEDGER + ROADMAP + child N41g if Part 2 deferred + costume + gate) with turns to
  spare. N28–N41e ALL timed out AFTER leaving the derivation — finalize EARLY.

## W8 ANTI-VACUITY (costume C68 must BITE)

A WRONG inverse (`expO D ∘ expO E = id` for E ≠ -D), a WRONG linearity, a wrong automorphism (structure
-preservation dropped), or a wrong unital claim must FAIL to compile. Reuse banked
`expO`/`expO_mul`/`expO_summable_restrict`/`coordOCut`/`derivMatrix`/`expMap_mul_neg` — NEVER a fresh table.

## STANDARD (physics-words-removable)

Delete "exp/gauge/G₂/colour/derivation/automorphism" → the theorem remains a complete proof that the
convergent power series ∑(1/n!)•Dⁿ of a Leibniz endomorphism of the 8-dim non-associative complete-
topological *-algebra over the derived ℝ is a structure-preserving Cut-linear bijection (an algebra
automorphism) invertible with inverse the series of −D. No posited exp/G₂/Aut/ℝ/Norm/HasDerivAt, no bridge.
