# PREREG — DERIVE the join splitting ratio j from the banked transmutation-join / degeneracy (t_2b6af6fb)

## FRONT (theory-native, run the anti-bullshit gate FIRST)

The D2d `JoinContent` capstone carries ONE route-not-yet-found bounded residual: the join splitting
ratio `j` (bounded `1 < j`), with `joinContent w j = κ(w)·mirrorMultCensus·cutLog j` bounded by
`κ(w)·3·cutLog R`. With `s` now pinned (=1/8, ComposedNumeralSPinned), `j` is the DOMINANT remaining
residual. DERIVE it — no fit.

### The theory-native reading (what the fold's OWN structure says)

`joinContent w j` is a BAND term: `j` is a BAND RATIO — the ratio of the two edge SCALES of the
mirror-multiplet band, exactly as every banked band ratio is a ratio of its two derived edges
(`confBandRatio = ewEdgeScale/confEdgeScale`, `bandScreen chargeTraceDepth confBandRatio = 128/27`).

The mirror band's two edges are the two halves the last Cayley–Dickson doubling `O = CD(H)` tears
`ImO` into (N277): the UN-DOUBLED triplet `TL = ImH = span{u1,e2O,e3O}` and the DOUBLED MIRROR
triplet `TR = ℓ·ImH = span{e5O,e6O,e7O}`. In the fold's OWN scale dictionary — the Born self-overlap
`gForm` that X4 uses to quantise the mass-gap SCALE (floor level = `gForm = 1` = the confinement/
light-vector edge) — the scale of a multiplet is the Born self-overlap of its generators.

- `gForm u1 u1 = 1`      (banked; the un-doubled TL generator is a unit octonion)
- `gForm e5O e5O = 1`    (`gForm_self_sum_sq`; the doubled mirror TR generator is a unit octonion)

⭐ ONE CAUSE, TWO DEGENERACIES: the last Cayley–Dickson doubling is a COMPOSITION-algebra
(norm-multiplicative → ISOMETRIC) doubling — that is exactly what keeps `O` a normed division
algebra. So the doubled copy `ℓ·ImH` is an ISOMETRIC image of `ImH`: its generators have the SAME
Born norm (METRIC degeneracy, `gForm = 1`) AND transform as the SAME `su(2)_L = Der(H)` irrep (the
ALGEBRAIC degeneracy the module already banked: equal Casimir `−8`, `mirror_quasi_degenerate`). The
metric degeneracy is the TWIN of the equal-Casimir quasi-degeneracy — one cause (the isometric
doubling), two terminations.

Therefore the mirror band has NO scale separation: the two edges sit at the IDENTICAL Born scale,
so the join splitting ratio is EXACTLY

    joinSplitRatio := (mirror Born scale)/(un-doubled Born scale) = gForm e5O e5O / gForm u1 u1 = 1/1 = 1.

and

    joinContent w joinSplitRatio = κ(w)·mirrorMultCensus·cutLog 1 = κ(w)·3·0 = 0    (cutLog_one).

THE DISCHARGE: the D2d bounded residual `j` is DERIVED to the value `1`; the join content, at its
DERIVED splitting ratio, contributes EXACTLY `0` to the composed endpoint
`dressedInvAlphaEMJoin w s joinSplitRatio bands = dressedInvAlphaEM w s bands`. This satisfies the D7
composition-completeness gate's explicit alternative: the join content is INCLUDED in the composition
and PROVEN to contribute zero (not omitted).

## ANTI-BULLSHIT GATE (honest)

- Trace: fold → cascade-stop O=CD(H) (N2c) → composition-algebra ISOMETRIC last doubling → mirror
  triplet TR isometric to un-doubled TL → gForm e5O e5O = 1 = gForm u1 u1 (banked) → joinSplitRatio =
  1 → cutLog 1 = 0 (banked cutLog_one) → joinContent = 0 → composed endpoint join-independent. EVERY
  arrow banked/forced.
- Standard version: the SM ASSIGNS the mirror/threshold structure by hand; here the mirror scale IS
  the isometric-doubling image, forced. No standard analogue derives j.
- NO FIT (G2): j=1 is the exact metric degeneracy (equal Born norm), NOT chosen by where 137.036
  sits. The composed endpoint already sits ABOVE 137 at (s=1/8, w=1/3); joinContent=0 (j=1) is the
  MINIMUM (any 1<j ADDS positive overshoot). j is forced by the degeneracy, not by the target. The
  measured 1/α(0) is REMOVABLE PROSE ONLY; no measured digit in any proof.
