# N324 — PREREG: the derived-ℝ trig ADDITION FORMULAS + BOUNDEDNESS (arc-D/D1, arc-B π-prerequisite, cont.)

## NODE
N324. DIRECTED DECOMPOSE-REMAINDER CHILD of N323 (t_cd8ba796). Costume C351.
Ticket t_e60262c1. Production file: Phys/Foundation/ContinuumTrigAdd.lean (new; ns Phys.Foundation.ContinuumQ).

## WHERE THE TICKET SENT ME vs WHERE THE THEORY SENDS ME (W3 SCOPE DECISION)
The ticket asks for cutPi + addition formulas + boundedness in ONE node, but flags:
"DECOMPOSE FURTHER if cutPi's zero-existence + IVT proves heavy (W9) — the decompose-remainder
child is then THE single successor."

MEASURE-FIRST verdict: the ADDITION FORMULAS are the genuine machinery build, and cutCos CONTINUITY
(→ the sign-change → the IVT → cutPi) DEPENDS on the addition formulas
(cutCos(x₀+h)=cutCos x₀·cutCos h − cutSin x₀·cutSin h is the continuity-at-x₀ lever, exactly as
cutExp_continuous rode cutExp_add). So the addition formulas MUST land BEFORE cutPi regardless.
They form a coherent, complete, self-contained node. cutPi (continuity + sign-change bound + IVT +
the smallest-positive-zero construction) is genuinely its own build and is childed to N325.

THIS NODE (N324): the ADDITION FORMULAS cutCos_add / cutSin_add + BOUNDEDNESS |cutCos|≤1, |cutSin|≤1.
NEXT NODE (N325, the single successor): cutCos continuity → sign change → IVT → cutPi + periodicity.

This is W3 (decompose ahead of the wall) + the ticket's own explicit permission. NOT scope-shrinking:
the full π-machinery is still owed; it is split across two honest nodes, the second childed as the
single successor.

## THE TARGET (this node)
Over the derived ℝ ContinuumQ.Cut, from the BANKED N323 cutCos/cutSin (tsum of the alternating
series) + the banked Cauchy-product machinery:
  (A1) cutCos_add:  cutCos (a+b) = cutCos a · cutCos b − cutSin a · cutSin b
  (A2) cutSin_add:  cutSin (a+b) = cutSin a · cutCos b + cutCos a · cutSin b
  (B)  boundedness: cutCos x·cutCos x ≤ 1, cutSin x·cutSin x ≤ 1, −1 ≤ cutCos x ≤ 1, −1 ≤ cutSin x ≤ 1,
       |cutCos x| ≤ 1, |cutSin x| ≤ 1.

## THE ROUTE (fully de-risked in workbench/N324/*, ALL probes EXIT 0)
The addition formulas GENERALIZE N323's Pythagorean identity (which is the b=−a special case of A1,
since cutCos(0)=1, cutCos even, cutSin odd). The SAME two-argument Cauchy product + the SAME
alternating-binomial split machinery.

Per-N assembly identities (verified numerically in probe_addlaw.py + probe_split.py, exact rationals):
  cosTermC(a+b)(N+1) = ccCoeff a b (N+1) − ssCoeff a b N     [and cosTermC(a+b) 0 = ccCoeff a b 0]
  sinTermC(a+b) N    = scCoeff a b N + csCoeff a b N
where ccCoeff/ssCoeff/scCoeff/csCoeff are the two-argument Cauchy coefficients
  ccCoeff a b N = ∑_{k+l=N} cosTermC a k · cosTermC b l   (and mirrors).

Mechanism: (a+b)^(2M) expands by add_pow into ∑_{j∈range(2M+1)} C(2M,j) aʲ b^(2M−j); the range
splits into even-index (j=2k) + odd-index (j=2k+1) parts (sum_range_odd_split_gen for odd length,
sum_range_even_split_gen for even length, both closed by `abel`); the even part reassembles the cc
(resp. cs) Cauchy sum, the odd part the ss-shifted (resp. sc) Cauchy sum. The alternating signs line
up: ssCoeff carries (−1)^N vs cosTermC's (−1)^(N+1), giving the MINUS in A1; scCoeff and csCoeff both
carry (−1)^N, giving the PLUS in A2.

