/-
  # N380 — arc-H H2 (candidate-class): INFLATION SLOW-ROLL — `n_s = 1 − 2/N`, `r = 8/(c²N²)`
  #         DERIVED from the FORCED plateau potential's slow-roll geometry (the attractor limit).
  =============================================================================================
  Over the DERIVED ℝ `ContinuumQ.Cut`, the banked Born-positive self-overlap exponential `cutExp`
  (N174), the banked FORCED plateau potential `plateauApproachPot` and its `n_s`/`r` DEFINITIONS
  (N364), the banked derived-ℝ potential derivatives `foldPotentialDeriv`/`foldPotentialDeriv_hasDerivAt`
  (N370, `V′`/`V″`), and the banked derived-ℝ antiderivative `expScaleAntideriv` /
  `expScaleAntideriv_hasDerivAt` (N379, the integral side of the analytic fold). The directed single
  successor of N379 (arc-H H1 → H2).

  ⭐ SIXTH-ARC OWNER-AUTHORIZED SEED — COSMOLOGY COMPLETION, TARGET H2
  (`docs/SEED_COSMOLOGY_COMPLETION.md` §H2 — "inflation slow-roll: `n_s = 1 − 2/N`, `r = 8/(c²N²)`,
  candidate-class; consumes H1"). A FRESH-WORKER SELECT (docs/NODE_SELECTION.md IN FULL; the
  anti-bullshit S4 gate + QUIET-DRIFT passed in the kanban thread + workbench PREREG) confirmed the
  theory-native framing: the slow-roll observables are the FORCED plateau potential's OWN geometric
  invariants, NOT tuned to data.

  ## THE THEORY-NATIVE READING (why the relations are DERIVED off a FORCED potential, not fit)

  Standard cosmology POSITS an inflaton potential and TUNES it so the slow-roll parameters reproduce
  the measured spectral tilt `n_s` and tensor-to-scalar ratio `r`. THE THEORY does not tune. The
  plateau potential `V(φ) = (1 − cutExp(−cφ))²` is FORCED by C6 / self-blindness (N364): the eternal
  approach toward a coherence asymptote (`V < 1`) that is NEVER attained (no fixed point). Its
  slow-roll observables are then READ OFF its own geometry — the log-steepness `ε = ½(V′/V)²`, the
  curvature ratio `η = V″/V`, and the accumulated e-fold count `N = ∫ V/V′ dφ` (the N379
  antiderivative). Writing `u := cutExp(−cφ)` (Born-positive; `u ∈ (0,1)` for `φ > 0`; `u → 0` as
  `φ → ∞` — the attractor, NEVER attained = C6), the banked derivatives (N370) give

      `V = (1 − u)²`,   `V′ = 2c·u·(1 − u)`,   `V″ = −2c²u + 4c²u²`,
      `ε = 2c²u²/(1 − u)²`,   `η = 2c²u(2u − 1)/(1 − u)²`,

  and the FTC e-fold count (N379) `N(φ) = (cutExp(cφ) − 1)/(2c) − φ/(2c)` differentiates back to
  `V/V′` (`efoldCount_hasDerivAt` — this GROUNDS "`N` is the e-fold count", it is not a chosen symbol).
  Its leading term (attractor) is `N_lead = cutExp(cφ)/(2c²) = 1/(2c²u)`, so the suppression identity
  `2c²·u·N_lead = 1` holds exactly (`efoldLead_suppression`).

  With the standard slow-roll dictionary `n_s = 1 + 2η − 6ε`, `r = 16ε` (a NAMED IDENTIFICATION, see
  HONEST GRADE — the perturbation-theory power spectrum is NOT banked), the potential's geometry gives
  the EXACT (theorem-grade, pure `Cut`-arithmetic) identities

      `(n_s − 1)·N_lead = −2·(1 + u)/(1 − u)²`        (`nsRead_efold_exact`)
      `r·(c²·N_lead²)   =  8/(1 − u)²`                (`rRead_efold_exact`)

  which factor THROUGH the banked N364 definitions:

      `n_s − 1 = (nsPlateau N_lead − 1)·corrNs u`,   `corrNs u = (1 + u)/(1 − u)²`,   `corrNs 0 = 1`
      `r       =  rPlateau c N_lead ·corrR u`,        `corrR  u = 1/(1 − u)²`,          `corrR  0 = 1`.

  At the attractor (`u → 0`, NEVER attained — the eternal approach) the corrections are `1`, so
  `n_s = 1 − 2/N` and `r = 8/(c²N²)` EXACTLY — the N364 candidate DEFINITIONS become DERIVED
  attractor relations. Off the attractor the corrections are explicitly non-trivial
  (`corrNs (1/2) = 6 ≠ 1` — the W8 teeth): the relations are attractor limits, not exact everywhere.
  What the field fits, the theory reads off the forced potential.

  ## HONEST GRADE (mandatory — SEED §H2 CANDIDATE-CLASS, flag like the T8 mixing caveat)

  - THEOREM-GRADE (genuine theorems on the banked objects, gap-free, foundations-only over `Cut`):
    the `ε`/`η` closed `u`-forms; the e-fold count `N` as the N379 antiderivative with `dN/dφ = V/V′`
    (`efoldCount_hasDerivAt`); the suppression identity `2c²·u·N_lead = 1`; the two EXACT observable
    identities; the two correction factorings through `nsPlateau`/`rPlateau` (N364); the attractor
    values `corrNs 0 = corrR 0 = 1`; the off-attractor non-triviality `corrNs (1/2) = 6`.
  - NAMED-IDENTIFICATION / MECHANISM-GRADE (FLAGGED prose, NEVER an asserted theorem): the slow-roll
    dictionary `n_s = 1 + 2η − 6ε`, `r = 16ε`. These are the standard first-order relations between
    the potential's slow-roll parameters and the primordial power spectrum; the power spectrum itself
    (cosmological perturbation theory) is NOT banked in this chain. Exactly like N364's "plateau = C6"
    identification and the T8 mixing caveat — the dictionary is the interpretation layer; the DERIVED
    content is the potential-geometry identities the dictionary is applied to.
  - CANDIDATE-CLASS (the SEED grade): the plateau CLASS is FORCED (theorem, N364); `ε`, `η`, `N` are
    DERIVED (theorem); the relations `n_s = 1 − 2/N`, `r = 8/(c²N²)` are DERIVED as the `u → 0`
    ATTRACTOR limits (via the factored corrections `→ 1`), MODULO the flagged dictionary; `N` is the
    e-fold COUNT. ⚠ NO FIT: the measured `n_s ≈ 0.965`, `r` are REMOVABLE PROSE only (G2) — they
    appear in NO proof, and no residual is chased to zero.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2, G5)

  Delete "inflation / slow-roll / spectral index / tensor-to-scalar / e-fold / attractor / plateau /
  potential / cosmology": the theorems stand as pure statements over `cutExp`/`Cut` — for the map
  `V(φ) = (1 − cutExp(−cφ))²` with `u := cutExp(−cφ)`, the ratio `½(V′/V)²` equals `2c²u²/(1−u)²`,
  `V″/V` equals `(−2c²u + 4c²u²)/(1−u)²`, the `tsum`-integral-based `N` differentiates back to `V/V′`,
  `2c²·u·(cutExp(cφ)/(2c²)) = 1`, and the linear combinations `1 + 2(V″/V) − 6·½(V′/V)²` and
  `16·½(V′/V)²` satisfy the stated exact `Cut`-arithmetic identities and factor through the rational
  functions `1 − 2/N` and `8/(c²N²)` with correction factors that equal `1` at `u = 0` and `6` at
  `u = 1/2`. No physics name does any logical work.

  ## THE ONE CAUSE (THE ONE LAW)

  The SAME fold no-nonzero-fixed-point that stopped the cascade, gave the eternal approach (C6), and
  forced the plateau class (N364) now delivers the inflationary observables: the potential is the
  fold's own Born self-overlap of a coherence gap that never closes, its slow-roll geometry is fixed,
  and the attractor `u → 0` (the asymptote NEVER reached) is exactly where the class-universal
  relations become exact. One primitive (no fixed point), one forced potential, one attractor.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system
  content import, NO `Real`/`Real.exp`, NO Mathlib `HasDerivAt`/`deriv`/integral as content. No
  empirical number (measured `n_s`, `r`, e-fold count) appears anywhere — `c`, `φ`, `N` stay SYMBOLIC.
