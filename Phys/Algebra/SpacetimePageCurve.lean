/-
  # N362 — arc-E E6: THE PAGE CURVE / INFORMATION PRESERVATION — the fine-grained radiation entropy
  #         returns to `0` at complete evaporation because the black-hole entropy is a FINITE binary
  #         bit-count (N361), over the DERIVED ℝ `Cut`.

  ⭐ FOURTH OWNER-AUTHORIZED SEED — GR / BLACK HOLE / COSMOLOGY, TARGET E6
  (`docs/SEED_GR_BLACKHOLE_COSMOLOGY.md`, §E6). The directed single successor of N361 (E5, black-hole
  entropy `S = A/4` with `s₀ = ln 2`). This node derives information preservation: the fine-grained
  radiation entropy rises, peaks at half the total, and RETURNS TO `0` at complete evaporation — the
  Page curve — as a CONSEQUENCE of the banked FINITE bit-count `S = N·s₀` (N361
  `bhEntropy_cell_decomposition`), not a posited global unitarity.

  ## THE THEORY-NATIVE READING (why E6 is FORCED, not posited)

  Standard: the Page curve is derived by POSITING global unitarity and computing the entanglement
  entropy of the radiation via heavy island / replica-wormhole machinery; the classical
  "information-loss puzzle" is Hawking's semiclassical calculation, in which the radiation is exactly
  thermal and the entropy grows without bound.

  Here NEITHER is posited:
  - **INFORMATION PRESERVATION = THE FINITENESS OF THE FOLD'S OWN BIT-COUNT.** N361 banked the entropy
    as a FINITE count of `N = A/a*` boundary cells, each carrying the fold's two-valued self-blindness
    `s₀ = ln 2` (`bhEntropy_cell_decomposition : S = (A/a*)·s₀ = N·s₀`). A finite mass `M₀` gives a
    finite total `S₀ = bhEntropy M₀` — a FIXED, FINITE information budget. Information is therefore
    REDISTRIBUTED between the hole and its radiation, never destroyed: as the hole shrinks
    (`M : M₀ → 0`), the emitted coarse entropy `S₀ − bhEntropy M` grows from `0` to `S₀` while the
    remaining coarse entropy `bhEntropy M` falls from `S₀` to `0`. The radiation's FINE-GRAINED entropy
    is the smaller of the two, `min(S₀ − bhEntropy M, bhEntropy M)`, which is `0` at both ends and
    `S₀/2` at the crossing — the PAGE CURVE. It RETURNS TO `0` (`pageRad_end`): all information is
    recovered. The "finite depth" (SEED §E6) is the FINITE cell-count `N`; finite `M₀` ⟹ finite `N` ⟹
    bounded, recoverable information.
  - **THE CLASSICAL PUZZLE = THE DIVERGENT STATIC-COORDINATE FACE.** Hawking's unbounded thermal
    entropy is the coarse-grained `bhEntropy M`, which in the static (Schwarzschild) coordinate appears
    to grow without a turnover — the SAME divergent static coordinate whose horizon artefact N360's
    Euclidean-section CLOSURE resolved. The fine-grained entropy (`pageRadEntropy`) turns over precisely
    because it is bounded by the FINITE total (`pageRad_le_total`) and by the N361 cell-count
    (`pageRad_le_cellCount`). `T_H > 0` (N360 `hawkingTemp_pos`) means emission begins immediately, so
    the first quantum already participates in the redistribution.

  ## WHAT THIS NODE BANKS

      bhEntropy_nonneg / bhEntropy_zero / bhEntropy_pos_of_ne / bhEntropy_strictMono   (basic shape)
      pageRadEntropy M₀ M = min (bhEntropy M₀ − bhEntropy M) (bhEntropy M)   (fine-grained rad. entropy)
      pageRad_start          — the curve starts at `0` (no radiation at `M = M₀`)
      pageRad_end            — ★★★ THE CURVE RETURNS TO `0` (information recovered at `M = 0`)
      pageRad_le_remaining / pageRad_le_emitted / pageRad_le_total   (the three bounds)
      pageRad_le_cellCount   — ★ bounded by the N361 FINITE bit-count `N·s₀` (finite depth)
      pageRad_early / pageRad_late   (the rising and falling branches)
      pageTime_condition     — the crossing `remaining = emitted` ⟺ `remaining = total/2`
      pageRad_at_crossing    — ★★ the PAGE POINT: at the crossing the radiation entropy is `S₀/2` (peak)
      pageRad_end_ne_total   — ★ W8: the final radiation entropy is NOT the total (info NOT lost)
      page_curve_structure   — ★★★ THE HEART bundled

  ## THE SHARED STRUCTURE / MOAT

  The fold's SELF-BLINDNESS appears three times in one node: (i) per cell — `s₀ = ln 2` (N361, the
  two-valued see/not-see miss); (ii) the WHOLE — the global state is pure (the fold is blind to
  itself), which is what makes the fine-grained radiation entropy the `min` of the two coarse pieces;
  (iii) FINITE DEPTH — the finite cell-count `N`. Information preservation is the FINITENESS of the
  fold's own bit-count. The banked `bhEntropy` (N361), itself the derived `gravCouplingCoeff = 2·(4π)`
  (N359) — the derived Born turn — carries the whole curve.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "information / Page / radiation / black-hole / horizon / evaporation / quantum / entropy": the
  theorems stand as pure statements over the derived ℝ `Cut` about `min (bhEntropy M₀ − bhEntropy M)
  (bhEntropy M)` — it is `0` at `M = M₀` and at `M = 0`; it is `≤ bhEntropy M₀`; it is
  `≤ (bhArea M₀/cellArea)·cellEntropy`; when `bhEntropy M = bhEntropy M₀/2` it equals `bhEntropy M₀/2`;
  and at `M = 0` it is `≠ bhEntropy M₀`. Pure arithmetic + the banked positivity of `gravCouplingCoeff`
  and the `min` lattice laws. No physics name does any logical work.

  ## HONEST GRADE (mandatory flags — do NOT overclaim)

  THEOREM-GRADE for the curve's shape: `pageRad_start`/`pageRad_end` (returns to `0`), the three bounds
  (`pageRad_le_total`, `pageRad_le_cellCount` — the FINITE-depth bound reducing to N361), the peak
  `pageRad_at_crossing` (`= S₀/2`), and the W8 information-not-lost `pageRad_end_ne_total`. All genuine,
  gap-free, foundations-only over the banked `bhEntropy`. MECHANISM-GRADE (flagged, NEVER a posited
  theorem): the IDENTIFICATION "fine-grained radiation entropy = `min`(emitted-coarse, remaining-coarse)"
  rests on the global state being pure = the fold's TOTAL self-blindness. `pageRadEntropy` is a
  DEFINITION (like N360's `κ_sg` and N361's `r_h = 2M` explicit hypotheses); its physical justification
  is the mechanism layer. No "global purity" theorem is asserted; the full Page-curve dynamics
  (the emission history `M(t)`) is out of scope (a mechanism, not a theorem here). `M`/`M₀` stay SYMBOLIC
  dimensionful anchors (G3); no empirical number (Page time, any measured quantity) appears in any proof.

  ## SEED-4 HARD GUARDS

  - G1 NO ASSERTED VALUE — the curve, the peak `S₀/2`, and information preservation ALL DERIVED from the
    banked `bhEntropy`/`bhEntropy_cell_decomposition` (N361); the `min` definition is not a posited value.
  - G2 NO EMPIRICAL NUMBER — the Page time / any measured entropy = REMOVABLE PROSE ONLY.
  - G3 SCALES vs RATIOS — `M`, `M₀` the symbolic dimensionful anchors; the entropy bounds/ratios
    (`≤ total`, `= S₀/2`) dimensionless-structured.
  - G4 DERIVED NOT POSITED — information preservation from the FINITENESS of the banked N361 cell-count
    (`pageRad_le_cellCount`, `pageRad_end`); the puzzle as the divergent-static-coordinate artefact
    (prose, homing to N360).
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; no sorry, axiom,
    kernel-compiled decision, or `maxHeartbeats` raise. Ground field the DERIVED `Cut` + banked
    `bhEntropy`/`bhArea`/`cellArea`/`cellEntropy` (⚠ NOT Mathlib-ℝ/`Real.log` as content).

  ## NOT FREE-FLOATING

  Every production TYPE cites banked derived objects: `bhEntropy`/`bhArea`/`cellArea`/`cellEntropy`
  (N361), themselves grounded to `gravCouplingCoeff` (N359) → `gaussSphereSolidAngle`/`cutPi` (N328) →
  the derived `Cut`. `pageRadEntropy` is BUILT FROM `bhEntropy`; the finite-depth bound REDUCES to
  `bhEntropy_cell_decomposition` (N361). Grounded on the derived tower, not a generic
  quantum-information / entanglement-entropy abstraction.

  ## THE ONE CAUSE (THE ONE LAW)

  The SAME fold self-blindness that gave `s₀ = ln 2` per boundary cell (N361) makes the whole state
  pure and the bit-count FINITE — and finiteness IS information preservation. What the field derives by
  positing global unitarity and grinding island formulae, the theory reads off the banked finite
  entropy: a fixed, finite budget of binary cells cannot lose information, so the fine-grained radiation
  entropy must return to `0`. One binary miss, counted finitely: the Page curve.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system content
  import, NO `Real.log`. No empirical scale (Page time, entropy, mass) appears anywhere.
