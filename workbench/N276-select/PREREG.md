# N276 PREREG — THE JOINT (CHARGE, WEAK-ISOSPIN-CARTAN) WEIGHT DECOMPOSITION OF ONE GENERATION'S FUNDAMENTAL MATTER

Node: N276. File: Phys/Algebra/TowerGatherJointChargeIsospinWeights.lean, namespace Phys.Algebra.
Costume: C307. Gate: gate-fast. max_runtime 90m.

## TARGET (theory-native, SELECT S1–S5 comments 163–166)
The charged complement of the fundamental matter ImO carries a SECOND derived grading: under the
two BANKED COMMUTING operators Q=chargeOp (gather tear on the fold-root u1, N240) and T3=imRep DI
(doubling isospin Cartan, N202), which COMMUTE (N254 charge_isospin_commute), the fundamental 7
decomposes into JOINT INVARIANT SUBSPACES:
    ImO = singlet(sgl) ⊕ Winert ⊕ Wactive      (finranks 1 + 2 + 4 = 7)
where Winert = span{e4O,e5O} is CHARGED (Q²=−1 on it) but isospin-Cartan-INERT (T3=0), and its
isospin grading is TRANSVERSE to the colour 3⊕3̄ split (N266): Winert⊓Uhol=span{e4O}, Winert⊓Uah=span{e5O}.

## GO/NO-GO (de-risk, all must be EXIT 0 in scratch before promotion)
G1. imRep DI kills e4O,e5O (qZ Imat e4O = 0, qZ Imat e5O = 0).                 ✓ probe1 EXIT 0
G2. chargeOp on Winert: qZ Cmat e4O = e5O, qZ Cmat e5O = −e4O (complex structure). ✓ probe1 EXIT 0
G3. e5O ≠ 0 (Winert charged, non-vacuous).                                     ✓ probe1 EXIT 0
G4. finrank Winert = 2 (finrank_span of indep imaginary units).            ✓ probe2 EXIT 0 (24s)
G5. Winert ⊔ Wactive = Vsub (the charged 6-space splits 2⊕4).              ✓ probe4 EXIT 0 (30s)
G6. e5O ∉ Uhol, e4O ∈ Uhol ⊓ Winert (transversality to colour).           ✓ probe3 EXIT 0 (10s)
G7. Q,T3 map Winert→Winert (via G1/G2 generator images).                   ✓ probe1 EXIT 0

ALL GO. Node is LIGHT (linarith/finrank_span/span_union, no octonion decide, no W9). Whole-module
olean est. ~25-35s. Proceeding to production.

## KILL classes (declare instrument failure, do NOT grind)
K1. Any octonion coordinate `decide`/`native_decide` — FORBIDDEN. Use linarith on the banked
    integer matrices Cmat/Imat (the N252/N256 methodology) + finrank_span of explicit indep units.
K2. Any maxHeartbeats raise above default — instrument wall, STOP, decompose.
K3. If a finrank/inf obligation blows up (W9), split into named sub-lemmas, bank each.
COST BUDGET: whole-module olean ≤ ~30s net (comparable to N254/N256, all linarith/finrank_span).
If any single obligation exceeds ~60s in a bounded probe → W9 decompose.

## MOAT / STANDARD
UNBROKEN: every object banked (chargeOp N240, imRep DI/Imat N254, Vsub/Uhol/Uah/e_iO/imBasis
N42c/StabilizerSplit, sgl N244). COMPLETE: foundations-only, no sorry/axiom/decide. WORDS-REMOVABLE:
delete charge/isospin/colour/generation/quantum-number → a pure statement about joint invariant
subspaces of two commuting ℚ-endomorphisms of ImO. FREE-FLOATING: the TYPE mentions banked
chargeOp/imRep DI/Vsub/Uhol/Uah/sgl/O ℚ — carrier-specific (the transversality is octonion/doubling
specific). Costume C307 bites at a weight-block finrank witness.

## SCOPE (honesty)
The joint (charge, isospin-Cartan) weight decomposition 1⊕2⊕4 + the charged-isospin-inert block +
transversality to colour ONLY. NOT the hypercharge NORMALIZATION/mixing angle (★2), NOT the full
su(2) Casimir irrep refinement of Wactive (downstream ascent), NOT ★5 texture (un-forceable per
probe_assoc), NOT masses/mixings, NOT parity.
