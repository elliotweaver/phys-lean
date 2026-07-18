/-
  # RECOMPOSED RUNNING ENDPOINT — the two-channel running descent with the DERIVED anti-screening
  #   magnitude `s = 1/8` FOLDED IN as the isospin net running census (t_c74b069f)
  #
  #   Parent (t_552c142e) banked the FRAME: the ADDITIVE recombined endpoint architecture
  #   (`RecombinedEndpoint`, lands `137.9475880261…`, an OVERSHOOT of `+0.91` over the value physics
  #   reads at zero momentum) is WRONG — a ONE-LAW signal. The additive tower feeds the FULL charge
  #   census `chargeTraceDepth = 16/3` into BOTH channels' screening at the top band, ignoring that
  #   the non-abelian isospin channel carries a NEGATIVE gather self-census. The parent forced a
  #   census-conserving correction and handed THIS node the actual recombination + numeral.
  #
  #   ## THE THEORY-NATIVE BEAT (why the recompose is FORCED, not fitted)
  #
  #   The fold's skew-adjoint gather (look = −id) forces a strictly NEGATIVE isospin gather
  #   self-census (Z1 `gatherIsospin_selfCensus_neg`, `channel_gather_asymmetry`) of DERIVED magnitude
  #
  #       s := projectedS = (funCas/adjCas) · depthWeight = (3/8) · (1/3) = 1/8
  #
  #   (banked `CasimirProjectionSelectsS.projectedS_eq` — the su(2) Casimir eigenvalue ratio projected
  #   THROUGH the one depth layer; NO open sub-fact remains for the VALUE of `s`). This `s` is RUNNING
  #   content of the isospin channel: the channel runs from the octonion ceiling `42` down to the
  #   electroweak scale `v` carrying its NET running census
  #
  #       netIsoDepth s = isoDepth − s = 2 − 1/8 = 15/8      (Z2 `TwoChannelDescent.netIsoDepth`)
  #
  #   while the abelian hypercharge channel runs UNREDUCED (`hyperDepth = 10/3`, zero gather
  #   self-census). Recombining the two channels (banked weight `3/8`) at `v` gives the RECOMPOSED
  #   top-band census
  #
  #       recomposedCharge = netIsoDepth s + hyperDepth = 15/8 + 10/3 = 125/24 = chargeTraceDepth − s,
  #
  #   i.e. the census is CONSERVED (`125/24 + 1/8 = 16/3`) — the anti-screening only re-partitions the
  #   ONE charge census across the running, never invents or loses any of it.
  #
  #   ## THE RESULT (exact, cutPi-free, words-removable)
  #
  #   - `recomposedCharge_eq`      : `recomposedCharge = 125/24`.
  #   - `recomposedCharge_conserves`: `recomposedCharge + projectedS = chargeTraceDepth` (census conserved).
  #   - `recomposed_EW_waypoint`   : `recomposedInvAlphaEM [(_, topBandRatio)] = 6923/54` (M→v; the exact
  #                                  recomposed octonion-to-electroweak way-point, iso census reduced).
  #   - `recomposed_conf_waypoint` : `6923/54 + bandScreen chargeTraceDepth confBandRatio = 7179/54`
  #                                  (below `v` the isospin channel is massive and DECOUPLES; the full
  #                                  electric-charge census screens the confinement band).
  #   - `recomposed_shift_exact`   : the crown — the additive-minus-recomposed top-band difference is
  #                                  EXACTLY `bandScreen projectedS topBandRatio = 7/18`. The derived
  #                                  `s = 1/8` enters as an EXACT rational: the `cutPi` of the loop
  #                                  normalization CANCELS the `cutPi` of the derived scale ratio.
  #   - `recomposed_below_additive`: the recomposed way-point `6923/54 ≈ 128.20` lies strictly BELOW the
  #                                  additive `3472/27 ≈ 128.59` — the anti-screening corrects the ONE-LAW
  #                                  overshoot DOWNWARD, the physically required direction.
  #
  #   Every value FALLS OUT of the cancellation over the derived ℝ `Cut`; no measured input, no fit,
  #   no truncation, no new hypothesis. The `cutPi` cancels between `κ = 1/(3·cutPi)` and the derived
  #   scale exponent, exactly as in the banked `bandScreen_topBand_exact`.
  #
  #   ## COMPOSITION COMPLETENESS (the honest boundary of THIS node)
  #
  #   The ≥15-figure numeral read AS the zero-momentum inverse coupling still requires the freeze-out
  #   edge ℝ-descent numerals `rb, rc, rl` (the quark-threshold R-ratio descent, banked in
  #   `Light/HeavyQuarkNumerals` only to ~6 significant figures). Per the composition-completeness
  #   discipline, a partial sum may NOT be declared the full coupling. That ℝ-descent closure remains
  #   OPEN and is routed to the single successor (a route-finder toward the quark-edge ℝ-descent). It
  #   is a REPEATED-DEFERRAL signal, named here explicitly, never fabricated to hit a target decimal.
  #
  #   ## TEETH (W8 — the anti-screening is load-bearing)
  #
  #   - `recomposedCharge_ne_charge`  : `recomposedCharge ≠ chargeTraceDepth` (`125/24 ≠ 16/3` — the
  #                                     `s` reduction genuinely bites; the recompose is not the additive).
  #   - `recomposed_shift_ne_zero`    : `bandScreen projectedS topBandRatio ≠ 0` (the anti-screening
  #                                     genuinely MOVES the endpoint).
  #   - `projectedS_ne_wholeStack`    : `projectedS ≠ 3/2` — `s` is the DERIVED depth-projected `1/8`,
  #                                     NOT the rejected whole-stack Casimir value (the corrected route).
  #   - `recomposed_EW_ne_additive`   : `recomposedInvAlphaEM [(_,top)] ≠ invAlphaEM [(_,top)]`.
  #
  #   DEPENDENCIES (all banked, foundations-only): Z2 `RecombinedEndpoint` (⇒ `TwoChannelDescent`
  #   `netIsoDepth`/`isoDepth`/`hyperDepth`; the `totalScreeningWith`/`isoTower`/`hyperTower`/
  #   `invAlphaEM`/`invAlphaEM_closed_charge` machinery; X6 `bandScreen`/`topBandRatio`/`topBandRatio_eq`/
  #   `bandScreen_topBand_exact`/`chargeTraceDepth`/`invAlphaHigh`; N342 `invAlpha2High_eq`/
  #   `invAlphaYHigh_eq`/`isoDepth_eq`/`hyperDepth_eq`; `BandEdgeList` `confBandRatio`/`bandScreen_conf_exact`);
  #   `CasimirProjectionSelectsS` (`projectedS`/`projectedS_eq`, the DERIVED `s = 1/8`); the derived `Cut`
  #   (`cutExp`/`cutLog`/`cutLog_cutExp`/`cutPi`/`cutPi_pos`); standard Mathlib `List`/`linarith`/
  #   `norm_num`/`ring`/`field_simp` MACHINERY on the DERIVED objects (STANDARD §3). NO posited value as
  #   content, NO Mathlib ℝ as content, NO bridge.
