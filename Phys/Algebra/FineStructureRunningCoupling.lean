/-
  # N341 — SEEDED ANALYTIC-COMPLETION D3: THE FINE-STRUCTURE COUPLING'S SCALE READING
  #         (arc-D, docs/SEED_ANALYTIC_COMPLETION.md §D3) — toward the low-energy `α ≈ 1/137`.

  Over the derived ℝ `ContinuumQ.Cut` and the banked derived logarithm `cutLog`, this node banks the
  RUNNING (scale-dressed) inverse fine-structure coupling `1/α(μ)` as an affine function of the
  derived-ℝ log of the scale ratio, with EVERY structural datum grounded to a banked object:

      invAlphaHigh      = 1/α* = 42                    (N316 `inverseAlphaStar_eq_42`, the octonion-scale value)
      chargeTraceDepth  = Tr(Q²) = 16/3                (N317 `generation_charge_trace`, the running depth)
      invAlphaRun κ M μ = invAlphaHigh + κ·chargeTraceDepth·cutLog(M/μ)

  and reads off the scale-dressing:
      • at the closure scale μ = M the coupling is the un-dressed octonion value 1/α* = 42;
      • the running RATE is `κ · (16/3)` — the derived screening depth IS the banked charge Born
        self-overlap `Tr(Q²) = 16/3`;
      • for 0 < μ < M (below the octonion scale) `1/α` STRICTLY EXCEEDS 42 (screening: `1/α` grows
        toward the low-energy `≈ 137` regime) — the SIGN forced by `Tr(Q²) > 0` = Born positivity;
      • `1/α` is strictly DECREASING in the running scale μ (smaller scale ⟹ larger `1/α`).

  ## THE THEORY-NATIVE READING (why the running is READ, not looped)

  Standard QED computes the running of `1/α` by a vacuum-polarization LOOP INTEGRAL whose slope is the
  charge-squared trace of the light matter. THE THEORY DOES NOT RUN A LOOP (this is N320's stance made
  quantitative): the derived-ℝ's own Born self-overlap is the exponential/logarithm, and the screening
  DEPTH is the FINITE banked charge Born self-overlap `Tr(Q²) = 16/3` (N317 — the chiral-generation
  charge-squared trace = the colour exterior ladder second moment, grounded to the banked colour
  dimension `finrank ℚ Uhol = 3`). The loop is DISSOLVED: the running rate is a ℚ-exact number already
  in the bank, and the screening sign falls out of that number being positive (Born positivity — the
  trunk primitive).

  ## HONEST GRADE (mandatory flag — DO NOT over-claim; the ratio-vs-scale line is the whole point)

    • FORCED / structural (banked-grounded): the FORM, the octonion-scale value `1/α* = 42` at μ = M,
      the running rate `= κ · Tr(Q²)` (depth ∝ the banked `16/3`), the screening SIGN (`1/α > 42`
      below the octonion scale, from `16/3 > 0`), and the strict monotonicity in μ. These are pure real
      analysis on the derived `Cut` over two banked constants; nothing is fished.
    • ANALYTIC / LADDER-grade (route-not-yet-found for the exact NUMBER): reaching the specific
      low-energy `1/α ≈ 137` needs (a) the loop-normalization coefficient `κ` (the dressing coefficient
      — an honest PARAMETER here, exactly as N320 left the transmutation coefficient `c` a parameter),
      and (b) the scale ratio `M/μ` from the Arc-B ladder (LADDER-grade with an inception flag). So
      "`1/α_low ≈ 137`" is the ANALYTIC reading, NOT identity-grade. The clean FORCED numeric that
      falls out cleanly: `1/α = 42` at the octonion scale and `1/α > 42` strictly below it — the `137`
      direction. The measured `≈ 1/137` is REMOVABLE PROSE / costume only (G2), NEVER a proof step, and
      NO residual is chased (chasing it would be fitting).

  ## PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2)

  Delete "coupling / α / fine-structure / running / screening / charge / scale": what remains is —
  over the derived ℝ `Cut`, the affine-in-`cutLog` function `invAlphaHigh + κ · chargeTraceDepth ·
  cutLog(M/μ)`, with `invAlphaHigh = 42` and `chargeTraceDepth = 16/3` (both cast from banked ℚ
  values), is `42` at μ = M, strictly exceeds `42` for `0 < μ < M`, and is strictly decreasing in μ —
  the strict-exceed and its direction forced by the coefficient `16/3` being positive. Pure real
  analysis on the banked `cutLog`. No physics name is load-bearing.

  ## NOT FREE-FLOATING

  The production TYPEs cite the BANKED objects: `invAlphaHigh` is the cast of `1/alphaStar` (N316) and
  equals the banked `inverseAlphaStar_eq_42`; `chargeTraceDepth` is the cast of `ladderChargeTrace
  (finrank ℚ Uhol)` (N317) and equals the banked `generation_charge_trace`. The running function is
  `cutLog` (banked, over `Cut`) of the scale ratio times those banked constants — not a generic
  affine map.

  ## SEED-3 HARD GUARDS

  - G1 NO ASSERTED VALUE — `42` FALLS OUT of `inverseAlphaStar_eq_42`; `16/3` FALLS OUT of
    `generation_charge_trace`; no value of `1/α(μ)` is premised. `κ` is a genuine parameter.
  - G2 NO EMPIRICAL NUMBER — no `137`, no measured `α` in any statement or proof; the low-energy
    comparison is this prose / the costume only, fully removable.
  - G3 SCALES vs RATIOS — `1/α` is dimensionless; `M/μ` is a scale RATIO (the single scale freedom),
    not a fitted input.
  - G4 DERIVED, NOT POSITED — the running DEPTH is the banked `Tr(Q²) = 16/3` (derived), NOT fitted to
    reproduce a low-scale number; `κ` is left an honest parameter, not slipped in.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; no posited axiom,
    no proof gap, no kernel-trust bypass, no heartbeat inflation. Ground field the DERIVED ℝ `Cut` with
    the banked `cutLog`/`cutExp` (⚠ NOT Mathlib-ℝ / `Real.log` — those are never content here; Mathlib
    is MACHINERY only).
  - G7 ONE LAW — the running did not fight; the banked `cutExp_strictMono`/`cutExp_cutLog` close every
    order landing, and the screening sign is the banked `16/3 > 0`.

  DERIVED from the trunk (`inverseAlphaStar_eq_42`/`alphaStar` N316; `generation_charge_trace`/
  `ladderChargeTrace`/`Uhol` N317/N42c; `cutLog`/`cutExp_cutLog`/`cutExp_strictMono`/`cutLog_one`
  N-ContinuumLog over the derived `Cut` — standard Mathlib order/`gcongr` MACHINERY on the DERIVED
  objects, STANDARD §3). NO posited running / β-function / `α(μ)` value as content, NO Mathlib ℝ as
  content, no kernel-trust bypass.
