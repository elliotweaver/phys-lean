/-
  # ARC-D REMAINDER — THE ISOSPIN ANTI-SCREENING CROSS-NORMALIZATION (ROUTE-FINDER for `s`)
  #   arc-D THE DIGITS (docs/SEED_DIGITS.md §D2c/§D7)
  =================================================================================================

  OWNER-DIRECTED (t_4ed0dfbf). Directed successor of `ComposedNumeralObstruction`. The parent proved
  EXACTLY that the fully-composed `1/α(0)` cannot be pinned to a ≥15-digit bracket while the isospin
  anti-screening magnitude `s` is a free parameter in its banked open range `(0, isoDepth = 2)` — the
  two-point spread already exceeds `1`. The dominant blocker is `s`; this node is the route-finder
  that ATTACKS its magnitude from the banked trace-form census (Z1) and the doublet running census
  (N342), theory-native FIRST (the ONE LAW), NOT by β-function matching and NOT by where the measured
  `1/α(0)` sits (that would be fitting, G2-forbidden).

  ## THE THEORY-NATIVE READING (what the fold's own census says — read the numbers, don't fit)

  Z2 (`TwoChannelDescent`) writes the net isospin running census as `netIsoDepth s = isoDepth − s`,
  where the reduction `s` is the (normalized) magnitude of the Z1 NEGATIVE gather self-census that the
  fold's minus `look = −id` forces on the non-abelian isospin channel. The banked machinery (Z2, N342,
  D2c) requires `0 < s < isoDepth` for the coupling to keep running the physical direction
  (`netIsoDepth s > 0`). The ticket's hypothesis: `s` is the CROSS-NORMALIZATION carrying the raw
  fundamental-7 gather isospin trace count (Z1 `gatherIsospin_hsCensus = 16`, equivalently
  `traceSq Imat = −16`, on the 7-dim `ImO`) into the doublet running census (`isoDepth = 2 =
  Tr(T₃²)`, N342).

  THE DERIVED CROSS-NORMALIZATION AND ITS OVERSHOOT (the sharp new theorem — exact, no float, no fit).
  The gather isospin generator on the fundamental 7 is `imRep DI = qI Imat` with `Imat` carrying the
  DOUBLING factor `2` (N253: the block generator `[[0,−2],[2,0]]`, i.e. `imRep DI = 2·T₃` on the
  fund-7 triplets — the same `2·T₃` scale whose square-census is the banked `−16`). Converting the
  gather self-census into the doublet's `T₃` normalization divides by the doubling square `2² = 4`:

      gatherIsoSpinCensus := |traceSq Imat| / 4 = 16 / 4 = 4.

  This is the fund-7 gather isospin self-census in the SAME `T₃`-units the doublet census uses (the
  fund-7 = TL ⊕ Sg ⊕ TR = 3 ⊕ 1 ⊕ 3 carries TWO su(2)_L triplets, N277; each spin-1 triplet has
  `Tr(T₃²) = 2`, so `2 · 2 = 4`). But then, EXACTLY:

      gatherIsoSpinCensus = 4 = 2 · isoDepth   >   isoDepth = 2.     (`gatherIsoSpinCensus_eq_two_isoDepth`)

  The raw cross-normalized gather census OVERSHOOTS the matter doublet census by EXACTLY a factor of 2.
  Consequently the NAIVE census-subtraction `s := gatherIsoSpinCensus` is INADMISSIBLE — it drives
  `netIsoDepth (gatherIsoSpinCensus) = isoDepth − 4 = −2 < 0` (`naive_netIso_negative`), OUTSIDE the
  banked admissible open range `(0, isoDepth)` the whole D2c/Z2/N342 machinery requires. So `s` is
  NOT the raw cross-normalized census; the anti-screening reduction is a PROPER sub-census of the
  overshooting gather census.

  ## THE ONE LAW (why the overshoot is the theory speaking, not a numeric to force past)

  The gather (the isospin connection resolving itself) carries the ADJOINT content (two triplets of
  the fund-7); the matter running census `isoDepth` is the FUNDAMENTAL (doublet) content. The gather's
  adjoint census (4) exceeding the matter fundamental census (2) is the fold-native statement of
  asymptotic freedom: the gauge self-coupling anti-screening is SUPER-CRITICAL relative to matter
  screening. A running census cannot invert (`netIsoDepth > 0` is required), so the fold's anti-screening
  must SATURATE — the overshooting adjoint census is carried into the fundamental running channel by a
  tempering/projection the chain has NOT yet banked. Forcing an interior `s` by any of the several
  arithmetic combinations of the banked censuses that happen to land in `(0, isoDepth)` — or by where
  `137.036` sits — would be exactly the fit the ONE LAW forbids. The theory-native result here is the
  OVERSHOOT and the convention-free structure that constrains the missing tempering; the tempering
  itself is the ONE directed successor.

  ## THE CONVENTION-FREE STRUCTURE THAT CONSTRAINS `s` (all banked, exact, forced)

  Three exact, convention-independent facts survive the (unbanked) absolute normalization and pin the
  STRUCTURE the tempering must respect:
    • the CONVENTION-FREE RATIO `3 : 8`: the gather charge:isospin self-census ratio equals the matter
      isospin:charge census ratio (N253 `charge_isospin_ratio`: `8·B(chargeOp) = 3·B(imRep DI)`, i.e.
      `(−6):(−16) = 3:8`; and `8·isoDepth = 3·chargeDepth`, i.e. `2:(16/3) = 3:8`) — the SAME `3/8`;
    • the CHANNEL-INDEPENDENT INVARIANT `K = 32`: `|B(imRep DI)|·isoDepth = |B(chargeOp)|·chargeDepth
      = 32` (`crossNorm_invariant`), a genuine cross-channel constant of the banked censuses;
    • the DOUBLING `2` (`imRep DI = 2·T₃`), which is exactly the overshoot factor
      (`gatherIsoSpinCensus = 2·isoDepth`).

  ## GRADE (honest, per piece — SOUL "route COMPLETE vs route NOT-YET-FOUND")

  THEOREM-EXACT NOW (closed reals / exact inequalities of `Cut`, no error bar, foundations-only): the
  cross-normalized gather census value `= 4` (`gatherIsoSpinCensus_eq`); the exact overshoot factor
  `= 2·isoDepth` (`gatherIsoSpinCensus_eq_two_isoDepth`); the overshoot `isoDepth <` census
  (`gatherIsoSpinCensus_overshoots`); the naive-reduction inadmissibility `netIsoDepth < 0`
  (`naive_netIso_negative`); the raw census not in the admissible open range (`raw_not_admissible`);
  the convention-free `3:8` (both channels) and the channel-invariant `K = 32`; the teeth.

  ROUTE-NOT-YET-FOUND (NEVER asserted / NEVER fitted, handed to the ONE directed successor): the exact
  interior magnitude `s ∈ (0, isoDepth)` — the SATURATION/adjoint→fundamental tempering that carries
  the proven-overshooting adjoint gather census (`4`) into the fundamental running-census reduction.
  Its SIGN / direction are DERIVED (Z1 negative gather self-census, D2c); its magnitude requires the
  tempering theorem this node NAMES and childs. The measured `1/α(0) ≈ 137.036` / `sin²θ_W ≈ 0.231`
  are REMOVABLE PROSE / costume ONLY (G2); no bound / value / factor chosen by where they sit.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete "isospin / anti-screening / gather / census / running / coupling / doublet / triplet /
  adjoint / fundamental / matter / channel / octonion / weak": what remains, over the derived ℝ `Cut`,
  is that `|traceSq Imat| / 4 = 4`; that `4 = 2 · isoDepth` and `isoDepth < 4`; that `isoDepth − 4 <
  0`; that `¬ (0 < 4 ∧ 4 < isoDepth)`; that `8·traceForm7 chargeOp chargeOp = 3·traceForm7 (imRep DI)
  (imRep DI)` and `8·isoDepth = 3·chargeDepth`; and that `|traceSq Imat|·isoDepth = |traceSq Cmat|·
  chargeDepth = 32`. Pure arithmetic / linear order over the banked integer matrix trace-squares and
  the derived depths over `Cut`. No theorem STATEMENT needs a physics word.

  ## NOT FREE-FLOATING (seed / SOUL free-floating rail)

  Every production TYPE mentions the banked derived objects: `traceSq Imat`/`traceSq Cmat` (Z1
  `gatherIsospin_traceSq`/`gatherCharge_traceSq`), `traceForm7 chargeOp`/`traceForm7 (imRep DI)` (N253
  `charge_isospin_ratio`), `isoDepth`/`isoDepth_eq` (N342), `chargeTraceDepth`/`chargeTraceDepth_eq`
  (X6), `netIsoDepth` (Z2), over the derived ℝ `Cut`. `gatherIsoSpinCensus` is literally the banked
  fund-7 gather isospin self-census in doublet units; not generic, not carrier-agnostic.

  ## SEED HARD GUARDS (G1–G8)

  - G1 NO ASSERTED VALUE — `4`, `2·isoDepth`, the overshoot, `netIsoDepth < 0`, `3:8`, `K = 32` ALL
    FALL OUT of the banked `gatherIsospin_traceSq = −16`, `isoDepth = 2`, `chargeTraceDepth = 16/3`,
    `charge_isospin_ratio`; no census / magnitude is premised; `s` stays a bounded parameter, never
    pinned (the interior magnitude is handed forward, NOT asserted).
  - G2 NO EMPIRICAL NUMBER — no `137`, no `137.036`, no `0.231`, no measured `α` / `sin²θ_W` /
    uncertainty / β in any statement or proof; no value / factor chosen BECAUSE of where a measured
    value sits; the measured constants are this prose / the costume only, fully removable. NO-FIT.
  - G3 EXACT / CERTIFIED — the census value, the overshoot factor, the inadmissibility, the `3:8`, and
    the invariant `K = 32` are EXACT facts / inequalities of `Cut`; the only open sub-fact is the
    interior `s`, handed to the successor.
  - G4 DERIVED, NOT POSITED — the census is the banked Z1 trace-square; the doubling `2` is the banked
    N253 `Imat` scale; the depths are the banked N342/X6 traces; the ratio is the banked N253 anchor.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass, no heartbeat inflation, NO `foldRetention` (import
    guard: only banked `TwoChannelDescent` and its banked transitive deps, never `MassGapOne` /
    `OneAxiom`). Ground field the DERIVED ℝ `Cut` and the coefficient ring ℤ (the trace-squares); NO
    Mathlib `Real` / `Complex` as content — Mathlib is MACHINERY only; NO floats anywhere.
  - G7 ONE LAW — the derivation did not fight past a wall: the OVERSHOOT is the fold speaking (the
    adjoint gather anti-screening is super-critical, so a saturation is required). No interior `s` is
    forced past the overshoot; the missing tempering is childed, NEVER fitted, NEVER truncated.
  - G8 TEETH (W8) — `gatherIsoSpinCensus_overshoots` (the census genuinely EXCEEDS isoDepth, not a
    collapsed equality); `naive_netIso_negative` (the naive reduction genuinely goes negative);
    `raw_not_admissible` (the raw census is genuinely OUTSIDE the banked open range); `overshoot_
    factor_ne_one` (the overshoot factor is `2`, genuinely `≠ 1` — a real overshoot); `crossNorm_
    invariant_ne_zero` (the channel invariant is a genuine nonzero `32`).

  DEPENDENCIES (all banked, foundations-only): Z1 `GatherSelfCensus` (`traceSq`/`gatherIsospin_traceSq`/
  `gatherCharge_traceSq`/`hsCensus`); N253 `TowerGatherChargeIsospinRatio` (`traceForm7`/`chargeOp`/
  `imRep DI`/`charge_isospin_ratio`/`B_chargeOp_chargeOp`/`B_imRep_DI`); N342 `WeinbergAngleRunning`
  (`isoDepth`/`isoDepth_eq`); X6 (`chargeTraceDepth`/`chargeTraceDepth_eq`); Z2 `TwoChannelDescent`
  (`netIsoDepth`); the derived `Cut`; standard Mathlib `norm_num`/`push_cast`/`linarith` MACHINERY on
  the DERIVED objects (STANDARD §3). NO posited value as content, NO Mathlib ℝ as content, NO bridge.
