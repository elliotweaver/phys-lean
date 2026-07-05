/-
  # N338 — SEEDED GAUGE ROUTE C4 (arc-C): CONSOLIDATION + ANALYTIC-COMPLETION (D1) HANDOFF —
  #         the first-cosmology-contact arc (C1 Σm_ν sum / C2 m₁=0 floor / C3 sterile-ν_R dark
  #         matter) consolidated through the ONE structural fact it all rests on: the self / others
  #         RESOLUTION OF IDENTITY of generation space. The DC self-projector `P_s = (1/3)J` and the
  #         inter-generation projector `P_oth = 1 − P_s` form a COMPLETE ORTHOGONAL IDEMPOTENT SYSTEM
  #         (`P_s + P_oth = 1`, `P_s² = P_s`, `P_oth² = P_oth`, `P_s·P_oth = 0`) splitting generation
  #         space `Cut³ = span{s} ⊕ others` into a RANK-1 self block ⊕ a RANK-2 others block; the
  #         light seesaw mass operator is SUPPORTED ENTIRELY on the others block and VANISHES on the
  #         self block. From this ONE decomposition all three arc-C landings follow: the SUM lives on
  #         the others block (C1), the self block is the massless zero-mode (C2), the self block is the
  #         heavy-sterile stable dark direction (C3). Over the DERIVED ℝ `ContinuumQ.Cut`.
  =============================================================================================

  ⭐ SECOND OWNER-AUTHORIZED SEED — GAUGE → SCALE-TOWER → COSMOLOGY, TARGET C4
  (`docs/SEED_GAUGE_SCALE_COSMOLOGY.md`, §ARC C: "consolidation + the analytic-completion handoff").
  The directed single successor of N337 (C3a). C4 consolidates the first-cosmology-contact arc, names
  the ρ_Λ frontier reached, and hands forward to the analytic-completion arc D1.

  ## WHAT THIS NODE BANKS

  The genuine C4 beat is NOT a decorative re-export of the three banked arc-C capstones (that would be
  an empty ∧, adding nothing). It is the ONE structural fact that unifies all of arc C and was NEVER
  banked: the self / others RESOLUTION OF IDENTITY of generation space. Over the derived ℝ `Cut`, with
  the banked `demProj = (1/3)J` (`P_s`, the DC / self projector onto `s = (1,1,1)`, N336) and
  `othersProj = 1 − demProj` (`P_oth`, the inter-generation projector, N336):

  (1) COMPLETE ORTHOGONAL IDEMPOTENT SYSTEM. The two projectors are genuine idempotents, orthogonal,
      and resolve the identity:

          `demProj_idem : demProj * demProj = demProj`             (P_s² = P_s, rank-1: ((1/3)J)² = (1/3)J)
          `othersProj_idem : othersProj * othersProj = othersProj` (P_oth² = P_oth, (1−P)² = 1−P)
          `demProj_othersProj : demProj * othersProj = 0`          (orthogonal)
          `othersProj_demProj : othersProj * demProj = 0`          (orthogonal, both orders)
          `generation_resolution_of_identity : demProj + othersProj = 1`   (`Cut³ = span{s} ⊕ others`)

      With the banked ranks `Matrix.trace demProj = 1` (rank-1 self block) and `Matrix.trace othersProj
      = 2` (rank-2 others block, N336 `demProj_trace_one`/`othersProj_trace_two`), this is the exact
      `3 = 1 + 2` block split of generation space: ONE self direction ⊕ TWO others directions.

  (2) THE MASS OPERATOR'S BLOCK STRUCTURE. The light seesaw mass operator `A = (P_oth·D₀)(P_oth·D₀)ᵀ`
      (the Born self-overlap of the others-coupling, N335/N336) lives ENTIRELY on the others block:

          `mass_operator_self_block_zero : demProj * A = 0`         (NO component in the self block)
          `mass_operator_others_block : othersProj * A = A`         (SUPPORTED on the others block)

      So the self / dark / sterile direction is a genuine ZERO BLOCK of the mass operator — not merely
      a zero of the quadratic form, but an exact operator-level block vanishing. This is the deep tie:
      the self-blindness `P_oth · s = 0` (N336) is upgraded to `P_s · A = 0` at the operator level.

  (3) THE C4 CONSOLIDATION CAPSTONE. `cosmology_contact_consolidated` bundles (1)–(2) WITH the three
      banked arc-C landings, exhibiting all of them as consequences of the ONE self / others
      decomposition over the derived `Cut`:
        • C1 (the SUM rides one scale): `neutrinoMassSum (P_oth·D₀) M = diracSelfOverlap (P_oth·D₀) / M`
          (banked `sum_rides_on_two_massive`, N336) — the whole sum on the others (massive) block;
        • C2 (the massless FLOOR): `massOfDir (P_oth·D₀) M selfDir = 0` (banked `self_generation_massless`,
          N336) — the self block is the massless zero-mode;
        • C3 (heavy-STERILE / DARK): `(heavyMajorana M).mulVec selfDir = M • selfDir` (banked
          `heavyMajorana_selfDir_eigen`, N337) — the self block carries the full sterile scale.

  where `demProj`/`othersProj`/`othersProj_symm`/`massOfDir`/`self_generation_massless`/`selfDir`
  (N336), `heavyMajorana`/`heavyMajorana_selfDir_eigen`/`neutrinoMassSum`/`diracSelfOverlap`/
  `sum_rides_on_two_massive` (N335/N336/N337) are BANKED; `Cut` is the derived ℝ (N33–N37);
  `Matrix.mul`/`transpose`/`trace`/`mulVec` are standard Mathlib MACHINERY on the derived `Cut`. NO
  `Real.exp`/`Real.pi`, NO empirical Λ / DM abundance / ν mass premised.

  ## ρ_Λ (part b) — THE 26-CHANNEL FRONTIER IS NAMED AND DEFERRED (anti-bullshit, NOT fished)

  The seed's C3(b)/C4 ρ_Λ target — `ρ_Λ = (Σm_ν/26)⁴` via the 26 traceless J₃(𝕆) channels — is NOT
  banked here, exactly as N337 deferred it, and forcing it now would be the fishing the seed warns
  against:
    • THE COUNT "26" IS NOT A BANKED FINRANK. The J₃(𝕆)=27-dim arena is banked ONLY as the explicit
      algebraic decomposition `Hm = Dg + slotA + slotB + slotC` (N267 `Hm_slot_decomp`, "3 + 3·8 = 27"
      in a COMMENT), never as a Lean `Module.finrank … = 27`. N299/N300 EXPLICITLY AVOIDED computing
      `dim hermSub = 27` (a W9 instrument-cost wall — a 27-dim coordinate basis times out). `26 = 27 −
      1` (traceless) appears only as MEASURED PROSE (`dim 78 = 52 + 26`, "measured N295"), NOT a
      derived finrank. Banking `(Σm_ν/26)⁴` here would ASSERT the channel count (G1) or need a genuine
      un-banked W9 prerequisite `finrank(traceless J₃(𝕆)) = 26` on a DIFFERENT carrier (`O ℚ`, ns `HJ`).
    • THE FOURTH POWER + Σm_ν/26 IDENTIFICATION IS A PERMANENT-INCEPTION CANDIDATE (the seed is
      explicit: the magnitude was known BEFORE the mechanism, ρ_Λ^{1/4}=2.30 vs obs 2.24). Producing it
      now, before the mechanism is forced, would be fitting Λ — explicitly forbidden.
    • CROSS-CARRIER: Σm_ν lives over `Cut` (ν-sector); the 26 channels over `O ℚ` (Jordan arena). A
      ρ_Λ theorem must bind BOTH derived carriers with a DERIVED map, not a posited numeric coincidence.
  ⟹ The ρ_Λ 26-channel MECHANISM + its `finrank(traceless J₃(𝕆)) = 26` prerequisite is the NAMED OPEN
  PARALLEL FRONTIER (deferral #2 for this reason; the seed's C4 directed order to D1 overrides the
  ≥3-deferral ascent trigger — the chain tail is the analytic-completion arc, not the finrank ascent).

  ## THE THEORY-NATIVE READING (why C4 is the resolution of identity, and why it is DERIVED)

  C1/C2/C3 each read ONE consequence of the self / others split; none banked the split itself. The
  fold's own next beat is to EXHIBIT the decomposition and its operator-level block structure, then
  show the three landings fall out of it:
    ONE CAUSE, MANY TERMINATIONS. The SAME self-blindness `P_oth · s = 0` (N1 `fold_self_blind`, N305
    `Poth`, N336) that caps the cascade at three (N5), furnishes exactly three matter slots (N267), and
    makes the family `so(3)` blind to all generation content (N290) is the ONE orthogonal-idempotent
    decomposition `1 = P_s + P_oth` of generation space. The self block (rank 1) is massless (C2),
    sterile-dark (C3), and carries no mass-operator component (`P_s · A = 0`); the others block (rank 2)
    carries the entire mass sum (C1) and supports the mass operator (`P_oth · A = A`). One blindness,
    one decomposition, three cosmological consequences.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "neutrino / mass / massless / sterile / dark-matter / cosmology / generation / self". What
  survives: for the two `Cut`-matrices `P = (1/3)J` and `Q = 1 − P`, and `A = (Q·D₀)(Q·D₀)ᵀ`:
  `P + Q = 1`, `P·Q = 0 = Q·P`, `P² = P`, `Q² = Q`, `trace P = 1`, `trace Q = 2`, `P·A = 0`, `Q·A =
  A`, together with the banked `⟨s, A' s⟩ = 0` (`A' = M⁻¹A`), `(M•1)·s = M•s`, and `trace(M⁻¹A) =
  (Σ entries²)/M`. Pure real-matrix (`Cut`) analysis. No physics name does any logical work.

  ## HONEST GRADE (mandatory flags — DO NOT over-claim)

    • IDENTITY-grade (forced math): `demProj_idem`, `othersProj_idem`, `demProj_othersProj`,
      `othersProj_demProj`, `generation_resolution_of_identity`, `mass_operator_self_block_zero`,
      `mass_operator_others_block`. Pure `Cut`-matrix arithmetic on banked projectors.
    • CANDIDATE-grade (arc-C, inherited prose + identification, NEVER asserted): the physical readings
      — the self block IS the sterile dark ν_R, the others block IS the massive active ν sector. Both
      flagged CANDIDATE, exactly as C1/C2/C3; the whole arc C is candidate-grade, NOT identity-grade.
    • ⚠️⚠️ STANDING + JOINT KILL-LINE (prose-only, do NOT soften): the `m₁ = 0` sterile-ν_R dark-matter
      identification is JOINTLY FALSIFIABLE with the ν-spectrum law (C2): any `m₁ > 0` detection kills
      BOTH. The DESI DR2 `Σ < 58 meV` tension (C1, ~2σ) stands. ρ_Λ carries a PERMANENT INCEPTION FLAG;
      the w = −1 stance is a registered bet against DESI's mild evolving-DE lean (kill-line: DR3
      confirming w ≠ −1 at 5σ kills it). Lab ordering (JUNO/DUNE) is the adjudicator. NEVER fit, NEVER
      an escape hatch; the numbers stay REMOVABLE PROSE; no empirical Λ / DM / ν mass in any statement
      or proof.
    • ⚠ ρ_Λ 26-CHANNEL FRONTIER NAMED + DEFERRED: `finrank(traceless J₃(𝕆)) = 26` on the `O ℚ` carrier
      (a W9-guarded dim node) + the (Σm_ν/26)⁴ permanent-inception mechanism — the OPEN parallel
      frontier, NOT this node. NEVER asserted; do NOT grind the 27-dim coordinate wall.
    • ⚠ HIDDEN JOINT OUT OF SCOPE: the private program's cosmology block (T_RH, η_B, Ω_DM) rests on a
      freeze-in Boltzmann integrator convention-sensitive by ×3×10⁷ — flagged OUT OF SCOPE; this arc's
      job is the ν/DM STRUCTURE, not the reheating cascade.

  ## THE ONE CAUSE (THE ONE LAW)

  The SAME octonion self-blindness that caps the tower at three (N5), furnishes exactly three matter
  slots (N267), makes the family `so(3)` blind to all generation content (N290), made the self / DC
  generation-direction a LIGHT zero-mode (N336) and a heavy-sterile stable dark direction (N337) is the
  ONE orthogonal-idempotent decomposition `1 = P_s + P_oth` of generation space. One blindness — one
  resolution of identity — the massless floor, the sterile dark direction, and the mass sum all fall
  out of the same `3 = 1 + 2` block split. One budget.

  ## SEED-2 HARD GUARDS

  - G1 NO ASSERTED VALUE — the decomposition / block structure FALLS OUT of the banked projectors; no
    decimal/literal value in any statement or proof. ρ_Λ magnitude / the 26-count is DEFERRED, NEVER
    asserted here.
  - G2 NO EMPIRICAL NUMBER — measured Λ / DM abundance / w / ν mass = REMOVABLE PROSE ONLY; none
    appears in any statement or proof.
  - G3 SCALES vs RATIOS — `M` is the single dimensionful anchor (banked N335); NO new dimensionful
    `Cut` atom is introduced.
  - G4 DERIVED NOT POSITED — the resolution of identity, idempotency, orthogonality, and the mass-
    operator block structure are DERIVED from the banked `demProj`/`othersProj` and the self-blindness
    `P_oth · s = 0`; the only candidate identifications (self block = ν_R, others block = active ν) are
    flagged candidate. No Mathlib-ℝ content.
  - G5 PHYSICS-WORDS-REMOVABLE — every theorem stands as pure `Cut`-matrix analysis (see §above).
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; complete proofs,
    no posited axiom, no sorry, no kernel-compiled decision, no `maxHeartbeats` raise. Ground field the
    DERIVED ℝ `Cut` + banked `demProj`/`othersProj`/`heavyMajorana`/`selfDir`/`neutrinoMassSum` (⚠ NOT
    Mathlib-ℝ/`Real.exp`/`Real.pi`; `Matrix` is MACHINERY only).

  ## NOT FREE-FLOATING

  Every C4 theorem's TYPE mentions the banked `demProj`/`othersProj` (N336) and/or `heavyMajorana`/
  `selfDir`/`self_generation_massless`/`neutrinoMassSum`/`diracSelfOverlap` (N335/N336/N337) over the
  derived `Cut`. NOT generic over an arbitrary field — grounded on the banked C1/C2/C3 seesaw machinery.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system
  content import, NO `Real.exp`/`Real.pi`. No empirical Λ / DM / ν mass appears anywhere.
