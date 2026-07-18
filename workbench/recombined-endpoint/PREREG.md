# recombined-endpoint — ARC-D REMAINDER step (1): THE CHANNEL RECOMBINATION WELD (D2b)

Node: OWNER-DIRECTED (t_fb4ef585, run 830). The owner corrected my reading (decision C):
the dominant ~65-unit "missing summand" is NOT route-not-yet-found — it is the banked Z2
two-channel recombination weld, never composed into the endpoint. This node COMPOSES it.
It is ASSEMBLY of banked objects, not a new derivation.

## THE OWNER'S CORRECTION (verbatim gist)

"Z2 (TwoChannelDescent) derived the TWO channels and the recombination weight; X7 built the
channel readings. The Z6/D4 endpoint tower composes the SINGLE fold coupling from the ceiling;
the zero-momentum EM coupling is the RECOMBINED object. That banked weld has never been composed
into the endpoint — it IS the dominant summand your gap arithmetic detected, and it is ASSEMBLY
of banked objects, not a new derivation. ... the weld's weight is Z2's banked theorem, not a
dial; the measured value remains removable prose."

Remainder chain: (1) compose the two-channel structure + recombination weight into the endpoint
[THIS NODE]; (2) freeze-out stays as banked bounded refinement; (3) rb,rc,rl enter ONLY through
that bounded term (my rung-3 category-error catch stands); (4) re-narrow the recombined sum;
(5) D7 attestation + restatement AS 1/α(0) at ≥15 digits; (6) D8 capstone → hand M1.

## THE PHYSICS (all banked — verified against the code, not memory)