-/
import Phys.Algebra.RecombinedEndpoint
import Phys.Algebra.CasimirProjectionSelectsS

namespace Phys.Algebra.RecomposedRunningEndpoint

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Algebra.RecombinedEndpoint
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) THE RECOMPOSED CHARGE CENSUS — census conserved, `s` re-partitioned, not lost. -/

/-- ★★ THE RECOMPOSED TOP-BAND CENSUS over the derived ℝ: the isospin channel's NET running census
    `netIsoDepth projectedS = isoDepth − s = 15/8` (its matter census reduced by the DERIVED Z1
    anti-screening `s = 1/8`) recombined with the UNREDUCED abelian hypercharge census `hyperDepth =
    10/3`. This is the census the recombined coupling actually runs with above the electroweak scale. -/
def recomposedCharge : Cut := netIsoDepth projectedS + hyperDepth

/-- `recomposedCharge = 125/24`, FALLING OUT of the banked `isoDepth_eq`/`hyperDepth_eq`/`projectedS_eq`
    (`(2 − 1/8) + 10/3 = 15/8 + 10/3 = 125/24`). -/
theorem recomposedCharge_eq : recomposedCharge = 125 / 24 := by
  unfold recomposedCharge netIsoDepth
  rw [isoDepth_eq, hyperDepth_eq, projectedS_eq]; norm_num

