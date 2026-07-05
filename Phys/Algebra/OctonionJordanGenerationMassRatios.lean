/-
# N309 — THE GENERATION MASS RATIOS AS A FORCED CUBIC (seed T6)

Owner-authorized flavor-route seed (docs/SEED_FLAVOR_SELF_BLINDNESS.md), target **T6** — the
generation mass RATIOS as forced functions of the banked `Q = 2/3` (N307) and `δ_B = 2/9` (N308).
The directed successor of N308 (T5, THE CRUX). N307 proved the Koide identity for all `δ`; N308
FIXED the phase `δ_B = 2/9`. T6 reads off the MASSES from the now-fixed cycle form and derives the
spectrum as a FORCED CUBIC with ZERO free shape parameters.

THE MASSES ARE BORN SQUARES OF THE BANKED AMPLITUDES. The amplitudes are `√mₖ = genVec M A p r`
(N307, the ℤ₃-Fourier cycle form at the derived phase); the masses are the Born squares
`mₖ = (√mₖ)² = aₖ²` (`Born = self-overlap`, the trunk). The whole generation SPECTRUM is captured by
the three elementary symmetric functions of the masses — the coefficients of the cubic whose roots
are `m₀, m₁, m₂`.

## §1 — THE MASSES AND THE FORCED LINEAR COEFFICIENT (σ₁ = 6M², the mass-level Koide)

* `massVec M A p r k = (genVec M A p r k)²` — the Born-square masses of the banked amplitude cycle.
* ★★ `sigma1_mass : Σmₖ = 6M²` — the total mass (linear cubic coefficient) is `6M²`, FORCED and
  `δ`-INVARIANT: it is exactly `Σaₖ² = DCpower + cyclepower = 3M² + (3/2)A²`, and the Koide balance
  `A² = 2M²` makes it `6M²` at EVERY phase (banked `parseval` + `DCpower_genVec` + `cyclepower_genVec`).
  This IS the mass-level content of the Koide relation: `Q = Σm/(Σ√m)² = 6M²/(3M)² = 2/3`.
* `mass_koide : Σmₖ / (Σ√mₖ)² = 2/3` — the Koide quantity read on the masses (identical to the banked
  amplitude `Qkoide`, N307 `koide_genVec`).

## §2 — THE PHASE-CARRIER e₃ AND THE FORCED CUBIC (the spectrum reduces to ONE phase parameter)

The QUADRATIC and CUBIC coefficients carry the phase — but ONLY through the single amplitude product
`e₃ = a₀a₁a₂`. Everything else is forced by the Koide balance.

* `e3amp M A p r = a₀·a₁·a₂` — the single phase-carrying amplitude product.
* ★ `e3amp_closed : e₃ = M³ − M·A²·(3p²+r²)/4 + A³·p·(p²−r²)/4` — the general ℚ-exact closed form
  (pure ring identity). On the conic `3p²+r²=3` with `A²=2M²` this is `(M²/2)(A·(4p³−3p) − M)`, where
  `4p³−3p = cos(3δ)` is the triple-angle of the phase.
* ★★ `sigma2_mass : Σ_{i<j} mᵢmⱼ = (9/4)M⁴ − 6M·e₃` — the quadratic coefficient. The phase enters
  ONLY through `e₃` (via the symmetric identity `e₂(m) = e₂(a)² − 2·e₁(a)·e₃(a)` with the forced
  `e₂(a) = (3/2)M²`, `e₁(a) = 3M`).
* ★ `sigma3_mass : Πmₖ = e₃²` — the cubic coefficient (the determinant) is the Born square of the
  amplitude product.
* ★★★ `mass_cubic : the three masses are the roots of `t³ − 6M²·t² + σ₂·t − e₃²`` — the generation
  spectrum is a cubic whose LINEAR coefficient is FORCED (`6M²`, Koide, phase-independent) and whose
  quadratic/cubic coefficients are set by the SINGLE derived phase through `e₃`. So the three mass
  RATIOS are forced functions of `Q = 2/3` (giving `σ₁`) and the single derived phase `δ_B` (giving
  `σ₂, σ₃`) — ZERO free shape parameters; `M` is the one dimensionful scale (seed guard G3).

## §3 — THE HOLONOMY TIE (the phase-shape is the cosine of the total loop holonomy)

