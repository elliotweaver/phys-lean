/-
  Phys.Algebra.StandpointTrajectory — N### (arc-S S1): THE TRAJECTORY THEOREM (the residual
  through time).
  ============================================================================================
  DIRECTED SINGLE SUCCESSOR of N453 (arc-R R8 → arc-S S1), per docs/SEED_STANDPOINT_DYNAMICS.md §S1
  — the FIRST node of arc S. Arc R banked the standpoint's STATICS (the stratum, the residual, the
  quotient, the cover, the excess, the lattice, the grain, the Artin subalgebra), closing at R8 with
  the consolidation + THE ONE IDENTIFICATION. Arc S banks the SAME banked structure THROUGH TIME and
  UNDER LOAD. S1 reads the FIRST diachronic fact: what the banked R2 residual (`res x = look x − x`,
  `Phys/Algebra/StandpointResidual.lean`) forces along an ARBITRARY trajectory — a sequence
  `γ : ℕ → O Cut` under NO assumed dynamics. That ABSENCE of an assumed evolution law IS the
  theorem's strength: whatever the dynamics, the residual behaves the same at every point.

  On the banked terminal carrier `O Cut = CD (CD (Dbl Cut))` over the DERIVED continuum `Cut`
  (never Mathlib-ℝ as content), for any fold `look` (`IsFold`, N1) and any sequence `γ : ℕ → O Cut`:

    (a) trajectory_residual_eq_zero_iff  — THE TRAJECTORY QUANTIFICATION. At EVERY index `t` of ANY
        trajectory, `res (γ t) = 0 ↔ γ t = 0`. The zero-residual point of any trajectory is the void
        and nothing else. Assembly on the banked `foldResidual_eq_zero_iff` (R2), quantified over an
        arbitrary sequence and an arbitrary index.

    (b) trajectory_residual_ne_zero  — THE LIVE-BITE COROLLARY (W8). On any nonzero trajectory point
        the residual is nonzero: `γ t ≠ 0 → res (γ t) ≠ 0`. No live state along any trajectory ever
        coincides with its own look-back.

    (c) trajectory_residual_eq_neg_two_smul  — ★ THE CROSS-TIE TO THE BANKED R2 LINEARITY (R2c,
        `foldResidual_eq_neg_two_smul`, `res x = (−2)•x`). At every trajectory index, `res (γ t) =
        (−2 : Cut) • γ t`: the residual scales WITH the state, with the SAME time-independent scalar
        `(−2)`. No evolution diminishes the miss relative to what carries it.

    (★) trajectory_residual_separates  — THE TRAJECTORY-SEPARATION WELD (the genuine never-co-stated
        content, statable from NEITHER (a) NOR (c) alone). For ANY two indices `s, t` of any
        trajectory, `res (γ s) = res (γ t) ↔ γ s = γ t`: the residual is a FAITHFUL diachronic
        coordinate — no dynamics can make two distinct states share a miss, and none can give one
        state two misses. The forward direction combines the linearity (c) — which turns equal misses
        into `(−2)•(γ s − γ t) = 0`, hence `res (γ s − γ t) = 0` — with the void-only law (a) at the
        difference. This is BINARY in the time index (a statement about PAIRS of times), so it is NOT
        a pointwise re-quantification of R2: it needs BOTH banked faces together. This is the
        diachronic reading of "no evolution diminishes the miss relative to what carries it".

    trajectory_one_residual_born_pos  — NON-VACUITY (W8), realized. On the concrete constant-unit
        trajectory `γ = fun _ => 1`, the residual's Born self-overlap is strictly positive at EVERY
        time (`= 4 · gFormC 1 1 = 4`, via the banked `foldResidual_one_pos`, R2). The ineliminable
        self-miss along a live trajectory is realized on a concrete nonzero trajectory, not vacuously.

  ⚠ GRADE / FIREWALL. THEOREM-route (assembly on the banked R2 residual; the quantifier-over-ALL-
  dynamics + the binary separation weld are the new content, NOT a bare re-cite of R2). NON-HOLLOW:
  the separation weld (★) is a genuine binary statement about pairs of trajectory times, provable
  only by combining the banked (a) and (c) — no single arc-R node stated that the residual is a
  faithful diachronic coordinate under an arbitrary dynamics. NO identification anywhere (arc S, the
  G7 IDENTIFICATION FIREWALL — deferred to S8). No theorem here mentions or depends on any
  identification. MIND-WORDS-REMOVABLE (docs/SEED_STANDPOINT_DYNAMICS.md §G4): delete "standpoint /
  trajectory / time / evolution / dynamics / miss / live state" → pure facts about `look − id`
  composed with an arbitrary sequence `ℕ → O Cut`: a self-map's residual composed with any sequence
  vanishes only at `0`, is `(−2)•(·)`, is injective on the sequence's points, and has positive Born
  self-overlap on the constant-unit sequence. Every TYPE cites the banked derived objects (`O Cut`,
  `IsFold`, `foldResidual`, `gFormC`, `Cut`), never generic over an arbitrary carrier/sequence.

  NOT FREE-FLOATING (docs/STANDARD.md §3). The trajectory TYPE is about the ACTUAL banked `O Cut`
  residual `foldResidual` and the banked `Cut` scalar and the banked `gFormC`, composed with a
  sequence into the banked carrier `ℕ → O Cut` — NOT generic over an arbitrary carrier or an abstract
  sequence into an abstract module.

  DEPENDENCIES (all banked, foundations-only): R2 `StandpointResidual` (`foldResidual`,
  `foldResidual_eq_zero_iff`, `foldResidual_eq_neg_two_smul`, `foldResidual_one_pos`, `gFormC`); N1
  `Foundation.Fold` (`IsFold`, transitively); the derived continuum `Cut` (`ContinuumQ`) and the
  terminal carrier `O Cut` (`Cascade.Octonion`). Ground the DERIVED `Cut`; NOT Mathlib-ℝ as content;
  Mathlib is MACHINERY only.

  Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No posited axiom, no
  proof-hole, no kernel-trust bypass, no heartbeat inflation, no Mathlib number-system content
  import, no bridge.
