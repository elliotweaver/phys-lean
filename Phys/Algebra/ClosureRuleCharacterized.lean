import Phys.Algebra.GlobalThresholdConservation
import Phys.Algebra.UnaryNestCount
import Mathlib.Tactic

/-!
  # N701 — THE CLOSURE RULE CHARACTERIZED (referee principle 1: the one-span rule is the
  #   UNIQUE census-exact extent, welded by name to the unary nest law)
  ==============================================================================
  N697 banked the closure rule as an INPUT: each interior-edge flavour screens EXACTLY
  ONE span past its own decoupling edge (rangeXClosed = own range + one span), and derived
  the global functional from it. THE REFEREE: if the fold can characterize that rule from
  something lower — perhaps the same unary return/self-reference mechanism — that is a
  major closure. THIS NODE: the closure EXTENT becomes an OBJECT (`uniformExtent e` — the
  rule slot: every seam is assigned e spans of propagation past its edge), the three N697
  range families become its instances (extent 0 = the conservation/own-edge frame, extent
  1 = the banked closure frame, extent ≥ 2 = over-propagation), and extent 1 is proved the
  UNIQUE extent whose per-span censuses are the banked band censuses — the ones whose
  freeze-out staircase re-supplies EXACTLY the removed coloured census
  (`staircase_resupplies_removed`, `census_completeness_closure`, CensusCompletenessClosure).

  ## THE DISCRIMINATORS (each a theorem; each rival extent killed by name)

  • EXTENT 0 (UNDER-SUPPLY): `extent_zero_undersupplies_every_span` — the extent-0
    per-span censuses (10/3, 2, 5/3) are STRICTLY BELOW the banked band censuses
    (11/3, 10/3, 2) on EVERY span; `extent_zero_undersupplies_load` — the total tail
    census load is strictly less (7 < 9); the weld `extent_zero_is_not_band` consumes
    N697's `conservation_is_not_band` BY NAME. HONESTY (`staircase_totals_telescope`):
    the naive two-step staircase TOTAL does NOT discriminate (it telescopes to 10/3 at
    both extents) — the resupply law bites PER SPAN, because `freezeoutStaircaseCensus`
    is DEFINED from the banked per-span band censuses; extent 0 fails to produce those
    per-span censuses, so it under-supplies the law's own inputs.
  • EXTENT 1 (UNIQUELY EXACT): `censusExact_one` — the extent-1 per-span censuses ARE
    the banked band censuses; `staircaseAt_one_eq_banked` — its staircase IS the banked
    `freezeoutStaircaseCensus`; `extent_one_resupplies` — it re-supplies EXACTLY the
    removed coloured census (consumes `staircase_resupplies_removed` BY NAME);
    `extent_one_completes_census` — it closes the census partition
    (`census_completeness_closure`); `extent_one_no_double_count`
    (`partition_no_double_count`).
  • EXTENT ≥ 2 (OVERFLOW/DOUBLE-COUNT): `extent_two_double_counts` — at extent 2 the
    bottom flavour screens the charm span, where it has ALREADY decoupled-and-closed:
    the charm-span census becomes 11/3 ≠ the banked 10/3 (consumes N697's
    `wrong_rule_overfills_charm_span` BY NAME — the double-count violation);
    `extent_ge_two_oversupplies` — for every e ≥ 2 the total load strictly EXCEEDS the
    exact load (≥ 32/3 > 9); `overflow_demands_nonexistent_span` +
    `strange_range_faithful_iff` — the boundary kill: the strange flavour's demanded
    depth 2 + e exceeds the banked 3-span descent (there IS no span below spanLight —
    the range families have length ≤ 3), so its range is FAITHFUL (delivers its demanded
    depth) iff e ≤ 1.
  • UNIQUENESS: `censusExact_iff` — censusExact e ↔ e = 1.

  ## THE UNARY WELD (referee's "same unary mechanism", an EQUATION between banked objects)

  `closure_is_unary`: `uniformExtent 1 seam = Nat.card (UnaryNest seam)` for EVERY seam —
  the closure count at each seam (one span per miss) IS the unary nest cardinality of
  N679 (`nestCount_eq_one`: the chain's re-entry structure admits EXACTLY ONE nest at
  every depth — the same law that forces exactly ONE mirror self-insertion, D = κ₀ + w·D).
  `exact_extent_is_nest_count`: any census-exact extent e satisfies `(e : Cut) =
  nestCount e` — the census-forced extent and the unary count are the SAME Cut value.

  ## HONEST GRADE (stated plainly, no more claimed)

  What is PROVED: AMONG the uniform-extent rule family {0, 1, 2, …}, extent 1 is (i) the
  UNIQUE extent whose per-span censuses equal the banked band censuses — the inputs of the
  banked resupply/completeness law — with 0 strictly under-supplying every span and ≥ 2
  strictly over-supplying the load and double-counting the charm span; (ii) the unique
  extent realizable faithfully in the banked 3-span descent at the deepest interior edge;
  and (iii) numerically welded to the unary nest cardinality. What is NOT claimed: the
  "why" bottoms out in the BANKED completeness law (the staircase must resupply the
  removed census — itself banked from the descent's census conservation,
  DecouplingCensusRemoval) plus the banked unary law; the closure rule is characterized
  (uniquely selected) from those, not derived ex nihilo. The unary weld is an exact
  equation between banked objects, but the identification of "closure count per miss"
  with "nest count per depth" as the same MECHANISM is a template inference — the numbers
  and structure agree; a common generative derivation is the open front.

  NO sorry / admit / axiom. No lake, no git, no measured numeral.
