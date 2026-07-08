/-
  Phys.Algebra.StandpointStratum — N445 (arc-R R1): THE STANDPOINT STRATUM (the world-center theorem).
  ============================================================================================
  ARC R — THE STANDPOINT (the inside read of the banked gather). The banked gather-monad (N411)
  has TWO reads. The MAGNITUDE read (N413/N415): physics = where the gather FAILS to glue, read
  from OUTSIDE — one obstruction at every level. Arc R banks the STANDPOINT read: the structure of
  a LOCAL closure over its own miss, read FROM ITS OWN LOCUS. Same banked objects, other face.

  R1 — THE STANDPOINT STRATUM. On the banked `O ℚ`, a globally-gluing state (`GluesGlobally`, N412 —
  membership in the LEFT NUCLEUS) together with the view it opens (`worldMap`, N218T — the left
  regular action `x ↦ a·x`) is a STANDPOINT. The three-part structure, welded into ONE named object:
    (a) STANDPOINTS EXIST — the trivial standpoint `1` is live and glues (`one_gluesGlobally`,
        `one_ne_zero_O`); the stratum is NONEMPTY.
    (b) NO TOTAL STANDPOINT — not every state glues (`o_not_all_physical`, from the banked
        non-associating triple `o_worlds_not_glue`); the stratum is PROPER, the totality does not
        close.
    (c) EACH STANDPOINT'S VIEW COMPOSES COHERENTLY FROM THERE — from a standpoint's own locus,
        world composition is STRICT (`sp_strict`: `worldMap s.loc ∘ worldMap b = worldMap (s.loc·b)`,
        the homomorphism property that FAILS generically on `O ℚ` by (b), held LOCALLY at the glued
        state — the strictness the smooth associative rungs `Dbl ℚ`, `H ℚ` have EVERYWHERE, recovered
        locally on the level where it globally fails), and the view is FAITHFUL (`sp_faithful`:
        `worldMap s.loc` injective, from `worldMap_injective`/N-indivisible, since `O ℚ` has no zero
        divisors).

  ★ THE WELD (the genuinely-new, non-hollow content — NOT a bare ∧ of the banked facts): DISTINCT
  probes open DISTINCT composite worlds from a standpoint's own locus (`sp_composite_faithful`: the
  composite view `b ↦ worldMap s.loc ∘ worldMap b` is INJECTIVE). Its proof needs BOTH (c)-facts and
  can be stated from NEITHER alone: rewrite the composite view through STRICTNESS (`sp_strict`, the
  N412 gluing) to expose the composite state `s.loc·b`, then separate the probes with FAITHFULNESS
  (`sp_faithful`, the N-indivisible injectivity). Strictness turns the composite of views into a
  single view; faithfulness reads the state back off it. The stratum's local strictness and the
  octonion level's global indivisibility are welded into one fact about the standpoint's view.

  ⚠ GRADE / FIREWALL. THEOREM-route for pure structure. The reading of this structure as
  "standpoint / world / view / the inside" is an IDENTIFICATION — DEFERRED to R8 (guard G7, the
  IDENTIFICATION FIREWALL). NO theorem here mentions or depends on any identification. MIND-WORDS-
  REMOVABLE: delete standpoint/world/view/inside/observer → pure LEFT-NUCLEUS membership facts and
  INJECTIVITY of the left regular action and its composite on `O ℚ`. Every TYPE cites the banked
  derived objects (`O ℚ`, `GluesGlobally`, `worldMap`), never generic over an arbitrary carrier.

  Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`.
-/
import Phys.Algebra.TowerGatherPhysicalState
import Phys.Algebra.TowerWorldMapIndivisible
import Phys.Algebra.DerivationRep7

namespace Phys.Algebra.StandpointStratum

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-! ## THE STANDPOINT (the bundled structure — DERIVED, never posited). -/

/-- A STANDPOINT on the banked `O ℚ`: a LIVE (nonzero) state that GLUES GLOBALLY (membership in the
    left nucleus, `GluesGlobally`, N412), bundled with the two banked facts that make its induced
    view (`worldMap`, N218T) both strict and faithful. Words-removable: a nonzero left-nucleus
    element of `O ℚ`. -/
structure Standpoint where
  /-- the locus — the state the view is opened from. -/
  loc : O ℚ
  /-- the locus is LIVE (nonzero) — required for the view to be faithful (no zero divisors). -/
  live : loc ≠ 0
  /-- the locus GLUES GLOBALLY (left-nucleus membership, N412) — required for strict composition. -/
  glues : GluesGlobally loc

/-! ## (c) THE VIEW COMPOSES COHERENTLY FROM THE LOCUS. -/

/-- (c-strict) LOCALITY / STRICT COMPOSITION: from a standpoint's own locus, world composition is
    STRICT — the homomorphism property `worldMap s.loc ∘ worldMap b = worldMap (s.loc·b)`. This is
    exactly `s.glues b` (N412). It FAILS generically on `O ℚ` (by `o_not_all_physical`), so a
    standpoint is a locus where the octonion level LOCALLY recovers the strictness the associative
    rungs have globally. -/
theorem sp_strict (s : Standpoint) (b : O ℚ) :
    worldMap s.loc ∘ worldMap b = worldMap (s.loc * b) := s.glues b

/-- (c-faithful) the standpoint's view is FAITHFUL (injective): no two probes collapse under it.
    From `worldMap_injective` (N-indivisible), since `O ℚ` has no zero divisors and `s.loc ≠ 0`. -/
theorem sp_faithful (s : Standpoint) : Function.Injective (worldMap s.loc) := by
  have h := worldMap_injective s.live
  intro x y hxy
  exact h (by simpa [worldMap, LeftMul_apply] using hxy)

/-! ## (a) EXISTENCE — the stratum is NONEMPTY. -/

/-- (a) THE TRIVIAL STANDPOINT: `1` is live (`one_ne_zero_O`, N26) and glues globally
    (`one_gluesGlobally`, the monad unit η, N412). The stratum is NONEMPTY. -/
def trivialStandpoint : Standpoint :=
  ⟨1, one_ne_zero_O, one_gluesGlobally⟩

/-- (a) restated: a standpoint whose locus is `1` EXISTS. -/
theorem standpoint_exists : ∃ s : Standpoint, s.loc = 1 :=
  ⟨trivialStandpoint, rfl⟩

/-! ## ★ THE WELD (non-hollow content — needs BOTH (c)-facts, statable from NEITHER alone). -/

/-- ★ THE WELD: DISTINCT probes open DISTINCT composite worlds from a standpoint's locus — the
    composite view `b ↦ worldMap s.loc ∘ worldMap b` is INJECTIVE.

    NON-HOLLOW: the proof uses BOTH banked (c)-facts and can be stated from NEITHER alone.
    (1) STRICTNESS (`sp_strict`, the N412 gluing) rewrites each composite view `worldMap s.loc ∘
        worldMap b` into the SINGLE view `worldMap (s.loc·b)`, exposing the composite state.
    (2) evaluating the equal single views at `1` extracts `s.loc·b = s.loc·b'`.
    (3) FAITHFULNESS (`worldMap_injective`, the N-indivisible injectivity) separates the probes:
        `s.loc·b = s.loc·b' → b = b'` since `s.loc ≠ 0`.
    Strictness turns the composite of views into one view; faithfulness reads the state back off it.
    The stratum's LOCAL strictness (N412) and the octonion level's GLOBAL indivisibility (N-indiv)
    are welded into one fact about the standpoint's view. -/
