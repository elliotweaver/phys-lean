# N182 PREREG — THE SCALAR 2ND-ORDER POWER-SERIES DERIVATIVE over the derived ℝ Cut

FROZEN before compute.

## Front decision (W4.5 sufficiency + W8 anti-vacuity, MEASURED first)
- Front (i) `ad ⁅D,E⁆ = ⁅ad D, ad E⁆` (ad a Lie hom): **REJECTED as VACUOUS (W8).**
  `deriv_lie_jacobi` is ALREADY banked (Derivation.lean:175, = Mathlib `lie_jacobi`). "ad is a
  Lie hom" is Mathlib's generic `LieAlgebra.ad` for ANY LieRing — it carries ZERO content
  specific to the DERIVED octonion bracket. Banking it would re-pin already-banked Jacobi.
- Front (ii) FULL 2-parameter group commutator: W9-HEAVY, needs the unbanked 2nd-order Taylor
  of exp over Cut. Its MISSING PRIMITIVE is the scalar 2nd-order power-series derivative.
- **CHOSEN: the scalar 2nd-order power-series derivative** — the genuinely-unbanked primitive
  front (ii) needs, the direct analog of the banked FIRST-order `cut_powerseries_deriv` (N41g,
  ContinuumScalarDeriv.lean). FOUNDATION-layer analysis (NOT another g₂-flow re-pin → escapes
  W4.5 over-pinning). OPENS the 2nd-order-Taylor path the chain genuinely lacks.

## The target
For `a : ℕ → Cut` with `∑ |aₙ|` summable (entire series, radius ≥ 1):
  `(fun t => (t^2)⁻¹ * ((∑' n, t^n * a n) - a 0 - t * a 1))` → `a 2`  as t → 0 in `𝓝[≠] 0`.
This is the direct 2nd-order analog of `cut_powerseries_deriv` (which gives `→ a 1` for
`t⁻¹·((∑' tⁿaₙ) − a₀)`). Recovers the a₂ coefficient. NON-vacuous (a₂ is genuine 2nd-order data).

## The route (mirror cut_powerseries_deriv, peel range 3)
- `hsum3 : Summable (fun n => |a (n+3)|) := (summable_nat_add_iff 3).2 hsum1`.
- `C := ∑' n, |a (n+3)|`.
- On `|t| ≤ 1`, `t ≠ 0`: peel `range 3` via `Summable.sum_add_tsum_nat_add … 3`:
  `f(t) = a₀ + t·a₁ + t²·a₂ + t³·R(t)`, `R(t) := ∑' n, t^n·a(n+3)`.
- difference quotient minus a₂ = `(t^2)⁻¹·(t²·a₂ + t³·R) - a₂ = t·R(t)` (field_simp; ring, t≠0).
- `|t·R| = |t|·|R| ≤ |t|·C`, `|t| → 0`, squeeze (`cut_tendsto_zero_of_abs_le`) finishes.

## GO / NO-GO
- GO: probe `lake env lean` clean (exit 0, 0 sorry, no stack/heartbeat crash) within KILL.
- NO-GO → DECOMPOSE: if the proof resists (e.g. the `field_simp; ring` with `(t^2)⁻¹` blows up
  or the peel-3 unification is heavy), reframe through the trunk; if still hard, child a
  dedicated dissolution ticket. Do NOT inflate maxHeartbeats, do NOT grind.

## KILL (W9 instrument budget)
- KILL = 90s / single obligation; 150s / whole probe file. If exceeded → STOP, decompose, do not
  re-run the same form. (The banked first-order analog compiled ~light; this is the same shape.)

## Costume (W8) — next id C214
- A WRONG 2nd-order claim reducing to a false numeric DISTINCT from the banked battery
  (… C212 180=1, C213 1=181). Use `1 = 182` (or another distinct value).
- The witness: a concrete entire series whose a₂ coefficient is genuinely a specific value; the
  WRONG claim (the 2nd-order quotient recovers a₁ / a₀ / 0 instead of a₂) forces 1 = 182 in Cut.

## STANDARD (applied at finalize)
- UNBROKEN: descends only from the banked `cut_powerseries_deriv` machinery (cut_tendsto_zero_of_abs_le,
  cut_abs_tsum_le, cut_geomdom_abssummable/tsum_le) + the derived ℝ Cut + Mathlib tsum/Summable
  MACHINERY on the DERIVED Cut. NO Mathlib ℝ/ℂ as content, NO HasDerivAt/deriv/NormedField.
- COMPLETE: foundations-only {propext, Classical.choice, Quot.sound}, audited vs built olean.
- PHYSICS-WORDS-REMOVABLE: there are NO physics words; pure statement that an entire Cut-valued
  power series has a 2nd-order difference quotient recovering its quadratic coefficient.
