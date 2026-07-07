/-
  Phys.Algebra.ScaleTowerWindingQuantization — N407 (SEED_INPUT_CLOSURE, arc M, target M1).
  ============================================================================================
  THE WINDING / LADDER-RUNG QUANTIZATION — the OFFSET-1 winding grid `n = 1 + 3k`, its phase reading
  over the derived ℝ `Cut` (winding the banked Born circle `azimuthalTurn = 2·cutPi`), and the
  `w = −1` boundary rung, as an EXACT STRUCTURAL FACT about the banked derived generation count
  `finrank ℚ Uhol = 3`. Two cross-arc ties: (arc F) the winding grid is the residue-1 companion of
  N368's residue-0 baryon grid `ΔB ∈ n_gen·ℤ`; (arc B) each winding step advances the Born-circle
  phase by exactly `n_gen` full turns, tied to the banked 84π critical-phase budget.

  ---------------------------------------------------------------------------
  ⭐ OWNER-AUTHORIZED SEED (docs/SEED_INPUT_CLOSURE.md, ARC M, target M1). The DIRECTED single
  successor of N406 (arc-L L5 complete). §M1 asks: DERIVE the ladder grammar's `n = 1 + 3k`
  quantization + the `w = −1` rung structure as an exact structural fact about the banked ladder
  (theorem-route for the STRUCTURE), and flag the rung ASSIGNMENT (the seed's 9/4) as candidate with
  a permanent inception flag. OPENS arc M, the hardest and least-certain arc.

  ---------------------------------------------------------------------------
  THE THEORY-NATIVE ROUTE (the residue-1 companion of the N368 colour ladder, wound on the Born circle).

  ONE derived generation count `finrank ℚ Uhol = 3` (N42c), THREE readings:
    • (arc F, N368) the residue-0 BARYON grid: a gauge-universal / generation-blind topological
      transition shifts one baryon per generation, so `baryonShift n k = n·k ∈ n_gen·ℤ` — anchored
      at 0.
    • (arc M, HERE) the residue-1 WINDING grid: the fold's own ground direction is the self-blind
      unit "1" (the ℤ₃-cycle DC component, N305/N306), NOT a generation multiple; the rung grid
      anchored at that ground is the OFFSET-1 coset

          windingRungIndex k := 1 + (finrank ℚ Uhol)·k     (= 1 + 3k).

      This grid is DISJOINT from the baryon grid (residue 1 vs 0 — never divisible by `n_gen` once
      `2 ≤ n_gen`). The `w = −1` boundary rung `windingRungIndex (−1) = 1 − n_gen` (= −2) is the FIRST
      descent below the ground rung `windingRungIndex 0 = 1`.
    • (arc B) the PHASE reading over the derived ℝ `Cut`: winding rung `k` winds the banked Born
      circle `azimuthalTurn = 2·cutPi` (N328) by the rung index — `windingPhase k = azimuthalTurn ·
      windingRungIndex k`. Each winding STEP advances the phase by exactly `n_gen` full turns
      (`windingPhase (k+1) − windingPhase k = n_gen · azimuthalTurn`), positive, tying the grid to
      the banked 84π critical-phase budget (`criticalPhaseNumerator = azimuthalTurn · channelCount`,
      the SAME 42 = 1/α* that fixed the couplings and every scale-tower rung).

  ONE CAUSE (the derived `finrank ℚ Uhol = 3`), one grid read three ways: anchored at the self-blind
  ground (offset 1), disjoint from the baryon grid, and winding the Born circle by `n_gen` turns per
  step.

  ---------------------------------------------------------------------------
  HONEST GRADE (LOAD-BEARING — arc M is the hardest, conditional/candidate by the key's own reckoning).
    • THEOREM-GRADE (forced math, foundations-only, grounded on `finrank ℚ Uhol`): the grid
      `windingRungIndex k = 1 + n_gen·k`; its spacing `= n_gen`; its residue `= 1`; its
      non-divisibility by `n_gen` (distinct from N368's residue-0 grid); the injectivity; the
      disjointness from the baryon grid (arc-F cross-tie); the ground rung `= 1`; the boundary rung
      `w = −1` as the first descent below the ground; and the phase reading over `Cut` (each step =
      `n_gen` full Born-circle turns, positive, tied to the banked 84π budget — arc-B cross-tie).
    • CANDIDATE / PERMANENT INCEPTION FLAG (NOT a structural theorem, NOT ground, NEVER fit): the
      boundary VALUE-ASSIGNMENT (the seed's `9/4`) is an ISOLATED, hard-flagged arithmetic identity
      `9/4 = (n_gen / dim StateFibre)²` — "expressible via the banked counts", NOT a forced
      derivation of the absolute scale. ⚠⚠ THE PHANTOM CAP (SEED §3): the CLEAN forced identity for
      the absolute scale DOES NOT EXIST (the key reached only conditional/candidate grade). This node
      lands the STRUCTURE + flags the assignment; it does NOT grind for a cleaner value and does NOT
      fit any measured scale.
    • MECHANISM / identification (FLAGGED PROSE, never a Lean equation): that this winding grid IS the
      physical ladder-rung quantization of the absolute lepton scale (`z0` as the `w = −1` rung of the
      banked tower). The measured `m_e`, `z0` are REMOVABLE PROSE only.

  ---------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "winding / ladder / rung / scale / mass /
  electron / boundary / generation / phase / Born circle": what remains is — over ℤ / the derived ℝ
  `Cut` and grounded on `Module.finrank ℚ Uhol`, the affine functional `windingRungIndex k = 1 +
  (finrank ℚ Uhol)·k` has constant increment `finrank ℚ Uhol`, residue `1` modulo `finrank ℚ Uhol`,
  is never divisible by `finrank ℚ Uhol` (so is disjoint from the submonoid `(finrank ℚ Uhol)·ℤ` =
  N368's `baryonShift (finrank ℚ Uhol)`), is injective, takes value `1` at `0`, its value at `−1` is
  `1 − finrank ℚ Uhol` (strictly below its value at `0`, with every negative-index value ≤ it), and
  `azimuthalTurn · windingRungIndex k` increments by `finrank ℚ Uhol · azimuthalTurn > 0` per step.
  No theorem STATEMENT needs a physics word; the headline TYPEs mention the banked
  `Module.finrank ℚ Uhol` (NOT a free-floating `3`).

  ⚠ FREE-FLOATING RAIL (SOUL): every structural theorem is stated at the BANKED `Module.finrank ℚ Uhol`
  (the N368 precedent), not a generic `n`; the phase reading additionally cites the banked
  `azimuthalTurn` / `criticalPhaseNumerator` / `channelCount` (N328/N329); the isolated candidate cites
  the banked `Module.finrank ContinuumQ.Cut StateFibre` (N391). G1: the grid facts FALL OUT of
  `finrank_Uhol` + `omega`/`ring`, never premised; the `9/4` is an isolated flagged candidate, never a
  load-bearing premise, never fit. G2: NO empirical number in any proof (`m_e`, `z0` live only in
  prose). ⚠ UNEARNED-IMPORT: ground ℤ (all structural values ℤ-exact) + the banked derived ℝ `Cut`
  (the phase); the candidate uses ℚ only for one norm_num; NO Mathlib-ℝ/ℂ as content;
  `Module.finrank` / `Int.emod` / `Dvd` / `push_cast` are standard Mathlib MACHINERY on the derived
  objects.

  UNBROKEN: `Uhol` / `finrank_Uhol` (N42c, DerivationStabilizerSplit), `baryonShift` / `baryonShift_eq`
  (N368, ProtonStabilitySelectionRule), `azimuthalTurn` / `cutPi_pos` (N328) / `criticalPhaseNumerator`
  / `channelCount` (N329, ScaleTowerNumeratorLock), `StateFibre` / `fibre_finrank` (N391,
  PrimitiveFibre), `Module.finrank` / `Int` arithmetic standard Mathlib MACHINERY on the derived
  objects. Ground = derived ℤ + derived ℝ `Cut` (+ ℚ only in the isolated candidate); nothing posited;
  no bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no kernel-compilation bypass, no heartbeat inflation.
-/
import Phys.Algebra.ProtonStabilitySelectionRule
import Phys.Algebra.ScaleTowerNumeratorLock
import Phys.Quantum.PrimitiveFibre
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra.Winding

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open Phys.Quantum Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) The OFFSET-1 winding grid, grounded on the derived generation count. -/

/-- THE OFFSET-1 WINDING GRID: rung index `k ↦ 1 + n_gen·k`, grounded on the BANKED derived
    generation count `finrank ℚ Uhol`. The fold's self-blind ground direction is the unit "1"; the
    rung grid anchored at that ground has spacing = the derived generation count. This is the
    residue-1 companion of N368's residue-0 baryon grid `baryonShift (finrank ℚ Uhol) k = n_gen·k`. -/
def windingRungIndex (k : ℤ) : ℤ := 1 + (Module.finrank ℚ Uhol : ℤ) * k

/-- The `w = −1` boundary rung index: the first descent below the self-blind ground rung `k = 0`. -/
def boundaryRungIndex : ℤ := -1

/-- ★ THE `n = 1 + 3k` QUANTIZATION: the winding grid FALLS OUT of the banked `finrank ℚ Uhol = 3` as
    `1 + 3k`; the offset `1` is the self-blind ground, the spacing `3` the derived generation count. -/
theorem windingRungIndex_eq (k : ℤ) : windingRungIndex k = 1 + 3 * k := by
  unfold windingRungIndex; rw [finrank_Uhol]; push_cast; ring

/-! ## (B) The structural facts of the grid (theorem-grade). -/

/-- ★ THE SPACING = the derived generation count: consecutive rungs differ by `finrank ℚ Uhol`. -/
theorem windingRungIndex_spacing (k : ℤ) :
    windingRungIndex (k + 1) - windingRungIndex k = (Module.finrank ℚ Uhol : ℤ) := by
  unfold windingRungIndex; ring

/-- ★ RESIDUE 1: every winding rung is `≡ 1` modulo the derived generation count — the grid is
    anchored at the self-blind ground, NOT at a generation multiple. -/
theorem windingRungIndex_residue (k : ℤ) :
    windingRungIndex k % (Module.finrank ℚ Uhol : ℤ) = 1 := by
  rw [windingRungIndex_eq, finrank_Uhol]; omega

/-- ★ NON-DIVISIBILITY: no winding rung is a multiple of the derived generation count (needs
    `2 ≤ n_gen`). THE DISTINCTION FROM N368's residue-0 baryon grid — the winding grid never lands on
    `n_gen·ℤ`. -/
theorem windingRungIndex_not_dvd (k : ℤ) :
    ¬ (Module.finrank ℚ Uhol : ℤ) ∣ windingRungIndex k := by
  rw [windingRungIndex_eq, finrank_Uhol]; omega

/-- ★ INJECTIVITY: distinct rung indices give distinct grid points — the grid is a faithful ℤ-ladder. -/
theorem windingRungIndex_injective : Function.Injective windingRungIndex := by
  intro a b h; rw [windingRungIndex_eq, windingRungIndex_eq] at h; omega

/-- ★★ ARC-F CROSS-TIE: the winding grid is DISJOINT from the baryon grid. The residue-1 winding rung
    `windingRungIndex k` is never equal to the residue-0 baryon shift `baryonShift (finrank ℚ Uhol) m`
    (N368) — one derived generation count, two disjoint grids (ground-anchored vs zero-anchored). -/
theorem windingRung_ne_baryonGrid (k m : ℤ) :
    windingRungIndex k ≠ baryonShift (Module.finrank ℚ Uhol) m := by
  rw [windingRungIndex_eq, baryonShift_eq, finrank_Uhol]; omega

/-- THE SELF-BLIND GROUND RUNG: `windingRungIndex 0 = 1` — the fold's own ground direction, the offset. -/
theorem groundRung : windingRungIndex 0 = 1 := by rw [windingRungIndex_eq]; ring

/-- ★ THE `w = −1` BOUNDARY RUNG VALUE `= 1 − n_gen` (= −2): the first step of the grid below the
    self-blind ground. -/
theorem windingRung_boundary :
    windingRungIndex boundaryRungIndex = 1 - (Module.finrank ℚ Uhol : ℤ) := by
  unfold windingRungIndex boundaryRungIndex; ring

/-- ★★ THE `w = −1` RUNG IS THE FIRST DESCENT BELOW THE GROUND: it lies strictly below the ground
    rung, and every rung of negative index lies at or below it — so `w = −1` is the immediate/first
    descent. (This is the STRUCTURE of the boundary rung; its numeric scale value is candidate, below.) -/
theorem boundary_is_first_descent :
    windingRungIndex boundaryRungIndex < windingRungIndex 0
    ∧ ∀ k : ℤ, k < 0 → windingRungIndex k ≤ windingRungIndex boundaryRungIndex := by
  refine ⟨?_, ?_⟩
  · rw [windingRungIndex_eq, windingRungIndex_eq]; unfold boundaryRungIndex; omega
  · intro k hk
    rw [windingRungIndex_eq, windingRungIndex_eq]; unfold boundaryRungIndex; omega

/-! ## (C) The PHASE reading over the derived ℝ `Cut` (arc-B cross-tie to the 84π budget). -/

/-- THE WINDING PHASE over the derived ℝ `Cut`: winding rung `k` winds the banked Born circle
    `azimuthalTurn = 2·cutPi` (N328) by the rung index. -/
def windingPhase (k : ℤ) : Cut := azimuthalTurn * (windingRungIndex k : Cut)

/-- ★ THE PHASE STEP = `n_gen` FULL BORN-CIRCLE TURNS: each winding step advances the phase by exactly
    the derived generation count times the full turn `azimuthalTurn`. -/
theorem windingPhase_step (k : ℤ) :
    windingPhase (k + 1) - windingPhase k = (Module.finrank ℚ Uhol : Cut) * azimuthalTurn := by
  unfold windingPhase windingRungIndex; rw [finrank_Uhol]; push_cast; ring

/-- THE GROUND PHASE: at the self-blind ground rung the phase is one full turn `azimuthalTurn`. -/
theorem windingPhase_zero : windingPhase 0 = azimuthalTurn := by
  unfold windingPhase windingRungIndex; push_cast; ring

/-- ★ THE PHASE ADVANCES: each winding step increases the Born-circle phase strictly (positivity of
    `n_gen · azimuthalTurn`, via banked `cutPi_pos`). -/
theorem windingPhase_step_pos (k : ℤ) : 0 < windingPhase (k + 1) - windingPhase k := by
  rw [windingPhase_step, finrank_Uhol]
  have hpi := cutPi_pos
  unfold azimuthalTurn; push_cast; nlinarith [hpi]

/-- ★ THE TIE BACK TO THE BANKED 84π BUDGET: the critical-phase numerator that fixed the fine-structure
    coupling and every scale-tower rung is the SAME full-turn `azimuthalTurn` times the banked channel
    count `1/α* = 42` that the winding phase winds (`criticalPhaseNumerator = azimuthalTurn ·
    channelCount`, N329). One Born circle, one budget, one winding. -/
theorem criticalBudget_channelform :
    criticalPhaseNumerator = azimuthalTurn * channelCount := rfl

/-! ## (D) THE CANDIDATE boundary value-assignment (ISOLATED, PERMANENT INCEPTION FLAG). -/

/-- ⚠⚠ CANDIDATE — PERMANENT INCEPTION FLAG (SEED_INPUT_CLOSURE §3, THE PHANTOM CAP). This is NOT a
    structural theorem and NOT ground: it merely records that the seed's boundary value `9/4` is
    EXPRESSIBLE via the banked counts as `(n_gen / dim StateFibre)²` — the square of the ratio of the
    derived generation count `finrank ℚ Uhol = 3` to the derived primitive-fibre dimension
    `finrank Cut StateFibre = 2` (N391). It is a pure `norm_num` identity on banked finranks, carrying
    NO claim that the absolute scale is FORCED to this value. A clean forced absolute-scale identity
    DOES NOT EXIST (the key reached only conditional/candidate grade); this node does NOT grind for a
    cleaner value and does NOT fit any measured scale. The `9/4` enters no other declaration. -/
theorem candidate_boundary_expressible :
    (9 : ℚ) / 4
      = ((Module.finrank ℚ Uhol : ℚ) / (Module.finrank ContinuumQ.Cut StateFibre : ℚ)) ^ 2 := by
  rw [finrank_Uhol, fibre_finrank]; norm_num

/-! ## (E) Non-vacuity (W8). -/

/-- W8 NON-VACUITY: the spacing is genuinely the derived generation count `≠ 1` — a real grid with
    gaps, not all of ℤ. A WRONG reading (spacing 1 / the winding grid = ℤ = the trivial ladder) fails. -/
theorem windingRungIndex_spacing_ne_one : windingRungIndex 1 - windingRungIndex 0 ≠ 1 := by
  rw [windingRungIndex_eq, windingRungIndex_eq]; omega

/-- W8 NON-VACUITY: the boundary rung index `w = −1` is genuinely distinct from the ground rung `k = 0`
    — the descent is real. -/
theorem boundaryRungIndex_ne_ground : boundaryRungIndex ≠ 0 := by
  unfold boundaryRungIndex; omega

/-! ## (F) THE CAPSTONE (structural only — NOT the candidate value). -/

/-- ★★★ THE WINDING QUANTIZATION (arc-M M1, theorem-grade STRUCTURE): the ladder-rung grid is the
    residue-1 companion of the N368 baryon grid (arc-F), winding the banked Born circle by `n_gen`
    turns per step (arc-B), grounded on the derived generation count `finrank ℚ Uhol`. Bundled: every
    rung `≡ 1 mod n_gen`; no rung divisible by `n_gen`; the grid is disjoint from N368's baryon grid;
    the ground rung is `1`; the `w = −1` boundary rung is the first descent below the ground; and each
    winding step advances the phase by `n_gen · azimuthalTurn`. The boundary VALUE-assignment (`9/4`)
    is CANDIDATE / inception-flagged and deliberately EXCLUDED from this structural capstone. -/
theorem winding_quantization :
    (∀ k : ℤ, windingRungIndex k % (Module.finrank ℚ Uhol : ℤ) = 1)
    ∧ (∀ k : ℤ, ¬ (Module.finrank ℚ Uhol : ℤ) ∣ windingRungIndex k)
    ∧ (∀ k m : ℤ, windingRungIndex k ≠ baryonShift (Module.finrank ℚ Uhol) m)
    ∧ windingRungIndex 0 = 1
    ∧ windingRungIndex boundaryRungIndex < windingRungIndex 0
    ∧ (∀ k : ℤ,
        windingPhase (k + 1) - windingPhase k = (Module.finrank ℚ Uhol : Cut) * azimuthalTurn) :=
  ⟨windingRungIndex_residue, windingRungIndex_not_dvd, windingRung_ne_baryonGrid, groundRung,
   boundary_is_first_descent.1, windingPhase_step⟩

end

end Phys.Algebra.Winding
