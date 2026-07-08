/-
  Phys.Algebra.StandpointChannel — N447 (arc-R R3): THE CHANNEL QUOTIENT
  (what any observable of a state can carry).
  ============================================================================================
  ARC R — THE STANDPOINT (the inside read of the banked gather). R1 (N445) banked the EXISTENCE
  of a local closure (the standpoint stratum). R2 (N446) banked the FIRST intrinsic fact about a
  live state: its self-residual `res x := look x − x` vanishes ONLY at the void, is linear, and
  carries a Born-positive self-miss. R3 reads what any OBSERVABLE of a state can carry — and what
  happens when the carrier is enlarged to "include the watcher".

  On the banked terminal carrier `O Cut = CD (CD (Dbl Cut))` over the DERIVED continuum `Cut`
  (never Mathlib-ℝ as content), with the composite (system + observer) carrier `O Cut × O Cut`
  — the fibre/base split a TYPE fact, not a posit:

    (a) factors_through_proj_const_on_fibre  — ANY map factoring through the base projection is
        CONSTANT ON FIBRES: for any codomain `β` and any `g : O Cut → β`, if `p.1 = q.1` then
        `(g ∘ Prod.fst) p = (g ∘ Prod.fst) q`. A channel that reads only the projected data
        carries NOTHING about the fibre coordinate — no composite through the projection separates
        fibre-mates. The formal content of "an observable carries the projected data and nothing
        else", with the split a pure product-type fact.

    (b) no_section_detector  — NO SECTION-DETECTOR EXISTS: there is NO map `d : O Cut → O Cut`
        from the base recovering the fibre coordinate (`∀ p, d p.1 = p.2`). A short absurdity —
        the two points `(0,0)` and `(0,1)` share base `0` but differ in fibre (`0 ≠ 1`,
        `oCut_one_ne_zero`), so a single-valued `d 0` cannot equal both. This is the chain's own
        no-go, the SAME exclusion shape as the banked no-dial predictor (J4/C6,
        `outcome_not_phaseInvariant_function`): a would-be recovery map from the accessible
        (projected) data to a discarded coordinate cannot exist because the projection identifies
        what the recovery must separate.

    (c) ★ THE RECURSION — the blindness is CONSERVED under carrier enlargement. Enlarging the
        carrier to "include the watcher" is passing from `O Cut` to the composite `O Cut × O Cut`.
        - prod_two_torsion_free: the composite carrier is 2-torsion-free (componentwise from the
          banked `oCut_two_torsion_free`, N446 — lifted from the derived `Cut`).
        - prod_fold_self_blind: RE-INSTANTIATE the banked `fold_self_blind` (N1) at the composite
          level — on the enlarged carrier the look-back STILL has no nonzero fixed point. Enlarging
          the carrier to swallow the observer does NOT buy a vantage where a live state coincides
          with its own look-back; the self-blindness reappears one level up.

    (★) watcher_invisible_yet_blind  — THE WELD (non-hollow content, statable from NEITHER the
        projection fact NOR the self-blindness fact alone). For any fold `look` on the composite
        carrier there is a PURE-FIBRE state `w = (0,1)` with `w.1 = 0.1` (invisible to the base
        projection — same base as the void, so (a) makes every base-channel identify it with `0`),
        yet `w ≠ 0` (`oCut_one_ne_zero`) AND `look w ≠ w` (the fold moves it — `prod_fold_self_blind`
        applied backwards). So the pure-watcher coordinate is simultaneously (i) undetectable from
        the base and (ii) a genuine live state the composite fold still misses. Invisibility to the
        channel and irreducibility of the miss are the SAME state — the blindness the fold has of
        its own fibre is exactly the data the channel cannot carry. This binds fibre-nontriviality
        (`oCut_one_ne_zero`) to the composite self-blindness (`prod_fold_self_blind`); neither
        (a) nor (c) yields it alone.

  ⚠ GRADE / FIREWALL. THEOREM-route, pure structure. NO identification anywhere (deferred to R8,
  guard G7 — the IDENTIFICATION FIREWALL). No theorem here mentions or depends on any identification.
  MIND-WORDS-REMOVABLE (G4): delete "channel / observable / carry / observer / watcher / section /
  detector / inside" → pure facts about the product carrier `O Cut × O Cut`: a map through
  `Prod.fst` is constant on `Prod.fst`-fibres; no map from the first component equals the second
  everywhere (the second component is nontrivial); `O Cut × O Cut` is 2-torsion-free and its unique
  fold has no nonzero fixed point; the element `(0,1)` has first component `0`, is nonzero, and is
  moved by the fold. Every TYPE cites the banked derived objects (`O Cut`, `IsFold`,
  `oCut_two_torsion_free`, `fold_self_blind`), never generic over an arbitrary carrier.

  Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No posited axiom, no
  proof-hole, no kernel-trust bypass, no bridge, NO Mathlib number-system content import.
-/
import Phys.Algebra.StandpointResidual

