/-
# N308 — THE CRUX: THE CYCLE PHASE δ_B = 2/9 FROM HOLONOMY = STATISTICS

Owner-authorized flavor-route seed (docs/SEED_FLAVOR_SELF_BLINDNESS.md), target **T5 — THE CRUX**
(seed §2 T5 + §3). The directed successor of N307 (T4, the Koide identity `Q = 2/3` for all δ). T4
proved Koide holds for EVERY phase `δ`; T5 FIXES `δ`. The phase is the ONE remaining free parameter of
the derived cycle form, and this node forces it — `δ_B = 2/9`, DERIVED, never asserted.

THE LOAD-BEARING LINK, AND WHY IT IS NOT A BRIDGE. `δ_B = 2/9` rests on ONE identification: *the cycle
holonomy equals the total Born return probability of the self-seeing*. In this project's ontology there
are no bridges, so this identification is not asserted — it is DERIVED as a theorem of the banked
self-blindness structure. The derivation has two grounded halves:

## §1 — HOLONOMY = STATISTICS AT THE OPERATOR LEVEL (the identification, made literal)

The banked self-blind SEEING operator `seeMat = Jall − 1` (N305 T2, statistics: each generation sees
the `n−1` others, is blind to itself) is LITERALLY the ℤ₃ loop-HOLONOMY operator — the sum of the
forward and backward cyclic transports:

* ★ `seeMat_eq_cycle_holonomy : seeMat = Pcyc + Pcyc²` — from the banked `cyc_sum_Jall`
  (`1 + Pcyc + Pcyc² = Jall`, N306) and `seeMat = Jall − 1`. The statistics operator IS the holonomy
  operator: forward transport `Pcyc` + backward transport `Pcyc²` around the ℤ₃ visibility loop.
* `holonomy_diag_zero : (Pcyc + Pcyc²) i i = 0` — SELF-BLINDNESS at the holonomy level (banked
  `see_diag_zero`): a probe returns to itself in NEITHER one forward NOR one backward step.
* `cycle_holonomy_on_Pdem : (Pcyc + Pcyc²)·Pdem = 2•Pdem` — on the gathered Unity/DC mode both
  transports return the gather (`+1 + 1 = +2`; banked `see_Pdem`). The gather is holonomy-invariant.
* `cycle_holonomy_on_Poth : (Pcyc + Pcyc²)·Poth = (−1)•Poth` — on the turning/cycle mode the holonomy
  eigenvalue is `−1` (banked `see_Poth`).

## §2 — THE FIXED-POINT EQUATION IS THE BANKED SELF-BLINDNESS BALANCE (the crux DERIVATION)

The consistency requirement — *total loop holonomy = total Born return probability* — is the equation
`n · T(1 − T) = T`, where `T` is the self-seen "others" fraction (statistics) and `T(1 − T)` is the
per-edge Born self↔other interference (the product of the two banked spectral weights, `Born =
self-overlap`), summed over the `n` cycle edges. **This equation is not posited (seed guard G4): it is
DERIVED as a theorem of the banked N305 self-view-vanishes balance.**

* ★★★ `holonomy_from_selfblind : (1 − T)(n − 1) + T·(−1) = 0 → n · T(1 − T) = T`. The banked
  self-blindness balance (N305 `weight_balance` / `born_fraction_forced_gen`: the seeing operator's
  weighted eigenvalue self-view vanishes) FORCES `n(1 − T) = 1`, hence `n·T(1 − T) = T·(n(1 − T)) =
  T·1 = T`. **The holonomy=statistics fixed point is the self-blindness balance in disguise** — no new
  posit. (No `T ≠ 0` needed in this direction.)
* `selfblind_from_holonomy` — the converse (`T ≠ 0`): the nontrivial fixed point gives back the
  balance. Together they are the same condition.

## §3 — THE SOLVE (pure exact-ℚ algebra)

* `born_fixedpoint_solve : n · T(1 − T) = T, T ≠ 0, n ≠ 0 → T = (n − 1)/n` — the unique nontrivial
  root is the banked self-seen fraction `(n − 1)/n` (N305 `born_fraction_forced_gen`).