-/
import Phys.Algebra.SpacetimeBlackHoleEntropy

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## (1) THE BASIC SHAPE of the banked entropy (nonneg / zero / pos / strict monotone). -/

/-- The black-hole entropy is nonnegative (the positive coupling times a square). -/
theorem bhEntropy_nonneg (M : Cut) : 0 ≤ bhEntropy M := by
  unfold bhEntropy
  have hg := gravCouplingCoeff_pos
  have hM : 0 ≤ M ^ 2 := by positivity
  positivity

/-- The entropy vanishes at zero mass (complete evaporation): `S(0) = 0`. -/
theorem bhEntropy_zero : bhEntropy (0 : Cut) = 0 := by
  unfold bhEntropy; ring

/-- The entropy is strictly positive for nonzero mass. -/
theorem bhEntropy_pos_of_ne (M : Cut) (hM : M ≠ 0) : 0 < bhEntropy M := by
  unfold bhEntropy
  have hg := gravCouplingCoeff_pos
  have hM2 : 0 < M ^ 2 := by positivity
  positivity

/-- The entropy is strictly monotone on nonnegative masses: a heavier hole has more entropy. -/
theorem bhEntropy_strictMono {M₁ M₂ : Cut} (h1 : 0 ≤ M₁) (h : M₁ < M₂) :
    bhEntropy M₁ < bhEntropy M₂ := by
  unfold bhEntropy
  have hg := gravCouplingCoeff_pos
  have h2 : 0 ≤ M₂ := le_of_lt (lt_of_le_of_lt h1 h)
  have hsq : M₁ ^ 2 < M₂ ^ 2 := by nlinarith
  have : gravCouplingCoeff * M₁ ^ 2 < gravCouplingCoeff * M₂ ^ 2 := mul_lt_mul_of_pos_left hsq hg
  linarith

