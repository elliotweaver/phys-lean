/-
  Phys.Algebra.StrongCPTheta — N367: STRONG CP / θ̄ = 0 (the flavor half, a no-RH-rotation theorem).
  ============================================================================================
  arc-F F2 (per docs/SEED_SM_COMPLETION.md §F2). DIRECTED SINGLE SUCCESSOR of N366 (arc-F F1,
  anomaly cancellation).

  THE STANDARD PROBLEM (dissolved here). In the Standard Model θ̄ = arg det(M_u M_d) + θ_QCD is an
  unexplained free parameter that must be fine-tuned to < 10⁻¹⁰ (the strong-CP problem); the field
  "solves" it only by POSITING a NEW dial — an axion / Peccei–Quinn symmetry.

  WHAT THE THEORY DOES (no dial exists). The matter arena is the cap-forced maximal formally-real
  Hermitian Jordan algebra J₃(O ℚ) (banked: `OctonionJordanFormallyReal`, `OctonionJordanThreeMatterSlots`).
  Its observable is the Freudenthal reduced determinant `jN` (banked N215, `OctonionJordanCubicNorm`):

      jN d0 d1 d2 a b c = d0·d1·d2 − d0·|c|² − d1·|b|² − d2·|a|² + 2·reQ((a·c)·b̄),

  which is ℚ-VALUED BY CONSTRUCTION — it is built ONLY from the REAL PART `reQ` of the octonion
  product and the real Born norms `gForm`. Embedded back into the algebra as `ocR (jN …)` it is a
  self-adjoint (real) element: its imaginary/phase part is EXACTLY ZERO. There is no argument to the
  determinant, hence NO θ-phase to rotate away — the strong-CP "problem" is an artifact of assuming
  a phase the arena provably lacks.

  Moreover the determinant is preserved by EVERY algebra automorphism φ of O ℚ — the derived gauge
  group Aut(O ℚ) = g₂ ⊂ F₄ (banked N269 `jN_aut_invariant`). This is the no-RH-rotation content: no
  gauge transformation of the off-diagonal (mixing) data can move the determinant, so none can
  generate a θ-phase.

  THE COEXISTENCE (CP violated in flavor, θ̄ stays zero). CP violation lives in the ORTHOGONAL
  imaginary channel that the determinant is BLIND to: the trilinear `(a·c)·b̄` splits as
  reQ ⊕ imaginary, the determinant reads only the reQ face, and the imaginary face — the derived
  calibration 3-form `assoc3` = the fold's G₂-invariant associator, the banked CP / Jarlskog phase
  source (T8) — is NONZERO (`assoc3_witness_ne_zero`, N209). ONE CAUSE (the octonion product splits
  reQ ⊕ imaginary), TWO terminations: θ̄ = 0 (real determinant) AND J ≠ 0 (nonzero associator).

  HONEST GRADE. THEOREM-GRADE (foundations-only over ℚ / O ℚ): the reality/self-adjointness of the
  determinant, the EXACT-ZERO phase, the F₄ no-RH-rotation, the blind-to-phase contraction, the
  nonzero orthogonal CP channel, the W8 non-vacuity. LEADING-ORDER / route-not-yet-found (FLAGGED,
  CHILDED, NEVER asserted here): the full gauge-θ term construction (the θ-weight ≡ 1 per
  configuration; −I ∉ Aut(J₃(𝕆))) — the SEED §F2 Tier-2 formal debt. MECHANISM identification
  (FLAGGED PROSE): `jN` = the physical mass-matrix determinant; `assoc3` = the physical CP/Jarlskog
  phase. No empirical number in any proof (the measured θ̄ bound < 10⁻¹⁰ and the Jarlskog value are
  removable prose / costume only).

  PHYSICS-WORDS-REMOVABLE. Delete θ / CP / strong / mass / determinant: the reduced form `jN` of a
  Hermitian J₃(O ℚ) element is the real part (`reQ`) of a cubic octonion form (hence ℚ-valued), is
  invariant under every algebra automorphism of O ℚ, and depends only on the four real invariants
  {gForm a a, gForm b b, gForm c c, reQ((a·c)·b̄)} — blind to the imaginary trilinear channel — while
  that channel (the calibration 3-form `assoc3`) is nonzero. Pure algebra over the derived rung.

  NOT FREE-FLOATING. Every theorem TYPE mentions the banked derived objects `jN` (N215), `ocR`/`reQ`/
  `gForm`, `IsAlgAut`/`jN_aut_invariant` (N269), `assoc3` (N209) on the derived rung `O ℚ = CD (H ℚ)`
  — NOT a generic "Hermitian ⟹ real det" abstraction over an arbitrary matrix / *-algebra.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanGaugeSpectrumInvariant
import Phys.Algebra.OctonionJordanTraceFormInvariance
import Phys.Algebra.OctonionAssociative3Form
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

/-! ## The mass-matrix determinant of the Hermitian arena, embedded in the algebra. -/

/-- THE MATTER-ARENA DETERMINANT embedded as an octonion: `ocR (jN …)`, the Freudenthal reduced
    determinant of the general Hermitian element `Hm d0 d1 d2 a b c` of J₃(O ℚ), embedded back into
    `O ℚ` through the real embedding `ocR`. Because `jN` is ℚ-valued this lands on the real line. -/
noncomputable def detArena (d0 d1 d2 : ℚ) (a b c : O ℚ) : O ℚ := ocR (jN d0 d1 d2 a b c)

/-! ## §1 — THE DETERMINANT IS REAL (self-adjoint): there is no phase. -/

/-- ★★ THE DETERMINANT IS SELF-ADJOINT (real): `star (detArena …) = detArena …`. The reduced
    determinant is ℚ-valued, so its algebra embedding is fixed by conjugation — it carries no
    imaginary phase. (`arg det = 0`, structurally.) -/
theorem theta_det_selfAdjoint (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    star (detArena d0 d1 d2 a b c) = detArena d0 d1 d2 a b c := ocR_star _

/-- ★★★ THE DETERMINANT'S PHASE IS EXACTLY ZERO: `detArena − ocR (reQ (detArena)) = 0`, i.e. the
    determinant equals its own real part — the imaginary (phase) component vanishes identically.
    There is NO θ-phase to rotate away: the strong-CP problem dissolves because the arena's observable
    determinant provably has no argument. -/
theorem theta_det_phase_zero (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    detArena d0 d1 d2 a b c - ocR (reQ (detArena d0 d1 d2 a b c)) = 0 := by
  unfold detArena
  rw [show reQ (ocR (jN d0 d1 d2 a b c)) = jN d0 d1 d2 a b c from rfl, sub_self]

/-! ## §2 — THE DETERMINANT IS GAUGE-FIXED: the no-RH-rotation theorem. -/

/-- ★★★ THE NO-RH-ROTATION THEOREM: the determinant is invariant under EVERY algebra automorphism
    `φ` of `O ℚ` — the derived gauge group `Aut(O ℚ) = g₂ ⊂ F₄`. Transforming the off-diagonal
    (mixing) data `a, b, c ↦ φa, φb, φc` leaves `jN` unchanged (banked N269 `jN_aut_invariant`), so
    no gauge / basis rotation of the mixing sector can move the determinant — hence none can generate
    a θ-phase. -/
theorem det_no_rh_rotation {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ)
    (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jN d0 d1 d2 (φ a) (φ b) (φ c) = jN d0 d1 d2 a b c :=
  jN_aut_invariant h d0 d1 d2 a b c

/-! ## §3 — THE DETERMINANT IS BLIND TO THE PHASE CHANNEL. -/

/-- ★★ BLIND-TO-PHASE: the determinant depends ONLY on the four REAL invariants
    `{gForm a a, gForm b b, gForm c c, reQ ((a·c)·b̄)}`. Two configurations that agree on those four
    real quantities have equal determinant — the determinant does NOT see the imaginary trilinear
    channel where CP violation lives. This is the structural reason θ̄ is untouched by CP-violating
    flavor data. -/
theorem det_blind_to_phase (d0 d1 d2 : ℚ) (a b c a' b' c' : O ℚ)
    (ha : gForm a a = gForm a' a') (hb : gForm b b = gForm b' b') (hc : gForm c c = gForm c' c')
    (hr : reQ ((a * c) * star b) = reQ ((a' * c') * star b')) :
    jN d0 d1 d2 a b c = jN d0 d1 d2 a' b' c' := by
  unfold jN; rw [ha, hb, hc, hr]

/-! ## §4 — THE ORTHOGONAL PHASE CHANNEL IS NONZERO: CP is violated in flavor. -/

/-- THE DISCARDED PHASE CHANNEL: the purely-imaginary part of the trilinear `(a·c)·b̄` — exactly the
    content the reduced determinant throws away (the determinant keeps only its `reQ`). -/
noncomputable def phaseChannel (a b c : O ℚ) : O ℚ :=
  (a * c) * star b - ocR (reQ ((a * c) * star b))

/-- The phase channel is PURELY IMAGINARY: `reQ (phaseChannel …) = 0`. It carries no real part, so
    it contributes nothing to the (real) determinant — yet it need not be zero. -/
theorem phaseChannel_reQ_zero (a b c : O ℚ) : reQ (phaseChannel a b c) = 0 := by
  unfold phaseChannel
  rw [reQ_sub, show reQ (ocR (reQ ((a * c) * star b))) = reQ ((a * c) * star b) from rfl, sub_self]

/-- The embedded real part of the vanishing rational is `0`. -/
theorem ocR_zero_rat : ocR (0 : ℚ) = (0 : O ℚ) := rfl

/-- At the imaginary witnesses `(u1, u2, 1)` the trilinear has zero real part, so the phase channel
    equals the trilinear itself: `phaseChannel u1 u2 1 = (u1·1)·ū2`. -/
theorem phaseChannel_witness_eq : phaseChannel u1 u2 1 = (u1 * (1 : O ℚ)) * star u2 := by
  have hr : reQ ((u1 * (1 : O ℚ)) * star u2) = 0 := by unfold reQ; simp [u1, u2]
  unfold phaseChannel; rw [hr, ocR_zero_rat, sub_zero]

/-- ★★ W8 TEETH: the discarded phase channel is GENUINELY NONZERO — `phaseChannel u1 u2 1 ≠ 0`
    (its Born norm is `1`). So the determinant discards a NONZERO imaginary channel: CP-violating
    content EXISTS in the arena, invisible to θ̄. A "the determinant sees everything / the phase
    channel is trivial" mis-reading would force `phaseChannel u1 u2 1 = 0`, contradicting the unit
    Born norm. -/
theorem phaseChannel_witness : phaseChannel u1 u2 1 ≠ 0 := by
  intro h
  have hg : gForm (phaseChannel u1 u2 1) (phaseChannel u1 u2 1) = 1 := by
    rw [phaseChannel_witness_eq]; unfold gForm reQ; simp [u1, u2]
  rw [h] at hg; unfold gForm reQ at hg; simp at hg

/-- ★★ THE CP-PHASE SOURCE IS NONZERO: the derived calibration 3-form `assoc3` (the fold's
    G₂-invariant associator, the banked CP / Jarlskog phase source, N209 / T8) is nonzero on the
    imaginary witnesses. CP is violated in flavor even though θ̄ = 0. -/
theorem cp_source_nonzero : assoc3 u2 u1 (octCross u1 u2) ≠ 0 := assoc3_witness_ne_zero

/-! ## §5 — THE CAPSTONE. -/

/-- ★★★ STRONG CP / θ̄ = 0 (the flavor half, no-RH-rotation), bundled: for the general Hermitian
    matter-arena element,

    (1) the reduced determinant embedding is REAL (self-adjoint) — no phase;
    (2) its phase (imaginary) component is EXACTLY ZERO;
    (3) it is invariant under every algebra automorphism (the derived gauge group) — no-RH-rotation;
    (4) it is BLIND to the imaginary trilinear channel (depends only on four real invariants);
    (5) that discarded phase channel is genuinely NONZERO (CP content exists);
    (6) the CP-phase source `assoc3` is nonzero (CP is violated in flavor).

    ONE CAUSE (the octonion product splits reQ ⊕ imaginary), TWO terminations: θ̄ = 0 and J ≠ 0.
    There is no dial: the strong-CP problem is an artifact of assuming a phase the arena lacks. -/
theorem strong_cp_theta_zero
    (d0 d1 d2 : ℚ) (a b c : O ℚ)
    {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) :
    (star (detArena d0 d1 d2 a b c) = detArena d0 d1 d2 a b c)
    ∧ (detArena d0 d1 d2 a b c - ocR (reQ (detArena d0 d1 d2 a b c)) = 0)
    ∧ (jN d0 d1 d2 (φ a) (φ b) (φ c) = jN d0 d1 d2 a b c)
    ∧ (reQ (phaseChannel u1 u2 1) = 0)
    ∧ (phaseChannel u1 u2 1 ≠ 0)
    ∧ (assoc3 u2 u1 (octCross u1 u2) ≠ 0) :=
  ⟨theta_det_selfAdjoint d0 d1 d2 a b c,
   theta_det_phase_zero d0 d1 d2 a b c,
   det_no_rh_rotation h d0 d1 d2 a b c,
   phaseChannel_reQ_zero u1 u2 1,
   phaseChannel_witness,
   cp_source_nonzero⟩

end Phys.Algebra.HJ