-/
import Phys.Algebra.StandpointResidual

namespace Phys.Algebra.StandpointTrajectory

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.StandpointResidual

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## (c) ★ THE CROSS-TIE TO THE BANKED R2 LINEARITY — the residual scales WITH the state. -/

/-- ★ (c) THE TRAJECTORY LINEARITY: at every index of any trajectory, `res (γ t) = (−2 : Cut) • γ t`.
    A direct assembly on the banked `foldResidual_eq_neg_two_smul` (R2c). The scalar `(−2)` is
    TIME-INDEPENDENT: no evolution diminishes the miss relative to what carries it. Words-removable:
    `look − id` composed with a sequence equals `(−2)•(·)` at every index. -/
theorem trajectory_residual_eq_neg_two_smul {look : O Cut → O Cut} (h : IsFold look)
    (γ : ℕ → O Cut) (t : ℕ) : foldResidual look (γ t) = (-2 : Cut) • γ t :=
  foldResidual_eq_neg_two_smul h (γ t)

/-! ## (a) THE TRAJECTORY QUANTIFICATION — the residual vanishes only at the void, at every time. -/

/-- (a) THE TRAJECTORY QUANTIFICATION: at EVERY index `t` of ANY trajectory `γ : ℕ → O Cut` (under NO
    assumed dynamics), `res (γ t) = 0 ↔ γ t = 0`. The zero-residual point of any trajectory is the
    void and nothing else. Assembly on the banked `foldResidual_eq_zero_iff` (R2). The strength is
    the quantifier over ALL sequences: whatever the dynamics, the void is the only self-coincidence.
    Words-removable: `look − id` composed with any sequence vanishes only where the sequence is `0`. -/
theorem trajectory_residual_eq_zero_iff {look : O Cut → O Cut} (h : IsFold look)
    (γ : ℕ → O Cut) (t : ℕ) : foldResidual look (γ t) = 0 ↔ γ t = 0 :=
  foldResidual_eq_zero_iff h (γ t)

/-! ## (b) THE LIVE-BITE COROLLARY (W8) — nonzero point ⟹ nonzero residual. -/

/-- (b) THE LIVE-BITE COROLLARY (W8): on any nonzero trajectory point the residual is nonzero,
    `γ t ≠ 0 → res (γ t) ≠ 0`. The contrapositive of the void-only law (a): no live state along any
    trajectory coincides with its own look-back. Words-removable: a nonzero point of any sequence has
    nonzero `(look − id)`-image. -/
theorem trajectory_residual_ne_zero {look : O Cut → O Cut} (h : IsFold look)
    (γ : ℕ → O Cut) (t : ℕ) (ht : γ t ≠ 0) : foldResidual look (γ t) ≠ 0 :=
  fun hc => ht ((trajectory_residual_eq_zero_iff h γ t).mp hc)

/-! ## (★) THE TRAJECTORY-SEPARATION WELD — the residual is a faithful diachronic coordinate. -/

