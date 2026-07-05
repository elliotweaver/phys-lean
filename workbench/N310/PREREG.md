# N310 PREREG — SEEDED FLAVOR ROUTE T7: the quark associator deviation / separation theorem

## SELECT (directed): this node is the pre-directed single successor of N309 (seed target T7).
Fresh-worker arc synthesis + anti-bullshit gate on the DERIVATION (not the target):

- The theory-native heart (seed §2 T7, §1 step 5/6): leptons live on the ASSOCIATIVE ℂ-line
  inside the octonions → the 45° Born balance (Koide Q=2/3) is EXACT, no CP deviation (I₃=0).
  Quarks span an octonionic FANO line (three imaginary units on a Fano-plane line, non-assoc) →
  they DEVIATE by the associator cross-term Re(x₁x₂x₃) (I₃≠0). THE SEPARATION: the Koide-type
  norm invariant (Q ← I₂, quadratic in the amplitudes) and the CP-type invariant (I₃ ← the
  associator triple-product) are INDEPENDENT octonion invariants — a wrong I₃ does not touch Q.

- Anti-bullshit / free-floating gate PASSED: the production TYPE cites the BANKED derived
  octonion objects — the associator `Phys.Algebra.assoc` (Alternative.lean, N5b) and the banked
  calibration 3-form `assoc3` (OctonionAssociative3Form.lean, N209, = −reQ(x·(y·z))), the banked
  central embedding `ocR` (N5c) and fold-root unit `u1` (N6 `complexUnit_sq`). NOT a generic
  non-associative-algebra statement. Words-removable: delete quark/lepton/CP/Koide and every
  theorem stands as a pure statement about `assoc`/`assoc3` on `O ℚ`'s ℂ-line vs a Fano line.

## THE OBJECT (what carries I₃): assoc3 (banked N209).
`assoc3 x y z := gForm x (octCross y z) = −reQ(x·(y·z))` for imaginary x,y,z. Totally
antisymmetric calibration 3-form; banked `assoc3_witness : assoc3 u2 u1 (octCross u1 u2) = −1`
(nonzero), `assoc3_swap_xy/yz` (antisymmetry). This IS the Re(x₁x₂x₃) cross-term (I₃).
The algebra-level associator `assoc x y z := (x·y)·z − x·(y·z)` (N5b) is the vector form;
`assoc_nonvanishing` gives it nonzero on the Fano triple.

## MEASURE-FIRST (W9) — 4 probes, ALL COMPILE ℚ-exact LIGHT (workbench/N310/Probe{,2,3,4}.lean):
1. `assoc_central_homogeneous (a b c)(u v w) : assoc (ocR a·u)(ocR b·v)(ocR c·w)
      = ocR(a·b·c)·assoc u v w`  — THE SEPARATION MECHANISM: amplitude magnitudes factor OUT of
   the associator; vanishing is a DIRECTION-only property, independent of magnitudes (norms/I₂).
   [Probe.lean, via banked ocR_assocL/M/R, ocR_mul, ocR_comm]
2. `cline_mul` + `cline_assoc_zero` : the associative ℂ-line `cline a b = ocR a + ocR b·u1` is
   closed (complex mult) and its algebra associator VANISHES → leptons exact, I₃=0. [Probe2.lean]
3. `assoc3_smul_x (c)(x y z) : assoc3 (c•x) y z = c·assoc3 x y z` — I₃ is trilinear; scaling slot-1
   magnitude scales I₃ linearly, so a NONZERO I₃ stays nonzero at any magnitude. [Probe3.lean]
4. `octCross_u1_collinear` + `assoc3_cline_zero (x)(b d) : assoc3 x (b•u1)(d•u1) = 0` — the ℂ-line
   scalar cross-term I₃ VANISHES (collinear u1-directions, octCross=0). [Probe4.lean]

## PRODUCTION PLAN (one leaf module, ns Phys.Algebra.HJ), all foundations-only:
Module `Phys/Algebra/OctonionJordanGenerationAssociatorDeviation.lean`:
 (T7-1) `scaled_mul`, `assoc_central_homogeneous` — the separation mechanism (magnitudes factor out).
 (T7-2) `cline`, `cline_mul`, `cline_assoc_zero` — ℂ-line associator = 0 (LEPTON exact, algebra I₃).
 (T7-3) `octCross_u1_collinear`, `assoc3_cline_zero` — ℂ-line scalar I₃ (assoc3) = 0.
 (T7-4) `assoc3_smul_x` (+ y,z slots) — I₃ trilinear; the DEVIATION persists at any magnitude.
 (T7-5) `fano_assoc3` := banked assoc3_witness reused: `assoc3 u2 u1 (octCross u1 u2) = −1 ≠ 0`
        (QUARK deviation, I₃≠0) — the Fano line genuinely deviates.
 (T7-6) THE SEPARATION THEOREM: same slot-magnitudes, ℂ-line has I₃=0 while Fano has I₃≠0
        (`separation`), and the norm invariant Q (Qkoide/koide_genVec, N307) is UNAFFECTED by I₃
        (independent invariants). Capstone tying Q←I₂ ⊥ CP←I₃.
 W8 non-vacuity: `cline_assoc_zero` vs `assoc_nonvanishing` are genuinely DIFFERENT (0 vs ≠0);
   `assoc3_cline_zero` (=0) vs `fano_assoc3` (=−1) differ. A WRONG I₃ value fails.
 Costume C339: a wrong reading (I₃ same on both lines / associator deviation is free) reduces to
   a false numeric and BITES.

## GUARDS (seed §4): G1 nothing asserted — every value falls out of banked assoc/assoc3/ocR/u1.
G2 no empirical number (measured CKM/quark data = removable prose only). G4 the Fano/associator
is the banked object EVALUATED. G5 words-removable. G6 foundations-only. G7 ONE LAW — ℚ-exact,
no ℝ reached for.

## ONE-SUCCESSOR RAIL: if it lands, ONE directed child toward T8 (mixing, LEADING-ORDER per the
seed honest-status caveat) — the tridiagonal frame-overlap; NOT both a child and a SELECT ticket.
