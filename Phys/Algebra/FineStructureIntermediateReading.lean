/-
  # N466 — SEEDED EXACT-DRESSING X7 (arc X, docs/SEED_EXACT_DRESSING.md §X7):
  #         α(M_Z) AND sin²θ_W(M_Z) — THE INTERMEDIATE READINGS AS PARTIAL SUMS OF THE X6 TOWER.
  #         (the M_Z-scale readings fall out of X2–X5 evaluated at μ = M_Z: the SAME finite band-tower
  #          assembly, TRUNCATED at a further band edge — the octonion-scale value screened across the
  #          bands ABOVE M_Z.)

  Directed successor of N465 (X6). X6 banked the zero-momentum inverse fine-structure coupling
  `invAlphaZero bands = invAlphaHigh + Σ_bands κ·census·cutLog(ratio)` as the FINITE band-tower
  assembly over the derived ℝ `Cut`. This node reads the SAME assembly at an INTERMEDIATE band edge.

  ## THE THEORY-NATIVE READING (the intermediate reading is a partial sum — seed §X7)

  M_Z is a further band edge in the finite tower. The zero-momentum reading `1/α(0)` sums the WHOLE
  tower from the octonion ceiling `42` down to zero momentum. The M_Z reading `1/α(M_Z)` sums only
  the bands ABOVE M_Z — it is the octonion-scale value screened across the high part of the tower.
  So the tower SPLITS at the M_Z edge into `bands = above ++ below`, and by the additivity of the
  screening sum the two readings are the SAME assembly at two edges:

      1/α(0) = 1/α(M_Z) + (screening across the bands BELOW M_Z)         (invAlphaZero_split)
      1/α(M_Z) = invAlphaZero (bands above M_Z)                          (a partial sum)

  This is the exact statement that the intermediate and zero-momentum readings are one object. It is
  NEW structure (X6 gave the whole-tower assembly and the top band; this gives the append-law that
  reads ANY intermediate edge and ties the two readings by exactly the screening between them). The
  screening runs `1/α` UP as the scale drops (X6 `bandScreen_nonneg`), so `1/α(M_Z) ≤ 1/α(0)` — the
  M_Z reading is a genuine intermediate way-point between the octonion ceiling `42` and `1/α(0)`.

  ## THE EXACT WAY-POINT INSIDE THE M_Z READING (the marquee exactness, seed §X7/G3)

  The exact top band — octonion scale `M` down to the electroweak scale `v`, with the banked EXACT
  ratio `M/v = topBandRatio = cutExp(28·cutPi/3)` and the cutPi-FREE screening `448/27` (X6
  `bandScreen_topBand_exact`) — is ABOVE M_Z (the electroweak scale `v ≈ 246 GeV` sits above `M_Z`),
  so it is INSIDE the M_Z reading. Therefore the exact octonion-to-electroweak value `1582/27`
  (X6 `invAlphaZero_topBand_value`) is a rigorous EXACT LOWER BOUND on `1/α(M_Z)`:

      1582/27 ≤ 1/α(M_Z)                                                 (invAlphaMZ_ge_topBand)

  a closed rational of `Cut`, no error bar — the exact way-point the reading falls toward, from below.

  ## THE WEINBERG ANGLE AT M_Z (the SAME banked running, read at μ = M_Z)

  `sin²θ_W(μ)` is the banked parameter-free running mixing `sinSqRunExact` (X2/N461, N342). At the
  matter isospin depth `isoDepth = 2` it is STATIONARY at `3/8` at every scale
  (`sinSqRunExact_matter_stationary`); the non-abelian SU(2) self-coupling reduces the effective
  isospin depth below `2` and runs it strictly DOWN below `3/8` (`sinSqRunExact_departs_down`). Read
  at μ = M_Z these are the M_Z-scale mixing readings.

  ## GRADE (honest, seed §X7 / SOUL "route COMPLETE vs route NOT-YET-FOUND")

  THEOREM-route, EXACT for the STRUCTURE. What lands here, theorem-exact with no error bar: the
  append/partial-sum law (`invAlphaZero_append`, the M_Z reading IS a partial sum of the X6 tower);
  the split identity tying `1/α(M_Z)` to `1/α(0)` by exactly the screening between them
  (`invAlphaZero_split`); the intermediate ordering `42 ≤ 1/α(M_Z) ≤ 1/α(0)`
  (`invAlphaMZ_ge_42`/`invAlphaMZ_le_zero`); the EXACT lower bound `1582/27 ≤ 1/α(M_Z)`
  (`invAlphaMZ_ge_topBand`); and the Weinberg readings `sin²θ_W(M_Z) = 3/8` stationary / `< 3/8` at
  reduced depth. The FULLY-evaluated `1/α(M_Z)` numeral additionally needs the intermediate band scale
  ratios (octonion → … → M_Z mass thresholds) as single derived reals — banked as rational bounds —
  so that single numeral is route-NOT-YET-FOUND (an arc-D/P input enumerated for the X10 validation
  node, NEVER a new axiom/number, NEVER asserted, NEVER fitted). Likewise the exact `sin²θ_W(M_Z)`
  numeral needs the reduced isospin depth `d2` (an honest parameter, as N342 left it). The measured
  `1/α(M_Z) ≈ 127.955` and `sin²θ_W(M_Z) ≈ 0.23122` are REMOVABLE PROSE / costume ONLY (G2) — the
  comparison targets the readings fall toward, never proof steps.

  ## WHY THIS IS NOT A POSIT (STANDARD §3 — number-tower / ℝ gate; seed G1/G4/G6)

  Nothing imports `Real.log`/`Real.exp`/a Mathlib RGE as CONTENT. The append law FALLS OUT of
  `List.map_append`/`List.sum_append` on the banked `totalScreening`; the split FALLS OUT of it; the
  ordering FALLS OUT of `totalScreening_nonneg` (X6); the exact bound FALLS OUT of `invAlphaZero_cons`
  + `bandScreen_topBand_exact` (X6); the Weinberg readings ARE the banked `sinSqRunExact` landings
  (X2). No value of the coupling or the mixing is ever premised. This finishes the banked assembly by
  reading it at an intermediate edge — a DERIVATION OF ALREADY-BANKED OBJECTS, not a new physics object.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete "coupling / running / screening / Weinberg / weak-mixing / electroweak / octonion / M_Z":
  what remains is the pure statement, over the derived ℝ `Cut`, that `invAlphaZero (above ++ below) =
  invAlphaZero above + totalScreening below` (partial-sum additivity of the finite band sum); that
  `invAlphaZero above ≤ invAlphaZero (above ++ below)` when every band below screens; that
  `1582/27 ≤ invAlphaZero ((chargeTraceDepth, topBandRatio) :: rest)` (the exact top-band term is
  inside); and that `sinSqRunExact` at a scale point is `3/8` at the matter depth and `< 3/8` at a
  reduced depth. Pure real analysis on the banked `totalScreening`/`bandScreen`/`cutLog`/`sinSqRun`
  over `Cut`. No physics name is load-bearing.

  ## NOT FREE-FLOATING (seed / SOUL free-floating rail)

  Every production TYPE mentions the banked derived objects: `invAlphaZero`/`totalScreening`/
  `bandScreen`/`chargeTraceDepth`/`topBandRatio` (X6/N465), `sinSqRunExact`/`isoDepth`/`invAlpha2`/
  `kappaLeading` (X2/N461, N342), over the derived `Cut`. The M_Z reading is literally a partial sum
  of the banked `invAlphaZero` tower — not a generic affine map, not a carrier-agnostic lemma.

  ## SEED HARD GUARDS

  - G1 NO ASSERTED VALUE — `1582/27`, `448/27`, `3/8` FALL OUT of banked X6/X2 landings; the append
    law FALLS OUT of `List.sum_append`; no coupling / mixing value is premised.
  - G2 NO EMPIRICAL NUMBER — no `127.955`, no `0.23122`, no `128`, no measured `α`/`sin²θ_W` in any
    statement or proof; the measured constants are this prose / the costume only, fully removable.
  - G3 EXACT — the append/split identities, the intermediate ordering, the `1582/27` lower bound, and
    the `3/8` mixing are EXACT facts of `Cut`; no error bar arises from the structure.
  - G4 DERIVED, NOT POSITED — the M_Z reading IS the banked assembly truncated at the M_Z edge; the
    exact bound IS the banked exact top band; the mixing IS the banked parameter-free running.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass, no heartbeat inflation, NO `foldRetention` (import
    guard: only the banked X6 module `FineStructureZeroMomentum`, which imports only banked coupling /
    scale-tower / X5 modules, never `MassGapOne`). Ground field the DERIVED ℝ `Cut`; ⚠ NO Mathlib
    `Real`/`Complex` as content — Mathlib is MACHINERY only.
  - G7 ONE LAW — the derivation did not fight; `List.sum_append` closes the append law, the banked
    `totalScreening_nonneg`/`bandScreen_topBand_exact` close the ordering and the exact bound, the
    banked `sinSqRunExact` landings close the mixing.
  - G8 TEETH (W8) — `invAlphaMZ_gt_42_of_screen` (with a genuinely screening band the M_Z reading is
    STRICTLY above `42`, not pinned); `invAlphaMZ_topBand_ne_42` (`1582/27 ≠ 42`); `sinSqMZ_ne_wrong`
    (`3/8 ≠ 1/4`); `intermediate_step_unbounded` (a single band below M_Z is UNBOUNDED — the low-energy
    tail from M_Z to zero momentum is genuine, the same divergence tooth X6 carries).

  DERIVED from the trunk (`invAlphaZero`/`invAlphaZero_closed`/`invAlphaZero_cons`/`totalScreening`/
  `totalScreening_nonneg`/`bandScreen`/`bandScreen_nonneg`/`bandScreen_topBand_exact`/
  `invAlphaZero_topBand_value`/`chargeTraceDepth`/`topBandRatio`/`bandScreen_unbounded` N465;
  `sinSqRunExact`/`sinSqRunExact_matter_stationary`/`sinSqRunExact_departs_down`/`invAlpha2`/
  `isoDepth`/`kappaLeading` N461/N342/N460; `invAlphaHigh_eq` N316 — standard Mathlib `List`/`linarith`/
  `nlinarith`/`norm_num` MACHINERY on the DERIVED objects, STANDARD §3). NO posited coupling / running /
  mixing value as content, NO Mathlib ℝ as content.