/-- ★★ CENSUS CONSERVATION: `recomposedCharge + projectedS = chargeTraceDepth` (`125/24 + 1/8 = 16/3`).
    The anti-screening only RE-PARTITIONS the one banked charge census (X6 `chargeTraceDepth_eq`)
    across the running — nothing is invented or lost. The recompose is NOT a fit. -/
theorem recomposedCharge_conserves : recomposedCharge + projectedS = chargeTraceDepth := by
  rw [recomposedCharge_eq, projectedS_eq, chargeTraceDepth_eq]; norm_num

/-- THE NET ISOSPIN RUNNING CENSUS at the derived `s`: `netIsoDepth projectedS = 15/8 > 0` — the
    isospin coupling keeps running the physical direction after the anti-screening (Z2
    `projectedS_net_positive`, re-read here as an exact value). -/
theorem netIso_recomposed_eq : netIsoDepth projectedS = 15 / 8 := by
  unfold netIsoDepth; rw [isoDepth_eq, projectedS_eq]; norm_num

/-! ## (B) THE EXACT cutPi-FREE TOP-BAND SCREENING at any census. -/

/-- ★★ THE EXACT TOP-BAND SCREENING AT ANY CENSUS: `bandScreen c topBandRatio = c · 28/9`. The `cutPi`
    of the loop normalization `κ = 1/(3·cutPi)` CANCELS the `cutPi` of the derived scale exponent
    `28·cutPi/3` (banked `topBandRatio_eq`, `cutLog_cutExp`, `kappaLeading_eq`). An EXACT rational
    multiple of the census, no error bar — the same cancellation as `bandScreen_topBand_exact`. -/
theorem bandScreen_top_general (c : Cut) : bandScreen c topBandRatio = c * (28 / 9) := by
  rw [bandScreen, topBandRatio_eq, cutLog_cutExp, kappaLeading_eq]
  have hne : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp; ring

/-- The recomposed top-band screening is the EXACT `875/54` (`(125/24)·(28/9)`). -/
theorem bandScreen_recomposedCharge_top : bandScreen recomposedCharge topBandRatio = 875 / 54 := by
  rw [bandScreen_top_general, recomposedCharge_eq]; norm_num

/-- ★★★ THE DERIVED ANTI-SCREENING SHIFT IS THE EXACT `7/18`: `bandScreen projectedS topBandRatio =
    (1/8)·(28/9) = 7/18`. The DERIVED `s = 1/8` (`projectedS_eq`) enters the endpoint as an EXACT
    cutPi-free rational — the crown of the recompose. -/
theorem bandScreen_projectedS_top : bandScreen projectedS topBandRatio = 7 / 18 := by
  rw [bandScreen_top_general, projectedS_eq]; norm_num

/-! ## (C) THE RECOMPOSED TWO-CHANNEL TOWER — iso census reduced, hyper unreduced. -/

/-- THE RECOMPOSED ISOSPIN TOWER over the derived ℝ: the isospin ceiling `invAlpha2High = 42` plus the
    screening at the REDUCED net isospin census `netIsoDepth projectedS`. -/
def recomposedIsoTower (bands : List (Cut × Cut)) : Cut :=
  invAlpha2High + totalScreeningWith (netIsoDepth projectedS) bands

/-- ★ THE RECOMPOSED RECOMBINED EM COUPLING over the derived ℝ: the recomposed isospin tower plus the
    (unreduced) banked hypercharge tower. The two-channel recombination with the DERIVED anti-screening
    folded into the isospin channel's running census. -/