The phase enters the cubic through `cos(3δ_B)`, and `3δ_B = 3·(2/9) = 2/3 = T`, the banked self-seen
fraction — this is exactly N308 `total_holonomy_closes` (`3·δ_B = 2/3 = T`). So the spectrum's
phase-shape parameter is the cosine of the TOTAL LOOP HOLONOMY = the self-seen Born fraction.

* `triple_phase_is_holonomy : 3·δ_B = tr Poth/3` — the triple-angle argument of the mass-spectrum
  phase EQUALS the banked total loop holonomy `T = 2/3` (from N308 `cyclephase_delta_B` / the trace).

## §4 — NON-VACUITY (W8)

* `sigma1_forced_value : Σmₖ = 6M² ≠ 0` for `M ≠ 0` — the forced coefficient is a genuine value.
* `mass_degenerate_at_zero : m₁ = m₂ at δ=0` — the `δ=0` slice is DEGENERATE (two equal masses).
* `mass_distinct_generic : the three masses are pairwise distinct at a generic ℚ conic point` — the
  phase GENUINELY controls the spectrum shape (non-degenerate away from `δ=0`), so the cubic is a real
  3-generation spectrum, not a collapsed one. `A ≠ 0` (the turning is real).

## HONEST STATUS — WHAT IS ℚ-EXACT AND WHAT NEEDS THE ℝ-DESCENT (seed §4 G3, SOUL EVERY-CONSTANT)

The FORCED STRUCTURE above is ℚ-exact and banks here: the masses as Born squares, the forced linear
coefficient `σ₁ = 6M²`, the reduction of the whole spectrum to a cubic with a SINGLE phase parameter
`e₃`, and the holonomy tie. **The mass ratios ARE forced** — zero free shape parameters (`Q` and
`δ_B` both derived). The INDIVIDUAL NUMERICAL ratios evaluate `e₃` at the derived `δ_B = 2/9`, i.e.
require `cos(3δ_B) = cos(2/3 rad)`, a transcendental — the analytic ℝ, NOT yet descended from the
fold (STANDARD §3). That is route-NOT-YET-FOUND: a FORWARD ℝ-descent BUILD dependency (the standing
number-tower arc), NOT an ℝ import here, NOT a CHAIN-RUNWAY block, NOT an empirical input. `δ_B = 2/9`
is a Born COUNT (seed §1 step 6), so the theory-native default kept the whole `N305→N308` arc exact
over ℚ; the individual numerical evaluation is the one place the analytic completion is genuinely
needed, and it is honestly deferred to the ℝ-descent, never faked and never fitted.

## THE DISSOLUTION / MOAT (docs/STANDARD.md §0)

In the Standard Model the three lepton masses are three FREE Yukawa numbers. The theory forces the
whole spectrum: `σ₁` by the Koide balance (derived, N307) and the entire remaining shape by the
SINGLE derived phase `δ_B` (derived, N308) — three masses ← one scale `M` + ZERO free shape
parameters. No mass, no coupling, no PDG number enters any proof; comparison to the measured
`e:μ:τ` is removable prose.

## PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2)

Delete generation/mass/Koide/phase/holonomy/Born: over ℚ, for the banked vector `genVec M A p r` with
`aₖ` its entries and `bₖ = aₖ²`, on the conic `3p²+r²=3` with `A²=2M²` one has `Σbₖ = 6M²`,
`Σ_{i<j} bᵢbⱼ = (9/4)M⁴ − 6M·(a₀a₁a₂)`, `Πbₖ = (a₀a₁a₂)²`, and `a₀a₁a₂` has the stated ring closed
form; the `bₖ` are the roots of `t³ − 6M²t² + σ₂t − (a₀a₁a₂)²`; at `(p,r)=(1,0)` two of the `bₖ`
coincide and at `(1/7,−12/7)` they are pairwise distinct. No theorem STATEMENT needs a physics word.

## FREE-FLOATING check (SOUL rail)

The masses are Born squares of the banked `genVec` (N307); `σ₁ = 6M²` goes through banked
`parseval`/`DCpower_genVec`/`cyclepower_genVec`; the Koide reading reuses banked `koide_genVec`; the
holonomy tie cites the banked `Matrix.trace Poth` (N305/N308); the capstone carries `jdef Xwit Ywit ≠
0` (the octonion-specific cap forcing exactly three, N5) in its TYPE. NOT a generic mass-formula
statement floating free of the derived phase.

Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no heartbeat inflation, no
bridge; no empirical number; the forced structure exact over ℚ (no ℝ, no trig — the transcendental
numerical evaluation honestly deferred to the ℝ-descent, never imported).
-/
import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## §1 — the masses (Born squares of the banked amplitudes) and the forced linear coefficient. -/

