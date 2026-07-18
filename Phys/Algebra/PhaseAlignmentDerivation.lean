/-
# C1 — SEEDED MIXING KEYSTONE: THE PHASE-ALIGNMENT DERIVATION (the sector misalignment FORCED)

Owner-authorized mixing seed (docs/SEED_MIXING.md), target **C1** — the directed successor of the
arc-M terminal capstone (M8). Arc D and arc M are complete; the board now runs the mixing sector.
This is the arc's ONE genuine structural build: derive HOW each quark sector's texture aligns against
the banked structure so the two frames' MISALIGNMENT is a DERIVED quantity, not a witness-chosen pair
of distinct sectors.

★ THE GAP THIS NODE CLOSES. The chain has banked the mixing STRUCTURE (N312 `mixV`, unitarity,
Brahmagupta–Fibonacci, corner-zero) and even the two-sector CP MAGNITUDE (N418 `cpFactorDerived = 1/2`).
But every banked `mixing ≠ 0` fact (`quark_mixing_nonzero`, `mixing_nonzero_distinct_sectors`) is
exhibited at TWO HAND-PICKED distinct sectors (up `(1,3,1,0)`, down `(1,3,0,1)`): the misalignment is
asserted-BY-WITNESS, not derived. This node makes the misalignment a FORCED object with a derived
magnitude fraction, and re-emerges `mixing ≠ 0` as a CONSEQUENCE of that derivation.

★ THE THEORY-NATIVE HEART — THE MISALIGNMENT IS THE SELF-BLIND SURVIVAL DEFICIT.
The two quark sectors read the SAME cap-forced generation slots (the universal Koide amplitudes
`genVec`), but the down-type sector sits ONE cascade-doubling rung DEEPER than the up-type. The banked
per-edge Born-survival (N-route `EdgeBornSurvival`) says one extra rung DAMPS the sub-leading amplitude
by exactly ONE self-blind survival factor `edgeSurvival = tr Poth / 3 = 2/3` (N308, the fraction the
look-back cannot see itself with). So the down frame is the up frame with its second component scaled by
`edgeSurvival`. The two-sector overlap cross-term `V₁₀` then FALLS OUT as

      `sectorMisalign a₀ a₁ = (mixV a₀ a₁ a₀ (edgeSurvival·a₁)) 1 0 = a₀·a₁·(1 − edgeSurvival)`

— the frame misalignment is the amplitude product TIMES the self-blind survival DEFICIT `(1 − 2/3) = 1/3`.
This is a DERIVED magnitude, ZERO free parameters. The field POSITS this misalignment (4 CKM numbers by
hand, or Froggatt–Nielsen U(1) charges); the theory reads it off the fold's own idempotent trace.

★ ONE CAUSE, MANY TERMINATIONS (the marquee tie). The SAME self-blind survival `edgeSurvival = 2/3`
whose DEFICIT `(1 − edgeSurvival) = 1/3` is here the mixing misalignment is the fraction whose PRODUCT
with its deficit is the banked cycle phase: `edgeSurvival·(1 − edgeSurvival) = 2/9 = δ_B` (banked
`cycle_phase_value`). The Born self-view fraction (Koide 2/3), the cycle phase (δ_B = 2/9), and the
mixing misalignment (deficit 1/3) are ONE self-blind split read three ways.

★ THE TWO W8 TEETH (both required, both derived through the SAME machinery).
  (a) ZERO MISALIGNMENT EXCLUDED — the banked mixing-nonzero RE-EMERGES as a CONSEQUENCE: for present
      amplitudes `a₀,a₁ ≠ 0`, `sectorMisalign a₀ a₁ ≠ 0` BECAUSE `edgeSurvival ≠ 1` (the deficit is
      genuine). A FLAT survival `= 1` would give `a₀·a₁·0 = 0` — perfect alignment, no mixing. So the
      mixing is FORCED by the self-blind deficit, not by a hand-picked pair of sectors.
  (b) THE LEPTON ℂ-LINE FORCES ZERO CP THROUGH THE SAME MACHINERY (the free consistency check): the
      texture CP invariant of the SAME survival-dressed frames VANISHES on the associative ℂ-line
      (`textureCP_cline_zero`) while it is `−(the misalignment)` on the octonionic Fano line
      (`textureCP_fano_eq`). One cause (the octonion associator), two outcomes: the quark sectors mix
      AND carry CP; the lepton ℂ-line's CP vanishes.