tsum lift (probe_tsum.lean EXIT 0):
  cutCos(a+b) = cosTermC(a+b) 0 + ∑'_N cosTermC(a+b)(N+1)         [tsum_eq_zero_add]
             = ccCoeff 0 + ∑'_N (ccCoeff(N+1) − ssCoeff N)
             = [ccCoeff 0 + ∑'_N ccCoeff(N+1)] − ∑'_N ssCoeff N   [tsum_sub, shifted summability]
             = (∑'_N ccCoeff N) − (∑'_N ssCoeff N)                [tsum_eq_zero_add backwards]
             = cutCos a·cutCos b − cutSin a·cutSin b              [two-arg Cauchy product]
sin analogous, no shift (both parts start at N=0).

Boundedness (probe_bound.lean EXIT 0): DIRECT from the banked Pythagorean identity
cutSin²+cutCos²=1 (N323) + a square is nonneg. NO addition formula needed. nlinarith closes each.

## MEASURE-FIRST (W9) — every heavy obligation probed BEFORE production
- probe_ccclosed.lean / probe_cc2.lean: ccCoeff_closed + ccCoeff_factored (two-var, a,b separate),
  N323 cosCoeff_closed closing structure verbatim. EXIT 0 (~9-13s).
- probe_ss.lean: ssCoeff_closed + ssCoeff_factored (odd, (2N+2)! denom). EXIT 0 (~9s).
- probe_sc.lean / probe_cs.lean: scCoeff_factored / csCoeff_factored ((2N+1)! denom). EXIT 0 (~8s).
- probe_assembly.lean: cosTermC_add_succ (the even/odd split assembly). EXIT 0 (~9s).
- probe_sinadd.lean: sinTermC_add + sum_range_even_split_gen (abel). EXIT 0 (~8s).
- probe_tsum.lean: the full cutCos_add tsum lift (pieces as axioms). EXIT 0 (~25s).
- probe_bound.lean: all boundedness from the banked Pythagorean identity. EXIT 0 (~13s).
No native_decide, no maxHeartbeats, no monolithic brute. All CPU ≤ 3.3s per probe. Production
expected LIGHT (~15-25s in the Phys build).

## DISCIPLINE / GUARDS (SEED analytic-completion §D1 + STANDARD; seed relaxes NONE)
- G1 no asserted values: cutPi's decimal NEVER appears (cutPi is not even constructed here); the
  addition formulas / bounds FALL OUT of the series, never premised.
- G2 no empirical number in any proof: none appears.
- G4 DERIVED NOT POSITED: the addition formulas BUILT from the banked cutCos/cutSin series via the
  Cauchy product + binomial split; never axiomatized. NEVER `import Real.cos/sin/pi`.
- G5 physics-words-removable: there are NO physics words. Delete "Born"/"circle"/"orbit": the file
  is the pure statement that C(a+b)=Ca·Cb−Sa·Sb, S(a+b)=Sa·Cb+Ca·Sb, |C|≤1, |S|≤1 over the
  completion-of-the-gather-of-closures of the derived rationals. No name load-bearing.
- G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}: no sorry/axiom/native_decide/
  maxHeartbeats-raise. (No Classical.choice needed here — no IVT/choose in this node; that is N325.)
- ⚠ ℝ-VIGILANCE / UNEARNED-IMPORT: ground field the DERIVED ℝ ContinuumQ.Cut + the banked
  cutCos/cutSin. Mathlib is MACHINERY ONLY (tsum ring machinery Summable.tsum_mul_tsum_eq_tsum_
  sum_antidiagonal / tsum_sub / tsum_eq_zero_add, add_pow, Nat.Choose.Sum, Finset.sum_range,
  order/topology typeclasses) operating on the DERIVED Cut. NEVER Mathlib-ℝ/ℂ/Real.cos/sin/pi as
  content — the hidden second axiom.