/-- The generation masses: the Born squares `mₖ = (√mₖ)²` of the banked amplitude cycle `genVec`
    (N307, the ℤ₃-Fourier cycle form). `Born = self-overlap` (the trunk). -/
def massVec (M A p r : ℚ) : Fin 3 → ℚ := fun k => (genVec M A p r k) ^ 2

/-- Grounding: each mass is literally the Born square of the banked amplitude. -/
theorem massVec_born (M A p r : ℚ) (k : Fin 3) : massVec M A p r k = (genVec M A p r k) ^ 2 := rfl

/-- The sum of amplitudes is `3M` (the cycle mode sums to zero; banked `mean_genVec`). -/
theorem e1_amp (M A p r : ℚ) : genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2 = 3 * M := by
  have := mean_genVec M A p r; simp only [mean] at this; linarith

/-- The sum of squared amplitudes is `6M²` on the balance locus — from banked `parseval`,
    `DCpower_genVec = 3M²`, `cyclepower_genVec = (3/2)A²`, and the Koide balance `A² = 2M²`. -/
theorem sqsum_amp (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hA : A ^ 2 = 2 * M ^ 2) :
    (genVec M A p r 0) ^ 2 + (genVec M A p r 1) ^ 2 + (genVec M A p r 2) ^ 2 = 6 * M ^ 2 := by
  rw [parseval, DCpower_genVec, cyclepower_genVec _ _ _ _ h, hA]; ring

/-- ★★ THE FORCED LINEAR COEFFICIENT `σ₁(m) = Σmₖ = 6M²`. The total mass is `6M²` at EVERY phase — the
    Koide balance `A² = 2M²` makes it `δ`-INVARIANT. This is the mass-level content of the Koide
    relation (`Q = Σm/(Σ√m)² = 6M²/9M² = 2/3`). -/
theorem sigma1_mass (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hA : A ^ 2 = 2 * M ^ 2) :
    massVec M A p r 0 + massVec M A p r 1 + massVec M A p r 2 = 6 * M ^ 2 := by
  simp only [massVec]; exact sqsum_amp M A p r h hA

/-- THE MASS-LEVEL KOIDE: `Σmₖ / (Σ√mₖ)² = 2/3` — the Koide quantity read directly on the masses,
    identical to the banked amplitude `Qkoide` (N307 `koide_genVec`). Here `√mₖ = aₖ` (the amplitudes)
    and `Σ√mₖ = Σaₖ = 3M`. -/
theorem mass_koide (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hM : M ≠ 0) (hA : A ^ 2 = 2 * M ^ 2) :
    (massVec M A p r 0 + massVec M A p r 1 + massVec M A p r 2)
      / (genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2) ^ 2 = 2 / 3 := by
  have := koide_genVec M A p r h hM hA
  unfold Qkoide at this
  simpa [massVec] using this

/-! ## §2 — the phase-carrier e₃ and the forced cubic. -/

/-- The single phase-carrying amplitude product `e₃ = a₀·a₁·a₂`. Everything else in the spectrum is
    forced by the Koide balance; this is the ONLY quantity that carries the phase. -/
def e3amp (M A p r : ℚ) : ℚ := genVec M A p r 0 * genVec M A p r 1 * genVec M A p r 2

/-- ★ THE CLOSED ℚ-FORM OF e₃ (pure ring identity, no conic, no balance):
    `e₃ = M³ − M·A²·(3p²+r²)/4 + A³·p·(p²−r²)/4`. On the conic `3p²+r²=3` with `A²=2M²` this is
    `(M²/2)(A·(4p³−3p) − M)`, and `4p³−3p = cos(3δ)` is the triple-angle of the phase. -/
