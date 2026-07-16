# X1 — PREREG: DERIVE κ = 1/(3π) from the gather self-overlap phase-wrap

## TARGET (seed §X1, owner-authorized arc X)
Kill the last free parameter κ in the banked running form
`invAlphaRun = invAlphaHigh + κ·chargeTraceDepth·cutLog(M/μ)`
(Phys/Algebra/FineStructureRunningCoupling.lean). DERIVE κ = 1/(3π), never assert.

## THEORY-NATIVE READING (the front, chosen theory-first)
The coupling IS the gather's per-channel Born self-overlap (N313/N314/N411). "Running" is that
self-overlap RESOLVED AT A SCALE; the LEADING loop-normalization κ is the geometric factor of ONE
full phase-wrap of the self-overlap over the fold's return surface (the 2-sphere, banked N328).

- A channel's self-overlap with its phase-rotated self projects as the Born-square cos²θ (real
  overlap cos θ).
- Accumulated over the return-surface MERIDIAN with the banked meridian measure element cutSin θ
  (the same measure whose total flux = 2 gives the banked 4·cutPi solid angle, N328):
      selfOverlapMeridianFlux := ∫₀^{cutPi} cutCos(θ)² · cutSin(θ) dθ = 2/3.
- Normalized PER full phase-wrap (azimuthalTurn = 2·cutPi = the closed-loop measure, N328):
      κ := selfOverlapMeridianFlux / azimuthalTurn = (2/3)/(2·cutPi) = 1/(3·cutPi).

The "3" is FORCED by the cubic antiderivative ∫u²du = u³/3 (the isotropy share ⟨cos²⟩ over the
3-dim return surface), NOT inserted. The "1/π" is the loop-measure normalization by the phase wrap
(2π = the closed-orbit circumference — QED's loop 1/(2π)).

## ANTI-BULLSHIT GATE (run in writing)
- Trace fold→…→node: fold self-look-back → return surface closes (N328) → Born self-overlap
  (N313) projects as cos² → meridian flux over the banked sin-measure → normalized per phase wrap.
  Every arrow forced; no posit but the fold.
- Standard version: QED one-loop vacuum polarization coefficient 1/(3π); the "3" = transverse
  projector angular average ⟨cos²⟩=1/3, the "π" = loop measure. The theory DISSOLVES the loop
  integral into the return-surface self-overlap flux — the closed object the loop approximates.
- Words-removable: delete coupling/loop/self-overlap/screening/meridian → pure statement
  `(∫₀^{cutPi} cutCos²·cutSin)/(2·cutPi) = 1/(3·cutPi)` over derived ℝ `Cut`. Survives.
- Not generic/free-floating: every TYPE mentions the banked derived `Cut`, `cutCos`, `cutSin`,
  `cutPi`, `azimuthalTurn`; κ ties into the banked `invAlphaRun` form.
- G2 no-fit: no empirical number in any proof. 137.035999084 etc. removable prose only.
- G3 exact: 2/3 and 1/(3π) are exact derived reals of `Cut`; no error bar, no 3-digit toy.

## BUILD PLAN (bank-as-you-go)
1. Pointwise identity `cutCos x ^ 2 * cutSin x = (cutSin x + cutSin (3*x)) / 4`
   (from cutSin(3x) expansion via banked cutSin_add/cutCos_add + Pythagorean). [words-removable guarantor]
2. Scaled sine antiderivative `sin3Antideriv x := ∑' m, (termwise antideriv of sinTermC(3x,m))`,
   proved `= (1 - cutCos(3x))/3` by the SAME reindex as banked `sinAntideriv` (term = -(1/3)cosTermC(3x,m+1)).
3. `cutCos (3*cutPi) = -1` from banked periodicity (3π = π + 2π, `cutCos_add_two_cutPi` + `cutCos_cutPi`).
4. `selfOverlapMeridianFlux := (sinAntideriv x + sin3Antideriv x)/4`; the integrand equals cutCos²·cutSin (step 1),
   so it IS ∫₀^x cutCos²·cutSin. Evaluate at cutPi: (2 + 2/3)/4 = 2/3.
5. `kappaLeading := selfOverlapMeridianFlux cutPi / azimuthalTurn`; prove `= 1/(3*cutPi)`
   (equivalently `kappaLeading * (3*cutPi) = 1`), cutPi > 0 banked.
6. Tie-in: `invAlphaRun kappaLeading M μ` now has NO free parameter (state the tie theorem to the banked form).

## W8 TEETH
- meridian flux is genuinely 2/3, not 0 and not the constant-1 flux 2 (cos² weighting bites).
- κ * (3·cutPi) = 1 exactly; the WRONG κ (e.g. 1/(6π) from forgetting the meridian, or 1/π) excluded.
- kappaLeading ≠ 0 (load-bearing: a zero κ kills the running).

## COST / KILL
- All tsum manipulations mirror banked N328/N341 code (moderate). KILL: if the scaled antideriv
  reindex blows up compile (>default heartbeats on one lemma), DECOMPOSE step 2 into its own child.
- MEASURE FIRST: probe steps 1 + 3 (cheap algebra) before committing production.

## SUCCESSOR (one-successor rail)
Directed child toward X2 (seed §X2: the running as the scale-resolved self-overlap, κ tied in,
depth = banked Tr(Q²)). ONE successor only.