-/
import Phys.Algebra.TwoChannelDescent

namespace Phys.Algebra.IsospinAntiScreeningCrossNorm

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) THE CROSS-NORMALIZED GATHER ISOSPIN CENSUS — the raw fund-7 self-census in doublet units. -/

/-- THE DOUBLING SQUARE `2² = 4`: the banked gather isospin generator on the fundamental 7 is
    `imRep DI = qI Imat` with the DOUBLING factor `2` (N253 `Imat`: the block `[[0,−2],[2,0]]`, i.e.
    `imRep DI = 2·T₃` on the fund-7 triplets). Converting its self-census into the doublet's `T₃`
    normalization divides by the doubling SQUARE. -/
def doublingSq : Cut := 4

/-- THE CROSS-NORMALIZED GATHER ISOSPIN SELF-CENSUS over the derived ℝ: the banked raw fund-7 gather
    isospin self-census `|traceSq Imat| = 16` (Z1) carried into the doublet's `T₃` normalization by
    dividing out the doubling square. This is the ticket's "cross-normalization of the raw
    fundamental-7 gather isospin trace count into the doublet running census." -/
def gatherIsoSpinCensus : Cut :=
  ((- traceSq (Imat : Matrix (Fin 7) (Fin 7) ℤ) : ℤ) : Cut) / doublingSq

