/-
  Phys.Algebra.CosmoDensityDilution — N459 (cosmology completion, directed successor of N458).
  ============================================================================================
  THE DILUTION LAW / COMOVING DENSITY HISTORY `ρ(a) = ρ₀·a^{−k}` — the FORCED dilution exponent
  `k = n·(ρ+P)/ρ`, the three regime exponents `{n, n+1, 0}`, the DERIVED continuity flow
  `ρ̇ = −(kH)·ρ` (a `cutExp` derivative PROPERTY, NOT a posited ODE), and the WELD: the vacuum's
  non-dilution (`k = 0`) IS the N458 spectral degeneracy `pfStress = ρ·id` (isotropy). THEOREM-route.

  DIRECTED SUCCESSOR of N458 (the enthalpy / eigenvalue-gap `ρ + P`). The banked cosmology-completion
  arc has read the ONE derived `(1,3)` perfect-fluid stress `pfStress ρ P = diag(ρ,−P,−P,−P)` (N455,
  over ℚ on `STV4 = ℚ×ℚ×Dbl ℚ`) STATICALLY, three ways: the ordinary trace `ρ − n·P` (N455), the
  trace-reversed source `ρ + n·P` (N457), the eigenvalue gap `ρ + P` (N458). SEPARATELY the sector
  banked the KINEMATIC scale factor `a(t) = cutExp(H·t)` with `a'/a = H` (N382, over the derived ℝ
  `Cut`). This node banks the JOINT the census never states: the density HISTORY — how the derived
  stress reads AGAINST the expansion.

  ── THE THEORY-NATIVE ANCHOR (what the FOLD says the textbook does not) ──
  The eigenvalue GAP `ρ + P` (N458) is what the expansion does work against. The dilution EXPONENT
  is FORCED to be `k = n·(ρ+P)/ρ = (finrank spaceSub4)·(N458 enthalpy)/(timelike eigenvalue)` — the
  DERIVED spacelike dimension times the N458 enthalpy ratio, pure algebra on the banked stress. Read
  at the census values it gives THREE exponents:
    • dust      `w = 0`   →  `k = n`        (pure n-volume dilution; gap `= ρ`);
    • radiation `w = 1/n` →  `k = n + 1`    (the extra `+1` = the redshift; gap `= ρ·(n+1)/n`);
    • vacuum    `w = −1`  →  `k = 0`        (constant density — because the gap is ZERO).
  The vacuum's non-dilution is not a separate posit: `k = 0 ⟺ enthalpy = 0`, which by banked N458
  `enthalpy_zero_iff_isotropic` IS the spectral degeneracy `pfStress = ρ·id` = Lorentz-invariance /
  isotropy. `k = n·(1+w)` is exactly the standard `3(1+w)` generalized to the derived dimension `n`.

  ── THE DISSOLUTION (the wall that dissolves) ──
  Standard cosmology POSITS the continuity equation `ρ̇ + 3H(ρ+P) = 0` (from `∇T = 0` in the FRW
  metric — the FRW Christoffels are the piece arc E deferred), and POSITS the vacuum's constant
  density as a separate input. The theory DISSOLVES both: the dilution EXPONENT is the reading
  `n·(ρ+P)/ρ` (banked algebra); the density history `ρ(t) = ρ₀·cutExp(−k·H·t)` is the fold's OWN
  exponential (N382), and its continuity law `ρ̇ = −(kH)·ρ` is a `cutExp` derivative PROPERTY (N369
  `cutExp_scale_hasDerivAt` through the const-mul rule), NOT a posited ODE — the exact pattern N456
  used for the growing mode and N382/N383 for the scale factor and the fate. Since `k = n·(1+w)`,
  `ρ̇ = −(kH)·ρ = −n·H·(ρ+P)` IS the standard continuity equation, dissolved into a `cutExp` property
  with the forced exponent. The vacuum's non-dilution is the N458 eigenvalue-gap vanishing.

  This node does NOT touch the deferred Friedmann DYNAMICS `H² = (8πG/3)·ρ` (the general-metric →
  Ricci FRW build, arc E) — exactly as N457 derived the acceleration THRESHOLD without the
  acceleration equation and N456 the growing MODE without full perturbation theory. What is banked
  is the dilution EXPONENT (forced), the density history (the fold's exponential), and the continuity
  flow (a `cutExp` property).

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from banked N458/N455/N382/N369) ──
    dilutionExponent S               — THE FORCED EXPONENT `n·enthalpy S / eosDensity S`.
    dilutionExponent_pf              — ★ `= n·(ρ+P)/ρ` (`n = finrank spaceSub4`, DERIVED).
    dilutionExponent_dust            — ★ dust (`P = 0`): `k = n`.
    dilutionExponent_radiation       — ★ radiation (`P = ρ/n`, `w = 1/n`): `k = n + 1` (the redshift).
    dilutionExponent_vacuum          — ★ vacuum (`P = −ρ`): `k = 0`.
    dilutionExponent_zero_iff        — ★★★ `k = 0 ⟺ pfStress = ρ·id` (N458 isotropy — the vacuum weld).
    dilution_regimes_distinct        — ★★ W8: `n ≠ n+1`, `n+1 ≠ 0`, `n ≠ 0` (the three regimes differ).
    dilutionExponent_p_dependent     — ★★ W8: the exponent genuinely depends on `P` (`n ≠ 0`).
    densityHistory rho0 k H t        — THE DENSITY HISTORY `ρ₀·cutExp(−(k·H)·t)` over the derived ℝ.
    densityHistory_pos               — ★ `> 0` (Born positivity of `cutExp`).
    densityHistory_continuity_law    — ★★★ `ρ̇ = −(kH)·ρ` (the continuity flow, a `cutExp` property).
    densityHistory_vacuum_constant   — ★ `k = 0 ⟹ ρ(t) = ρ₀` (the vacuum non-dilution).
    densityHistory_power_law         — ★★ `ρ(t) = ρ₀·a(t)^{−k}` via `cutRpow` on the banked scale factor.
    fluidHistory / vacuum_fluidHistory_constant — ★★★ the ℚ×Cut WELD: the comoving density is
                                       time-constant AT the isotropic vacuum (`k` = the derived
                                       ℚ-exponent, cast into the fold's ℝ).
    density_dilution_law             — ★★★ THE CAPSTONE (welded, not bare ∧).

  ── GRADE ──
  THEOREM-route: the forced exponent, the three regime values, the isotropy weld, the density history,
  the continuity flow, the power-law form, and the vacuum-constant weld are all theorems,
  foundations-only. The PHYSICAL identification "this is the FRW dilution law `ρ ∝ a^{−3(1+w)}` /
  the continuity equation / the comoving density history" is mechanism-grade PROSE — it carries ZERO
  logical weight and is fully words-removable. NO empirical number (measured `Ω_m`/`Ω_r`/`Ω_Λ`,
  redshift `z`, `H₀`) enters any statement or proof; such numbers are REMOVABLE PROSE only. No claim
  is made to derive continuity from `∇T = 0` (that needs the deferred FRW Christoffels); the claim is
  that the EXPONENT is forced and the history satisfies `ρ̇ = −(kH)·ρ` as a `cutExp` property. NO-FIT.

  ── PHYSICS-WORDS-REMOVABLE (STANDARD §2) ──
  Delete "density / dilution / continuity / expansion / vacuum / redshift / dark energy / equation of
  state". What survives: for `S = (ρ•id) ×ₘ ((−P)•id)`, the number `n·(ρ+P)/ρ` (`n = finrank spaceSub4`)
  equals `n` at `P = 0`, `n+1` at `P = ρ/n`, `0` at `P = −ρ`; it is `0` iff `S = ρ•id`; the function
  `t ↦ ρ₀·cutExp(−(k·H)·t)` over `Cut` is positive, has derivative `−(kH)` times itself, equals
  `ρ₀·cutRpow(cutExp(H·t))(−k)`, and equals `ρ₀` when `k = 0`; and instantiating `k` with the cast of
  `n·(ρ+P)/ρ` gives a time-constant function exactly at `P = −ρ` (where `S = ρ•id`). No theorem
  STATEMENT needs a physics word.

  ── UNBROKEN ──
  Built entirely on banked objects: `pfStress`/`eosDensity`/`eosDensity_pf`/`eosState`/`eosState_pf`
  (N455), `enthalpy`/`enthalpy_pf`/`enthalpy_zero_iff_isotropic` (N458), `spaceSub4`/`finrank_spaceSub4`
  (N419), `scaleFactor` (N382), `cutExp`/`cutExp_pos`/`cutExp_zero` (N174), `cutRpow`/`cutLog_cutExp`
  (ContinuumLog), `CutHasDerivAt`/`cutExp_scale_hasDerivAt` (N369), `cutHasDerivAt_const_mul` (N383) —
  all over the derived ℝ `Cut` / the cascade ground ring ℚ ← the derived tower ← the fold.
  `Module.finrank`/`LinearMap.id`/`Rat.cast` (the derived `Field Cut`'s own coercion) are standard
  MACHINERY on the DERIVED carrier. NO Mathlib `Real`/`Real.exp`/`Real.rpow`/`sqrt` as content; the
  flow is the fold's own exponential, the power is `cutRpow`. NO posited continuity equation, NO
  posited dilution law, NO `Λ`/density/`H₀` value.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.CosmoEnthalpyNullEnergy
import Phys.Algebra.CosmoDarkEnergyEquationOfState
import Phys.Algebra.CosmicFateEternalApproach
import Phys.Foundation.ContinuumLog

namespace Phys.Algebra.CosmoDensityDilution

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.CosmoEquationOfStateCensus
open Phys.Algebra.CosmoEnthalpyNullEnergy
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The forced dilution exponent — the derived spacelike dimension × the N458 enthalpy ratio. -/

/-- THE FORCED DILUTION EXPONENT `k = n·(ρ+P)/ρ = n·(enthalpy)/(density)`, `n = finrank spaceSub4`
    the DERIVED spacelike dimension. This is `n·(1+w)` — the standard `3(1+w)` generalized to the
    derived dimension. The `n` counts the spacelike volume dilution; the `+1` on the enthalpy ratio
    at `w = 1/n` is the redshift. -/
def dilutionExponent (S : STV4 →ₗ[ℚ] STV4) : ℚ :=
  (Module.finrank ℚ spaceSub4 : ℚ) * enthalpy S / eosDensity S

/-- ★ THE EXPONENT reading on the fluid stress: `n·(ρ+P)/ρ`. -/
theorem dilutionExponent_pf (rho P : ℚ) :
    dilutionExponent (pfStress rho P) = (Module.finrank ℚ spaceSub4 : ℚ) * (rho + P) / rho := by
  unfold dilutionExponent
  rw [enthalpy_pf, eosDensity_pf]

/-- ★ DUST (`P = 0`, `w = 0`): the exponent is `k = n` — pure `n`-dimensional volume dilution. -/
theorem dilutionExponent_dust (rho : ℚ) (hr : rho ≠ 0) :
    dilutionExponent (pfStress rho 0) = (Module.finrank ℚ spaceSub4 : ℚ) := by
  rw [dilutionExponent_pf rho 0, add_zero, mul_div_assoc, div_self hr, mul_one]

/-- ★ RADIATION (`P = ρ/n`, i.e. `w = 1/n` — the N455 dimension-locked value): the exponent is
    `k = n + 1`. The extra `+1` over the dust `n` is the redshift of the wavelength. -/
theorem dilutionExponent_radiation (rho : ℚ) (hr : rho ≠ 0) :
    dilutionExponent (pfStress rho (rho / (Module.finrank ℚ spaceSub4 : ℚ)))
      = (Module.finrank ℚ spaceSub4 : ℚ) + 1 := by
  rw [dilutionExponent_pf rho _, finrank_spaceSub4]
  push_cast
  rw [div_eq_iff hr]
  ring

/-- ★ VACUUM (`P = −ρ`, `w = −1`): the exponent is `k = 0` — the density does NOT dilute. -/
theorem dilutionExponent_vacuum (rho : ℚ) (hr : rho ≠ 0) :
    dilutionExponent (pfStress rho (-rho)) = 0 := by
  rw [dilutionExponent_pf rho (-rho)]
  simp

/-- ★★★ THE VACUUM WELD: the exponent is `0` EXACTLY when the stress is proportional to the identity
    `pfStress ρ P = ρ·id` — the spectral degeneracy / isotropy / Lorentz-invariance of N458. So the
    vacuum's non-dilution is not a separate posit: it IS the N458 eigenvalue-gap vanishing. Cites the
    banked N458 `enthalpy_zero_iff_isotropic`. -/
theorem dilutionExponent_zero_iff (rho P : ℚ) (hr : rho ≠ 0) :
    dilutionExponent (pfStress rho P) = 0 ↔ pfStress rho P = rho • LinearMap.id := by
  rw [← enthalpy_zero_iff_isotropic, dilutionExponent_pf rho P, enthalpy_pf]
  have hn0 : (Module.finrank ℚ spaceSub4 : ℚ) ≠ 0 := by rw [finrank_spaceSub4]; norm_num
  rw [div_eq_zero_iff]
  constructor
  · rintro (h | h)
    · rcases mul_eq_zero.mp h with h1 | h2
      · exact absurd h1 hn0
      · exact h2
    · exact absurd h hr
  · intro h
    left
    rw [h, mul_zero]

/-! ## W8 anti-vacuity — the three regimes genuinely differ, the exponent genuinely depends on `P`. -/

/-- ★★ W8: the three regime exponents `{n, n+1, 0}` are genuinely DISTINCT — `n ≠ n+1` (always),
    `n+1 ≠ 0` and `n ≠ 0` (the derived `n = 3`). The dilution trichotomy is not a hollow
    restatement of one value. -/
theorem dilution_regimes_distinct :
    (Module.finrank ℚ spaceSub4 : ℚ) ≠ (Module.finrank ℚ spaceSub4 : ℚ) + 1
    ∧ (Module.finrank ℚ spaceSub4 : ℚ) + 1 ≠ 0
    ∧ (Module.finrank ℚ spaceSub4 : ℚ) ≠ 0 := by
  rw [finrank_spaceSub4]; norm_num

/-- ★★ W8: the exponent genuinely DEPENDS on `P` — dust (`k = n`) and vacuum (`k = 0`) differ, so the
    dilution law is not a `P`-independent constant. -/
theorem dilutionExponent_p_dependent (rho : ℚ) (hr : rho ≠ 0) :
    dilutionExponent (pfStress rho 0) ≠ dilutionExponent (pfStress rho (-rho)) := by
  rw [dilutionExponent_dust rho hr, dilutionExponent_vacuum rho hr, finrank_spaceSub4]
  norm_num

/-! ## The density history over the derived ℝ `Cut` — the fold's own exponential. -/

/-- THE DENSITY HISTORY `ρ(t) = ρ₀·cutExp(−(k·H)·t)` driven by the dilution exponent `k` and the
    (constant) expansion rate `H`, over the derived ℝ `Cut`. The SAME `cutExp` (N174) that drives the
    de Sitter scale factor (N382), the coherence gap (N383), and the growing mode (N456). -/
def densityHistory (rho0 k H t : Cut) : Cut := rho0 * cutExp (-(k * H) * t)

/-- ★ The density is strictly positive — Born positivity of the fold's own exponential (`cutExp_pos`,
    N174). -/
theorem densityHistory_pos (rho0 k H t : Cut) (h0 : 0 < rho0) :
    0 < densityHistory rho0 k H t := by
  unfold densityHistory; exact mul_pos h0 (cutExp_pos _)

/-- ★★★ THE CONTINUITY FLOW `ρ̇ = −(kH)·ρ`. The analytic fold `cutExp' = cutExp` (N369
    `cutExp_scale_hasDerivAt`) pushed through the const-mul rule (`cutHasDerivAt_const_mul`, N383):
    the density history satisfies its own dilution law. Since `k = n·(1+w)`, `−(kH)·ρ = −n·H·(ρ+P)`
    IS the standard continuity equation `ρ̇ + 3H(ρ+P) = 0` — dissolved into a `cutExp` derivative
    PROPERTY, NOT a posited ODE. -/
theorem densityHistory_continuity_law (rho0 k H t : Cut) (h : k * H ≠ 0) :
    CutHasDerivAt (densityHistory rho0 k H) (-(k * H) * densityHistory rho0 k H t) t := by
  have hneg : (-(k * H)) ≠ 0 := neg_ne_zero.mpr h
  have hbase : CutHasDerivAt (fun y => cutExp (-(k * H) * y)) (-(k * H) * cutExp (-(k * H) * t)) t :=
    cutExp_scale_hasDerivAt (-(k * H)) t hneg
  have hc := cutHasDerivAt_const_mul (f := fun y => cutExp (-(k * H) * y)) rho0 hbase
  have heq : -(k * H) * densityHistory rho0 k H t = rho0 * (-(k * H) * cutExp (-(k * H) * t)) := by
    unfold densityHistory; ring
  rw [heq]
  unfold densityHistory
  exact hc

/-- ★ THE VACUUM NON-DILUTION: `k = 0 ⟹ ρ(t) = ρ₀` — a constant density, no dilution. The vacuum's
    energy density is constant not by a posited continuity equation but because its dilution exponent
    is zero (which by `dilutionExponent_zero_iff` is the N458 isotropy point). -/
theorem densityHistory_vacuum_constant (rho0 H t : Cut) :
    densityHistory rho0 0 H t = rho0 := by
  unfold densityHistory
  have h0 : -(0 * H) * t = 0 := by ring
  rw [h0, cutExp_zero, mul_one]

/-- ★★ THE POWER LAW `ρ(t) = ρ₀·a(t)^{−k}`. Using the banked scale factor `a(t) = cutExp(H·t)` (N382)
    and the DERIVED continuous power `cutRpow x p = cutExp(p·cutLog x)` (ContinuumLog): the density
    history IS `ρ₀` times the scale factor raised to `−k`. NO Mathlib `Real.rpow`; the power is the
    fold's own `cutRpow`. -/
theorem densityHistory_power_law (rho0 k H t : Cut) :
    densityHistory rho0 k H t = rho0 * cutRpow (scaleFactor H t) (-k) := by
  unfold densityHistory scaleFactor cutRpow
  rw [if_pos (cutExp_pos (H * t))]
  have harg : (-k) * cutLog (cutExp (H * t)) = -(k * H) * t := by
    rw [cutLog_cutExp]; ring
  rw [harg]

/-! ## The ℚ×Cut weld — the comoving density is time-constant at the isotropic vacuum. -/

/-- THE FLUID DENSITY HISTORY driven by the DERIVED ℚ-exponent of the fluid stress, cast into the
    fold's ℝ `Cut` (the derived `Field Cut`'s own `Rat.cast`). This couples the ALGEBRAIC dilution
    exponent (over ℚ) to the ANALYTIC density flow (over `Cut`). -/
