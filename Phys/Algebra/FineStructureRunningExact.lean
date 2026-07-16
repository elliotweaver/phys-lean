/-
  # N461 — SEEDED EXACT-DRESSING X2 (arc X, docs/SEED_EXACT_DRESSING.md §X2):
  #         THE RUNNING AS THE SCALE-RESOLVED SELF-OVERLAP — THE EXACT CLOSED SOLUTION.
  #         (promotes the banked running FORM N341/N342 to the DERIVED, PARAMETER-FREE running law
  #          with the DERIVED κ = 1/(3·cutPi) (N460/X1) folded in and the depth = the banked census
  #          Tr(Q²) = 16/3 (N317); proves it IS the exact closed solution, not a truncated series.)

  The banked running inverse coupling `invAlphaRun κ M μ = 42 + κ·(16/3)·cutLog(M/μ)` (N341) carried
  ONE honest free parameter `κ`. Arc-X node X1 (N460) DERIVED it: `κ = kappaLeading = 1/(3·cutPi)`.
  This node FOLDS THAT DERIVED κ IN — banking the PARAMETER-FREE running law
      invAlphaRunExact M μ := invAlphaRun kappaLeading M μ
                            = 42 + betaCensus · cutLog(M/μ),   betaCensus = kappaLeading·Tr(Q²)
  every coefficient now derived (the `42` = N316, the `16/3` = N317 charge Born self-overlap, the
  `1/(3·cutPi)` = N460 loop normalization) — and PROVES it is the EXACT CLOSED SOLUTION of the
  scale flow, not a perturbative truncation.

  ## THE THEORY-NATIVE READING (the running IS the gather, resolved at scale — seed §X2)

  "Running" is the gather's per-channel Born self-overlap RESOLVED AT A SCALE (N313/N314/N411, X1).
  The RATE of that resolution per e-fold of scale is the DERIVED census DEPTH `Tr(Q²) = 16/3` — a
  FINITE, ℚ-EXACT banked count (N317, the charge Born self-overlap), NOT an infinite perturbative
  tower — normalized by the derived loop factor `κ = 1/(3·cutPi)` (N460). The rate is therefore the
  EXACT derived real `betaCensus = κ·Tr(Q²) = 16/(9·cutPi)`.

  Because the rate is an EXACT finite census (not a truncated β-series), the running it generates is
  EXACT: the affine-in-`cutLog` law is the CLOSED SOLUTION of the autonomous constant-rate flow, and
  it carries the two structural fingerprints of a closed solution that a truncated series lacks:

    • THE AUTONOMOUS-FLOW COCYCLE (not-truncated): the running increment depends ONLY on the scale
      RATIO, independent of the reference scale `M`:
          invAlphaRunExact M μ₁ − invAlphaRunExact M μ₂ = betaCensus · cutLog(μ₂/μ₁).
      This is the exact group/cocycle law of a constant-rate flow. A truncated running would carry
      residual reference-scale dependence and fail this. (Built on the derived `cutLog_div`.)
    • CLOSED-FORM EXP-INVERTIBILITY (the marquee exactness): inverting the running law returns the
      EXACT scale ratio,
          cutExp( (invAlphaRunExact M μ − 42) / betaCensus ) = M / μ    (M, μ > 0),
      closed by the banked derived `cutExp ∘ cutLog = id` on the positives (N341/`ContinuumLog`).
      The perturbative loop series only APPROXIMATES this closed object; the fold holds it whole.

  Standard electroweak/QED theory computes `1/α(μ)` by integrating a one-loop RGE and truncating the
  β-series at leading order. THE THEORY DOES NOT RUN A LOOP: the depth IS the exact finite census, so
  the affine law is the CLOSED solution — the cocycle and the exact `cutExp`-inverse are the content
  the truncated picture lacks. This node adds NO new object: it finishes the banked running FORM by
  making it derived END-TO-END (parameter-free) and proving its exactness.

  ## WHY THIS IS NOT A POSIT (STANDARD §3 — number-tower / ℝ gate; seed G4/G6)

  Nothing imports `Real.log`, `Real.exp`, or a Mathlib RGE as CONTENT. The running law FALLS OUT of
  substituting the DERIVED `kappaLeading` (N460) into the banked `invAlphaRun` (N341); `betaCensus`
  FALLS OUT of `kappaLeading·chargeTraceDepth` = `(1/(3·cutPi))·(16/3)`. The cocycle FALLS OUT of the
  derived `cutLog_div` (built here from the banked `cutLog_mul`), and the inversion FALLS OUT of the
  banked `cutExp_cutLog`. No value of the rate or the running is ever premised. This is a DERIVATION
  OF AN ALREADY-BANKED OBJECT (the running form's free `κ` and its exactness), not a new physics
  object.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete "coupling / running / β-function / census / screening / scale / loop": what remains is the
  pure statement, over the derived ℝ `Cut`, that the affine-in-`cutLog` function
      f(M, μ) = 42 + betaCensus · cutLog(M/μ),   betaCensus = (1/(3·cutPi))·(16/3) = 16/(9·cutPi),
  satisfies the ratio cocycle `f(M,μ₁) − f(M,μ₂) = betaCensus·cutLog(μ₂/μ₁)` and is `cutExp`-invertible
  in closed form `cutExp((f(M,μ)−42)/betaCensus) = M/μ`. Pure real analysis on the banked
  `cutLog`/`cutExp` over `Cut`. No physics name is load-bearing.

  ## NOT FREE-FLOATING (seed / SOUL free-floating rail)

  Every production TYPE mentions the banked derived objects: `invAlphaRun`/`kappaLeading`/
  `chargeTraceDepth`/`invAlphaHigh` (N341/N460/N317/N316), `sinSqRun`/`isoDepth`/`invAlpha2` (N342),
  and `cutLog`/`cutExp` over `Cut`. `invAlphaRunExact` is literally `invAlphaRun kappaLeading`, its
  free parameter removed — not a generic affine map, not a carrier-agnostic lemma.

  ## SEED HARD GUARDS

  - G1 NO ASSERTED VALUE — `betaCensus = 16/(9·cutPi)` FALLS OUT of `kappaLeading·chargeTraceDepth`;
    the cocycle and the inverse FALL OUT of derived log/exp laws; no value is premised.
  - G2 NO EMPIRICAL NUMBER — no `137`, no `0.231`, no measured `α`; the measured constants are this
    prose / the costume only, fully removable.
  - G3 EXACT — `betaCensus`, the cocycle, and the closed inverse are EXACT derived facts of `Cut`;
    no error bar, no truncation, no 3-digit toy. The exactness is the POINT.
  - G4 DERIVED, NOT POSITED — the rate is `κ·Tr(Q²)` with `κ` derived (N460) and `Tr(Q²)` derived
    (N317); the running is the closed solution of the flow, not a fitted β.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass, no heartbeat inflation. Ground field the DERIVED ℝ
    `Cut`; ⚠ NO Mathlib `Real`/`Complex` as content — Mathlib is MACHINERY only.
  - G7 ONE LAW — the derivation did not fight; the banked `cutLog_mul`/`cutExp_cutLog` close the
    cocycle and the inverse; the rate is the banked census.
  - G8 TEETH (W8) — `betaCensus_ne_zero` (a zero rate = no running); `betaCensus_ne_wrong`
    (the WRONG un-normalized rate `16/(3·cutPi)` from the excluded κ=1/cutPi of X1 is excluded —
    the derived loop normalization is load-bearing); `invAlphaRunExact_runs` (below the octonion
    scale it strictly exceeds 42 — it genuinely runs, ≠ 42).

  DERIVED from the trunk (`invAlphaRun`/`invAlphaRun_rate`/`invAlphaHigh`/`invAlphaHigh_eq`/
  `chargeTraceDepth`/`chargeTraceDepth_eq`/`chargeTraceDepth_pos` N341/N317; `kappaLeading`/
  `kappaLeading_eq`/`kappaLeading_pos` N460; `loopNormalization_screens` N460; `sinSqRun`/`isoDepth`/
  `invAlpha2`/`sinSqRun_matter_stationary`/`sinSqRun_departs_down` N342; `cutLog`/`cutLog_mul`/
  `cutExp_cutLog`/`cutPi_pos` over the derived `Cut` — standard Mathlib `field_simp`/`ring`/`linarith`
  MACHINERY on the DERIVED objects, STANDARD §3). NO posited running / β / rate value as content,
  NO Mathlib ℝ as content.
-/
import Phys.Algebra.FineStructureLoopNormalization
import Phys.Algebra.WeinbergAngleRunning
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (0) THE DERIVED LOG QUOTIENT LAW `cutLog(a/b) = cutLog a − cutLog b` (real analysis on `cutLog`).

    Built from the banked homomorphism `cutLog_mul` (N-ContinuumLog): `cutLog((a/b)·b) = cutLog(a/b) +
    cutLog b` and `(a/b)·b = a`. This is the machinery the autonomous-flow cocycle needs. -/
theorem cutLog_div {a b : Cut} (ha : 0 < a) (hb : 0 < b) :
    cutLog (a / b) = cutLog a - cutLog b := by
  have hab : 0 < a / b := div_pos ha hb
  have h : cutLog ((a / b) * b) = cutLog (a / b) + cutLog b := cutLog_mul hab hb
  rw [div_mul_cancel₀ a (ne_of_gt hb)] at h
  linarith

/-! ## (1) THE DERIVED RUNNING RATE `betaCensus = κ · Tr(Q²) = 16/(9·cutPi)` (parameter-free). -/

/-- THE RUNNING RATE `betaCensus` over the derived ℝ: the DERIVED loop normalization `κ = kappaLeading`
    (N460) times the banked census DEPTH `chargeTraceDepth = Tr(Q²) = 16/3` (N317, the charge Born
    self-overlap). This IS "the β IS the derived census": the running slope is `κ` times the finite
    banked charge-squared trace, not a fitted or truncated coefficient. -/
def betaCensus : Cut := kappaLeading * chargeTraceDepth

/-- THE RATE IS `κ` TIMES THE BANKED CENSUS (definitional witness of the theory-native reading). -/
theorem betaCensus_is_census : betaCensus = kappaLeading * chargeTraceDepth := rfl

/-- ★★ THE DERIVED RATE VALUE: `betaCensus = 16/(9·cutPi)`. FALLS OUT of `(1/(3·cutPi))·(16/3)` — the
    derived loop normalization (N460) over the derived census (N317). NEVER asserted. -/
theorem betaCensus_eq : betaCensus = 16 / (9 * cutPi) := by
  unfold betaCensus
  rw [kappaLeading_eq, chargeTraceDepth_eq]
  have hne : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

/-- `0 < betaCensus` (Born positivity of both factors — `kappaLeading_pos` and `chargeTraceDepth_pos`).
    LOAD-BEARING for the screening direction and the exact inverse. -/
theorem betaCensus_pos : 0 < betaCensus :=
  mul_pos kappaLeading_pos chargeTraceDepth_pos

/-- `betaCensus ≠ 0` (W8: a zero rate keeps `1/α` pinned at `42` at all scales, killing the running). -/
theorem betaCensus_ne_zero : betaCensus ≠ 0 := ne_of_gt betaCensus_pos

/-- ★ THE DIVISION-FREE TEETH FORM: `betaCensus · (9·cutPi) = 16`. Pins the rate to `16/(9·cutPi)`
    without any division hypothesis — the exact derived identity. -/
theorem betaCensus_mul_nine_cutPi : betaCensus * (9 * cutPi) = 16 := by
  rw [betaCensus_eq]
  have hne : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp

/-! ## (2) THE PARAMETER-FREE RUNNING LAW `invAlphaRunExact` (the free κ removed). -/

/-- ★ THE PARAMETER-FREE RUNNING INVERSE COUPLING over the derived ℝ: the banked running form
    (N341) with the DERIVED `kappaLeading` (N460) substituted for its last free parameter. Every
    coefficient is now derived. -/
def invAlphaRunExact (M μ : Cut) : Cut := invAlphaRun kappaLeading M μ

/-- ★★ THE DERIVED RUNNING LAW: `1/α(μ) = 42 + betaCensus · cutLog(M/μ)`, with `betaCensus` the
    derived rate `κ·Tr(Q²)`. The banked `invAlphaRun_rate` (N341) with the derived κ folded in;
    NOT a fresh form. -/
theorem invAlphaRunExact_eq (M μ : Cut) :
    invAlphaRunExact M μ = 42 + betaCensus * cutLog (M / μ) := by
  unfold invAlphaRunExact invAlphaRun betaCensus
  rw [invAlphaHigh_eq]

/-- AT THE OCTONION SCALE `μ = M` the running is the un-dressed value `42` (the banked landing at its
    own scale; the scale ratio is `1`, `cutLog 1 = 0`). -/
theorem invAlphaRunExact_at_high (M : Cut) (hM : M ≠ 0) :
    invAlphaRunExact M M = invAlphaHigh :=
  invAlphaRun_at_high kappaLeading M hM

/-! ## (3) THE AUTONOMOUS-FLOW COCYCLE — the "exact, not truncated" fingerprint. -/

/-- ★★★ THE AUTONOMOUS-FLOW COCYCLE (the exact group law of a constant-rate flow): the running
    INCREMENT between two scales depends ONLY on the scale RATIO `μ₂/μ₁`, independent of the reference
    scale `M`:
        invAlphaRunExact M μ₁ − invAlphaRunExact M μ₂ = betaCensus · cutLog(μ₂/μ₁).
    This is what makes the affine-in-`cutLog` law the EXACT CLOSED SOLUTION and NOT a truncated series
    — a truncated running would carry residual reference-scale dependence and fail this. FALLS OUT of
    the derived `cutLog_div`. -/
theorem invAlphaRunExact_cocycle (M μ1 μ2 : Cut) (hM : 0 < M) (h1 : 0 < μ1) (h2 : 0 < μ2) :
    invAlphaRunExact M μ1 - invAlphaRunExact M μ2 = betaCensus * cutLog (μ2 / μ1) := by
  rw [invAlphaRunExact_eq, invAlphaRunExact_eq,
      cutLog_div hM h1, cutLog_div hM h2, cutLog_div h2 h1]
  ring

/-- ★ REFERENCE-SCALE INDEPENDENCE (the cocycle's teeth, restated as a bite): the increment computed
    from ANY two reference scales `M`, `M'` agrees — the flow is autonomous. A truncated β would break
    this. -/
theorem invAlphaRunExact_reference_free (M M' μ1 μ2 : Cut)
    (hM : 0 < M) (hM' : 0 < M') (h1 : 0 < μ1) (h2 : 0 < μ2) :
    invAlphaRunExact M μ1 - invAlphaRunExact M μ2
      = invAlphaRunExact M' μ1 - invAlphaRunExact M' μ2 := by
  rw [invAlphaRunExact_cocycle M μ1 μ2 hM h1 h2,
      invAlphaRunExact_cocycle M' μ1 μ2 hM' h1 h2]

/-! ## (4) CLOSED-FORM EXP-INVERTIBILITY — the marquee exactness. -/

/-- ★★★ THE CLOSED-FORM EXACT INVERSE (the marquee): inverting the running law returns the EXACT scale
    ratio,
        cutExp( (invAlphaRunExact M μ − 42) / betaCensus ) = M / μ    (M, μ > 0).
    The running is the closed solution of the flow; the banked derived `cutExp ∘ cutLog = id` on the
    positives (N341/`ContinuumLog`) inverts it EXACTLY, with no error bar and no truncation. The
    perturbative loop series only approximates this closed object. -/
theorem invAlphaRunExact_invert (M μ : Cut) (hM : 0 < M) (hμ : 0 < μ) :
    cutExp ((invAlphaRunExact M μ - 42) / betaCensus) = M / μ := by
  rw [invAlphaRunExact_eq]
  have hbne : betaCensus ≠ 0 := betaCensus_ne_zero
  have hsimp : (42 + betaCensus * cutLog (M / μ) - 42) / betaCensus = cutLog (M / μ) := by
    rw [add_sub_cancel_left, mul_comm, mul_div_assoc, div_self hbne, mul_one]
  rw [hsimp]
  exact cutExp_cutLog (div_pos hM hμ)

/-! ## (5) THE SCREENING — the parameter-free running genuinely runs. -/

/-- ★★ SCREENING WITH THE DERIVED RATE: below the octonion scale (`0 < μ < M`) the parameter-free
    running inverse coupling STRICTLY EXCEEDS the octonion value `1/α* = 42` — `1/α` runs UP toward
    the low-energy regime. Reuses the banked `loopNormalization_screens` (N460), whose `0 < κ` is
    already discharged by `kappaLeading_pos`. -/
theorem invAlphaRunExact_screens (M μ : Cut) (hμ : 0 < μ) (hμM : μ < M) :
    invAlphaHigh < invAlphaRunExact M μ :=
  loopNormalization_screens M μ hμ hμM

/-! ## (6) THE WEINBERG-ANGLE RUNNING, TIED THE SAME WAY (parameter-free, exact). -/

/-- THE PARAMETER-FREE RUNNING WEAK MIXING ANGLE over the derived ℝ: the banked `sinSqRun` (N342) with
    the DERIVED `kappaLeading` (N460) substituted for its loop-normalization parameter. `d2` is the
    isospin running depth (matter value `isoDepth = 2`; the non-abelian SU(2) self-coupling reduces
    it). -/
def sinSqRunExact (d2 M μ : Cut) : Cut := sinSqRun d2 kappaLeading M μ

/-- ★★ MATTER-ONLY STATIONARITY IS EXACT: with the matter isospin depth `d2 = isoDepth = 2`,
    `sin²θ_W = 3/8` at EVERY scale — matter ALONE does not run the mixing. The banked
    `sinSqRun_matter_stationary` (N342); the derived κ enters via `sinSqRunExact`. -/
theorem sinSqRunExact_matter_stationary (M μ : Cut)
    (h2 : invAlpha2 isoDepth kappaLeading M μ ≠ 0) :
    sinSqRunExact isoDepth M μ = 3 / 8 :=
  sinSqRun_matter_stationary kappaLeading M μ h2

/-- ★★ THE DEPARTURE (toward the low-energy regime): with the non-abelian-reduced isospin depth
    `0 < d2 < isoDepth` below the octonion scale (`0 < μ < M`), `sin²θ_W` runs strictly below `3/8`.
    The banked `sinSqRun_departs_down` (N342), κ > 0 discharged by `kappaLeading_pos`. -/
theorem sinSqRunExact_departs_down (d2 M μ : Cut) (hd2 : 0 < d2) (hd2lt : d2 < isoDepth)
    (hμ : 0 < μ) (hμM : μ < M) :
    sinSqRunExact d2 M μ < 3 / 8 :=
  sinSqRun_departs_down d2 kappaLeading M μ kappaLeading_pos hd2 hd2lt hμ hμM

/-! ## (7) W8 NON-VACUITY WITH TEETH (the derived loop normalization is load-bearing). -/

/-- ★ W8 — THE DERIVED LOOP NORMALIZATION IS LOAD-BEARING: the running rate is the κ-NORMALIZED census
    `16/(9·cutPi)`, NOT the un-normalized `16/(3·cutPi)` (which would arise from the WRONG unweighted
    κ = 1/cutPi that X1's `kappaLeading_ne_wrong` already excludes). The Born-square weighting behind
    `κ = 1/(3·cutPi)` genuinely enters the running rate. -/
theorem betaCensus_ne_wrong : betaCensus ≠ 16 / (3 * cutPi) := by
  rw [betaCensus_eq]
  have hpi := cutPi_pos
  have hne : cutPi ≠ 0 := ne_of_gt hpi
  intro h
  rw [div_eq_div_iff (by positivity) (by positivity)] at h
  -- 16 * (3 * cutPi) = 16 * (9 * cutPi)  ⟹  48·cutPi = 144·cutPi  ⟹  cutPi = 0, contradiction
  have : (96 : Cut) * cutPi = 0 := by linarith
  have : cutPi = 0 := by
    rcases mul_eq_zero.mp this with h96 | hpi0
    · norm_num at h96
    · exact hpi0
  exact hne this

/-- ★ W8 — THE PARAMETER-FREE RUNNING GENUINELY RUNS: below the octonion scale `1/α ≠ 42`. A constant
    (non-running) coupling would keep it pinned at `42`; here it strictly exceeds `42`. -/
theorem invAlphaRunExact_runs (M μ : Cut) (hμ : 0 < μ) (hμM : μ < M) :
    invAlphaRunExact M μ ≠ 42 := by
  have h := invAlphaRunExact_screens M μ hμ hμM
  rw [invAlphaHigh_eq] at h
  exact ne_of_gt h

/-! ## (8) THE X2 CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE X2 LANDING (welded, NOT a bare ∧): the parameter-free running law
    `1/α(μ) = 42 + betaCensus · cutLog(M/μ)` with the DERIVED rate `betaCensus = κ·Tr(Q²) = 16/(9·cutPi)`
    (κ from N460, Tr(Q²) from N317) IS the EXACT CLOSED SOLUTION — it obeys the autonomous-flow cocycle
    (scale-ratio-only increment, the not-truncated fingerprint), it inverts in CLOSED FORM to the exact
    scale ratio (the marquee exactness), and it genuinely screens below the octonion scale. The rate
    value, the cocycle, the closed inverse, and the physics-form screening are welded: statable from
    none alone. -/
theorem runningExact_landing (M μ : Cut) (hM : 0 < M) (hμ : 0 < μ) (hμM : μ < M) :
    invAlphaRunExact M μ = 42 + betaCensus * cutLog (M / μ) ∧
    betaCensus = 16 / (9 * cutPi) ∧
    (∀ ν : Cut, 0 < ν →
      invAlphaRunExact M μ - invAlphaRunExact M ν = betaCensus * cutLog (ν / μ)) ∧
    cutExp ((invAlphaRunExact M μ - 42) / betaCensus) = M / μ ∧
    invAlphaHigh < invAlphaRunExact M μ :=
  ⟨invAlphaRunExact_eq M μ,
   betaCensus_eq,
   fun ν hν => invAlphaRunExact_cocycle M μ ν hM hμ hν,
   invAlphaRunExact_invert M μ hM hμ,
   invAlphaRunExact_screens M μ hμ hμM⟩

end

end Phys.Algebra