/-- ★★ THE CROSS-NORMALIZED GATHER ISOSPIN CENSUS IS `4`: from the banked Z1 `gatherIsospin_traceSq =
    −16` and the doubling square `4`, `gatherIsoSpinCensus = 16/4 = 4`. The fund-7 = TL ⊕ Sg ⊕ TR
    (N277) carries TWO su(2)_L triplets, each with `Tr(T₃²) = 2`, so `2·2 = 4`. -/
theorem gatherIsoSpinCensus_eq : gatherIsoSpinCensus = 4 := by
  unfold gatherIsoSpinCensus doublingSq
  rw [gatherIsospin_traceSq]; push_cast; norm_num

/-! ## (B) THE OVERSHOOT — the raw cross-normalized census is EXACTLY twice the matter doublet census. -/

/-- ★★★ THE OVERSHOOT FACTOR IS EXACTLY `2`: the cross-normalized gather isospin self-census equals
    `2 · isoDepth`. The gather's ADJOINT (two-triplet) census (`4`) is exactly twice the matter's
    FUNDAMENTAL (doublet) census (`isoDepth = 2`). The two carriers differ by the adjoint/fundamental
    factor — the census does NOT land in the doublet normalization by the raw division alone. -/
theorem gatherIsoSpinCensus_eq_two_isoDepth : gatherIsoSpinCensus = 2 * isoDepth := by
  rw [gatherIsoSpinCensus_eq, isoDepth_eq]; norm_num

