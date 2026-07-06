# PREREG — N373 arc-G G1: the exchange-involution statistics dichotomy + Pauli exclusion

## TARGET (theory-native, selected via SELECT protocol; see kanban comment #279)
Derive the Bose/Fermi DICHOTOMY and the Pauli exclusion principle as FORCED consequences of the
banked derived carrier `ImO` (the fundamental 7, N22/N227), NOT posited. The exchange of two
identical quanta is the flip of the tensor factors of `ImO ⊗ ImO`; over the derived ℚ (char 0) it
is an INVOLUTION with EXACTLY TWO ±1 eigenspaces (no third → no parastatistics). Bose = +1
(symmetric), Fermi = −1 (antisymmetric). Pauli = the antisymmetric projector annihilates the
identical pair.

## WHY THIS IS THE THEORY-NATIVE G1 (not the DHR/nuclearity tower the seed named)
The banked N227 `TowerGatherSymAntisymDecomp` ALREADY builds the exchange involution `bAdj`
(transpose w.r.t. the Born form) and the split `End ℚ ImO = Sym²(28) ⊕ Λ²(21)`. The dichotomy is
the SAME structure read on the two-quantum state space `ImO ⊗ ImO`: exchange is a char-0 involution
⇒ ±1 only. The DHR/nuclearity/split-property machinery the field grinds DISSOLVES — it is not
needed for the dichotomy. This is the ONE LAW / REFRAMING lens: the heavy tower is the standard
route; the fold's own binary self/other split (S₂, |irreps|=2 — the same binary as s₀=cutLog 2)
forces exactly two classes directly.

## S4 ANTI-BULLSHIT GATE (in writing, with specifics)

1. FOLD-CAUSAL TRACE (fold → … → this node, each arrow forced):
   The fold looks back — self/other. Doubled (two identical carriers present), the fold cannot
   remember order (self-blindness has no ordering datum): swapping the two, then swapping again,
   returns exactly (no phase memory). So exchange E satisfies E² = 1 — an INVOLUTION, forced by the
   fold's orderlessness, not posited. Over the derived ℚ (char 0, banked number tower), an involution
   splits the space into its +1 and −1 eigenspaces and NOTHING ELSE (x = ½(x+Ex) + ½(x−Ex); a
   λ-eigenvector has λ²=1 so λ=±1). TWO classes, forced. The identical pair v⊗v is E-fixed (Ev⊗v =
   v⊗v), so it lies purely in the +1 sector and is KILLED by the −1 projector — Pauli, forced. Each
   arrow is the fold's structure, not "the standard theory of statistics says."

2. DISSOLUTION: the field derives spin-statistics via algebraic QFT — DHR superselection sectors,
   nuclearity, the split property, statistics operators of the braid/permutation group. The theory
   dissolves ALL of it: the dichotomy is one fact (char-0 involution ⇒ ±1), living on the banked
   derived carrier. The heavy tower is not needed. Named dissolution.

3. GOAL-WORDS-REMOVABLE: delete "Bose/Fermi/Pauli/spin/statistics/exclusion". What remains: the
   flip endomorphism of `V ⊗ V` (V = banked `ImO`) is an involution; over ℚ its only eigenvalues
   are ±1; the two ±1 projectors are orthogonal idempotents summing to 1 and are DISTINCT; the −1
   projector annihilates the diagonal v⊗v. A pure theorem about a char-0 involution on the banked
   derived carrier. The reason "this is the next node" survives without physics words: the fold's
   doubling forces an involution, and an involution's structure is the next thing to read.

4. STANDARD-MATH TEMPTATION a saturated worker would pick: "import Mathlib operator-algebra / build
   the DHR nuclearity layer, then invoke the standard spin-statistics theorem." REJECTED — that is
   the free-floating / heavy-tower route; it would NOT be about the banked derived objects and would
   drape physics words over an imported result. My target is genuinely different: the dichotomy
   falls out of the char-0 involution on the banked `ImO`, no external tower.