-/
import Phys.Foundation.ContinuumLog
import Phys.Algebra.FineStructureScaleCoupling
import Phys.Algebra.ChiralGenerationChargeTrace
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (0) The derived logarithm's order lemmas (real analysis on the banked `cutLog`). -/

/-- STRICT MONOTONICITY of the derived logarithm on the positives: for `0 < a < b`,
    `cutLog a < cutLog b`. From the banked `cutExp_cutLog` (right inverse on positives) — apply it
    to turn `a < b` into `cutExp (cutLog a) < cutExp (cutLog b)` — and the banked `cutExp_strictMono`
    (`lt_iff_lt`) to pull the inequality back through the strictly monotone `cutExp`. -/
theorem cutLog_lt {a b : Cut} (ha : 0 < a) (hab : a < b) : cutLog a < cutLog b := by
  have hb : 0 < b := lt_trans ha hab
  have hexp : cutExp (cutLog a) < cutExp (cutLog b) := by
    rw [cutExp_cutLog ha, cutExp_cutLog hb]; exact hab
  exact cutExp_strictMono.lt_iff_lt.mp hexp

/-- POSITIVITY of the derived logarithm above `1`: for `1 < y`, `0 < cutLog y`. Instantiates
    `cutLog_lt` at `(1, y)` and uses the banked `cutLog_one = 0`. -/