-/

namespace Phys.Algebra.ClosureRuleCharacterized

open Phys.Algebra
open Phys.Algebra.MirrorTermLanguage
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra.GlobalThresholdConservation
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (0) THE RULE SLOT AS AN OBJECT — the closure extent, and the range it generates. -/

/-- THE UNIFORM CLOSURE-EXTENT RULE: the rule slot as an object. `uniformExtent e` assigns
    to EVERY seam (interior decoupling edge, indexed by its depth) the same number `e` of
    spans of screening propagation past that edge. N697's three range families are its
    instances at e = 0 (conservation/own-edge), e = 1 (the banked closure rule),
    e ≥ 2 (over-propagation). -/
def uniformExtent (e : ℕ) : ℕ → ℕ := fun _ => e

/-- THE RANGE GENERATED BY AN EXTENT: a flavour whose own decoupling edge sits at depth
    `edgePos` in the banked 3-span tail descent screens the first `edgePos + e` spans —
    its own `edgePos` spans plus `e` spans of closure past the edge. The spans are N697's
    banked tail spans (`rangeUpFlavour = [spanBottom, spanCharm, spanLight]`). -/
def rangeAt (edgePos e : ℕ) : List Cut := rangeUpFlavour.take (edgePos + e)

/-- WELD: extent 0 generates EXACTLY N697's conservation (own-edge) ranges. -/
theorem rangeAt_zero_bottom : rangeAt 0 0 = rangeBottomFlavour := rfl
theorem rangeAt_zero_charm : rangeAt 1 0 = rangeCharmFlavour := rfl
theorem rangeAt_zero_strange : rangeAt 2 0 = rangeStrangeFlavour := rfl

/-- WELD: extent 1 generates EXACTLY N697's banked closure ranges. -/
theorem rangeAt_one_bottom : rangeAt 0 1 = rangeBottomClosed := rfl
theorem rangeAt_one_charm : rangeAt 1 1 = rangeCharmClosed := rfl
theorem rangeAt_one_strange : rangeAt 2 1 = rangeStrangeClosed := rfl

/-! ## (1) THE PER-SPAN CENSUS AT EXTENT e — which flavours screen each tail span.
    A flavour with edge depth `edgePos` screens span `i` iff `i < edgePos + e` (span `i`
    lies within its generated range). Interior edges: bottom at depth 0 (level 1), charm
    at depth 1 (level 2), strange at depth 2 (level 1); up (level 2) and down (level 1)
    have their edges below the tail (depth 3 — they screen the whole tail at every
    extent). Census terms are the banked X3 `colouredCensusTerm`. -/

/-- THE PER-SPAN CENSUS at extent `e` on tail span `i`. -/
def spanCensus (e i : ℕ) : ℚ :=
  (if i < 0 + e then colouredCensusTerm 1 else 0)      -- bottom  (edge depth 0, level 1)
    + (if i < 1 + e then colouredCensusTerm 2 else 0)  -- charm   (edge depth 1, level 2)
    + (if i < 2 + e then colouredCensusTerm 1 else 0)  -- strange (edge depth 2, level 1)
    + (if i < 3 + e then colouredCensusTerm 2 else 0)  -- up      (edge below tail)
    + (if i < 3 + e then colouredCensusTerm 1 else 0)  -- down    (edge below tail)