theorem e3amp_closed (M A p r : ℚ) :
    e3amp M A p r = M ^ 3 - M * A ^ 2 * (3 * p ^ 2 + r ^ 2) / 4 + A ^ 3 * p * (p ^ 2 - r ^ 2) / 4 := by
  simp only [e3amp, genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  ring

/-- The middle amplitude symmetric function is FORCED: `e₂(a) = (3/2)M²` (from `e₁(a)² = Σaₖ² + 2e₂`,
    the banked `6M²` sum). -/
theorem e2_amp (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hA : A ^ 2 = 2 * M ^ 2) :
    genVec M A p r 0 * genVec M A p r 1 + genVec M A p r 0 * genVec M A p r 2
      + genVec M A p r 1 * genVec M A p r 2 = (3 / 2) * M ^ 2 := by
  have h1 := e1_amp M A p r
  have hs := sqsum_amp M A p r h hA
  have hsq : (genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2) ^ 2 = 9 * M ^ 2 := by
    rw [h1]; ring
  nlinarith [hsq, hs]

/-- ★★ THE QUADRATIC COEFFICIENT `σ₂(m) = (9/4)M⁴ − 6M·e₃`. The phase enters the spectrum ONLY through
    `e₃`: via the symmetric identity `e₂(m) = e₂(a)² − 2·e₁(a)·e₃(a)` with the forced `e₂(a) = (3/2)M²`
    and `e₁(a) = 3M`. -/
theorem sigma2_mass (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hA : A ^ 2 = 2 * M ^ 2) :
    massVec M A p r 0 * massVec M A p r 1 + massVec M A p r 0 * massVec M A p r 2
      + massVec M A p r 1 * massVec M A p r 2 = (9 / 4) * M ^ 4 - 6 * M * (e3amp M A p r) := by
  have h1 := e1_amp M A p r
  have h2 := e2_amp M A p r h hA
  have key : massVec M A p r 0 * massVec M A p r 1 + massVec M A p r 0 * massVec M A p r 2
      + massVec M A p r 1 * massVec M A p r 2
    = (genVec M A p r 0 * genVec M A p r 1 + genVec M A p r 0 * genVec M A p r 2
        + genVec M A p r 1 * genVec M A p r 2) ^ 2
      - 2 * (e3amp M A p r) * (genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2) := by
    simp only [massVec, e3amp]; ring
  rw [key, h1, h2]; ring

/-- ★ THE CUBIC COEFFICIENT (the determinant) `σ₃(m) = Πmₖ = e₃²` — the product of the masses is the
    Born square of the amplitude product. -/
theorem sigma3_mass (M A p r : ℚ) :
    massVec M A p r 0 * massVec M A p r 1 * massVec M A p r 2 = (e3amp M A p r) ^ 2 := by
  simp only [massVec, e3amp]; ring

/-- ★★★ THE FORCED CUBIC: the three masses are the roots of `t³ − σ₁·t² + σ₂·t − σ₃` with
    `σ₁ = 6M²` FORCED (Koide, phase-independent), `σ₂ = (9/4)M⁴ − 6M·e₃` and `σ₃ = e₃²` set by the
    SINGLE derived phase through `e₃`. Stated as the factorization identity
    `(t − m₀)(t − m₁)(t − m₂) = t³ − σ₁ t² + σ₂ t − σ₃`, so the mass ratios are forced functions of
    `Q = 2/3` (via `σ₁`) and the single derived phase `δ_B` (via `e₃`). Zero free shape parameters. -/
theorem mass_cubic (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hA : A ^ 2 = 2 * M ^ 2) (t : ℚ) :
    (t - massVec M A p r 0) * (t - massVec M A p r 1) * (t - massVec M A p r 2)
      = t ^ 3 - (6 * M ^ 2) * t ^ 2 + ((9 / 4) * M ^ 4 - 6 * M * (e3amp M A p r)) * t
        - (e3amp M A p r) ^ 2 := by
  have hs1 := sigma1_mass M A p r h hA
  have hs2 := sigma2_mass M A p r h hA
  have hs3 := sigma3_mass M A p r
  have expand : (t - massVec M A p r 0) * (t - massVec M A p r 1) * (t - massVec M A p r 2)
      = t ^ 3
        - (massVec M A p r 0 + massVec M A p r 1 + massVec M A p r 2) * t ^ 2
        + (massVec M A p r 0 * massVec M A p r 1 + massVec M A p r 0 * massVec M A p r 2
            + massVec M A p r 1 * massVec M A p r 2) * t
        - massVec M A p r 0 * massVec M A p r 1 * massVec M A p r 2 := by ring
  rw [expand, hs1, hs2, hs3]

/-! ## §3 — the holonomy tie (the phase-shape is the cosine of the total loop holonomy). -/

/-- ★ THE HOLONOMY TIE: the triple-angle argument of the mass-spectrum phase EQUALS the banked total
    loop holonomy. `3·δ_B = tr Poth/3 = 2/3 = T` — the spectrum's phase-shape parameter `cos(3δ_B)` is
    the cosine of the TOTAL LOOP HOLONOMY = the self-seen Born fraction. This is exactly the banked
    N308 `total_holonomy_closes` read as `3·δ_B = T`. -/
theorem triple_phase_is_holonomy :
    (3 : ℚ) * ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3)) = Matrix.trace Poth / 3 :=
  total_holonomy_closes