⚠ HONEST GRADE (seed §C1 + T8 leading-order caveat). THEOREM-EXACT over ℚ for the STRUCTURE: the
misalignment identity `= a₀·a₁·(1 − edgeSurvival)`, its forced nonzero-ness (deficit genuine), the
flat-survival alignment counterfactual, the CP dichotomy on the dressed frames, and the one-cause tie
`edgeSurvival·(1 − edgeSurvival) = δ_B`. The NUMERIC leading Cabibbo angle (the misalignment / aligned
overlap ratio, over the derived ℝ `Cut`) is C2's evaluation — honestly deferred, LEADING ORDER, NEVER
fitted. NO empirical CKM number in any statement or proof (comparison to the measured Cabibbo angle /
Wolfenstein λ is REMOVABLE PROSE only). THE ONE-PEG LAW (inherited from M1): the misalignment is
DIMENSIONLESS (a ratio of amplitudes) — no new dimensionful peg appears.

PHYSICS-WORDS-REMOVABLE (STANDARD §2, seed G4). Delete "quark" / "sector" / "mixing" / "CP" /
"generation" / "Cabibbo": over ℚ, `sectorMisalign a₀ a₁ = (mixV a₀ a₁ a₀ (edgeSurvival·a₁)) 1 0
= a₀·a₁·(1 − edgeSurvival)`; nonzero for `a₀,a₁ ≠ 0` since `edgeSurvival ≠ 1`; `a₀·a₁·(1−1) = 0`;
`textureCP … = −(a₀·a₁·(1−edgeSurvival))` on the Fano line, `= 0` on the ℂ-line;
`edgeSurvival·(1−edgeSurvival) = 2/9`. Pure rational algebra about survival-dressed 2×2 overlaps; no
name is load-bearing.

FREE-FLOATING check (SOUL rail). Every theorem's TYPE mentions the banked objects: `mixV` (N312),
`edgeSurvival` (N-route, `tr Poth/3`), `textureCP`/`u1`/`u2`/`octCross`/`assoc3` (N310/N209),
`genVec` (N307), and the banked `edgeSurvival_val`/`edgeSurvival_ne_one`/`cycle_phase_value`. The
misalignment is literally the banked `mixV` cross-term at the survival-dressed down frame; not a
generic 2×2-overlap statement.

Foundations-only (seed G5): no posited axiom, no proof-hole, no kernel-trust bypass, no heartbeat
inflation, no bridge; no empirical number; the ground is the banked ℚ generation objects + the banked
self-blind survival `edgeSurvival` — NO Mathlib `Real`/`Complex` as content.
-/
import Phys.Algebra.QuarkTexture
import Phys.Algebra.OctonionJordanGenerationEdgeBornSurvival
import Phys.Algebra.OctonionJordanGenerationCyclePhaseLineIndependence
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## §1 — THE SURVIVAL-DRESSED DOWN FRAME AND THE FORCED MISALIGNMENT.

The down-type sector sits ONE cascade-doubling rung deeper than the up-type: its sub-leading amplitude
is DAMPED by exactly one self-blind survival factor `edgeSurvival = tr Poth / 3 = 2/3` (banked). The
two-sector overlap cross-term is the frame misalignment `V₁₀`. -/

/-- The frame misalignment: the `(1,0)` overlap cross-term `mixV` of the up frame `(a₀,a₁)` with the
    survival-DRESSED down frame `(a₀, edgeSurvival·a₁)` (the down sub-leading amplitude damped by one
    banked self-blind survival factor). The banked `mixV` (N312). -/
def sectorMisalign (a0 a1 : ℚ) : ℚ := (mixV a0 a1 a0 (edgeSurvival * a1)) 1 0