-/
import Phys.Algebra.ContinuumExpAntideriv

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## (1) THE SLOW-ROLL PARAMETERS as geometric invariants of the banked plateau potential. -/

/-- THE SLOW-ROLL STEEPNESS `ε = ½(V′/V)²` of the banked plateau potential (N364), built from the
    banked derivative value `foldPotentialDeriv` (N370). A pure ratio of the potential's own gradient
    to itself — no tuning. -/
def slowRollEps (c φ : Cut) : Cut :=
  (1 / 2) * (foldPotentialDeriv c φ / plateauApproachPot c φ) ^ 2

/-- THE SECOND-DERIVATIVE VALUE `V″(φ) = −2c²·cutExp((−c)φ) + 4c²·cutExp((−2c)φ)` — the banked N370
    value (grounded by `foldPotentialDeriv_hasDerivAt` below: it IS `d/dφ V′`). -/
def foldPotentialSecondDerivVal (c φ : Cut) : Cut :=
  - (2 * c ^ 2) * cutExp ((-c) * φ) + 4 * c ^ 2 * cutExp ((-(2 * c)) * φ)

/-- THE SLOW-ROLL CURVATURE `η = V″/V` of the banked plateau potential. -/
def slowRollEta (c φ : Cut) : Cut :=
  foldPotentialSecondDerivVal c φ / plateauApproachPot c φ

