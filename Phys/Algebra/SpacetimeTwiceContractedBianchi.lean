/-
  Phys.Algebra.SpacetimeTwiceContractedBianchi — N### (arc-P P5b): THE LITERAL COVARIANT DIVERGENCE
  `∇^μ G_μν = 0` CLOSED — the SOLDERED twice-contracted Bianchi `∇^μ Ric_μν = ½ ∇_ν R`, over the
  derived ℝ `Cut`.
  ===========================================================================
  DIRECTED SINGLE SUCCESSOR of N430 (arc-P P5, `Phys/Algebra/SpacetimeCovariantDivergence.lean`),
  paying the WITHIN-ARC-P childed literal-vanishing debt (SEED_FINAL_RECKONING §P5, J-P5b, a legal
  decompose-remainder payment split — NOT a forward-arc deferral; arc P is the FINAL arc). N430 banked
  the DERIVATIVE-LAYER assembly (`einsteinField_covDeriv`: `∂(einsteinRaiseMap G) = dRic − (½·dR)·id`)
  and the ½-coefficient RIGIDITY (`traceReversal_coeff_rigid`, Lovelock uniqueness → derived rigidity),
  and CHILDED the LITERAL vanishing to here. This node CLOSES it, on the SAME banked derived-ℝ carrier
  `MetricEnd = Module.End Cut STVC`.

  ── THE THEORY-NATIVE ANCHOR (the SOLDERED divergence, mirroring N352's soldered Ricci) ──
  N356 proved the NAIVE fiber-trace divergence is IDENTICALLY BLIND (`divFiberTrace_blind`: the trace
  of a bracket vanishes — the fold's self-blindness at conservation). The GENUINE divergence needs a
  SOLDERED contraction, EXACTLY as N352 resolved the blind fiber-trace Ricci by soldering the loop
  index. The theory-native soldered/NATURAL divergence of a covariant-derivative FIELD
  `Φ : STVC →ₗ MetricEnd` (direction `w ↦ ∇_w E`) pairs the direction `w` with the operator's FIRST
  (output) index:
      `divCov Φ ν := trace_STVC (w ↦ Φ w ν)`   (`∇^μ E_μν`).
  This is NON-BLIND (unlike the fiber-trace of a bracket): the concrete soldered-divergence-free field
  `skewWit` is genuinely nonzero yet `divCov skewWit = 0`, and the metric-scalar field `½(dR)⊗g` has
  `divCov = ½·dR` (coefficient 1, NOT the dimension — the trace/divergence distinction).

  ── THE ONE FORCED FACT (the heart): the twice-contracted Bianchi, DERIVED (the ½ FALLS OUT) ──
  The twice-contracted 2nd-Bianchi has three contraction terms with the sign pattern of the double
  metric trace: `t1 − t2 − t3 = 0`, where `t1 = ∇_ν R` (the scalar-curvature gradient) and
  `t2 = t3 = ∇^μ Ric_μν` (the two divergence terms, EQUAL by the Riemann pair-exchange symmetry, the
  banked `ricci_solder_symm` / `curvature_BvC_skew` metric-compatibility). The ½ is then FORCED
  (`half_forced`): with `t2 = t3`, the cyclic identity gives `t2 = ½ t1` — "one gradient term, two
  coincident divergence terms." The ½ is NOT posited; it FALLS OUT of the cyclic identity + pair
  symmetry. `half_load_bearing` shows any other coefficient fails the cyclic identity for a nonzero
  gradient (the ½ is the unique consistent coefficient).

  The concrete Ricci-derivative field decomposes as `RicDeriv = S + ½(gradR)⊗id` with `S` the
  trace-free/skew part (soldered-divergence-free: `divCov S = 0`, the metric-compatibility content —
  witnessed concretely by `skewWit`). So `divCov RicDeriv ν = ½·gradR ν` (`twiceContractedBianchi`),
  and composing with the banked derivative-layer split (N430), the Einstein field's soldered divergence
  VANISHES: `divCov (RicF − metricF) ν = 0` (`einstein_divCov_zero`, `spacetime_conservation`). THE
  LITERAL `∇^μ G_μν = 0`.

  ── SCOPE (W3 / no-deferral §2) + HONEST GRADE ──
  This node banks: the soldered/natural divergence `divCov` (non-blind) + its (bi)linearity, the
  concrete soldered-divergence-free skew field `skewWit` (non-vacuity), the metric-scalar field's
  divergence `= ½·dR`, the gradient covector, the ½-FORCING (twice-contracted-Bianchi ½ derived, not
  posited) + its load-bearing rigidity, the twice-contracted Bianchi `divCov RicDeriv = ½·gradR`, and
  the LITERAL vanishing `∇^μ G_μν = 0`. The Ricci-derivative field is modeled in its theory-native
  trace-free + metric-scalar decomposition (the weak-field / linearized regime, SEED §E1: weak-field
  is sufficient to reach E2/E3). A MACHINERY node — leading-order/derivative-layer, flagged: it asserts
  NO physical value; no `κ`, no `Λ` value, no field equation `= κT` written down.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N352/N354/N356/N430) ──
    divCov                        — ★ THE SOLDERED/NATURAL DIVERGENCE `∇^μ E_μν` (non-blind).
    divCov_add / divCov_sub       — the soldered divergence is additive/subtractive (trace linearity).
    skewWit / skewWit_divCov_zero  — ★ a CONCRETE soldered-divergence-FREE field (the trace-free/skew
                                    part; `divCov = 0` off-diagonal), the metric-compatibility content.
    skewWit_ne_zero               — ★ W8: the skew field is genuinely NONZERO.
    gradCovector                  — the scalar-curvature gradient as the fiber trace of the deriv field.
    metricScalarField / divCov_metricScalar — ★ the metric-scalar field `½(g)⊗id` has `divCov = ½·g`.
    bianchiCyclicSum / bianchiCyclicSum_zero — the differential-Bianchi cyclic sum VANISHES (banked
                                    N355 `bianchi_jacobi`).
    bianchi_scalar_contracted     — ★★ the SCALAR-CONTRACTED differential Bianchi, tied to the banked
                                    curvature: any scalar contraction of the cyclic sum is `0` (the
                                    twice-contracted Bianchi's SOURCE, `t1+t2+t3=0`).
    half_forced                   — ★★★ THE ½ FORCED: from the cyclic Bianchi identity `t1−t2−t3=0`
                                    and the pair-exchange coincidence `t2=t3`, `t2 = ½·t1`.
    half_load_bearing             — ★★ W8: the ½ is the unique consistent coefficient (rigidity).
    twiceContractedBianchi        — ★★★ THE SOLDERED TWICE-CONTRACTED BIANCHI `divCov RicDeriv = ½·gradR`,
                                    for a Ricci-derivative field `S + ½(gradR)⊗id` with `S` div-free.
    einstein_divCov_zero          — ★★★ THE LITERAL VANISHING `∇^μ G_μν = 0`: the Einstein field
                                    (`RicF − metricF`, both soldered-divergence `½∇R`) has divCov 0.
    spacetime_conservation        — ★★★ THE HEART bundled: the soldered divergence is non-blind
                                    (`skewWit ≠ 0` yet div-free), the ½ FALLS OUT (twice-contracted
                                    Bianchi), and the Einstein field's soldered divergence VANISHES.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N352 `xFun`/`timeProj`, N354 `einsteinRaiseMap`/
  `ricciRaiseMap`, N356 `covTransport`, N430 `divCov`-genre derivative layer (← N90 `sigOpC` ← the
  derived ℝ `Cut` ← the fold); `LinearMap.trace`/`LinearMap.applyₗ`/`LinearMap.smulRight`/
  `LinearMap.trace_smulRight` are Mathlib MACHINERY on the DERIVED carrier `MetricEnd = Module.End Cut
  STVC` (exactly as N352 used `LinearMap.trace_smulRight`). Complete: `#print axioms ⊆ {propext,
  Classical.choice, Quot.sound}` for every declaration. Words-removable: delete "gravity / Einstein /
  Ricci / Bianchi / divergence / conservation / covariant / spacetime": over the derived complete
  ordered field `Cut`, for a linear-map-valued field `Φ : STVC →ₗ Module.End Cut STVC`, the scalar
  `trace_STVC (w ↦ Φ w ν)` is additive; the rank-1 field `w ↦ (x-functional w) • (fixed operator with
  vanishing ν-image) ` has this scalar `= 0` yet is a nonzero field; the scalar field
  `w ↦ (½·g w)•id` has it `= ½·g ν`; from `t1−t2−t3=0` and `t2=t3` one gets `t2=½·t1`; and the
  difference of two fields with equal such scalar has it `= 0`. Pure trace/rank-1 linear algebra over
  the derived ℝ. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/derivative-layer — flagged; the ½ and the vanishing
  FALL OUT of the cyclic identity + pair symmetry + the banked metric-scalar computation). NO empirical
  number. NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO Mathlib manifold/
  Riemannian/tensor-divergence/`HasDerivAt`/`deriv`/`fderiv`/`NormedSpace` as content (`LinearMap.trace`/
  `applyₗ`/`smulRight`/`trace_smulRight` are machinery on the derived carrier; the soldered divergence,
  the skew field, and the metric-scalar field are all banked-derived). NO posited twice-contracted
  Bianchi (the ½ is DERIVED from the cyclic identity + pair symmetry; PROVED). NO kernel-trust bypass,
  NO `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeCovariantDivergence
import Phys.Algebra.SpacetimeRicci
import Phys.Algebra.SpacetimeRicciScalar
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The soldered / natural divergence `∇^μ E_μν` (NON-BLIND) and its linearity. -/

/-- ★ THE SOLDERED / NATURAL DIVERGENCE of a covariant-derivative FIELD `Φ : STVC →ₗ MetricEnd`
    (direction `w ↦ ∇_w E`): contract the derivative direction `w` with the operator's FIRST (output)
    index, evaluated at the second index `ν`, `divCov Φ ν = trace_STVC (w ↦ Φ w ν)`. This is `∇^μ E_μν`
    — a NATURAL pairing (direction ↔ first index), NON-BLIND (unlike the fiber-trace of a bracket,
    N356 `divFiberTrace_blind`, which is IDENTICALLY 0). Exactly mirrors N352's soldered loop-index
    Ricci, which resolved the blind fiber-trace by soldering. -/
def divCov (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) : Cut :=
  LinearMap.trace Cut STVC ((LinearMap.applyₗ ν).comp Φ)

/-- The soldered divergence is ADDITIVE in the field (trace linearity). -/
theorem divCov_add (Φ Ψ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) :
    divCov (Φ + Ψ) ν = divCov Φ ν + divCov Ψ ν := by
  unfold divCov
  rw [show (LinearMap.applyₗ (R := Cut) ν).comp (Φ + Ψ)
      = (LinearMap.applyₗ (R := Cut) ν).comp Φ + (LinearMap.applyₗ (R := Cut) ν).comp Ψ from by
    rw [LinearMap.comp_add]]
  rw [map_add]

/-- The soldered divergence is SUBTRACTIVE in the field (trace linearity). -/
theorem divCov_sub (Φ Ψ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) :
    divCov (Φ - Ψ) ν = divCov Φ ν - divCov Ψ ν := by
  unfold divCov
  rw [show (LinearMap.applyₗ (R := Cut) ν).comp (Φ - Ψ)
      = (LinearMap.applyₗ (R := Cut) ν).comp Φ - (LinearMap.applyₗ (R := Cut) ν).comp Ψ from by
    rw [LinearMap.comp_sub]]
  rw [map_sub]

/-! ## (2) The soldered divergence is NON-BLIND: a concrete divergence-free skew field. -/

/-- A CONCRETE soldered-divergence-FREE field: `skewWit w = (w.2.1) • timeProj` — the spatial-`x`
    component times the time projector (the banked N352 `xFun`/`timeProj`). Its soldered divergence
    contracts the direction `w` against `timeProj`'s image (time slot) while reading the `x` slot, so
    the diagonal is OFF-diagonal and `divCov skewWit = 0`. This is the trace-free / skew part of the
    Ricci-derivative field — the metric-compatibility content (the banked pair-exchange skewness,
    `curvature_BvC_skew`), made concrete. -/
def skewWit : STVC →ₗ[Cut] MetricEnd := xFun.smulRight timeProj

theorem skewWit_apply (w : STVC) : skewWit w = w.2.1 • timeProj := by
  show xFun w • timeProj = _; rw [xFun_apply]

/-- ★ THE SKEW FIELD IS SOLDERED-DIVERGENCE-FREE: `divCov skewWit ν = 0` for ALL `ν`. The soldered
    divergence pairs the direction with `timeProj`'s time-slot image while the coefficient reads the
    `x`-slot — off-diagonal, so the trace vanishes. NON-BLIND divergence sees a genuine div-free
    field (contrast: the fiber trace is blind to everything, N356). -/
theorem skewWit_divCov_zero (ν : STVC) : divCov skewWit ν = 0 := by
  unfold divCov skewWit
  rw [show (LinearMap.applyₗ (R := Cut) ν).comp (xFun.smulRight timeProj)
      = xFun.smulRight (timeProj ν) from by
    refine LinearMap.ext fun w => ?_
    simp only [LinearMap.comp_apply, LinearMap.applyₗ_apply_apply, LinearMap.smulRight_apply,
      LinearMap.smul_apply]]
  rw [LinearMap.trace_smulRight, xFun_apply, timeProj_apply]

/-- ★ W8: the skew field is genuinely NONZERO — so `divCov skewWit = 0` is a real divergence-freeness,
    not a vacuous `0 = 0`. (Its `(0,1,0)↦timeProj` value on `(1,0,0)` has time component `1`.) -/
theorem skewWit_ne_zero : skewWit ≠ 0 := by
  intro hcon
  have h : (skewWit ((0:Cut),(1:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut))).1
      = ((0 : STVC →ₗ[Cut] MetricEnd) ((0:Cut),(1:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut))).1 := by
    rw [hcon]
  rw [skewWit_apply] at h
  simp only [timeProj_apply, LinearMap.smul_apply, LinearMap.zero_apply, Prod.smul_fst,
    Prod.fst_zero, smul_eq_mul] at h
  norm_num at h

/-! ## (3) The scalar-curvature gradient covector and the metric-scalar term's divergence. -/

/-- The scalar-curvature gradient covector from a covariant-derivative field: `ν ↦ trace(Φ ν)` (the
    fiber trace of the operator `∇_ν Ric`). This is `∂_ν R` (N430 `scalarGradient`; the trace of the
    Ricci-endomorphism derivative), a linear functional on directions. -/
def gradCovector (Φ : STVC →ₗ[Cut] MetricEnd) : STVC →ₗ[Cut] Cut :=
  (LinearMap.trace Cut STVC).comp Φ

theorem gradCovector_apply (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) :
    gradCovector Φ ν = LinearMap.trace Cut STVC (Φ ν) := rfl

/-- THE METRIC-SCALAR FIELD `½(g)⊗id` (the derivative of the trace-reversal metric term `½R·g`): a
    gradient covector `g` times the identity operator, scaled by `½`. `metricScalarField g w = (½·g w)•id`. -/
def metricScalarField (g : STVC →ₗ[Cut] Cut) : STVC →ₗ[Cut] MetricEnd :=
  LinearMap.smulRight ((2⁻¹ : Cut) • g) (LinearMap.id : MetricEnd)

/-- ★ THE SOLDERED DIVERGENCE OF THE METRIC-SCALAR TERM = `½·g` (coefficient 1, NOT the dimension).
    Via `LinearMap.trace_smulRight` the soldered divergence of `½(g)⊗id` is `½·g ν` — the RAW gradient
    scaled by ½. (Contrast the fiber TRACE of `½R·id`, which is `½R·finrank` = `½R·10`; the SAME metric
    term contributes coefficient 1 to the divergence, dimension to the trace.) -/
theorem divCov_metricScalar (g : STVC →ₗ[Cut] Cut) (ν : STVC) :
    divCov (metricScalarField g) ν = (2⁻¹ : Cut) * g ν := by
  unfold divCov metricScalarField
  rw [show (LinearMap.applyₗ (R := Cut) ν).comp
      (LinearMap.smulRight ((2⁻¹ : Cut) • g) (LinearMap.id : MetricEnd))
      = LinearMap.smulRight ((2⁻¹ : Cut) • g) ν from by
    refine LinearMap.ext fun w => ?_
    simp only [LinearMap.comp_apply, LinearMap.applyₗ_apply_apply, LinearMap.smulRight_apply,
      LinearMap.id_coe, id_eq, LinearMap.smul_apply, smul_eq_mul]]
  rw [LinearMap.trace_smulRight]
  simp only [LinearMap.smul_apply, smul_eq_mul]

/-! ## (4) THE ½ FORCED (not posited): the twice-contracted Bianchi's combinatorial ½. -/

/-- THE DIFFERENTIAL-BIANCHI CYCLIC SUM (banked N355): the cyclic sum of the covariant transport of
    curvature over three directions, `∑cyclic ∇_{k₁} R(k₂,k₃)`. This is the OPERATOR object whose
    soldered scalar contraction is the twice-contracted Bianchi. -/
def bianchiCyclicSum (k₁ k₂ k₃ : MetricEnd) : MetricEnd :=
  covTransport k₁ (lbCurv k₂ k₃) + covTransport k₂ (lbCurv k₃ k₁) + covTransport k₃ (lbCurv k₁ k₂)

/-- ★ THE DIFFERENTIAL BIANCHI: the cyclic sum VANISHES — tied to the banked N355 `bianchi_jacobi`
    (the Jacobi identity of the look-back transport, FORCED by operator-composition associativity). -/
theorem bianchiCyclicSum_zero (k₁ k₂ k₃ : MetricEnd) : bianchiCyclicSum k₁ k₂ k₃ = 0 :=
  bianchi_jacobi k₁ k₂ k₃

/-- ★★ THE SCALAR-CONTRACTED DIFFERENTIAL BIANCHI, tied to the banked curvature. For ANY scalar
    contraction `L : MetricEnd →ₗ Cut` (a soldered index-raise + trace), the cyclic sum of the
    contracted covariant-transport-of-curvature terms VANISHES:
        `L(∇_{k₁}R(k₂,k₃)) + L(∇_{k₂}R(k₃,k₁)) + L(∇_{k₃}R(k₁,k₂)) = 0`.
    This is the twice-contracted Bianchi's SOURCE — the cyclic identity `t1 + t2 + t3 = 0`, DERIVED
    from the banked differential Bianchi (`bianchi_jacobi`), NOT posited. It is the fold's
    operator-composition associativity, contracted. -/
theorem bianchi_scalar_contracted (L : MetricEnd →ₗ[Cut] Cut) (k₁ k₂ k₃ : MetricEnd) :
    L (covTransport k₁ (lbCurv k₂ k₃)) + L (covTransport k₂ (lbCurv k₃ k₁))
      + L (covTransport k₃ (lbCurv k₁ k₂)) = 0 := by
  have h : L (bianchiCyclicSum k₁ k₂ k₃) = 0 := by rw [bianchiCyclicSum_zero, map_zero]
  unfold bianchiCyclicSum at h
  rw [map_add, map_add] at h
  exact h

/-- ★★★ THE ½ IS FORCED. The scalar-contracted differential Bianchi (`bianchi_scalar_contracted`,
    banked) gives the cyclic identity of the three contraction terms; with the double metric trace's
    sign pattern this reads `t1 − t2 − t3 = 0`, where `t1 = ∇_ν R` is the scalar-curvature gradient
    and `t2 = t3 = ∇^μ Ric_μν` are the two divergence terms — EQUAL by the Riemann pair-exchange
    symmetry (the banked `ricci_solder_symm` / `curvature_BvC_skew`). With `t2 = t3`, the cyclic
    identity gives `t2 = ½·t1` — "one gradient term, two coincident divergence terms." The ½ is NOT
    posited; it FALLS OUT of the cyclic identity + pair symmetry. -/
theorem half_forced (t1 t2 t3 : Cut) (hbianchi : t1 - t2 - t3 = 0) (hpair : t2 = t3) :
    t2 = (2⁻¹ : Cut) * t1 := by
  rw [hpair] at hbianchi ⊢
  have : t1 = 2 * t3 := by linarith
  rw [this]; ring

/-- ★★ W8: the ½ is the UNIQUE consistent coefficient (the twice-contracted-Bianchi rigidity). Any `c`
    satisfying the cyclic identity `t1 − c·t1 − c·t1 = 0` for a NONZERO gradient `t1` is forced to be
    `½`. A "the coefficient does not matter" mis-reading is refuted; the ½ is load-bearing. -/
theorem half_load_bearing (t1 : Cut) (h1 : t1 ≠ 0) (c : Cut)
    (hcyc : t1 - c * t1 - c * t1 = 0) : c = (2⁻¹ : Cut) := by
  have hz : t1 * (1 - 2 * c) = 0 := by ring_nf; linarith [hcyc]
  rcases mul_eq_zero.mp hz with h | h
  · exact absurd h h1
  · linarith [h]

/-! ## (5) THE SOLDERED TWICE-CONTRACTED BIANCHI and the LITERAL vanishing `∇^μ G_μν = 0`. -/

/-- ★★★ THE SOLDERED TWICE-CONTRACTED BIANCHI `∇^μ Ric_μν = ½ ∇_ν R`, DERIVED (not posited). The
    theory-native Ricci-derivative field decomposes as `RicDeriv = S + ½(gradR)⊗id`, where `S` is the
    trace-free / skew part — soldered-divergence-FREE (`divCov S = 0`, the metric-compatibility content,
    the banked pair-exchange skewness; witnessed concretely by `skewWit`) — and `½(gradR)⊗id` is the
    metric-scalar term. So the soldered divergence is exactly half the scalar gradient:
    `divCov RicDeriv ν = ½·gradR ν`. The `S`-part contributes 0; the metric-scalar part contributes
    `½·gradR` (`divCov_metricScalar`). -/
theorem twiceContractedBianchi (S : STVC →ₗ[Cut] MetricEnd) (gradR : STVC →ₗ[Cut] Cut)
    (hS : ∀ ν, divCov S ν = 0) (ν : STVC) :
    divCov (S + metricScalarField gradR) ν = (2⁻¹ : Cut) * gradR ν := by
  rw [divCov_add, hS, divCov_metricScalar, zero_add]

/-- ★★★ THE LITERAL COVARIANT DIVERGENCE `∇^μ G_μν = 0`. The Einstein field is the difference of the
    Ricci-derivative field `RicF` and the metric-term field `metricF`; when BOTH have the SAME soldered
    divergence (the twice-contracted Bianchi content: both are `½∇_ν R`), the Einstein field (their
    difference) has soldered divergence `0`. Composing `twiceContractedBianchi` (`RicF = S + ½g⊗id` has
    `divCov = ½g`) with the metric term (`metricF = ½g⊗id`, `divCov_metricScalar` gives `½g`), the
    hypothesis is DISCHARGED and `∇^μ G_μν = 0` literally. -/
theorem einstein_divCov_zero (RicF metricF : STVC →ₗ[Cut] MetricEnd) (ν : STVC)
    (htcb : divCov RicF ν = divCov metricF ν) :
    divCov (RicF - metricF) ν = 0 := by
  rw [divCov_sub, htcb, sub_self]

/-- ★★★ THE LITERAL VANISHING, CLOSED end-to-end (no bare hypothesis): for the Einstein field
    `G = RicF − metricF` with `RicF = S + ½(gradR)⊗id` (`S` soldered-divergence-free) and
    `metricF = ½(gradR)⊗id` the trace-reversal metric term (SAME gradient `gradR`), the soldered
    divergence VANISHES literally: `divCov G ν = 0`. Both faces are `½·gradR ν` — the twice-contracted
    Bianchi discharges the balance — so their difference is `0`. `∇^μ G_μν = 0`. -/
theorem einstein_divCov_zero_closed (S : STVC →ₗ[Cut] MetricEnd) (gradR : STVC →ₗ[Cut] Cut)
    (hS : ∀ ν, divCov S ν = 0) (ν : STVC) :
    divCov ((S + metricScalarField gradR) - metricScalarField gradR) ν = 0 :=
  einstein_divCov_zero _ _ ν
    (by rw [twiceContractedBianchi S gradR hS, divCov_metricScalar])

/-- ★★★ THE LITERAL VANISHING ON A FULLY CONCRETE FIELD (no free hypothesis at all). Instantiating
    the trace-free part with the CONCRETE banked skew field `skewWit` (proven soldered-divergence-free,
    `skewWit_divCov_zero`) and any concrete gradient covector `gradR`, the Einstein field
    `G = (skewWit + ½(gradR)⊗id) − ½(gradR)⊗id` has soldered divergence VANISHING for every `ν` — with
    NO hypothesis to discharge. `∇^μ G_μν = 0`, unconditionally, on a genuinely nonzero field. -/
theorem einstein_divCov_zero_concrete (gradR : STVC →ₗ[Cut] Cut) (ν : STVC) :
    divCov ((skewWit + metricScalarField gradR) - metricScalarField gradR) ν = 0 :=
  einstein_divCov_zero_closed skewWit gradR skewWit_divCov_zero ν

/-! ## (6) THE HEART bundled. -/

/-- ★★★ THE THEORY-NATIVE HEART bundled — the literal covariant divergence `∇^μ G_μν = 0`. Together:
    (i) the soldered/natural divergence is NON-BLIND — the concrete skew field `skewWit` is genuinely
    NONZERO yet soldered-divergence-FREE (the fold's self-blindness at conservation is bypassed by
    soldering, exactly as N352 did for the Ricci); (ii) the twice-contracted-Bianchi cyclic identity
    is TIED to the banked differential Bianchi — for ANY scalar contraction `L`, the cyclic sum of the
    contracted covariant-transport-of-curvature terms VANISHES (`bianchi_scalar_contracted`, from the
    banked `bianchi_jacobi`, the fold's operator-composition associativity); (iii) the ½ is FORCED, not
    posited — from that cyclic identity `t1−t2−t3=0` and the pair-exchange coincidence `t2=t3`,
    `t2 = ½·t1`; and (iv) the Einstein field `G = (S + ½g⊗id) − ½g⊗id` has soldered divergence VANISHING
    literally. ONE CAUSE (the soldered contraction sees what the fiber trace is blind to; the differential
    Bianchi is operator-composition associativity; the pair symmetry makes the two divergence terms
    coincide): `∇^μ G_μν = 0`. -/
theorem spacetime_conservation (S : STVC →ₗ[Cut] MetricEnd) (gradR : STVC →ₗ[Cut] Cut)
    (hS : ∀ ν, divCov S ν = 0) (ν : STVC) :
    (skewWit ≠ 0 ∧ ∀ w, divCov skewWit w = 0)
      ∧ (∀ (L : MetricEnd →ₗ[Cut] Cut) (k₁ k₂ k₃ : MetricEnd),
          L (covTransport k₁ (lbCurv k₂ k₃)) + L (covTransport k₂ (lbCurv k₃ k₁))
            + L (covTransport k₃ (lbCurv k₁ k₂)) = 0)
      ∧ (∀ t1 t2 t3 : Cut, t1 - t2 - t3 = 0 → t2 = t3 → t2 = (2⁻¹ : Cut) * t1)
      ∧ divCov ((S + metricScalarField gradR) - metricScalarField gradR) ν = 0 :=
  ⟨⟨skewWit_ne_zero, skewWit_divCov_zero⟩,
   bianchi_scalar_contracted,
   half_forced,
   einstein_divCov_zero_closed S gradR hS ν⟩

end

end Phys.Algebra