theorem cutLog_pos {y : Cut} (hy : 1 < y) : 0 < cutLog y := by
  have := cutLog_lt (by norm_num : (0:Cut) < 1) hy
  rwa [cutLog_one] at this

/-! ## (1) The two banked structural constants, as elements of the derived ℝ. -/

/-- THE OCTONION-SCALE INVERSE COUPLING `1/α* = 42`, cast into the derived ℝ `Cut`. It is the BANKED
    arc-A reciprocal coupling (`inverseAlphaStar_eq_42`, N316), NOT a fresh literal. -/
def invAlphaHigh : Cut := ((1 / alphaStar : ℚ) : Cut)

/-- `invAlphaHigh = 42`, FALLING OUT of the banked `inverseAlphaStar_eq_42`. Never premised. -/
theorem invAlphaHigh_eq : invAlphaHigh = 42 := by
  unfold invAlphaHigh
  rw [inverseAlphaStar_eq_42]
  norm_num

/-- THE RUNNING DEPTH `Tr(Q²) = 16/3`, cast into the derived ℝ `Cut`. It is the BANKED chiral-
    generation charge-squared trace (`generation_charge_trace`, N317) — the colour exterior ladder
    second moment grounded to the banked colour dimension `finrank ℚ Uhol = 3`. NOT a fresh literal. -/
def chargeTraceDepth : Cut := ((ladderChargeTrace (Module.finrank ℚ Uhol) : ℚ) : Cut)

/-- `chargeTraceDepth = 16/3`, FALLING OUT of the banked `generation_charge_trace`. Never premised. -/
theorem chargeTraceDepth_eq : chargeTraceDepth = 16 / 3 := by
  unfold chargeTraceDepth
  rw [generation_charge_trace]
  norm_num

/-- ★ THE RUNNING DEPTH IS POSITIVE (Born positivity): `0 < chargeTraceDepth`. The charge Born
    self-overlap `Tr(Q²) = 16/3 > 0`. This positivity is what forces the SCREENING SIGN below. -/
theorem chargeTraceDepth_pos : 0 < chargeTraceDepth := by
  rw [chargeTraceDepth_eq]; norm_num

/-! ## (2) The running inverse coupling and its scale reading. -/

/-- THE RUNNING INVERSE FINE-STRUCTURE COUPLING `1/α(μ)` over the derived ℝ: the octonion-scale value
    `1/α* = 42` plus the running term `κ · Tr(Q²) · cutLog(M/μ)`. `κ` is the loop-normalization
    PARAMETER (the dressing coefficient — an honest parameter, exactly as N320 left the transmutation
    coefficient `c`); `M` is the closure/octonion scale, `μ` the running scale. The running DEPTH is
    the banked charge Born self-overlap `chargeTraceDepth`; the scale enters only through the banked
    derived logarithm `cutLog` of the ratio `M/μ`. -/
def invAlphaRun (κ M μ : Cut) : Cut := invAlphaHigh + κ * chargeTraceDepth * cutLog (M / μ)

/-- ★ AT THE OCTONION SCALE `μ = M` the running coupling IS the un-dressed value `1/α* = 42`. The
    scale ratio is `1`, `cutLog 1 = 0` (banked), so the running term vanishes. Ties the running
    function to the banked arc-A landing at its own scale. -/
theorem invAlphaRun_at_high (κ M : Cut) (hM : M ≠ 0) :
    invAlphaRun κ M M = invAlphaHigh := by
  unfold invAlphaRun
  rw [div_self hM, cutLog_one]
  ring