-/
import Phys.Algebra.SterileNeutrinoDarkMatter
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

/-! ## (1) THE SELF / OTHERS COMPLETE ORTHOGONAL IDEMPOTENT SYSTEM (the resolution of identity). -/

/-- ★ THE DC / SELF PROJECTOR IS IDEMPOTENT: `P_s² = P_s`. The all-ones/3 matrix `(1/3)J` is a genuine
    rank-1 projector — `J² = 3J`, so `((1/3)J)² = (1/3)J`. Over the derived `Cut`. -/
theorem demProj_idem : (demProj * demProj : Matrix (Fin 3) (Fin 3) Cut) = demProj := by
  funext i k
  simp only [demProj, Matrix.mul_apply, Matrix.of_apply, Fin.sum_univ_three]
  norm_num

/-- ★ THE OTHERS / INTER-GENERATION PROJECTOR IS IDEMPOTENT: `P_oth² = P_oth`. Since `P_oth = 1 − P_s`
    and `P_s` is idempotent, `(1 − P_s)² = 1 − P_s`. -/
theorem othersProj_idem : (othersProj * othersProj : Matrix (Fin 3) (Fin 3) Cut) = othersProj := by
  simp only [othersProj, sub_mul, one_mul, mul_sub, mul_one, demProj_idem]
  abel

