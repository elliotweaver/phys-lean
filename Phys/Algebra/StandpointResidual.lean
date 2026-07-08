/-
  Phys.Algebra.StandpointResidual — N446 (arc-R R2): THE RESIDUAL (no self-coincidence).
  ============================================================================================
  ARC R — THE STANDPOINT (the inside read of the banked gather). R1 (N445) banked the existence of
  a LOCAL closure (the standpoint stratum). R2 reads the FIRST intrinsic fact the trunk forces about
  a live state: it never coincides with its own look-back. The fold's founding law (N1: a state and
  its look-back annihilate, `look x + x = 0`) means the SELF-RESIDUAL `res x := look x − x` measures
  the ineliminable self-miss of a state, and it vanishes ONLY at the void.

  On the banked terminal carrier `O Cut = CD (CD (Dbl Cut))` over the DERIVED continuum `Cut`
  (never Mathlib-ℝ as content), for any fold `look` (`IsFold`, N1):

    foldResidual look x := look x − x          — the self-residual (`look − id`).

    (a) foldResidual_eq_zero_iff  — `res x = 0 ↔ x = 0`. The residual VANISHES ONLY AT THE VOID,
        the forbidden fixed point. Route: `res x = 0 ↔ look x = x` (`sub_eq_zero`), then the banked
        `fold_self_blind` (N1) — on a 2-torsion-free carrier the look-back has no nonzero fixed
        point. The 2-torsion-freeness of `O Cut` is LIFTED through the two Cayley–Dickson doublings
        from the derived `Cut`'s own 2-torsion-freeness (`cut_add_self_zero`, N-Rotation) via
        `Dbl.two_torsion_free` — load-bearing exactly as in N1 (false without it: the char-2
        companion `fold_char2_has_nonzero_fixed`).

    (c) foldResidual_eq_neg_two_smul  — ★ the residual is LINEAR in the state: `res x = (−2)•x`.
        DERIVED from `fold_eq_neg` (the fold law FORCES `look x = −x`), NOT posited. So the residual
        is a fixed linear image of the state; no evolution can shrink it relative to the state —
        "minimizing the miss" terminates only at the void. (No minimization principle is posited;
        the linear identity replaces it.)

    (b) foldResidual_born_pos  — the residual's BORN SELF-OVERLAP is strictly positive on every
        nonzero state: `x ≠ 0 → 0 < gFormC (res x) (res x)`. A live state carries an ineliminable,
        Born-measurable self-miss. Route: (a) gives `res x ≠ 0`, then the banked Born positivity
        `gFormC_pos_of_ne_zero` (N56 — Born = self-overlap = positivity).

    (★) foldResidual_born_eq  — THE WELD (non-hollow content, statable from neither (b) nor (c)
        alone): the residual's Born self-overlap is EXACTLY four times the state's own,
        `gFormC (res x) (res x) = 4 · gFormC x x`. The miss's magnitude is a fixed positive multiple
        of the state's magnitude — the linearity (c) pulls the scalar `(−2)` out of both slots of the
        Born form (bilinearity, N-LieAlgebra), squaring to `4`. Binds the residual's magnitude to the
        state's; from it, (b)'s strict positivity and the unit non-vacuity both follow.

    foldResidualMap / foldResidualMap_apply  — the residual AS a `Cut`-linear endomorphism
        `(−2)•id` of `O Cut`, agreeing with `res` on every fold — the linearity (c) as a TYPE fact
        on the banked module.

  ⚠ GRADE / FIREWALL. THEOREM-route, pure structure. NO identification anywhere (deferred to R8,
  guard G7 — the IDENTIFICATION FIREWALL). No theorem here mentions or depends on any identification.
  MIND-WORDS-REMOVABLE: delete "standpoint / self / miss / inside / live state" → pure facts about
  `look − id` on `O Cut`: a self-map's residual vanishes only at `0`, is `(−2)•id`, and has Born
  self-overlap `4·gFormC x x`. Every TYPE cites the banked derived objects (`O Cut`, `IsFold`,
  `gFormC`), never generic over an arbitrary carrier.

  Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No posited axiom, no
  proof-hole, no kernel-trust bypass, no bridge, NO Mathlib number-system content import.
