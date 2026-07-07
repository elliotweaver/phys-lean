/-
  Phys.Algebra.CosmoDarkEnergyEquationOfState — N382 (arc-H H4).
  ============================================================================================
  DARK ENERGY `w = −1` / de SITTER SELF-SIMILARITY — mechanism grade.

  The late-time equation of state is `w = −1`, and the de Sitter endpoint is TIME-TRANSLATION
  SELF-SIMILAR ("always in the middle"). BOTH fall out of BANKED derived objects; NEITHER is
  posited, and the value of the coefficient `Λ` is NEVER touched (out of scope, never fit).

  ── THE TWO FOLD-NATIVE READINGS ──
  (1) `w = −1` FROM THE METRIC SIGNATURE. The banked cosmological term `Λ·g = Λ • sigOpC`
      (N357 `cosmoTerm_covDeriv_zero`, covariantly constant for ANY `Λ`) inherits the fold's
      own indefinite signature `sigOpC` (N56/N90): `sigOpC p = (p.1, −p.2.1, −p.2.2)` — `+1` on
      the timelike axis, `−1` on the spacelike axes. So the time-diagonal reading (the "density")
      is `+Λ` and the space-diagonal reading (the "pressure") is `−Λ`. Their ratio is `−1`. The
      equation of state `w = P/ρ = −1` is a ONE-LINE reading of the signature eigenvalues — NOT
      a posited property of a cosmological constant, NOT a ground-out vacuum stress computation.
      The ONE CAUSE is the fold's timelike/spacelike miss (the `(1,n)` signature) itself.
  (2) SELF-SIMILARITY FROM `cutExp_add`. The fold's own Born-positive exponential `cutExp`
      (N174) drives the exponential scale factor `a(t) = cutExp(H·t)`. Its homomorphism law
      `cutExp_add` (N174) IS the time-translation self-similarity: `a(t+Δ) = a(t)·a(Δ)`, so the
      ratio `a(t+Δ)/a(t) = a(Δ) = cutExp(H·Δ)` is EPOCH-INDEPENDENT. And `cutExp` is its own
      derivative (N369 `cutExp_scale_hasDerivAt`), so the logarithmic derivative `a'/a = H` is
      CONSTANT — a constant Hubble rate, constant proper event-horizon distance `1/H`, constant
      Gibbons–Hawking temperature. "Always in the middle" = the C6 eternal approach that never
      reaches a fixed point: the flow is exponential and self-similar at every epoch.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from banked N56/N90/N174/N357/N369) ──
    cosmoDensity_eq                    — the time-diagonal reading of `Λ·g` is `+Λ`.
    cosmoPressure_eq                   — the space-diagonal reading of `Λ·g` is `−Λ`.
    pressure_eq_neg_density            — ★★ `P = −ρ` (∀ Λ) — the signature flip.
    equationOfState_eq_neg_one         — ★★ `w = P/ρ = −1` (Λ ≠ 0) — the equation of state.
    w_neg_one_load_bearing             — ★ `P ≠ ρ` (Λ ≠ 0) — the signature is REAL (`w ≠ +1`, W8).
    cosmoStress_covariantly_constant   — `Λ·g` is covariantly constant (re-export of N357).
    scaleFactor_pos                    — `a(t) > 0` (Born positivity of `cutExp`).
    scaleFactor_self_similar           — ★★ `a(t+Δ) = a(t)·a(Δ)` — the homomorphism = self-similarity.
    scaleFactor_ratio_epoch_independent— ★★ `a(t+Δ)/a(t) = a(Δ)` — EPOCH-INDEPENDENT ratio.
    hubble_rate_constant               — ★ `a' = H·a` — the constant-rate derivative (N369).
    hubble_ratio_eq                    — ★ `a'/a = H` — the constant Hubble rate `1/H` (horizon/temp).
    dark_energy_de_sitter_structure    — ★★★ the capstone bundle.
    deSitter_grows                     — ★ NON-VACUITY (W8): `a` strictly grows for `H > 0`.

  ── GRADE ──
  MECHANISM / THEOREM for `w = −1` (signature reading) and the self-similarity (`cutExp_add` +
  the constant log-derivative). The COEFFICIENT `Λ` (the dark-energy scale) is NEVER derived or
  named here — the Λ VALUE is candidate/post-hoc even in the answer key; this node derives the
  MECHANISM/STRUCTURE only. NO empirical number (`Ω_Λ`, `Λ`, measured `w`) enters any statement
  or proof; such numbers are REMOVABLE PROSE only. Explicit NO-FIT: the Λ magnitude is out of scope.

  ── PHYSICS-WORDS-REMOVABLE ──
  Delete "dark energy / de Sitter / cosmological constant / equation of state / pressure /
  density / Hubble / horizon / temperature / self-similar": every theorem stands as pure
  statements about the diagonal readings of the scalar multiple `Λ • sigOpC` (ratio `−1` from the
  `(+1,−1,…)` signature), the homomorphism `cutExp(a+b) = cutExp a · cutExp b`, and its constant
  logarithmic derivative on the derived complete ordered field `Cut`. NO theorem STATEMENT needs a
  physics word; the names carry ZERO logical weight.

  ── UNBROKEN ──
  Built entirely on the banked `sigOpC`/`sigOpC_apply` (N90), `MetricEnd`/`STVC`
  (SpacetimeWeakFieldMetric), `cosmoTerm_covDeriv_zero` (N357), `cutExp`/`cutExp_add`/`cutExp_pos`
  (N174), `cutExp_scale_hasDerivAt`/`CutHasDerivAt` (N369), `cutExp_strictMono` (ContinuumLog), all
  over the derived ℝ `Cut`. NO Mathlib `Real` analysis / number-system as content. NO posited
  equation of state (`w = −1` is the signature ratio, PROVED); NO posited self-similarity (it is
  `cutExp_add`, PROVED); NO `Λ` value.