- W8 non-vacuity: a WRONG addition formula (e.g. cutCos_add with a PLUS instead of MINUS, or
  cutSin_add with a MINUS) must fail the costume. C351 ties a WRONG value through the correct
  addition formula at a nonzero argument to a false numeric.
- NOT free-floating: every TYPE is literally ABOUT Cut via cutCos/cutSin (the banked derived-ℝ
  trig). The addition formulas are facts about the banked objects, not generic over an arbitrary
  algebra.

## ANTI-BULLSHIT GATE (the honest theory-native justification)
- Trunk trace: fold → self-blindness/C6 order-completeness (N33-N37 derived ℝ) → banked summability
  (N39) → cutExp (N174) → cutCos/cutSin + Pythagorean (N323) → THIS: the group law of the Born-circle
  orbit (the addition formulas) + the orbit's confinement to [−1,1] (boundedness). Every arrow forced.
- Standard version: the field POSITS ℝ with Real.cos/Real.sin and their addition theorems as library
  facts. What the theory DOES to it: DERIVES the circular-function addition law from the fold-descended
  Cut + the banked alternating series via the arena's OWN Cauchy product + the alternating-binomial
  cancellation — the SAME C6 order-completeness engine, one more termination.
- Words-removable check: delete every physics word → pure analysis identities survive with all
  properties proved. PASSES.
- NAME-THE-TEMPTATION: (a) import Mathlib Real.cos_add [UNEARNED-IMPORT — REJECTED: the derived
  cutCos/cutSin are banked, using Mathlib-ℝ-trig as content is the hidden second axiom]; (b) prove a
  generic addition theorem over an arbitrary complete field with an abstract exp [FREE-FLOATING —
  REJECTED: the TYPEs must cite the banked cutCos/cutSin on Cut]; (c) skip the addition formulas and
  jump straight to cutPi via some ad-hoc monotonicity [would need continuity, which needs the
  addition law — the honest path IS through the addition formulas]. The surviving content is the
  genuine group law of the derived-ℝ orbit, forced, on the banked objects.
- HONESTY: cutPi is explicitly deferred to N325 (the single successor); nothing about cutPi is
  asserted here. The addition formulas generalize banked N323 work (the Pythagorean identity is
  their b=−a special case) — genuinely new content (the two-argument law), not a restatement.

## WHAT "DONE" REQUIRES
cutCos_add + cutSin_add proved (the group law of the Born-circle orbit on the derived ℝ);
boundedness |cutCos|≤1, |cutSin|≤1 proved (from the banked Pythagorean identity); all decls
foundations-only ⊆ {propext,Classical.choice,Quot.sound}; ground field the DERIVED ℝ (NEVER
Mathlib-ℝ/ℂ/trig as content); W8 non-vacuity (a WRONG addition formula fails C351); gate-fast
D0–D6 GREEN; STANDARD met (unbroken/complete/words-removable/not-free-floating/NO BRIDGE).

## SINGLE SUCCESSOR (ONE-SUCCESSOR RAIL)
A DIRECTED decompose-remainder child N325: CONSTRUCT cutPi (continuity of cutCos via the addition
formula + squeeze-at-0 adapting cutExp_continuousAt_zero; a sign change cutCos somewhere < 0 via a
partial-sum/alternating bound; the IVT intermediate_value_Icc on the complete Cut for the smallest
positive zero; cutPi := 2·that zero; cutCos(cutPi/2)=0; periodicity). WHEN cutPi is banked, ITS
successor resumes B2 (derive the transmutation coefficient c using cutPi). Childed on the tail,
max_retries=25, assignee phys-novelty. NO other successor (no B2-resume here — would fork).