- Words-removable: delete join/mirror/splitting/doubling/isospin/Born/coupling → `gForm e5O e5O =
  gForm u1 u1 = 1`, hence their ratio `= 1`, hence `dressedBandScreen w 3 1 = 0` (cutLog 1 = 0) and
  `dressedInvAlphaEMJoin w s 1 bs = dressedInvAlphaEM w s bs`. Pure arithmetic on banked objects.
- Not free-floating: every TYPE mentions the banked derived objects (`joinContent`,
  `dressedInvAlphaEMJoin`, `mirrorMultCensus`, `gForm`, `e5O`, `u1`, over Cut / O ℚ). The ratio is
  the CONCRETE Born self-overlap of the banked N277 mirror/un-doubled triplet generators, not generic.
- Load-bearing tooth: j=1 is LOAD-BEARING via `gForm e5O e5O = 1` (the isometry). A non-isometric
  doubling (mirror scale ≠ 1) would give j ≠ 1 and joinContent ≠ 0. And for a genuine 1<j the
  joinContent IS strictly positive (re-export joinContent_pos) — j=1 is the exact degenerate boundary
  where it vanishes, not a vacuous always-zero.

## THEOREMS (production Phys/Algebra/JoinSplitRatioDerived.lean)

1. mirrorBornScale_eq_one : ((gForm e5O e5O : ℚ) : Cut) = 1               (mirror TR generator unit)
2. undoubledBornScale_eq_one : ((gForm u1 u1 : ℚ) : Cut) = 1              (un-doubled TL generator unit)
3. bornScales_equal : mirrorBornScale = undoubledBornScale                 ★ the METRIC degeneracy
4. joinSplitRatio_eq_one : joinSplitRatio = 1                              ★ THE DERIVED VALUE
5. joinContent_at_derived_eq_zero : ∀ w, joinContent w joinSplitRatio = 0  ★ THE DISCHARGE
6. dressedInvAlphaEMJoin_at_derived_j : dressedInvAlphaEMJoin w s joinSplitRatio bands
      = dressedInvAlphaEM w s bands                                        ★ join contributes nothing
7. (one-cause) metric_and_algebraic_degeneracy : bornScales_equal ∧ mirror_quasi_degenerate
8. Teeth (W8): gForm e5O e5O = 1 ≠ 0 (genuine unit); joinContent_pos re-export (1<j ⟹ >0, so the
   derived j=1 is the exact vanishing boundary); joinSplitRatio ≠ (a wrong split, e.g. topBandRatio).
9. Capstone joinSplitRatioDerived_landing (welded, non-hollow).

## COST BUDGET / KILL
All proofs: gForm_self_sum_sq + norm_num on the concrete unit-octonion coords (cheap), div_self / one
arithmetic, cutLog_one rewrite, rfl-split. NO decide over boxes, NO monolithic ring on expanded
coords. KILL: any single obligation > 60s or leaf build > 5 min → measure/decompose (W9). Expect <<.

## SUCCESSOR (ONE directed child, fork-guard, max_retries=25)
DERIVE the freeze-out edge ratios rb,rc,rl (the quark-threshold ℝ-descent — the LAST remaining bounded
residual after s pinned and j derived) route-finder → re-narrow → D7 restate AS 1/α(0) ≥15 sig digits
→ D8 → hand M1. NO generic SELECT until M1 handed. A directed child REPLACES the generic SELECT.

## RESULT (banked)
Phys/Algebra/JoinSplitRatioDerived.lean — built EXIT 0 (7.6s), 13 decls foundations-only.
The derivation j = joinSplitRatio = 1 from the METRIC DEGENERACY (gForm e5O e5O = gForm u1 u1 = 1,
the isometric last CD doubling), discharging joinContent to 0 (joinContent_at_derived_eq_zero) and
making the composed endpoint join-independent (dressedInvAlphaEMJoin_at_derived_j). ONE CAUSE two
degeneracies (metric + banked equal-Casimir, both from the isometric doubling). C538 bites 1=538
(tied to joinContent_at_derived_eq_zero + joinSplitRatio_eq_one via dischargeFlag_forced). NO fit
(j=1 is the minimum-overshoot value; composed endpoint already > 137 at (s=1/8,w=1/3)). Successor:
DERIVE freeze-out edges rb,rc,rl (LAST bounded residual) → re-narrow → D7 → D8 → M1.
