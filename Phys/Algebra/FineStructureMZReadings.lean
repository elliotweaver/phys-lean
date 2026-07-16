/-
  # N466 — SEEDED EXACT-DRESSING X7 (arc X, docs/SEED_EXACT_DRESSING.md §X7):
  #         α(M_Z) and sin²θ_W(M_Z) — THE INTERMEDIATE READINGS as internal way-points of the
  #         SAME finite band-tower assembly (X6) / scale-resolved self-overlap (X2).
  #         (M_Z is a NON-special band edge in the finite tower; the reading at that edge is a
  #          PARTIAL SUM of the X6 tower, bracketed between the octonion ceiling and 1/α(0), with an
  #          EXACT cutPi-free electroweak way-point 1582/27.)

  Directed successor of N465 (X6). The X6 node assembled the FULL zero-momentum tower
  `invAlphaZero bands = 42 + Σ_bands κ·census_b·cutLog(ratio_b)` and gave the EXACT top band (the
  octonion-to-electroweak value `1582/27`). The X2 node (N461) gave the scale-resolved running law
  `invAlphaRunExact`/`sinSqRunExact`. This node reads the SAME assembly at an INTERMEDIATE band edge
  (the electroweak / M_Z region) — no new physics object, a resolution of the banked tower at a
  further edge.

  ## THE THEORY-NATIVE READING (the content beyond X6/X2 — seed §X7)

  M_Z is NOT a distinguished reference scale. In standard electroweak theory it is the anchor at
  which `α(M_Z)` and `sin²θ_W(M_Z)` are MEASURED and from which the running is integrated. The fold
  DISSOLVES its special status: M_Z is simply one more band edge in the FINITE tower descending from
  the octonion ceiling. So the reading at that edge is the assembly restricted to the bands ABOVE the
  edge — a PARTIAL SUM of the X6 tower. The one structural fact that makes this work is that the
  finite band tower DECOMPOSES ADDITIVELY at ANY edge:

      invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below      (X7 core)

  i.e. `1/α(0) = 1/α(edge) + (screening across the bands below the edge)`. The intermediate reading
  `1/α(edge) = invAlphaZero above` is therefore BRACKETED:

      42 ≤ 1/α(edge) ≤ 1/α(0)                                                        (the bracketing)

  the octonion ceiling below (screening only runs `1/α` UP) and the full zero-momentum value above
  (the below-edge tail is a nonnegative screening tower). This is the theory-native content standard
  physics lacks: the intermediate reading is not a free anchor to be measured — it is a partial sum
  squeezed between two DERIVED endpoints.

  ## THE EXACT ELECTROWEAK WAY-POINT (the marquee exactness carried down — seed §X6/§X7, G3)

  At the electroweak edge `v`, the bands above `v` are exactly the top band (octonion → electroweak),
  whose screening is the EXACT cutPi-free rational `448/27` (X6 `bandScreen_topBand_exact`, the `cutPi`
  cancelling between the derived `κ` and the banked exact ratio `ewClosureRatio`). So the reading at
  the electroweak edge is the EXACT `1/α = 1582/27` (X6 `invAlphaZero_topBand_value`). The M_Z edge is
  a further edge just below `v`; by the additive decomposition,

      1/α(M_Z) = 1582/27 + totalScreening (v→M_Z sub-band)                           (invAlphaMZ_decomp)

  so `1582/27` is an EXACT lower way-point (bracket) of the M_Z reading (`invAlphaMZ_ge_ewpoint`). The
  fully-evaluated `1/α(M_Z)` numeral additionally needs the `v/M_Z` sub-band scale ratio as a single
  derived real; that ratio is currently banked only as bounds (like X6's low-energy edges), so the
  full numeral is route-NOT-YET-FOUND (enumerated for the X10 validation node) — NOT asserted, NOT
  fitted. The EXACT lower way-point and the bracketing structure ARE the deliverable.

  ## THE WEINBERG READING AT M_Z (the SAME gather self-overlap, other observable — seed §X7)

  `sin²θ_W(M_Z)` is read at the SAME band edge as `1/α`, via the banked `sinSqRunExact` (X2/N461).
  At the matter isospin depth `d2 = isoDepth = 2` the mixing is STATIONARY at the EXACT `3/8`
  (`sinSqMZ_matter_stationary`); the non-abelian SU(2) self-coupling reduces the isospin depth
  (`0 < d2 < isoDepth`), running the mixing STRICTLY BELOW `3/8` toward the low-energy regime
  (`sinSqMZ_departs_down`). Both observables at M_Z are scale-resolved evaluations of the ONE gather
  self-overlap — the same object, read at the same edge.

  ## GRADE (honest, seed §X7 / SOUL "route COMPLETE vs route NOT-YET-FOUND")

  THEOREM-route, EXACT. What lands here, theorem-exact with no error bar: the additive edge
  decomposition (`invAlphaZero_append`); the `42 ≤ 1/α(edge) ≤ 1/α(0)` bracketing; the EXACT
  electroweak way-point `1582/27` as an exact lower bracket of the M_Z reading; the Weinberg
  matter-stationary `3/8` and the reduced-depth departure. Route-NOT-YET-FOUND (enumerated for X10):
  the fully-evaluated `1/α(M_Z)` numeral (needs the `v/M_Z` sub-band ratio as a single derived real,
  banked as bounds) and the `sin²θ_W(M_Z)` numeral (needs the reduced isospin depth and the M/M_Z
  ratio). The measured `1/α(M_Z) ≈ 127.955` and `sin²θ_W(M_Z) ≈ 0.23122` are REMOVABLE PROSE /
  costume ONLY (G2), never a proof step.

  ## WHY THIS IS NOT A POSIT (STANDARD §3 — number-tower / ℝ gate; seed G1/G4/G6)

  Nothing imports `Real.log`, `Real.exp`, or a Mathlib RGE / measured threshold as CONTENT. The edge
  decomposition FALLS OUT of `List.map_append` + `List.sum_append` on the banked `totalScreening`. The
  bracketing FALLS OUT of the banked `totalScreening_nonneg` / `invAlphaZero_ge_42`. The exact
  way-point FALLS OUT of the banked `invAlphaZero_topBand_value`. The Weinberg readings FALL OUT of the
  banked `sinSqRunExact` landings. No value of the coupling or the mixing at M_Z is ever premised. This
  resolves the banked X6 tower at a further edge — a DERIVATION OF AN ALREADY-BANKED OBJECT.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete "coupling / running / screening / band / electroweak / M_Z / octonion / weak mixing angle":
  what remains is the pure statement, over the derived ℝ `Cut`, that for the finite-list assembly
  `f(bands) = 42 + Σ_i κ·depthᵢ·cutLog(ratioᵢ)`, `f(above ++ below) = f(above) + Σ_below`; that
  `42 ≤ f(above) ≤ f(above ++ below)` when the below-list is a nonnegative-census, ratio-≥-1 list; that
  at the banked exact ratio `cutExp(28·cutPi/3)` the single-band reading is `1582/27`; and that the
  ratio `a₂/(a₂+a_Y)` equals `3/8` at the proportional depth and is `< 3/8` for a reduced depth. Pure
  real analysis on the banked `cutLog`/`cutExp`/`cutPi`/`κ`/`Tr(Q²)`/`ewClosureRatio` over `Cut`.

  ## NOT FREE-FLOATING (seed / SOUL free-floating rail)

  Every production TYPE mentions the banked derived objects: `invAlphaZero`/`totalScreening`/
  `bandScreen`/`topBandRatio`/`chargeTraceDepth`/`invAlphaHigh` (X6/N465, X3/N317, N316) and
  `sinSqRunExact`/`isoDepth`/`invAlpha2`/`kappaLeading` (X2/N461, N342, N460) over `Cut`. The
  intermediate reading is literally `invAlphaZero` restricted to the above-edge sub-list — not a
  generic affine map, not a carrier-agnostic lemma.

  ## SEED HARD GUARDS

  - G1 NO ASSERTED VALUE — `1582/27` FALLS OUT of the banked `invAlphaZero_topBand_value`; the
    decomposition and bracketing FALL OUT of `List` lemmas + banked nonnegativity; no M_Z coupling /
    mixing value is premised.
  - G2 NO EMPIRICAL NUMBER — no `127.955`, no `0.23122`, no measured `α(M_Z)` / `sin²θ_W(M_Z)` in any
    statement or proof; the measured constants are this prose / the costume only, fully removable.
  - G3 EXACT — the edge decomposition, the bracketing, the exact way-point `1582/27`, and the Weinberg
    `3/8` are EXACT derived facts of `Cut`; no error bar arises from the structure.
  - G4 DERIVED, NOT POSITED — the ceiling `42` is the cascade stop (banked), the top band is the banked
    exact ratio, the reading is a partial sum of the banked finite tower, the mixing is the banked
    `sinSqRunExact`.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass, no heartbeat inflation, NO `foldRetention` (import
    guard: only banked X6 / X2 coupling modules, never `MassGapOne`). Ground field the DERIVED ℝ `Cut`;
    ⚠ NO Mathlib `Real`/`Complex` as content — Mathlib is MACHINERY only.
  - G7 ONE LAW — the derivation did not fight; the banked `List.map_append`/`List.sum_append`,
    `totalScreening_nonneg`, `invAlphaZero_topBand_value`, and `sinSqRunExact_*` close every step.
  - G8 TEETH (W8) — `invAlphaMZ_gt_42` (the M_Z reading genuinely screens above the octonion ceiling —
    it is NOT pinned at 42); `invAlphaMZ_ge_ewpoint` witnesses the exact way-point genuinely lower-brackets
    it; `invAlphaZero_at_ew_edge_ne_wrong` (the electroweak way-point is `1582/27`, NOT the un-screened
    `42`); `sinSqMZ_ne_wrong` (the mixing reading is `3/8`, NOT the wrong `1/4`).

  DERIVED from the trunk (X6: `invAlphaZero`/`invAlphaZero_closed`/`invAlphaZero_cons`/`invAlphaZero_nil`/
  `totalScreening`/`totalScreening_nonneg`/`invAlphaZero_ge_42`/`bandScreen`/`bandScreen_nonneg`/
  `topBandRatio`/`invAlphaZero_topBand_value`/`invAlphaZero_topBand_gt_42` N465; X3/N317
  `chargeTraceDepth`/`chargeTraceDepth_pos`; X2/N461 `sinSqRunExact`/`sinSqRunExact_matter_stationary`/
  `sinSqRunExact_departs_down`; N342 `isoDepth`/`invAlpha2`/`kappaLeading` — standard Mathlib `List`/
  `linarith`/`norm_num` MACHINERY on the DERIVED objects, STANDARD §3). NO posited coupling / mixing
  value as content, NO Mathlib ℝ as content.
-/
import Phys.Algebra.FineStructureZeroMomentum
import Phys.Algebra.FineStructureRunningExact
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (0) THE ADDITIVE EDGE DECOMPOSITION — the reading at a band edge is a PARTIAL SUM. -/

/-- THE TOTAL SCREENING IS ADDITIVE OVER APPEND: splitting the tower at any edge splits the screening
    sum. `List.map_append` + `List.sum_append` on the banked `totalScreening`. -/
theorem totalScreening_append (above below : List (Cut × Cut)) :
    totalScreening (above ++ below) = totalScreening above + totalScreening below := by
  unfold totalScreening
  rw [List.map_append, List.sum_append]

/-- ★★★ THE ADDITIVE EDGE DECOMPOSITION (the X7 core): the zero-momentum assembly across the FULL
    tower splits at ANY band edge into the reading at that edge PLUS the screening across the bands
    below it:
        invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below.
    This IS "M_Z is a band edge; `1/α(0) = 1/α(M_Z) + (screening below M_Z)`" — the intermediate
    reading is a PARTIAL SUM of the X6 tower, not a free anchor. -/
theorem invAlphaZero_append (above below : List (Cut × Cut)) :
    invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below := by
  unfold invAlphaZero totalScreening
  rw [List.map_append, List.sum_append]; ring

/-! ## (1) THE BRACKETING — `42 ≤ 1/α(edge) ≤ 1/α(0)`. -/

/-- ★★ THE INTERMEDIATE READING NEVER EXCEEDS THE ZERO-MOMENTUM VALUE: for a below-edge tail that
    screens (each band `census ≥ 0`, `ratio ≥ 1`), the reading at the edge is at most the full
    zero-momentum reading — the below-edge screening only ADDS. `1/α(edge) ≤ 1/α(0)`. -/
theorem invAlphaZero_edge_le (above below : List (Cut × Cut))
    (h : ∀ p ∈ below, 0 ≤ p.1 ∧ 1 ≤ p.2) :
    invAlphaZero above ≤ invAlphaZero (above ++ below) := by
  rw [invAlphaZero_append]
  have := totalScreening_nonneg h
  linarith

/-- ★★ THE FULL BRACKETING: for an above-edge tower that screens and a below-edge tail that screens,
    `42 ≤ 1/α(edge) ≤ 1/α(0)`. The intermediate reading is squeezed between the octonion ceiling
    (screening only runs `1/α` UP) and the full zero-momentum value (the below-edge tail is a
    nonnegative screening tower) — two DERIVED endpoints, not a measured anchor. -/
theorem invAlphaZero_edge_bracketed (above below : List (Cut × Cut))
    (habove : ∀ p ∈ above, 0 ≤ p.1 ∧ 1 ≤ p.2)
    (hbelow : ∀ p ∈ below, 0 ≤ p.1 ∧ 1 ≤ p.2) :
    42 ≤ invAlphaZero above ∧ invAlphaZero above ≤ invAlphaZero (above ++ below) :=
  ⟨invAlphaZero_ge_42 habove, invAlphaZero_edge_le above below hbelow⟩

/-! ## (2) THE EXACT ELECTROWEAK WAY-POINT `1582/27` and the M_Z decomposition. -/

/-- THE READING AT THE ELECTROWEAK EDGE is the EXACT `1/α = 1582/27`: the bands above the electroweak
    edge are exactly the top band (octonion → electroweak), whose screening is the exact cutPi-free
    rational `448/27` (X6). The banked `invAlphaZero_topBand_value`. -/
theorem invAlphaZero_at_ew_edge :
    invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  invAlphaZero_topBand_value

/-- ★★★ THE M_Z READING DECOMPOSES OFF THE EXACT WAY-POINT: the M_Z edge is a further edge just below
    the electroweak edge `v`, so the reading at M_Z is the EXACT electroweak way-point `1582/27` PLUS
    the screening across the sub-band from `v` down to M_Z:
        1/α(M_Z) = 1582/27 + totalScreening (v→M_Z sub-band).
    The exact way-point falls out of the banked top-band value; the `v→M_Z` sub-band ratio is
    route-NOT-YET-FOUND (banked as bounds; enumerated for X10), never asserted. -/
theorem invAlphaMZ_decomp (belowV : List (Cut × Cut)) :
    invAlphaZero ([(chargeTraceDepth, topBandRatio)] ++ belowV)
      = 1582 / 27 + totalScreening belowV := by
  rw [invAlphaZero_append, invAlphaZero_at_ew_edge]

/-- ★★ THE EXACT WAY-POINT LOWER-BRACKETS THE M_Z READING: for a `v→M_Z` sub-band that screens
    (each band `census ≥ 0`, `ratio ≥ 1`), the M_Z reading is at least the EXACT electroweak
    way-point `1582/27`. `1582/27` is an exact lower bracket of `1/α(M_Z)`. -/
theorem invAlphaMZ_ge_ewpoint (belowV : List (Cut × Cut))
    (h : ∀ p ∈ belowV, 0 ≤ p.1 ∧ 1 ≤ p.2) :
    1582 / 27 ≤ invAlphaZero ([(chargeTraceDepth, topBandRatio)] ++ belowV) := by
  rw [invAlphaMZ_decomp]
  have := totalScreening_nonneg h
  linarith

/-! ## (3) THE WEINBERG READING AT M_Z (the same gather self-overlap, other observable). -/

/-- ★★ THE WEINBERG READING IS STATIONARY AT THE MATTER DEPTH: at the matter isospin depth
    `d2 = isoDepth = 2`, `sin²θ_W(M_Z) = 3/8` at EVERY band edge — matter ALONE does not run the
    mixing. The banked `sinSqRunExact_matter_stationary` (X2/N461) read at the M_Z edge. -/
theorem sinSqMZ_matter_stationary (M mz : Cut)
    (h2 : invAlpha2 isoDepth kappaLeading M mz ≠ 0) :
    sinSqRunExact isoDepth M mz = 3 / 8 :=
  sinSqRunExact_matter_stationary M mz h2

/-- ★★ THE WEINBERG READING DEPARTS DOWN AT THE REDUCED DEPTH: with the non-abelian-reduced isospin
    depth `0 < d2 < isoDepth` below the octonion scale, `sin²θ_W(M_Z)` runs STRICTLY BELOW `3/8`
    toward the low-energy regime. The banked `sinSqRunExact_departs_down` (X2/N461) at the M_Z edge. -/
theorem sinSqMZ_departs_down (d2 M mz : Cut) (hd2 : 0 < d2) (hd2lt : d2 < isoDepth)
    (hmz : 0 < mz) (hmzM : mz < M) :
    sinSqRunExact d2 M mz < 3 / 8 :=
  sinSqRunExact_departs_down d2 M mz hd2 hd2lt hmz hmzM

/-! ## (4) W8 NON-VACUITY WITH TEETH (the readings genuinely screen; the wrong values are excluded). -/

/-- ★ W8 — THE M_Z READING GENUINELY SCREENS ABOVE THE CEILING: for a `v→M_Z` sub-band that screens,
    the M_Z reading STRICTLY EXCEEDS the octonion ceiling `42` (it is `≥ 1582/27 ≈ 58.6 > 42`). A
    non-screening (constant) coupling would stay pinned at `42`. -/
theorem invAlphaMZ_gt_42 (belowV : List (Cut × Cut))
    (h : ∀ p ∈ belowV, 0 ≤ p.1 ∧ 1 ≤ p.2) :
    42 < invAlphaZero ([(chargeTraceDepth, topBandRatio)] ++ belowV) := by
  have := invAlphaMZ_ge_ewpoint belowV h
  linarith

/-- ★ W8 — THE ELECTROWEAK WAY-POINT IS LOAD-BEARING: the reading at the electroweak edge is the
    screened `1582/27`, NOT the un-screened octonion ceiling `42`. The top-band screening genuinely
    moves the reading off the ceiling. -/
theorem invAlphaZero_at_ew_edge_ne_wrong :
    invAlphaZero [(chargeTraceDepth, topBandRatio)] ≠ 42 := by
  rw [invAlphaZero_at_ew_edge]; norm_num

/-- ★ W8 — THE WEINBERG READING IS `3/8`, NOT THE WRONG `1/4`: at the matter isospin depth the M_Z
    mixing reading is the correct banked GUT value `3/8`, not the wrong `1/4`. -/
theorem sinSqMZ_ne_wrong (M mz : Cut) (h2 : invAlpha2 isoDepth kappaLeading M mz ≠ 0) :
    sinSqRunExact isoDepth M mz ≠ 1 / 4 := by
  rw [sinSqMZ_matter_stationary M mz h2]; norm_num

/-! ## (5) THE X7 CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE X7 LANDING (welded, NOT a bare ∧): the intermediate M_Z-scale readings are internal
    way-points of the SAME finite band-tower assembly (X6) / scale-resolved self-overlap (X2). The
    full zero-momentum assembly DECOMPOSES ADDITIVELY at ANY band edge into the reading at that edge
    plus the below-edge screening; so the reading at the electroweak edge is the EXACT cutPi-free
    way-point `1582/27`, the M_Z reading decomposes off it (`= 1582/27 + (v→M_Z sub-band screening)`),
    it is bracketed `42 ≤ reading ≤ 1/α(0)` and genuinely screens above `42`; and the weak mixing
    reading at the same edge is the stationary `3/8` at the matter isospin depth, running strictly
    below `3/8` for the non-abelian-reduced depth. The additive decomposition, the exact electroweak
    way-point, the M_Z decomposition, the bracketing/screening, and the two Weinberg readings are
    welded: statable from none alone. -/
theorem mzReadings_landing (above below belowV : List (Cut × Cut)) (M mz : Cut)
    (habove : ∀ p ∈ above, 0 ≤ p.1 ∧ 1 ≤ p.2)
    (hbelow : ∀ p ∈ below, 0 ≤ p.1 ∧ 1 ≤ p.2)
    (hbV : ∀ p ∈ belowV, 0 ≤ p.1 ∧ 1 ≤ p.2)
    (hd2 : 0 < mz) (hmzM : mz < M)
    (h2 : invAlpha2 isoDepth kappaLeading M mz ≠ 0) :
    invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below ∧
    invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 ∧
    invAlphaZero ([(chargeTraceDepth, topBandRatio)] ++ belowV) = 1582 / 27 + totalScreening belowV ∧
    (42 ≤ invAlphaZero above ∧ invAlphaZero above ≤ invAlphaZero (above ++ below)) ∧
    42 < invAlphaZero ([(chargeTraceDepth, topBandRatio)] ++ belowV) ∧
    sinSqRunExact isoDepth M mz = 3 / 8 ∧
    (∀ d2 : Cut, 0 < d2 → d2 < isoDepth → sinSqRunExact d2 M mz < 3 / 8) :=
  ⟨invAlphaZero_append above below,
   invAlphaZero_at_ew_edge,
   invAlphaMZ_decomp belowV,
   invAlphaZero_edge_bracketed above below habove hbelow,
   invAlphaMZ_gt_42 belowV hbV,
   sinSqMZ_matter_stationary M mz h2,
   fun d2 hd2p hd2lt => sinSqMZ_departs_down d2 M mz hd2p hd2lt hd2 hmzM⟩

end

end Phys.Algebra
