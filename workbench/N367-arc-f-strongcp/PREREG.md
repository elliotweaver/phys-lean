# N367 PREREG — arc-F F2: strong CP / θ̄ = 0 (the flavor half, no-RH-rotation)

## TARGET (SELECTED theory-native, S4-passed — see kanban comment 271)
The Hermitian J₃(𝕆) matter arena forces the mass-matrix reduced determinant to be a
REAL (ℚ-valued), gauge-fixed invariant — so there is no physical θ-phase to rotate away
(a no-RH-rotation theorem). The CP phase that DOES exist lives in the orthogonal imaginary
associator channel (nonzero), so CP is violated in flavor while θ̄ stays structurally zero.
ONE CAUSE (the octonion product splits reQ ⊕ imaginary), TWO terminations.

## THE ANTI-BULLSHIT LAW (full, in writing)
- STANDARD version: θ̄ = arg det(M_u M_d) + θ_QCD is an unexplained free parameter fine-tuned
  to <10⁻¹⁰ (the strong-CP problem); "solved" only by POSITING a new dial (axion / Peccei-Quinn).
- WHAT THE THEORY DOES: the matter arena is the cap-forced maximal formally-real Hermitian
  J₃(O ℚ) (banked). Its observable determinant is the Freudenthal reduced determinant `jN`,
  which is ℚ-VALUED BY CONSTRUCTION (built from `reQ` — the real part of the octonion product —
  and `gForm` real norms), hence real, arg = 0; and it is preserved by EVERY algebra automorphism
  φ of O ℚ (the derived gauge group Aut(O)=g₂ ⊂ F₄), banked `jN_aut_invariant` (N269). There is
  no phase to shuffle and no axion needed. The wall DISSOLVES — no dial exists. (An F6-shape
  no-dial dissolution.)
- WORDS-REMOVABLE: delete θ/CP/strong/mass/determinant → the reduced determinant `jN` of a
  Hermitian J₃(O ℚ) element is the real part (reQ) of a cubic octonion form (hence ℚ-valued),
  is invariant under every algebra automorphism of O ℚ, and is BLIND to the imaginary trilinear
  channel — while that channel (the calibration 3-form assoc3) is nonzero. Pure algebra over the
  derived rung survives. ✅
- TEMPTATION named: (a) chase the full gauge-θ term / instanton weight ≡1 — the SEED-flagged
  Tier-2 formal debt; FLAG + CHILD, do NOT assert. (b) a generic "Hermitian ⟹ real det" over an
  arbitrary matrix/*-algebra — REJECTED as FREE-FLOATING; every theorem TYPE mentions
  jN / Hm-shape / O ℚ / assoc3 (banked derived objects), never an abstract carrier.

## FRONT (grounded on banked objects — MEASURED, all probes EXIT 0)
Banked crux objects confirmed:
- `jN` (OctonionJordanCubicNorm, N215): reduced determinant, ℚ-valued, = d0d1d2 − Σ dᵢ|·|² + 2·reQ((a·c)·b̄).
- `ocR` / `ocR_star` / `ocR_reQ` (HermitianJordan/Setup, Helpers): real embedding, self-adjoint.
- `reQ`, `reQ_add`, `reQ_neg`, `reQ_sub`, `gForm` (DerivationCompact, TraceFormInvariance).
- `jN_aut_invariant` (OctonionJordanGaugeSpectrumInvariant, N269): F₄/g₂ preserves the determinant.
- `assoc3` + `assoc3_witness_ne_zero` (OctonionAssociative3Form, N209): CP phase source nonzero.
- `u1`, `u2` imaginary octonion witnesses.

## PLANNED PRODUCTION (Phys/Algebra/StrongCPTheta.lean, ns Phys.Algebra.HJ, over ℚ / O ℚ)
- `detArena d0 d1 d2 a b c := ocR (jN …)` — the mass-matrix determinant embedded as an octonion.
- `theta_det_selfAdjoint` — star(detArena) = detArena (self-adjoint = real; arg-free).
- `theta_det_phase_zero` — detArena − ocR(reQ detArena) = 0 (imaginary/phase part is exactly 0).
- `det_no_rh_rotation` — jN d0d1d2 (φa)(φb)(φc) = jN … (F₄ no-RH-rotation; cites jN_aut_invariant).
- `det_blind_to_phase` — jN depends only on {gForm a a, gForm b b, gForm c c, reQ((a·c)·b̄)};
  two configs agreeing on those four real invariants have equal determinant (the determinant does
  NOT see the imaginary trilinear channel where the phase lives).
- `phaseChannel a b c := (a·c)·star b − ocR(reQ((a·c)·star b))` — the discarded imaginary channel.
- `phaseChannel_reQ_zero` — reQ(phaseChannel) = 0 (purely imaginary).
- `phaseChannel_witness` — phaseChannel u1 u2 1 ≠ 0 (the discarded channel is genuinely nonzero;
  gForm = 1). ⇒ CP content EXISTS but is invisible to θ̄.
- `cp_source_nonzero` — assoc3 u2 u1 (octCross u1 u2) ≠ 0 (the CP phase / Jarlskog source ≠ 0).
- W8 non-vacuity: a WRONG "θ̄ could be nonzero / determinant carries a phase" reading reduces to a
  false numeric. Costume C392 (1 = 392): flag = "the determinant's phase is 0", tied to
  `theta_det_phase_zero`; bogus min = 392.
- CAPSTONE `strong_cp_theta_zero` bundling: det real (self-adjoint) ∧ phase zero ∧ no-RH-rotation
  ∧ blind-to-phase ∧ discarded-channel-nonzero ∧ cp-source-nonzero.

## HONEST GRADE (carry it)
- THEOREM-GRADE (foundations-only over ℚ / O ℚ): the reality/self-adjointness of the determinant,
  the exact-zero phase, the F₄ no-RH-rotation, the blind-to-phase contraction, the nonzero orthogonal
  CP channel, and the W8 non-vacuity. All gap-free on the banked objects.
- LEADING-ORDER / route-not-yet-found (FLAGGED, CHILDED, NEVER asserted here): the full gauge-θ
  term construction (θ-weight = det ≡ 1 per configuration; −I ∉ Aut(J₃(𝕆))) — the SEED §F2 Tier-2
  formal debt. Carried forward, not dropped.
- MECHANISM identification (FLAGGED PROSE): det = the physical mass-matrix determinant; assoc3 =
  the physical CP/Jarlskog phase (T8). The math facts are independent of these names.
- No empirical number in any proof (θ̄ bound <10⁻¹⁰, Jarlskog value = removable prose / G2).

## CARRIED REMAINDERS (NAMED, not dropped)
- (1) the full non-abelian anomaly completion SU(2)²·U(1), SU(3)²·U(1), Witten SU(2) (from N366).
- (2) the N364 slow-roll calculus n_s=1−2/N, r=8/(c²N²) (needs derived-ℝ cutExp calculus).
- (3) the gauge-θ term half of F2 (this node).

## COST BUDGET / KILL (W9)
All probes compiled instantly (`lean` direct, no maxHeartbeats, no native_decide). No 27-dim
coordinate expansion (jN is a scalar form; the aut-invariance is banked structurally). Olean
expected LIGHT (~10s). KILL: if any single obligation needs >60s or a maxHeartbeats raise, STOP,
decompose, do NOT grind. (Not expected — all facts are one-line closes on banked lemmas.)

## SUCCESSOR (ONE): a DIRECTED child toward F3 (proton stability, ΔB=3ℤ topological selection rule),
per SEED_SM_COMPLETION §F3. Carry remainders (1)(2)(3) NAMED in the handoff.