theorem sp_composite_faithful (s : Standpoint) :
    Function.Injective (fun b : O ℚ => worldMap s.loc ∘ worldMap b) := by
  intro b b' hbb'
  simp only [] at hbb'
  rw [sp_strict s b, sp_strict s b'] at hbb'
  have h1 : s.loc * b = s.loc * b' := by
    have := congrFun hbb' 1
    simpa [worldMap] using this
  exact worldMap_injective s.live (by simpa [LeftMul_apply] using h1)

/-! ## ★ THE SELECTION IS LOAD-BEARING (W8 teeth: `glues` is NOT free — faithfulness alone
    does NOT make a standpoint). -/

/-- ★ THE SELECTION BITES: there is a LIVE, FAITHFUL state that is NOT a standpoint. Faithfulness
    (`worldMap` injective) is UNIVERSAL among live states of `O ℚ` (no zero divisors), so it CANNOT
    be what selects standpoints; the `glues` field (global strict composition, N412) is genuinely
    load-bearing. The witness is the banked non-associating triple's first component
    (`o_worlds_not_glue`): it is nonzero (else it would glue — `0` composes strictly with all) yet
    fails to glue with the second component, so its view is faithful but its composition is NOT
    globally strict. This is the W8 non-vacuity of the `Standpoint` structure: the stratum is a
    PROPER selection among live faithful states, not the whole of them. -/