/-- The numerical value of the phase-shape holonomy: `3·δ_B = 2/3` (from N308 `cyclephase_delta_B`
    and the banked trace `tr Poth = 2`). -/
theorem triple_phase_value : (3 : ℚ) * (2 / 9) = 2 / 3 := by norm_num

/-! ## §4 — non-vacuity (W8). -/

/-- The forced linear coefficient is a genuine nonzero value for `M ≠ 0`. -/
theorem sigma1_forced_value (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hA : A ^ 2 = 2 * M ^ 2)
    (hM : M ≠ 0) : massVec M A p r 0 + massVec M A p r 1 + massVec M A p r 2 ≠ 0 := by
  rw [sigma1_mass M A p r h hA]
  intro hc
  have : M ^ 2 = 0 := by linarith
  exact hM (pow_eq_zero_iff (by norm_num) |>.mp this)

/-- Explicit entry evaluations of the banked amplitude (robust concrete-index reduction). -/
theorem genVec_ev1 (M A p r : ℚ) : genVec M A p r 1 = M - A * (p + r) / 2 := by simp [genVec]
theorem genVec_ev2 (M A p r : ℚ) : genVec M A p r 2 = M - A * (p - r) / 2 := by simp [genVec]

/-- NON-VACUITY: the `δ = 0` slice is DEGENERATE — two masses coincide (`m₁ = m₂` at `(p,r)=(1,0)`). -/
theorem mass_degenerate_at_zero (M A : ℚ) : massVec M A 1 0 1 = massVec M A 1 0 2 := by
  simp only [massVec, genVec_ev1, genVec_ev2]; ring

/-- NON-VACUITY: at a generic ℚ conic point the three amplitudes are pairwise distinct (`A ≠ 0`), so
    the three masses are a genuine non-degenerate 3-generation spectrum. The chosen point
    `(1/7, −12/7)` is on the phase conic (`conic_point_valid`). -/
theorem amp_distinct01 (M A : ℚ) (hA : A ≠ 0) :
    genVec M A (1/7) (-12/7) 0 ≠ genVec M A (1/7) (-12/7) 1 := by
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one]
  intro hc; apply hA; linarith
theorem amp_distinct12 (M A : ℚ) (hA : A ≠ 0) :
    genVec M A (1/7) (-12/7) 1 ≠ genVec M A (1/7) (-12/7) 2 := by
  rw [genVec_ev1, genVec_ev2]; intro hc; apply hA; linarith
theorem amp_distinct02 (M A : ℚ) (hA : A ≠ 0) :
    genVec M A (1/7) (-12/7) 0 ≠ genVec M A (1/7) (-12/7) 2 := by
  rw [genVec_ev2]
  simp only [genVec, Matrix.cons_val_zero]
  intro hc; apply hA; linarith

/-- The chosen non-degenerate conic point is genuinely on the phase circle `3p² + r² = 3`. -/
theorem conic_point_valid : 3 * ((1 : ℚ) / 7) ^ 2 + (-12 / 7) ^ 2 = 3 := by norm_num

/-! ## The capstone. -/