/-- THE TOTAL TAIL CENSUS LOAD at extent `e`: the sum of the three per-span censuses. -/
def tailCensusLoad (e : ℕ) : ℚ := spanCensus e 0 + spanCensus e 1 + spanCensus e 2

/-- THE GEOMETRIC WELD of the census condition: for a tail span (i ≤ 2), the screening
    condition `i < edgePos + e` used by `spanCensus` says EXACTLY that span `i` lies
    within the generated range `rangeAt edgePos e`. -/
theorem screens_iff_in_range (edgePos e i : ℕ) (hi : i ≤ 2) :
    i < (rangeAt edgePos e).length ↔ i < edgePos + e := by
  unfold rangeAt rangeUpFlavour
  simp only [List.length_take, List.length_cons, List.length_nil]
  omega

/-! ## (2) EXTENT 1 IS CENSUS-EXACT: its per-span censuses ARE the banked band censuses. -/

/-- Extent-1 bottom span census = the banked bottom band census (11/3): b+c+s+u+d. -/
theorem spanCensus_one_bottom : spanCensus 1 0 = bandCensus [2, 1, 1, 2, 1] := by
  unfold spanCensus
  rw [bandCensus_bottom]
  norm_num [colouredCensusTerm_one, colouredCensusTerm_two]

/-- Extent-1 charm span census = the banked charm band census (10/3): c+s+u+d. -/
theorem spanCensus_one_charm : spanCensus 1 1 = bandCensus [2, 1, 1, 2] := by
  unfold spanCensus
  rw [bandCensus_charm]
  norm_num [colouredCensusTerm_one, colouredCensusTerm_two]

/-- Extent-1 light span census = the banked light band census (2): s+u+d. -/
theorem spanCensus_one_light : spanCensus 1 2 = bandCensus [2, 1, 1] := by
  unfold spanCensus
  rw [bandCensus_light]
  norm_num [colouredCensusTerm_one, colouredCensusTerm_two]

/-- CENSUS-EXACTNESS at extent e: the per-span censuses are the banked band censuses —
    the EXACT inputs from which the banked resupply law (`freezeoutStaircaseCensus`,
    `staircase_resupplies_removed`) is built. -/
def censusExact (e : ℕ) : Prop :=
  spanCensus e 0 = bandCensus [2, 1, 1, 2, 1]
    ∧ spanCensus e 1 = bandCensus [2, 1, 1, 2]
    ∧ spanCensus e 2 = bandCensus [2, 1, 1]

/-- ★★ EXTENT 1 IS CENSUS-EXACT. -/
theorem censusExact_one : censusExact 1 :=
  ⟨spanCensus_one_bottom, spanCensus_one_charm, spanCensus_one_light⟩

/-! ## (3) THE RESUPPLY WELD: extent 1's staircase IS the banked staircase, which
    re-supplies EXACTLY the removed coloured census. -/

/-- THE STAIRCASE AT EXTENT e: the doubled total (both chiralities) of the two interior
    freeze-out steps read off the extent-e per-span censuses. -/
def staircaseAt (e : ℕ) : ℚ :=
  2 * ((spanCensus e 0 - spanCensus e 1) + (spanCensus e 1 - spanCensus e 2))

/-- ★★ THE EXTENT-1 STAIRCASE IS THE BANKED FREEZE-OUT STAIRCASE — literally the same ℚ
    expression, because the extent-1 per-span censuses are the banked band censuses. -/
theorem staircaseAt_one_eq_banked : staircaseAt 1 = freezeoutStaircaseCensus := by
  unfold staircaseAt freezeoutStaircaseCensus
  rw [spanCensus_one_bottom, spanCensus_one_charm, spanCensus_one_light]

/-- ★★★ EXTENT 1 RE-SUPPLIES EXACTLY THE REMOVED COLOURED CENSUS: `((staircaseAt 1 : ℚ) :
    Cut) = colouredCensus` — the banked resupply law `staircase_resupplies_removed`
    consumed BY NAME. What the census-conserving tail removed, the extent-1 staircase
    supplies, exactly. -/
theorem extent_one_resupplies : ((staircaseAt 1 : ℚ) : Cut) = colouredCensus := by
  rw [staircaseAt_one_eq_banked]
  exact staircase_resupplies_removed