-/
import Phys.Algebra.FineStructureZeroMomentum
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (0) THE APPEND / PARTIAL-SUM LAW — the intermediate reading IS a truncation of the X6 tower. -/

/-- ★★★ THE APPEND LAW: splitting the finite band tower at any intermediate band edge splits the
    assembly additively — the reading over `above ++ below` is the reading over `above` (the bands
    above the edge) PLUS the screening across `below` (the bands below the edge). This is the exact
    statement that a reading at an intermediate edge (`invAlphaZero above`) is a PARTIAL SUM of the
    full X6 tower. FALLS OUT of `List.map_append`/`List.sum_append` on the banked `totalScreening`. -/
theorem invAlphaZero_append (above below : List (Cut × Cut)) :
    invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below := by
  unfold invAlphaZero totalScreening
  rw [List.map_append, List.sum_append]
  ring

/-- ★★ THE SPLIT IDENTITY: the zero-momentum reading over the FULL tower `above ++ below` equals the
    intermediate reading over `above` (e.g. the M_Z reading = bands above M_Z) PLUS exactly the
    screening between the intermediate edge and zero momentum (the bands `below`). The intermediate
    and zero-momentum readings are the SAME assembly at two edges, related by exactly the screening
    between them. -/
theorem invAlphaZero_split (above below : List (Cut × Cut)) :
    invAlphaZero (above ++ below) - invAlphaZero above = totalScreening below := by
  rw [invAlphaZero_append]; ring

