# PREREG — N424 (arc-O O9): THE UNRUH / KMS-MODULAR WELD

## TARGET (theory-native, selected S1–S4, comments 369/370)
The acceleration–temperature tie, DERIVED as the co-occurrence of two banked modules that have
NEVER appeared in one theorem (grep-verified):
- N360 `SpacetimeHawkingTemperature` — the geometric Euclidean-period closure (`eucPlanePoint`,
  `eucPlane_closes` under one Born turn `azimuthalTurn=2·cutPi`, `eucPlane_half_turn_conical` W8,
  `hawkingPeriod κ = azimuthalTurn/κ`, `hawkingTemp κ = κ/(2·cutPi)`, `hawkingPeriod_smoothness`).
- N375 `MaxEntArrowOfTime` (Phys.Algebra.MaxEnt) — the C6-forced maxent/KMS equilibrium
  (`IsGibbsState q E β c := ∀i, cutLog qᵢ = −β·Eᵢ+c`, β=reciprocal-temperature; `boltzmann`,
  `boltzmann_isGibbs`: β≠0 equilibria exist on the derived ℝ).

THE WELD: an accelerated probe's orbit (angular coordinate `a·τ`, `a`=acceleration in κ's role) has
its imaginary-proper-time Euclidean section CLOSE with period `β = azimuthalTurn/a` (KMS periodicity,
= the SAME closure as N360 — Rindler horizon = BH horizon), and the equilibrium the probe reads is
EXACTLY the banked N375 Boltzmann/Gibbs (KMS) state at rate `β = azimuthalTurn/a`. One β: the
geometric closure period IS the statistical reciprocal-temperature. T_Unruh = a/(2·cutPi).

## MODULE / NAMESPACE
`Phys/Algebra/UnruhModularWeld.lean`, ns `Phys.Algebra.UnruhModularWeld`.
imports: `Phys.Algebra.SpacetimeHawkingTemperature`, `Phys.Algebra.MaxEntArrowOfTime`.

## DECLS (planned)
- `unruhPeriod (a) := hawkingPeriod a`  (= azimuthalTurn/a — the SAME closure, two horizons)
- `unruhPeriod_eq_hawkingPeriod`, `unruhPeriod_eq : = azimuthalTurn/a`
- `rindlerEucPoint ρ a τ := eucPlanePoint ρ (a*τ)`  (accelerated orbit, proper-time-parametrized)
- ★ `rindler_closes (ha:a≠0) : rindlerEucPoint ρ a (τ + unruhPeriod a) = rindlerEucPoint ρ a τ`
    (KMS periodicity in imaginary proper time — from eucPlane_closes + a·β=azimuthalTurn)
- ★ W8 `rindler_half_period_conical : rindlerEucPoint 1 1 cutPi ≠ rindlerEucPoint 1 1 0`
    (half the period does NOT close — the KMS period is the FULL turn; from eucPlane_half_turn_conical)
- `unruh_closure (ha:a≠0) : a * unruhPeriod a = azimuthalTurn`  (=hawkingPeriod_smoothness)
- `unruhTemp (a) := hawkingTemp a`;  `unruhTemp_eq : = a/(2·cutPi)`;  `unruhTemp_pos (0<a)`
- ★ `unruh_kms_equilibrium [NeZero n] (E a) : ∃c, IsGibbsState (boltzmann E (unruhPeriod a)) E (unruhPeriod a) c`
    (THE WELD: the probe's equilibrium is the banked N375 KMS state at the geometric rate)
- ★ `unruh_period_is_kms_rate` : (a·β=azimuthalTurn) ∧ (T=a/2cutPi) ∧ (∃c KMS state) — the ONE β
- ★★★ `unruh_modular_weld` (capstone) : closure ∧ W8-cone ∧ a·β=azimuthalTurn ∧ T=a/2cutPi
    ∧ (unruhPeriod=hawkingPeriod) ∧ (∃c KMS state)
- W8 `unruhTemp_two_ne_one : unruhTemp 2 ≠ unruhTemp 1`  (temperature genuinely acceleration-dependent)

## COSTUME C449 (next after C448)
`Counterexamples/UnruhModularWeldVacuityCostume.lean`. cFlag:=1 tied to
`rindler_half_period_conical` (half period ≠ closes) ∧ `unruhTemp_two_ne_one` (T depends on a).
`min 449 cFlag = 1` true; BOGUS `min 449 cFlag = 449` bites (1=449).

## GRADE (honest)
THEOREM-route for the closure/KMS-periodicity/T=a/2π/W8/the KMS-state weld. The "look-back IS the
modular flow (Tomita–Takesaki)" identification stays FLAGGED mechanism prose (docstring only, no
logical work). `a` (acceleration) a SYMBOLIC dimensionful anchor (G3); T_Unruh numeric value
removable prose (G2). unruhPeriod=hawkingPeriod is DEFINITIONAL (openly stated — Rindler=BH horizon,
same closure) — the NEW content is the τ-parametrized Rindler orbit periodicity + the N375 KMS weld.

## GUARDS
G1 no asserted value (T=a/2π, β=azimuthalTurn/a from banked azimuthalTurn/hawkingPeriod).
G2 no empirical number in proof. G3 derived not posited (period from banked closure; equilibrium
from banked boltzmann_isGibbs). G4 words-removable. G5 foundations-only ⊆{propext,Classical.choice,
Quot.sound}. ℝ-vigilance: derived Cut + banked cutCos/cutSin/cutPi/azimuthalTurn/hawkingPeriod/
cutExp/cutLog/boltzmann/IsGibbsState — NO Mathlib ℝ/ℂ as content. NOT free-floating: every TYPE
about the banked N360/N375 objects. W4.5: exactly O9, not O10.

## COST BUDGET / KILL
Pure Cut arithmetic + two direct instantiations of banked lemmas. Expect whole-file `lake env lean`
< 15s (both pillars already compiled). KILL any single obligation at 90s → measure/decompose.