/-- ★★ THE RUNNING RATE: `1/α(μ) = 42 + κ · (16/3) · cutLog(M/μ)`. The slope of the running IS `κ`
    times the banked charge Born self-overlap `Tr(Q²) = 16/3` — the derived screening depth, read off
    the bank, not integrated from a loop. -/
theorem invAlphaRun_rate (κ M μ : Cut) :
    invAlphaRun κ M μ = 42 + κ * (16 / 3) * cutLog (M / μ) := by
  unfold invAlphaRun
  rw [invAlphaHigh_eq, chargeTraceDepth_eq]

/-- ★★★ THE SCREENING LANDING: below the octonion scale (`0 < μ < M`) with `κ > 0`, the inverse
    coupling STRICTLY EXCEEDS the octonion value `1/α* = 42` — `1/α` runs UP from `42` toward the
    low-energy (`≈ 137`) regime. The SIGN is forced by `chargeTraceDepth = 16/3 > 0` (Born
    positivity): `M/μ > 1` so `cutLog(M/μ) > 0`, and the positive coefficient makes the running term
    strictly positive. -/
theorem invAlphaRun_screening (κ M μ : Cut) (hκ : 0 < κ) (hμ : 0 < μ) (hμM : μ < M) :
    invAlphaHigh < invAlphaRun κ M μ := by
  unfold invAlphaRun
  have h1 : (1 : Cut) < M / μ := by rw [one_lt_div hμ]; exact hμM
  have hlog : 0 < cutLog (M / μ) := cutLog_pos h1
  have hcoeff : 0 < κ * chargeTraceDepth := mul_pos hκ chargeTraceDepth_pos
  have : 0 < κ * chargeTraceDepth * cutLog (M / μ) := mul_pos hcoeff hlog
  linarith

/-- ★★ THE RUNNING IS STRICTLY DECREASING IN THE SCALE `μ`: for `0 < μ₁ < μ₂` (and `κ, M > 0`), the
    inverse coupling at the SMALLER scale `μ₁` is strictly LARGER — `1/α` runs up as the scale runs
    down. From `cutLog` strict monotonicity on the ratio `M/μ` (which decreases as μ increases). -/
theorem invAlphaRun_strictAntitone_mu (κ M μ1 μ2 : Cut) (hκ : 0 < κ) (hM : 0 < M)
    (h1 : 0 < μ1) (h12 : μ1 < μ2) :
    invAlphaRun κ M μ2 < invAlphaRun κ M μ1 := by
  unfold invAlphaRun
  have h2 : 0 < μ2 := lt_trans h1 h12
  have hdiv : M / μ2 < M / μ1 := by gcongr
  have hpos2 : 0 < M / μ2 := div_pos hM h2
  have hlog : cutLog (M / μ2) < cutLog (M / μ1) := cutLog_lt hpos2 hdiv
  have hcoeff : 0 < κ * chargeTraceDepth := mul_pos hκ chargeTraceDepth_pos
  have := mul_lt_mul_of_pos_left hlog hcoeff
  linarith

/-- THE `1/α` SCALE READING bundled: at the octonion scale `1/α = 1/α* = 42`; the running rate is `κ`
    times the banked charge Born self-overlap `16/3`; below the octonion scale `1/α > 42` (screening,
    the `137` direction); and `1/α` decreases strictly in the running scale. The D3 landing tying the
    banked coupling (N316) and the banked charge trace (N317) into the derived-ℝ running structure. -/
theorem fineStructureRunning_reading (κ M μ : Cut) (hκ : 0 < κ) (hμ : 0 < μ) (hμM : μ < M) :
    invAlphaRun κ M M = invAlphaHigh ∧
    invAlphaRun κ M μ = 42 + κ * (16 / 3) * cutLog (M / μ) ∧
    invAlphaHigh < invAlphaRun κ M μ :=
  ⟨invAlphaRun_at_high κ M (ne_of_gt (lt_trans hμ hμM)),
   invAlphaRun_rate κ M μ,
   invAlphaRun_screening κ M μ hκ hμ hμM⟩