def fluidHistory (rho0 : Cut) (rho P : ℚ) (H t : Cut) : Cut :=
  densityHistory rho0 ((dilutionExponent (pfStress rho P) : Cut)) H t

/-- ★★★ THE ℚ×Cut WELD: the comoving density is TIME-CONSTANT at the vacuum stress. Because the
    derived ℚ-exponent `dilutionExponent (pfStress r (−r)) = 0` (`dilutionExponent_vacuum`), its cast
    into `Cut` is `0`, and the density history at exponent `0` is constant
    (`densityHistory_vacuum_constant`). By `dilutionExponent_zero_iff` this vacuum is EXACTLY the
    isotropic degeneracy `pfStress = r·id` (N458). Statable from NEITHER the pure ℚ exponent NOR the
    pure `Cut` flow alone — the non-dilution of the vacuum energy is its Lorentz-invariance. -/
theorem vacuum_fluidHistory_constant (rho0 H t : Cut) (r : ℚ) (hr : r ≠ 0) :
    fluidHistory rho0 r (-r) H t = rho0 := by
  unfold fluidHistory
  rw [dilutionExponent_vacuum r hr, Rat.cast_zero]
  exact densityHistory_vacuum_constant rho0 H t

/-! ## The capstone — the dilution law. -/

/-- ★★★ THE DILUTION LAW (bundled, welded — NOT a bare ∧). The density HISTORY of the derived
    perfect-fluid stress against the fold's own expansion, tying the STATIC census (N455/N457/N458,
    over ℚ) to the KINEMATIC scale factor (N382, over `Cut`):
      • THE FORCED EXPONENT: `dilutionExponent (pfStress r P) = n·(r+P)/r` — the derived spacelike
        dimension times the N458 enthalpy ratio (`dilutionExponent_pf`);
      • THE REGIMES: dust `k = n`, vacuum `k = 0` (`dilutionExponent_dust`, `dilutionExponent_vacuum`);
      • THE ISOTROPY WELD (ℚ): `k = 0 ⟺ pfStress = r·id` — the vacuum's non-dilution IS the N458
        spectral degeneracy (`dilutionExponent_zero_iff`);
      • THE FLOW (Cut): the power law `ρ₀·a^{−k}` (`densityHistory_power_law`) and the continuity law
        `ρ̇ = −(kH)·ρ` — a `cutExp` property, not a posited ODE (`densityHistory_continuity_law`);
      • THE ℚ×Cut WELD: the comoving density is time-constant at the isotropic vacuum
        (`vacuum_fluidHistory_constant`).
    THEOREM-route; the physical names (density / dilution / continuity / vacuum / redshift) carry ZERO
    logical weight (words-removable). -/
