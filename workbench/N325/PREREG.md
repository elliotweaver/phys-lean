# N325 — PREREG: CONSTRUCT cutPi on the derived ℝ Cut (continuity → sign change → IVT smallest zero → periodicity)

## NODE
N325. DIRECTED DECOMPOSE-REMAINDER CHILD of N324 (t_e60262c1). Costume C352.
Ticket t_9dd789ac. Production file: Phys/Foundation/ContinuumTrigPi.lean (new; ns Phys.Foundation.ContinuumQ).
This is an EXECUTION node — the parent already ran SELECT and directed this target (the arc-B π-prerequisite's final piece). My job is to BUILD cutPi to the STANDARD, not re-select.

## FOUNDATION (banked, gate-fast GREEN, foundations-only)
- N323 ContinuumTrig.lean: cutCos/cutSin (tsum of alternating series), cutCos_zero=1, cutSin_zero=0,
  cutCos_neg (even), cutSin_neg (odd), cutSin_sq_add_cutCos_sq (Pythagorean), cosTermC/sinTermC +
  cosTermC_abs_eq/sinTermC_abs_eq (|cosTermC x n|=|x|^(2n)/(2n)!, |sinTermC x n|=|x|^(2n+1)/(2n+1)!),
  cosTermC_summable/sinTermC_summable, cosTermC_abs_summable/sinTermC_abs_summable.
- N324 ContinuumTrigAdd.lean: cutCos_add (C(a+b)=Ca·Cb−Sa·Sb), cutSin_add (S(a+b)=Sa·Cb+Ca·Sb),
  boundedness |cutCos|,|cutSin|≤1, cutCos_le_one/neg_one_le_cutCos/cutSin_le_one/neg_one_le_cutSin.
- N175 ContinuumLog.lean: ★ THE TEMPLATE. cutExp_continuousAt_zero (squeeze 1±|h|·cutExp 1),
  cutExp_continuous (via add formula, continuity at 0), cutExp_surjOn_pos (intermediate_value_Icc on
  complete Cut + Classical.choose). ADAPT to cutCos.
- Cut (N33-N37): ConditionallyCompleteLinearOrder / Archimedean / CompleteSpace / Field / OrderTopology.
- Mathlib MACHINERY on Cut: Summable.tsum_le_tsum (Summable f → (∀i,f i≤g i) → Summable g → ∑'f≤∑'g,
  used ContinuumLog:88), tsum_mul_left, tsum_neg, tsum_eq_zero_add, intermediate_value_Icc,
  IsClosed.csInf_mem (Topology/Order/Monotone, needs CCLO+OrderTopology — Cut has both),
  ContinuousAt/squeeze tendsto_of_tendsto_of_tendsto_of_le_of_le', continuous_abs.

## THE ROUTE (adapting the cutExp template; every step over the DERIVED Cut)

### (1) CONTINUITY of cutCos and cutSin
Continuity-at-0 majorant bounds (mirror cutExp_le_at_zero), for |h| ≤ 1:
  |sinTermC h n| = |h|^(2n+1)/(2n+1)! ≤ |h|·(1/(2n+1)!) = |h|·|sinTermC 1 n|   [|h|^(2n+1)≤|h|, exp≥1]
  |cosTermC h (n+1)| = |h|^(2n+2)/(2n+2)! ≤ |h|·|cosTermC 1 (n+1)|             [|h|^(2n+2)≤|h|]
Two-sided (NO separate abs-tsum helper): via Summable.tsum_le_tsum on f≤|f| (le_abs_self) and −f≤|f|
(neg_le_abs):
  cutSin h = ∑' sinTermC h n ≤ ∑'|sinTermC h n| ≤ ∑'|h|·|sinTermC 1 n| = |h|·SS,  SS:=∑'|sinTermC 1 n|
  −cutSin h ≤ |h|·SS  ⟹  −|h|·SS ≤ cutSin h ≤ |h|·SS.
  cutCos h − 1 = ∑' cosTermC h (n+1)  (tsum_eq_zero_add, cosTermC h 0 = 1); |cutCos h − 1| ≤ |h|·SC,
  SC:=∑'|cosTermC 1 (n+1)|  ⟹  1−|h|·SC ≤ cutCos h ≤ 1+|h|·SC.
ContinuousAt cutSin 0 / cutCos 0: squeeze between the |h|-linear bounds → 0 / 1 (tendsto, continuous_abs),
EXACTLY as cutExp_continuousAt_zero. Then Continuous everywhere via the addition formulas:
  cutCos(x₀+h)=cutCos x₀·cutCos h − cutSin x₀·cutSin h, cutCos h→1, cutSin h→0  ⟹  →cutCos x₀.
  cutSin(x₀+h)=cutSin x₀·cutCos h + cutCos x₀·cutSin h  ⟹  →cutSin x₀.

### (2) SIGN CHANGE: cutCos 2 < 0
cutCos 2 = ∑' n cosTermC 2 n, alternating 1 − 2²/2! + 2⁴/4! − ... = 1 − 2 + 2/3 − 4/45 + ...
Route: cutCos 2 ≤ partial-sum bracket. cutCos 2 = ∑_{n<K} cosTermC 2 n + ∑' tail. Use the
alternating-series remainder / a direct partial-sum majorant: pairing terms so the tail from n=2 on is
≤ 0 (decreasing magnitude 2^(2n)/(2n)! is eventually decreasing) — MEASURE the cheapest bracket
(likely: cutCos 2 = 1 − 2 + (∑'_{n≥2} cosTermC 2 n) and bound the n≥2 tail ≤ 2/3 by the term-pair /
majorant so cutCos 2 ≤ 1 − 2 + 2/3 = −1/3 < 0). This is the fiddliest piece — MEASURE FIRST.

### (3) cutPi via the smallest positive zero
Z := {x : Cut | 0 ≤ x ∧ x ≤ 2 ∧ cutCos x = 0}. Nonempty: IVT (intermediate_value_Icc) on [0,2],
cutCos 0=1>0, cutCos 2<0, 0∈[cutCos 2, cutCos 0]. Closed: preimage of {0} ∩ [0,2] under continuous
cutCos (IsClosed). BddBelow. sInf Z attained (IsClosed.csInf_mem). Let z₀ := sInf Z; cutPi := 2·z₀.
cutPi > 0 (z₀ > 0 since cutCos 0=1≠0 and continuity gives a nbhd where cutCos>0 — OR z₀≥0 and z₀≠0).
cutCos(cutPi/2)=cutCos z₀=0. cutCos x > 0 on [0, z₀) (z₀ is the LEAST zero, cutCos 0>0, no zero
below ⟹ stays positive by IVT).

### (4) PERIODICITY / SHIFT (if measured tractable — from Pythagorean + addition formulas, CHEAP)
cutSin(cutPi/2)² = 1 − cutCos(cutPi/2)² = 1 ⟹ cutSin(cutPi/2)=±1; sign +1 since cutSin>0 on (0,cutPi/2]
(cutSin 0=0, cutSin' … — or: cutSin(cutPi/2)≥0 via monotone/positivity from series on (0,2]; MEASURE).
cutCos(cutPi) = cutCos(2·(cutPi/2)) = cutCos²−cutSin² = 0 − 1 = −1 (cutCos_add a=b=cutPi/2).
cutSin(cutPi) = 2·cutSin(cutPi/2)·cutCos(cutPi/2) = 0.  Shifts:
cutCos(x+cutPi)=cutCos x·(−1) − cutSin x·0 = −cutCos x; cutSin(x+cutPi)=−cutSin x. All from add formulas.

## DISCIPLINE / GUARDS (SEED relaxes NONE)
- G1 no asserted values: cutPi FALLS OUT as 2·(smallest positive zero of cutCos); decimal 3.14159 NEVER
  in a statement/proof (removable prose only). G2 no empirical number in any proof.
- G4 DERIVED NOT POSITED: cutPi CONSTRUCTED via IVT on the complete Cut; NEVER import Real.pi.
- G5 physics-words-removable: "Gauss-sphere"/"Born" removable prose; content = pure analysis (least
  positive zero of the derived cosine, its period).
- G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound} (Classical.choice ALLOWED — enters via
  IVT witness / sInf / Classical.choose, banked precedent cutLog/cutExp_surjOn_pos). No sorry/axiom/
  native_decide/maxHeartbeats-raise.
- ⚠ ℝ-VIGILANCE / UNEARNED-IMPORT: ground field the DERIVED ℝ Cut + banked cutCos/cutSin/cutExp/
  cutCos_add/cutSin_add. NEVER Mathlib-ℝ/Real.cos/Real.sin/Real.pi/Complex as CONTENT. Mathlib = MACHINERY
  (tsum bounds, intermediate_value_Icc, IsClosed.csInf_mem, ContinuousAt/squeeze, order/topology
  typeclasses) on the DERIVED Cut only.
- W8 non-vacuity: a WRONG cutPi property (cutCos(cutPi/2)=1, or cutPi=0) must fail costume C352.
- W9 INSTRUMENT-COST: continuity + sign-change bound + IVT are the heavy obligations. MEASURE each in a
  bounded probe BEFORE production; bank-as-you-go; PREFER structural reduction (banked cutCos_add /
  Pythagorean / cutExp template) over coordinate re-expansion. DECOMPOSE FURTHER if IVT/smallest-zero
  proves heavy — the decompose-remainder child is then THE single successor.

## ANTI-BULLSHIT GATE (honest theory-native justification)
- Trunk trace: fold → C6 order/Cauchy-completeness (Cut N33-37) → banked summability (N39) → cutExp
  (N174) → cutCos/cutSin + Pythagorean (N323) → addition formulas (N324) → THIS: the derived cosine's
  continuity forces (IVT on the complete Cut) a LEAST positive zero, and 2× it is the period cutPi —
  the Gauss-sphere circumference the scale tower e^(−Nπ) is expressed in. Every arrow forced.
- Standard version: the field POSITS ℝ and imports Real.pi as a library constant. What the theory DOES:
  CONSTRUCTS π as the least positive zero of the fold-descended cosine via the completeness of the
  derived ℝ — π is not a posited number, it is FORCED by the orbit closing on the Born circle.
- Words-removable: delete "Gauss-sphere"/"Born"/"π" prose → the least-positive-zero / period construction
  of the derived cosine survives as pure analysis with all properties proved. PASSES.
- NAME-THE-TEMPTATION: (a) import Real.pi [UNEARNED-IMPORT — REJECTED: the hidden second axiom]; (b) a
  generic "continuous function with a sign change has a zero" over an arbitrary complete field [FREE-
  FLOATING — REJECTED: the TYPE must be about Cut via cutCos]; (c) assert cutPi's value / a period
  relation without the zero construction [G1/G4 — REJECTED]. The surviving content is the genuine
  least-positive-zero of the derived-ℝ cosine, forced, on the banked objects.

## WHAT "DONE" REQUIRES
cutPi CONSTRUCTED structurally (2·least positive zero of cutCos via IVT on complete Cut); cutPi > 0;
cutCos(cutPi/2)=0 (and/or cutCos cutPi=−1, cutSin(cutPi/2)=1); periodicity/shift formulas (if
tractable); all decls foundations-only ⊆ {propext,Classical.choice,Quot.sound}; ground field the
DERIVED ℝ (NEVER Mathlib-ℝ/ℂ/π as content); W8 non-vacuity (a WRONG property fails C352); gate-fast
D0–D6 GREEN; STANDARD met (unbroken/complete/words-removable/not-free-floating/NO BRIDGE).

## SINGLE SUCCESSOR (ONE-SUCCESSOR RAIL)
If cutPi + periodicity COMPLETES the π-machinery → DIRECTED child that RESUMES B2 (derive transmutation
coefficient c using cutPi). If DECOMPOSE FURTHER needed → the decompose-remainder child IS the single
successor (NO B2-resume then). Never both, never zero.