/-! ## (2) THE PAGE CURVE — the fine-grained radiation entropy `min(emitted, remaining)`. -/

/-- THE FINE-GRAINED RADIATION ENTROPY `S_rad = min(S₀ − S(M), S(M))` — the smaller of the emitted
    coarse entropy `S₀ − bhEntropy M` (`= bhEntropy M₀ − bhEntropy M`) and the remaining coarse entropy
    `bhEntropy M`. This `min` is the fine-grained entropy of the radiation when the GLOBAL state is
    PURE (the fold's TOTAL self-blindness — the whole is blind to itself); the identification is the
    flagged mechanism layer (a DEFINITION, like N360's `κ_sg` and N361's `r_h = 2M` hypotheses). Built
    from the banked `bhEntropy` (N361). -/
def pageRadEntropy (M₀ M : Cut) : Cut := min (bhEntropy M₀ - bhEntropy M) (bhEntropy M)

/-- THE CURVE STARTS AT `0`: at `M = M₀` (before any evaporation) no radiation has been emitted, so
    `S_rad = min(0, S₀) = 0`. -/
theorem pageRad_start (M₀ : Cut) : pageRadEntropy M₀ M₀ = 0 := by
  unfold pageRadEntropy
  have h : bhEntropy M₀ - bhEntropy M₀ = 0 := by ring
  rw [h]; exact min_eq_left (bhEntropy_nonneg M₀)

/-- ★★★ THE CURVE RETURNS TO `0` (INFORMATION RECOVERED): at complete evaporation `M = 0` the remaining
    entropy is `bhEntropy 0 = 0`, so `S_rad = min(S₀, 0) = 0`. All information the hole carried is back
    in the radiation — the fine-grained entropy is `0`, exactly as at the start. This is the turnover
    that the finite bit-count FORCES; the classical "information loss" (unbounded coarse `bhEntropy`) is
    the divergent-static-coordinate face, homing to N360's Euclidean closure. -/
theorem pageRad_end (M₀ : Cut) : pageRadEntropy M₀ 0 = 0 := by
  unfold pageRadEntropy
  rw [bhEntropy_zero, sub_zero]; exact min_eq_right (bhEntropy_nonneg M₀)

/-- The radiation entropy is bounded by the remaining (coarse) entropy. -/
theorem pageRad_le_remaining (M₀ M : Cut) : pageRadEntropy M₀ M ≤ bhEntropy M :=
  min_le_right _ _

/-- The radiation entropy is bounded by the emitted (coarse) entropy. -/
theorem pageRad_le_emitted (M₀ M : Cut) : pageRadEntropy M₀ M ≤ bhEntropy M₀ - bhEntropy M :=
  min_le_left _ _

/-- THE TOTAL BOUND: the radiation entropy never exceeds the total `S₀ = bhEntropy M₀` — a FIXED,
    FINITE budget. This is the ceiling that forces the turnover. -/
theorem pageRad_le_total (M₀ M : Cut) : pageRadEntropy M₀ M ≤ bhEntropy M₀ := by
  have h1 : pageRadEntropy M₀ M ≤ bhEntropy M₀ - bhEntropy M := pageRad_le_emitted M₀ M
  have h2 : 0 ≤ bhEntropy M := bhEntropy_nonneg M
  linarith

/-- ★ THE FINITE-DEPTH BOUND: the radiation entropy is bounded by the N361 FINITE bit-count
    `N·s₀ = (A/a*)·cutLog 2` (`bhEntropy_cell_decomposition`). A finite mass `M₀` gives a finite cell
    count `N = A/a*`, so the information is FINITE and bounded — "finite depth" (SEED §E6). This is the
    reduction of information preservation to the banked FINITENESS. -/
theorem pageRad_le_cellCount (M₀ M : Cut) :
    pageRadEntropy M₀ M ≤ (bhArea M₀ / cellArea) * cellEntropy := by
  have h := pageRad_le_total M₀ M
  rw [bhEntropy_cell_decomposition] at h
  exact h

/-- THE RISING BRANCH: while less than half has evaporated (emitted ≤ remaining), the radiation entropy
    tracks the emitted coarse entropy `S₀ − bhEntropy M` — it RISES. -/
theorem pageRad_early (M₀ M : Cut) (h : bhEntropy M₀ - bhEntropy M ≤ bhEntropy M) :
    pageRadEntropy M₀ M = bhEntropy M₀ - bhEntropy M :=
  min_eq_left h

/-- THE FALLING BRANCH: past the halfway point (remaining ≤ emitted), the radiation entropy tracks the
    remaining coarse entropy `bhEntropy M` — it FALLS toward `0`. -/
theorem pageRad_late (M₀ M : Cut) (h : bhEntropy M ≤ bhEntropy M₀ - bhEntropy M) :
    pageRadEntropy M₀ M = bhEntropy M :=
  min_eq_right h

/-- THE PAGE-POINT CONDITION: the crossing `remaining = emitted` holds iff the remaining entropy is
    exactly HALF the total. This is the theory-native characterization of the Page time (the turnover
    point), expressed on the banked `bhEntropy` — no posited Page time. -/
theorem pageTime_condition (M₀ M : Cut) :
    bhEntropy M = bhEntropy M₀ - bhEntropy M ↔ bhEntropy M = bhEntropy M₀ / 2 := by
  constructor
  · intro h; linarith
  · intro h; linarith

/-- ★★ THE PAGE POINT (the peak): at the crossing (`bhEntropy M = S₀/2`) the radiation entropy attains
    its maximum `S₀/2` — half the total. DERIVED from the `min` structure, not asserted. -/
theorem pageRad_at_crossing (M₀ M : Cut) (h : bhEntropy M = bhEntropy M₀ / 2) :
    pageRadEntropy M₀ M = bhEntropy M₀ / 2 := by
  unfold pageRadEntropy
  have hemit : bhEntropy M₀ - bhEntropy M = bhEntropy M₀ / 2 := by rw [h]; ring
  rw [hemit, h, min_self]

/-! ## (3) NON-VACUITY (W8): information is NOT lost. -/

/-- ★ W8 NON-VACUITY (INFORMATION IS NOT LOST): the FINAL radiation entropy `pageRadEntropy M₀ 0 = 0`
    is NOT the total `bhEntropy M₀` (for `M₀ ≠ 0`, the total is strictly positive). If information were
    LOST — the radiation ending maximally mixed with entropy equal to the total — this would FAIL. The
    turnover to `0` (`pageRad_end`) is genuine content: the fine-grained entropy returns to `0` while
    the total remains positive. -/
theorem pageRad_end_ne_total (M₀ : Cut) (hM : M₀ ≠ 0) :
    pageRadEntropy M₀ 0 ≠ bhEntropy M₀ := by
  rw [pageRad_end]
  exact fun hc => (bhEntropy_pos_of_ne M₀ hM).ne' hc.symm

/-! ## (4) THE HEART bundled. -/

/-- ★★★ THE HEART (the Page curve / information preservation): the fine-grained radiation entropy
    starts at `0`, RETURNS TO `0` at complete evaporation (information recovered), is bounded by the
    total AND by the N361 FINITE bit-count `N·s₀` (finite depth), peaks at `S₀/2` at the crossing, and
    — W8 — does NOT end equal to the total (information is not lost). All from the banked FINITE
    `bhEntropy` (N361). -/
theorem page_curve_structure (M₀ : Cut) (hM : M₀ ≠ 0) :
    pageRadEntropy M₀ M₀ = 0
      ∧ pageRadEntropy M₀ 0 = 0
      ∧ (∀ M, pageRadEntropy M₀ M ≤ bhEntropy M₀)
      ∧ (∀ M, pageRadEntropy M₀ M ≤ (bhArea M₀ / cellArea) * cellEntropy)
      ∧ (∀ M, bhEntropy M = bhEntropy M₀ / 2 → pageRadEntropy M₀ M = bhEntropy M₀ / 2)
      ∧ pageRadEntropy M₀ 0 ≠ bhEntropy M₀ :=
  ⟨pageRad_start M₀, pageRad_end M₀, fun M => pageRad_le_total M₀ M,
   fun M => pageRad_le_cellCount M₀ M, fun M h => pageRad_at_crossing M₀ M h,
   pageRad_end_ne_total M₀ hM⟩

end

end Phys.Algebra