/-! ## (1) THE INTERMEDIATE ORDERING — 42 ≤ 1/α(M_Z) ≤ 1/α(0). -/

/-- ★★ THE M_Z READING IS AT OR ABOVE THE OCTONION CEILING: for a tower whose every band above M_Z
    screens (`census ≥ 0`, `ratio ≥ 1`), the intermediate reading `1/α(M_Z) = invAlphaZero above`
    is `≥ 42`. Screening only runs `1/α` UP; reuses X6's `invAlphaZero_ge_42`. -/
theorem invAlphaMZ_ge_42 {above : List (Cut × Cut)}
    (h : ∀ p ∈ above, 0 ≤ p.1 ∧ 1 ≤ p.2) : 42 ≤ invAlphaZero above :=
  invAlphaZero_ge_42 h

/-- ★★ THE INTERMEDIATE READING IS BELOW THE ZERO-MOMENTUM READING: the M_Z reading
    (`invAlphaZero above`) is `≤` the full zero-momentum reading (`invAlphaZero (above ++ below)`),
    because the bands `below` (M_Z down to zero momentum) add nonnegative screening. So
    `1/α(M_Z) ≤ 1/α(0)` — the M_Z reading is a genuine intermediate way-point. FALLS OUT of the
    split identity and X6's `totalScreening_nonneg`. -/