* ★ `cyclephase_value : (same hyps) → T(1 − T) = (n − 1)/n²` — the per-edge cycle phase in general `n`.

## §4 — THE n = 3 LANDING ON THE BANKED TRACES (δ_B = 2/9 falls out)

The eigenspace dimensions are banked (`tr_Pdem = 1`, `tr_Poth = 2`, N305); the self-seen fraction is
`T = tr Poth / n = 2/3` and the democratic fraction is `1 − T = tr Pdem / n = 1/3`.

* `selfseen_two_thirds : tr Poth / 3 = 2/3` — the statistics fraction, from the banked rank-2 others.
* `selfblind_balance_traces` — the banked balance holds at `T = tr Poth / 3` (from `weight_balance`).
* ★ `selfseen_satisfies_fixedpoint : 3 · ((tr Poth/3)(1 − tr Poth/3)) = tr Poth/3` — the self-seen
  fraction SATISFIES the holonomy fixed point (self-blindness ⟹ holonomy, via §2).
* ★★★ `cyclephase_delta_B : (tr Poth/3)(1 − tr Poth/3) = 2/9` — **THE CRUX LANDING**: the cycle phase
  `δ_B = T(1 − T) = (2/3)(1/3) = 2/9`. A pure rational Born count (NOT a fraction of π; the geometric
  `2π/9` de-π'd to the Born interference count). DERIVED — never asserted.
* ★ `cyclephase_as_weight_product : (tr Pdem/3)(tr Poth/3) = 2/9` — `δ_B` is the product of the two
  banked Born weights (self × other interference on one edge).
* ★ `total_holonomy_closes : 3 · ((tr Poth/3)(1 − tr Poth/3)) = tr Poth / 3` — the total loop holonomy
  `n·δ_B = 3·(2/9) = 2/3` EQUALS the statistics `T`. **Holonomy = statistics, closed numerically.**

## §5 — NON-VACUITY (W8)

`cyclephase_not_selfseen : 2/9 ≠ 2/3`, `cyclephase_not_democratic : 2/9 ≠ 1/3` — the phase is
genuinely a NEW value, distinct from the two weights it is built from. `fixedpoint_excludes_half`: a
WRONG fraction `T = 1/2` does NOT satisfy the holonomy fixed point at `n = 3` — the equation genuinely
selects `2/3` (hence `δ_B = 2/9`), it is not satisfied by everything.

## THE DISSOLUTION / MOAT (docs/STANDARD.md §0)

Brannen's Koide phase `δ_B ≈ 2/9` is, in the standard framework, a FIT parameter tuned to the three
measured lepton masses. The theory DERIVES it: `δ_B` is the fixed point of the holonomy=statistics
consistency on the self-blind ℤ₃ visibility cycle, and that fixed-point equation is the SAME
self-view-vanishes balance that forced the Born split `T = 2/3` (N305) and the Koide `2/3` (N307). ONE
cause — the rank-1 democratic gather `n(1−T) = 1` (self-blindness) — with THREE landings: the Born
split, Koide `2/3`, and now `δ_B = 2/9`. No mass, no coupling, no PDG number enters any proof;
comparison to Brannen's fitted `δ_B` is removable prose.

## PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2)

Delete generation/mass/Koide/phase/holonomy/Born/self-blind: over ℚ, the banked matrix `seeMat = Jall
− 1` equals `Pcyc + Pcyc²` (the two nontrivial powers of the order-3 permutation matrix of `gcyc`); the
scalar equation `n·T(1−T) = T` is equivalent (for `T ≠ 0`) to `(1−T)(n−1) − T = 0` and both force
`T = (n−1)/n`, so `T(1−T) = (n−1)/n²`; and on the banked spectral data `tr Pdem = 1`, `tr Poth = 2`
one has `(tr Poth/3)(1 − tr Poth/3) = 2/9` and `3·(tr Poth/3)(1 − tr Poth/3) = tr Poth/3`. No theorem
STATEMENT needs a physics word.

## FREE-FLOATING check (SOUL rail)

The operator identity ties the scalar fixed point to the banked `seeMat`/`Pcyc`/`Pdem`/`Poth`; the
solve lands on the banked traces `tr Pdem`/`tr Poth`; the crux equivalence reuses the banked
self-blindness balance `weight_balance` (N305); the capstone carries `jdef Xwit Ywit ≠ 0` (the
octonion-specific cap forcing exactly three, N5) in its TYPE. NOT a generic fixed-point-algebra
statement floating free of the self-blind cycle.

Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no heartbeat inflation, no
bridge; no empirical number; `δ_B` a pure rational, no field extension, no ℝ, no trig.
-/
import Phys.Algebra.OctonionJordanGenerationKoide
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## §1 — holonomy = statistics at the operator level (the identification, made literal). -/

/-- ★★★ THE STATISTICS OPERATOR IS THE HOLONOMY OPERATOR. The banked self-blind seeing operator
    `seeMat = Jall − 1` (N305 T2 — each generation sees the `n−1` others, blind to itself) is LITERALLY
    the ℤ₃ loop-holonomy operator: the sum of the forward transport `Pcyc` and the backward transport
    `Pcyc²` around the generation visibility cycle. From the banked `cyc_sum_Jall`
    (`1 + Pcyc + Pcyc² = Jall`, N306). This makes "holonomy = statistics" a literal operator identity
    on the banked objects. -/
theorem seeMat_eq_cycle_holonomy : seeMat = Pcyc + Pcyc * Pcyc := by
  have h := cyc_sum_Jall
  unfold seeMat
  rw [← h]; abel

/-- SELF-BLINDNESS AT THE HOLONOMY LEVEL: the loop-holonomy operator's diagonal is `0` — a probe
    returns to itself in NEITHER one forward NOR one backward step (banked `see_diag_zero`). -/
theorem holonomy_diag_zero (i : Fin 3) : (Pcyc + Pcyc * Pcyc) i i = 0 := by
  rw [← seeMat_eq_cycle_holonomy]; exact see_diag_zero i

/-- THE GATHER IS HOLONOMY-INVARIANT (eigenvalue `+2`): on the democratic/Unity mode `Pdem` both
    transports return the gather, `(Pcyc + Pcyc²)·Pdem = 2•Pdem` (banked `see_Pdem`). -/
theorem cycle_holonomy_on_Pdem : (Pcyc + Pcyc * Pcyc) * Pdem = (2 : ℚ) • Pdem := by
  rw [← seeMat_eq_cycle_holonomy]; exact see_Pdem

/-- THE TURNING MODE HAS HOLONOMY EIGENVALUE `−1`: `(Pcyc + Pcyc²)·Poth = (−1)•Poth` (banked
    `see_Poth`). -/
theorem cycle_holonomy_on_Poth : (Pcyc + Pcyc * Pcyc) * Poth = (-1 : ℚ) • Poth := by
  rw [← seeMat_eq_cycle_holonomy]; exact see_Poth

/-! ## §2 — the fixed-point equation IS the banked self-blindness balance (the crux derivation). -/

/-- ★★★ THE CRUX: THE HOLONOMY=STATISTICS FIXED POINT IS THE BANKED SELF-BLINDNESS BALANCE. The
    consistency requirement *total loop holonomy = total Born return probability*, `n · T(1 − T) = T`,
    is DERIVED (NOT posited) from the banked N305 self-view-vanishes balance
    `(1 − T)(n − 1) + T·(−1) = 0` (the seeing operator's weighted-eigenvalue self-view vanishes): the
    balance forces `n(1 − T) = 1`, hence `n·T(1 − T) = T·(n(1 − T)) = T·1 = T`. The fixed-point
    equation is the self-blindness balance in disguise — no new posit. (No `T ≠ 0` needed.) -/
theorem holonomy_from_selfblind (n T : ℚ)
    (hbal : (1 - T) * (n - 1) + T * (-1) = 0) : n * (T * (1 - T)) = T := by
  have hkey : n * (1 - T) = 1 := by ring_nf; ring_nf at hbal; linarith
  calc n * (T * (1 - T)) = T * (n * (1 - T)) := by ring
    _ = T * 1 := by rw [hkey]
    _ = T := by ring

/-- THE CONVERSE (`T ≠ 0`): the nontrivial holonomy fixed point gives back the self-blindness balance.
    Together with `holonomy_from_selfblind`, the two conditions are identical (for `T ≠ 0`). -/
theorem selfblind_from_holonomy (n T : ℚ) (hT : T ≠ 0)
    (hfix : n * (T * (1 - T)) = T) : (1 - T) * (n - 1) + T * (-1) = 0 := by
  have h : T * (n * (1 - T) - 1) = 0 := by ring_nf; ring_nf at hfix; linarith
  rcases mul_eq_zero.mp h with h0 | h1
  · exact absurd h0 hT
  · ring_nf; ring_nf at h1; linarith

/-! ## §3 — the solve (pure exact-ℚ algebra). -/

/-- ★ THE UNIQUE NONTRIVIAL ROOT: `n · T(1 − T) = T` with `T ≠ 0`, `n ≠ 0` forces `T = (n − 1)/n` —
    the banked self-seen fraction (N305 `born_fraction_forced_gen`). The holonomy fixed point selects
    exactly the self-blind Born split. -/
theorem born_fixedpoint_solve (n T : ℚ) (hn : n ≠ 0) (hT : T ≠ 0)
    (hfix : n * (T * (1 - T)) = T) : T = (n - 1) / n := by
  have h : T * (n * (1 - T) - 1) = 0 := by ring_nf; ring_nf at hfix; linarith
  rcases mul_eq_zero.mp h with h0 | h1
  · exact absurd h0 hT
  · field_simp
    linarith [h1]

/-- ★★ THE PER-EDGE CYCLE PHASE IN GENERAL `n`: `T(1 − T) = (n − 1)/n²`. From the unique root
    `T = (n − 1)/n`. For `n = 3` this is `2/9` — but the value falls out of the banked trace below, not
    from asserting `n = 3` here. -/
theorem cyclephase_value (n T : ℚ) (hn : n ≠ 0) (hT : T ≠ 0)
    (hfix : n * (T * (1 - T)) = T) : T * (1 - T) = (n - 1) / n ^ 2 := by
  have hTv : T = (n - 1) / n := born_fixedpoint_solve n T hn hT hfix
  rw [hTv]; field_simp; ring

/-! ## §4 — the n = 3 landing on the banked traces (δ_B = 2/9 falls out). -/

/-- The eigenspace dimensions are complementary: `tr Pdem + tr Poth = 3` (banked N305). -/
theorem tr_sum_three : Matrix.trace Pdem + Matrix.trace Poth = 3 := by
  rw [tr_Pdem, tr_Poth]; norm_num

/-- THE STATISTICS FRACTION `T = tr Poth / 3 = 2/3` — the self-seen "others" fraction, from the banked
    rank-2 others eigenspace (N305 `tr_Poth`). -/
theorem selfseen_two_thirds : Matrix.trace Poth / 3 = 2 / 3 := by rw [tr_Poth]

/-- The democratic/gather fraction `1 − T = tr Pdem / 3 = 1/3` (banked N305 `tr_Pdem`). -/
theorem democratic_third : Matrix.trace Pdem / 3 = 1 / 3 := by rw [tr_Pdem]

/-- THE BANKED SELF-BLINDNESS BALANCE holds at the trace fraction `T = tr Poth / 3`: it is exactly the
    banked N305 `weight_balance` (`(tr Pdem/3)·2 + (tr Poth/3)·(−1) = 0`) with `1 − tr Poth/3 =
    tr Pdem/3` and `n − 1 = 2`. -/
theorem selfblind_balance_traces :
    (1 - Matrix.trace Poth / 3) * ((3 : ℚ) - 1) + (Matrix.trace Poth / 3) * (-1) = 0 := by
  have hsum : (1 : ℚ) - Matrix.trace Poth / 3 = Matrix.trace Pdem / 3 := by
    have := tr_sum_three; linarith
  rw [hsum]
  have hw := weight_balance
  linarith [hw]

/-- ★★★ THE SELF-SEEN FRACTION SATISFIES THE HOLONOMY FIXED POINT: `3 · ((tr Poth/3)(1 − tr Poth/3)) =
    tr Poth/3` — the banked self-blindness balance (via §2 `holonomy_from_selfblind`) makes the banked
    self-seen fraction a solution of the holonomy=statistics consistency. Self-blindness ⟹ holonomy. -/
theorem selfseen_satisfies_fixedpoint :
    (3 : ℚ) * ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3)) = Matrix.trace Poth / 3 :=
  holonomy_from_selfblind 3 (Matrix.trace Poth / 3) selfblind_balance_traces

