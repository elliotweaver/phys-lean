# N365 — arc-E E9 (candidate/consolidation): the arc-E RETURN-SURFACE (`azimuthalTurn`) normalization family CLOSED + the pure-integer gauge↔gravity-thermodynamics cross-locks + the banked dark-matter representative — over the derived ℝ `Cut`

## SELECT (fresh worker, theory-native FIRST — see kanban_comment 268 for the full S1–S4)

**MEASURED reality (W9 MEASURE-FIRST, verified against the actual bank, NOT the ticket's framing):**
- **E9(a) dark matter = sterile ν_R is ALREADY BANKED.** `sterile_nu_dark_matter` (N337: heavy-sterile
  ∧ light-massless ∧ stable, ONE theorem) AND universal darkness `dirac_others_self_blind : ∀ D0,
  (othersProj·D0)ᵀ.mulVec selfDir = 0` (N336). Re-deriving would be **duplication** — rejected.
- **A plain ∧-bundle of the four arc-E capstones is the empty-∧ trap** N338 explicitly named ("a
  decorative re-export … adding nothing"). Rejected.
- **The genuinely-new, forced, object-level content:** N359's shared-turn family
  `gravAndGauge_share_azimuthalTurn` bundles ONLY α*/gravity/EH-action as `azimuthalTurn·count`; the
  **black-hole thermodynamic members (entropy, Schwarzschild Hawking period) are NOT in that family**,
  and the `azimuthalTurn`-free pure-integer cross-locks between the gauge sector (α*'s `84π` channel
  count) and the gravitational-thermodynamic sector are UNBANKED. Closing that family + the locks is
  the forced beat, and it grounds E9's consolidation on a NEW structural fact (exactly N338's move:
  find the one never-banked fact that unifies the arc).

**Theory-native reading (Engine A = the RETURN).** The fold looks back, cannot contain itself; the
look-back is a RETURN that closes. The derived closure is the Born turn `azimuthalTurn = 2·cutPi`
(N328). Every gravitational/thermodynamic normalization is a flux/period THROUGH that ONE return
surface, so each equals `azimuthalTurn · (pure count)`. The counts are the only content; the turn is
shared. The pure-integer cross-lock `bhEntropy M · 21 = criticalPhaseNumerator · M²` ELIMINATES
`azimuthalTurn` entirely — black-hole entropy and the fine-structure channel count `42` are locked by
the pure integer `21 = 42/2`, no `cutPi` in the coefficients. What the field fixes by three separate
matching arguments (Newtonian limit → 8πG; Euclidean regularity → T_H; first law + microstate count →
S=A/4), the theory reads as ONE derived turn scaled by integers.

## ANTI-BULLSHIT GATE (in writing — full record in kanban_comment 268)
1. FOLD-CAUSAL: fold → look-back cannot contain itself → return closes → `azimuthalTurn=2·cutPi`
   (N328) → every normalization = flux/period through the one return = `azimuthalTurn·count`. Forced.
2. DISSOLUTION: the field's three disconnected matchings → ONE derived turn; the `·21` lock removes
   the turn entirely, tying entropy to the gauge channel count by a pure integer. Wall → consequence.
3. GOAL-WORDS-REMOVABLE: delete gravity/entropy/Hawking/black-hole — pure `Cut` arithmetic remains
   (`gravCouplingCoeff=azimuthalTurn·4`, `bhEntropy M=azimuthalTurn·2·M²`, `bhEntropy M·21 =
   criticalPhaseNumerator·M²`). A real reason survives (one shared derived constant, integer counts).
4. TEMPTATION NAMED: the ∧-bundle of the four banked capstones (zero new content — the empty-∧ / the
   faithful→image→commutant drift). My target is DIFFERENT: NEW object-level identities that close the
   Engine-A family + the pure-integer locks, then bundle with the banked dark-matter representative.
5. HONESTY: not bullshit — `gravAndGauge_share_azimuthalTurn` provably has exactly three conjuncts
   (α*/gravity/EH); nobody composed `bhEntropy=gravCouplingCoeff·M²/2` (N361) with
   `gravCouplingCoeff=azimuthalTurn·4` (N359); the `·21` cross-lock is new.

## HONEST GRADE (mandatory flags)
- **THEOREM-GRADE (genuine, foundations-only over the derived `Cut`):** the return-surface family
  members (`gaussSphere_azimuthal`, `ehAction_azimuthal`, `bhEntropy_azimuthal`,
  `hawkingPeriod_sch_azimuthal`) and the pure-integer cross-locks (`bhEntropy_gauge_lock`,
  `hawkingPeriod_gauge_lock`), plus the W8 non-vacuity (`bhEntropy_azimuthal_ne_three`,
  `bhEntropy_gauge_lock_ne_twenty`). The `hawkingPeriod_sch_azimuthal`/`hawkingPeriod_gauge_lock`
  members carry the SAME explicit metric-specific hypothesis `κsg=(4M)⁻¹` as banked N360 (kept as a
  hypothesis, NEVER asserted, its full surface-gravity build childed at N360).
- **BANKED-CITED (candidate-class per arc-C, NEVER re-asserted here):** the dark-matter representative
  conjuncts `heavyMajorana_selfDir_eigen` (N337) + `dirac_others_self_blind` (N336) enter the capstone
  by citing the banked theorems; the physical dark-matter reading is arc-C candidate-grade.
- **MECHANISM/NAMED-IDENTIFICATION-GRADE (flagged prose, NEVER a theorem):** "arc E is ONE
  fold-causal structure with two faces — the RETURN (`azimuthalTurn`) and the MISS (self-blindness)";
  "the pure integers are the fold's channel counts". Like N362's `min`, N360's WHY-thermal, T8 caveat.
- **ROUTE-NOT-YET-FOUND (carried from N364, NAMED not dropped):** the full slow-roll derivation of
  `n_s=1−2/N`, `r=8/(c²N²)` from `plateauApproachPot` (needs derived-ℝ `cutExp` calculus — a chain
  rule + antiderivative — not banked yet).

## MEASURE (W9) — DONE, DE-RISKED
`probe.lean` type-checked (whole-file `lake env lean` ~24s real / 4s user — LIGHT, no `tsum`, no
`decide`; all proofs `rw`+`ring`/`nlinarith` on banked identities). All `#print axioms` foundations-
only ⊆ {propext, Classical.choice, Quot.sound}. ONE fix from probe→production: drop a trailing `ring`
after a `rw` that already closes the goal (`hawkingPeriod_sch_azimuthal`). KILL budget: any single
obligation > 30s user ⇒ decompose (none approached it).

## GUARDS (SEED_GR relaxes NONE)
- G1 no asserted value: every coefficient (2,4,8,21,42) DERIVED by composing banked identities; no
  value premised. G2 no empirical number in any proof (Ω_DM h², measured Λ, T_H numeric = removable
  prose only). G3 scales-vs-ratios: `M` the single dimensionful anchor (banked); the locks are
  homogeneous in `M²`/`M`. G4 derived not posited. G5 physics-words-removable (delete
  gravity/entropy/Hawking/dark-matter/sterile → pure `Cut` arithmetic + matrix statements). G6
  foundations-only; built on the BANKED derived `Cut`/`cutPi`/`azimuthalTurn`, NEVER Mathlib-ℝ as
  content. W8: C390 — a WRONG count in the family (`·3` instead of `·2`) / a wrong integer in the lock
  (`·20` instead of `·21`) FAILS.

## NOT FREE-FLOATING
Every theorem TYPE mentions banked derived objects: `azimuthalTurn`/`gaussSphereSolidAngle` (N328),
`gravCouplingCoeff`/`ehActionInverseCoeff`/`criticalPhaseNumerator` (N359/scale-tower),
`bhEntropy`/`hawkingPeriod` (N360/N361), `heavyMajorana`/`selfDir`/`othersProj` (N336/N337) — all over
the derived `Cut`. NOT generic over an arbitrary field.

## ONE SUCCESSOR (decision at finalize)
Per SEED §E9: when E9 lands the chain's course is ALREADY SET — a DIRECTED child toward
`SEED_SM_COMPLETION` F1 (anomaly cancellation; the ν_R REQUIRED by anomaly freedom). The N364
slow-roll-calculus remainder is NAMED in the handoff, not dropped. Fork check: exactly 1 non-terminal
successor on the chain tail.