/-- ★ THE TRAJECTORY-SEPARATION WELD (the genuine never-co-stated content). For ANY two indices
    `s, t` of any trajectory, `res (γ s) = res (γ t) ↔ γ s = γ t`: the residual is a FAITHFUL
    diachronic coordinate — no dynamics can make two distinct states share a miss, and none can give
    one state two misses. Forward: equal misses give `(−2)•(γ s) = (−2)•(γ t)` (linearity (c)), hence
    `res (γ s − γ t) = (−2)•(γ s − γ t) = 0`, hence `γ s − γ t = 0` by the void-only law (a) at the
    difference. This is BINARY in the time index — a statement about PAIRS of times — so it is NOT a
    pointwise re-quantification of R2: it needs BOTH banked faces (a) AND (c) together. The diachronic
    reading of "no evolution diminishes the miss relative to what carries it". Words-removable:
    `(look − id)` composed with a sequence separates the sequence's points exactly as they stand. -/
theorem trajectory_residual_separates {look : O Cut → O Cut} (h : IsFold look)
    (γ : ℕ → O Cut) (s t : ℕ) :
    foldResidual look (γ s) = foldResidual look (γ t) ↔ γ s = γ t := by
  constructor
  · intro hst
    have h2 : (-2 : Cut) • γ s = (-2 : Cut) • γ t := by
      rw [← foldResidual_eq_neg_two_smul h, ← foldResidual_eq_neg_two_smul h]; exact hst
    have hdiff : foldResidual look (γ s - γ t) = 0 := by
      rw [foldResidual_eq_neg_two_smul h, smul_sub, h2, sub_self]
    exact sub_eq_zero.mp ((foldResidual_eq_zero_iff h (γ s - γ t)).mp hdiff)
  · intro hst; rw [hst]

/-! ## NON-VACUITY (W8) — the miss along a concrete live trajectory is Born-positive at every time. -/

/-- NON-VACUITY (W8), realized. On the concrete constant-unit trajectory `γ = fun _ => 1`, the
    residual's Born self-overlap is strictly positive at EVERY time (`= 4 · gFormC 1 1 = 4`, via the
    banked `foldResidual_one_pos`, R2). The ineliminable self-miss along a live trajectory is realized
    on a concrete nonzero trajectory, not vacuously. -/
theorem trajectory_one_residual_born_pos {look : O Cut → O Cut} (h : IsFold look) (t : ℕ) :
    0 < gFormC (foldResidual look ((fun _ : ℕ => (1 : O Cut)) t))
              (foldResidual look ((fun _ : ℕ => (1 : O Cut)) t)) := by
  show 0 < gFormC (foldResidual look (1 : O Cut)) (foldResidual look (1 : O Cut))
  exact foldResidual_one_pos h

/-! ## Capstone — the trajectory theorem: the residual through time, under any dynamics. -/

/-- ★★★ THE TRAJECTORY THEOREM (arc-S S1), bundled. For any fold `look` on the banked terminal
    carrier `O Cut` and ANY trajectory `γ : ℕ → O Cut` under NO assumed dynamics:
      (a) the residual vanishes at an index ONLY at the void (`trajectory_residual_eq_zero_iff`);
      (b) hence is nonzero on every nonzero trajectory point (`trajectory_residual_ne_zero`, W8);
      (c) is `(−2)•(γ t)` at every index — the same time-independent scalar
          (`trajectory_residual_eq_neg_two_smul`);
      (★) and is a FAITHFUL diachronic coordinate — separates any two trajectory points exactly as
          the states stand (`trajectory_residual_separates`, the genuine binary weld of (a) and (c)).
    The absence of any assumed dynamics IS the strength: no evolution law can escape the residual, and
    none can diminish the miss relative to what carries it. THEOREM-route, NON-HOLLOW (the separation
    weld is a genuine binary statement statable from neither (a) nor (c) alone). NO identification
    (G7 firewall — deferred to S8). Words-removable: pure facts about `look − id` composed with an
    arbitrary sequence into the banked `O Cut`. -/
theorem trajectory_structure {look : O Cut → O Cut} (h : IsFold look) :
    (∀ (γ : ℕ → O Cut) (t : ℕ), foldResidual look (γ t) = 0 ↔ γ t = 0)
    ∧ (∀ (γ : ℕ → O Cut) (t : ℕ), γ t ≠ 0 → foldResidual look (γ t) ≠ 0)
    ∧ (∀ (γ : ℕ → O Cut) (t : ℕ), foldResidual look (γ t) = (-2 : Cut) • γ t)
    ∧ (∀ (γ : ℕ → O Cut) (s t : ℕ),
        foldResidual look (γ s) = foldResidual look (γ t) ↔ γ s = γ t) :=
  ⟨fun γ t => trajectory_residual_eq_zero_iff h γ t,
   fun γ t ht => trajectory_residual_ne_zero h γ t ht,
   fun γ t => trajectory_residual_eq_neg_two_smul h γ t,
   fun γ s t => trajectory_residual_separates h γ s t⟩

end

end Phys.Algebra.StandpointTrajectory