/-- ★★ EXTENT 1 CLOSES THE CENSUS PARTITION: `chargeTraceDepth = staircaseAt 1 +
    leptonCensus` (16/3 = 10/3 + 2) — `census_completeness_closure` consumed BY NAME. -/
theorem extent_one_completes_census :
    chargeTraceDepth = ((staircaseAt 1 : ℚ) : Cut) + leptonCensus := by
  rw [staircaseAt_one_eq_banked]
  exact census_completeness_closure

/-- ★ EXTENT 1 HAS NO DOUBLE-COUNT: `staircaseAt 1 + 2 = 16/3` over ℚ — the banked
    `partition_no_double_count` consumed BY NAME. -/
theorem extent_one_no_double_count : staircaseAt 1 + 2 = 16 / 3 := by
  rw [staircaseAt_one_eq_banked]
  exact partition_no_double_count

/-! ## (4) EXTENT 0 IS REFUTED — UNDER-SUPPLY, on every span. -/

/-- Extent-0 per-span census values: (10/3, 2, 5/3) — the N697 ACTIVE (conservation)
    weights, re-derived from the extent object. -/
theorem spanCensus_zero_bottom : spanCensus 0 0 = 10 / 3 := by
  unfold spanCensus
  norm_num [colouredCensusTerm_one, colouredCensusTerm_two]

theorem spanCensus_zero_charm : spanCensus 0 1 = 2 := by
  unfold spanCensus
  norm_num [colouredCensusTerm_one, colouredCensusTerm_two]

theorem spanCensus_zero_light : spanCensus 0 2 = 5 / 3 := by
  unfold spanCensus
  norm_num [colouredCensusTerm_one, colouredCensusTerm_two]

/-- ★★ EXTENT 0 UNDER-SUPPLIES EVERY SPAN: each extent-0 per-span census is STRICTLY
    BELOW the corresponding banked band census (10/3 < 11/3, 2 < 10/3, 5/3 < 2). The
    conservation frame cannot produce the inputs of the banked resupply law on ANY span. -/
theorem extent_zero_undersupplies_every_span :
    spanCensus 0 0 < spanCensus 1 0
      ∧ spanCensus 0 1 < spanCensus 1 1
      ∧ spanCensus 0 2 < spanCensus 1 2 := by
  rw [spanCensus_zero_bottom, spanCensus_zero_charm, spanCensus_zero_light,
      spanCensus_one_bottom, spanCensus_one_charm, spanCensus_one_light,
      bandCensus_bottom, bandCensus_charm, bandCensus_light]
  norm_num

/-- The total loads: extent 0 delivers 7, extent 1 delivers 9. -/
theorem tailCensusLoad_zero : tailCensusLoad 0 = 7 := by
  unfold tailCensusLoad
  rw [spanCensus_zero_bottom, spanCensus_zero_charm, spanCensus_zero_light]
  norm_num

theorem tailCensusLoad_one : tailCensusLoad 1 = 9 := by
  unfold tailCensusLoad
  rw [spanCensus_one_bottom, spanCensus_one_charm, spanCensus_one_light,
      bandCensus_bottom, bandCensus_charm, bandCensus_light]
  norm_num

/-- ★★ EXTENT 0 UNDER-SUPPLIES THE TOTAL LOAD, strictly: 7 < 9. -/
theorem extent_zero_undersupplies_load : tailCensusLoad 0 < tailCensusLoad 1 := by
  rw [tailCensusLoad_zero, tailCensusLoad_one]
  norm_num

/-- ★ WELD BY NAME: extent 0's bottom-span census is NOT the banked bottom band census —
    N697's `conservation_is_not_band`, consumed as the kill on the extent-0 frame. -/
theorem extent_zero_is_not_band : spanCensus 0 0 ≠ bandCensus [2, 1, 1, 2, 1] := by
  have hval : spanCensus 0 0
      = colouredCensusTerm 2 + colouredCensusTerm 1 + colouredCensusTerm 2
        + colouredCensusTerm 1 := by
    unfold spanCensus
    norm_num
  rw [hval]
  exact conservation_is_not_band

/-- ★ HONESTY — THE NAIVE STAIRCASE TOTAL DOES NOT DISCRIMINATE: the two-step staircase
    total TELESCOPES (first minus last per-span census, doubled), so extent 0 and extent 1
    have the SAME naive total (both 10/3). This is stated, not hidden: the resupply law's
    genuine teeth are PER SPAN — `freezeoutStaircaseCensus` is DEFINED from the banked
    per-span band censuses (11/3, 10/3, 2), and extent 0 fails to produce those
    (`extent_zero_undersupplies_every_span`); the discriminator is per-span census
    exactness plus the load, not the telescoped total. -/
