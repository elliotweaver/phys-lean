/-
  # N460 — SEEDED EXACT-DRESSING X1 (arc X, docs/SEED_EXACT_DRESSING.md §X1):
  #         THE LOOP/PHASE-WRAP NORMALIZATION κ = 1/(3·π), DERIVED FROM THE GATHER SELF-OVERLAP.
  #         (kills the last FREE PARAMETER in the banked running form N341/N-Weinberg.)

  The banked running inverse coupling `invAlphaRun κ M μ = 42 + κ·(16/3)·cutLog(M/μ)`
  (`FineStructureRunningCoupling.lean`, N341) carried ONE honest free parameter: the loop/phase-wrap
  normalization `κ`. This node DERIVES it — `κ = 1/(3·cutPi)` — as the geometric factor of ONE full
  phase-wrap of the gather's Born self-overlap over the fold's return surface, closing the last knob.

  ## THE THEORY-NATIVE READING (the running IS the gather, resolved at scale — seed §X1)

  The coupling IS the per-channel Born self-overlap of the gather (N313/N314/N411); "running" is that
  self-overlap RESOLVED AT A SCALE. The LEADING loop-normalization `κ` is the geometric factor of ONE
  full phase-wrap of the self-overlap over the fold's RETURN SURFACE (the 2-sphere the fold's
  self-look-back closes on, banked N328 `ContinuumSphereFlux`). Concretely:

    • A channel's self-overlap with its phase-rotated self projects as the Born-SQUARE `cutCos θ ^ 2`
      (the Born rule = self-overlap = positivity, the trunk primitive: the real overlap is `cutCos θ`,
      the observed weight its square).
    • Accumulated over the return-surface MERIDIAN, weighted by the banked meridian arc measure
      `cutSin θ` (the SAME measure whose total flux `∫₀^π cutSin = 2` gives the banked 2-sphere solid
      angle `4·cutPi`, N328), the self-overlap flux is the DERIVED integral
          meridianFlux(cutPi) = ∫₀^{cutPi} cutCos²·cutSin = 2/3.
      Its ELEMENTARY antiderivative is `−cutCos³/3` (∫u²du = u³/3), evaluated between the poles
      `cutCos 0 = 1` and the antipode `cutCos cutPi = −1`: `(1 − (−1)³)/3 = 2/3`.
    • Normalized PER full phase-wrap — the banked azimuthal turn `azimuthalTurn = 2·cutPi` (N328), the
      closed-loop measure — the leading loop coefficient is
          κ = meridianFlux(cutPi) / azimuthalTurn = (2/3)/(2·cutPi) = 1/(3·cutPi).

  The "3" is FORCED by the cubic antiderivative `∫u²du = u³/3` (the ⟨cos²⟩ isotropy share over the
  3-dimensional return surface), NOT inserted. The "1/π" is the loop-measure normalization by the phase
  wrap `2·cutPi` (the closed-orbit circumference — exactly QED's loop `1/(2π)`). The whole `1/(3π)` is
  the standard one-loop vacuum-polarization coefficient; here the LOOP INTEGRAL is DISSOLVED into the
  return-surface self-overlap flux — the closed object the perturbative loop only approximates.

  ## WHY THIS IS NOT A POSIT (STANDARD §3 — number-tower / ℝ gate; seed G4/G6)

  Nothing imports `Real.pi`, `Real.cos`, a Mathlib sphere measure, or a Mathlib interval-integral as
  CONTENT. `κ` FALLS OUT of evaluating two DERIVED analytic objects over the derived ℝ `Cut`:
    • the meridian self-overlap flux = the DERIVED termwise-antiderivative-difference integral
      (the N328 FTC form), of the integrand `cutCos²·cutSin` which the banked addition formulas
      LINEARIZE to `(cutSin θ + cutSin 3θ)/4` (`meridianIntegrand_linearize`);
    • the azimuthal phase wrap `2·cutPi` (banked N328).
  Both are pure real analysis on `Cut` over the banked `cutCos`/`cutSin`/`cutPi`/`sinAntideriv`; `κ` is
  NEVER a premise. This is a DERIVATION OF AN ALREADY-BANKED OBJECT (the running form's free `κ`), not
  a new physics object (seed reframing: the arc adds NO new object).

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete "coupling / loop / self-overlap / screening / Born / meridian / phase-wrap / return-surface":
  what remains is the pure statement, over the derived ℝ `Cut`, that
      (∫₀^{cutPi} cutCos²·cutSin) / (2·cutPi) = 1/(3·cutPi),
  with the integral evaluated `= 2/3` via the termwise antiderivative `(sinAntideriv + sin3Antideriv)/4`
  (closed form `(1 − cutCos³)/3`) and the antipode `cutCos cutPi = −1`. No physics name is load-bearing.

  ## NOT FREE-FLOATING (seed / SOUL free-floating rail)

  Every production TYPE mentions the banked derived objects: `cutCos`/`cutSin`/`cutPi`/`sinAntideriv`/
  `azimuthalTurn` (over `Cut`, N323–N328) and the banked running form `invAlphaRun`/`invAlphaHigh`
  (N341). `κ = kappaLeading` is tied straight into the banked `invAlphaRun` (`invAlphaRun_kappaLeading`,
  `loopNormalization_screens`), removing its free parameter — not a generic real-analysis lemma.

  ## SEED HARD GUARDS

  - G1 NO ASSERTED VALUE — `2/3` FALLS OUT of the derived integral; `1/(3·cutPi)` FALLS OUT of the
    flux over the azimuthal turn; no value of `κ` is premised.
  - G2 NO EMPIRICAL NUMBER — no `137`, no measured `α`, no `1/(3π)` written as a literal; the loop
    coefficient is COMPUTED. The measured constants are this prose only, fully removable.
  - G3 EXACT — `2/3` and `1/(3·cutPi)` are EXACT derived reals of `Cut`; no error bar, no 3-digit toy.
  - G4 DERIVED, NOT POSITED — `κ` is built from the return-surface self-overlap flux / phase wrap, not
    axiomatized; the loop is dissolved into the banked N328 flux.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free,
    zero posited axioms, no compiled-decision-kernel bypass, no heartbeat inflation. Ground field the
    DERIVED ℝ `Cut`; ⚠ NO Mathlib `Real`/`Complex`/`Trigonometric` as content — Mathlib is MACHINERY only.
  - G7 ONE LAW — the derivation did not fight; the banked N328 FTC form + addition formulas close it.
  - G8 TEETH (W8) — `meridianFlux_cutPi_ne_two`: the Born-SQUARE `cutCos²` weighting BITES — the
    UNWEIGHTED meridian flux `∫cutSin = 2` (no self-overlap) would give the WRONG `κ = 1/cutPi`;
    `kappaLeading_ne_wrong` excludes that `1/π`; `kappaLeading_ne_zero` (a zero `κ` kills the running).

  DERIVED from the trunk (`sinAntideriv`/`sinAntideriv_eq`/`sinAntideriv_cutPi`/`azimuthalTurn` N328;
  `cutCos`/`cutSin`/`cutCos_add`/`cutSin_add`/`cutSin_sq_add_cutCos_sq` N323–N324; `cutPi`/`cutPi_pos`/
  `cutCos_cutPi`/`cutCos_add_two_cutPi` N325; `invAlphaRun`/`invAlphaRun_rate`/`invAlphaRun_screening`/
  `invAlphaHigh` N341 — standard Mathlib `tsum`/`ring`/`field_simp`/`linear_combination` MACHINERY on
  the DERIVED objects, STANDARD §3). NO posited `κ`/loop/β value as content, NO Mathlib ℝ as content.
-/
import Phys.Foundation.ContinuumSphereFlux
import Phys.Algebra.FineStructureRunningCoupling
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE SCALED-SINE DEFINITE INTEGRAL `∫₀ˣ cutSin(3·)` over the derived ℝ.

    Built termwise EXACTLY as the banked `sinAntideriv` (N328): the `m`-th antiderivative term of
    `sinTermC (3x) m = (-1)ᵐ (3x)^(2m+1)/(2m+1)!` is `(-1)ᵐ 3^(2m+1) x^(2m+2)/(2m+2)!`, which is
    `−(1/3)·cosTermC (3x) (m+1)`. Summing (a shift of the BANKED cosine summability, N323, scaled)
    gives the closed form `∫₀ˣ cutSin(3·) = (1 − cutCos 3x)/3` — the FTC antiderivative-difference. -/

/-- The `m`-th termwise antiderivative of the scaled sine series `sinTermC (3x)`, w.r.t. `x`. -/
def sin3AntiderivTerm (x : Cut) (m : ℕ) : Cut :=
  (-1) ^ m * (3 : Cut) ^ (2 * m + 1) * x ^ (2 * m + 2) / ((2 * m + 2).factorial : Cut)

/-- ★ THE KEY TERM IDENTITY: the `m`-th scaled-sine antiderivative term is `−(1/3)·cosTermC (3x) (m+1)`.
    The termwise FTC `d/dx [−(1/3) cosTermC (3x) (m+1)] = sinTermC (3x) m` read backwards. -/
theorem sin3AntiderivTerm_eq (x : Cut) (m : ℕ) :
    sin3AntiderivTerm x m = -(1 / 3) * cosTermC (3 * x) (m + 1) := by
  unfold sin3AntiderivTerm cosTermC
  have he : 2 * (m + 1) = 2 * m + 2 := by ring
  rw [he]
  have hsign : (-1 : Cut) ^ (m + 1) = -(-1) ^ m := by rw [pow_succ]; ring
  rw [hsign]
  have hpow : ((3 : Cut) * x) ^ (2 * m + 2) = (3 : Cut) ^ (2 * m + 2) * x ^ (2 * m + 2) := by
    rw [mul_pow]
  rw [hpow]
  have h3 : (3 : Cut) ^ (2 * m + 2) = 3 * (3 : Cut) ^ (2 * m + 1) := by rw [← pow_succ']
  rw [h3]; ring

/-- The scaled-sine antiderivative terms are summable over the derived ℝ — a shift of the BANKED
    cosine summability (N323), scaled by `−1/3`. NO new majorant. -/
theorem sin3AntiderivTerm_summable (x : Cut) : Summable (sin3AntiderivTerm x) := by
  have h : Summable (fun m => -(1 / 3) * cosTermC (3 * x) (m + 1)) :=
    (((summable_nat_add_iff 1).mpr (cosTermC_summable (3 * x))).mul_left _)
  refine h.congr ?_
  intro m; rw [sin3AntiderivTerm_eq]

/-- ★ THE SCALED-SINE DEFINITE INTEGRAL `∫₀ˣ cutSin(3·)` over the derived ℝ, as the `tsum` of the
    termwise antiderivatives (vanishing at `0`). A `tsum` over the Cauchy-complete `Cut`, the N328
    FTC form — NOT a Mathlib interval-integral. -/
def sin3Antideriv (x : Cut) : Cut := ∑' m, sin3AntiderivTerm x m

/-- ★★ THE FTC (antiderivative-difference form) FOR THE SCALED SINE: `∫₀ˣ cutSin(3·) = (1 − cutCos 3x)/3`.
    Reindexes to `∑' m, −(1/3) cosTermC (3x) (m+1)` and peels the head term (`= 1`) of the BANKED
    cosine series. Pure `tsum` manipulation — no integral apparatus. -/
theorem sin3Antideriv_eq (x : Cut) : sin3Antideriv x = (1 - cutCos (3 * x)) / 3 := by
  unfold sin3Antideriv
  have hstep : (∑' m, sin3AntiderivTerm x m) = ∑' m, -(1 / 3) * cosTermC (3 * x) (m + 1) := by
    apply tsum_congr; intro m; rw [sin3AntiderivTerm_eq]
  rw [hstep, tsum_mul_left]
  have hz := (cosTermC_summable (3 * x)).tsum_eq_zero_add
  have h0 : cosTermC (3 * x) 0 = 1 := by unfold cosTermC; simp
  rw [h0] at hz
  have hcut : cutCos (3 * x) = ∑' n, cosTermC (3 * x) n := rfl
  rw [← hcut] at hz
  have hshift : (∑' n, cosTermC (3 * x) (n + 1)) = cutCos (3 * x) - 1 := by linarith [hz]
  rw [hshift]; ring

/-! ## (2) THE INTEGRAND LINEARIZATION AND THE TRIPLE-ANGLE CLOSED FORM (banked addition formulas). -/

/-- ★ THE TRIPLE-ANGLE IDENTITY over the derived ℝ: `cutCos (3x) = 4·cutCos³ x − 3·cutCos x`. From the
    banked addition formula applied twice (`3x = x + (x + x)`) + the banked Pythagorean identity. -/
theorem cutCos_three_mul (x : Cut) :
    cutCos (3 * x) = 4 * cutCos x ^ 3 - 3 * cutCos x := by
  have h3 : (3 : Cut) * x = x + (x + x) := by ring
  rw [h3, cutCos_add, cutCos_add, cutSin_add]
  have hp := cutSin_sq_add_cutCos_sq x
  linear_combination (-3 * cutCos x) * hp

/-- ★ THE INTEGRAND LINEARIZATION (the words-removable guarantor of WHICH function is integrated):
    the Born-square self-overlap `cutCos²·cutSin` equals `(cutSin x + cutSin 3x)/4`. From the banked
    sine addition formula (`sin 3x = 3 sin x − 4 sin³ x`) + the Pythagorean identity. This is what
    makes `meridianFlux` genuinely `∫₀ˣ cutCos²·cutSin` (linearity of the integral over the pieces
    `∫cutSin = sinAntideriv`, `∫cutSin(3·) = sin3Antideriv`). -/
theorem meridianIntegrand_linearize (x : Cut) :
    cutCos x * cutCos x * cutSin x = (cutSin x + cutSin (3 * x)) / 4 := by
  have h3 : (3 : Cut) * x = x + (x + x) := by ring
  rw [h3, cutSin_add, cutSin_add, cutCos_add]
  have hp := cutSin_sq_add_cutCos_sq x
  linear_combination (cutSin x / 4) * hp

/-! ## (3) THE MERIDIAN BORN-SELF-OVERLAP FLUX over the return surface (the derived integral). -/

/-- THE MERIDIAN BORN-SELF-OVERLAP FLUX `∫₀ˣ cutCos²·cutSin` over the derived ℝ, assembled by LINEARITY
    of the derived definite integral from the banked/built pieces: the integrand LINEARIZES to
    `(cutSin + cutSin(3·))/4` (`meridianIntegrand_linearize`), whose termwise definite integrals are
    the banked `sinAntideriv` (`∫cutSin`, N328) and the built `sin3Antideriv` (`∫cutSin(3·)`). NOT a
    posited integral — the antiderivative-difference of a specific derived integrand. -/
def meridianFlux (x : Cut) : Cut := (sinAntideriv x + sin3Antideriv x) / 4

/-- ★ THE ELEMENTARY CLOSED FORM: `meridianFlux x = (1 − cutCos³ x)/3` — the antiderivative `−cutCos³/3`
    (∫u²du = u³/3), vanishing at the pole `cutCos 0 = 1`. The "3" is the cubic antiderivative. From
    `sinAntideriv_eq` (`= 1 − cutCos x`, N328), `sin3Antideriv_eq`, and the triple-angle identity. -/
theorem meridianFlux_eq_cube (x : Cut) :
    meridianFlux x = (1 - cutCos x ^ 3) / 3 := by
  unfold meridianFlux
  rw [sinAntideriv_eq, sin3Antideriv_eq, cutCos_three_mul]
  ring

/-- ★★ THE FULL-MERIDIAN BORN-SELF-OVERLAP FLUX `∫₀^{cutPi} cutCos²·cutSin = 2/3`, FORCED by the banked
    antipode `cutCos cutPi = −1`: `(1 − (−1)³)/3 = 2/3`. The gather's Born self-overlap accumulated
    over the return-surface meridian, from pole to antipode. -/
theorem meridianFlux_cutPi : meridianFlux cutPi = 2 / 3 := by
  rw [meridianFlux_eq_cube, cutCos_cutPi]; norm_num

/-! ## (4) THE LOOP/PHASE-WRAP NORMALIZATION κ = 1/(3·cutPi). -/

/-- ★ THE LEADING LOOP/PHASE-WRAP NORMALIZATION `κ`: the full-meridian Born-self-overlap flux
    (`meridianFlux cutPi = 2/3`) normalized PER full phase-wrap (the banked azimuthal turn
    `2·cutPi`, N328). This is the coefficient the banked running form `invAlphaRun` carried FREE. -/
def kappaLeading : Cut := meridianFlux cutPi / azimuthalTurn

/-- ★★★ THE DERIVATION: `κ = 1/(3·cutPi)`. FALLS OUT of `(2/3)/(2·cutPi)` — the meridian self-overlap
    flux over the azimuthal phase wrap. NEVER asserted. The "3" is the cubic antiderivative, the "1/π"
    the phase-wrap normalization. -/
theorem kappaLeading_eq : kappaLeading = 1 / (3 * cutPi) := by
  unfold kappaLeading azimuthalTurn
  rw [meridianFlux_cutPi]
  have hne : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp

/-- `κ > 0` (Born positivity of the flux + `cutPi > 0`). LOAD-BEARING: the banked screening landing
    `invAlphaRun_screening` requires `0 < κ`. -/
theorem kappaLeading_pos : 0 < kappaLeading := by
  rw [kappaLeading_eq]
  exact div_pos one_pos (by have := cutPi_pos; linarith)

/-- `κ ≠ 0` (W8: a zero normalization would keep `1/α` pinned at `42` at all scales, killing the
    running). -/
theorem kappaLeading_ne_zero : kappaLeading ≠ 0 := ne_of_gt kappaLeading_pos

/-- ★ THE DIVISION-FREE TEETH FORM: `κ · (3·cutPi) = 1`. Pins `κ` to `1/(3·cutPi)` without any
    division hypothesis — the exact derived identity. -/
theorem kappaLeading_mul_three_cutPi : kappaLeading * (3 * cutPi) = 1 := by
  rw [kappaLeading_eq]
  have hne : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp

/-! ## (5) TIE-IN: KILL THE FREE PARAMETER IN THE BANKED RUNNING FORM (N341). -/

/-- ★★ THE FREE PARAMETER IS GONE: the banked running inverse coupling with `κ` = the DERIVED
    `kappaLeading` reads `1/α(μ) = 42 + (1/(3·cutPi))·(16/3)·cutLog(M/μ)` — every coefficient now
    derived (the `42` = N316, the `16/3` = N317 charge Born self-overlap, the `1/(3·cutPi)` = this
    node's loop normalization). NOT a fresh form: the banked `invAlphaRun_rate` (N341) with `κ`
    substituted by its derived value. -/
theorem invAlphaRun_kappaLeading (M μ : Cut) :
    invAlphaRun kappaLeading M μ = 42 + (1 / (3 * cutPi)) * (16 / 3) * cutLog (M / μ) := by
  rw [invAlphaRun_rate, kappaLeading_eq]

/-- ★★★ THE SCREENING LANDING WITH THE DERIVED κ: below the octonion scale (`0 < μ < M`), the banked
    running inverse coupling with the DERIVED normalization `kappaLeading` STRICTLY EXCEEDS the
    octonion value `1/α* = 42` — `1/α` runs UP toward the low-energy regime. The `0 < κ` hypothesis of
    the banked `invAlphaRun_screening` (N341) is now DISCHARGED by `kappaLeading_pos`, not assumed. -/
theorem loopNormalization_screens (M μ : Cut) (hμ : 0 < μ) (hμM : μ < M) :
    invAlphaHigh < invAlphaRun kappaLeading M μ :=
  invAlphaRun_screening kappaLeading M μ kappaLeading_pos hμ hμM

/-! ## (6) W8 NON-VACUITY WITH TEETH (the Born-square weighting is load-bearing). -/

/-- ★ W8 — THE BORN-SQUARE WEIGHTING BITES: the cos²-weighted meridian flux is `2/3`, NOT the
    UNWEIGHTED meridian flux `∫₀^{cutPi} cutSin = 2` (banked `sinAntideriv_cutPi`). Were the
    self-overlap NOT Born-squared (a flat weight `1` instead of `cutCos²`), the flux would be `2` and
    the normalization would be the WRONG `κ = 1/cutPi`. The self-overlap projection is load-bearing. -/
theorem meridianFlux_cutPi_ne_two : meridianFlux cutPi ≠ 2 := by
  rw [meridianFlux_cutPi]; norm_num

/-- ★ W8 — THE WRONG NORMALIZATION IS EXCLUDED: `κ ≠ 1/cutPi` (the value that the unweighted flux `2`
    would give). Provably excluded, exactly as the running form excludes the wrong high-scale value. -/
theorem kappaLeading_ne_wrong : kappaLeading ≠ 1 / cutPi := by
  rw [kappaLeading_eq]
  have hpi := cutPi_pos
  have hne : cutPi ≠ 0 := ne_of_gt hpi
  intro h
  field_simp [hne] at h
  norm_num at h

/-! ## (7) THE X1 CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE X1 LANDING (welded, NOT a bare ∧): the loop/phase-wrap normalization `κ` is the DERIVED
    geometric factor `1/(3·cutPi)` (from the return-surface Born-self-overlap flux `2/3` over the
    azimuthal phase wrap `2·cutPi`), it is strictly positive (Born positivity), and — the physics tie
    — with this DERIVED `κ` the banked running inverse coupling (N341) SCREENS below the octonion
    scale, its last free parameter removed. The geometric flux, the derived `κ`, and the physics-form
    screening are welded: statable from none of the three alone. -/
theorem loopNormalization_landing (M μ : Cut) (hμ : 0 < μ) (hμM : μ < M) :
    meridianFlux cutPi = 2 / 3 ∧
    kappaLeading = 1 / (3 * cutPi) ∧
    0 < kappaLeading ∧
    invAlphaHigh < invAlphaRun kappaLeading M μ :=
  ⟨meridianFlux_cutPi, kappaLeading_eq, kappaLeading_pos,
   loopNormalization_screens M μ hμ hμM⟩

end

end Phys.Algebra