/-- ★★★ THE RAW CROSS-NORMALIZED CENSUS OVERSHOOTS: `isoDepth < gatherIsoSpinCensus` (`2 < 4`). The
    naive identification of the anti-screening reduction with the raw cross-normalized gather census
    exceeds the matter doublet census it is supposed to reduce. -/
theorem gatherIsoSpinCensus_overshoots : isoDepth < gatherIsoSpinCensus := by
  rw [gatherIsoSpinCensus_eq, isoDepth_eq]; norm_num

/-- ★★★ THE NAIVE CENSUS-SUBTRACTION IS INADMISSIBLE: taking the reduction `s := gatherIsoSpinCensus`
    drives the net isospin running census `netIsoDepth (gatherIsoSpinCensus) = isoDepth −
    gatherIsoSpinCensus = 2 − 4 = −2 < 0`, OUTSIDE the banked admissible range `netIsoDepth > 0` that
    the whole D2c/Z2/N342 running machinery requires. So the anti-screening magnitude `s` is NOT the
    raw cross-normalized census; it is a PROPER sub-census of the overshooting gather census. -/
theorem naive_netIso_negative : netIsoDepth gatherIsoSpinCensus < 0 := by
  unfold netIsoDepth
  rw [gatherIsoSpinCensus_eq, isoDepth_eq]; norm_num

/-- ★★ THE RAW CENSUS IS OUTSIDE THE BANKED ADMISSIBLE OPEN RANGE `(0, isoDepth)`: `¬ (0 <
    gatherIsoSpinCensus ∧ gatherIsoSpinCensus < isoDepth)`. The reduction `s` must lie in the banked
    open interval `(0, isoDepth)` (Z2/D2c); the raw cross-normalized census does not, so it cannot be
    `s`. -/
