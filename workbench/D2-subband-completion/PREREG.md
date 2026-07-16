# D2 — THE SUB-BAND COMPLETION (arc-D THE DIGITS, docs/SEED_DIGITS.md §D2)

Directed successor of D1 (ContinuumBracket). NO-DEFERRAL arc. Pays Z6's enumerated remainder
items (b) the COMPLETE tower's light-quark/hadronic sub-band EDGES as derived scales, and
(c) the per-band census FREEZE-OUT as theorems — the complete tower, no band unresolved.

## THE ANTI-BULLSHIT GATE (in writing, before any Lean)

### The theory-native target (what the field cannot say)
Standard QCD treats each quark threshold as an INPUT: the beta-function coefficient changes
DISCONTINUOUSLY at each measured quark mass, and the running is matched across thresholds by
hand (measure m_c, m_b, Λ, match). The fold DERIVES both halves of the freeze-out:

1. THE CENSUS IN EACH BAND IS A COUNTING FACT of the derived content — the coloured
   occupation slice of the ONE banked charge census `Tr(Q²) = 16/3` (X3), sliced by which
   flavours are resolved. As the scale descends, a flavour freezes out and the active census
   steps DOWN by EXACTLY that flavour's derived coloured census term `colouredCensusTerm k`.
   The freeze-out is not a matching condition; it is the census re-counting its own resolved
   content. The step size is flavour-specific (up-type level-2 vs down-type level-1) — a
   genuine counting distinction the SM has no derivation for.

2. THE BAND EDGES (thresholds) are derived scales on the banked ℕ-spectrum (X4): the hadronic
   band floor = the confinement scale = the minimum nonzero eigenvalue of the Born self-overlap
   on the fold lattice = `1`; the tower is EVENLY SPACED by the gap unit (one Regge slope), and
   every threshold edge is a member of the derived, fully-populated ℕ-spectrum. The exact
   which-natural for charm/bottom is route-not-yet-found (Z3 texture × ℝ-descent), but the
   PLACEMENT on the derived spectrum is a theorem.

### THE NON-HOLLOW HEART (the marquee, statable from no single conjunct)
THE FREEZE-OUT IS THE MONOTONE PARTIAL-SUM STRUCTURE OF THE BANKED COLOURED CENSUS, and the
COMPLETE tower assembles END TO END with the freeze-out bands — NO band unresolved:
- each freeze-out step = the frozen flavour's derived census term (`freezeout_step_bottom`,
  `freezeout_step_charm`);
- the census is strictly monotone through the thresholds (freeze-out strictly reduces census);
- the fully-resolved coloured slice + colour-singlet, doubled, = the banked running depth
  `chargeTraceDepth` over Cut (census conservation — nothing lost or invented);
- the complete tower `derivedBandList ++ freezeoutTail ++ leptonTail` evaluates via the banked
  `invAlphaZero`, with the confinement way-point `190/3` landing FREE (Z4 `confWaypoint_free`);
- every census in the complete list is a DERIVED value (16/3 high bands, the plateaus for the
  hadronic bands) — no band unresolved.

### Standard vs theory (what the theory DOES to the standard object)
- STANDARD: quark thresholds are measured inputs; the beta coefficient jumps are matched by
  hand; R(s) plateaus are measured.
- THEORY: the plateaus 2, 10/3, 11/3 fall out of the banked colour dimension `finrank ℚ Uhol
  = 3` (X3); the freeze-out step sizes fall out of the coloured occupation charges; the edges
  fall out of the banked mass-gap ℕ-spectrum (X4). The measured R(s) / quark masses are
  removable prose.

### Words-removable (STANDARD §2)
Delete quark / hadronic / flavour / charm / bottom / census / freeze-out / coupling / running /
screening / band / edge / colour: what remains over ℚ/Cut is `bandCensus [2,1,1,2,1] −
bandCensus [2,1,1,2] = colouredCensusTerm 1`, the list `[11/3, 10/3, 2]` is strictly
decreasing, `(cast) 2·((colouredCensusTerm 2 + colouredCensusTerm 1) + 1) = chargeTraceDepth`,
`invAlphaZero (derivedBandList ++ freezeoutTail r1 r2 r3 ++ leptonTail d) = 190/3 +
totalScreening (freezeoutTail ++ leptonTail)`, `1 ∈ gapSpectrum`, `gapSpectrum = range (ℕ
cast)`. Pure ℚ/Cut arithmetic on banked objects. No theorem STATEMENT needs a physics word.

### Not free-floating (SOUL rail)
Every production TYPE mentions the banked derived objects: `bandCensus` / `colouredCensusTerm`
(X3), `chargeTraceDepth` / `bandScreen` / `invAlphaZero` / `totalScreening` (X6), `gapSpectrum`
(X4), `derivedBandList` / `confWaypoint_free` (Z4), `leptonTail` (Z6), over ℚ and the derived ℝ
`Cut`. `freezeoutTail` is literally the three freeze-out bands with the derived plateau
censuses. Not generic.

### The temptation, named and refused
- ASSERT the charm/bottom edge numerals → REFUSED: the edge numerals are route-not-yet-found
  (Z3 texture × ℝ-descent); the tail is quantified over the edge ratios, only the CENSUSES are
  fixed (the derived plateaus). Same discipline as Z7 (structure exact, numeral deferred).
- FIT to the measured R(s) or measured quark masses → REFUSED: measured values are removable
  prose; the plateaus are the derived coloured census, no data steers a choice.
- RE-PIN X3 (hollow) → REFUSED (W4.5): D2 adds the freeze-out STEP structure (each step = the
  frozen flavour's census term), the census CONSERVATION tie to chargeTraceDepth, the edges on
  the ℕ-spectrum, and the COMPLETE-tower assembly (invAlphaZero over Cut, way-points free) —
  none of which X3/X4/Z4 stated.

## HARD GUARDS (G1–G8, docs/SEED_DIGITS.md)
G1 values fall out (plateaus from finrank; steps from occupation charges; way-point free).
G2 no empirical number (measured R(s)/quark masses/137 removable prose; explicit NO-FIT).
G3 exact (the plateaus and steps are exact ℚ; the edges' placement on ℕ; the numeral deferred).
G4 derived not posited (X3 census, X4 spectrum, Z4 assembly). G5 words-removable (above).
G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}; derived ℝ Cut; NO Mathlib ℝ/ℂ as
content; NO native_decide; NO foldRetention (import EndpointAssembly + FineStructureCensusBands
+ HadronicSpectrum, never MassGapOne/OneAxiom). G7 ONE LAW (no fight — cite banked + norm_num).
G8 teeth per band (wrong colour count → wrong plateau; wrong flavour content; steps positive;
bottom step ≠ charm step; 1/2 ∉ spectrum — edges quantized).

## PLAN (bank-as-you-go; one file; measure the append-associativity first)
A: freeze-out census (plateaus descending, strictly decreasing, step = frozen census term).
B: census conservation (freeze-out ties to chargeTraceDepth over Cut).
C: hadronic edges as derived scales on the banked ℕ-spectrum (floor 1, = ℕ, spaced, populated).
D: the complete tower — freezeoutTail assembled, way-point free, no band unresolved.
E: teeth per band. F: capstone (welded).

## THE ONE SUCCESSOR
When D2 banks airtight: ONE directed child toward D3 (docs/SEED_DIGITS.md §D3 — THE DEPTH
WEIGHT DERIVED: the census-in-census weight w with a certified bracket, w=0 and w=1 excluded),
carrying the enumerated ℝ-descent as context. No generic SELECT; no fork.