theorem staircase_totals_telescope : staircaseAt 0 = staircaseAt 1 := by
  unfold staircaseAt
  rw [spanCensus_zero_bottom, spanCensus_zero_charm, spanCensus_zero_light,
      spanCensus_one_bottom, spanCensus_one_charm, spanCensus_one_light,
      bandCensus_bottom, bandCensus_charm, bandCensus_light]
  norm_num

/-! ## (5) EXTENT ≥ 2 IS REFUTED — DOUBLE-COUNT and OVERFLOW past the descent floor. -/

/-- At any extent e ≥ 2, the bottom span census is 11/3 (everything screens it). -/
theorem spanCensus_overflow_bottom (n : ℕ) : spanCensus (n + 2) 0 = 11 / 3 := by
  unfold spanCensus
  simp only [if_pos (show (0 : ℕ) < 0 + (n + 2) by omega),
    if_pos (show (0 : ℕ) < 1 + (n + 2) by omega),
    if_pos (show (0 : ℕ) < 2 + (n + 2) by omega),
    if_pos (show (0 : ℕ) < 3 + (n + 2) by omega)]
  rw [colouredCensusTerm_one, colouredCensusTerm_two]
  norm_num

/-- At any extent e ≥ 2, the CHARM span census is 11/3: the bottom flavour — already
    decoupled-and-closed a full span above — screens it AGAIN. The double-count. -/
theorem spanCensus_overflow_charm (n : ℕ) : spanCensus (n + 2) 1 = 11 / 3 := by
  unfold spanCensus
  simp only [if_pos (show (1 : ℕ) < 0 + (n + 2) by omega),
    if_pos (show (1 : ℕ) < 1 + (n + 2) by omega),
    if_pos (show (1 : ℕ) < 2 + (n + 2) by omega),
    if_pos (show (1 : ℕ) < 3 + (n + 2) by omega)]
  rw [colouredCensusTerm_one, colouredCensusTerm_two]
  norm_num

/-- At any extent e ≥ 2, the light span census is at least 10/3 (charm, strange, up,
    down all screen it; bottom too once e > 2). -/
theorem spanCensus_overflow_light (n : ℕ) : 10 / 3 ≤ spanCensus (n + 2) 2 := by
  unfold spanCensus
  simp only [if_pos (show (2 : ℕ) < 1 + (n + 2) by omega),
    if_pos (show (2 : ℕ) < 2 + (n + 2) by omega),
    if_pos (show (2 : ℕ) < 3 + (n + 2) by omega)]
  rw [colouredCensusTerm_one, colouredCensusTerm_two]
  split_ifs <;> norm_num

/-- ★★ THE DOUBLE-COUNT KILL, WELDED BY NAME: at extent 2 the charm-span census carries
    the bottom flavour's term on a span where bottom has ALREADY decoupled-and-closed —
    it equals the five-term sum of N697's `wrong_rule_overfills_charm_span`, which is NOT
    the banked charm band census (11/3 ≠ 10/3). One unit of census is counted twice —
    the partition's no-double-count discipline (`partition_no_double_count`) is violated
    at the per-span level. -/
theorem extent_two_double_counts : spanCensus 2 1 ≠ bandCensus [2, 1, 1, 2] := by
  have hval : spanCensus 2 1
      = colouredCensusTerm 1 + colouredCensusTerm 2 + colouredCensusTerm 1
        + colouredCensusTerm 2 + colouredCensusTerm 1 := by
    unfold spanCensus
    norm_num
  rw [hval]
  exact wrong_rule_overfills_charm_span

/-- ★★ EXTENT ≥ 2 OVER-SUPPLIES THE LOAD, strictly: for every e ≥ 2 the total tail load
    is at least 32/3 > 9 — strictly more than the exact extent-1 load. -/
theorem extent_ge_two_oversupplies (e : ℕ) (he : 2 ≤ e) :
    tailCensusLoad 1 < tailCensusLoad e := by
  obtain ⟨n, rfl⟩ : ∃ n, e = n + 2 := ⟨e - 2, by omega⟩
  rw [tailCensusLoad_one]
  unfold tailCensusLoad
  rw [spanCensus_overflow_bottom, spanCensus_overflow_charm]
  have h := spanCensus_overflow_light n
  linarith