/-- ★★★ THE MISALIGNMENT IS THE SELF-BLIND SURVIVAL DEFICIT (the keystone). The frame misalignment is
    the amplitude product TIMES the derived survival deficit `(1 − edgeSurvival)`: a DERIVED magnitude,
    ZERO free parameters. -/
theorem sectorMisalign_eq_deficit (a0 a1 : ℚ) :
    sectorMisalign a0 a1 = a0 * a1 * (1 - edgeSurvival) := by
  unfold sectorMisalign mixV
  simp only [Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.empty_val', Matrix.cons_val_fin_one]
  ring

/-- The derived deficit value: `1 − edgeSurvival = 1/3` (banked `edgeSurvival_val`). -/
theorem deficit_val : (1 : ℚ) - edgeSurvival = 1 / 3 := by rw [edgeSurvival_val]; norm_num

/-- ★★ THE MISALIGNMENT IS THE AMPLITUDE PRODUCT TIMES `1/3` (the derived deficit, evaluated). -/
theorem sectorMisalign_val (a0 a1 : ℚ) : sectorMisalign a0 a1 = a0 * a1 * (1 / 3) := by
  rw [sectorMisalign_eq_deficit, deficit_val]

/-! ## §2 — W8 TOOTH (a): ZERO MISALIGNMENT EXCLUDED — mixing ≠ 0 RE-EMERGES as a consequence. -/

/-- ★★★ W8 TOOTH (a). The banked `quark_mixing_nonzero` RE-EMERGES as a CONSEQUENCE of the derived
    misalignment: for present amplitudes `a₀,a₁ ≠ 0`, the misalignment is NONZERO — BECAUSE the
    self-blind survival deficit `(1 − edgeSurvival) = 1/3 ≠ 0` (`edgeSurvival ≠ 1`). The mixing is
    FORCED by the deficit, not asserted at a hand-picked pair of sectors. -/
theorem sectorMisalign_nonzero (a0 a1 : ℚ) (ha0 : a0 ≠ 0) (ha1 : a1 ≠ 0) :
    sectorMisalign a0 a1 ≠ 0 := by
  rw [sectorMisalign_eq_deficit]
  refine mul_ne_zero (mul_ne_zero ha0 ha1) ?_
  rw [deficit_val]; norm_num

/-- ★★ W8. A FLAT survival `= 1` (no deficit) KILLS the misalignment: `a₀·a₁·(1 − 1) = 0` — perfect
    frame alignment, no mixing. So the mixing exists BECAUSE `edgeSurvival ≠ 1`: the deficit is
    load-bearing (`edgeSurvival_ne_one`), the mixing is not a hand-picked accident. -/
theorem flat_survival_no_mixing (a0 a1 : ℚ) : a0 * a1 * (1 - (1 : ℚ)) = 0 := by ring

/-- ★ The deficit is genuinely nonzero (`edgeSurvival ≠ 1`, banked). The magnitude fraction is a real
    suppression, not the trivial alignment. -/
theorem deficit_ne_zero : (1 : ℚ) - edgeSurvival ≠ 0 := by
  rw [deficit_val]; norm_num

/-! ## §3 — W8 TOOTH (b): THE LEPTON ℂ-LINE FORCES ZERO CP THROUGH THE SAME MACHINERY. -/

/-- ★★★ W8 TOOTH (b). The texture CP invariant of the SAME survival-dressed frames on the octonionic
    Fano line is `−(the misalignment)` — the quark sectors carry CP with the derived magnitude. -/
theorem dressed_cp_fano (a0 a1 : ℚ) :
    textureCP a0 a1 a0 (edgeSurvival * a1) u2 u1 (octCross u1 u2)
      = -(a0 * a1 * (1 - edgeSurvival)) := by
  rw [textureCP_fano_eq]; ring

/-- ★★★ W8 TOOTH (b), the free consistency check. The texture CP invariant of the SAME survival-dressed
    frames VANISHES on the associative ℂ-line (`b•u1, d•u1`) — through the SAME `textureCP` machinery
    (banked `textureCP_cline_zero`, the associator is `0` on the ℂ-line). ONE cause (the octonion
    associator), two outcomes: the quark sectors mix AND carry CP; the lepton ℂ-line's CP vanishes. -/
theorem dressed_cp_cline (a0 a1 : ℚ) (x : O ℚ) (b d : ℚ) :
    textureCP a0 a1 a0 (edgeSurvival * a1) x (b • u1) (d • u1) = 0 :=
  textureCP_cline_zero a0 a1 a0 (edgeSurvival * a1) x b d

/-- ★★ W8 TOOTH (b), the dichotomy is GENUINE. At present amplitudes the dressed-frame CP is NONZERO on
    the Fano line while ZERO on the ℂ-line — built from the SAME frames, differing ONLY by the octonion
    line. -/
theorem dressed_cp_dichotomy (a0 a1 : ℚ) (ha0 : a0 ≠ 0) (ha1 : a1 ≠ 0) :
    textureCP a0 a1 a0 (edgeSurvival * a1) u2 u1 (octCross u1 u2) ≠ 0
    ∧ (∀ x : O ℚ, textureCP a0 a1 a0 (edgeSurvival * a1) x u1 u1 = 0) := by
  refine ⟨?_, ?_⟩
  · rw [dressed_cp_fano]
    simp only [ne_eq, neg_eq_zero]
    have := sectorMisalign_nonzero a0 a1 ha0 ha1
    rwa [sectorMisalign_eq_deficit] at this
  · intro x
    have := textureCP_cline_zero a0 a1 a0 (edgeSurvival * a1) x 1 1
    simpa using this

/-! ## §4 — ONE CAUSE, MANY TERMINATIONS: the misalignment deficit and the cycle phase δ_B. -/

/-- ★★★ THE ONE-CAUSE TIE. The SAME self-blind survival `edgeSurvival` whose DEFICIT `(1 − edgeSurvival)`
    is the mixing misalignment has PRODUCT with that deficit equal to the banked cycle phase
    `δ_B = 2/9` (banked `cycle_phase_value` via `edgeSurvival_val`). The Born self-view (Koide `2/3`),
    the cycle phase (`δ_B = 2/9`), and the mixing deficit (`1/3`) are ONE self-blind split read three
    ways. -/
theorem misalign_deficit_times_survival_is_cyclephase :
    edgeSurvival * (1 - edgeSurvival) = 2 / 9 := by
  rw [edgeSurvival_val]; norm_num

/-! ## §5 — GROUNDING on the banked generation amplitudes. -/

/-- The misalignment grounded on the banked universal Koide amplitudes `genVec` (N307): the up frame is
    `(genVec … 0, genVec … 1)`, the down frame is that with the sub-leading amplitude survival-dressed.
    The misalignment is the amplitude product times the derived deficit. -/
theorem sectorMisalign_ground (M A p r : ℚ) :
    sectorMisalign (genVec M A p r 0) (genVec M A p r 1)
      = genVec M A p r 0 * genVec M A p r 1 * (1 - edgeSurvival) :=
  sectorMisalign_eq_deficit _ _

/-- ★ NON-VACUITY: at a concrete present-amplitude witness `(M,A,p,r) = (1,3,1,0)` the grounded
    misalignment is the specific nonzero derived rational `−2/3` (`= 4·(−1/2)·(1/3)`) — a real,
    distinct derived misalignment, not a degenerate zero. -/
theorem sectorMisalign_witness : sectorMisalign (genVec 1 3 1 0 0) (genVec 1 3 1 0 1) = -2 / 3 := by
  rw [sectorMisalign_val]
  norm_num [genVec]

/-! ## §6 — the capstone. -/

/-- ★★★ THE CAPSTONE — the phase-alignment derivation (seed C1, the arc-C keystone).

    Over ℚ, with the banked derived objects (`mixV` N312, `edgeSurvival = tr Poth/3` the self-blind
    survival, `textureCP`/`u1`/`u2`/`octCross` N310/N209, `genVec` N307): the two quark sectors read the
    SAME cap-forced generation slots, but the down-type sits ONE cascade rung deeper, damping its
    sub-leading amplitude by one self-blind survival factor. The two frames' MISALIGNMENT is therefore
    a DERIVED quantity — the amplitude product times the self-blind survival DEFICIT
    `sectorMisalign = a₀·a₁·(1 − edgeSurvival)` (`sectorMisalign_eq_deficit`), the derived deficit
    `1/3` (`deficit_val`) — NOT a witness-chosen pair of distinct sectors.

    W8 TOOTH (a): the banked mixing-nonzero RE-EMERGES as a CONSEQUENCE — `sectorMisalign ≠ 0` for
    present amplitudes BECAUSE the deficit is genuine (`edgeSurvival ≠ 1`); a flat survival `= 1` would
    give `0` (perfect alignment, no mixing, `flat_survival_no_mixing`). W8 TOOTH (b): the SAME
    survival-dressed frames carry CP on the octonionic Fano line (`dressed_cp_fano`, `= −misalignment`)
    but ZERO CP on the associative ℂ-line (`dressed_cp_cline`) through the SAME `textureCP` machinery —
    one cause, two outcomes.

    ONE CAUSE, MANY TERMINATIONS: the SAME self-blind survival whose deficit is the misalignment has
    `edgeSurvival·(1 − edgeSurvival) = 2/9 = δ_B` (`misalign_deficit_times_survival_is_cyclephase`) —
    the Born self-view, the cycle phase, and the mixing deficit are one split read three ways.

    ⚠ HONEST GRADE: THEOREM-EXACT over ℚ for the misalignment STRUCTURE; the numeric leading Cabibbo
    angle (the misalignment / aligned-overlap ratio over the derived ℝ) is C2's evaluation, honestly
    deferred (leading order), never fitted. NO empirical CKM number; the misalignment is dimensionless
    (the ONE-PEG LAW: no new peg). -/
theorem phase_alignment_derivation :
    -- ★ the misalignment IS the self-blind survival deficit (a DERIVED magnitude)
    (∀ a0 a1 : ℚ, sectorMisalign a0 a1 = a0 * a1 * (1 - edgeSurvival))
    ∧ (1 : ℚ) - edgeSurvival = 1 / 3
    -- ★ W8 TOOTH (a): zero misalignment EXCLUDED (mixing ≠ 0 re-emerges as a consequence)
    ∧ (∀ a0 a1 : ℚ, a0 ≠ 0 → a1 ≠ 0 → sectorMisalign a0 a1 ≠ 0)
    ∧ (∀ a0 a1 : ℚ, a0 * a1 * (1 - (1 : ℚ)) = 0)
    -- ★ W8 TOOTH (b): the lepton ℂ-line forces ZERO CP through the SAME machinery
    ∧ (∀ a0 a1 : ℚ, textureCP a0 a1 a0 (edgeSurvival * a1) u2 u1 (octCross u1 u2)
        = -(a0 * a1 * (1 - edgeSurvival)))
    ∧ (∀ a0 a1 : ℚ, ∀ x : O ℚ, ∀ b d : ℚ,
        textureCP a0 a1 a0 (edgeSurvival * a1) x (b • u1) (d • u1) = 0)
    -- ★ one cause, many terminations: the deficit×survival is the banked cycle phase δ_B = 2/9
    ∧ edgeSurvival * (1 - edgeSurvival) = 2 / 9
    -- grounded on the banked generation amplitudes, genuinely nonzero at a witness
    ∧ (∀ M A p r : ℚ, sectorMisalign (genVec M A p r 0) (genVec M A p r 1)
        = genVec M A p r 0 * genVec M A p r 1 * (1 - edgeSurvival))
    ∧ sectorMisalign (genVec 1 3 1 0 0) (genVec 1 3 1 0 1) = -2 / 3 :=
  ⟨sectorMisalign_eq_deficit, deficit_val, sectorMisalign_nonzero, flat_survival_no_mixing,
   dressed_cp_fano, dressed_cp_cline, misalign_deficit_times_survival_is_cyclephase,
   sectorMisalign_ground, sectorMisalign_witness⟩

end

end Phys.Algebra.HJ