/-! ## (3) W8 NON-VACUITY WITH TEETH. -/

/-- W8: the octonion-scale value is genuinely `42`, NOT the WRONG `1/49` (the degenerate diagonal
    count `n² = 49`). Ties the running's high-scale anchor to the correct banked channel count. -/
theorem invAlphaHigh_ne_wrong : invAlphaHigh ≠ 49 := by
  rw [invAlphaHigh_eq]; norm_num

/-- ★ W8 — THE DEPTH IS LOAD-BEARING: the running depth is genuinely the charge Born self-overlap
    `16/3`, NOT zero. A zero depth (no running) would keep `1/α` pinned at `42` at all scales, killing
    the screening. The screening reading depends on `chargeTraceDepth ≠ 0`. -/
theorem chargeTraceDepth_ne_zero : chargeTraceDepth ≠ 0 := by
  rw [chargeTraceDepth_eq]; norm_num

/-- ★ W8 — THE COLOUR COUNT BITES: the running depth is the `n_c = 3` value `16/3`, NOT the WRONG
    `n_c = 2` value `ladderChargeTrace 2 = 3`. A mis-counted colour dimension would give the wrong
    running rate. The `16/3` is specifically the derived colour-triplet value. -/
theorem chargeTraceDepth_ne_wrong_colour : chargeTraceDepth ≠ ((ladderChargeTrace 2 : ℚ) : Cut) := by
  rw [chargeTraceDepth_eq]
  have h : (ladderChargeTrace 2 : ℚ) = 3 := by
    have := ladderChargeTrace_two_ne
    -- ladderChargeTrace 2 = 3 (proved inside ladderChargeTrace_two_ne); recompute directly
    unfold ladderChargeTrace
    have hcast : (∑ S : Finset (Fin 2), ((S.card : ℚ)) ^ 2) = 6 := by
      have h2 : (∑ S : Finset (Fin 2), (S.card) ^ 2) = 6 := by decide
      calc (∑ S : Finset (Fin 2), ((S.card : ℚ)) ^ 2)
          = ((∑ S : Finset (Fin 2), (S.card) ^ 2 : ℕ) : ℚ) := by push_cast; rfl
        _ = ((6 : ℕ) : ℚ) := by rw [h2]
        _ = 6 := by norm_num
    have hstep : (∑ S : Finset (Fin 2), ((S.card : ℚ) / (2 : ℚ)) ^ 2)
        = (∑ S : Finset (Fin 2), ((S.card : ℚ)) ^ 2) / 4 := by
      rw [Finset.sum_div]; apply Finset.sum_congr rfl; intro S _; ring
    rw [show ((2 : ℕ) : ℚ) = (2 : ℚ) from by norm_num, hstep, hcast]; norm_num
  rw [h]; norm_num

/-- ★ W8 — THE SCREENING SIGN IS LOAD-BEARING (antiscreening would break it): with the CORRECT
    positive depth `16/3`, `1/α` runs strictly UP below the octonion scale. If the depth carried the
    WRONG (negative) sign — antiscreening — the running term would be strictly negative and `1/α`
    would run DOWN. Here we exhibit that the correct running term is strictly positive, so the
    screening direction genuinely depends on `chargeTraceDepth > 0` (Born positivity). -/
theorem invAlphaRun_screening_needs_positive_depth (κ M μ : Cut) (hκ : 0 < κ) (hμ : 0 < μ)
    (hμM : μ < M) : 0 < κ * chargeTraceDepth * cutLog (M / μ) := by
  have h1 : (1 : Cut) < M / μ := by rw [one_lt_div hμ]; exact hμM
  have hlog : 0 < cutLog (M / μ) := cutLog_pos h1
  exact mul_pos (mul_pos hκ chargeTraceDepth_pos) hlog

end

end Phys.Algebra
