# N41d — PREREG (frozen before compute)

## TARGET (the ticket)
Over the DERIVED ℝ `ContinuumQ.Cut`, discharge N41c's conditional `expO_mul_of_summable` to the
UNCONDITIONAL `O Cut` algebra-automorphism:
1. ★ GENUINE HARD CORE — the Cut-side coordinatization `coordOCut : O Cut ≃ₗ[Cut] (Fin 8 → Cut)`
   (mirror banked ℚ-side `coordO`/`bO`) + UNCONDITIONAL `Summable (fun n => (1/n!)•(Dⁿ x))` in
   `O Cut` for a Leibniz derivation D, transporting the banked N39 `expTerm_summable` operator-norm
   majorant via the matrix representation of D under `coordOCut`.
2. DISCHARGE: feed unconditional hx/hy/hxy into N41c `expO_mul_of_summable` → unconditional
   `expO D (x·y) = expO D x · expO D y`.
3. BIJECTION: `expO D` Cut-linear + invertible inverse `expO (-D)`, assembled into a Cut-side
   `≃ₗ[Cut]`/`IsAlgAut` automorphism.
4. `d/dt exp(tD)|₀ = D` — trunk-native `Tendsto` over the N36 uniform structure (NOT HasDerivAt).

## STANDING DEPENDENCY GATE (STANDARD §3)
NEVER `import Mathlib.Data.Real` as content. exp = Cut/O-Cut-valued series. tsum/HasSum/Finset/
Matrix/Module/Pi/LinearEquiv = MACHINERY on the DERIVED objects. Derivative = trunk-native
`Tendsto`, NOT Mathlib `HasDerivAt`/`NormedField`. NO ℝ-valued Norm.

## BANKED LEVERS (W2 — import & USE, never re-derive)
- N41c: `expO`, `expO_zero`, `expO_term_antidiag`, `expO_mul_of_summable` (CONDITIONAL),
  `smulCompat_oCut`, `instModuleCutO` (Module Cut (O Cut)), `expO_term_antidiag_one`.
- N41b: `oCut_t3Space`/`oCut_completeSpace`/`oCut_continuousMul`/`oCut_continuousAdd`/
  `oCut_continuousSMul`/`oCut_isTopologicalSemiring`; `CD.toProd`/`Dbl.toProd` + injectivity +
  `topology_eq_induced`/`isUniformInducing_toProd`/`continuous_re`/`continuous_im`/`continuous_mk`.
- N40: matrix exp `expMap`, `expMap_mul_neg`/`expMap_neg_mul` (GL inverse), `matrix_prod_summable`.
- N39: `expTerm`, `expTerm_summable` (MATRIX series Summable via opNorm majorant),
  `matrix_summable_of_entrywise` (Pi.summable reduction).
- N38: `opNorm M = ∑ᵢⱼ|Mᵢⱼ|`, `opNorm_pow_le`, `entry_abs_le_opNorm`, `opNorm_mul_le`.
- ℚ-side model: `coordO : O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ)` via `![c0..c7]` + `Dbl`-nested invFun; `bO`.
  `autMatrix φ i j := ((coordO (φ (bO j)) i : ℚ) : Cut)` (the ℚ→Cut cast pattern).
- `c0..c7 : O ℚ → ℚ` (DerivationLowerBound) = nested `.re/.im` projections. For Cut side these
  become `O Cut → Cut` nested projections (same structure, different base).
- ContinuumSummable: `cut_summable_pow_div_factorial`, `cut_summable_of_abs`, `_of_le'`, etc.

## THE FOUR W9 RISKS TO MEASURE (bounded probe, KILL=60s each)
- (A1) `coordOCut : O Cut ≃ₗ[Cut] (Fin 8 → Cut)` — mirror `coordO` but base = Cut, scalars = Cut.
  Define `d0..d7 : O Cut → Cut` nested projections; toFun = ![d0..d7]; map_add'/map_smul' via the
  same CD.add_re/cd smul lemmas at base Cut. MEASURE: does map_smul' over Cut close cheaply?
- (A2) ★ THE GATING CORE: UNCONDITIONAL `Summable (fun n => (1/n!)•((D^n) x))` in O Cut.
  ROUTE-1 (matrix transport): build `Dmat := matrix-of-D under coordOCut`; show
  `coordOCut ((D^n) x) = (Dmat^n) *ᵥ coordOCut x` (matrix power = endo power under coord); then
  `(1/n!)•(D^n x)` corresponds entrywise to `expTerm`-like matrix terms → reduce O-Cut Summable
  to matrix/Pi Summable via the coordOCut embedding (continuous linear equiv preserves Summable)
  + `expTerm_summable`. MEASURE: (a) the matrix-rep `coordOCut ∘ D = Dmat *ᵥ ∘ coordOCut`,
  (b) `Summable`-transfer across `coordOCut` (LinearEquiv + continuity → `Summable.map`/embedding).
  ROUTE-2 (componentwise): `Summable f ↔ Summable (toProd ∘ f)` via uniform embedding; reduce to
  8 scalar series each majorized. run-175 probe_summ said this needs its own embedding lemma.
  MEASURE BOTH; pick the cheaper.
- (A3) DISCHARGE + BIJECTION: once (A2), `expO_mul_of_summable` discharge is one `apply`. Linearity
  of `expO D` (tsum of linear terms) + inverse `expO(-D)`: MEASURE `expO D ∘ expO (-D) = id`
  (Cauchy product on commuting D,-D, OR matrix transport of `expMap_mul_neg`).
- (A4) DERIVATIVE: trunk-native Tendsto difference quotient. MEASURE feasibility only; likely its
  own node.

## GO / NO-GO (scope decided by the MEASUREMENT)
- GO scope = the largest COMPLETE (foundations-only, no sorry) increment the probes show
  elaborates cheaply (≤ KILL each), in dependency order: coordOCut → matrix-rep → unconditional
  summability → discharge → bijection → derivative.
- Bank-as-you-go (W9.8): instant any lemma compiles clean → production + wire + commit BEFORE
  chasing the full theorem. DECOMPOSE aggressively; child summability/derivative if hard core.

## KILL BUDGET (W9)
- KILL = 60s wall for ANY single proof obligation. Exceed → INSTRUMENT failure: stop, measure
  smaller, decompose/reframe. NEVER inflate maxHeartbeats.

## TURN CHECKPOINT (anti-timeout, W9 ★)
- At ~55% of turn budget: STOP exploring, FINALIZE whatever compiles clean (commit + wire +
  audit + LEDGER/ROADMAP), child the remainder onto the chain tail. N28–N41c ALL timed out AFTER
  leaving the derivation uncommitted — DO NOT repeat. Finalize EARLY with turns to spare.

## ANTI-VACUITY (W8) — costume C66 MUST bite
A WRONG coordOCut (non-bijective/non-Cut-linear), a WRONG summability (non-exp series, or dropping
the majorant structure), a WRONG bijection (`expO D ∘ expO E = id` for E ≠ -D), or a wrong
derivative-at-0, must FAIL to compile. Reuse banked expO/expO_mul_of_summable/expTerm_summable/
opNorm_pow_le/coordO/expMap_mul_neg/IsDeriv/ContinuumQ.Cut/oCut_* — never a fresh table.