-/
import Phys.Algebra.SpacetimeCovariantDerivative
import Phys.Foundation.ContinuumExpDeriv
import Phys.Foundation.ContinuumLog

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

section

/-! ## (1) The cosmological term `Λ·g` and its diagonal readings. -/

/-- The cosmological term `Λ·g = Λ • sigOpC` — the banked covariantly-constant (N357) scalar
    multiple of the fold's own signature metric `sigOpC` (N90). -/
noncomputable def cosmoStress (Λ : Cut) : MetricEnd := Λ • sigOpC

/-- The TIME-diagonal reading of `Λ·g` (the "density") — evaluate on the timelike axis and take
    the timelike component. Because `sigOpC` fixes the timelike component (`+1`), this is `+Λ`. -/
noncomputable def cosmoDensity (Λ : Cut) : Cut := ((cosmoStress Λ) (1, 0, 0)).1

/-- The SPACE-diagonal reading of `Λ·g` (the "pressure") — evaluate on a spacelike axis and take
    the corresponding component. Because `sigOpC` negates spacelike components (`−1`), this is `−Λ`. -/
noncomputable def cosmoPressure (Λ : Cut) : Cut := ((cosmoStress Λ) (0, 1, 0)).2.1

/-- The exponential scale factor `a(t) = cutExp(H·t)` driven by the constant rate `H`. -/
noncomputable def scaleFactor (H t : Cut) : Cut := cutExp (H * t)

/-- The time-diagonal reading of `Λ·g` is `+Λ`: `sigOpC` fixes the timelike component. -/
theorem cosmoDensity_eq (Λ : Cut) : cosmoDensity Λ = Λ := by
  unfold cosmoDensity cosmoStress
  rw [LinearMap.smul_apply, sigOpC_apply]; simp