/-- ★ THE TWO BLOCKS ARE ORTHOGONAL: `P_s · P_oth = 0`. The self block and the others block are
    disjoint — `P_s(1 − P_s) = P_s − P_s² = 0`. -/
theorem demProj_othersProj : (demProj * othersProj : Matrix (Fin 3) (Fin 3) Cut) = 0 := by
  simp only [othersProj, mul_sub, mul_one, demProj_idem, sub_self]

/-- ★ ORTHOGONAL IN BOTH ORDERS: `P_oth · P_s = 0`. `(1 − P_s)P_s = P_s − P_s² = 0`. -/
theorem othersProj_demProj : (othersProj * demProj : Matrix (Fin 3) (Fin 3) Cut) = 0 := by
  simp only [othersProj, sub_mul, one_mul, demProj_idem, sub_self]

/-- ★★ THE SELF / OTHERS RESOLUTION OF IDENTITY: `P_s + P_oth = 1`. Generation space splits as
    `Cut³ = span{s} ⊕ others` — a RANK-1 self block ⊕ a RANK-2 others block (banked traces `1` and
    `2`, N336). This is the ONE decomposition that carries all of arc C. -/
theorem generation_resolution_of_identity :
    (demProj + othersProj : Matrix (Fin 3) (Fin 3) Cut) = 1 := by
  rw [othersProj]; abel

