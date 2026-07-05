/-
  # N337 — SEEDED GAUGE ROUTE C3 (arc-C): DARK MATTER = STERILE ν_R — the sterile right-handed
  #         neutrino as ONE theorem. The fold's self-blind self-direction is HEAVY-STERILE
  #         (eigenvector of the family-blind heavy Majorana scale, eigenvalue `M`, nonzero),
  #         LIGHT-MASSLESS (`m₁ = 0`, banked N336 zero-mode), and STABLE (the decay portal `D Dᵀ`
  #         annihilates it — every transition amplitude to an active direction vanishes) — all from
  #         the SAME self-blindness `Poth · s = 0`. Heavy-sterile + light-massless + stable = the
  #         sterile-ν_R dark-matter identification. Over the DERIVED ℝ `ContinuumQ.Cut`.
  =============================================================================================

  ⭐ SECOND OWNER-AUTHORIZED SEED — GAUGE → SCALE-TOWER → COSMOLOGY, TARGET C3(a)
  (`docs/SEED_GAUGE_SCALE_COSMOLOGY.md`, §ARC C). The directed single successor of N336 (C2). C2
  derived the MASSLESS lightest neutrino (`m₁ = 0`, the self-direction is a LIGHT zero-mode). C3(a)
  derives the CONVERSE PAIR that turns "massless" into "dark": what the SAME self-blind self-
  direction does to (i) the HEAVY operator and (ii) the DECAY portal — heavy-sterile and stable.

  ## WHAT THIS NODE BANKS

  Over the derived ℝ `Cut`, with `D₀ : Matrix (Fin 3)(Fin 3) Cut` a Dirac coupling and `M` the ONE
  seesaw scale (banked `heavyMajorana M = M • 1`, N335; `selfDir = ![1,1,1]`, `othersProj`,
  `massOfDir`, `self_generation_massless`, `selfDir_zero_mode`, N336):

  (1) HEAVY, NOT LIGHT — the self-direction is heavy-STERILE. The self / DC generation-direction `s`
      is the EIGENVECTOR of the family-blind heavy Majorana scale with the FULL eigenvalue `M`:

          `heavyMajorana_selfDir_eigen : (heavyMajorana M).mulVec selfDir = M • selfDir`
          `heavyMajorana_selfDir_ne_zero : M ≠ 0 → (heavyMajorana M).mulVec selfDir ≠ 0`

      So `s` is NOT massless in the heavy sector — it carries the whole sterile scale `M`. Contrast
      with the LIGHT sector, where `s` is a zero-mode (N336 `selfDir_zero_mode`). The one direction
      the light Dirac coupling is blind to is the one the heavy scalar sees in full: HEAVY-STERILE,
      LIGHT-MASSLESS. This is the sterile ν_R's defining split, DERIVED (the field POSITS the heavy
      sterile scale; the theory DERIVES that the self-blind direction carries it).

  (2) NO DECAY PORTAL — STABILITY is a THEOREM. The physical decay channel of a right-handed
      neutrino runs through the SAME Dirac portal `D Dᵀ` that gives the light mass (Born =
      self-overlap, the trunk). But that portal annihilates the self-direction, because it is built
      from the others-coupling `D = othersProj · D₀` and `othersProj · s = 0` (self-blindness):

          `dirac_portal_selfDir_zero : ((othersProj · D₀)(othersProj · D₀)ᵀ).mulVec selfDir = 0`
          `transition_to_active_vanishes : ⟨v, (M⁻¹ • (D Dᵀ)).mulVec selfDir⟩ = 0`   (∀ active v)
          `dirac_transition_vanishes : ⟨v, ((D Dᵀ)).mulVec selfDir⟩ = 0`               (raw portal)

      EVERY transition amplitude from `s` to any active direction `v` vanishes — no decay channel
      exists. STABILITY is the SAME `Poth · s = 0` self-blindness that made the state massless. One
      blindness: massless + sterile-light + no-decay all at once.

  (3) THE C3(a) ONE THEOREM. `sterile_nu_dark_matter` bundles: `s` is (a) a heavy-scale eigenvector
      (`M • s`, nonzero) — HEAVY-STERILE; (b) LIGHT-MASSLESS (banked `self_generation_massless`,
      `m₁ = 0`); (c) has ZERO decay amplitude to every active direction (`transition_to_active_
      vanishes`) — STABLE. Stable + light-massless + carries a heavy sterile scale = the sterile-ν_R
      dark-matter identification, as ONE theorem over the derived `Cut`, riding the banked N335 heavy
      scale + N336 massless self-direction.

  where `heavyMajorana` (N335), `selfDir`/`othersProj`/`massOfDir`/`self_generation_massless`/
  `selfDir_zero_mode`/`smul_mulVec_eq`/`dirac_others_self_blind` (N336) are BANKED; `Cut` is the
  derived ℝ (N33–N37); `Matrix.mulVec`/`transpose`/`dotProduct` are standard Mathlib MACHINERY on
  the derived `Cut`. NO `Real.exp`/`Real.pi`, NO empirical Λ / DM abundance / ν mass premised.

  ## ρ_Λ (part b) IS DEFERRED WITH A NAMED ROUTE — NOT fished here (anti-bullshit)

  The seed's C3(b) — `ρ_Λ = (Σm_ν/26)⁴` via the 26 traceless J₃(𝕆) channels — is NOT banked here,
  and forcing it now would be the exact fishing the seed warns against:
    • THE COUNT "26" IS NOT A BANKED FINRANK. The J₃(𝕆)=27-dim arena is banked ONLY as an explicit
      algebraic decomposition `Hm = Dg + slotA + slotB + slotC` (N267 `Hm_slot_decomp`, "3 + 3·8 =
      27" in a COMMENT), never as a Lean `Module.finrank … = 27`. N299/N300 EXPLICITLY AVOIDED
      computing `dim hermSub = 27` (a W9 instrument-cost wall — a 27-dim coordinate basis times out).
      `26 = 27 − 1` appears only as MEASURED PROSE (`dim 78 = 52 + 26`, "measured N295"), NOT a
      derived finrank. Banking `(Σm_ν/26)⁴` here would ASSERT the channel count (G1) or need a genuine
      un-banked W9 prerequisite (`finrank(ker jTr) = 26`) on a DIFFERENT carrier (`O ℚ`, ns `HJ`).
    • THE FOURTH POWER + Σm_ν/26 IDENTIFICATION IS A PERMANENT-INCEPTION CANDIDATE (the seed is
      explicit: the magnitude was known BEFORE the mechanism, ρ_Λ^{1/4}=2.30 vs obs 2.24). Producing
      it now, before the mechanism is forced, would be fitting Λ — explicitly forbidden.
  ⟹ Part (b) is handed forward as ONE directed route-finder / C4-consolidation successor that NAMES
  the `finrank(traceless J₃(𝕆)) = 26` prerequisite and sets up the analytic-completion (D1) handoff.

  ## THE THEORY-NATIVE READING (why C3 is the sterile-ν_R pair, and why it is DERIVED not posited)

  C2 gave the massless self-direction (a LIGHT zero-mode). C3's theory-native question is the
  CONVERSE PAIR. The fold answers with the SAME blindness twice:
    (i) HEAVY-BLIND ⟹ FULL STERILE SCALE. The family-blind heavy scale `M • 1` (N335, forced ∝ id by
        family self-blindness N290/N271) has `s` as an eigenvector with eigenvalue `M` — the whole
        sterile scale rides the self-direction (`heavyMajorana_selfDir_eigen`).
    (ii) LIGHT-BLIND ⟹ MASSLESS ∧ STABLE. The light Dirac portal `D = othersProj · D₀` annihilates
        `s` (`othersProj · s = 0`), so `s` is both a light zero-mode (massless, N336) AND has no
        decay channel (stable, `dirac_portal_selfDir_zero`). One portal, one blindness, two
        consequences.
  ONE CAUSE, MANY TERMINATIONS: the SAME self-blindness that caps the cascade at three (N5), makes
  the family `so(3)` blind to all generation content (N290), and made the self-generation massless
  (N336) is what makes it STABLE and STERILE — the fold's blindness to itself is the light zero-mode,
  the absent decay portal, and (via the heavy scalar's eigenvector) the full sterile scale.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "neutrino / sterile / dark-matter / stable / decay / mass / massless / generation /
  cosmology". What survives: for `s = ![1,1,1]`, `heavyMajorana M = M • 1`, `D = othersProj · D₀`
  over `Cut`: `(M • 1).mulVec s = M • s`, `(M • 1).mulVec s ≠ 0` for `M ≠ 0`, `(D Dᵀ).mulVec s = 0`,
  `⟨v, (M⁻¹ • (D Dᵀ)).mulVec s⟩ = 0`, and `(M • 1).mulVec v ≠ 0` for `M ≠ 0, v ≠ 0`. Pure real-matrix
  (`Cut`) analysis. No physics name does any logical work.

  ## HONEST GRADE (mandatory flags — DO NOT over-claim)

  Grades in this file are DIFFERENT:
    • IDENTITY-grade (forced math): `heavyMajorana_selfDir_eigen` (heavy eigenvector),
      `heavyMajorana_selfDir_ne_zero` (heavy-nonzero), `dirac_portal_selfDir_zero` (portal kills the
      self), `transition_to_active_vanishes`/`dirac_transition_vanishes` (zero decay amplitude),
      `heavyMajorana_no_massless` (heavy full-rank). Pure `Cut`-matrix arithmetic on banked objects.
    • CANDIDATE-grade (arc-C, prose + identification, NEVER asserted): (i) the physical READING —
      `selfDir` IS the physical sterile ν_R, its stability IS cosmological darkness; (ii) the decay
      portal IS `D Dᵀ` (the Born self-overlap portal). Both flagged CANDIDATE — the whole arc C is
      candidate-grade, NOT identity-grade like arc A. The ρ_Λ magnitude / 26-channel fourth power is
      DEFERRED (a permanent-inception candidate; NEVER banked here).
    • ⚠️⚠️ STANDING + JOINT KILL-LINE (prose-only, do NOT soften): the `m₁ = 0` sterile-ν_R
      dark-matter identification is JOINTLY FALSIFIABLE with the ν-spectrum law (C2): any `m₁ > 0`
      detection kills BOTH the ν-spectrum law AND the dark-matter story together. The DESI DR2
      `Σ < 58 meV` tension (C1, ~2σ) stands. ρ_Λ carries a PERMANENT INCEPTION FLAG; the w = −1
      stance is a registered bet against DESI's mild evolving-DE lean (kill-line: DR3 confirming
      w ≠ −1 at 5σ kills it). Lab ordering (JUNO/DUNE) is the adjudicator. NEVER fit, NEVER an escape
      hatch; the numbers stay REMOVABLE PROSE; no empirical Λ / DM / ν mass in any statement or proof.
    • ⚠ HIDDEN JOINT OUT OF SCOPE: the private program's cosmology block (T_RH, η_B, Ω_DM) rests on a
      freeze-in Boltzmann integrator convention-sensitive by ×3×10⁷ — the abundances are
      anchor/convention-conditional, NOT clean. This arc's job is the ν/DM STRUCTURE, not the
      reheating cascade; the integrator swamp is flagged OUT OF SCOPE.

  ## THE ONE CAUSE (THE ONE LAW)

  The SAME octonion self-blindness that caps the tower at three (N5), furnishes exactly three matter
  slots (N267), makes the family `so(3)` blind to all generation content (N290), and made the
  self / DC generation-direction a LIGHT zero-mode (N336) is what makes it STERILE and STABLE: the
  self-blind direction has NO light mass, NO decay portal, and (through the family-blind heavy
  scalar `M • 1`) carries the FULL sterile scale `M`. One blindness — light-massless, stable,
  heavy-sterile — one budget.

  ## SEED-2 HARD GUARDS

  - G1 NO ASSERTED VALUE — the sterile/stable/massless structure FALLS OUT of the banked objects; no
    decimal/literal value in any statement or proof. ρ_Λ magnitude / the 26-count is DEFERRED, NEVER
    asserted here.
  - G2 NO EMPIRICAL NUMBER — measured Λ / DM abundance / w / ν mass = REMOVABLE PROSE ONLY; none
    appears in any statement or proof.
  - G3 SCALES vs RATIOS — `M` is the single dimensionful anchor (the heavy sterile scale = `M • 1`,
    banked N335); NO new dimensionful `Cut` atom.
  - G4 DERIVED NOT POSITED — stability (no decay portal) and heavy-sterility (eigenvector of `M • 1`)
    are DERIVED from the banked self-blindness `othersProj · s = 0`; the only candidate
    identifications (`selfDir` = physical ν_R, portal = `D Dᵀ`) are flagged candidate. No Mathlib-ℝ
    content.
  - G5 PHYSICS-WORDS-REMOVABLE — every theorem stands as pure `Cut`-matrix analysis (see §above).
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; complete proofs,
    no posited axiom, no sorry, no kernel-compiled decision, no `maxHeartbeats` raise. Ground field
    the DERIVED ℝ `Cut` + banked `heavyMajorana`/`selfDir`/`othersProj`/`massOfDir` (⚠ NOT Mathlib-ℝ/
    `Real.exp`/`Real.pi`; `Matrix` is MACHINERY only).

  ## NOT FREE-FLOATING

  Every C3 theorem's TYPE mentions the banked `heavyMajorana` (N335) and/or `selfDir`/`othersProj`/
  `massOfDir`/`self_generation_massless`/`selfDir_zero_mode` (N336) over the derived `Cut`. NOT
  generic over an arbitrary field — grounded on the banked C1/C2 seesaw machinery.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system
  content import, NO `Real.exp`/`Real.pi`. No empirical Λ / DM / ν mass appears anywhere.
-/
import Phys.Algebra.NeutrinoMasslessGeneration
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

/-! ## (1) HEAVY, NOT LIGHT — the self-direction is heavy-STERILE. -/

/-- ★ THE SELF-DIRECTION IS THE HEAVY EIGENVECTOR: the family-blind heavy Majorana scale `M • 1`
    (N335) has the self / DC direction `s` as an eigenvector with the FULL eigenvalue `M`:
    `(heavyMajorana M).mulVec selfDir = M • selfDir`. So `s` carries the whole sterile scale — it is
    NOT massless in the heavy sector (contrast the LIGHT zero-mode, N336). HEAVY-STERILE. -/
theorem heavyMajorana_selfDir_eigen (M : Cut) :
    (heavyMajorana M).mulVec selfDir = M • selfDir := by
  rw [heavyMajorana, smul_mulVec_eq, Matrix.one_mulVec]

/-- ★ THE HEAVY SCALE ON THE SELF-DIRECTION IS NONZERO for `M ≠ 0`: `(heavyMajorana M).mulVec
    selfDir ≠ 0`. The sterile self-direction carries a genuine (nonzero) heavy scale — it is heavy in
    the sector the LIGHT coupling is blind to. -/
theorem heavyMajorana_selfDir_ne_zero (M : Cut) (hM : M ≠ 0) :
    (heavyMajorana M).mulVec selfDir ≠ 0 := by
  rw [heavyMajorana_selfDir_eigen]
  intro h
  have h0 := congrFun h 0
  simp only [Pi.smul_apply, selfDir, Matrix.cons_val_zero, smul_eq_mul, mul_one,
    Pi.zero_apply] at h0
  exact hM h0

/-! ## (2) NO DECAY PORTAL — STABILITY is a THEOREM (the same self-blindness). -/

/-- ★ THE DECAY PORTAL ANNIHILATES THE SELF-DIRECTION: for the others-coupling `D = othersProj · D₀`
    (N336), the Born self-overlap portal `D Dᵀ` maps the self-direction to `0`:
    `((othersProj · D₀)(othersProj · D₀)ᵀ).mulVec selfDir = 0`. This is the SAME self-blindness
    (`Dᵀ · s = 0`, banked `dirac_others_self_blind`) that made the state massless — now it kills the
    decay portal. STABILITY, derived. -/
theorem dirac_portal_selfDir_zero (D0 : Matrix (Fin 3) (Fin 3) Cut) :
    ((othersProj * D0) * (othersProj * D0)ᵀ).mulVec selfDir = 0 := by
  rw [← Matrix.mulVec_mulVec, dirac_others_self_blind, Matrix.mulVec_zero]

/-- ★★ EVERY TRANSITION AMPLITUDE TO AN ACTIVE DIRECTION VANISHES: through the light seesaw operator
    `M⁻¹ • (D Dᵀ)` (the physical portal), the amplitude from the self-direction to ANY direction `v`
    is `0`: `⟨v, (M⁻¹ • (D Dᵀ)).mulVec selfDir⟩ = 0`. No decay channel exists — the sterile
    self-direction is STABLE (via the banked zero-mode `selfDir_zero_mode`, N336). -/
theorem transition_to_active_vanishes (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut)
    (v : Fin 3 → Cut) :
    dotProduct v (((M⁻¹) • ((othersProj * D0) * (othersProj * D0)ᵀ)).mulVec selfDir) = 0 := by
  rw [selfDir_zero_mode, dotProduct_zero]

/-- ★ The same on the RAW portal (no scale): `⟨v, (D Dᵀ).mulVec selfDir⟩ = 0` for `D = othersProj ·
    D₀`. The decay portal has zero overlap with every direction — the stability is scale-independent. -/
theorem dirac_transition_vanishes (D0 : Matrix (Fin 3) (Fin 3) Cut) (v : Fin 3 → Cut) :
    dotProduct v (((othersProj * D0) * (othersProj * D0)ᵀ).mulVec selfDir) = 0 := by
  rw [dirac_portal_selfDir_zero, dotProduct_zero]

/-! ## (3) THE C3(a) CAPSTONE — DARK MATTER = STERILE ν_R, all consequences at once. -/

/-- ★★★ C3(a) — DARK MATTER = STERILE ν_R, the ONE theorem, over the banked derived-ℝ `Cut` and the
    banked N335 heavy scale + N336 massless self-direction. The fold's self-blind self / DC
    generation-direction `s = (1,1,1)` is:
      (a) HEAVY-STERILE — an eigenvector of the family-blind heavy Majorana scale `M • 1` with the
          full eigenvalue `M` (`heavyMajorana_selfDir_eigen`), NONZERO for `M ≠ 0`
          (`heavyMajorana_selfDir_ne_zero`) — it carries the whole sterile scale;
      (b) LIGHT-MASSLESS — a light zero-mode, `massOfDir (othersProj · D₀) M selfDir = 0` (banked
          `self_generation_massless`, `m₁ = 0`);
      (c) STABLE — every transition amplitude to an active direction vanishes
          (`transition_to_active_vanishes`), because the decay portal `D Dᵀ` annihilates the
          self-direction (the same self-blindness `Poth · s = 0`).
    Stable + light-massless + carries a heavy sterile scale = the sterile-ν_R dark-matter
    identification. CANDIDATE-grade (the physical reading + the decay-portal identification are
    flagged candidate, NEVER asserted); the `m₁ = 0` claim is JOINTLY FALSIFIABLE with this
    dark-matter story (any `m₁ > 0` kills both), a REMOVABLE-PROSE standing kill-line. The ρ_Λ
    magnitude / 26-channel fourth power is DEFERRED with a named prerequisite, NEVER banked here. -/
theorem sterile_nu_dark_matter :
    (∀ (M : Cut), (heavyMajorana M).mulVec selfDir = M • selfDir)
    ∧ (∀ (M : Cut), M ≠ 0 → (heavyMajorana M).mulVec selfDir ≠ 0)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut),
        massOfDir (othersProj * D0) M selfDir = 0)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (v : Fin 3 → Cut),
        dotProduct v (((M⁻¹) • ((othersProj * D0) * (othersProj * D0)ᵀ)).mulVec selfDir) = 0) :=
  ⟨heavyMajorana_selfDir_eigen, heavyMajorana_selfDir_ne_zero,
   self_generation_massless, transition_to_active_vanishes⟩

/-! ## NON-VACUITY (W8): the heavy operator is FULL-RANK — the light zero-mode is light-only. -/

/-- NON-VACUITY: the family-blind heavy scale `M • 1` has NO massless direction — for `M ≠ 0` and
    `v ≠ 0`, `(heavyMajorana M).mulVec v ≠ 0`. So the self-direction's masslessness is GENUINELY a
    LIGHT-sector phenomenon (a zero-mode of the light portal `D Dᵀ`, not of the heavy scalar); the
    self-blind light/heavy split is load-bearing. A mis-built heavy scale (not full-rank) would break
    this and collapse the sterile/heavy distinction. -/
theorem heavyMajorana_no_massless (M : Cut) (hM : M ≠ 0) (v : Fin 3 → Cut) (hv : v ≠ 0) :
    (heavyMajorana M).mulVec v ≠ 0 := by
  rw [heavyMajorana, smul_mulVec_eq, Matrix.one_mulVec]
  intro h
  apply hv
  funext i
  have hi := congrFun h i
  simp only [Pi.smul_apply, smul_eq_mul, Pi.zero_apply] at hi
  rcases mul_eq_zero.mp hi with hM0 | hv0
  · exact absurd hM0 hM
  · exact hv0

end

end Phys.Algebra