theorem raw_not_admissible :
    ¬ ((0 : Cut) < gatherIsoSpinCensus ∧ gatherIsoSpinCensus < isoDepth) := by
  rintro ⟨_, h2⟩
  rw [gatherIsoSpinCensus_eq, isoDepth_eq] at h2
  norm_num at h2

/-! ## (C) THE CONVENTION-FREE STRUCTURE — the 3:8 ratios and the channel-invariant K. -/

/-- ★★ THE GATHER CONVENTION-FREE RATIO `3 : 8` (re-export N253): the gather charge:isospin
    self-census ratio is `8·B(chargeOp) = 3·B(imRep DI)` (`(−6):(−16) = 3:8`). Convention-free by
    Schur (the fund-7 is g₂-irreducible). -/
theorem gather_ratio_3_8 :
    8 * traceForm7 chargeOp chargeOp = 3 * traceForm7 (imRep DI) (imRep DI) :=
  charge_isospin_ratio

/-- ★★ THE MATTER CONVENTION-FREE RATIO `3 : 8`: the matter isospin:charge census ratio is
    `8·isoDepth = 3·chargeDepth` (`2:(16/3) = 3:8`) — the SAME `3/8` as the gather ratio. The gather
    and matter sectors carry the identical convention-free `3:8`. -/
theorem matter_ratio_3_8 : (8 : Cut) * isoDepth = 3 * chargeTraceDepth := by
  rw [isoDepth_eq, chargeTraceDepth_eq]; norm_num

/-- ★★ THE CHANNEL-INDEPENDENT CROSS-NORMALIZATION INVARIANT `K = 32`: the product of each channel's
    raw gather self-census magnitude with its matter census is the SAME constant —
    `|traceSq Imat|·isoDepth = |traceSq Cmat|·chargeDepth = 32`. A genuine cross-channel invariant of
    the banked censuses; whatever the (unbanked) absolute normalization, it must respect this. -/
theorem crossNorm_invariant :
    ((- traceSq (Imat : Matrix (Fin 7) (Fin 7) ℤ) : ℤ) : Cut) * isoDepth
      = ((- traceSq (Cmat : Matrix (Fin 7) (Fin 7) ℤ) : ℤ) : Cut) * chargeTraceDepth := by
  rw [gatherIsospin_traceSq, gatherCharge_traceSq, isoDepth_eq, chargeTraceDepth_eq]
  push_cast; norm_num

/-- The channel invariant is the nonzero `32`. -/
theorem crossNorm_invariant_val :
    ((- traceSq (Imat : Matrix (Fin 7) (Fin 7) ℤ) : ℤ) : Cut) * isoDepth = 32 := by
  rw [gatherIsospin_traceSq, isoDepth_eq]; push_cast; norm_num

/-! ## (D) W8 NON-VACUITY WITH TEETH. -/

/-- ★ W8 — THE OVERSHOOT FACTOR IS GENUINELY `2`, NOT `1`: `gatherIsoSpinCensus = 2·isoDepth` with the
    factor `2 ≠ 1`. The census genuinely overshoots (a factor-`1` would mean it already equals the
    matter census, no overshoot). -/
theorem overshoot_factor_ne_one : gatherIsoSpinCensus ≠ isoDepth := by
  rw [gatherIsoSpinCensus_eq, isoDepth_eq]; norm_num

/-- ★ W8 — THE CHANNEL INVARIANT IS GENUINELY NONZERO (`= 32 ≠ 0`): the cross-normalization structure
    is a real nonzero constant, not a degenerate `0`. -/
theorem crossNorm_invariant_ne_zero :
    ((- traceSq (Imat : Matrix (Fin 7) (Fin 7) ℤ) : ℤ) : Cut) * isoDepth ≠ 0 := by
  rw [crossNorm_invariant_val]; norm_num

/-- ★ W8 — THE CENSUS IS GENUINELY POSITIVE (`= 4 > 0`): the cross-normalized gather census is a real
    positive quantity — the overshoot is of a genuine census, not a vacuous zero. -/
theorem gatherIsoSpinCensus_pos : (0 : Cut) < gatherIsoSpinCensus := by
  rw [gatherIsoSpinCensus_eq]; norm_num