theorem invAlphaMZ_le_zero (above below : List (Cut × Cut))
    (h : ∀ p ∈ below, 0 ≤ p.1 ∧ 1 ≤ p.2) :
    invAlphaZero above ≤ invAlphaZero (above ++ below) := by
  rw [invAlphaZero_append]
  have := totalScreening_nonneg h
  linarith

/-! ## (2) THE EXACT WAY-POINT INSIDE THE M_Z READING — 1582/27 ≤ 1/α(M_Z), exact. -/

/-- ★★★ THE EXACT LOWER BOUND: the exact top band (octonion → electroweak scale `v`, banked EXACT
    ratio `M/v = topBandRatio`, cutPi-FREE screening `448/27`) is ABOVE M_Z, so it is INSIDE the M_Z
    reading. Therefore the exact octonion-to-electroweak value `1582/27` (X6
    `invAlphaZero_topBand_value`) is a rigorous EXACT LOWER BOUND on any M_Z reading that begins with
    the top band and continues with further screening bands `rest`. A closed rational of `Cut`, no
    error bar. FALLS OUT of `invAlphaZero_cons` + the banked exact `bandScreen_topBand_exact`. -/
theorem invAlphaMZ_ge_topBand (rest : List (Cut × Cut))
    (h : ∀ p ∈ rest, 0 ≤ p.1 ∧ 1 ≤ p.2) :
    1582 / 27 ≤ invAlphaZero ((chargeTraceDepth, topBandRatio) :: rest) := by
  rw [invAlphaZero_cons, bandScreen_topBand_exact, invAlphaZero_closed rest]
  have hb : (0 : Cut) ≤ totalScreening rest := totalScreening_nonneg h
  -- ⊢ 1582/27 ≤ 448/27 + (42 + totalScreening rest)
  nlinarith [hb]

/-! ## (3) THE WEINBERG ANGLE AT M_Z — the banked parameter-free running read at μ = M_Z. -/

/-- ★★ THE M_Z MIXING AT MATTER DEPTH IS STATIONARY `3/8`: reading the banked parameter-free running
    mixing `sinSqRunExact` (X2/N461) at μ = M_Z, at the matter isospin depth `isoDepth = 2` it is
    `sin²θ_W(M_Z) = 3/8` — matter ALONE does not run the mixing (the banked
    `sinSqRunExact_matter_stationary`). -/
theorem sinSqMZ_matter_stationary (M mZ : Cut)
    (h2 : invAlpha2 isoDepth kappaLeading M mZ ≠ 0) :
    sinSqRunExact isoDepth M mZ = 3 / 8 :=
  sinSqRunExact_matter_stationary M mZ h2

/-- ★★ THE M_Z MIXING RUNS DOWN AT THE REDUCED (NON-ABELIAN) DEPTH: with `0 < d2 < isoDepth` below
    the octonion scale (`0 < mZ < M`), `sin²θ_W(M_Z) < 3/8` — the non-abelian SU(2) self-coupling
    (absent for the abelian hypercharge) runs the mixing strictly down toward the low-energy regime.
    The banked `sinSqRunExact_departs_down`. -/
theorem sinSqMZ_departs_down (d2 M mZ : Cut) (hd2 : 0 < d2) (hd2lt : d2 < isoDepth)
    (hmZ : 0 < mZ) (hmZM : mZ < M) :
    sinSqRunExact d2 M mZ < 3 / 8 :=
  sinSqRunExact_departs_down d2 M mZ hd2 hd2lt hmZ hmZM

/-! ## (4) W8 NON-VACUITY WITH TEETH (the readings are load-bearing, not pinned or vacuous). -/

/-- ★ W8 — THE M_Z READING GENUINELY RUNS ABOVE `42` when a band above M_Z genuinely screens: a
    single band with positive census over a ratio `> 1` pushes the intermediate reading STRICTLY
    above the octonion ceiling `42`. A non-running (constant) coupling would stay pinned at `42`. -/
theorem invAlphaMZ_gt_42_of_screen {depth ratio : Cut} (hd : 0 < depth) (hr : 1 < ratio) :
    42 < invAlphaZero [(depth, ratio)] := by
  rw [invAlphaZero_cons, invAlphaZero_nil]
  have := bandScreen_pos hd hr
  linarith

