# N215 PREREG — THE CUBIC NORM (FREUDENTHAL DETERMINANT) on J₃(O), and its WELL-DEFINEDNESS via octonion trace-associativity

Frozen BEFORE compute. Task t_53cede2d. Fresh run (no prior N215 WIP).

## Context (what N214 banked, read every run)
N214 (`Phys/Algebra/OctonionJordanTraceForm.lean`) banked the tower of invariants up to degree 2:
- LINEAR trace `jTr A = trace A`, `jTr_Dg (Dg t) = ocR(t0+t1+t2)`, `jTr_Xz = 0`.
- BILINEAR trace form (Cartan–Killing metric) `jTraceForm A B = trace(jb A B)`, `jTF_Dg_Dg = ocR(2·Σsᵢtᵢ)`,
  the charge plane = `(ℚ·1)^⊥` via `jTF_one_Dg_zero_iff`.

The invariant tower of J₃(O): LINEAR (trace, N214) → QUADRATIC (trace form, N214) → **CUBIC (the norm/determinant — UNBANKED)**.
The cubic norm is THE defining invariant of the exceptional (Albert) Jordan algebra. Genuinely unbanked
(grep confirmed: no cubicNorm/jDet/jN/freudenthal anywhere in Phys/).

## THE FRONT CHOSEN: (b) THE CUBIC NORM `jN`
Named in the §N214-superseded FORWARD FRONTIER as candidate (b). Chosen over (a) the forced-isospin front
because (a) risks a POSIT (which of the S₃-equivalent frame idempotent-differences E0−E1 / E1−E2 / E0−E2 is
"the" isospin axis is a convention unless a banked fact breaks the frame symmetry — the honest ascent verdict).
The cubic norm is a genuinely-NEW structural invariant, LIGHT-measurable, and feeds the ascent later
(the cubic norm's Cartan-invariance / its relation to the trace form). Chosen over (c) the quadratic form
(mechanical A=B special case of jTF) and (d) Freudenthal sharp (heavy from-scratch).

### Definition (the Freudenthal cubic norm of the general Hermitian `Hm d0 d1 d2 a b c`)
    jN d0 d1 d2 a b c : ℚ :=
      d0*d1*d2
      − d0 * reQ (c * star c)     -- − d0·|c|²
      − d1 * reQ (b * star b)     -- − d1·|b|²
      − d2 * reQ (a * star a)     -- − d2·|a|²
      + 2 * reQ ((a * c) * star b) -- + 2·Re(a·c·b̄), the trilinear cross-term

### THE GENUINELY-NEW STRUCTURAL CONTENT (the "one cause, many terminations" web)
The trilinear cross-term `reQ((a·c)·star b)` — for a general nonassociative ring — would depend on the
BRACKETING. It is bracketing-INDEPENDENT `reQ((a·c)·star b) = reQ(a·(c·star b))` EXACTLY BECAUSE octonions
are trace-associative (`reQ_mul_assoc3`, N210). This is the structural REASON the Albert algebra HAS a
well-defined cubic norm/determinant — the SAME real-part-associativity that made the calibration 3-form
cyclic (N209/N210), and it FAILS beyond octonions (sedenions lose alternativity, N200). The cubic norm
exists up to octonions and no further.

## GO / NO-GO
- GO if a probe compiles foundations-only proving: (1) `jN_diag` (jN on the diagonal = d0·d1·d2 — the
  product of the three real eigenvalues); (2) `jN_offdiag_wd` (the cross-term is bracketing-independent
  via reQ_mul_assoc3); (3) a genuine off-diagonal VALUE showing jN depends on the off-diagonal (W8 teeth,
  non-vacuous — jN ≠ diagonal product). Plus spectral values `jN 1 1 1 0 0 0 = 1` (unit norm of the identity),
  `jN 1 0 0 0 0 0 = 0` (a primitive frame idempotent has cubic norm 0).
- NO-GO / DECOMPOSE (W3) if the off-diagonal cross-term needs an octonion coordinate-ring blow-up > KILL:
  bank the diagonal + well-definedness now, child the off-diagonal cubic remainder.
- NO-GO / WIDER (W8) if the whole thing measures as vacuous (jN identically the diagonal product / a
  mechanical re-pin of reQ laws with no genuine off-diagonal content) → look wider.

## KILL (W9 compile-cost budget)
- Each probe compile ≤ 60s. Total measure ≤ 6 min.
- maxHeartbeats: DEFAULT (200000). If any single obligation needs an inflated ceiling or a monolithic
  `ring`/`decide`/`simp` over expanded octonion coordinates → W9 crime scene → STOP, decompose, reframe
  through reQ laws + reQ_mul_assoc3 (structure over expansion). NO octonion coordinate ring bash.
- If ≥2 probe routes blow up → the off-diagonal is a W3 child; bank diagonal + well-definedness this run.

## Anti-vacuity (W8) costume plan
Costume C247 (next id), row in scripts/costume_manifest.tsv, bites a WRONG cubic-norm value reducing to a
false numeric DISTINCT from the banked battery (…C244=212, C245=213, C246=214) → use `= 215`.
Candidate: a W8 witness where jN of a specific off-diagonal Hermitian matrix GENUINELY takes value V ≠
diagonal product; bogus claim forces V = 215.

## Physics-words-removable
Delete cubic-norm/determinant/Albert/Freudenthal/Jordan/eigenvalue/frame/idempotent → the statement stands:
over ℚ and O ℚ = CD(H ℚ), for the ℚ-valued form jN d0 d1 d2 a b c = d0d1d2 − d0·reQ(c·star c) − … +
2·reQ((a·c)·star b), jN d0 d1 d2 0 0 0 = d0d1d2, reQ((a·c)·star b) = reQ(a·(c·star b)), and a nonzero
off-diagonal witness. Pure algebra over the derived field and the derived rung.