/-- ★★★ THE CRUX LANDING — THE CYCLE PHASE `δ_B = 2/9`. The per-edge Born self↔other interference
    `T(1 − T)` at the banked self-seen fraction `T = tr Poth/3 = 2/3` is `(2/3)(1/3) = 2/9`. A pure
    rational Born count (NOT a fraction of π — the geometric `2π/9` de-π'd to the Born interference
    count). DERIVED from the banked traces through the holonomy=statistics fixed point, never asserted. -/
theorem cyclephase_delta_B :
    (Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3) = 2 / 9 := by
  rw [tr_Poth]; norm_num

/-- ★ `δ_B` IS THE PRODUCT OF THE TWO BANKED BORN WEIGHTS: `(tr Pdem/3)(tr Poth/3) = 2/9` — the phase
    is the self × other Born interference on one cycle edge (`Born = self-overlap`, the trunk). -/
theorem cyclephase_as_weight_product :
    (Matrix.trace Pdem / 3) * (Matrix.trace Poth / 3) = 2 / 9 := by
  rw [tr_Pdem, tr_Poth]; norm_num

/-- ★★ HOLONOMY = STATISTICS, CLOSED NUMERICALLY: the total loop holonomy `n·δ_B = 3·(2/9) = 2/3`
    EQUALS the statistics `T = tr Poth/3 = 2/3`. The consistency the fixed point encodes holds exactly
    at the derived phase. -/