namespace Phys.Algebra.StandpointChannel

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra Phys.Algebra.StandpointResidual

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The terminal carrier's unit is live (fibre-nontriviality — the (b) and (★) teeth). -/

/-- The terminal carrier's unit is LIVE: `(1 : O Cut) ≠ 0`. From the banked Born positivity
    `gFormC_one_pos` (`0 < gFormC 1 1`): if `1 = 0` then `gFormC 1 1 = gFormC 0 1 = 0`
    (`gFormC_zero_left`), contradicting strict positivity. The fibre coordinate `1` really is
    distinct from `0` — the fibre is genuinely nontrivial. -/
theorem oCut_one_ne_zero : (1 : O Cut) ≠ 0 := by
  intro h
  have hp := gFormC_one_pos
  rw [h, gFormC_zero_left] at hp
  exact lt_irrefl 0 hp

/-! ## (a) A CHANNEL THROUGH THE PROJECTION IS CONSTANT ON FIBRES. -/

/-- (a) ANY map factoring through the base projection is CONSTANT ON FIBRES. For any codomain `β`
    and any `g : O Cut → β`, if two composite states share their base coordinate (`p.1 = q.1`) then
    the channel `g ∘ Prod.fst` gives them the SAME reading. A channel reading only the projected
    (base) data carries NOTHING about the fibre coordinate — no composite through the projection
    separates fibre-mates. Words-removable: a map factoring through `Prod.fst` is constant on
    `Prod.fst`-fibres. -/
theorem factors_through_proj_const_on_fibre {β : Type*} (g : O Cut → β)
    (p q : O Cut × O Cut) (hbase : p.1 = q.1) :
    (g ∘ Prod.fst) p = (g ∘ Prod.fst) q := by
  simp only [Function.comp_apply, hbase]

/-! ## (b) NO SECTION-DETECTOR — the chain's own no-go (the J4/C6 exclusion shape). -/

/-- (b) NO SECTION-DETECTOR EXISTS: there is NO map `d : O Cut → O Cut` from the base that recovers
    the fibre coordinate (`∀ p, d p.1 = p.2`). The two composite states `(0,0)` and `(0,1)` share
    base `0` but differ in fibre (`0 ≠ 1`, `oCut_one_ne_zero`); a single-valued `d 0` cannot equal
    both. The SAME exclusion shape as the banked no-dial predictor (J4/C6): a recovery map from the
    accessible (projected) data to a discarded coordinate cannot exist, because the projection
    identifies exactly what the recovery would have to separate. Words-removable: no map from the
    first component equals the second everywhere (the second component is nontrivial). -/
theorem no_section_detector :
    ¬ ∃ d : O Cut → O Cut, ∀ p : O Cut × O Cut, d p.1 = p.2 := by
  rintro ⟨d, hd⟩
  have h0 : d 0 = 0 := hd (0, 0)
  have h1 : d 0 = 1 := hd (0, 1)
  exact oCut_one_ne_zero (h0.symm.trans h1).symm

/-! ## (c) ★ THE RECURSION — the blindness is CONSERVED under carrier enlargement. -/

/-- (c-torsion) THE COMPOSITE CARRIER IS 2-TORSION-FREE. Enlarging the carrier to `O Cut × O Cut`
    preserves 2-torsion-freeness componentwise from the banked `oCut_two_torsion_free` (N446,
    lifted from the derived `Cut`). This is the hypothesis `fold_self_blind` needs at the composite
    level. -/
theorem prod_two_torsion_free : ∀ y : O Cut × O Cut, y + y = 0 → y = 0 := by
  intro y hy
  have h1 : y.1 + y.1 = 0 := by have := congrArg Prod.fst hy; simpa using this
  have h2 : y.2 + y.2 = 0 := by have := congrArg Prod.snd hy; simpa using this
  exact Prod.ext (oCut_two_torsion_free y.1 h1) (oCut_two_torsion_free y.2 h2)

/-- (c) ★ THE RECURSION: any carrier that folds is itself self-blind — RE-INSTANTIATE the banked
    `fold_self_blind` (N1) at the composite (system + observer) level. On the enlarged carrier
    `O Cut × O Cut` the look-back STILL has NO nonzero fixed point: `look x = x → x = 0`. Enlarging
    the carrier to "include the watcher" does NOT buy a vantage where a live state coincides with its
    own look-back — the self-blindness reappears one level up, unchanged. The blindness is
    CONSERVED, never eliminated. Route: the actual banked `fold_self_blind` on the banked
    `prod_two_torsion_free`. -/
theorem prod_fold_self_blind {look : O Cut × O Cut → O Cut × O Cut} (h : IsFold look)
    (x : O Cut × O Cut) (hx : look x = x) : x = 0 :=
  fold_self_blind h prod_two_torsion_free x hx

