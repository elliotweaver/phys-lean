/-
  # N696 — DRESSING SCOPE CHARACTERIZED (the referee's deep item 4)

  THE ASK (external referee): the dressing scope must be a CHARACTERIZATION by an
  independently checkable property — not a verified choice. Partition the endpoint's
  terms by the property "already resummed" vs "bare one-return content", prove the
  dressing operator acts EXACTLY ONCE on the latter and FIXES the former, and kill
  the latent freedom in which terms are exempt.

  THE INDEPENDENT PROPERTY (formalized here):
  - RESUMMED  = κ-FREE RATIONAL content: `KappaFreeRational b := ∃ q : ℚ, b = (q : Cut)`.
    The base `2425/18` (confinement way-point `7179/54` + `cutPi`-cancelled census gem
    `16/9`, banked `exempt_base_is_resummed`) is such content — the π-cancellation is
    already done, the all-orders resummation is already inside the banked transmutation
    scales (banked `reattest_base_exempt`'s justification).
  - BARE = the κ-CARRIER: content carrying exactly one factor of `kappaLeading` (one
    return through the depth, the running content `kappaLeading·cInner`).

  THE OPERATOR: `dressOp b c := b + kappaLeadingDressed depthWeight · c` — the dressing
  replaces the ONE bare loop factor on the carrier by the all-orders dressed factor
  `kappaLeadingDressed depthWeight = (3/2)·kappaLeading` (banked `kappaLeadingDressed_eq_div`
  at the fold-forced `depthWeight = 1/3`, one `w` per depth re-entry — the
  MirrorSelfInsertionLaw mechanism) and FIXES the κ-free part (`dressOp_fixes_kappa_free`,
  an identity of the operator itself, not of the chosen instance).

  THE CHARACTERIZATION (`dressing_characterized`): for ANY decomposition
  `recomposedEndpoint = b + kappaLeading·c` of the banked bare endpoint, the dressed
  image `dressOp b c` equals the banked `recomposedEndpointDressed` IFF `b = 2425/18` —
  i.e. the exempt part is FORCED by the decomposition's shape to be exactly the banked
  κ-free rational base. This is stated (and proved) for ARBITRARY `b`, with NO
  rationality hypothesis needed — strictly stronger than the referee's form: among all
  ways to split the endpoint into "exempt + κ-carrier", exactly one reproduces the
  banked dressed value, and its exempt part is the κ-free rational `2425/18`
  (`base_is_kappa_free_rational`). The latent freedom is DEAD: `no_scope_freedom`
  refutes scope-ALL (dressing the base too gives a value off by `2425/36 ≠ 0`) and
  scope-NONE (dressing nothing loses the strictly positive increment,
  `kappaLeading_cInner_pos`), and the banked frame-audit trichotomy (scope-(a)
  way-point-forbidden, scope-(b) fold-collapsed, scope-(c) forced) is re-welded by name.

  EXACTLY ONCE (`dressing_acts_once`, `dressing_not_idempotent`): the banked closed form
  carries the factor `(3/2)` to the FIRST power; double-dressing is detectable —
  `(3/2)·((3/2)·x) ≠ (3/2)·x` for `x ≠ 0`, and the double-dressed endpoint differs from
  the banked one because the carrier is strictly positive.

  THE WELD (N694): the closure cocycle inherits the SAME split — its rational gem defect
  `8/27` is κ-free rational and undressed, its κ-carrier log part receives exactly the
  `1/2·κ` all-orders increment (`GatherEndpointComposition.dressed_cocycle_scope`, cited
  by name), and the dressed cocycle IS `dressOp` applied to that split
  (`cocycle_is_dressOp`).

  HONESTY NOTE: `dressing_characterized` fixes the exempt part GIVEN the decomposition
  shape `endpoint = b + kappaLeading·c` and the banked dressed value as the target. What
  a still-more-general form would add is UNIQUENESS of the shape itself (that no κ-free
  rational `b ≠ 2425/18` admits a carrier `c` built from the SAME log alphabet — that
  would need linear independence of `{1, cutLog …}` over ℚ, i.e. irrationality content
  not banked on this line). Within the shape, the scope is a theorem, not a choice.

  BANKED NAMES CONSUMED (all by name, no new numerics):
  `D7DepthTwoComposed.recomposedEndpointDressed_closed` / `recomposedEndpoint_cInner` /
  `kappaLeading_cInner_pos` / `depthTwo_dresses_recomposed`;
  `DepthTowerDescent.kappaLeadingDressed_eq_div`; `DepthWeight.depthWeight_eq/pos/lt_one`;
  `FrameAuditDressingScope.scopeC_closed` / `scopeC_exempts_base` /
  `exempt_base_is_resummed` / `scopeA_moves_topBand` / `scopeB_collapses`;
  `FrameAuditedCompositionReattestation.reattest_scopeC_closed` / `reattest_base_exempt`;
  `GatherEndpointComposition.dressed_cocycle_scope` / `closureCocycleScreening_dissolved`.

  PHYSICS-WORDS-REMOVABLE: delete dressing/resummed/carrier — the statements are exact
  ring identities and iff-characterizations over the derived `Cut`, plus name-level
  re-exports of banked theorems. Classical only through the banked foundations.

  NO sorry / admit / axiom. No lake, no git.
-/
import Phys.Algebra.FrameAuditedCompositionReattestation
import Phys.Algebra.GatherEndpointComposition
import Mathlib.Tactic

namespace Phys.Algebra.DressingScopeCharacterized

open Phys.Algebra
open Phys.Algebra.DepthWeight
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.D7DepthTwoComposed
open Phys.Algebra.LowTailFoldForcedWeight
open Phys.Algebra.DepthTwoBandVaryingRunning
open Phys.Algebra.FrameAuditDressingScope
open Phys.Algebra.GatherEndpointComposition
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE INDEPENDENT PROPERTY — κ-free rational (resummed) vs κ-carrier (bare). -/

/-- ★★★ THE INDEPENDENTLY CHECKABLE PROPERTY: a term is RESUMMED content iff it is
    κ-FREE RATIONAL — literally a rational of the derived line (`∃ q : ℚ, b = (q : Cut)`),
    carrying NO factor of `kappaLeading` (no bare one-return loop content). This is the
    referee's demanded partition property: checkable independently of the dressing verdict. -/
def KappaFreeRational (b : Cut) : Prop := ∃ q : ℚ, b = (q : Cut)

/-- ★★ THE EXEMPT BASE HAS THE PROPERTY: `2425/18` is κ-free rational (the witness is the
    rational `2425/18` itself — the `cutPi`-cancellation banked in `exempt_base_is_resummed`
    already happened; nothing transcendental and no `kappaLeading` factor remains). -/
theorem base_is_kappa_free_rational : KappaFreeRational (2425 / 18 : Cut) :=
  ⟨2425 / 18, by push_cast; norm_num⟩

/-- ★★ THE CARRIER FAILS-TO-BE-TRIVIAL: the κ-carrier content `kappaLeading·cInner` is
    strictly positive (banked `kappaLeading_cInner_pos`) — the bare/resummed partition of
    the banked endpoint is a REAL partition, both parts nonzero. -/
theorem carrier_nonzero : kappaLeading * cInner ≠ 0 :=
  ne_of_gt kappaLeading_cInner_pos

/-! ## (2) THE DRESSING OPERATOR — acts on the κ-carrier, fixes the κ-free part. -/

/-- ★★★ THE DRESSING OPERATOR on a decomposition `(b, c)` (exempt part `b`, κ-stripped
    carrier `c`): replace the ONE bare loop factor by the all-orders dressed factor —
    `dressOp b c = b + kappaLeadingDressed depthWeight · c`. The operator's SHAPE encodes
    the scope: it touches only the carrier slot. -/
def dressOp (b c : Cut) : Cut := b + kappaLeadingDressed depthWeight * c

/-- ★★ THE OPERATOR'S CLOSED FORM: `dressOp b c = b + (3/2)·kappaLeading·c` — the banked
    all-orders factor `kappaLeadingDressed depthWeight = kappaLeading/(1 − 1/3) =
    (3/2)·kappaLeading` (banked `kappaLeadingDressed_eq_div` + `depthWeight_eq`; the `3/2`
    is FORCED by the fold's one-return weight, never chosen). -/
theorem dressOp_closed (b c : Cut) :
    dressOp b c = b + (3 / 2) * kappaLeading * c := by
  unfold dressOp
  rw [kappaLeadingDressed_eq_div depthWeight (le_of_lt depthWeight_pos) depthWeight_lt_one,
      depthWeight_eq]
  have h : kappaLeading / (1 - (1 / 3 : Cut)) = (3 / 2) * kappaLeading := by
    have h23 : (1 : Cut) - 1 / 3 = 2 / 3 := by norm_num
    rw [h23]; ring
  rw [h]

/-- ★★★ THE OPERATOR FIXES THE κ-FREE PART: `dressOp b c − kappaLeadingDressed·c = b` —
    an identity of the OPERATOR (any `b`, any `c`), not of the chosen instance. The
    resummed slot passes through untouched. -/
theorem dressOp_fixes_kappa_free (b c : Cut) :
    dressOp b c - kappaLeadingDressed depthWeight * c = b := by
  unfold dressOp; ring

/-- ★★ THE OPERATOR ACTS ON THE CARRIER ONLY: `dressOp b c − b = kappaLeadingDressed·c` —
    the whole action lands in the κ-carrier slot. -/
theorem dressOp_acts_on_carrier (b c : Cut) :
    dressOp b c - b = kappaLeadingDressed depthWeight * c := by
  unfold dressOp; ring

/-- ★★ THE OPERATOR IS THE BARE VALUE PLUS THE ONE-RETURN INCREMENT:
    `dressOp b c = (b + kappaLeading·c) + (1/2)·(kappaLeading·c)` — dressing a
    decomposition adds exactly the `(3/2 − 1) = 1/2` all-orders increment on the carrier
    (one `w = 1/3` per depth re-entry, resummed: the MirrorSelfInsertionLaw mechanism). -/
theorem dressOp_increment (b c : Cut) :
    dressOp b c = (b + kappaLeading * c) + (1 / 2) * (kappaLeading * c) := by
  rw [dressOp_closed]; ring

/-- ★ THE BANKED DRESSED ENDPOINT IS THE OPERATOR AT THE BANKED SPLIT, definitionally:
    `recomposedEndpointDressed = dressOp (2425/18) cInner` — the banked object (N684's
    scope-C result, `scopeC_closed`) IS an instance of the operator, by `rfl`. -/
theorem endpoint_is_dressOp :
    recomposedEndpointDressed = dressOp (2425 / 18) cInner := rfl

/-! ## (3) ★★★ THE CHARACTERIZATION — the exempt part is FORCED, not chosen. -/

/-- ★★★ THE DRESSING SCOPE CHARACTERIZED (the referee's item, closed in the STRONG form):
    for ANY decomposition `recomposedEndpoint = b + kappaLeading·c` of the banked bare
    endpoint (arbitrary `b : Cut` — no rationality hypothesis even needed), the dressed
    image equals the banked dressed endpoint IFF the exempt part is EXACTLY the banked
    κ-free rational base: `dressOp b c = recomposedEndpointDressed ↔ b = 2425/18`.

    The scope is therefore a THEOREM of the decomposition's shape: exempt one unit more
    (or less) of content and the dressed value moves — there is no latent freedom in
    which terms are exempt. Combined with `base_is_kappa_free_rational`, the unique
    admissible exempt part carries the independent property (κ-free rational = already
    resummed), which is the referee's demanded characterization. -/
theorem dressing_characterized (b c : Cut)
    (hdecomp : recomposedEndpoint = b + kappaLeading * c) :
    dressOp b c = recomposedEndpointDressed ↔ b = 2425 / 18 := by
  have hb : recomposedEndpoint = 2425 / 18 + kappaLeading * cInner :=
    recomposedEndpoint_cInner
  have hd : recomposedEndpointDressed = 2425 / 18 + (3 / 2) * kappaLeading * cInner :=
    recomposedEndpointDressed_closed
  have hop : dressOp b c = b + (3 / 2) * kappaLeading * c := dressOp_closed b c
  have h1 : b + kappaLeading * c = 2425 / 18 + kappaLeading * cInner := by
    rw [← hdecomp, hb]
  constructor
  · intro h
    rw [h, hd] at hop
    -- hop : 2425/18 + (3/2)·κ·cInner = b + (3/2)·κ·c ; h1 : b + κ·c = 2425/18 + κ·cInner
    linarith [hop, h1]
  · intro h
    subst h
    rw [hop, hd]
    -- from h1 with b = 2425/18: κ·c = κ·cInner
    linarith [h1]

/-- ★★ THE DRESSED VALUE IS DETERMINED BY THE EXEMPT PART ALONE: for any decomposition
    `recomposedEndpoint = b + kappaLeading·c`, `dressOp b c = (3/2)·recomposedEndpoint −
    (1/2)·b` — the carrier drops out. This is WHY the characterization is an iff: moving
    content between the exempt and dressed slots moves the answer linearly in `b`, so the
    banked value pins `b` uniquely. -/
theorem dressed_value_determined_by_exempt (b c : Cut)
    (hdecomp : recomposedEndpoint = b + kappaLeading * c) :
    dressOp b c = (3 / 2) * recomposedEndpoint - (1 / 2) * b := by
  rw [dressOp_closed, hdecomp]; ring

/-! ## (4) ★★★ EXACTLY ONCE — one dressing factor, double-dressing detectable. -/

/-- ★★ DOUBLE-DRESSING IS DETECTABLE: `(3/2)·((3/2)·x) ≠ (3/2)·x` for `x ≠ 0` — the
    dressing factor is NOT absorbable; applying it twice to any nonzero carrier content
    is visibly different from applying it once. -/
theorem dressing_not_idempotent (x : Cut) (hx : x ≠ 0) :
    (3 / 2 : Cut) * ((3 / 2) * x) ≠ (3 / 2) * x := by
  intro h
  exact hx (by linarith [h])

/-- ★★★ THE DRESSING ACTS EXACTLY ONCE ON THE BANKED CARRIER: the banked closed form
    carries `(3/2)` to the FIRST power — `recomposedEndpointDressed = 2425/18 +
    (3/2)·(kappaLeading·cInner)` — and the DOUBLE-dressed value `2425/18 +
    (3/2)·((3/2)·(kappaLeading·cInner))` is strictly different (the carrier is strictly
    positive, banked `kappaLeading_cInner_pos`). One return surface, one resummation. -/
theorem dressing_acts_once :
    recomposedEndpointDressed = 2425 / 18 + (3 / 2) * (kappaLeading * cInner)
    ∧ 2425 / 18 + (3 / 2) * ((3 / 2) * (kappaLeading * cInner)) ≠ recomposedEndpointDressed := by
  have hd : recomposedEndpointDressed = 2425 / 18 + (3 / 2) * kappaLeading * cInner :=
    recomposedEndpointDressed_closed
  have hpos : 0 < kappaLeading * cInner := kappaLeading_cInner_pos
  constructor
  · rw [hd]; ring
  · intro h
    rw [hd] at h
    linarith [h, hpos]

/-! ## (5) ★★★ NO SCOPE FREEDOM — the alternatives are REFUTED, not unexamined. -/

/-- ★★★ SCOPE-ALL REFUTED: dressing the κ-free base TOO (applying `3/2` to the WHOLE bare
    endpoint) gives a value that differs from the banked dressed endpoint by exactly
    `(1/2)·(2425/18) = 2425/36 ≠ 0` — `(3/2)·recomposedEndpoint ≠ recomposedEndpointDressed`.
    Re-dressing already-resummed content double-counts, and the double-count is VISIBLE. -/
theorem scope_all_refuted :
    (3 / 2 : Cut) * recomposedEndpoint ≠ recomposedEndpointDressed := by
  intro h
  have hb : recomposedEndpoint = 2425 / 18 + kappaLeading * cInner :=
    recomposedEndpoint_cInner
  have hd : recomposedEndpointDressed = 2425 / 18 + (3 / 2) * kappaLeading * cInner :=
    recomposedEndpointDressed_closed
  rw [hb, hd] at h
  have : (2425 / 36 : Cut) = 0 := by linarith [h]
  norm_num at this

/-- ★★★ SCOPE-NONE REFUTED: dressing NOTHING (leaving the bare endpoint) also misses —
    `recomposedEndpoint ≠ recomposedEndpointDressed`, because the one-return increment
    `(1/2)·kappaLeading·cInner` is strictly positive (banked `depthTwo_dresses_recomposed`).
    The dressing is a REAL correction; exempting the carrier is not an option. -/
theorem scope_none_refuted :
    recomposedEndpoint ≠ recomposedEndpointDressed :=
  ne_of_lt (D7DepthTwoComposed.depthTwo_dresses_recomposed).2

/-- ★★★ NO SCOPE FREEDOM, in one statement: scope-ALL misses (base double-counted),
    scope-NONE misses (carrier increment lost), and the banked scope-C closed form holds
    (`scopeC_closed`, cited by name). Between "dress everything", "dress nothing", and
    "dress exactly the κ-carrier", the banked value admits ONLY the third — and by
    `dressing_characterized` even the SPLIT inside the third is forced. -/
theorem no_scope_freedom :
    ((3 / 2 : Cut) * recomposedEndpoint ≠ recomposedEndpointDressed)
    ∧ (recomposedEndpoint ≠ recomposedEndpointDressed)
    ∧ (recomposedEndpointDressed = 2425 / 18 + (3 / 2) * kappaLeading * cInner) :=
  ⟨scope_all_refuted, scope_none_refuted, FrameAuditDressingScope.scopeC_closed⟩

/-- ★★ THE BANKED FRAME-AUDIT TRICHOTOMY, RE-WELDED BY NAME (N684's scope candidates):
    (a) whole-tower dressing MOVES the banked electroweak way-point (`602/9 ≠ 1582/27`,
    `scopeA_moves_topBand`) — way-point-forbidden; (b) per-band varying dressing COLLAPSES
    to the one fold constant (`scopeB_collapses`) — no free family exists; (c) the
    resummed-vs-bare partition closes (`scopeC_closed`, in `no_scope_freedom` above).
    The characterization of this file upgrades (c) from "the verified choice among three"
    to "the unique split forced by the decomposition's shape". -/
theorem scope_trichotomy_reweld :
    ((602 / 9 : Cut) ≠ 1582 / 27)
    ∧ (∀ lowTail : List (Cut × Cut),
        bandVaryingScreen (withWeight depthWeight lowTail)
          = 3 / 2 * totalScreening lowTail) :=
  ⟨(FrameAuditDressingScope.scopeA_moves_topBand).2,
   FrameAuditDressingScope.scopeB_collapses⟩

/-! ## (6) ★★★ THE WELD TO N694 — the cocycle inherits the SAME split. -/

/-- ★★ THE COCYCLE'S RATIONAL PART HAS THE PROPERTY: the gem defect `8/27` is κ-free
    rational — the SAME independently checkable property that exempts the endpoint base
    exempts the cocycle's rational part. One property, one scope, both levels. -/
theorem cocycle_gem_is_kappa_free_rational : KappaFreeRational (8 / 27 : Cut) :=
  ⟨8 / 27, by push_cast; norm_num⟩

/-- ★★★ THE DRESSED COCYCLE IS THE OPERATOR AT THE COCYCLE'S SPLIT: N694's
    `dressedClosureCocycle` IS `dressOp` applied to (gem defect `8/27`, κ-stripped log
    carrier) — the SAME operator, the SAME scope, acting at the cocycle level. -/
theorem cocycle_is_dressOp :
    dressedClosureCocycle
      = dressOp (8 / 27)
          (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0)) := by
  rw [dressOp_closed]
  unfold dressedClosureCocycle
  ring

/-- ★★★ THE N694 WELD (cited by name): the cocycle inherits the SAME split —
    `dressedClosureCocycle = closureCocycleScreening + (1/2)·κ·(log part)` (N694's
    `dressed_cocycle_scope`): the rational gem defect receives NO increment (κ-free
    rational, exempt), the κ-carrier log part receives exactly the ONE `1/2·κ` all-orders
    increment. Together with `cocycle_is_dressOp` and `cocycle_gem_is_kappa_free_rational`,
    the characterization propagates: the gather's global section (N694) uses the SAME
    forced scope this file characterizes at the endpoint. -/
theorem cocycle_inherits_scope :
    dressedClosureCocycle
      = closureCocycleScreening
        + (1 / 2) * kappaLeading
          * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0)) :=
  GatherEndpointComposition.dressed_cocycle_scope

/-! ## (7) THE LANDING — the referee's item, one welded statement. -/

/-- ★★★ THE DRESSING-SCOPE CHARACTERIZATION LANDING: in one statement —
    (1) the exempt base carries the independent property (κ-free rational);
    (2) THE CHARACTERIZATION: for ANY decomposition of the bare endpoint into
        exempt + κ-carrier, the dressed image is the banked value IFF the exempt part
        is exactly `2425/18` — the scope is FORCED, not chosen;
    (3) the operator fixes the κ-free slot identically;
    (4) the dressing acts EXACTLY ONCE (double-dressing detectably differs);
    (5) NO scope freedom: scope-ALL and scope-NONE both refuted;
    (6) the N694 cocycle inherits the same split (welded by name).
    The frame audit's scope-C verdict (N684, re-attested N686) is hereby upgraded from a
    verified choice to a characterized theorem. -/
theorem dressingScopeCharacterized_landing :
    KappaFreeRational (2425 / 18 : Cut)
    ∧ (∀ b c : Cut, recomposedEndpoint = b + kappaLeading * c →
        (dressOp b c = recomposedEndpointDressed ↔ b = 2425 / 18))
    ∧ (∀ b c : Cut, dressOp b c - kappaLeadingDressed depthWeight * c = b)
    ∧ (2425 / 18 + (3 / 2) * ((3 / 2) * (kappaLeading * cInner)) ≠ recomposedEndpointDressed)
    ∧ ((3 / 2 : Cut) * recomposedEndpoint ≠ recomposedEndpointDressed)
    ∧ (recomposedEndpoint ≠ recomposedEndpointDressed)
    ∧ (dressedClosureCocycle
        = closureCocycleScreening
          + (1 / 2) * kappaLeading
            * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0))) :=
  ⟨base_is_kappa_free_rational,
   fun b c h => dressing_characterized b c h,
   dressOp_fixes_kappa_free,
   dressing_acts_once.2,
   scope_all_refuted,
   scope_none_refuted,
   cocycle_inherits_scope⟩

end

end Phys.Algebra.DressingScopeCharacterized