def recomposedInvAlphaEM (bands : List (Cut × Cut)) : Cut :=
  recomposedIsoTower bands + hyperTower bands

/-- Linearity of the per-band screening in the census: `bandScreen a r + bandScreen b r =
    bandScreen (a+b) r`. -/
theorem bandScreen_add (a b r : Cut) :
    bandScreen a r + bandScreen b r = bandScreen (a + b) r := by
  unfold bandScreen; ring

/-- The per-channel screening towers add over a shared band list:
    `totalScreeningWith a bands + totalScreeningWith b bands = totalScreeningWith (a+b) bands`. -/
theorem totalScreeningWith_add (a b : Cut) (bands : List (Cut × Cut)) :
    totalScreeningWith a bands + totalScreeningWith b bands
      = totalScreeningWith (a + b) bands := by
  induction bands with
  | nil => simp [totalScreeningWith]
  | cons p ps ih =>
    unfold totalScreeningWith at ih ⊢
    simp only [List.map_cons, List.sum_cons]
    have hb := bandScreen_add a b p.2
    linarith [ih, hb]

/-- ★★★ THE RECOMPOSED CLOSED FORM: `recomposedInvAlphaEM bands = 112 + totalScreeningWith
    recomposedCharge bands`. The two ceilings sum to `42 + 70 = 112`; the reduced-iso and unreduced-hyper
    screenings sum to the screening at the recomposed census (`totalScreeningWith_add`). -/
theorem recomposedInvAlphaEM_closed (bands : List (Cut × Cut)) :
    recomposedInvAlphaEM bands = 112 + totalScreeningWith recomposedCharge bands := by
  unfold recomposedInvAlphaEM recomposedIsoTower hyperTower recomposedCharge
  rw [invAlpha2High_eq, invAlphaYHigh_eq, ← totalScreeningWith_add]
  ring

/-! ## (D) THE EXACT RECOMPOSED WAY-POINTS. -/

/-- Helper: `totalScreeningWith` on the single top band reduces to the one increment. -/
theorem totalScreeningWith_single_top (c : Cut) :
    totalScreeningWith c [(chargeTraceDepth, topBandRatio)] = bandScreen c topBandRatio := by
  unfold totalScreeningWith; simp

/-- ★★★ THE RECOMPOSED ELECTROWEAK WAY-POINT: `recomposedInvAlphaEM [(_, topBandRatio)] = 6923/54`.
    The recombined coupling screened from the two ceilings `112` across the top band at the RECOMPOSED
    census `125/24`: `112 + 875/54 = 6923/54 ≈ 128.20`. The exact octonion-to-electroweak way-point
    with the DERIVED anti-screening folded in. -/
theorem recomposed_EW_waypoint :
    recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)] = 6923 / 54 := by
  rw [recomposedInvAlphaEM_closed, totalScreeningWith_single_top,
    bandScreen_recomposedCharge_top]; norm_num

/-- ★★ THE ADDITIVE ELECTROWEAK WAY-POINT (banked recombination, re-read as a value): `invAlphaEM
    [(_, topBandRatio)] = 3472/27` (`112 + 448/27`). Below stands the recompose that corrects it. -/
theorem additive_EW_waypoint :
    invAlphaEM [(chargeTraceDepth, topBandRatio)] = 3472 / 27 := by
  rw [invAlphaEM_closed_charge, totalScreeningWith_single_top, bandScreen_topBand_exact]; norm_num

/-- ★★ THE RECOMPOSED CONFINEMENT WAY-POINT: `6923/54 + bandScreen chargeTraceDepth confBandRatio =
    7179/54`. Below the electroweak scale the isospin channel is massive and DECOUPLES; the FULL
    electric-charge census `16/3` screens the confinement band (`bandScreen_conf_exact = 128/27`):
    `6923/54 + 128/27 = 6923/54 + 256/54 = 7179/54 ≈ 132.94`. -/