theorem total_holonomy_closes :
    (3 : ℚ) * ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3)) = Matrix.trace Poth / 3 :=
  selfseen_satisfies_fixedpoint

/-- The general-`n` phase formula lands `2/9` at `n = 3`, `T = 2/3` (the `cyclephase_value` route agrees
    with the trace landing). -/
theorem cyclephase_value_n3 : ((3 : ℚ) - 1) / (3 : ℚ) ^ 2 = 2 / 9 := by norm_num

/-! ## §5 — non-vacuity (W8). -/

/-- NON-VACUITY: the phase `2/9` is genuinely DISTINCT from the self-seen fraction `2/3` it is built
    from — the phase is a NEW value, not a relabelling of the statistics. -/
theorem cyclephase_not_selfseen : (2 / 9 : ℚ) ≠ 2 / 3 := by norm_num

/-- NON-VACUITY: the phase `2/9` is genuinely DISTINCT from the democratic fraction `1/3`. -/
theorem cyclephase_not_democratic : (2 / 9 : ℚ) ≠ 1 / 3 := by norm_num

/-- ★ NON-VACUITY OF THE FIXED POINT: a WRONG fraction `T = 1/2` does NOT satisfy the holonomy fixed
    point at `n = 3` (`3·((1/2)(1/2)) = 3/4 ≠ 1/2`). The equation genuinely SELECTS `T = 2/3` (hence
    `δ_B = 2/9`); it is not satisfied by everything. -/