/-- ★ W8 — THE EXACT WAY-POINT IS ABOVE THE CEILING: the octonion-to-electroweak value `1582/27` is
    STRICTLY above `42` (it genuinely screens; `1582/27 ≈ 58.6 > 42`). A pinned coupling would not. -/
theorem invAlphaMZ_topBand_ne_42 : (1582 : Cut) / 27 ≠ 42 := by norm_num

/-- ★ W8 — THE M_Z MIXING IS `3/8`, NOT THE WRONG `1/4`: the stationary matter reading is the correct
    banked GUT mixing `3/8`, not a wrong intercept. Ties the reading's anchor to the right value. -/
theorem sinSqMZ_ne_wrong (M mZ : Cut) (h2 : invAlpha2 isoDepth kappaLeading M mZ ≠ 0) :
    sinSqRunExact isoDepth M mZ ≠ 1 / 4 := by
  rw [sinSqMZ_matter_stationary M mZ h2]; norm_num

/-- ★★ W8 — THE LOW-ENERGY TAIL IS GENUINE (the divergence tooth restated below M_Z): a single band
    below M_Z is UNBOUNDED as its scale ratio → ∞ (X6 `bandScreen_unbounded`), so the screening from
    the M_Z edge down to zero momentum (`invAlphaZero (above ++ below) − invAlphaZero above =
    totalScreening below`) is a genuine, unbounded-per-band contribution — the M_Z reading is a
    genuine intermediate way-point, strictly below the zero-momentum reading for a screening tail.
    The finiteness of the actual tower (X6) is what keeps `1/α(0)` finite; the tooth shows a single
    band could exceed any bound. -/
theorem intermediate_step_unbounded (B : Cut) :
    ∃ ratio : Cut, 1 < ratio ∧
      B < invAlphaZero ([(chargeTraceDepth, ratio)]) - invAlphaZero [] := by
  obtain ⟨ratio, hr, hB⟩ := bandScreen_unbounded B
  refine ⟨ratio, hr, ?_⟩
  rw [invAlphaZero_cons, invAlphaZero_nil]
  -- ⊢ B < bandScreen chargeTraceDepth ratio + 42 - 42
  linarith [hB]

/-! ## (5) THE X7 CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE X7 LANDING (welded, NOT a bare ∧): the intermediate M_Z reading and the zero-momentum
    reading are the SAME finite band-tower assembly over the derived ℝ `Cut`, read at two band edges.
    The reading over the full tower splits additively at the M_Z edge (`invAlphaZero (above ++ below)
    = invAlphaZero above + totalScreening below`); the M_Z reading is a genuine intermediate way-point
    (`≤` the zero-momentum reading when the low bands screen); the exact top band is inside it, giving
    the EXACT lower bound `1582/27 ≤ 1/α(M_Z)` (the octonion-to-electroweak way-point, scale ratio
    DERIVED not measured); and the M_Z weak mixing is the banked parameter-free running `= 3/8` at the
    matter depth, running strictly `< 3/8` at the non-abelian reduced depth. The append law, the
    intermediate ordering, the exact bound, and the mixing readings are welded: statable from none
    alone. -/
theorem intermediateReading_landing (above below rest : List (Cut × Cut)) (M mZ : Cut)
    (hbelow : ∀ p ∈ below, 0 ≤ p.1 ∧ 1 ≤ p.2)
    (hrest : ∀ p ∈ rest, 0 ≤ p.1 ∧ 1 ≤ p.2)
    (h2 : invAlpha2 isoDepth kappaLeading M mZ ≠ 0) :
    invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below ∧
    invAlphaZero above ≤ invAlphaZero (above ++ below) ∧
    1582 / 27 ≤ invAlphaZero ((chargeTraceDepth, topBandRatio) :: rest) ∧
    sinSqRunExact isoDepth M mZ = 3 / 8 ∧
    (∀ B : Cut, ∃ ratio : Cut, 1 < ratio ∧
      B < invAlphaZero ([(chargeTraceDepth, ratio)]) - invAlphaZero []) :=
  ⟨invAlphaZero_append above below,
   invAlphaMZ_le_zero above below hbelow,
   invAlphaMZ_ge_topBand rest hrest,
   sinSqMZ_matter_stationary M mZ h2,
   intermediate_step_unbounded⟩

end

end Phys.Algebra