/-- ★★ THE BOUNDARY KILL: the banked descent has EXACTLY 3 spans; at extent e ≥ 2 the
    strange flavour (edge depth 2, the deepest interior edge) DEMANDS screening depth
    2 + e > 3 — a span below `spanLight`, below the confinement floor, which does NOT
    exist in the banked partition. -/
theorem overflow_demands_nonexistent_span (e : ℕ) (he : 2 ≤ e) :
    rangeUpFlavour.length < 2 + e := by
  unfold rangeUpFlavour
  simp only [List.length_cons, List.length_nil]
  omega

/-- ★★ FAITHFULNESS FORCES e ≤ 1: the strange flavour's generated range delivers its
    demanded depth (`(rangeAt 2 e).length = 2 + e`) IFF e ≤ 1. Extent ≥ 2 is not even
    REALIZABLE as a range in the banked 3-span descent — the rule slot's geometry alone
    caps the extent at 1. -/
theorem strange_range_faithful_iff (e : ℕ) :
    (rangeAt 2 e).length = 2 + e ↔ e ≤ 1 := by
  unfold rangeAt rangeUpFlavour
  simp only [List.length_take, List.length_cons, List.length_nil]
  omega

/-! ## (6) UNIQUENESS: extent 1 is THE census-exact extent. -/

