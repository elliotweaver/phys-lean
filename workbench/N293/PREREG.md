# N293 PREREG — the su(3)/so(3) SYMMETRIC-PAIR CLOSURE ⁅kAB,kBC⁆=famB (cyclic)

## STATUS: directed W1/W9 dissolution node, ONE successor of N292. Target FIXED (no SELECT).

## TARGET
Three cyclic closure brackets of the N292 fold-root-dressed coset back into the banked family gens:
  ⁅kAB, kBC⁆ = famB,   ⁅kBC, kCA⁆ = famC,   ⁅kCA, kAB⁆ = −famA
kAB := innerMul(slotA u1)(slotB 1), kBC := innerMul(slotB u1)(slotC 1), kCA := innerMul(slotC u1)(slotA 1).
famA/B/C := innerMul(slotB 1)(slotC 1) / innerMul(slotC 1)(slotA 1) / innerMul(slotA 1)(slotB 1).
+ non-vacuity (famB ≠ 0, banked) + carry jordan_fails_H4.

## ROUTE DECISION (measured, workbench/N293/, all EXIT 0 exact-Fraction)
The task's route (a) [lie_lie base-bracket] is CIRCULAR: base2 = ⁅L(slotB 1), innerMul(slotA u1)(slotC 1)⁆
reduces back through the very ⁅kAB,L(slotC 1)⁆ lemma (probe_base2.py). Route (b) direct-ext is all-X
coordinate bash (W9). REJECTED both.

★ THE DISCOVERED THEORY-NATIVE ROUTE (probe_adE_route.py / probe_collapse1.py, all True):
The coset generators ARE matrix-commutator endomorphisms — the N289 pattern, extended by u1²=−1:
  (1) RIGHT-CENTRAL COLLAPSE (generalizes N289 `collapse`): for ARBITRARY A and CENTRAL ocRM Q,
        innerMul A (ocRM Q) = adE(A * ocRM Q − ocRM Q * A).    [measured all-A]
      Since slotB 1 = ocRM pB (central), kAB = innerMul(slotA u1)(ocRM pB) = adE(KAB),
        KAB := slotA u1 * slotB 1 − slotB 1 * slotA u1   (entries ±u1: a "u1-line" matrix).
      Likewise kBC = adE(KBC), kCA = adE(KCA); famA/B/C = adE(ocRM(pB pC−pC pB)) etc (both-central, N289 collapse).
  (2) u1-ALTERNATIVITY LIE-HOM: ⁅adE K1, adE K2⁆ = adE(K1 K2 − K2 K1) for K1,K2 u1-line matrices.
      Holds because every entry of K1,K2 ∈ ℚ·u1, and the matrix associators reduce entrywise to
        assoc(p•u1, q•u1, x) = (pq)•assoc(u1,u1,x) = 0   [left alt `alt_left`],
        assoc(x, p•u1, q•u1) = 0                          [right alt `alt_right`],
        assoc(p•u1, x, q•u1) = 0                          [flexible `alt_flex`]
      — the SAME octonion alternativity that stops the cascade (N2/N5), now closing the u1-dressed coset.
  (3) MATRIX IDENTITY: KAB*KBC − KBC*KAB = KfB (the famB source matrix), by ext + u1²=−1
      (`complexUnit_sq`). Because u1·u1 = −1, two u1-line matrices multiply to a REAL (central) matrix —
      the family. THE PHYSICS: the fold-root's own square (−1, the N6 complex-unit relation) is WHY
      bracketing two fold-root-dressed family-BREAKING directions REGENERATES the real-unit family so(3).
      One cause (u1²=−1) → the coset closes into the family.

⇒ per closure: rw [collapse lemmas] ; apply u1-Lie-hom ; rw [matrix identity]. Cyclic-symmetric.

## LEMMAS TO BANK (Phys/Algebra/OctonionJordanColourCentralizerCosetClosure.lean, ns Phys.Algebra.HJ)
- u1M P := Matrix.of (fun i j => ocR (P i j) * u1)         [the u1-line matrices, analog of ocRM]
- assoc_smul12 / entry vanishing: assoc(p•u1)(q•u1)x = 0, assoc x (p•u1)(q•u1)=0, assoc(p•u1)x(q•u1)=0
- u1M_assoc_L/M/R: matrix (K1 K2)X=K1(K2 X), (X K1)K2=X(K1 K2), (K1 X)K2=K1(X K2) for u1-line K1,K2
- innerMul_ocRM_right: innerMul A (ocRM Q) = adE(A*ocRM Q − ocRM Q*A)  [right-central collapse]
- kAB_eq_adE / kBC_eq_adE / kCA_eq_adE (via slotX_one_ocRM + innerMul_ocRM_right)
- adE_bracket_u1: ⁅adE(u1M P), adE(u1M Q)⁆ = adE(u1M P * u1M Q − u1M Q * u1M P)   [u1-Lie-hom]
- KAB/KBC/KCA as u1M of explicit rational patterns; matrix identities [KAB,KBC]=KfB etc.
- three closures + famB_ne_zero (banked N289) + jordan_fails_H4.

## W9 COST BUDGET / KILL
Each lemma bounded. u1M_assoc entrywise via fin_cases + alt lemmas (like ocRM_assoc). MEASURE the
u1-Lie-hom + one collapse in a bounded probe (built via $LAKE build) BEFORE production. No octonion
coordinate ring on the full arena; no native_decide; maxHeartbeats ≤ N289 precedent (1.2M). If a lemma
exceeds a bounded probe → decompose. If it FIGHTS → framing wrong (route measured residual-0, so grind
not expected).

## COSTUME (fresh BID after C321 = C322)
A WRONG reading (coset abelian / does NOT close into family / u1²≠−1 role) reduces through the banked
closure to a false numeric (1 = 322).

## SCOPE (NOT banked)
NOT the full 8-dim su(3) LieSubalgebra; NOT the (7,5) module character; NOT the ★2 mixing VALUE
(route-not-yet-found, FORCED build target); NOT "= physical SU(3)_flavour" (removable prose).

## ONE-SUCCESSOR RAIL
Hand forward EXACTLY ONE successor (generic SELECTION ticket for the beat after the closure).
Pre-complete kanban_list fork check.