-/
import Phys.Algebra.LorentzContinuumLieAlgebra
import Phys.Algebra.LorentzContinuumPolar
import Phys.Cascade.ComplexUnit

namespace Phys.Algebra.StandpointResidual

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## 2-torsion-freeness of the terminal carrier — lifted from the derived `Cut` through the tower. -/

/-- ONE Cayley–Dickson doubling PRESERVES 2-torsion-freeness (componentwise): if the base `A` has no
    2-torsion, neither does `CD A`. Machinery mirroring `Dbl.two_torsion_free`, at the outer
    doublings. -/
theorem cd_two_torsion_free {A : Type*} [Add A] [Zero A]
    (htf : ∀ a : A, a + a = 0 → a = 0) :
    ∀ y : CD A, y + y = 0 → y = 0 := by
  intro y hy
  have hre : y.re + y.re = 0 := by have := congrArg CD.re hy; simpa using this
  have him : y.im + y.im = 0 := by have := congrArg CD.im hy; simpa using this
  ext
  · exact htf y.re hre
  · exact htf y.im him

/-- The terminal carrier `O Cut = CD (CD (Dbl Cut))` is 2-TORSION-FREE — the hypothesis
    `fold_self_blind` (N1) needs, lifted through the two outer doublings from the derived continuum
    `Cut`'s own 2-torsion-freeness (`cut_add_self_zero`, N-Rotation) via `Dbl.two_torsion_free`. This
    is the load-bearing fact for (a) below, exactly as in N1. -/
theorem oCut_two_torsion_free : ∀ y : O Cut, y + y = 0 → y = 0 :=
  cd_two_torsion_free
    (cd_two_torsion_free (Dbl.two_torsion_free (fun _ h => cut_add_self_zero h)))

/-! ## The self-residual `res x := look x − x` on the banked terminal carrier. -/

/-- THE SELF-RESIDUAL of a fold: `res x := look x − x` on the banked `O Cut`. The `look − id`
    difference — how far the look-back of a state lands from the state itself. Words-removable: the
    difference of a self-map and the identity. -/
def foldResidual (look : O Cut → O Cut) (x : O Cut) : O Cut := look x - x

/-- ★ (c) THE RESIDUAL IS LINEAR IN THE STATE: `res x = (−2)•x`. DERIVED from `fold_eq_neg` (the fold
    law N1 FORCES `look x = −x`), so `res x = −x − x = (−2)•x`. NOT posited — no minimization
    principle: the residual is a fixed `Cut`-linear image of the state, so no evolution diminishes it
    relative to the state; "minimizing the miss" can terminate only at the void. -/
theorem foldResidual_eq_neg_two_smul {look : O Cut → O Cut} (h : IsFold look) (x : O Cut) :
    foldResidual look x = (-2 : Cut) • x := by
  unfold foldResidual
  rw [fold_eq_neg h x, neg_smul, two_smul]
  abel

/-- (a) THE RESIDUAL VANISHES ONLY AT THE VOID: `res x = 0 ↔ x = 0`. Forward: `res x = 0 ↔ look x = x`
    (`sub_eq_zero`), then the banked `fold_self_blind` (N1) on the 2-torsion-free `O Cut`
    (`oCut_two_torsion_free`) — the look-back has NO nonzero fixed point. Backward: `look 0 = 0`
    (`fold_void`). The forbidden fixed point of the fold is the void, re-instantiated at the terminal
    carrier. -/
theorem foldResidual_eq_zero_iff {look : O Cut → O Cut} (h : IsFold look)
    (x : O Cut) : foldResidual look x = 0 ↔ x = 0 := by
  unfold foldResidual
  rw [sub_eq_zero]
  constructor
  · intro hx; exact fold_self_blind h oCut_two_torsion_free x hx
  · intro hx; rw [hx, fold_void h]

/-- ★ THE BORN WELD (non-hollow content — statable from neither the positivity nor the linearity
    alone): the residual's BORN SELF-OVERLAP is EXACTLY FOUR TIMES the state's own,
    `gFormC (res x) (res x) = 4 · gFormC x x`. The linearity (c) pulls the scalar `(−2)` out of both
    slots of the Born form (`gFormC_smul_left`/`gFormC_smul_right`, N-LieAlgebra bilinearity),
    squaring to `4`. The miss's magnitude is a FIXED POSITIVE MULTIPLE of the state's magnitude. -/
