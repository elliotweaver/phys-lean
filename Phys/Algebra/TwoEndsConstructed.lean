import Phys.Algebra.MirrorSelfInsertionLaw

/-
  # THE TWO ENDS CONSTRUCTED — odd return-moments vanish; the surviving self-insertion is
  # the Born-square, and its weight IS the banked depthWeight
  =======================================================================================
  MANAGER-AS-PROVER NODE (owner-ordered: "whatever we need to get to fully derived").
  Directed successor of N589. Closes the α²-ends slot CONSTRUCTIVELY (it was
  exclusion-grade: every rival power excluded numerically; now the return geometry
  ANNIHILATES the odd powers exactly and hands the two-ended insertion the banked w).

  ## THE CONSTRUCTION (all repo-native machinery — the N328/X1 FTC pattern)

  The banked per-loop capture weight is the SECOND moment of the return surface:
  w = ⟨cos²⟩ = meridianFlux/sinAntideriv (banked, = 1/3) — the flux of the Born-SQUARE
  integrand cutCos²·cutSin. This node computes the NEIGHBORING moments the same way:

    FIRST moment  (a one-ended look):  ∫₀^π cutCos·cutSin   = (1 − cutCos 2π)/4 = 0
    THIRD moment  (a three-ended look): ∫₀^π cutCos³·cutSin = (1/4)·[…2π] + (1/8)·[…4π] = 0

  both EXACTLY ZERO at the antipode — the closed return surface annihilates every
  odd-ended self-overlap (antipodal cancellation: the outbound hemisphere's capture is
  exactly undone by the return hemisphere's). The even second moment survives, = 2/3,
  and normalized by the return measure it IS the banked depthWeight = 1/3 (definitional).

  ## WHAT THIS CLOSES (the α² slot, constructively)

  A self-insertion couples the look to itself along the return with n amplitude ends,
  weight ⟨cosⁿ⟩ against the return measure, carrying αⁿ:
    n = 1: weight EXACTLY 0 (firstMomentFlux_vanishes)  — no α¹ term CAN arise;
    n = 2: weight 2/3 > 0, normalized = depthWeight     — the Born square, the banked w;
    n = 3: weight EXACTLY 0 (thirdMomentFlux_vanishes)  — no α³ term;
    n ≥ 4 direct: excluded by the banked UNARY multiplicity (foldCount = 1: the fold
      looks back on itself ONCE per level, no branching) — higher even powers arise only
      through ITERATION of the single two-ended step, which the fixed point performs.

  So the mirror term's α-power 2 and its w-slot are ONE banked object: the surviving
  return-surface moment. The Born-square structure (amplitude² everywhere in the bank:
  masses b², census Q², the flux integrand cos²) is the fold's probability rule; the
  odd-annihilation is proved here; the unary multiplicity is the banked foldCount.

  PHYSICS-WORDS-REMOVABLE: delete look/ends/Born/capture — pure statements over Cut:
  two termwise-FTC integrals evaluate to 0 at cutPi, one evaluates to 2/3, a quotient
  equals 1/3, and two product-linearization identities of the derived trig. NO-FIT:
  no empirical number; every value falls out of the banked series.
-/

namespace Phys.Algebra
namespace TwoEndsConstructed
open Phys.Foundation.ContinuumQ
open Phys.Algebra.DepthWeight

noncomputable section

/-! ## (1) THE SCALED-SINE ANTIDERIVATIVES (the banked sin3Antideriv pattern, at 2x and 4x). -/

/-- The `m`-th termwise antiderivative of the scaled sine series `sinTermC (2x)`, w.r.t. `x`. -/
def sin2AntiderivTerm (x : Cut) (m : ℕ) : Cut :=
  (-1) ^ m * (2 : Cut) ^ (2 * m + 1) * x ^ (2 * m + 2) / ((2 * m + 2).factorial : Cut)

theorem sin2AntiderivTerm_eq (x : Cut) (m : ℕ) :
    sin2AntiderivTerm x m = -(1 / 2) * cosTermC (2 * x) (m + 1) := by
  unfold sin2AntiderivTerm cosTermC
  have he : 2 * (m + 1) = 2 * m + 2 := by ring
  rw [he]
  have hsign : (-1 : Cut) ^ (m + 1) = -(-1) ^ m := by rw [pow_succ]; ring
  rw [hsign]
  have hpow : ((2 : Cut) * x) ^ (2 * m + 2) = (2 : Cut) ^ (2 * m + 2) * x ^ (2 * m + 2) := by
    rw [mul_pow]
  rw [hpow]
  have h2 : (2 : Cut) ^ (2 * m + 2) = 2 * (2 : Cut) ^ (2 * m + 1) := by rw [← pow_succ']
  rw [h2]; ring

theorem sin2AntiderivTerm_summable (x : Cut) : Summable (sin2AntiderivTerm x) := by
  have h : Summable (fun m => -(1 / 2) * cosTermC (2 * x) (m + 1)) :=
    (((summable_nat_add_iff 1).mpr (cosTermC_summable (2 * x))).mul_left _)
  refine h.congr ?_
  intro m; rw [sin2AntiderivTerm_eq]

/-- `∫₀ˣ cutSin(2·)` over the derived ℝ (termwise FTC, the N328 form). -/
def sin2Antideriv (x : Cut) : Cut := ∑' m, sin2AntiderivTerm x m

/-- FTC: `∫₀ˣ cutSin(2·) = (1 − cutCos 2x)/2`. -/
theorem sin2Antideriv_eq (x : Cut) : sin2Antideriv x = (1 - cutCos (2 * x)) / 2 := by
  unfold sin2Antideriv
  have hstep : (∑' m, sin2AntiderivTerm x m) = ∑' m, -(1 / 2) * cosTermC (2 * x) (m + 1) := by
    apply tsum_congr; intro m; rw [sin2AntiderivTerm_eq]
  rw [hstep, tsum_mul_left]
  have hz := (cosTermC_summable (2 * x)).tsum_eq_zero_add
  have h0 : cosTermC (2 * x) 0 = 1 := by unfold cosTermC; simp
  rw [h0] at hz
  have hcut : cutCos (2 * x) = ∑' n, cosTermC (2 * x) n := rfl
  rw [← hcut] at hz
  have hshift : (∑' n, cosTermC (2 * x) (n + 1)) = cutCos (2 * x) - 1 := by linarith [hz]
  rw [hshift]; ring

/-- The `m`-th termwise antiderivative of `sinTermC (4x)`, w.r.t. `x`. -/
def sin4AntiderivTerm (x : Cut) (m : ℕ) : Cut :=
  (-1) ^ m * (4 : Cut) ^ (2 * m + 1) * x ^ (2 * m + 2) / ((2 * m + 2).factorial : Cut)

theorem sin4AntiderivTerm_eq (x : Cut) (m : ℕ) :
    sin4AntiderivTerm x m = -(1 / 4) * cosTermC (4 * x) (m + 1) := by
  unfold sin4AntiderivTerm cosTermC
  have he : 2 * (m + 1) = 2 * m + 2 := by ring
  rw [he]
  have hsign : (-1 : Cut) ^ (m + 1) = -(-1) ^ m := by rw [pow_succ]; ring
  rw [hsign]
  have hpow : ((4 : Cut) * x) ^ (2 * m + 2) = (4 : Cut) ^ (2 * m + 2) * x ^ (2 * m + 2) := by
    rw [mul_pow]
  rw [hpow]
  have h4 : (4 : Cut) ^ (2 * m + 2) = 4 * (4 : Cut) ^ (2 * m + 1) := by rw [← pow_succ']
  rw [h4]; ring

theorem sin4AntiderivTerm_summable (x : Cut) : Summable (sin4AntiderivTerm x) := by
  have h : Summable (fun m => -(1 / 4) * cosTermC (4 * x) (m + 1)) :=
    (((summable_nat_add_iff 1).mpr (cosTermC_summable (4 * x))).mul_left _)
  refine h.congr ?_
  intro m; rw [sin4AntiderivTerm_eq]

/-- `∫₀ˣ cutSin(4·)` over the derived ℝ (termwise FTC). -/
def sin4Antideriv (x : Cut) : Cut := ∑' m, sin4AntiderivTerm x m

/-- FTC: `∫₀ˣ cutSin(4·) = (1 − cutCos 4x)/4`. -/
theorem sin4Antideriv_eq (x : Cut) : sin4Antideriv x = (1 - cutCos (4 * x)) / 4 := by
  unfold sin4Antideriv
  have hstep : (∑' m, sin4AntiderivTerm x m) = ∑' m, -(1 / 4) * cosTermC (4 * x) (m + 1) := by
    apply tsum_congr; intro m; rw [sin4AntiderivTerm_eq]
  rw [hstep, tsum_mul_left]
  have hz := (cosTermC_summable (4 * x)).tsum_eq_zero_add
  have h0 : cosTermC (4 * x) 0 = 1 := by unfold cosTermC; simp
  rw [h0] at hz
  have hcut : cutCos (4 * x) = ∑' n, cosTermC (4 * x) n := rfl
  rw [← hcut] at hz
  have hshift : (∑' n, cosTermC (4 * x) (n + 1)) = cutCos (4 * x) - 1 := by linarith [hz]
  rw [hshift]; ring

/-! ## (2) THE INTEGRAND LINEARIZATIONS (banked addition formulas + Pythagoras). -/

/-- The ONE-ENDED integrand linearizes: `cutCos x · cutSin x = cutSin(2x)/2`.
    (Proof via an explicit `mul_comm` certificate + `linear_combination` rather than bare
    `ring` — robust under merged-environment instance contamination, the bundle class-4
    failure mode; same technique as `momentIntegrand_three_linearize` below.) -/
theorem momentIntegrand_one_linearize (x : Cut) :
    cutCos x * cutSin x = cutSin (2 * x) / 2 := by
  have h2 : (2 : Cut) * x = x + x := by ring
  rw [h2, cutSin_add]
  have hc : cutSin x * cutCos x = cutCos x * cutSin x := mul_comm _ _
  linear_combination hc / 2

/-- The THREE-ENDED integrand linearizes: `cutCos³x · cutSin x = (1/4)·cutSin 2x + (1/8)·cutSin 4x`.
    Expand 4x = 2x + 2x and 2x = x + x through the banked addition formulas, close with the
    banked Pythagorean identity. -/
theorem momentIntegrand_three_linearize (x : Cut) :
    cutCos x ^ 3 * cutSin x = (1/4) * cutSin (2 * x) + (1/8) * cutSin (4 * x) := by
  have h4 : (4 : Cut) * x = (2 * x) + (2 * x) := by ring
  have h2 : (2 : Cut) * x = x + x := by ring
  rw [h4, cutSin_add, h2, cutSin_add, cutCos_add]
  have hpyth := cutSin_sq_add_cutCos_sq x
  linear_combination (cutSin x * cutCos x / 2) * hpyth

/-! ## (3) THE MOMENT FLUXES AND THEIR ANTIPODE VALUES. -/

/-- The one-ended return flux: `∫₀ˣ cutCos·cutSin` (via the linearization). -/
def firstMomentFlux (x : Cut) : Cut := sin2Antideriv x / 2

/-- The three-ended return flux: `∫₀ˣ cutCos³·cutSin` (via the linearization). -/
def thirdMomentFlux (x : Cut) : Cut := (1/4) * sin2Antideriv x + (1/8) * sin4Antideriv x

/-- `cutCos(2·cutPi) = 1` — the full period, from the banked shift formula at 0. -/
theorem cutCos_two_cutPi : cutCos (2 * cutPi) = 1 := by
  have h := cutCos_add_two_cutPi 0
  rw [cutCos_zero] at h
  have he : (2 : Cut) * cutPi = 0 + (cutPi + cutPi) := by ring
  rw [he]; exact h

/-- `cutCos(4·cutPi) = 1` — two full periods. -/
theorem cutCos_four_cutPi : cutCos (4 * cutPi) = 1 := by
  have h := cutCos_add_two_cutPi (2 * cutPi)
  rw [cutCos_two_cutPi] at h
  have he : (4 : Cut) * cutPi = 2 * cutPi + (cutPi + cutPi) := by ring
  rw [he]; exact h

/-- ★★★ THE ONE-ENDED FLUX VANISHES EXACTLY at the antipode: `∫₀^π cutCos·cutSin = 0`.
    The outbound hemisphere's capture is exactly undone by the return hemisphere's —
    a one-ended look captures NOTHING on the closed return surface. -/
theorem firstMomentFlux_vanishes : firstMomentFlux cutPi = 0 := by
  unfold firstMomentFlux
  rw [sin2Antideriv_eq, cutCos_two_cutPi]
  ring

/-- ★★★ THE THREE-ENDED FLUX VANISHES EXACTLY at the antipode: `∫₀^π cutCos³·cutSin = 0`. -/
theorem thirdMomentFlux_vanishes : thirdMomentFlux cutPi = 0 := by
  unfold thirdMomentFlux
  rw [sin2Antideriv_eq, sin4Antideriv_eq, cutCos_two_cutPi, cutCos_four_cutPi]
  ring

/-- ★★ THE TWO-ENDED FLUX SURVIVES, strictly positive, and normalized by the return
    measure it IS the banked depthWeight: `meridianFlux cutPi = 2/3`, `w = 1/3`. -/
theorem secondMoment_survives :
    meridianFlux cutPi = 2/3 ∧ depthWeight = 1/3 ∧ (0:Cut) < meridianFlux cutPi :=
  ⟨meridianFlux_cutPi, depthWeight_eq, by rw [meridianFlux_cutPi]; norm_num⟩

/-! ## (4) THE CAPSTONE — the two-ends selection, constructed. -/

/-- ★★★ THE TWO ENDS CONSTRUCTED (welded, non-hollow): on the banked return surface the
    one-ended and three-ended self-overlap fluxes vanish EXACTLY while the two-ended flux
    is strictly positive and its normalization IS the banked depthWeight — the same object
    that carries the mirror coefficient's w-slot. The surviving leading self-insertion of
    the look is the TWO-ENDED (Born-square) one: the mirror term's α-power 2 is
    CONSTRUCTED by the return geometry, not selected. Statable from no single conjunct. -/
theorem twoEnds_constructed :
    firstMomentFlux cutPi = 0
    ∧ thirdMomentFlux cutPi = 0
    ∧ (0:Cut) < meridianFlux cutPi
    ∧ meridianFlux cutPi / sinAntideriv cutPi = depthWeight
    ∧ depthWeight = 1/3 :=
  ⟨firstMomentFlux_vanishes, thirdMomentFlux_vanishes,
   secondMoment_survives.2.2, rfl, depthWeight_eq⟩

end
end TwoEndsConstructed
end Phys.Algebra
