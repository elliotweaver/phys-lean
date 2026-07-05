N299 PREREG — the innerness-FREE reduction of "derH3 kills the trace" via the commutator-trace.

═══ SELECT (fresh worker) ═══
S1: arc N285→N298 built e₆=f₄⊕L₀ and is grading the movers toward ★5/★2. N298 banked the trace-
   form invariance + generator-annihilation, and DIAGNOSED the remaining gap (full ∀T∈derH3,
   jTr(TA)=0) as needing an independent structural fact — the ticket proposes Der(H₃O)=InnDer
   (Chevalley–Schafer innerness).
S2 REFRAME (W1 step 2), the DISSOLUTION: innerness is the STANDARD route and it is HEAVY (span
   {innerMul} = derH3 = dim 52, MEASURED true but no dim-52 fact is banked → a big spanning build).
   The theory offers the SHORTER classical stroke: a derivation kills the trace because its action
   on the MULTIPLICATION OPERATOR is a COMMUTATOR whose trace is automatically 0 — NO innerness.
   Concretely: N296 banked  ⁅T, Lmul A⁆ B = Lmul(TA) B  for T∈derH3, Hermitian A,B (the Leibniz
   law of jb rearranged). Restrict to the Hermitian submodule H: Lmul(TA)|_H = ⁅T|_H, Lmul A|_H⁆,
   an operator COMMUTATOR, so trace_H(Lmul(TA)) = 0 by LinearMap.trace_lie (Mathlib, no finiteness
   needed). This dissolves the Chevalley–Schafer wall structurally.
S3 RECONCILE: same target (derH3 kills the trace) but REDIRECTED off the innerness route onto the
   theory's shorter commutator-trace route (FOLLOW THE THEORY).
S4 anti-bullshit gate (PASSED, see comment 227 + below).

═══ MEASURE-FIRST (workbench/N299/probe1.py, EXIT 0) ═══
 · equivariance ⁅T,Lmul A⁆B = Lmul(TA)B reconfirmed on Hermitian args (residual 4.4e-15).
 · THE DISSOLUTION WORKS: tr_Herm(Lmul C) = 18·rtr(C) EXACTLY (k=18≠0), tr_Herm(⁅T,Lmul A⁆)=0
   (9e-16) ⟹ rtr(TA)=0 for T∈derH3 — INNERNESS-FREE.
 · Route B (innerness): span{innerMul(bᵢ,bⱼ)} over a Hermitian basis = derH3, rank 52 EXACTLY —
   confirms the classical theorem but shows it is the HEAVY route (dim-52 spanning, unbanked).
 · Lean plumbing (ProbeN299a.lean, EXIT 0): Module.Finite/Free fire on hermSub; LinearMap.trace_lie
   gives ⁅f,g⁆-trace = 0 cleanly.

═══ SCOPE — THIS NODE (W3 DECOMPOSE) ═══
BANK the innerness-free REDUCTION lever (the genuinely-new, Chevalley–Schafer-dissolving content):
 1. hermSub : Submodule ℚ (Matrix (Fin 3)(Fin 3)(O ℚ)) = {M | Mᴴ = M}, with Module.Finite/Free.
 2. Lmul A restricted to hermSub (via jb_herm), T restricted to hermSub (via IsHermJordanDerivQ.1).
 3. ★★★ restricted_equivariance: for T∈derH3, A Hermitian, (Lmul(TA)).restrict = ⁅T.restrict,
    (Lmul A).restrict⁆ on hermSub  (from N296 spectrum_sector_equivariance).
 4. ★★★ derH3_kills_hermTrace: trace_H((Lmul(TA)).restrict) = 0  (via 3 + LinearMap.trace_lie).
 5. W8 non-vacuity: trace_H((Lmul 1).restrict) ≠ 0  ((Lmul 1).restrict = 2•id_H, trace = 2•finrank,
    finrank ≥ 1 since 1∈hermSub, 1≠0) — the trace functional is genuinely nonzero, TA lies in the
    kernel of a NONZERO functional.
 6. capstone bundling + jordan_fails_H4 (N5) in the TYPE.

═══ CHILD (the ONE successor, directed W9 sub-node) ═══
The trace-COEFFICIENT identity  trace_H((Lmul C).restrict) = k·rtr(C)  with k≠0 (measured k=18;
route: either build the 27-dim Hermitian basis, or trace_V(Lmul C)=48·rtr(C) via the banked bO
octonion basis + trace_O(L_a)=trace_O(R_a)=8·reQ(a), minus trace on the skew part). Combined with
THIS node's derH3_kills_hermTrace it closes the FULL ∀T∈derH3, jTr(TA)=0 and the f₄-module split
L = ℚ·1 ⊕ L₀ (dilation line ⊕ traceless dim-26 submodule).

NOT banked (honest): the full ∀T jTr(TA)=0 (needs the childed coefficient k≠0); the f₄-module split;
the dim-78 bundled e₆; the ★5 mass-texture VALUE / ★2 mixing VALUE (route-not-yet-found, FORCED
build targets, NOT invented, NOT human-gated).

═══ ANTI-BULLSHIT GATE (S4) ═══
1. FOLD-CAUSAL: fold → non-assoc octonions (N2c) → cap H₃(O) at order 3 (N5) → its Jordan
   derivations f₄ satisfy Leibniz → the derivation's action on Lmul is a COMMUTATOR ⁅T,Lmul A⁆=
   Lmul(TA) (N296) → operator trace of a commutator = 0 (trace_lie) → the derivation kills the
   operator-trace functional. Every arrow forced; no posit.
2. DISSOLUTION: standard = prove Der(H₃O)=InnDer (hard classification) then inner ⟹ kills trace.
   Theory DISSOLVES it — no classification; the commutator-trace kills it for ALL derivations at once.
3. WORDS-REMOVABLE: pure matrix/operator algebra over ℚ, O ℚ; delete trace/mass/spectrum — stands.
4. TEMPTATION NAMED: grind Chevalley–Schafer innerness (span{innerMul}=derH3 dim 52). REJECTED for
   the shorter commutator-trace stroke; the innerness fact is confirmed by measurement but not needed.
5. HONESTY: genuinely-shorter theory-native route; the coefficient k≠0 is honestly CHILDED, not swept.
   NOT free-floating (every TYPE cites banked Lmul/jb/derH3/innerMul/jTr on Matrix(Fin 3)(Fin 3)(O ℚ)).

FILE: Phys/Algebra/OctonionJordanHermTraceCommutator.lean (ns Phys.Algebra.HJ).  Costume: next BID C328.