/-! ## (2) THE LIGHT SEESAW MASS OPERATOR'S BLOCK STRUCTURE (self block vanishes, others block supports). -/

/-- ★★ THE MASS OPERATOR VANISHES ON THE SELF BLOCK: `P_s · A = 0` for the light seesaw mass operator
    `A = (P_oth·D₀)(P_oth·D₀)ᵀ` (N335/N336). The self / dark / sterile direction is a genuine ZERO
    BLOCK of the mass operator (an operator-level vanishing, not merely of the quadratic form): the
    self-blindness `P_oth · s = 0` is upgraded to `P_s · A = 0`, because `A = P_oth · (D₀ D₀ᵀ) · P_oth`
    (using `P_othᵀ = P_oth`) and `P_s · P_oth = 0`. -/
theorem mass_operator_self_block_zero (D0 : Matrix (Fin 3) (Fin 3) Cut) :
    demProj * ((othersProj * D0) * (othersProj * D0)ᵀ) = 0 := by
  rw [Matrix.transpose_mul, othersProj_symm]
  simp only [← Matrix.mul_assoc, demProj_othersProj, Matrix.zero_mul]

/-- ★★ THE MASS OPERATOR IS SUPPORTED ON THE OTHERS BLOCK: `P_oth · A = A`. The entire light seesaw
    mass operator lives on the others (massive / active) block — `A = P_oth · (D₀ D₀ᵀ) · P_oth` and
    `P_oth² = P_oth`. Together with `mass_operator_self_block_zero` this is the exact `A = P_oth·A +
    P_s·A = A + 0` block decomposition of the mass operator. -/