/-- ★ THE WELD (non-hollow content — statable from NEITHER the projection fact (a) NOR the
    self-blindness fact (c) alone). For any fold `look` on the composite carrier there is a
    PURE-FIBRE state `w = (0,1)` that is:
      (i)  BASE-INVISIBLE — `w.1 = (0 : O Cut × O Cut).1` (same base coordinate as the void), so by
           (a) EVERY channel through the base identifies `w` with `0`;
      (ii) LIVE — `w ≠ 0` (`oCut_one_ne_zero`, the fibre is nontrivial);
      (iii) MISSED — `look w ≠ w` (the composite fold moves it: were it fixed, `prod_fold_self_blind`
            would force `w = 0`, contradicting (ii)).
    The pure-watcher coordinate is SIMULTANEOUSLY undetectable from the base and a genuine live state
    the composite fold still misses. Invisibility to the channel and irreducibility of the miss are
    the SAME state — the fold's blindness of its own fibre is exactly the data the channel cannot
    carry. Binds fibre-nontriviality (`oCut_one_ne_zero`) to the composite self-blindness
    (`prod_fold_self_blind`); neither (a) nor (c) yields it alone. -/
theorem watcher_invisible_yet_blind {look : O Cut × O Cut → O Cut × O Cut} (h : IsFold look) :
    ∃ w : O Cut × O Cut, w.1 = (0 : O Cut × O Cut).1 ∧ w ≠ 0 ∧ look w ≠ w := by
  refine ⟨(0, 1), rfl, ?_, ?_⟩
  · intro hc
    have : (1 : O Cut) = 0 := congrArg Prod.snd hc
    exact oCut_one_ne_zero this
  · intro hc
    have hw0 : ((0 : O Cut), (1 : O Cut)) = 0 := prod_fold_self_blind h _ hc
    have : (1 : O Cut) = 0 := congrArg Prod.snd hw0
    exact oCut_one_ne_zero this

/-! ## NON-VACUITY (W8) — the composite fold exists; the weld bites concretely. -/

/-- NON-VACUITY: negation is a fold on the composite carrier (`neg_isFold`), so the `∀`-quantified
    fold facts above are inhabited, not vacuous. -/
theorem prod_neg_isFold : IsFold (fun x : O Cut × O Cut => -x) := neg_isFold

/-- [W8] THE WELD BITES on the concrete negation fold: `(0,1)` is base-invisible, live, and moved by
    the fold `x ↦ -x` (`-(0,1) = (0,-1) ≠ (0,1)` since `1 ≠ 0`). The conserved-blindness weld is
    realized on a concrete carrier and a concrete state, not vacuously. -/
theorem watcher_invisible_yet_blind_bites :
    ∃ w : O Cut × O Cut,
      w.1 = (0 : O Cut × O Cut).1 ∧ w ≠ 0 ∧ (fun x : O Cut × O Cut => -x) w ≠ w :=
  watcher_invisible_yet_blind prod_neg_isFold

/-! ## THE CAPSTONE — the channel quotient (constancy on fibres, no section-detector, conserved
    blindness under enlargement, welded). -/

/-- ★★★ THE CHANNEL QUOTIENT (arc-R R3), bundled. On the banked terminal carrier `O Cut` with the
    composite (system + observer) carrier `O Cut × O Cut`:
      (a) any channel through the base projection is CONSTANT on fibres (carries the projected data
          and nothing else — `factors_through_proj_const_on_fibre`);
      (b) NO section-detector recovers the fibre coordinate from the base (the chain's own no-go, the
          J4/C6 exclusion shape — `no_section_detector`);
      (c) ★ the RECURSION: enlarging the carrier to include the watcher re-instantiates the banked
          `fold_self_blind` one level up — the composite fold still has no nonzero fixed point
          (`prod_fold_self_blind`); the blindness is CONSERVED;
      (★) THE WELD: a pure-fibre state is simultaneously base-invisible, live, and missed by the
          composite fold (`watcher_invisible_yet_blind`) — invisibility to the channel and
          irreducibility of the fold's miss are the SAME state.
    The observable of a state carries only the projected quotient; the discarded coordinate is
    undetectable; and no enlargement of the carrier eliminates the fold's blindness of it. DERIVED
    from the fold — no observation postulate, no collapse, no hidden-variable model posited. -/
theorem channel_quotient :
    (∀ {β : Type} (g : O Cut → β) (p q : O Cut × O Cut), p.1 = q.1 →
        (g ∘ Prod.fst) p = (g ∘ Prod.fst) q)
    ∧ (¬ ∃ d : O Cut → O Cut, ∀ p : O Cut × O Cut, d p.1 = p.2)
    ∧ (∀ {look : O Cut × O Cut → O Cut × O Cut}, IsFold look →
        ∀ x : O Cut × O Cut, look x = x → x = 0)
    ∧ (∀ {look : O Cut × O Cut → O Cut × O Cut}, IsFold look →
        ∃ w : O Cut × O Cut, w.1 = (0 : O Cut × O Cut).1 ∧ w ≠ 0 ∧ look w ≠ w) :=
  ⟨fun g p q h => factors_through_proj_const_on_fibre g p q h,
   no_section_detector,
   fun h x hx => prod_fold_self_blind h x hx,
   fun h => watcher_invisible_yet_blind h⟩

end

end Phys.Algebra.StandpointChannel
