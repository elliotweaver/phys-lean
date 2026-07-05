/-
  # N342 — SEEDED ANALYTIC-COMPLETION D4: THE WEINBERG ANGLE'S SCALE READING
  #         (arc-D, docs/SEED_ANALYTIC_COMPLETION.md §D4) — toward the low-energy `sin²θ_W ≈ 0.231`.

  Over the derived ℝ `ContinuumQ.Cut` and the banked derived logarithm `cutLog`, this node banks the
  RUNNING (scale-dressed) weak mixing angle `sin²θ_W(μ)` as the banked one-coupling mixing (N319) of a
  running GUT-normalization ratio, with EVERY structural datum grounded to a banked object:

      isoDepth      = Tr(T3²) = 2       (N318 `generation_isospin_trace`, the isospin running depth)
      hyperDepth    = Tr(Y²)  = 10/3    (N317/N318, = Tr(Q²) − Tr(T3²) = 16/3 − 2)
      invAlpha2High = 1/α*    = 42      (N341/N316 `invAlphaHigh`, the isospin high-scale intercept)
      invAlphaYHigh = (5/3)·(1/α*) = 70 (the GUT-normalized hypercharge high-scale intercept)

      invAlpha2 d2 κ M μ = invAlpha2High + κ·d2·cutLog(M/μ)          (running isospin inverse coupling)
      invAlphaY  κ M μ   = invAlphaYHigh + κ·hyperDepth·cutLog(M/μ)  (running hypercharge inverse coupling)
      sinSqRun d2 κ M μ  = invAlpha2 / (invAlpha2 + invAlphaY)       ( = 1/(1+r), the N319 mixing form)

  and reads off the scale-dressing:
      • at the closure scale μ = M, `sin²θ_W = 42/(42+70) = 3/8` — the banked high-scale mixing
        (`oneCouplingMixing (5/3) = 3/8`, N319; `weinberg_lands_3_8`, N318);
      • ★ MATTER-ONLY STATIONARITY: with the matter isospin depth `d2 = isoDepth = 2`, `sin²θ_W = 3/8`
        at EVERY scale — matter ALONE does not run the mixing, because the banked matter trace ratio
        `Tr(Y²):Tr(T3²) = (10/3):2` EQUALS the GUT intercept ratio `5/3` (`depth_proportional`), so the
        two inverse couplings stay proportional (`invAlphaY_eq_matter`) and the ratio `r` is frozen;
      • ★★★ THE DEPARTURE (toward `≈ 0.231`): the departure from `3/8` is driven ENTIRELY by the
        non-abelian SU(2) self-coupling (asymptotic freedom / anti-screening) — an effect ABSENT for the
        abelian hypercharge — which REDUCES the effective isospin depth `d2` below the matter value `2`.
        For `0 < d2 < isoDepth` below the octonion scale (`0 < μ < M`, `κ > 0`), `sin²θ_W < 3/8`, running
        DOWN toward the low-energy regime. The SIGN is forced by `d2 < isoDepth`.

  ## THE THEORY-NATIVE READING (why the running is READ, not looped — and what it reveals)

  Standard electroweak theory computes `sin²θ_W(μ)` by integrating TWO renormalization-group equations
  for `1/α_Y` and `1/α_2` with textbook one-loop coefficients `b₁, b₂`. THE THEORY DOES NOT RUN A LOOP
  (this is N341's stance carried to the mixing): the running DEPTH of each inverse coupling is the FINITE
  banked charge-squared trace of its own generator — `Tr(Y²) = 10/3` for hypercharge, `Tr(T3²) = 2` for
  isospin — and the mixing itself is the banked one-coupling form `1/(1+r)` (N319). Dissolving the loops
  REVEALS a fact that textbook RG obscures: because the banked MATTER trace ratio `(10/3):2` equals the
  GUT intercept ratio `5/3`, MATTER ALONE leaves `sin²θ_W` STATIONARY at `3/8`. The entire running of the
  weak mixing is therefore a PURELY NON-ABELIAN gauge effect (the SU(2) self-coupling that has no abelian
  counterpart), and its DIRECTION (down, toward `0.231`) is forced by the reduced isospin depth.

  ## HONEST GRADE (mandatory flag — DO NOT over-claim; the structural-vs-number line is the point)

    • FORCED / structural (banked-grounded): the mixing FORM (= banked `oneCouplingMixing`, N319), the
      octonion-scale value `3/8` at μ = M, the MATTER-ONLY STATIONARITY (from the banked trace
      proportionality `(10/3):2 = 5/3`), and the DEPARTURE SIGN (`sin²θ_W < 3/8` below scale once the
      non-abelian isospin depth drops below the matter value `2`). These are pure real analysis on the
      derived `Cut` over banked constants; nothing is fished.
    • ANALYTIC / LADDER-grade (route-not-yet-found for the exact NUMBER): reaching the specific low-energy
      `sin²θ_W ≈ 0.231` needs (a) the non-abelian anti-screening coefficient that fixes how far below `2`
      the effective isospin depth `d2` sits (an honest PARAMETER here, exactly as N341 left the
      loop-normalization `κ` and N320 left the transmutation coefficient `c`), and (b) the scale ratio
      `M/μ` from the Arc-B ladder (LADDER-grade with an inception flag). So "`sin²θ_W ≈ 0.231`" is the
      ANALYTIC reading, NOT identity-grade. The clean FORCED numeric: `3/8` at the octonion scale,
      stationary under matter, and strictly `< 3/8` below scale once the non-abelian term enters. The
      measured `≈ 0.231` is REMOVABLE PROSE / costume only (G2), NEVER a proof step, and NO residual is
      chased (chasing it would be fitting).

  ## PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2)

  Delete "Weinberg / weak-mixing / coupling / hypercharge / isospin / screening / gauge / GUT": what
  remains is — over the derived ℝ `Cut`, with `a₂(L) = 42 + κ·d2·L`, `a_Y(L) = 70 + κ·(10/3)·L`, `L =
  cutLog(M/μ)`, the function `a₂/(a₂+a_Y)` is `3/8` at `L = 0`; is CONSTANT `= 3/8` for all `L` when
  `d2 = 2` (because `70:(10/3) = 42:2`); and is strictly `< 3/8` for `L > 0` when `0 < d2 < 2`. Pure real
  analysis on the banked `cutLog`. No physics name is load-bearing.

  ## NOT FREE-FLOATING

  The production TYPEs cite the BANKED objects: `isoDepth` is the cast of `isospinTrace (…)` (N318) and
  equals `generation_isospin_trace`; `hyperDepth` is `ladderChargeTrace (finrank ℚ Uhol) − isoDepth`
  (N317/N318); `invAlpha2High`/`invAlphaYHigh` are casts of the banked `invAlphaHigh` (N341/N316); and the
  high-scale mixing is tied to the banked `oneCouplingMixing (5/3)` (N319). Not a generic ratio of affine
  maps.

  ## SEED-3 HARD GUARDS

  - G1 NO ASSERTED VALUE — `42`/`70` FALL OUT of `invAlphaHigh_eq`; `10/3`/`2` FALL OUT of the banked
    traces; `3/8` FALLS OUT of `oneCouplingMixing_at_5_3`; no value of `sin²θ_W(μ)` is premised. The
    non-abelian anti-screening magnitude is a genuine parameter (`d2 < isoDepth`).
  - G2 NO EMPIRICAL NUMBER — no `0.231`, no measured `sin²θ_W` in any statement or proof; the low-energy
    comparison is this prose / the costume only, fully removable.
  - G3 SCALES vs RATIOS — `sin²θ_W` is dimensionless; `M/μ` is a scale RATIO (the single scale freedom),
    not a fitted input.
  - G4 DERIVED, NOT POSITED — the running DEPTHS are the banked `Tr(Y²) = 10/3` and `Tr(T3²) = 2`; the
    non-abelian depth reduction is left an honest parameter, NOT fitted to reproduce a low-scale number.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; no posited axiom,
    no proof gap, no kernel-trust bypass, no heartbeat inflation. Ground field the DERIVED ℝ `Cut` with
    the banked `cutLog`/`cutExp` (⚠ NOT Mathlib-ℝ / `Real.log` — never content here; Mathlib is MACHINERY).
  - G7 ONE LAW — the running did not fight; the banked `cutLog_pos` closes the log positivity, the matter
    stationarity is the banked trace proportionality, and the departure sign is `d2 < isoDepth`.

  DERIVED from the trunk (`invAlphaHigh`/`cutLog_pos` N341; `generation_isospin_trace`/`fund2Weight`/
  `isospinTrace` N318; `generation_charge_trace`/`ladderChargeTrace`/`Uhol` N317/N42c; `oneCouplingMixing`/
  `oneCouplingMixing_at_5_3` N319; `cutLog`/`cutLog_one` over the derived `Cut` — standard Mathlib order/
  field MACHINERY on the DERIVED objects, STANDARD §3). NO posited running / RGE / `sin²θ_W(μ)` value as
  content, NO Mathlib ℝ as content, no kernel-trust bypass.
-/
import Phys.Algebra.FineStructureRunningCoupling
import Phys.Algebra.OneCouplingCoherence
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

/-! ## (1) The grounded running depths over the derived ℝ `Cut`. -/

/-- THE ISOSPIN RUNNING DEPTH `Tr(T3²) = 2`, cast into the derived ℝ `Cut`. It is the BANKED chiral-
    generation weak-isospin trace (`generation_isospin_trace`, N318 — the su(2)_L fundamental-2 doublet
    trace over the colour-grounded doublet count `finrank ℚ Uhol + finrank ℚ singlet = 4`). NOT a
    fresh literal. -/
def isoDepth : Cut :=
  ((isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
      (∑ i : Fin 2, (fund2Weight i) ^ 2) : ℚ) : Cut)

/-- `isoDepth = 2`, FALLING OUT of the banked `generation_isospin_trace`. Never premised. -/
theorem isoDepth_eq : isoDepth = 2 := by
  unfold isoDepth
  rw [generation_isospin_trace]
  norm_num

/-- THE HYPERCHARGE RUNNING DEPTH `Tr(Y²) = 10/3`, cast into the derived ℝ `Cut`. It is the banked
    charge trace minus the banked isospin trace, `Tr(Q²) − Tr(T3²) = 16/3 − 2 = 10/3` (N317/N318 —
    the hypercharge-trace reduction under doublet orthogonality). NOT a fresh literal. -/
def hyperDepth : Cut :=
  ((ladderChargeTrace (Module.finrank ℚ Uhol) : ℚ) : Cut) - isoDepth

/-- `hyperDepth = 10/3`, FALLING OUT of the banked charge and isospin traces. Never premised. -/
theorem hyperDepth_eq : hyperDepth = 10 / 3 := by
  unfold hyperDepth isoDepth
  rw [generation_charge_trace, generation_isospin_trace]
  norm_num

/-- ★ THE LOAD-BEARING PROPORTIONALITY: the matter trace ratio `Tr(Y²):Tr(T3²) = (10/3):2` EQUALS the
    GUT intercept ratio `5/3`. This is WHY matter ALONE does not run the mixing — the two running
    inverse couplings stay proportional at the matter depth. -/
theorem depth_proportional : hyperDepth = (5 / 3) * isoDepth := by
  rw [hyperDepth_eq, isoDepth_eq]; norm_num

/-- The isospin depth is positive (Born positivity of the trace). -/
theorem isoDepth_pos : 0 < isoDepth := by rw [isoDepth_eq]; norm_num
/-- The hypercharge depth is positive (Born positivity of the trace). -/
theorem hyperDepth_pos : 0 < hyperDepth := by rw [hyperDepth_eq]; norm_num

/-! ## (2) The GUT-normalized high-scale intercepts. -/

/-- THE ISOSPIN HIGH-SCALE INVERSE COUPLING `1/α₂(M) = 1/α* = 42`, the banked octonion-scale coupling
    (`invAlphaHigh`, N341/N316). -/
def invAlpha2High : Cut := invAlphaHigh
/-- THE GUT-NORMALIZED HYPERCHARGE HIGH-SCALE INVERSE COUPLING `1/α_Y(M) = (5/3)·(1/α*) = 70`. The
    factor `5/3` is the derived GUT normalization of hypercharge (N317/N318/N319). -/
def invAlphaYHigh : Cut := (5 / 3) * invAlphaHigh

/-- `invAlpha2High = 42`, FALLING OUT of the banked `invAlphaHigh_eq`. -/
theorem invAlpha2High_eq : invAlpha2High = 42 := invAlphaHigh_eq
/-- `invAlphaYHigh = 70`, FALLING OUT of `(5/3)·42`. -/
theorem invAlphaYHigh_eq : invAlphaYHigh = 70 := by
  unfold invAlphaYHigh; rw [invAlphaHigh_eq]; norm_num

/-- THE GUT UNIFICATION BOUNDARY CONDITION: the high-scale intercept ratio is exactly `5/3`
    (`1/α_Y(M) = (5/3)·(1/α₂(M))`). This is the boundary value of the ratio `r` that gives `3/8`. -/
theorem intercept_proportional : invAlphaYHigh = (5 / 3) * invAlpha2High := rfl

/-! ## (3) The running inverse couplings, ratio, and mixing. -/

/-- THE RUNNING ISOSPIN INVERSE COUPLING over the derived ℝ: `1/α₂(μ) = 42 + κ·d2·cutLog(M/μ)`. `d2`
    is the isospin running depth — the matter value is `isoDepth = 2`; the non-abelian SU(2)
    self-coupling REDUCES it below `2`. `κ` is the loop-normalization PARAMETER (an honest parameter,
    exactly as N341 left `κ`); the scale enters through the banked `cutLog(M/μ)`. -/
def invAlpha2 (d2 κ M μ : Cut) : Cut := invAlpha2High + κ * d2 * cutLog (M / μ)
/-- THE RUNNING HYPERCHARGE INVERSE COUPLING over the derived ℝ: `1/α_Y(μ) = 70 + κ·(10/3)·cutLog(M/μ)`.
    Abelian — its running depth is the banked matter hypercharge trace `hyperDepth = 10/3` (no
    non-abelian self-coupling reduction). -/
def invAlphaY (κ M μ : Cut) : Cut := invAlphaYHigh + κ * hyperDepth * cutLog (M / μ)
/-- THE RUNNING WEAK MIXING ANGLE `sin²θ_W(μ)` over the derived ℝ: the banked one-coupling mixing form
    `1/(1+r)` (N319) written as `a₂/(a₂+a_Y)`, `r = a_Y/a₂`. This IS the banked N319 mixing structure
    applied to the running couplings. -/
def sinSqRun (d2 κ M μ : Cut) : Cut :=
  invAlpha2 d2 κ M μ / (invAlpha2 d2 κ M μ + invAlphaY κ M μ)

/-! ## (4) The scale reading — the landings. -/

/-- ★ AT THE OCTONION SCALE `μ = M` the mixing IS `sin²θ_W = 3/8` (`42/(42+70)`). The scale ratio is
    `1`, `cutLog 1 = 0` (banked), so both running terms vanish and the mixing is the GUT value. -/
theorem sinSqRun_at_high (d2 κ M : Cut) (hM : M ≠ 0) : sinSqRun d2 κ M M = 3 / 8 := by
  unfold sinSqRun invAlpha2 invAlphaY
  rw [div_self hM, cutLog_one, invAlpha2High_eq, invAlphaYHigh_eq]
  norm_num

/-- ★ THE HIGH-SCALE MIXING IS THE BANKED N319 ONE-COUPLING MIXING: at μ = M, `sin²θ_W` equals the
    banked `oneCouplingMixing (5/3) = 3/8`. Ties the running mixing at its own scale to the banked
    Arc-A landing. -/
theorem sinSqRun_high_eq_banked_mixing (d2 κ M : Cut) (hM : M ≠ 0) :
    sinSqRun d2 κ M M = ((oneCouplingMixing (5 / 3) : ℚ) : Cut) := by
  rw [sinSqRun_at_high d2 κ M hM, oneCouplingMixing_at_5_3]; norm_num

/-- THE MATTER-DEPTH PROPORTIONALITY OF THE RUNNING COUPLINGS: at the matter isospin depth
    `d2 = isoDepth`, the running hypercharge coupling stays exactly `(5/3)` times the running isospin
    coupling — because both the intercepts (`5/3`) and the depths (`(10/3):2 = 5/3`) are proportional. -/
theorem invAlphaY_eq_matter (κ M μ : Cut) :
    invAlphaY κ M μ = (5 / 3) * invAlpha2 isoDepth κ M μ := by
  unfold invAlphaY invAlpha2
  rw [intercept_proportional, depth_proportional]; ring

/-- ★★★ MATTER-ONLY STATIONARITY: with the matter isospin depth `d2 = isoDepth = 2`, `sin²θ_W = 3/8`
    at ALL scales — matter ALONE does NOT run the mixing. Because `invAlphaY = (5/3)·invAlpha2` at the
    matter depth (`invAlphaY_eq_matter`), the ratio `r = a_Y/a₂ = 5/3` is frozen and the mixing stays
    `1/(1+5/3) = 3/8`. The banked matter trace ratio `(10/3):2 = 5/3` is what forces this. -/
theorem sinSqRun_matter_stationary (κ M μ : Cut) (h2 : invAlpha2 isoDepth κ M μ ≠ 0) :
    sinSqRun isoDepth κ M μ = 3 / 8 := by
  unfold sinSqRun
  rw [invAlphaY_eq_matter]
  have hne : invAlpha2 isoDepth κ M μ + (5 / 3) * invAlpha2 isoDepth κ M μ ≠ 0 := by
    have h : invAlpha2 isoDepth κ M μ + (5 / 3) * invAlpha2 isoDepth κ M μ
        = (8 / 3) * invAlpha2 isoDepth κ M μ := by ring
    rw [h]; exact mul_ne_zero (by norm_num) h2
  rw [div_eq_iff hne]; ring

/-- ★★★ THE DEPARTURE (toward `0.231`): with the non-abelian-reduced isospin depth `0 < d2 < isoDepth`
    (`= 2`) below the octonion scale (`0 < μ < M`, `κ > 0`), `sin²θ_W` STRICTLY DROPS below `3/8` — the
    mixing runs DOWN toward the low-energy (`≈ 0.231`) regime. The SIGN is forced by `d2 < isoDepth`
    (the SU(2) non-abelian anti-screening, absent for the abelian hypercharge) together with
    `κ·cutLog(M/μ) > 0`. -/
theorem sinSqRun_departs_down (d2 κ M μ : Cut) (hκ : 0 < κ) (hd2 : 0 < d2)
    (hd2lt : d2 < isoDepth) (hμ : 0 < μ) (hμM : μ < M) :
    sinSqRun d2 κ M μ < 3 / 8 := by
  have hL : 0 < cutLog (M / μ) := cutLog_pos (by rw [one_lt_div hμ]; exact hμM)
  have hd2lt2 : d2 < 2 := by rw [isoDepth_eq] at hd2lt; exact hd2lt
  have key : 5 * invAlpha2 d2 κ M μ - 3 * invAlphaY κ M μ < 0 := by
    unfold invAlpha2 invAlphaY
    rw [invAlpha2High_eq, invAlphaYHigh_eq, hyperDepth_eq]
    have hexpand :
        5 * (42 + κ * d2 * cutLog (M / μ)) - 3 * (70 + κ * (10 / 3) * cutLog (M / μ))
          = 5 * κ * cutLog (M / μ) * (d2 - 2) := by ring
    rw [hexpand]
    have hpos : 0 < 5 * κ * cutLog (M / μ) :=
      mul_pos (mul_pos (by norm_num : (0:Cut) < 5) hκ) hL
    exact mul_neg_of_pos_of_neg hpos (by linarith)
  have hsum : 0 < invAlpha2 d2 κ M μ + invAlphaY κ M μ := by
    unfold invAlpha2 invAlphaY
    rw [invAlpha2High_eq, invAlphaYHigh_eq, hyperDepth_eq]
    have h1 : 0 < κ * d2 * cutLog (M / μ) := mul_pos (mul_pos hκ hd2) hL
    have h2 : 0 < κ * (10 / 3) * cutLog (M / μ) := mul_pos (mul_pos hκ (by norm_num)) hL
    linarith
  unfold sinSqRun
  rw [div_lt_iff₀ hsum]
  nlinarith [key]

/-- THE `sin²θ_W` SCALE READING bundled: at the octonion scale `sin²θ_W = 3/8`; at the matter isospin
    depth the mixing is stationary `= 3/8` at every scale; and once the non-abelian isospin depth drops
    below the matter value `2`, the mixing runs strictly below `3/8` (the `0.231` direction). The D4
    landing tying the banked mixing (N319) and the banked traces (N317/N318) into the derived-ℝ running
    structure. -/
theorem weinberg_running_reading (κ M μ : Cut) (hκ : 0 < κ) (hμ : 0 < μ) (hμM : μ < M)
    (h2 : invAlpha2 isoDepth κ M μ ≠ 0) :
    sinSqRun isoDepth κ M M = 3 / 8 ∧
    sinSqRun isoDepth κ M μ = 3 / 8 ∧
    (∀ d2 : Cut, 0 < d2 → d2 < isoDepth → sinSqRun d2 κ M μ < 3 / 8) :=
  ⟨sinSqRun_at_high isoDepth κ M (ne_of_gt (lt_trans hμ hμM)),
   sinSqRun_matter_stationary κ M μ h2,
   fun d2 hd2 hd2lt => sinSqRun_departs_down d2 κ M μ hκ hd2 hd2lt hμ hμM⟩

/-! ## (5) W8 NON-VACUITY WITH TEETH. -/

/-- W8 — the isospin depth is genuinely `2`, NOT zero. A zero depth would kill the running term. -/
theorem isoDepth_ne_zero : isoDepth ≠ 0 := by rw [isoDepth_eq]; norm_num
/-- W8 — the hypercharge depth is genuinely `10/3`, NOT zero. -/
theorem hyperDepth_ne_zero : hyperDepth ≠ 0 := by rw [hyperDepth_eq]; norm_num

/-- ★ W8 — THE DEPTHS ARE GENUINELY DISTINCT: `hyperDepth = 10/3 ≠ 2 = isoDepth`. The mixing running
    structure depends on the two generators having DIFFERENT charge-squared traces. -/
theorem depths_distinct : hyperDepth ≠ isoDepth := by rw [hyperDepth_eq, isoDepth_eq]; norm_num

/-- ★ W8 — THE HIGH-SCALE VALUE IS `3/8`, NOT THE WRONG `1/4`. Ties the running's anchor to the
    correct banked GUT mixing. A wrong intercept ratio would break it. -/
theorem sinSqHigh_ne_wrong (d2 κ M : Cut) (hM : M ≠ 0) : sinSqRun d2 κ M M ≠ 1 / 4 := by
  rw [sinSqRun_at_high d2 κ M hM]; norm_num

/-- ★ W8 — THE DEPARTURE SIGN IS LOAD-BEARING: the departure quantity `5·a₂ − 3·a_Y` is strictly
    NEGATIVE precisely because `d2 < isoDepth` (the non-abelian anti-screening reduces the isospin
    depth below `2`), with `κ·cutLog(M/μ) > 0`. A depth `d2 ≥ isoDepth` would NOT depart down. So the
    `0.231` direction genuinely depends on the reduced isospin depth `d2 < isoDepth`. -/
theorem departure_needs_reduced_depth (d2 κ M μ : Cut) (hκ : 0 < κ) (hμ : 0 < μ) (hμM : μ < M)
    (hd2lt : d2 < isoDepth) :
    5 * invAlpha2 d2 κ M μ - 3 * invAlphaY κ M μ < 0 := by
  have hL : 0 < cutLog (M / μ) := cutLog_pos (by rw [one_lt_div hμ]; exact hμM)
  have hd2lt2 : d2 < 2 := by rw [isoDepth_eq] at hd2lt; exact hd2lt
  unfold invAlpha2 invAlphaY
  rw [invAlpha2High_eq, invAlphaYHigh_eq, hyperDepth_eq]
  have hexpand :
      5 * (42 + κ * d2 * cutLog (M / μ)) - 3 * (70 + κ * (10 / 3) * cutLog (M / μ))
        = 5 * κ * cutLog (M / μ) * (d2 - 2) := by ring
  rw [hexpand]
  have hpos : 0 < 5 * κ * cutLog (M / μ) := mul_pos (mul_pos (by norm_num) hκ) hL
  exact mul_neg_of_pos_of_neg hpos (by linarith)

end

end Phys.Algebra