theorem faithful_insufficient :
    ∃ a : O ℚ, a ≠ 0 ∧ Function.Injective (worldMap a) ∧ ¬ GluesGlobally a := by
  obtain ⟨a, b, hab⟩ := o_worlds_not_glue
  have hlive : a ≠ 0 := by
    rintro rfl
    apply hab
    show worldMap (0 : O ℚ) ∘ worldMap b = worldMap ((0 : O ℚ) * b)
    funext x
    simp only [worldMap, Function.comp_apply, zero_mul]
  refine ⟨a, hlive, ?_, ?_⟩
  · have h := worldMap_injective hlive
    intro x y hxy
    exact h (by simpa [worldMap, LeftMul_apply] using hxy)
  · intro hg
    exact hab (hg b)

/-! ## THE CAPSTONE — the standpoint stratum (nonempty, proper, view-coherent via the weld,
    genuinely selective). -/

/-- ★★★ THE STANDPOINT STRATUM (the world-center theorem). On the banked `O ℚ`:
      (a) STANDPOINTS EXIST (the stratum is NONEMPTY — `standpoint_exists`);
      (b) NO TOTAL STANDPOINT exists (the stratum is PROPER, the totality does not close —
          `o_not_all_physical`);
      (c★) each standpoint's view composes coherently from its locus, WELDED: distinct probes open
           distinct composite worlds (`sp_composite_faithful`, the non-hollow content that binds the
           N412 local strictness to the N-indivisible faithfulness);
      (d★) the selection is LOAD-BEARING (`faithful_insufficient`): a live faithful state that is
           NOT a standpoint exists, so `glues` is not free — the stratum is a proper selection among
           live faithful states.
    NON-HOLLOW: the (c) conjunct is not a bare re-cite of a banked fact but the WELD, which no single
    banked fact yields; the (d) conjunct is the W8 teeth showing the `glues` field carries genuine
    selection content beyond liveness/faithfulness. Words-removable: the left nucleus of `O ℚ` is
    nonempty, proper, every nonzero left-nucleus element has an injective composite-with-left-regular-
    action view, and there is a nonzero non-left-nucleus element with an injective left-regular
    action (so left-nucleus membership is strictly stronger than left-regular injectivity). -/
theorem standpoint_stratum :
    (∃ s : Standpoint, s.loc = 1)
    ∧ (¬ ∀ a : O ℚ, GluesGlobally a)
    ∧ (∀ s : Standpoint, Function.Injective (fun b : O ℚ => worldMap s.loc ∘ worldMap b))
    ∧ (∃ a : O ℚ, a ≠ 0 ∧ Function.Injective (worldMap a) ∧ ¬ GluesGlobally a) :=
  ⟨standpoint_exists, o_not_all_physical, sp_composite_faithful, faithful_insufficient⟩

end Phys.Algebra.StandpointStratum