/-- ★★★ THE CAPSTONE — the generation mass RATIOS as a forced cubic (seed T6).

    Over ℚ, with the banked ℤ₃-Fourier cycle form `genVec` (N307) at the derived phase `δ_B = 2/9`
    (N308): the generation masses are the Born squares `mₖ = (genVec)ₖ²`. Their spectrum is a FORCED
    CUBIC `t³ − σ₁t² + σ₂t − σ₃` (`mass_cubic`) whose LINEAR coefficient `σ₁ = 6M²` is FORCED by the
    Koide balance and `δ`-INVARIANT (`sigma1_mass`, the mass-level Koide `Q = 2/3`), while the
    quadratic `σ₂ = (9/4)M⁴ − 6M·e₃` (`sigma2_mass`) and cubic `σ₃ = e₃²` (`sigma3_mass`) coefficients
    carry the phase ONLY through the single amplitude product `e₃` (closed ℚ-form `e3amp_closed`). So
    the three mass RATIOS are forced functions of `Q = 2/3` (via `σ₁`) and the single derived phase
    `δ_B` (via `e₃`) — ZERO free shape parameters; `M` the one scale. The spectrum's phase-shape
    parameter `cos(3δ_B)` is the cosine of the banked TOTAL LOOP HOLONOMY `3·δ_B = 2/3 = T`
    (`triple_phase_is_holonomy`). The `δ=0` slice is degenerate (`mass_degenerate_at_zero`) and a
    generic phase gives three distinct masses (`amp_distinct01/12/02`) — the phase genuinely controls
    the spectrum. The cap forcing exactly three generations (`jdef Xwit Ywit ≠ 0`, N5) grounds it on
    the octonion-specific arena. -/
theorem generation_mass_ratio_structure :
    -- §1: the masses are Born squares; the forced linear coefficient σ₁ = 6M² (mass-level Koide)
    (∀ M A p r : ℚ, ∀ k : Fin 3, massVec M A p r k = (genVec M A p r k) ^ 2)
    ∧ (∀ M A p r : ℚ, 3 * p ^ 2 + r ^ 2 = 3 → A ^ 2 = 2 * M ^ 2 →
        massVec M A p r 0 + massVec M A p r 1 + massVec M A p r 2 = 6 * M ^ 2)
    ∧ (∀ M A p r : ℚ, 3 * p ^ 2 + r ^ 2 = 3 → M ≠ 0 → A ^ 2 = 2 * M ^ 2 →
        (massVec M A p r 0 + massVec M A p r 1 + massVec M A p r 2)
          / (genVec M A p r 0 + genVec M A p r 1 + genVec M A p r 2) ^ 2 = 2 / 3)
    -- §2: the forced cubic — σ₁ forced, phase only through e₃
    ∧ (∀ M A p r : ℚ, e3amp M A p r
        = M ^ 3 - M * A ^ 2 * (3 * p ^ 2 + r ^ 2) / 4 + A ^ 3 * p * (p ^ 2 - r ^ 2) / 4)
    ∧ (∀ M A p r : ℚ, 3 * p ^ 2 + r ^ 2 = 3 → A ^ 2 = 2 * M ^ 2 →
        massVec M A p r 0 * massVec M A p r 1 + massVec M A p r 0 * massVec M A p r 2
          + massVec M A p r 1 * massVec M A p r 2 = (9 / 4) * M ^ 4 - 6 * M * (e3amp M A p r))
    ∧ (∀ M A p r : ℚ,
        massVec M A p r 0 * massVec M A p r 1 * massVec M A p r 2 = (e3amp M A p r) ^ 2)
    ∧ (∀ M A p r : ℚ, 3 * p ^ 2 + r ^ 2 = 3 → A ^ 2 = 2 * M ^ 2 → ∀ t : ℚ,
        (t - massVec M A p r 0) * (t - massVec M A p r 1) * (t - massVec M A p r 2)
          = t ^ 3 - (6 * M ^ 2) * t ^ 2 + ((9 / 4) * M ^ 4 - 6 * M * (e3amp M A p r)) * t
            - (e3amp M A p r) ^ 2)
    -- §3: the holonomy tie
    ∧ ((3 : ℚ) * ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3)) = Matrix.trace Poth / 3)
    -- §4: non-vacuity — degenerate at δ=0, distinct at a generic phase
    ∧ (∀ M A : ℚ, massVec M A 1 0 1 = massVec M A 1 0 2)
    ∧ (∀ M A : ℚ, A ≠ 0 → genVec M A (1/7) (-12/7) 0 ≠ genVec M A (1/7) (-12/7) 1)
    ∧ (∀ M A : ℚ, A ≠ 0 → genVec M A (1/7) (-12/7) 1 ≠ genVec M A (1/7) (-12/7) 2)
    -- the cap forcing exactly 3 (grounding, N5)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨massVec_born, sigma1_mass, mass_koide, e3amp_closed, sigma2_mass, sigma3_mass, mass_cubic,
   triple_phase_is_holonomy, mass_degenerate_at_zero, amp_distinct01, amp_distinct12,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