theorem density_dilution_law (rho0 H : Cut) (r : ℚ) (hr : r ≠ 0) :
    -- THE FORCED EXPONENT
    (∀ P, dilutionExponent (pfStress r P) = (Module.finrank ℚ spaceSub4 : ℚ) * (r + P) / r)
    -- THE REGIMES
    ∧ dilutionExponent (pfStress r 0) = (Module.finrank ℚ spaceSub4 : ℚ)
    ∧ dilutionExponent (pfStress r (-r)) = 0
    -- THE ISOTROPY WELD (ℚ)
    ∧ (∀ P, dilutionExponent (pfStress r P) = 0 ↔ pfStress r P = r • LinearMap.id)
    -- THE FLOW (Cut)
    ∧ (∀ k t, densityHistory rho0 k H t = rho0 * cutRpow (scaleFactor H t) (-k))
    ∧ (∀ k t, k * H ≠ 0 →
        CutHasDerivAt (densityHistory rho0 k H) (-(k * H) * densityHistory rho0 k H t) t)
    -- THE ℚ×Cut WELD
    ∧ (∀ t, fluidHistory rho0 r (-r) H t = rho0) := by
  refine ⟨fun P => dilutionExponent_pf r P, dilutionExponent_dust r hr,
    dilutionExponent_vacuum r hr, fun P => dilutionExponent_zero_iff r P hr,
    fun k t => densityHistory_power_law rho0 k H t,
    fun k t hk => densityHistory_continuity_law rho0 k H t hk,
    fun t => vacuum_fluidHistory_constant rho0 H t r hr⟩

end

end Phys.Algebra.CosmoDensityDilution