The zero-momentum EM coupling is the two-channel recombination of isospin + hypercharge:
    1/α_em = 1/α₂ + 1/α_Y                        (photon = the two-channel sum)
    sin²θ_W = (1/α₂)/(1/α_em) = a₂/(a₂+a_Y)       (Z2's mixing = the recombination weight)

Banked ceilings (WeinbergAngleRunning, N342):
    invAlpha2High = invAlphaHigh = 42     (isospin ceiling = octonion ceiling, cascade stop)
    invAlphaYHigh = (5/3)·invAlphaHigh = 70   (physical hypercharge ceiling, GUT-normalized)
    ⇒ at the ceiling  1/α_em* = 42 + 70 = 112,  sin²θ_W = 42/112 = 3/8    ✓ (the famous GUT value)

Banked census additivity (the LOAD-BEARING driver — Q = T₃ + Y, cross-term traceless):
    chargeTraceDepth = Tr(Q²)  = 16/3
    isoDepth         = Tr(T₃²) = 2   = 6/3
    hyperDepth       = Tr(Y²)  = 10/3
    ⇒ chargeTraceDepth = isoDepth + hyperDepth   (16/3 = 2 + 10/3)

Because bandScreen is LINEAR in the census (`bandScreen d r = κ·d·cutLog r`), splitting one
charge band (census 16/3) into two channel bands (censuses 2 and 10/3) over the SAME ratio gives
the SAME total screening:
    bandScreen isoDepth r + bandScreen hyperDepth r = bandScreen chargeTraceDepth r.
So the two-channel screening EQUALS the single-channel screening; the ONLY difference is the
SECOND ceiling (70). Hence — for a band list whose every census is chargeTraceDepth (which
`completeBandList chargeTraceDepth` satisfies: high bands + lepton tail all at census 16/3):

    invAlphaEM (bands) := invAlphaYHigh + invAlphaZero (bands)
                        = 112 + totalScreening (bands)
                        = (invAlpha2High + Σ bandScreen isoDepth  r_b)
                        + (invAlphaYHigh + Σ bandScreen hyperDepth r_b)   ← the two-channel weld
                        = invAlphaZero (bands) + 70.

The +70 IS invAlphaYHigh, a banked theorem — NOT chosen because 137−68≈69 (that would be a fit).
The recombined LO endpoint = D7 numeral + 70 = 67.9475880261… + 70 = 137.9475880261…, a WAY-POINT
ABOVE measured 137.036 (the bounded refinements — the Z2 isospin anti-screening s ∈ (0,2), and the
banked bounded freeze-out κ·9·cutLog R — remain, never fitted). The owner's point: after the weld,
the freeze-out "no longer needs to close any large gap."

## THE DELIVERABLE (THIS NODE = step (1), the weld composition)

Module `Phys/Algebra/RecombinedEndpoint.lean`, namespace `Phys.Algebra.RecombinedEndpoint`.
Import `Phys.Algebra.TwoChannelDescent` (⇒ X6 invAlphaZero + Weinberg ceilings/depths + Z2) and
`Phys.Algebra.FreezeoutComposition` (⇒ Z6 completeBandList + D7 theNumeral_bracket).

Theorems:
1. census_additive : chargeTraceDepth = isoDepth + hyperDepth   (16/3 = 2 + 10/3)
2. bandScreen_channel_split (r) : bandScreen chargeTraceDepth r = bandScreen isoDepth r + bandScreen hyperDepth r
3. ceiling_recombination : invAlpha2High + invAlphaYHigh = 112,  and 42/112 = 3/8 (the weight)
4. def invAlphaEM (bands) := invAlphaYHigh + invAlphaZero bands
5. invAlphaEM_closed : invAlphaEM bands = 112 + totalScreening bands
6. def totalScreeningAt c bands ; totalScreening_channel_split (given all p.1 = chargeTraceDepth)
7. ★ recombination_weld : invAlphaEM bands = isoTower bands + hyperTower bands (two-channel decomp)
8. ★ invAlphaEM_eq_single_plus_hyper : invAlphaEM bands = invAlphaZero bands + 70 (the +70 summand)
9. recombination_weight : invAlpha2High/(invAlpha2High+invAlphaYHigh) = 3/8 (Z2 mixing at ceiling); tie to sinSqRun_at_high
10. ★ composed_endpoint : invAlphaEM (completeBandList chargeTraceDepth) = invAlphaZero (completeBandList chargeTraceDepth) + 70
11. ★ composed_bracket : [D7_lo + 70, D7_hi + 70] brackets it; composed_pinned decimal window 137.9475880261…
12. Teeth (W8): +70 load-bearing (invAlphaEM ≠ invAlphaZero); census additivity genuine (both channels present, isoDepth≠0, hyperDepth≠0); sin²θ_W = 3/8 ≠ 1/4; the two-channel decomp non-vacuous.
13. Welded capstone.

## GRADE (honest)

THEOREM-EXACT NOW: the census additivity, the per-band and per-list channel split, the two-channel
recombination weld (invAlphaEM = isoTower + hyperTower), the +70 summand
(invAlphaEM = invAlphaZero + 70), the recombination weight 3/8, the composed endpoint over the
complete band list, and the composed bracket [D7_lo+70, D7_hi+70] pinned to 137.9475880261…
ROUTE-NOT-YET-FOUND (bounded, NEVER asserted / NEVER fitted): the exact isospin anti-screening
magnitude s (Z2, bounded 0<s<isoDepth) and the freeze-out edge ratios rb,rc,rl (D8-freezeout
bounded bound) — the remaining BOUNDED refinements toward the ≥15-digit numeral. The composition is
now the DOMINANT structure composed; the ~0.9 residual to the measured value is bounded, not a
~69 gap. Measured 1/α(0)≈137.036 is REMOVABLE PROSE ONLY (G2), no empirical number in any proof.

## ANTI-BULLSHIT GATE (run honestly)

- fold→node: fold → cascade stop (42) → Q=T₃+Y (banked census 16/3 = 2+10/3) → single-channel tower
  (X6) → photon = two-channel recombination a_em = a₂+a_Y (Z2 mixing weight) → +70 hypercharge
  ceiling. Every arrow forced/banked.
- standard version: SM MEASURES 1/α_em(0) via hadronic vacuum polarization (~2e-10 error bar). The
  fold DERIVES the +70 = (5/3)·42 from the census; no measured input. Moat: field posits/measures the
  ceiling couplings; fold derives them (42 = cascade stop, 70 = (5/3)·42 census).
- delete physics words: over Cut, invAlphaEM bands = invAlphaYHigh + invAlphaZero bands
  = 112 + totalScreening bands = (invAlpha2High + Σ bandScreen isoDepth) + (invAlphaYHigh + Σ bandScreen
  hyperDepth) given 16/3 = 2 + 10/3; and invAlpha2High/(invAlpha2High+invAlphaYHigh) = 3/8. Pure Cut
  arithmetic on banked objects. Survives.
- temptation "add 70 because 137−68≈69": REFUSED — 70 is invAlphaYHigh (banked = (5/3)·invAlphaHigh),
  and the census additivity 16/3 = 2+10/3 (Q=T₃+Y) FORCES the split. The recombined LO lands at
  137.9476, NOT on measured; the bounded refinements remain, never fitted. Genuinely not a fit.

## GUARDS

foundations-only (#print axioms ⊆ {propext,Classical.choice,Quot.sound}); floats NOWHERE; no
empirical number in any proof; NO-FIT; import guard never OneAxiom/MassGapOne; costume bites;
ONE directed successor (re-narrow recombined sum → D7 restatement) — NO generic SELECT (rail).