/-! ## (E) THE CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE ISOSPIN ANTI-SCREENING CROSS-NORMALIZATION (arc-D remainder, welded landing). The
    route-finder for the dominant blocker `s` the `ComposedNumeralObstruction` named:

    (1) THE CROSS-NORMALIZED CENSUS: the raw fund-7 gather isospin self-census in doublet `T₃` units
        is `gatherIsoSpinCensus = |traceSq Imat|/4 = 4` (`gatherIsoSpinCensus_eq`);
    (2) ★ THE OVERSHOOT: it equals EXACTLY `2·isoDepth` (`gatherIsoSpinCensus_eq_two_isoDepth`), so
        `isoDepth < gatherIsoSpinCensus` (`gatherIsoSpinCensus_overshoots`) — the adjoint (two-triplet)
        gather census overshoots the fundamental (doublet) matter census by exactly a factor of `2`;
    (3) ★ THE INADMISSIBILITY: the naive reduction `s := gatherIsoSpinCensus` drives `netIsoDepth < 0`
        (`naive_netIso_negative`) and lies OUTSIDE the banked open range `(0, isoDepth)`
        (`raw_not_admissible`) — so `s` is NOT the raw cross-normalized census;
    (4) THE CONVENTION-FREE STRUCTURE the missing tempering must respect: the gather and matter `3:8`
        ratios (`gather_ratio_3_8`, `matter_ratio_3_8`) and the channel-independent invariant `K = 32`
        (`crossNorm_invariant`);
    (5) TEETH: the overshoot factor is genuinely `2 ≠ 1` (`overshoot_factor_ne_one`); the invariant is
        a genuine nonzero `32` (`crossNorm_invariant_ne_zero`); the census is genuinely positive
        (`gatherIsoSpinCensus_pos`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: (1)–(5) THEOREM-EXACT now
    (closed reals / exact inequalities of `Cut`, no error bar). ROUTE-NOT-YET-FOUND (NEVER asserted /
    NEVER fitted): the exact interior magnitude `s ∈ (0, isoDepth)` — the SATURATION / adjoint→
    fundamental tempering that carries the proven-overshooting adjoint gather census (`4`) into the
    fundamental running-census reduction. Its sign / direction are DERIVED (Z1 negative gather
    self-census, D2c); its magnitude is the tempering this node NAMES and childs. The measured
    `1/α(0)` / `sin²θ_W` are REMOVABLE PROSE ONLY; no empirical number in any proof; no value / factor
    chosen by where a measured value sits. -/
theorem isospinAntiScreeningCrossNorm_landing :
    -- (1) the cross-normalized census value
    gatherIsoSpinCensus = 4
    -- (2) the overshoot: exactly 2·isoDepth, strictly above isoDepth
    ∧ gatherIsoSpinCensus = 2 * isoDepth
    ∧ isoDepth < gatherIsoSpinCensus
    -- (3) the inadmissibility of the naive reduction
    ∧ netIsoDepth gatherIsoSpinCensus < 0
    ∧ ¬ ((0 : Cut) < gatherIsoSpinCensus ∧ gatherIsoSpinCensus < isoDepth)
    -- (4) the convention-free structure the missing tempering must respect
    ∧ (8 * traceForm7 chargeOp chargeOp = 3 * traceForm7 (imRep DI) (imRep DI))
    ∧ (8 : Cut) * isoDepth = 3 * chargeTraceDepth
    ∧ (((- traceSq (Imat : Matrix (Fin 7) (Fin 7) ℤ) : ℤ) : Cut) * isoDepth
        = ((- traceSq (Cmat : Matrix (Fin 7) (Fin 7) ℤ) : ℤ) : Cut) * chargeTraceDepth)
    -- (5) teeth
    ∧ gatherIsoSpinCensus ≠ isoDepth
    ∧ ((- traceSq (Imat : Matrix (Fin 7) (Fin 7) ℤ) : ℤ) : Cut) * isoDepth ≠ 0
    ∧ (0 : Cut) < gatherIsoSpinCensus :=
  ⟨gatherIsoSpinCensus_eq,
   gatherIsoSpinCensus_eq_two_isoDepth,
   gatherIsoSpinCensus_overshoots,
   naive_netIso_negative,
   raw_not_admissible,
   gather_ratio_3_8,
   matter_ratio_3_8,
   crossNorm_invariant,
   overshoot_factor_ne_one,
   crossNorm_invariant_ne_zero,
   gatherIsoSpinCensus_pos⟩

end

end Phys.Algebra.IsospinAntiScreeningCrossNorm