theorem recomposed_conf_waypoint :
    (6923 / 54 : Cut) + bandScreen chargeTraceDepth confBandRatio = 7179 / 54 := by
  rw [bandScreen_conf_exact]; norm_num

/-! ## (E) THE EXACT SHIFT — the derived anti-screening's contribution, cutPi-free. -/

/-- ★★★ THE EXACT RECOMPOSE SHIFT: the additive-minus-recomposed top-band difference EQUALS the
    screening at the derived anti-screening `s`:
        invAlphaEM [(_,top)] − recomposedInvAlphaEM [(_,top)] = bandScreen projectedS topBandRatio.
    Both sides equal the EXACT `7/18` (`3472/27 − 6923/54 = 6944/54 − 6923/54 = 21/54 = 7/18`). The
    correction the parent's census re-partition forced IS exactly the derived `s = 1/8` screening. -/
theorem recomposed_shift_exact :
    invAlphaEM [(chargeTraceDepth, topBandRatio)]
        - recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)]
      = bandScreen projectedS topBandRatio := by
  rw [additive_EW_waypoint, recomposed_EW_waypoint, bandScreen_projectedS_top]; norm_num

/-! ## (F) THE ONE-LAW DIRECTION — the recompose corrects the overshoot DOWNWARD. -/

/-- ★★★ THE RECOMPOSE CORRECTS THE OVERSHOOT DOWNWARD: `recomposedInvAlphaEM [(_,top)] <
    invAlphaEM [(_,top)]` (`6923/54 ≈ 128.20 < 3472/27 ≈ 128.59`). The additive endpoint OVERSHOOTS
    (the ONE-LAW signal the parent detected); the DERIVED anti-screening moves it DOWN — the physically
    required direction toward the value physics reads. -/
theorem recomposed_below_additive :
    recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)]
      < invAlphaEM [(chargeTraceDepth, topBandRatio)] := by
  rw [recomposed_EW_waypoint, additive_EW_waypoint]; norm_num

/-! ## (G) W8 NON-VACUITY WITH TEETH — the anti-screening is load-bearing. -/

/-- ★ W8 — THE `s` REDUCTION GENUINELY BITES: `recomposedCharge ≠ chargeTraceDepth` (`125/24 ≠ 16/3`).
    The recomposed census is NOT the additive full charge census; the anti-screening is not vacuous. -/
theorem recomposedCharge_ne_charge : recomposedCharge ≠ chargeTraceDepth := by
  rw [recomposedCharge_eq, chargeTraceDepth_eq]; norm_num

/-- ★ W8 — THE ANTI-SCREENING GENUINELY MOVES THE ENDPOINT: `bandScreen projectedS topBandRatio ≠ 0`
    (`7/18 ≠ 0`). A vanishing `s` would collapse the recompose back to the additive overshoot. -/
theorem recomposed_shift_ne_zero : bandScreen projectedS topBandRatio ≠ 0 := by
  rw [bandScreen_projectedS_top]; norm_num

/-- ★ W8 — `s` IS THE DERIVED DEPTH-PROJECTED VALUE, NOT THE REJECTED WHOLE-STACK CASIMIR: `projectedS
    ≠ 3/2`. The recompose uses `s = 1/8` (one depth), the corrected route — not the whole-stack `3/2`
    a prior run banked and this program rejected (`projectedS_below_casimirRatio`). -/
theorem projectedS_ne_wholeStack : projectedS ≠ 3 / 2 := by
  rw [projectedS_eq]; norm_num

/-- ★ W8 — THE RECOMPOSE IS DISTINCT FROM THE ADDITIVE ENDPOINT: `recomposedInvAlphaEM [(_,top)] ≠
    invAlphaEM [(_,top)]` (`6923/54 ≠ 3472/27`). The correction is real, not a relabelling. -/
theorem recomposed_EW_ne_additive :
    recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)]
      ≠ invAlphaEM [(chargeTraceDepth, topBandRatio)] := by
  rw [recomposed_EW_waypoint, additive_EW_waypoint]; norm_num

end

end Phys.Algebra.RecomposedRunningEndpoint