theorem mass_operator_others_block (D0 : Matrix (Fin 3) (Fin 3) Cut) :
    othersProj * ((othersProj * D0) * (othersProj * D0)ᵀ)
      = (othersProj * D0) * (othersProj * D0)ᵀ := by
  rw [Matrix.transpose_mul, othersProj_symm]
  simp only [← Matrix.mul_assoc, othersProj_idem]

/-! ## (3) THE C4 CONSOLIDATION CAPSTONE — arc C as consequences of the ONE decomposition. -/

/-- ★★★ C4 — THE FIRST-COSMOLOGY-CONTACT ARC CONSOLIDATED, over the banked derived-ℝ `Cut`. The
    self / others RESOLUTION OF IDENTITY of generation space (a COMPLETE ORTHOGONAL IDEMPOTENT SYSTEM:
    `P_s + P_oth = 1`, `P_s · P_oth = 0`, `P_s² = P_s`, `P_oth² = P_oth`, with ranks `trace P_s = 1`,
    `trace P_oth = 2` — the `3 = 1 + 2` block split) is the ONE structure carrying all of arc C. The
    light seesaw mass operator `A = (P_oth·D₀)(P_oth·D₀)ᵀ` has NO self-block component (`P_s · A = 0`)
    and is SUPPORTED on the others block (`P_oth · A = A`). From this ONE decomposition:
      • C1 — the mass SUM rides one scale, entirely on the others (massive) block:
        `neutrinoMassSum (P_oth·D₀) M = diracSelfOverlap (P_oth·D₀) / M` (banked `sum_rides_on_two_massive`);
      • C2 — the self block is the massless FLOOR: `massOfDir (P_oth·D₀) M selfDir = 0` (banked
        `self_generation_massless`, `m₁ = 0`);
      • C3 — the self block is heavy-STERILE / dark: `(heavyMajorana M).mulVec selfDir = M • selfDir`
        (banked `heavyMajorana_selfDir_eigen`).
    The massless floor, the sterile dark direction, and the mass sum ALL fall out of the same self /
    others split. CANDIDATE-grade (the physical readings — self block = sterile dark ν_R, others block
    = active ν — are flagged candidate, NEVER asserted); the `m₁ = 0` claim is JOINTLY FALSIFIABLE with
    the dark-matter story (any `m₁ > 0` kills both), a REMOVABLE-PROSE standing kill-line. The ρ_Λ
    magnitude / 26-channel fourth power is NAMED and DEFERRED (a permanent-inception candidate; the
    `finrank(traceless J₃(𝕆)) = 26` prerequisite is the open parallel frontier), NEVER banked here. -/