theorem foldResidual_born_eq {look : O Cut → O Cut} (h : IsFold look) (x : O Cut) :
    gFormC (foldResidual look x) (foldResidual look x) = 4 * gFormC x x := by
  rw [foldResidual_eq_neg_two_smul h, gFormC_smul_left, gFormC_smul_right]
  ring

/-- (b) THE RESIDUAL'S BORN SELF-OVERLAP IS STRICTLY POSITIVE ON EVERY NONZERO STATE:
    `x ≠ 0 → 0 < gFormC (res x) (res x)`. A live state carries an ineliminable, Born-measurable
    self-miss. Route: (a) gives `res x ≠ 0`, then the banked Born positivity `gFormC_pos_of_ne_zero`
    (N56 — Born = self-overlap = positivity). -/
theorem foldResidual_born_pos {look : O Cut → O Cut} (h : IsFold look)
    {x : O Cut} (hx : x ≠ 0) :
    0 < gFormC (foldResidual look x) (foldResidual look x) := by
  have hne : foldResidual look x ≠ 0 := fun hc => hx ((foldResidual_eq_zero_iff h x).mp hc)
  exact gFormC_pos_of_ne_zero hne

/-- NON-VACUITY (W8): the residual's Born self-overlap BITES on the concrete unit — `0 < gFormC
    (res 1) (res 1)` (`= 4 · gFormC 1 1 = 4`). The ineliminable self-miss is realized on a concrete
    nonzero state, not vacuously. -/
theorem foldResidual_one_pos {look : O Cut → O Cut} (h : IsFold look) :
    0 < gFormC (foldResidual look (1 : O Cut)) (foldResidual look 1) := by
  rw [foldResidual_born_eq h, gFormC_one]; norm_num

/-! ## The residual as a `Cut`-linear endomorphism — the linearity as a TYPE fact. -/

/-- THE RESIDUAL MAP `(−2)•id` on the banked `O Cut`-module — the residual (c) AS a `Cut`-linear
    endomorphism, independent of the choice of fold (all folds coincide, `fold_unique` N1). -/
def foldResidualMap : Module.End Cut (O Cut) := (-2 : Cut) • LinearMap.id

/-- The residual map AGREES with the self-residual of ANY fold on every state: `foldResidualMap x =
    res x`. The linearity (c) promoted to a TYPE fact on the banked module. -/
theorem foldResidualMap_apply {look : O Cut → O Cut} (h : IsFold look) (x : O Cut) :
    foldResidualMap x = foldResidual look x := by
  show (-2 : Cut) • (LinearMap.id x) = _
  rw [LinearMap.id_apply, foldResidual_eq_neg_two_smul h]

/-! ## Capstone — the residual is a genuine, Born-positive, linear, void-only self-miss. -/

/-- ★★★ THE RESIDUAL (arc-R R2), bundled. For any fold `look` on the banked terminal carrier `O Cut`:
    (a) the self-residual vanishes ONLY at the void; (c) it is `Cut`-linear (`(−2)•x`); (★) its Born
    self-overlap is exactly `4·gFormC x x`; (b) hence strictly positive on every nonzero state; and
    (W8) it bites on the unit. The ineliminable self-miss of a live state, DERIVED from the fold — no
    minimization principle posited. -/
theorem foldResidual_structure {look : O Cut → O Cut} (h : IsFold look) :
    (∀ x : O Cut, foldResidual look x = 0 ↔ x = 0) ∧
    (∀ x : O Cut, foldResidual look x = (-2 : Cut) • x) ∧
    (∀ x : O Cut, gFormC (foldResidual look x) (foldResidual look x) = 4 * gFormC x x) ∧
    (∀ x : O Cut, x ≠ 0 → 0 < gFormC (foldResidual look x) (foldResidual look x)) ∧
    (0 < gFormC (foldResidual look (1 : O Cut)) (foldResidual look 1)) :=
  ⟨fun x => foldResidual_eq_zero_iff h x,
   fun x => foldResidual_eq_neg_two_smul h x,
   fun x => foldResidual_born_eq h x,
   fun _ hx => foldResidual_born_pos h hx,
   foldResidual_one_pos h⟩

end

end Phys.Algebra.StandpointResidual
