/-
  Phys.Algebra.StandpointTower — N### (arc-R R4): THE TOWER TERMINATION
  (what ends the regress: a cover, not a fixed point).
  ============================================================================================
  ARC R — THE STANDPOINT (the inside read of the banked gather). R1 (N445) banked the EXISTENCE
  of a local closure (the standpoint stratum). R2 (N446) banked the ineliminable self-miss (the
  residual vanishes only at the void). R3 (N447) banked the CHANNEL QUOTIENT — no vantage recovers
  the discarded fibre coordinate, and enlarging the carrier to "include the watcher" merely
  RE-INSTANTIATES the fold's self-blindness one level up (the blindness is CONSERVED). R4 reads what
  ENDS the resulting regress: since every enlargement reproduces the blindness, there is no LEVEL at
  which self-representation completes — yet a closure is achieved, by a COVER rather than a fixed
  point.

  The escape from the regress is NOT a completed self-representation. A completed self-representation
  would be a nonzero fixed point of the look-back — exactly what C6 / self-blindness (N1
  `fold_self_blind`) forbids. Instead the banked complex structure `J` (`foldComplex`, N392 / N2)
  COVERS the look-back: `J ∘ J` IS the look-back (`foldComplex_sq`), while `J` itself has no nonzero
  fixed point (`foldComplex_self_blind`). One object read twice — without `J` the tower of
  distinguished representers collapses to EMPTY; with `J` the look-back is closed-without-fixing.

  On the banked 2D fibre `StateFibre = Cut × Cut` over the DERIVED continuum `Cut` (never Mathlib-ℝ
  as content), with the banked forced complex structure `foldComplex = J₂` (N392/N2):

    (a) THE WELL-FOUNDED COLLAPSE (the abstract shadow of self-blindness).
        distinguished_empty  — the generic, self-contained order tool: on ANY well-founded relation
          `r`, if every distinguished element has a distinguished element strictly `r`-below it, then
          the distinguished class is EMPTY (`∀ x, ¬ D x`). A well-founded-induction collapse.
        no_completed_tower  — the concrete instantiation on the well-founded order `(ℕ, <)`: there is
          NO nonempty class `D` closed under "has a strictly-smaller member of `D`". No regress of
          representers, each requiring a strictly-prior distinguished representer, can be nonempty —
          i.e. no completed self-representation tower exists. (This is the abstract/order shadow of
          the fold's self-blindness — the same "no completion" fact, one level up from the carrier.)

    (b) ★ THE COVER — THE BANKED `J` READ TWICE (the J-R4 citation-and-weld).
        lookback_no_live_fixed_point  — the STATE-LEVEL "no completion": on the fibre, the look-back
          of any fold has NO live fixed point (`look p = p → p = 0`), the banked `fold_self_blind`
          (N1) re-cited via `fibre_two_torsion_free`.
        foldComplex_covers_fold  — ★ THE COVER: for any fold `look` on the fibre, `J (J p) = look p`.
          The banked `foldComplex_sq` (`J² = −id`) welded to the banked `fold_eq_neg` (`look = −id`):
          `J` composed with itself IS the look-back. The regress is closed by `J` AS A COVER of the
          look-back, not by any completed level.
        cover_fixed_point_free  — the SAME `J` fixes nothing live (`p ≠ 0 → J p ≠ p`), the banked
          `foldComplex_self_blind` (N392) re-cited. So `J` is a genuine cover of the look-back that is
          itself NOT a completed self-representation (it has no nonzero fixed point).

    (★) termination_by_cover_not_fixed_point  — THE WELD (non-hollow content; statable from NEITHER
        the well-founded tool NOR a pure `J` fact alone). On EVERY live state `p ≠ 0`, all three hold
        together on the SAME `p` and the SAME banked `J`: (i) NO completion — the look-back does not
        fix `p` (`look p ≠ p`); (ii) COVER — `J (J p) = look p`; (iii) `J` fixes nothing live
        (`J p ≠ p`). The regress terminates by the cover `J`, whose square is the look-back yet which
        is fixed-point-free — the closure the tower could never reach as a fixed point, reached as a
        cover. Binds the state-level no-completion (`fold_self_blind`) to the banked cover
        (`foldComplex_sq`) and the banked fixed-point-freeness (`foldComplex_self_blind`).

    tower_termination  — ★★★ THE CAPSTONE (arc-R R4), bundling (a) the empty tower, (b) the
        state-level no-completion, the cover `J²=look`, and (★) the per-live-state weld.

  ⚠ GRADE / FIREWALL (G7 — THE IDENTIFICATION FIREWALL). THEOREM-route, pure structure. NO
  identification anywhere (deferred to R8). No theorem here mentions or depends on any identification.
  MIND-WORDS-REMOVABLE (G4): delete "standpoint / tower / regress / representer / cover / self /
  inside" → pure mathematics: a well-founded relation with the descent-closure property has empty
  distinguished class; on `(ℕ,<)` no nonempty descent-closed class exists; on the banked fibre the
  negation map has no nonzero fixed point, the banked operator `foldComplex` satisfies
  `foldComplex ∘ foldComplex = look` for every fold `look` and `foldComplex p = p → p = 0`. Every
  banked TYPE cites the derived objects (`StateFibre`, `foldComplex`, `IsFold`, `fold_self_blind`),
  never generic over an arbitrary carrier where the content is about the banked `J`. The order tool
  (a) is deliberately generic (the abstract shadow) and INSTANTIATED to `(ℕ,<)` as its non-vacuity.

  Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No posited axiom, no
  proof-hole, no kernel-trust bypass, no bridge, NO Mathlib number-system content import. `J` = the
  banked forced complex structure `foldComplex` (N392) = the cascade complex unit `J₂` (N2); it is
  CITED and WELDED here, never re-derived.
-/
import Phys.Quantum.ComplexStructure
import Mathlib.Order.WellFounded
import Mathlib.Tactic

namespace Phys.Algebra.StandpointTower

open Phys.Foundation Phys.Cascade Phys.Quantum
open Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (a) THE WELL-FOUNDED COLLAPSE — the abstract shadow of self-blindness. -/

/-- (a-tool) THE WELL-FOUNDED COLLAPSE. On ANY well-founded relation `r`, if every element of a
    class `D` has an element of `D` strictly `r`-below it, then `D` is EMPTY. A well-founded-induction
    collapse: a class closed under strict `r`-descent cannot be inhabited. Self-contained order
    machinery; instantiated to `(ℕ, <)` below as its concrete non-vacuity. Words-removable: pure
    well-founded-order fact. -/
theorem distinguished_empty {α : Type*} {r : α → α → Prop} (hwf : WellFounded r)
    {D : α → Prop} (hstep : ∀ x, D x → ∃ y, D y ∧ r y x) (x : α) : ¬ D x := by
  refine hwf.induction (C := fun z => ¬ D z) x ?_
  intro z IH hDz
  obtain ⟨y, hDy, hyz⟩ := hstep z hDz
  exact IH y hyz hDy

/-- (a) NO COMPLETED TOWER. On the well-founded order `(ℕ, <)` there is NO nonempty class `D` closed
    under "has a strictly-smaller member of `D`". No regress of distinguished representers — each
    requiring a strictly-prior distinguished representer — can be nonempty. The abstract/order shadow
    of the fold's self-blindness: no completed self-representation exists. Words-removable: no
    nonempty `<`-descent-closed subset of `ℕ`. -/
theorem no_completed_tower :
    ¬ ∃ D : ℕ → Prop, (∃ n, D n) ∧ (∀ n, D n → ∃ m, D m ∧ m < n) := by
  rintro ⟨D, ⟨x, hx⟩, hstep⟩
  exact distinguished_empty wellFounded_lt hstep x hx

/-! ## (b) THE COVER — the banked `J = foldComplex` read twice. -/

/-- The banked 2D fibre is 2-TORSION-FREE (componentwise from the derived `Cut`'s 2-torsion-freeness
    via `two_smul`). The hypothesis `fold_self_blind` (N1) needs on `StateFibre`. -/
theorem fibre_two_torsion_free : ∀ y : StateFibre, y + y = 0 → y = 0 := by
  intro y hy
  have : (2 : ContinuumQ.Cut) • y = 0 := by rw [two_smul]; exact hy
  simpa using this

/-- (b) STATE-LEVEL NO COMPLETION. On the fibre, the look-back of any fold has NO live fixed point:
    `look p = p → p = 0`. A completed self-representation would BE such a fixed point — forbidden by
    the banked `fold_self_blind` (N1), re-cited via `fibre_two_torsion_free`. Words-removable: the
    fold on `StateFibre` has no nonzero fixed point. -/
theorem lookback_no_live_fixed_point {look : StateFibre → StateFibre} (h : IsFold look)
    (p : StateFibre) (hp : look p = p) : p = 0 :=
  fold_self_blind h fibre_two_torsion_free p hp

/-- (b) ★ THE COVER: for any fold `look` on the fibre, `J (J p) = look p`. The banked
    `foldComplex_sq` (`J² = −id`, N392) welded to the banked `fold_eq_neg` (`look = −id`, N1): the
    complex structure `J` composed with itself IS the look-back. The regress is closed by `J` AS A
    COVER of the look-back — not by any completed level of self-representation. Words-removable:
    `foldComplex ∘ foldComplex = look` for the (unique) fold. -/
theorem foldComplex_covers_fold {look : StateFibre → StateFibre} (h : IsFold look) (p : StateFibre) :
    foldComplex (foldComplex p) = look p := by
  rw [foldComplex_sq, fold_eq_neg h]

/-- (b) THE COVER IS NOT A COMPLETION: the SAME `J` fixes nothing live (`p ≠ 0 → J p ≠ p`). The
    banked `foldComplex_self_blind` (N392) re-cited — `J` covers the look-back yet is itself
    fixed-point-free, so it is a genuine cover and NOT a completed self-representation.
    Words-removable: `foldComplex` has no nonzero fixed point. -/
theorem cover_fixed_point_free {p : StateFibre} (hp : p ≠ 0) : foldComplex p ≠ p :=
  fun hfix => hp (foldComplex_self_blind p hfix)

/-! ## (★) THE WELD — termination by cover, not fixed point, on every live state. -/

/-- ★ THE WELD (non-hollow content — statable from NEITHER the well-founded tool (a) NOR a pure `J`
    fact alone). On EVERY live state `p ≠ 0`, all three hold together on the SAME `p` and the SAME
    banked `J = foldComplex`:
      (i)   NO COMPLETION — the look-back does not fix `p` (`look p ≠ p`), from
            `lookback_no_live_fixed_point` (banked `fold_self_blind`);
      (ii)  COVER — `J (J p) = look p` (`foldComplex_covers_fold`, banked `foldComplex_sq`);
      (iii) `J` FIXES NOTHING LIVE — `J p ≠ p` (`cover_fixed_point_free`, banked
            `foldComplex_self_blind`).
    The regress terminates by the cover `J`, whose square IS the look-back yet which is itself
    fixed-point-free: the closure the tower could never reach as a fixed point, reached instead as a
    cover. One object (`J`) read twice — the same map is the square-root cover of the look-back and
    the fixed-point-free operator. Binds the state-level no-completion to the banked cover and the
    banked fixed-point-freeness; neither (a) nor a single `J` fact yields it alone. -/
theorem termination_by_cover_not_fixed_point {look : StateFibre → StateFibre} (h : IsFold look)
    {p : StateFibre} (hp : p ≠ 0) :
    look p ≠ p ∧ foldComplex (foldComplex p) = look p ∧ foldComplex p ≠ p :=
  ⟨fun hfix => hp (lookback_no_live_fixed_point h p hfix),
   foldComplex_covers_fold h p,
   cover_fixed_point_free hp⟩

/-! ## NON-VACUITY (W8) — the fold exists; the weld bites concretely. -/

/-- NON-VACUITY: negation is a fold on the fibre (`neg_isFold`), so the `∀`-quantified fold facts
    above are inhabited, not vacuous. -/
theorem fibre_neg_isFold : IsFold (fun p : StateFibre => -p) := neg_isFold

/-- [W8] THE WELD BITES on the concrete live state `eInward` under the negation fold: the look-back
    `-eInward` differs from `eInward`, `J (J eInward) = -eInward`, and `J eInward ≠ eInward`. The
    termination-by-cover weld is realized on a concrete carrier and a concrete state, not vacuously. -/
theorem termination_by_cover_bites :
    (fun p : StateFibre => -p) eInward ≠ eInward
    ∧ foldComplex (foldComplex eInward) = (fun p : StateFibre => -p) eInward
    ∧ foldComplex eInward ≠ eInward :=
  termination_by_cover_not_fixed_point fibre_neg_isFold (by
    intro h; have : (1 : ContinuumQ.Cut) = 0 := congrArg Prod.fst h; exact one_ne_zero this)

/-! ## THE CAPSTONE — the tower terminates by cover, not by fixed point. -/

/-- ★★★ THE TOWER TERMINATION (arc-R R4), bundled. On the banked fibre `StateFibre` with the banked
    forced complex structure `J = foldComplex` (N392 = N2):
      (a) NO COMPLETED TOWER — the regress of distinguished representers collapses to EMPTY (no
          nonempty `<`-descent-closed class on `ℕ`; `no_completed_tower`);
      (b) STATE-LEVEL NO COMPLETION — the look-back of any fold fixes no live state
          (`lookback_no_live_fixed_point`); yet
      (b) COVER — `J ∘ J` IS the look-back (`foldComplex_covers_fold`); and
      (★) TERMINATION BY COVER — on every live state, no-completion, cover, and `J`'s
          fixed-point-freeness hold together on the same `J` (`termination_by_cover_not_fixed_point`).
    The escape from the regress is a COVER (the banked `J`, whose square is the look-back and which
    fixes nothing live), never a completed self-representation (a nonzero look-back fixed point,
    forbidden by C6). DERIVED and WELDED from the fold — the banked `J` facts are cited, not
    re-proved; no stopping posit, no completed totality. -/
theorem tower_termination {look : StateFibre → StateFibre} (h : IsFold look) :
    (¬ ∃ D : ℕ → Prop, (∃ n, D n) ∧ (∀ n, D n → ∃ m, D m ∧ m < n))
    ∧ (∀ p : StateFibre, look p = p → p = 0)
    ∧ (∀ p, foldComplex (foldComplex p) = look p)
    ∧ (∀ p : StateFibre, p ≠ 0 →
        look p ≠ p ∧ foldComplex (foldComplex p) = look p ∧ foldComplex p ≠ p) :=
  ⟨no_completed_tower,
   fun p hp => lookback_no_live_fixed_point h p hp,
   fun p => foldComplex_covers_fold h p,
   fun _ hp => termination_by_cover_not_fixed_point h hp⟩

end

end Phys.Algebra.StandpointTower