theorem cosmology_contact_consolidated :
    (demProj + othersProj = (1 : Matrix (Fin 3) (Fin 3) Cut))
    ∧ (demProj * othersProj = (0 : Matrix (Fin 3) (Fin 3) Cut))
    ∧ ((demProj * demProj : Matrix (Fin 3) (Fin 3) Cut) = demProj)
    ∧ ((othersProj * othersProj : Matrix (Fin 3) (Fin 3) Cut) = othersProj)
    ∧ (Matrix.trace demProj = (1 : Cut))
    ∧ (Matrix.trace othersProj = (2 : Cut))
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut),
        demProj * ((othersProj * D0) * (othersProj * D0)ᵀ) = 0)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut),
        othersProj * ((othersProj * D0) * (othersProj * D0)ᵀ)
          = (othersProj * D0) * (othersProj * D0)ᵀ)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut),
        massOfDir (othersProj * D0) M selfDir = 0)
    ∧ (∀ (M : Cut), (heavyMajorana M).mulVec selfDir = M • selfDir)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut),
        neutrinoMassSum (othersProj * D0) M = diracSelfOverlap (othersProj * D0) / M) :=
  ⟨generation_resolution_of_identity, demProj_othersProj, demProj_idem, othersProj_idem,
   demProj_trace_one, othersProj_trace_two, mass_operator_self_block_zero,
   mass_operator_others_block, self_generation_massless, heavyMajorana_selfDir_eigen,
   fun D0 M => sum_rides_on_two_massive D0 M⟩

/-! ## NON-VACUITY (W8): the block split is genuinely `3 = 1 + 2` — both blocks nonzero, disjoint. -/

/-- NON-VACUITY: the self block is genuinely RANK-1 and the others block RANK-2 — the resolution of
    identity `P_s + P_oth = 1` splits `trace 1 = 3` as `trace P_s + trace P_oth = 1 + 2 = 3` over the
    derived `Cut`. If the decomposition were mis-built (wrong ranks, not summing to the identity), this
    `1 + 2 = 3` block count would fail. -/
theorem block_ranks_sum_to_three :
    Matrix.trace demProj + Matrix.trace othersProj = (3 : Cut) := by
  rw [demProj_trace_one, othersProj_trace_two]; norm_num

/-- NON-VACUITY: the two blocks are DISTINCT (not the same projector) — `P_s ≠ P_oth`, because their
    traces differ (`1 ≠ 2`). The self / others split is genuine, not a degenerate single block. -/
theorem demProj_ne_othersProj :
    (demProj : Matrix (Fin 3) (Fin 3) Cut) ≠ othersProj := by
  intro h
  have ht : Matrix.trace demProj = Matrix.trace othersProj := by rw [h]
  rw [demProj_trace_one, othersProj_trace_two] at ht
  exact (by norm_num : (1 : Cut) ≠ 2) ht

end

end Phys.Algebra
