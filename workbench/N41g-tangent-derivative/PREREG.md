# N41g — PREREG (frozen before compute)

## Target
`d/dt exp(tD)|₀ = D` over the DERIVED ℝ `ContinuumQ.Cut`, the TANGENT half completing
`Der(𝕆) → Aut(𝕆)`. Trunk-native `Tendsto` of the difference quotient, NOT Mathlib `HasDerivAt`.

The headline statement (coordinate-free, over `O Cut`):
```
theorem expO_tangent (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Filter.Tendsto (fun t : Cut => t⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x))
      (𝓝[≠] (0:Cut)) (𝓝 (D' x))
```

## The reduction (clean, no new analysis on the non-associative product)
1. coordOCut (continuous `≃ₗ[Cut]`, banked N41d) transports the O Cut Tendsto to a `Fin 8 → Cut`
   Tendsto. coordOCut commutes with `t⁻¹ • (· - ·)` (linearity).
2. `coordOCut (expO (t•D') x) = expMap (derivMatrix (t•D')) *ᵥ coordOCut x` (banked N41f
   `coordOCut_expO`); `derivMatrix (t•D') = t • derivMatrix D'` (HOMOGENEITY lemma, analogue of
   banked `derivMatrix_neg`). Target `coordOCut (D' x) = derivMatrix D' *ᵥ coordOCut x` (banked
   `expO_matrix_rep` at n=1).
3. Reduces to the MATRIX/VECTOR statement `Tendsto (t ↦ t⁻¹ • (expMap(t•M) *ᵥ v − v)) (𝓝[≠]0)
   (𝓝 (M *ᵥ v))`. Per-coordinate (`tendsto_pi_nhds`) + finite sum (`tendsto_finset_sum`,
   `Matrix.one_mulVec` to write `v_i = ∑_j 1_{ij} v_j`) reduces to the ENTRYWISE scalar derivative.
4. ENTRYWISE: `(expMap(t•M))_{ij} = ∑'_n (t^n/n!)·(M^n)_{ij}` (entry-proj commutes with tsum;
   `(t•M)^n = t^n • M^n` via `smul_pow`). Setting `a_n := (M^n)_{ij}/n!`, this is `∑'_n t^n a_n`,
   the SCALAR POWER SERIES with `a_0 = 1_{ij}`, `a_1 = M_{ij}`.

## The genuine W1 BUILD core (our library lacks it — BUILD, don't panic)
The banked Cut-limit infra is SEQUENCE-only (atTop over ℕ). NO continuous-parameter `𝓝[≠]0`
function-limit / remainder-tail-squeeze. BUILD it trunk-native over the derived ℝ:

THE SCALAR POWER SERIES DERIVATIVE AT 0 (the analytic crown of this node), hypothesis = ENTIRE
(radius ∞, exactly the exp setting): `∀ ρ ≥ 0, Summable (fun n => |a n| * ρ^n)`.
```
theorem cut_powerseries_deriv (a : ℕ → Cut) (hmaj : ∀ ρ : Cut, 0 ≤ ρ → Summable (fun n => |a n| * ρ^n)) :
    Tendsto (fun t => t⁻¹ * ((∑' n, t^n * a n) - a 0)) (𝓝[≠] (0:Cut)) (𝓝 (a 1))
```
Proof skeleton (region `|t| ≤ 1`):
- `f(t) := ∑' n, t^n a_n` summable (compare `|t^n a_n| ≤ |a_n|`, ρ=1 majorant).
- `R(t) := ∑' n, t^n a_{n+2}` summable; `|R(t)| ≤ C := ∑' n, |a_{n+2}|` (|t|^n ≤ 1, abs_tsum_le).
- DECOMP `f(t) = a_0 + a_1 t + t² R(t)` via `tsum_eq_zero_add` ×2 + `tsum_mul_left`.
- `t⁻¹(f(t)-a_0) - a_1 = t·R(t)` (t≠0); `|t R(t)| ≤ C|t|`; SQUEEZE → 0.

SUPPORT LEMMAS to bank:
- `cut_abs_tsum_le_tsum_abs` : `Summable f → |∑' f| ≤ ∑' |f|` (abs_le + tsum_le_tsum twice).
- `cut_tendsto_zero_of_abs_le` : `Tendsto u l (𝓝 0) → (∀ᶠ t, |h t| ≤ u t) → Tendsto h l (𝓝 0)`
   (the SQUEEZE: `tendsto_of_tendsto_of_tendsto_of_le_of_le'` over OrderTopology Cut, `-u ≤ h ≤ u`).

## Files (decompose; bank-as-you-go W9.8)
- File A `Phys/Foundation/ContinuumScalarDeriv.lean` (Foundation): the scalar power series
  derivative + squeeze + abs_tsum. Pure Cut analysis, reusable, self-contained.
- File B `Phys/Algebra/DerivationOTangent.lean` (Algebra): derivMatrix homogeneity + entrywise
  `(expMap(t•M))_{ij}` power series + the O Cut assembly `expO_tangent`.

## GO / NO-GO / KILL
- GO: build File A (scalar core) first; the moment `cut_powerseries_deriv` compiles clean, BANK it
  (commit) before File B. Then File B.
- KILL per obligation: 60s. If any single obligation exceeds 60s → MEASURE/DECOMPOSE/reframe, never
  inflate maxHeartbeats. No brute ring/decide/simp on expanded coordinates anywhere (this node is
  analytic plumbing — no monolithic normalizer is needed; if one appears, the framing is wrong).
- TURN CHECKPOINT: at ~55% of turn budget, STOP new work; FINALIZE (commit what compiles + child
  remainder if File B incomplete + LEDGER/ROADMAP). NEVER run out of turns mid-task.
- If File B's analytic lift proves genuinely hard after measure+reframe → child a dedicated W1
  dissolution node onto the chain tail and block, banking File A.

## Anti-vacuity (W8) — costume C69
A WRONG derivative-at-0 MUST fail to compile: e.g. `d/dt exp(tD)|₀ = 2•(D x)` or `= 0` or
`= D(D x)` (a_2 not a_1). Reuse banked `expO`/`coordOCut_expO`/`expMap`/`derivMatrix`/`Cut` — NEVER
a fresh table. Physics-words-removable: delete exp/gauge/G₂/colour/derivation/automorphism → the
theorem is a complete proof that the derivative at 0 of the one-parameter flow `t ↦ ∑(tⁿ/n!)•(Dⁿ x)`
of a linear endomorphism D of the 8-dim complete-topological vector space over the derived ℝ is D x.

## Content-trap guard (STANDARD §3)
NO `import Mathlib.Data.Real`. NO ℝ-valued Norm/Metric on Cut. NO Mathlib `HasDerivAt`/`deriv`/
`fderiv`/`NormedField`/`NormedSpace`. The derivative is the trunk-native `Tendsto` over the banked
N34 OrderTopology / N36 UniformSpace. `Tendsto`/`nhds`/`nhdsWithin`/`Filter`/`tsum`/`Matrix` are
MACHINERY on the DERIVED `Cut`.
