# D2d — THE JOIN CONTENT (arc-D REMAINDER, owner-directed t_67d15cf3)

Directed successor of D2c (`PerChannelDressing`, commit 9637c62). docs/SEED_DIGITS.md §D2d is the
constitution. Owner has DECLARED D2d a first-class composition target ("a composition omitting the
join content cannot pass the D7 gate — an enumerated strictly-positive contribution"). So the
question is NOT *whether* to build D2d (owner-directed) but HOW to derive it honestly.

## THE BANKED IDENTIFICATION (found FIRST, per ticket — grep-verified, not guessed)

The seed's genre labels ("colorless-octet genre", "mirror content", "quasi-degeneracy structure")
are NOT literal Lean names (`grep -i octet|quasi` in Phys/ → 0 hits). They name a banked STRUCTURE
by its physics character. The banked object matching all three is **N277
`TowerGatherIsospinMultiplet`** — the Cayley–Dickson DOUBLING TEAR of the matter carrier:

    ImO  =  TL(3)  ⊕  Sg(1)  ⊕  TR(3)          (finranks 3+1+3 = 7; full carrier O ℚ = span{1}⊕ImO = 8)

- **"mirror content"** = `TR = span{e5O,e6O,e7O} = ℓ·ImH`, the DOUBLED triplet — the mirror of the
  un-doubled `TL = span{u1,e2O,e3O} = ImH` under the last doubling `O = CD(H) = H ⊕ Hℓ`.
- **"quasi-degeneracy structure"** = the banked Casimir `casimirOp = Σ(imRep DX)²` acting as the
  SAME scalar `−8` on BOTH `TL` and `TR` (`casimirOp_u1I : casimirOp u1M = (−8)•u1M`,
  `casimirOp_e5I : casimirOp e5I = (−8)•e5I`), and `0` on the singlet `Sg` (`casimirOp_e4I`).
  EQUAL Casimir eigenvalue on the mirror pair = quasi-degeneracy, DERIVED (not measured).
- **"colorless-octet genre"** = the 8-dim carrier (`1 ⊕ 7`), an su(2)_L (weak/colorless — the
  isospin multiplets straddle colour, N277 cross-cut) multiplet whose doubling axis `Sg` is the
  isospin-fixed direction.
- **"at the transmutation join"** = the O=CD(H) doubling tear IS the split the electroweak /
  dimensional-transmutation structure (arc-B ewClosureRatio, N332/N426) sits on; the join scale is
  the top-band edge `topBandRatio = M/v`.

## THE DERIVATION (theory-native; census-shift as a bounded threshold term — the D8-freezeout genre)

The join content enters the descent as a THRESHOLD TERM (exactly like the D8 freeze-out, which the
owner already accepted as a bounded log-refinement): the mirror multiplet's census re-counting at
the transmutation join. Modeled on `FreezeoutComposition` (bounded) + `PerChannelDressing`
(dressed composition):

- `mirrorMultCensus : Cut := ((Module.finrank ℚ TR : ℚ) : Cut)` — the mirror triplet's dimension as
  a census (= 3 via `finrank_TR`). A DERIVED counting fact of the banked mirror multiplet, NOT a
  free `3` (grounded on N277 `finrank_TR`).
- `joinContent w j := dressedBandScreen w mirrorMultCensus j` = `κ(w)·mirrorMultCensus·cutLog j` —
  the mirror content's census-in-census dressed threshold contribution at the join splitting ratio
  `j`, at the SAME derived return-surface weight `w` (D3, channel-independent).
- **THE BOUND (the marquee, from quasi-degeneracy):** because `TR` is quasi-degenerate with `TL`
  (equal Casimir), the join splitting ratio `j` is bounded near 1 (below the transmutation join
  ratio), so `joinContent w j ≤ κ(w)·mirrorMultCensus·cutLog R` for `j ≤ R` — a BOUNDED,
  logarithmically-small refinement. Quasi-degeneracy IS the ceiling on the join content's screening
  (the twin of D8's census-conservation ceiling).
- **THE COMPOSITION:** `dressedInvAlphaEMJoin w s j bands := dressedInvAlphaEM w s bands +
  joinContent w j` — the join threshold band composed additively onto the D2c dressed recombined
  endpoint, with the split theorem and the bounded increment (composed_split pattern).
- **DIRECTION:** `TR ⊂ ImO` is MATTER (a submodule of the matter carrier), so its census sense is
  POSITIVE (matter screens up; banked `chargeTraceDepth > 0` / `matter_selfCensus_pos` dichotomy) —
  a matter-genre threshold. Stated, NOT chosen by where 137.036 sits; the composed value carries
  the bounded residuals `s` (D2c), `j` (here), `rb,rc,rl` (D2e/D8) and lands as a genuine two-sided
  certified bracket.

## HONEST GRADE

THEOREM-EXACT NOW: the banked tear (`TL⊔Sg⊔TR=⊤`); the banked quasi-degeneracy (equal Casimir −8 on
TL,TR, 0 on Sg); the census counting fact (`mirrorMultCensus = 3`); the join-content factoring
`/(1−w)`; the BOUND `κ(w)·3·cutLog R` (quasi-degeneracy); the positive (matter) sense; the additive
composition + bounded increment; teeth. ROUTE-NOT-YET-FOUND (bounded, NEVER asserted/fitted): the
exact join splitting ratio `j` numeral (the transmutation-join scale ℝ-descent) — carried bounded
`1 < j ≤ (join ratio)`, exactly as D2c carries `s` and D8 carries `rb,rc,rl`. NO empirical number in
any proof; NO-FIT.

## ANTI-BULLSHIT GATE (in writing, per SOUL)

- **Trace fold → node, every arrow forced:** fold → C6 cascade caps at octonions (N2c) → O = CD(H)
  the last doubling → the doubling TEARS the matter carrier ImO = TL⊕Sg⊕TR (N277, banked) → the
  mirror TR quasi-degenerate with TL (equal Casimir, N277 banked) → enters the running at the
  transmutation join as a bounded census-shift threshold term → composed into the D2c dressed
  recombined endpoint. Every object banked; nothing posited.
- **Standard version + what the theory DOES to it:** standard SM adds electroweak/heavy-threshold
  corrections to α's running BY HAND (measure W/Z/top masses, match across thresholds). The theory
  FORCES the mirror multiplet (O=CD(H) doubling), DERIVES its quasi-degeneracy (equal Casimir, not a
  measured near-degeneracy), and bounds the threshold term by that derived degeneracy — no measured
  mass, no matching by hand. Genuinely different.
- **Delete physics words:** over Cut and O ℚ — `ImO = TL⊔Sg⊔TR`; `casimirOp` scalar `−8` on a TL and
  a TR generator, `0` on the Sg axis; `mirrorMultCensus = (finrank ℚ TR : Cut) = 3`;
  `joinContent w j = bandScreen mirrorMultCensus j/(1−w)`; `joinContent w j ≤ κ(w)·mirrorMultCensus·
  cutLog R` for `j ≤ R`; `dressedInvAlphaEMJoin = dressedInvAlphaEM + joinContent`. Pure linear
  algebra + real analysis on banked objects. Every statement survives; no name load-bearing.
- **Standard temptation named:** the temptation is to POSIT a specific census-shift number chosen so
  the composed sum lands near 137.036 (the fit — the credibility-killer). REFUSED: the census is a
  derived counting fact (finrank_TR=3), the direction is the banked matter/gather dichotomy, the
  splitting `j` is carried BOUNDED/route-not-yet-found, never chosen by the measured value.
- **NOT free-floating:** every TYPE cites banked N277 (`TR`,`finrank_TR`,`casimirOp_*`,
  `TL_sup_Sg_sup_TR_eq_top`) AND banked D2c/Z5/X6 over Cut (`dressedInvAlphaEM`,`dressedBandScreen`,
  `kappaLeading`,`chargeTraceDepth`). Grounded on the concrete banked matter tear AND the banked
  dressed running — not a generic carrier.

## COST BUDGET / KILL

Light expected (List/linarith/norm_num/field_simp/ring + banked cites, no brute, no native_decide,
default maxHeartbeats). KILL: if any single obligation exceeds ~90s in a bounded probe, MEASURE and
DECOMPOSE (W9) — never inflate maxHeartbeats. Probe every decl in workbench BEFORE production.

## SUCCESSOR (one-successor rail)

ONE directed child: D2e THE HADRONIC LEVEL WEIGHTS (docs/SEED_DIGITS.md §D2e). NO generic SELECT
until M1 handed. A directed child REPLACES the generic SELECT — never fire both.