/-- The space-diagonal reading of `Λ·g` is `−Λ`: `sigOpC` negates the spacelike components. -/
theorem cosmoPressure_eq (Λ : Cut) : cosmoPressure Λ = -Λ := by
  unfold cosmoPressure cosmoStress
  rw [LinearMap.smul_apply, sigOpC_apply]; simp

/-- ★★ `P = −ρ` for ANY `Λ` — the signature flip. The space-diagonal reading is the NEGATIVE of
    the time-diagonal reading, because the fold's indefinite `(1,n)` signature `sigOpC` assigns
    OPPOSITE signs to the timelike and spacelike axes. This is the theory-native content of the
    dark-energy equation of state: pressure equals minus density, forced by the metric signature. -/
theorem pressure_eq_neg_density (Λ : Cut) : cosmoPressure Λ = - cosmoDensity Λ := by
  rw [cosmoPressure_eq, cosmoDensity_eq]

/-- ★★ THE EQUATION OF STATE `w = P/ρ = −1` (for `Λ ≠ 0`). A ONE-LINE reading of the signature
    eigenvalues `(+1, −1)` on the covariantly-constant `Λ·g` — NOT a posited property of the
    cosmological constant, NOT a ground-out vacuum-stress computation. The value of `Λ` is never
    used (it cancels): `w = (−Λ)/Λ = −1` whenever `Λ ≠ 0`. -/
theorem equationOfState_eq_neg_one (Λ : Cut) (hΛ : Λ ≠ 0) :
    cosmoPressure Λ / cosmoDensity Λ = -1 := by
  rw [cosmoPressure_eq, cosmoDensity_eq, neg_div, div_self hΛ]

/-- ★ NON-VACUITY (W8): the signature flip is REAL — `w ≠ +1`. For nonzero `Λ` the pressure
    `−Λ` GENUINELY DIFFERS from the density `+Λ` (else `2Λ = 0`, i.e. `Λ = 0`). A vacuous reading
    where pressure equalled density (`w = +1`, no signature) is refuted. -/
theorem w_neg_one_load_bearing (Λ : Cut) (hΛ : Λ ≠ 0) :
    cosmoPressure Λ ≠ cosmoDensity Λ := by
  rw [cosmoPressure_eq, cosmoDensity_eq]
  intro hc
  apply hΛ
  have h2 : (2 : Cut) * Λ = 0 := by linear_combination -hc
  rcases mul_eq_zero.mp h2 with h | hL
  · exact absurd h (by norm_num)
  · exact hL

/-- The cosmological term `Λ·g` is COVARIANTLY CONSTANT — the re-export of N357
    `cosmoTerm_covDeriv_zero` (the transport of the scaled metric variation cancels its
    derivative, from `η² = 1`). This anchors the equation-of-state readings on the SAME banked
    covariantly-constant `Λ·g` that the Lovelock `+Λg` classification forced. -/
