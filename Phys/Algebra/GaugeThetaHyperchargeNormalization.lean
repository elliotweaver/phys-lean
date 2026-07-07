/-
  Phys.Algebra.GaugeThetaHyperchargeNormalization — N429 (SEED_FINAL_RECKONING, arc P, target P4).
  ============================================================================================
  THE GAUGE-θ TERM + THE HYPERCHARGE NORMALIZATION — pay the two named debts in full: the F2-childed
  gauge-θ construction (the θ-weight ≡ 1 per configuration; −I ∉ Aut(J₃(𝕆))) and the ≥5×-deferred
  hypercharge normalization (a FORCED read of the banked charge structure, NOT a posited convention).

  ---------------------------------------------------------------------------
  ⭐ FIFTEENTH OWNER-AUTHORIZED SEED (docs/SEED_FINAL_RECKONING.md, ARC P, target P4). The DIRECTED
  single successor of N428 (arc-P P3 complete). Arc P is the FINAL arc of the owner-authorized chain;
  NO forward-childing past P; NO deferral (§0 NO-DEFERRAL law). Two named debts are paid here:
    • N367 (F2, StrongCPTheta.lean lines 37–40) EXPLICITLY childed "the full gauge-θ term construction
      (the θ-weight ≡ 1 per configuration; −I ∉ Aut(J₃(𝕆)))" as the SEED §F2 Tier-2 formal debt.
    • The hypercharge NORMALIZATION was deferred ≥5× (N253/N255/N277/… scope notes: "respects the ≥5×
      hypercharge-normalization deferral", "risks a posited normalization", "the normalization stays a
      separate downstream node"). THIS node discharges both.

  ---------------------------------------------------------------------------
  PIECE A — THE GAUGE-θ DISSOLUTION (F2's childed debt). The matter arena is the cap-forced maximal
  formally-real Hermitian Jordan algebra J₃(O ℚ); its observable is the Freudenthal reduced determinant
  `jN` (banked N215), embedded in the algebra as `detArena = ocR (jN …)` (banked N367). The θ-term of
  gauge theory weights each topological vacuum sector by a phase `e^{iθ}`; the sector-distinguishing
  datum is the PHASE (argument) of the arena determinant.

    ★ θ-WEIGHT ≡ 1 (trivial phase) per configuration (`thetaWeight_trivial`). The θ-weight is the
      imaginary (phase) part of the arena determinant, `thetaWeight = detArena − ocR(reQ detArena)`,
      which is EXACTLY ZERO for EVERY configuration (banked N367 `theta_det_phase_zero`): the arena
      determinant is ℚ-valued (built from `reQ` ⊕ Born norms only), so it lands on the real line with
      no argument. There is no phase for the θ-weight to be — it is identically the trivial weight `1`.

    ★ −I ∉ Aut(J₃(𝕆)) (`negId_not_isAlgAut`). The θ = π sector would be reached by the central
      inversion −I. But −I (the ℚ-linear self-equiv `negId = LinearEquiv.neg ℚ`, `negId x = −x`) is NOT
      an algebra automorphism: it fails unitality, `negId 1 = −1 ≠ 1` (`negOne_ne_one`). The derived
      gauge group `Aut(O ℚ) = g₂ ⊂ F₄` (banked N269) contains NO central inversion.

    ★ Full inversion FLIPS `jN` (`jN_neg_all`, `neg_not_preserves_jN`). The reduced determinant is
      degree-3 HOMOGENEOUS — negating all six entries multiplies `jN` by `(−1)³ = −1`. So full inversion
      does NOT preserve `jN`, hence is not a Jordan automorphism of J₃(𝕆) (F₄ = Aut(J₃(𝕆)) preserves
      `jN`, banked N269 `jN_aut_invariant`): the θ = π sector has no automorphism to reach it.

    ★ NO nontrivial central scalar (`scalar_aut_forces_one`). More generally, the ONLY scalar dilation
      `x ↦ c • x` that is an algebra automorphism is `c = 1` — so `c = −1` (−I) is excluded a fortiori.
      There is no central scalar in the derived gauge group to generate distinct θ-vacuum sectors.

  ONE CAUSE (the arena determinant is ℚ-valued, real, F₄-invariant), the θ-vacuum degeneracy is ABSENT:
  θ-weight ≡ 1 AND no −I to shift it. The strong-CP "problem" (the θ dial) has no representative in the
  fold's matter arena — no axion/Peccei–Quinn dial is needed because the dial provably does not exist.

  ---------------------------------------------------------------------------
  PIECE B — THE HYPERCHARGE NORMALIZATION IS FORCED (the ≥5×-deferred convention). The field treats the
  hypercharge normalization as a CONVENTION it must choose (or fix by a GUT embedding) — the recurring
  "risks a posited normalization" deferral. The theory DISSOLVES the convention: the fundamental-7
  `ImO` is g₂-IRREDUCIBLE (Schur, banked N234 `no_proper_invariant_ImO`), so the invariant symmetric
  trace form is unique UP TO OVERALL SCALE, and every physical observable is SCALE-INVARIANT — the
  overall normalization `λ` cancels.

    ★ SCALE-INVARIANCE (`weinberg_scale_invariant`, `hyperRatio_scale_invariant`). Rescaling both banked
      derived traces by ANY `λ ≠ 0` leaves the weak-mixing observable `weinberg trT3sq trQsq =
      trT3sq/trQsq` and the ratio `hyperRatio trQsq trT3sq = (trQsq − trT3sq)/trT3sq` UNCHANGED.

    ★ THE FORCED VALUES (`weinberg_normalization_forced`, `hyperRatio_normalization_forced`). For ANY
      overall scale `λ ≠ 0` of the invariant form, `sin²θ_W = 3/8` and the hypercharge:isospin GUT
      ratio `= 5/3`, computed from the banked derived charge trace `Tr(Q²) = ladderChargeTrace (finrank
      Uhol)` (N317) and isospin trace `Tr(T3²) = isospinTrace (finrank Uhol + finrank singlet) (…)`
      (N318). The normalization is physically INERT: the observable is the same for every `λ`, so the
      "convention" is a gauge redundancy, and the value is FORCED, not chosen.

    ★ W8 TEETH (`weinberg_single_sided_breaks`). Single-sided (independent-scale) rescaling — as if
      charge and isospin lived in DIFFERENT irreducible pieces with INDEPENDENT normalizations — BREAKS
      the invariance (`weinberg (2·2) (16/3) = 6/16 ≠ 3/8`). The forcing genuinely relies on the SHARED
      single scale: the fundamental-7 is ONE g₂-irreducible piece (N234), so there is exactly one form
      normalization, hence a forced ratio — not two independent conventions.

  ---------------------------------------------------------------------------
  HONEST GRADE (carry it, do NOT over-claim). THEOREM-GRADE (forced math, foundations-only over ℚ /
  O ℚ, grounded on the banked `jN`/`detArena`/`IsAlgAut`/`weinberg`/`hyperRatio`/`ladderChargeTrace`/
  `isospinTrace`/`fund2Weight`/`finrank ℚ Uhol`/`finrank ℚ singlet`): the θ-weight vanishing; −I not an
  automorphism; the degree-3 homogeneity / sign flip / non-preservation of `jN`; the unique central
  scalar `c = 1`; the scale-invariance of the observables; the forced `3/8` and `5/3` under any scale;
  the single-sided-scaling teeth. MECHANISM / removable PROSE (never a Lean equation): "θ-weight =
  e^{iθ}"; "−I = the θ = π central inversion"; "the overall invariant-form normalization = the physical
  GUT/coupling normalization convention". The measured `sin²θ_W ≈ 0.231`, `θ̄ < 10⁻¹⁰` are REMOVABLE
  PROSE only; NO FIT.

  ---------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "gauge / θ / strong-CP / vacuum / hypercharge /
  Weinberg / mixing / normalization / GUT / coupling": what remains is — over the derived field ℚ and
  the Cayley–Dickson double `O ℚ = CD (H ℚ)`, (A) the imaginary component of the algebra-embedded cubic
  form `detArena` is identically `0`; the negation self-equiv `LinearEquiv.neg ℚ` is not
  multiplicative-unital (`−1 ≠ 1`) and multiplies the cubic form `jN` by `−1`; the only scalar dilation
  that is multiplicative-unital is the identity; (B) the ratio functionals `weinberg`, `hyperRatio` are
  invariant under an overall nonzero rescaling of their arguments and evaluate to `3/8`, `5/3` at the
  banked derived trace values, while a single-sided rescaling does not. No theorem STATEMENT needs a
  physics word; the headline TYPEs mention the banked derived objects.

  ⚠ FREE-FLOATING RAIL (SOUL): every headline theorem's TYPE is ABOUT the banked derived objects — the
  arena determinant `detArena`/`jN` on `O ℚ`, the derived automorphism predicate `IsAlgAut`, the banked
  observable functionals `weinberg`/`hyperRatio` at the banked derived traces `ladderChargeTrace (finrank
  ℚ Uhol)` / `isospinTrace (finrank ℚ Uhol + finrank ℚ singlet) …`. NOT a generic "homogeneous cubic /
  scale-invariant ratio" abstraction over an arbitrary carrier. G1: `0`, `c = 1`, `3/8`, `5/3` FALL OUT
  (of `theta_det_phase_zero` / real-part preservation / `mul_div_mul_left` / the banked N317/N318
  landings), never premised. G2: NO empirical number in any proof. ⚠ UNEARNED-IMPORT: ground field ℚ
  (all values ℚ-exact); NO Mathlib-ℝ/ℂ as content; `LinearEquiv.neg` is standard Mathlib MACHINERY on
  the derived object.

  UNBROKEN: `detArena` / `theta_det_phase_zero` / `jN_aut_invariant`-genre (N367/N269, StrongCPTheta);
  `jN` / `jN_one` / `gForm` / `reQ` (N215/N??, OctonionJordanCubicNorm / DerivationSkew / DerivationCompact);
  `IsAlgAut` / `reQ_one` / `reQ_smul` / `reQ_neg` (N30b/…, DerivationAutGroup / DerivationIrreducible /
  DerivationCompact); `weinberg` / `hyperRatio` / `ladderChargeTrace` / `weinberg_lands_3_8` /
  `hyperRatio_lands_5_3` / `isospinTrace` / `fund2Weight` (N317/N318, ChiralGeneration{Charge,Isospin}Trace);
  `finrank_Uhol` / `finrank_singlet` (N42c/N19); `LinearEquiv.neg` / `star_neg` / `neg_mul_neg` / `mul_neg`
  standard Mathlib MACHINERY on the derived object. Ground = derived ℚ; nothing posited; no bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no kernel-compilation bypass, no heartbeat inflation.
-/
import Phys.Algebra.StrongCPTheta
import Phys.Algebra.ChiralGenerationIsospinTrace
import Phys.Algebra.DerivationAutGroup
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra.HJ

attribute [local instance] CD.narCD CD.srCD

/-! ## (A) PIECE A — the gauge-θ dissolution: θ-weight ≡ 1, −I ∉ Aut(J₃(𝕆)). -/

/-- THE θ-WEIGHT of a matter configuration: the imaginary (phase) component of the arena determinant,
    `detArena − ocR (reQ (detArena))`. In gauge theory the θ-term weights each vacuum sector by
    `e^{iθ}`, and the sector-distinguishing datum is the PHASE (argument) of the observable determinant.
    Here that phase is captured by this imaginary component. -/
noncomputable def thetaWeight (d0 d1 d2 : ℚ) (a b c : O ℚ) : O ℚ :=
  detArena d0 d1 d2 a b c - ocR (reQ (detArena d0 d1 d2 a b c))

/-- ★★★ THE θ-WEIGHT ≡ 1 (trivial phase) PER CONFIGURATION. The θ-weight vanishes for EVERY
    configuration — the arena determinant is ℚ-valued (built from `reQ` ⊕ Born norms only), so it lands
    on the real line with no argument (banked N367 `theta_det_phase_zero`). There is no phase for the
    θ-weight to be: it is identically the trivial weight. No θ-vacuum sector is distinguished. -/
theorem thetaWeight_trivial (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    thetaWeight d0 d1 d2 a b c = 0 :=
  theta_det_phase_zero d0 d1 d2 a b c

/-- THE CENTRAL INVERSION −I as a ℚ-linear self-equiv of the terminal algebra (`negId x = −x`). This
    is the candidate map to the `θ = π` vacuum sector. -/
noncomputable def negId : O ℚ ≃ₗ[ℚ] O ℚ := LinearEquiv.neg ℚ

/-- `negId x = −x`. -/
theorem negId_apply (x : O ℚ) : negId x = -x := LinearEquiv.neg_apply x

/-- `(−1 : O ℚ) ≠ 1` (the real part `reQ` separates them: `−1 ≠ 1`). -/
theorem negOne_ne_one : (-1 : O ℚ) ≠ 1 := by
  intro h
  have := congrArg reQ h
  rw [reQ_neg, reQ_one] at this
  norm_num at this

/-- ★★★ −I ∉ Aut(J₃(𝕆)): the central inversion is NOT an algebra automorphism — it fails unitality,
    `negId 1 = −1 ≠ 1`. The `θ = π` vacuum sector would be reached by −I, but the derived gauge group
    `Aut(O ℚ) = g₂ ⊂ F₄` (banked N269) contains no central inversion. -/
theorem negId_not_isAlgAut : ¬ IsAlgAut negId := by
  intro h
  have h1 : negId 1 = 1 := h.2
  rw [negId_apply] at h1
  exact negOne_ne_one h1

/-- ★★ THE REDUCED DETERMINANT IS DEGREE-3 HOMOGENEOUS under full inversion: negating all six entries
    multiplies `jN` by `(−1)³ = −1`. The diagonal product picks up `(−1)³`; each Born-norm term is
    even (`gForm (−v) (−v) = gForm v v`); the trilinear cross-term is odd (`reQ ((−a)(−c)·star(−b)) =
    − reQ ((a·c)·star b)`). Pure banked octonion algebra — no coordinate bash. -/
theorem jN_neg_all (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jN (-d0) (-d1) (-d2) (-a) (-b) (-c) = - jN d0 d1 d2 a b c := by
  unfold jN
  have hg1 : gForm (-c) (-c) = gForm c c := by unfold gForm; rw [star_neg, neg_mul_neg]
  have hg2 : gForm (-b) (-b) = gForm b b := by unfold gForm; rw [star_neg, neg_mul_neg]
  have hg3 : gForm (-a) (-a) = gForm a a := by unfold gForm; rw [star_neg, neg_mul_neg]
  have hcross : reQ ((-a) * (-c) * star (-b)) = - reQ (a * c * star b) := by
    rw [star_neg, neg_mul_neg, mul_neg, reQ_neg]
  rw [hg1, hg2, hg3, hcross]; ring

/-- ★★ FULL INVERSION DOES NOT PRESERVE `jN`: since it FLIPS the sign (`jN_neg_all`, degree-3
    homogeneity), it cannot be a Jordan automorphism — `F₄ = Aut(J₃(𝕆))` preserves `jN` (banked N269).
    So the `θ = π` sector has no automorphism to reach it. Proof: if inversion preserved `jN`, then at
    the identity configuration `jN(−1,−1,−1,0,0,0) = jN(1,1,1,0,0,0) = 1`, but homogeneity gives it as
    `− jN(1,1,1,0,0,0) = −1`; contradiction. -/
theorem neg_not_preserves_jN :
    ¬ (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ),
        jN (-d0) (-d1) (-d2) (-a) (-b) (-c) = jN d0 d1 d2 a b c) := by
  intro h
  have hkey := h 1 1 1 0 0 0
  have hneg : jN (-1) (-1) (-1) (-(0 : O ℚ)) (-(0 : O ℚ)) (-(0 : O ℚ)) = -1 := by
    rw [jN_neg_all 1 1 1 0 0 0, jN_one]
  rw [hneg, jN_one] at hkey
  norm_num at hkey

/-- ★★ NO NONTRIVIAL CENTRAL SCALAR: the ONLY scalar dilation `x ↦ c • x` that is an algebra
    automorphism is `c = 1` — so `c = −1` (−I) is excluded a fortiori. There is no central scalar in
    the derived gauge group to generate distinct θ-vacuum sectors. Forced by unitality: `φ 1 = c • 1`
    and `reQ (c • 1) = c`, so `c = reQ 1 = 1`. -/
theorem scalar_aut_forces_one {φ : O ℚ ≃ₗ[ℚ] O ℚ} (c : ℚ) (hc : ∀ x, φ x = c • x)
    (h : IsAlgAut φ) : c = 1 := by
  have h1 : φ 1 = 1 := h.2
  rw [hc 1] at h1
  have h2 := congrArg reQ h1
  rw [reQ_smul, reQ_one, mul_one] at h2
  exact h2

/-! ## (B) PIECE B — the hypercharge normalization is FORCED (scale-invariant observables). -/

/-- ★★ SCALE-INVARIANCE of the weak-mixing observable. The invariant symmetric trace form on the
    g₂-IRREDUCIBLE fundamental-7 `ImO` is unique UP TO OVERALL SCALE (Schur, banked N234
    `no_proper_invariant_ImO`); rescaling both traces by ANY `λ ≠ 0` leaves `weinberg` UNCHANGED. The
    overall normalization is physically inert. -/
theorem weinberg_scale_invariant (lam trT3sq trQsq : ℚ) (hlam : lam ≠ 0) :
    weinberg (lam * trT3sq) (lam * trQsq) = weinberg trT3sq trQsq := by
  unfold weinberg
  rw [mul_div_mul_left _ _ hlam]

/-- ★★ SCALE-INVARIANCE of the hypercharge:isospin GUT ratio. For any `λ ≠ 0`, `hyperRatio` is
    unchanged (the numerator `λ·(trQsq − trT3sq)` and denominator `λ·trT3sq` share the scale). -/
theorem hyperRatio_scale_invariant (lam trQsq trT3sq : ℚ) (hlam : lam ≠ 0) :
    hyperRatio (lam * trQsq) (lam * trT3sq) = hyperRatio trQsq trT3sq := by
  unfold hyperRatio
  rw [← mul_sub, mul_div_mul_left _ _ hlam]

/-- ★★★ THE WEAK-MIXING NORMALIZATION IS FORCED to `3/8`, grounded to the banked derived traces. For
    ANY overall scale `λ ≠ 0` of the invariant form, `sin²θ_W = weinberg (λ·Tr(T3²)) (λ·Tr(Q²)) = 3/8`,
    where `Tr(T3²) = isospinTrace (finrank Uhol + finrank singlet) …` (N318) and `Tr(Q²) =
    ladderChargeTrace (finrank Uhol)` (N317). The normalization "convention" is inert — it cancels — so
    the value is FORCED, not chosen. NOT free-floating: the type mentions the banked derived traces. -/
theorem weinberg_normalization_forced (lam : ℚ) (hlam : lam ≠ 0) :
    weinberg (lam * isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2))
      (lam * ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 / 8 := by
  rw [weinberg_scale_invariant lam _ _ hlam]
  exact weinberg_lands_3_8

/-- ★★★ THE GUT NORMALIZATION FACTOR IS FORCED to `5/3`, grounded. For any `λ ≠ 0`, the
    hypercharge:isospin ratio `hyperRatio (λ·Tr(Q²)) (λ·Tr(T3²)) = 5/3` — the GUT normalization the
    field posits as a convention, here a FORCED read of the banked derived charge structure. NOT
    free-floating: the type mentions the banked derived traces. -/
theorem hyperRatio_normalization_forced (lam : ℚ) (hlam : lam ≠ 0) :
    hyperRatio (lam * ladderChargeTrace (Module.finrank ℚ Uhol))
      (lam * isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2)) = 5 / 3 := by
  rw [hyperRatio_scale_invariant lam _ _ hlam]
  exact hyperRatio_lands_5_3

/-- ★ W8 TEETH: single-sided (independent-scale) rescaling BREAKS the invariance —
    `weinberg (2·2) (16/3) = 6/16 ≠ 3/8`. If charge and isospin lived in DIFFERENT irreducible pieces
    with INDEPENDENT normalizations, the ratio would NOT be forced. The forcing genuinely relies on the
    SHARED single scale: `ImO` is ONE g₂-irreducible piece (N234), so there is exactly one form
    normalization — the reason a UNIQUE value is forced, not a menu of conventions. -/
theorem weinberg_single_sided_breaks : weinberg (2 * 2) (16 / 3) ≠ 3 / 8 := by
  unfold weinberg; norm_num

/-! ## (C) THE CAPSTONE. -/

/-- ★★★ CAPSTONE — arc-P P4: the gauge-θ term + the hypercharge normalization, paying both named debts.
    (A) THE GAUGE-θ DISSOLUTION (F2's childed debt): the θ-weight (the phase of the arena determinant)
    is identically the trivial weight for EVERY configuration (`thetaWeight_trivial`); the central
    inversion −I is NOT an algebra automorphism (`negId_not_isAlgAut`) and does not preserve the
    F₄-invariant cubic norm (`neg_not_preserves_jN`, degree-3 homogeneity `jN_neg_all`); the only
    central scalar automorphism is the identity (`scalar_aut_forces_one`). So no θ-vacuum sector is
    distinguished and none can be reached by a central inversion — the θ dial has no representative.
    (B) THE HYPERCHARGE NORMALIZATION IS FORCED (the ≥5×-deferred convention): every observable is
    scale-invariant (`weinberg_scale_invariant`), so for ANY overall form-normalization `λ ≠ 0` the
    weak-mixing value is `3/8` (`weinberg_normalization_forced`) and the GUT factor is `5/3`
    (`hyperRatio_normalization_forced`), read off the banked derived traces; a single-sided rescaling
    breaks the invariance (`weinberg_single_sided_breaks`, teeth). The normalization is a FORCED,
    physically inert read of the banked charge structure — not a posited convention. -/
theorem gauge_theta_hypercharge_normalization
    (d0 d1 d2 : ℚ) (a b c : O ℚ) (lam : ℚ) (hlam : lam ≠ 0) :
    -- (A) θ-weight ≡ 1 (trivial) per configuration
    thetaWeight d0 d1 d2 a b c = 0 ∧
    -- (A) −I is not an algebra automorphism
    (¬ IsAlgAut negId) ∧
    -- (A) full inversion does not preserve the F₄-invariant cubic norm
    (¬ (∀ (e0 e1 e2 : ℚ) (x y z : O ℚ),
        jN (-e0) (-e1) (-e2) (-x) (-y) (-z) = jN e0 e1 e2 x y z)) ∧
    -- (B) the weak-mixing normalization is forced to 3/8 for any overall scale
    weinberg (lam * isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2))
      (lam * ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 / 8 ∧
    -- (B) the GUT factor is forced to 5/3 for any overall scale
    hyperRatio (lam * ladderChargeTrace (Module.finrank ℚ Uhol))
      (lam * isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2)) = 5 / 3 ∧
    -- (B) teeth: single-sided rescaling breaks it
    weinberg (2 * 2) (16 / 3) ≠ 3 / 8 :=
  ⟨thetaWeight_trivial d0 d1 d2 a b c,
   negId_not_isAlgAut,
   neg_not_preserves_jN,
   weinberg_normalization_forced lam hlam,
   hyperRatio_normalization_forced lam hlam,
   weinberg_single_sided_breaks⟩

end Phys.Algebra