5. HONESTY: the honest grade is ASSEMBLY / theorem-of-premises — the dichotomy is a theorem GIVEN
   the banked carrier `ImO` and the derived ℚ. I am NOT overclaiming a from-nothing spin-statistics
   theorem; I state exactly what is proved: exchange on the two-quantum space of the banked carrier
   is a char-0 involution, hence exactly two ±1 sectors, and the antisymmetric sector excludes the
   diagonal. The "half-integer spin ↔ antisymmetric" identification is prose-only / NOT claimed as a
   Lean theorem here (would need the banked so(7) spin structure tie — flagged, childed to G2 or a
   dedicated node). The +1/−1 = Bose/Fermi labels are removable costume.

## PLAN (all validated in workbench probes — probe.lean EXIT 0, ProbeExch2/ProbeSub EXIT 0)
Module `Phys/Algebra/ExchangeStatisticsDichotomy.lean`, ns `Phys.Algebra.ExchStat`, over the banked
derived ℚ / `ImO`:
- `Two := ImO ⊗[ℚ] ImO`; `exchange : Module.End ℚ Two` = the flip (TensorProduct.comm).
- `exchange_involutive : exchange * exchange = 1` — FORCED order-2 (the fold's orderlessness).
- `finrank_Two = 49` (7·7) and `Nontrivial Two` — non-vacuity anchor.
- `boseProj := ½(1+exchange)`, `fermiProj := ½(1−exchange)`.
- `bose_add_fermi : boseProj + fermiProj = 1` (complete decomposition — no third class).
- `boseProj_idem`, (fermiProj idem), `bose_mul_fermi = 0` (orthogonal), `bose_ne_fermi`
  (genuinely two DISTINCT sectors — the dichotomy is non-trivial).
- `exchange_eigen_dichotomy : exchange x = λ•x → x≠0 → λ=1 ∨ λ=−1` — ★ THE DICHOTOMY (only two
  statistics classes, no parastatistics).
- `exchange_boseProj = boseProj`, `exchange_fermiProj = −fermiProj` (the ±1 eigen-characterization).
- `pauli_exclusion : fermiProj (v ⊗ₜ v) = 0` — ★ Pauli (no two identical fermions), a theorem.
- `bose_identical : boseProj (v ⊗ₜ v) = v ⊗ₜ v` (the identical pair is purely symmetric).
- capstone `exchange_statistics_dichotomy_structure` bundling: involutive ∧ bose+fermi=1 ∧ orthog
  ∧ distinct ∧ (∀λ eigen → ±1) ∧ pauli.

## COSTUME C398 (W8 non-vacuity, next Cid after C397; bites 1=398)
Flag `iFlag := 1` = "the two ±1 sectors are GENUINELY DISTINCT (the exchange operator is nonzero,
so Bose ≠ Fermi — the dichotomy is not vacuous)". Tied to banked `bose_ne_fermi`/`exchange_ne_zero`.
BOGUS claim `min 398 iFlag = 398` reduces to `1 = 398`, kernel cannot close → BITES. A "the two
statistics classes coincide / there is really only one sector" mis-reading fails.

## GUARDS
- Derived ℚ + banked `ImO` only; Mathlib TensorProduct/finrank as pure MACHINERY on the derived
  carrier. NO Mathlib number-system as content. NO empirical number.
- Foundations-only ⊆ {propext, Classical.choice, Quot.sound}; no sorry/axiom/native_decide/
  maxHeartbeats-raise.
- physics-words-removable: every theorem statement pure over `ImO`/ℚ/tensor.
- KILL/cost budget: all obligations are small algebraic rewrites (probes compiled in seconds each);
  no heavy tactic. If any single obligation exceeds a bounded probe, decompose (W9). None did.

## ONE SUCCESSOR: G1→G2 (universality / critical exponents, the marquee cross-tie), per SEED §2.