theorem cosmoStress_covariantly_constant (Λ : Cut) (k : MetricEnd) :
    (Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0 :=
  (cosmoTerm_covDeriv_zero Λ k).2

/-! ## (2) De Sitter self-similarity: the exponential scale factor and its epoch-independence. -/

/-- The scale factor is strictly positive — Born positivity of the fold's own exponential
    (`cutExp_pos`, N174). -/
theorem scaleFactor_pos (H t : Cut) : 0 < scaleFactor H t := by
  unfold scaleFactor; exact cutExp_pos _

/-- ★★ TIME-TRANSLATION SELF-SIMILARITY: `a(t+Δ) = a(t)·a(Δ)`. This is EXACTLY the homomorphism
    law `cutExp_add` (N174) of the fold's own exponential — the scale factor over an interval
    depends only on the interval's LENGTH, never on the epoch. The de Sitter endpoint is
    self-similar under time translation. -/
theorem scaleFactor_self_similar (H t Δ : Cut) :
    scaleFactor H (t + Δ) = scaleFactor H t * scaleFactor H Δ := by
  unfold scaleFactor; rw [cutExp_add]; congr 1; ring

/-- ★★ THE RATIO IS EPOCH-INDEPENDENT: `a(t+Δ)/a(t) = a(Δ)`. The scale-factor ratio over an
    interval of length `Δ` is the SAME at every epoch `t` — "always in the middle." Directly from
    self-similarity and `a(t) ≠ 0`. -/
theorem scaleFactor_ratio_epoch_independent (H t Δ : Cut) :
    scaleFactor H (t + Δ) / scaleFactor H t = scaleFactor H Δ := by
  have hpos : scaleFactor H t ≠ 0 := ne_of_gt (scaleFactor_pos H t)
  rw [scaleFactor_self_similar, mul_div_cancel_left₀ _ hpos]

/-- ★ THE CONSTANT-RATE DERIVATIVE: `a'(t) = H·a(t)`. The scale factor is its own derivative up
    to the constant rate `H` — the constant Hubble rate. Directly from `cutExp_scale_hasDerivAt`
    (N369, the analytic fold `cutExp' = cutExp` pushed through the chain rule). -/
theorem hubble_rate_constant (H t : Cut) (hH : H ≠ 0) :
    CutHasDerivAt (scaleFactor H) (H * scaleFactor H t) t := by
  unfold scaleFactor; exact cutExp_scale_hasDerivAt H t hH

/-- ★ THE CONSTANT HUBBLE RATE: `a'/a = H` — the logarithmic derivative is the constant `H` at
    every epoch. So the proper event-horizon distance `1/H` is constant, and the Gibbons–Hawking
    temperature (`∝ H`) is constant. The endpoint is stationary in every intensive quantity. -/
theorem hubble_ratio_eq (H t : Cut) : (H * scaleFactor H t) / scaleFactor H t = H := by
  have hpos : scaleFactor H t ≠ 0 := ne_of_gt (scaleFactor_pos H t)
  rw [mul_div_cancel_right₀ _ hpos]

/-- ★ NON-VACUITY (W8): the de Sitter phase genuinely GROWS — for `H > 0` and `t₁ < t₂` the scale
    factor strictly increases (`cutExp_strictMono`, ContinuumLog). The self-similar flow is not the
    trivial constant/degenerate reading; it is a genuine expansion. -/
theorem deSitter_grows (H t₁ t₂ : Cut) (hH : 0 < H) (ht : t₁ < t₂) :
    scaleFactor H t₁ < scaleFactor H t₂ := by
  unfold scaleFactor
  apply cutExp_strictMono
  exact mul_lt_mul_of_pos_left ht hH

/-- ★★★ THE HEART bundled: dark energy `w = −1` and de Sitter self-similarity, both from the
    banked fold objects. Together: (i) `P = −ρ` and `w = P/ρ = −1` from the metric signature on the
    covariantly-constant `Λ·g`; (ii) time-translation self-similarity `a(t+Δ) = a(t)·a(Δ)` with the
    epoch-independent ratio and the constant log-derivative `H`. The dark-energy equation of state
    and the de Sitter stationarity are FORCED by the fold — the `(1,n)` signature and the
    exponential homomorphism — not posited; the `Λ` value stays out of scope. -/
theorem dark_energy_de_sitter_structure (Λ H t Δ : Cut) (hΛ : Λ ≠ 0) :
    (cosmoPressure Λ = - cosmoDensity Λ)
      ∧ (cosmoPressure Λ / cosmoDensity Λ = -1)
      ∧ (scaleFactor H (t + Δ) = scaleFactor H t * scaleFactor H Δ)
      ∧ (scaleFactor H (t + Δ) / scaleFactor H t = scaleFactor H Δ)
      ∧ ((H * scaleFactor H t) / scaleFactor H t = H) :=
  ⟨pressure_eq_neg_density Λ, equationOfState_eq_neg_one Λ hΛ,
   scaleFactor_self_similar H t Δ, scaleFactor_ratio_epoch_independent H t Δ,
   hubble_ratio_eq H t⟩

end

end Phys.Algebra
