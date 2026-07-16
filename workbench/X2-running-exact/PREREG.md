# X2 — PREREG: THE RUNNING AS THE SCALE-RESOLVED SELF-OVERLAP (exact closed solution)

## TARGET (seed §X2, owner-authorized arc X; directed successor of N460/X1)
Promote the banked `invAlphaRun`/`sinSqRun` FORM to the DERIVED running law with the DERIVED
κ = kappaLeading = 1/(3·cutPi) (N460) folded in — so the law has NO free parameter — and the running
DEPTH = the banked census Tr(Q²) = 16/3 (N317, `chargeTraceDepth`). Prove it IS the EXACT CLOSED
SOLUTION (the β IS the derived census; the affine-in-cutLog form is the closed solution of the
autonomous constant-rate flow, NOT a truncated perturbative series).

## THEORY-NATIVE READING (front chosen theory-first)
"Running" IS the gather's per-channel Born self-overlap RESOLVED AT A SCALE. The rate of that
resolution per e-fold of scale is the DERIVED census depth `Tr(Q²)=16/3` (a FINITE, ℚ-EXACT banked
count — N317), normalized by the derived loop factor κ=1/(3π) (N460). Because the depth is an EXACT
finite census and not an infinite perturbative tower, the running it generates is EXACT: the
affine-in-cutLog law is the *closed solution* of the autonomous flow, and the banked cutExp/cutLog
inverse pair (N341) inverts it in CLOSED FORM, recovering the scale ratio M/μ EXACTLY (no error bar,
no truncation). A truncated/approximate running would NOT satisfy the exact scale-ratio composition
law (the cocycle) nor invert exactly.

## WHAT "EXACT CLOSED SOLUTION" MEANS HERE (the two proofs, both theory-native, both bite)
1. AUTONOMOUS-FLOW COCYCLE (= "not a truncated series"): the running increment depends ONLY on the
   scale RATIO μ₂/μ₁, independent of the reference scale M:
       invAlphaRunExact M μ₁ − invAlphaRunExact M μ₂ = betaCensus · cutLog(μ₂/μ₁).
   This is the exact group/cocycle law of the constant-rate flow; a truncated running would carry
   residual reference-scale dependence. Needs `cutLog_div` (build from banked `cutLog_mul`).
2. CLOSED-FORM EXP-INVERTIBILITY (= "the cutExp/cutLog pair closes it exactly", the marquee):
       cutExp( (invAlphaRunExact M μ − 42) / betaCensus ) = M / μ   (M,μ>0)
   inverting the running law returns the EXACT scale ratio. Uses banked `cutExp_cutLog` +
   `betaCensus ≠ 0`. This is the exactness the seed points at.

## PARAMETER-FREE RATE = THE DERIVED CENSUS
- `betaCensus := kappaLeading * chargeTraceDepth`  (= κ·Tr(Q²))
- `betaCensus = 16/(9·cutPi)`  = (1/(3π))·(16/3), FALLS OUT; never asserted. (division-free teeth:
  `betaCensus * (9·cutPi) = 16`.)  `0 < betaCensus` from `kappaLeading_pos`·`chargeTraceDepth_pos`.
- `invAlphaRunExact M μ := invAlphaRun kappaLeading M μ`, `= 42 + betaCensus · cutLog(M/μ)` — the
  banked N341 form with the derived κ substituted; every coefficient now derived (42=N316,
  16/3=N317, 1/(3π)=N460). No free parameter.

## sinSqRun TIE (parameter-free, exact)
- `sinSqRunExact d2 M μ := sinSqRun d2 kappaLeading M μ`. Matter-depth stationarity is EXACT at 3/8
  at all scales (banked `sinSqRun_matter_stationary`), κ>0 discharged by `kappaLeading_pos`; the
  departure below 3/8 for reduced depth carried through (banked `sinSqRun_departs_down`).

## ANTI-BULLSHIT GATE (in writing)
- Trace fold→…→node: fold → return-surface self-overlap flux → κ=1/(3π) (N460) → census depth
  Tr(Q²)=16/3 (N317, Born self-overlap of the charge) → running rate κ·depth → the affine law is the
  EXACT integral of a constant (the finite census) → exp/log inverse closes it. Every arrow forced.
- Standard version: the one-loop RGE `d(1/α)/dlnμ = −b`, solution affine-in-log; textbook keeps b to
  leading order, treating the running as a truncated β-series. The theory says the depth IS the exact
  finite census, so the affine law is the *closed* solution — the cocycle + exact exp-inverse are the
  content the truncated picture lacks. Genuinely different: exactness, not approximation.
- Words-removable: delete coupling/running/β/census/scale → pure statement over `Cut` that the
  affine-in-cutLog function with derived-constant slope satisfies the ratio-cocycle law and is
  exp-invertible (closed inverse). Survives as real analysis on `Cut`.
- Not free-floating: every TYPE mentions banked `invAlphaRun`/`kappaLeading`/`chargeTraceDepth`/
  `sinSqRun`/`cutLog`/`cutExp` over `Cut`. Not a generic affine lemma.
- G2 no-fit: no empirical number in any proof; 137.036 / 0.231 / 127.955 removable prose/costume.
- G3 exact: betaCensus, the cocycle, the exp-inverse are EXACT derived facts of `Cut`; no error bar.

## BUILD PLAN (bank-as-you-go, all light algebra on banked lemmas)
1. `cutLog_div` : cutLog(a/b) = cutLog a − cutLog b (a,b>0), from banked `cutLog_mul`.
2. `betaCensus` + `betaCensus_eq` (=16/(9π), field_simp) + `betaCensus_pos` + `betaCensus_mul_nine_cutPi` (=16).
3. `invAlphaRunExact` + `invAlphaRunExact_eq` (=42+betaCensus·cutLog(M/μ)).
4. `invAlphaRunExact_cocycle` (uses cutLog_div).
5. `invAlphaRunExact_invert` (uses cutExp_cutLog + betaCensus_pos).
6. `invAlphaRunExact_screens` (reuse `loopNormalization_screens`) — genuinely runs.
7. sinSqRun tie (2 theorems, reuse banked).
8. W8 teeth: betaCensus_ne_zero; invAlphaRunExact_ne_high (μ<M ⟹ ≠42, runs); cocycle is reference-free.
9. Welded non-hollow capstone `runningExact_landing` (rate=census ∧ betaCensus=16/9π ∧ screens ∧ exact inverse).

## COST / KILL
All proofs are `rw`/`field_simp`/`ring`/`linarith` on banked lemmas — expected cheap (< default
heartbeats each). KILL: if `field_simp` on betaCensus or the invert blows up, decompose that lemma to
a child (unlikely). MEASURE FIRST: probe cutLog_div + betaCensus_eq + cocycle + invert before production.

## SUCCESSOR (one-successor rail)
Directed child toward X3 (seed §X3: the census per resolution band — R-ratio plateaus 2, 10/3, 11/3
as Nc·ΣQ² derived identities, band edges = banked masses). ONE successor only.