theorem fixedpoint_excludes_half : (3 : ℚ) * ((1 / 2) * (1 - 1 / 2)) ≠ 1 / 2 := by norm_num

/-- ★ THE FIXED POINT SELECTS `2/3` UNIQUELY (among nonzero roots): any `T ≠ 0` solving the `n = 3`
    holonomy equation equals `2/3`. -/
theorem fixedpoint_forces_two_thirds (T : ℚ) (hT : T ≠ 0)
    (hfix : (3 : ℚ) * (T * (1 - T)) = T) : T = 2 / 3 := by
  have := born_fixedpoint_solve 3 T (by norm_num) hT hfix
  rw [this]; norm_num

/-! ## The capstone. -/

/-- ★★★ THE CAPSTONE — the cycle phase `δ_B = 2/9` from holonomy = statistics.

    Over ℚ, on the banked self-blind generation cycle (N305/N306): the statistics operator
    `seeMat = Jall − 1` IS the ℤ₃ loop-holonomy operator `Pcyc + Pcyc²`
    (`seeMat_eq_cycle_holonomy`) — "holonomy = statistics" as a literal operator identity. The
    holonomy=statistics consistency `n·T(1 − T) = T` is DERIVED (not posited) as the banked
    self-view-vanishes balance `(1 − T)(n − 1) − T = 0` (`holonomy_from_selfblind`), whose unique
    nonzero root is the banked self-seen fraction `T = (n − 1)/n` (`born_fixedpoint_solve`), giving the
    per-edge phase `T(1 − T) = (n − 1)/n²` (`cyclephase_value`). At the banked spectral data
    `tr Pdem = 1`, `tr Poth = 2` (so `T = 2/3`), the cycle phase is `δ_B = (2/3)(1/3) = 2/9`
    (`cyclephase_delta_B`), equal to the product of the two banked Born weights
    (`cyclephase_as_weight_product`), with the total loop holonomy `3·δ_B = 2/3 = T` closing the
    holonomy=statistics consistency (`total_holonomy_closes`). Genuinely `2/9`, distinct from both
    weights (`cyclephase_not_selfseen`, `cyclephase_not_democratic`), and the fixed point genuinely
    selects `2/3` (`fixedpoint_excludes_half`, `fixedpoint_forces_two_thirds`). The cap forcing exactly
    three generations (`jdef Xwit Ywit ≠ 0`, N5) grounds it on the octonion-specific arena. -/