/-- ★★★ THE CHARACTERIZATION: an extent is census-exact IFF it is 1. Extent 0 fails on
    the bottom span (10/3 ≠ 11/3, under-supply); every extent ≥ 2 fails on the charm
    span (11/3 ≠ 10/3, the bottom flavour's double-count); extent 1 is exact. -/
theorem censusExact_iff (e : ℕ) : censusExact e ↔ e = 1 := by
  constructor
  · intro h
    match e with
    | 0 =>
      exfalso
      have h0 := h.1
      rw [spanCensus_zero_bottom, bandCensus_bottom] at h0
      norm_num at h0
    | 1 => rfl
    | n + 2 =>
      exfalso
      have h1 := h.2.1
      rw [spanCensus_overflow_charm, bandCensus_charm] at h1
      norm_num at h1
  · rintro rfl
    exact censusExact_one

/-! ## (7) THE UNARY WELD — the closure count IS the unary nest cardinality, by name. -/

/-- The unary nest cardinality is 1 at every depth, at the ℕ level (N679's induction:
    `UnaryNest n` is an inhabited subsingleton — the chain's re-entry structure admits
    EXACTLY ONE nest at every depth). -/
theorem nestCard_eq_one (n : ℕ) : Nat.card (UnaryNest n) = 1 :=
  Nat.card_eq_one_iff_unique.mpr ⟨inferInstance, inferInstance⟩

/-- ★★★ THE CLOSURE RULE IS UNARY: at EVERY seam, the forced closure extent equals the
    unary nest cardinality — `uniformExtent 1 seam = Nat.card (UnaryNest seam)`. One
    miss ⇒ one closure: the SAME unary law that admits exactly one nest per depth
    (N679 `nestCount_eq_one`) and forces exactly one mirror self-insertion per re-entry
    (D = κ₀ + w·D, one w per level). An equation between the banked objects. -/
theorem closure_is_unary (seam : ℕ) :
    uniformExtent 1 seam = Nat.card (UnaryNest seam) := by
  rw [nestCard_eq_one]
  rfl

/-- ★★ THE CENSUS-FORCED EXTENT IS THE NEST COUNT, over the derived Cut: any census-exact
    extent e satisfies `(e : Cut) = nestCount e` — N679's `nestCount_eq_one` consumed BY
    NAME. The extent the resupply law selects and the unary count are the same value. -/
theorem exact_extent_is_nest_count (e : ℕ) (h : censusExact e) :
    (e : Cut) = nestCount e := by
  have he : e = 1 := (censusExact_iff e).mp h
  subst he
  rw [nestCount_eq_one]
  exact Nat.cast_one

/-! ## (8) TEETH — the discriminators are real, also over the derived Cut. -/

/-- ★ W8 — the extent-0 and extent-1 loads differ STRICTLY as Cut values (7 < 9). -/
theorem loads_differ_cut :
    ((tailCensusLoad 0 : ℚ) : Cut) < ((tailCensusLoad 1 : ℚ) : Cut) := by
  rw [tailCensusLoad_zero, tailCensusLoad_one]
  push_cast
  norm_num

/-- ★ W8 — the extent-0 and extent-1 loads are distinct Cut values. -/
theorem loads_ne_cut :
    ((tailCensusLoad 0 : ℚ) : Cut) ≠ ((tailCensusLoad 1 : ℚ) : Cut) :=
  ne_of_lt loads_differ_cut

/-- ★ W8 — the extent-2 load strictly exceeds the extent-1 load (over-supply is real). -/
theorem extent_two_load_gt : tailCensusLoad 1 < tailCensusLoad 2 :=
  extent_ge_two_oversupplies 2 (by norm_num)

/-! ## (9) THE CAPSTONE. -/

/-- ★★★ THE CLOSURE RULE CHARACTERIZED (N701, referee principle 1 — capstone).

    (1) EXTENT 0 REFUTED (under-supply): strictly below the banked band census on EVERY
        span, load 7 < 9, welded to `conservation_is_not_band`;
    (2) EXTENT 1 EXACT: census-exact, its staircase IS the banked
        `freezeoutStaircaseCensus`, re-supplying EXACTLY the removed coloured census
        (`staircase_resupplies_removed`) and closing the census partition
        (`census_completeness_closure`);
    (3) EXTENT ≥ 2 REFUTED (double-count + overflow): the bottom flavour double-screens
        the charm span (`wrong_rule_overfills_charm_span`), the load strictly
        over-supplies, and the strange flavour's demanded depth exceeds the banked
        3-span descent — faithful iff e ≤ 1;
    (4) UNIQUENESS: censusExact e ↔ e = 1;
    (5) THE UNARY WELD: the forced extent at every seam IS the unary nest cardinality
        (`nestCount_eq_one` consumed) — one miss ⇒ one closure, the same unary law as
        the mirror's single self-insertion.

    HONEST GRADE: this proves extent 1 is the UNIQUE member of the uniform-extent rule
    family that is census-exact (= supplies the banked resupply/completeness law's
    inputs), realizable in the banked descent, and unary-consistent. The "why" rests on
    the BANKED completeness law + the banked unary law; the mechanism-identification of
    closure-count with nest-count is a template inference beyond the proved equations. -/
theorem closure_rule_characterized :
    -- (1) extent 0 under-supplies: every span strictly, and the load
    (spanCensus 0 0 < spanCensus 1 0 ∧ spanCensus 0 1 < spanCensus 1 1
      ∧ spanCensus 0 2 < spanCensus 1 2)
    ∧ (tailCensusLoad 0 < tailCensusLoad 1)
    ∧ (spanCensus 0 0 ≠ bandCensus [2, 1, 1, 2, 1])
    -- (2) extent 1 exact: census-exact and resupplies the removed census
    ∧ censusExact 1
    ∧ (staircaseAt 1 = freezeoutStaircaseCensus)
    ∧ (((staircaseAt 1 : ℚ) : Cut) = colouredCensus)
    ∧ (chargeTraceDepth = ((staircaseAt 1 : ℚ) : Cut) + leptonCensus)
    -- (3) extent ≥ 2 refuted: double-count, over-supply, nonexistent span
    ∧ (spanCensus 2 1 ≠ bandCensus [2, 1, 1, 2])
    ∧ (∀ e, 2 ≤ e → tailCensusLoad 1 < tailCensusLoad e)
    ∧ (∀ e, 2 ≤ e → rangeUpFlavour.length < 2 + e)
    ∧ (∀ e, (rangeAt 2 e).length = 2 + e ↔ e ≤ 1)
    -- (4) uniqueness
    ∧ (∀ e, censusExact e ↔ e = 1)
    -- (5) the unary weld
    ∧ (∀ seam, uniformExtent 1 seam = Nat.card (UnaryNest seam))
    ∧ (∀ e, censusExact e → (e : Cut) = nestCount e) :=
  ⟨extent_zero_undersupplies_every_span,
   extent_zero_undersupplies_load,
   extent_zero_is_not_band,
   censusExact_one,
   staircaseAt_one_eq_banked,
   extent_one_resupplies,
   extent_one_completes_census,
   extent_two_double_counts,
   extent_ge_two_oversupplies,
   overflow_demands_nonexistent_span,
   strange_range_faithful_iff,
   censusExact_iff,
   closure_is_unary,
   exact_extent_is_nest_count⟩

end

end Phys.Algebra.ClosureRuleCharacterized