/-- `foldPotentialSecondDerivVal` GENUINELY is the derivative of `V′` (the banked N370
    `foldPotentialDeriv_hasDerivAt`), so `η = V″/V` is not a free symbol. -/
theorem foldPotentialSecondDerivVal_hasDerivAt (c φ : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (foldPotentialDeriv c) (foldPotentialSecondDerivVal c φ) φ :=
  foldPotentialDeriv_hasDerivAt c φ hc

/-- Away from the fold-origin (`φ > 0`) the coherence gap does not close: `1 − cutExp(−cφ) ≠ 0`. -/
theorem one_sub_u_ne (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    (1 : Cut) - cutExp (-(c * φ)) ≠ 0 := by
  have harg : -(c * φ) < 0 := by nlinarith
  have : cutExp (-(c * φ)) < 1 := by
    calc cutExp (-(c * φ)) < cutExp 0 := cutExp_strictMono harg
      _ = 1 := cutExp_zero
  linarith

/-- ★ THE `ε` CLOSED FORM: `ε = 2c²u²/(1 − u)²` with `u = cutExp(−cφ)` (`φ > 0`). -/
theorem slowRollEps_eq (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    slowRollEps c φ = 2 * c ^ 2 * cutExp (-(c * φ)) ^ 2 / (1 - cutExp (-(c * φ))) ^ 2 := by
  unfold slowRollEps foldPotentialDeriv plateauApproachPot
  set u := cutExp (-(c * φ)) with hu
  have h1u : (1 : Cut) - u ≠ 0 := one_sub_u_ne c φ hc hφ
  field_simp

/-- ★ THE `η` CLOSED FORM: `η = (−2c²u + 4c²u²)/(1 − u)²` with `u = cutExp(−cφ)`. -/
theorem slowRollEta_eq (c φ : Cut) :
    slowRollEta c φ
      = (- (2 * c ^ 2) * cutExp (-(c * φ)) + 4 * c ^ 2 * cutExp (-(c * φ)) ^ 2)
          / (1 - cutExp (-(c * φ))) ^ 2 := by
  unfold slowRollEta foldPotentialSecondDerivVal plateauApproachPot
  rw [show (-c) * φ = -(c * φ) by ring]
  have hsq : cutExp ((-(2 * c)) * φ) = cutExp (-(c * φ)) ^ 2 := by
    have h : cutExp (-(c * φ)) * cutExp (-(c * φ)) = cutExp (-(c * φ) + -(c * φ)) := cutExp_add _ _
    rw [show (-(2 * c)) * φ = -(c * φ) + -(c * φ) by ring, ← h]; ring
  rw [hsq]

/-! ## (2) THE e-FOLD COUNT `N = ∫ V/V′ dφ` via the N379 antiderivative (FTC-grounded). -/

/-- THE e-FOLD COUNT `N(φ) = ∫₀^φ (V/V′) dφ = (cutExp(cφ) − 1)/(2c) − φ/(2c)`, built from the banked
    N379 scaled antiderivative `expScaleAntideriv` and the identity-map derivative. -/
def efoldCount (c φ : Cut) : Cut := expScaleAntideriv c φ / (2 * c) - φ / (2 * c)

/-- ★ THE e-FOLD FTC: `dN/dφ = (cutExp(cφ) − 1)/(2c) = V/V′` — the count differentiates back to the
    slow-roll integrand, GROUNDING "`N` is the e-fold count" (not a chosen symbol). From the banked
    N379 `expScaleAntideriv_hasDerivAt` (the integrand `cutExp(cφ)`) and `cutHasDerivAt_id`. -/
theorem efoldCount_hasDerivAt (c φ : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (efoldCount c) ((cutExp (c * φ) - 1) / (2 * c)) φ := by
  have hbig : CutHasDerivAt (fun y => expScaleAntideriv c y) (cutExp (c * φ)) φ :=
    expScaleAntideriv_hasDerivAt c φ hc
  have h1 : CutHasDerivAt (fun y => expScaleAntideriv c y / (2 * c)) (cutExp (c * φ) / (2 * c)) φ := by
    have := hbig.const_mul (2 * c)⁻¹
    have hfe : (fun y => (2 * c)⁻¹ * expScaleAntideriv c y)
        = (fun y => expScaleAntideriv c y / (2 * c)) := by funext y; rw [div_eq_inv_mul]
    rw [hfe] at this
    have hval : (2 * c)⁻¹ * cutExp (c * φ) = cutExp (c * φ) / (2 * c) := by rw [div_eq_inv_mul]
    rw [hval] at this; exact this
  have h2 : CutHasDerivAt (fun y => y / (2 * c)) (1 / (2 * c)) φ := by
    have := (cutHasDerivAt_id φ).const_mul (2 * c)⁻¹
    have hfe : (fun y => (2 * c)⁻¹ * y) = (fun y => y / (2 * c)) := by funext y; rw [div_eq_inv_mul]
    rw [hfe] at this
    have hval : (2 * c)⁻¹ * 1 = 1 / (2 * c) := by rw [div_eq_inv_mul, mul_one]
    rw [hval] at this; exact this
  have hsub := h1.sub h2
  have hfe : (fun y => expScaleAntideriv c y / (2 * c) - y / (2 * c)) = efoldCount c := by
    funext y; rfl
  rw [hfe] at hsub
  have hval : cutExp (c * φ) / (2 * c) - 1 / (2 * c) = (cutExp (c * φ) - 1) / (2 * c) := by
    rw [div_sub_div_same]
  rw [hval] at hsub; exact hsub

/-- THE LEADING e-FOLD COUNT (the attractor term) `N_lead = cutExp(cφ)/(2c²) = 1/(2c²u)`. -/
def efoldLead (c φ : Cut) : Cut := cutExp (c * φ) / (2 * c ^ 2)

/-- ★ THE SUPPRESSION IDENTITY `2c²·u·N_lead = 1` (`u = cutExp(−cφ)`) — the exact tie between the
    Born-positive suppression factor and the leading e-fold count. -/
theorem efoldLead_suppression (c φ : Cut) (hc : c ≠ 0) :
    2 * c ^ 2 * cutExp (-(c * φ)) * efoldLead c φ = 1 := by
  unfold efoldLead
  have hc2 : (2 : Cut) * c ^ 2 ≠ 0 := by positivity
  have hu : cutExp (-(c * φ)) * cutExp (c * φ) = 1 := by
    rw [cutExp_add, show -(c * φ) + c * φ = 0 by ring, cutExp_zero]
  field_simp
  nlinarith [hu, sq_nonneg c]

/-- `N_lead = 1/(2c²u)` in closed `u`-form (`u ≠ 0`, `c ≠ 0`) — the form the exact identities use. -/
theorem efoldLead_uform (c φ : Cut) (hc : c ≠ 0) :
    efoldLead c φ = 1 / (2 * c ^ 2 * cutExp (-(c * φ))) := by
  have hupos : (0 : Cut) < cutExp (-(c * φ)) := cutExp_pos _
  have hc2 : (2 : Cut) * c ^ 2 ≠ 0 := by positivity
  have hsupp := efoldLead_suppression c φ hc
  have hden : 2 * c ^ 2 * cutExp (-(c * φ)) ≠ 0 := by positivity
  field_simp
  linarith [hsupp]

/-! ## (3) THE SLOW-ROLL DICTIONARY (a NAMED IDENTIFICATION — flagged) and the observable readings. -/

/-- THE SPECTRAL-TILT READING `n_s = 1 + 2η − 6ε` — the standard first-order slow-roll dictionary
    (NAMED IDENTIFICATION, flagged: the power spectrum is not banked). Applied to the DERIVED `ε`, `η`
    of the FORCED plateau potential. -/
def nsRead (c φ : Cut) : Cut := 1 + 2 * slowRollEta c φ - 6 * slowRollEps c φ

/-- THE TENSOR-TO-SCALAR READING `r = 16ε` — the standard first-order slow-roll dictionary. -/
def rRead (c φ : Cut) : Cut := 16 * slowRollEps c φ

/-! ## (4) THE EXACT OBSERVABLE IDENTITIES (theorem-grade, pure `Cut`-arithmetic). -/

/-- ★ THE EXACT SPECTRAL IDENTITY: `(n_s − 1)·N_lead = −2·(1 + u)/(1 − u)²` (`u = cutExp(−cφ)`,
    `φ > 0`). The whole spectral departure from scale invariance, exactly, in terms of the potential's
    own suppression factor. -/
theorem nsRead_efold_exact (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    (nsRead c φ - 1) * efoldLead c φ
      = -2 * (1 + cutExp (-(c * φ))) / (1 - cutExp (-(c * φ))) ^ 2 := by
  unfold nsRead
  rw [slowRollEta_eq, slowRollEps_eq c φ hc hφ, efoldLead_uform c φ (ne_of_gt hc)]
  set u := cutExp (-(c * φ)) with hu
  have hupos : (0 : Cut) < u := by rw [hu]; exact cutExp_pos _
  have hune : u ≠ 0 := ne_of_gt hupos
  have h1u : (1 : Cut) - u ≠ 0 := one_sub_u_ne c φ hc hφ
  have hc2 : c ^ 2 ≠ 0 := pow_ne_zero 2 (ne_of_gt hc)
  have h2c2u : (2 : Cut) * c ^ 2 * u ≠ 0 := by positivity
  have h1u2 : (1 - u) ^ 2 ≠ 0 := pow_ne_zero 2 h1u
  field_simp
  ring

/-- ★ THE EXACT TENSOR IDENTITY: `r·(c²·N_lead²) = 8/(1 − u)²` (`u = cutExp(−cφ)`, `φ > 0`). -/
theorem rRead_efold_exact (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    rRead c φ * (c ^ 2 * efoldLead c φ ^ 2) = 8 / (1 - cutExp (-(c * φ))) ^ 2 := by
  unfold rRead
  rw [slowRollEps_eq c φ hc hφ, efoldLead_uform c φ (ne_of_gt hc)]
  set u := cutExp (-(c * φ)) with hu
  have hupos : (0 : Cut) < u := by rw [hu]; exact cutExp_pos _
  have hune : u ≠ 0 := ne_of_gt hupos
  have h1u : (1 : Cut) - u ≠ 0 := one_sub_u_ne c φ hc hφ
  have hc2 : c ^ 2 ≠ 0 := pow_ne_zero 2 (ne_of_gt hc)
  have h2c2u : (2 : Cut) * c ^ 2 * u ≠ 0 := by positivity
  have h1u2 : (1 - u) ^ 2 ≠ 0 := pow_ne_zero 2 h1u
  field_simp
  ring

/-! ## (5) THE CORRECTION FACTORS and the factoring through the banked N364 relations. -/

/-- THE SPECTRAL CORRECTION `corrNs u = (1 + u)/(1 − u)²` — the off-attractor departure of the exact
    `n_s` from the class-universal `1 − 2/N`. Equals `1` at the attractor `u = 0`. -/
def corrNs (u : Cut) : Cut := (1 + u) / (1 - u) ^ 2

/-- THE TENSOR CORRECTION `corrR u = 1/(1 − u)²`. Equals `1` at the attractor `u = 0`. -/
def corrR (u : Cut) : Cut := 1 / (1 - u) ^ 2

/-- ★ THE SPECTRAL FACTORING: `n_s − 1 = (nsPlateau N_lead − 1)·corrNs u` (`u = cutExp(−cφ)`) — the
    exact spectral tilt is the banked N364 class-universal relation `nsPlateau` times the correction.
    (`nsPlateau N = 1 − 2/N`, so `nsPlateau N_lead − 1 = −2/N_lead`.) -/
theorem nsRead_eq_nsPlateau_mul_corr (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    nsRead c φ - 1 = (nsPlateau (efoldLead c φ) - 1) * corrNs (cutExp (-(c * φ))) := by
  unfold nsPlateau corrNs
  rw [efoldLead_uform c φ (ne_of_gt hc)]
  unfold nsRead
  rw [slowRollEta_eq, slowRollEps_eq c φ hc hφ]
  set u := cutExp (-(c * φ)) with hu
  have hupos : (0 : Cut) < u := by rw [hu]; exact cutExp_pos _
  have hune : u ≠ 0 := ne_of_gt hupos
  have h1u : (1 : Cut) - u ≠ 0 := one_sub_u_ne c φ hc hφ
  have hc2 : c ^ 2 ≠ 0 := pow_ne_zero 2 (ne_of_gt hc)
  have h2c2u : (2 : Cut) * c ^ 2 * u ≠ 0 := by positivity
  have h1u2 : (1 - u) ^ 2 ≠ 0 := pow_ne_zero 2 h1u
  field_simp
  ring

/-- ★ THE TENSOR FACTORING: `r = rPlateau c N_lead · corrR u` (`u = cutExp(−cφ)`) — the exact tensor
    ratio is the banked N364 class-universal relation `rPlateau` times the correction.
    (`rPlateau c N = 8/(c²N²)`.) -/
theorem rRead_eq_rPlateau_mul_corr (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    rRead c φ = rPlateau c (efoldLead c φ) * corrR (cutExp (-(c * φ))) := by
  unfold rPlateau corrR
  rw [efoldLead_uform c φ (ne_of_gt hc)]
  unfold rRead
  rw [slowRollEps_eq c φ hc hφ]
  set u := cutExp (-(c * φ)) with hu
  have hupos : (0 : Cut) < u := by rw [hu]; exact cutExp_pos _
  have hune : u ≠ 0 := ne_of_gt hupos
  have h1u : (1 : Cut) - u ≠ 0 := one_sub_u_ne c φ hc hφ
  have hc2 : c ^ 2 ≠ 0 := pow_ne_zero 2 (ne_of_gt hc)
  have h2c2u : (2 : Cut) * c ^ 2 * u ≠ 0 := by positivity
  have h1u2 : (1 - u) ^ 2 ≠ 0 := pow_ne_zero 2 h1u
  field_simp
  ring

/-! ## (6) THE ATTRACTOR VALUES and off-attractor non-triviality. -/

/-- ★ THE SPECTRAL CORRECTION AT THE ATTRACTOR: `corrNs 0 = 1`. At `u → 0` (the coherence asymptote
    NEVER reached — C6) the exact `n_s` becomes the class-universal `n_s = 1 − 2/N` EXACTLY. -/
theorem corrNs_zero : corrNs 0 = 1 := by unfold corrNs; norm_num

/-- ★ THE TENSOR CORRECTION AT THE ATTRACTOR: `corrR 0 = 1`. At `u → 0` the exact `r` becomes the
    class-universal `r = 8/(c²N²)` EXACTLY. -/
theorem corrR_zero : corrR 0 = 1 := by unfold corrR; norm_num

/-- ★ W8 (LOAD-BEARING): the spectral correction is GENUINELY NON-CONSTANT — `corrNs (1/2) = 6 ≠ 1 =
    corrNs 0`. The relations `n_s = 1 − 2/N`, `r = 8/(c²N²)` are ATTRACTOR limits (`u → 0`), NOT exact
    at every `φ`. A wrong "the corrections are identically `1` / the relations hold exactly for all
    `φ`" claim would fail. This is the fact the C405 costume rejects. -/
theorem corrNs_half : corrNs (1 / 2) = 6 := by unfold corrNs; norm_num

theorem corrNs_nonconstant : corrNs (1 / 2) ≠ corrNs 0 := by
  rw [corrNs_half, corrNs_zero]; norm_num

/-! ## (7) THE CAPSTONE. -/

/-- ★★★ THE INFLATION SLOW-ROLL DERIVATION (candidate-class, arc-H H2). For the FORCED plateau
    potential (N364), with `u = cutExp(−cφ)` and the FTC-grounded e-fold count `N` (N379): the slow-roll
    steepness/curvature have the closed forms; the leading e-fold count satisfies the suppression
    identity; the spectral tilt and tensor ratio factor EXACTLY through the banked class-universal
    relations `nsPlateau`/`rPlateau` (N364) with corrections that EQUAL `1` at the attractor `u = 0`
    (the asymptote NEVER reached). Hence at the attractor `n_s = 1 − 2/N` and `r = 8/(c²N²)` are
    DERIVED (modulo the flagged slow-roll dictionary), turning the N364 candidate DEFINITIONS into
    derived attractor relations. Off the attractor the corrections are non-trivial. All over the
    derived `Cut`. -/
theorem inflation_slowroll_derived (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    2 * c ^ 2 * cutExp (-(c * φ)) * efoldLead c φ = 1
      ∧ nsRead c φ - 1 = (nsPlateau (efoldLead c φ) - 1) * corrNs (cutExp (-(c * φ)))
      ∧ rRead c φ = rPlateau c (efoldLead c φ) * corrR (cutExp (-(c * φ)))
      ∧ corrNs 0 = 1
      ∧ corrR 0 = 1 :=
  ⟨efoldLead_suppression c φ (ne_of_gt hc),
   nsRead_eq_nsPlateau_mul_corr c φ hc hφ,
   rRead_eq_rPlateau_mul_corr c φ hc hφ,
   corrNs_zero,
   corrR_zero⟩

end

end Phys.Algebra