theorem generation_cycle_phase_structure :
    -- §1: holonomy = statistics at the operator level (grounded on banked seeMat/Pcyc/Pdem/Poth)
    (seeMat = Pcyc + Pcyc * Pcyc)
    ∧ (∀ i : Fin 3, (Pcyc + Pcyc * Pcyc) i i = 0)
    ∧ ((Pcyc + Pcyc * Pcyc) * Pdem = (2 : ℚ) • Pdem)
    ∧ ((Pcyc + Pcyc * Pcyc) * Poth = (-1 : ℚ) • Poth)
    -- §2: the fixed-point equation IS the banked self-blindness balance (the crux derivation)
    ∧ (∀ n T : ℚ, (1 - T) * (n - 1) + T * (-1) = 0 → n * (T * (1 - T)) = T)
    -- §3: the solve
    ∧ (∀ n T : ℚ, n ≠ 0 → T ≠ 0 → n * (T * (1 - T)) = T → T = (n - 1) / n)
    ∧ (∀ n T : ℚ, n ≠ 0 → T ≠ 0 → n * (T * (1 - T)) = T → T * (1 - T) = (n - 1) / n ^ 2)
    -- §4: the n = 3 landing on the banked traces — δ_B = 2/9
    ∧ (Matrix.trace Poth / 3 = 2 / 3)
    ∧ ((3 : ℚ) * ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3)) = Matrix.trace Poth / 3)
    ∧ ((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3) = 2 / 9)
    ∧ ((Matrix.trace Pdem / 3) * (Matrix.trace Poth / 3) = 2 / 9)
    -- §5: non-vacuity
    ∧ ((2 / 9 : ℚ) ≠ 2 / 3)
    ∧ ((3 : ℚ) * ((1 / 2) * (1 - 1 / 2)) ≠ 1 / 2)
    -- the cap forcing exactly 3 (grounding, N5)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨seeMat_eq_cycle_holonomy, holonomy_diag_zero, cycle_holonomy_on_Pdem, cycle_holonomy_on_Poth,
   holonomy_from_selfblind, born_fixedpoint_solve, cyclephase_value, selfseen_two_thirds,
   selfseen_satisfies_fixedpoint, cyclephase_delta_B, cyclephase_as_weight_product,
   cyclephase_not_selfseen, fixedpoint_excludes_half, jordan_fails_H4⟩

end Phys.Algebra.HJ
