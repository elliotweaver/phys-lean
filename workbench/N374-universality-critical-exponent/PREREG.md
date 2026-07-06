# N374 PREREG — arc-G G2: UNIVERSALITY / CRITICAL EXPONENT (the marquee CROSS-TIE joint J-G2)

## SELECT (fresh worker, NODE_SELECTION run in full)

S1 ARC SYNTHESIS. Arc G (emergent/statistical) opened at N373 (arc-G G1): the Bose/Fermi
dichotomy + Pauli fell out of the char-0 involution on the banked ImO two-quantum space. The
directed successor is arc-G G2 (SEED_EMERGENT §G2): the framework's critical exponent at the
closure fixed point — the marquee cross-tie. Banked launch platform: the 42 interaction channels
of the terminal octonion algebra (imChannelCount(finrank ℚ ImO)=42, N314), the uniform per-channel
Born weight couplingWeight=1/42 with completeness Σ=1 (born_isometry_completeness, N315), α*=1/42
(N316), the scale-tower numerator 84π=2π/α* and the eigenvalue reading λ_n=−n/(84π) (N329/N334).

S2 THEORY-NATIVE (GOAL + REFRAMING). GOAL lens: the fold's channel democracy (self-blindness gives
no way to distinguish channels ⟹ the uniform weight, N315) is a permutation symmetry on the 42
channels. At the closure fixed point the linearized totalization ("what the whole reads back from
its parts") is an operator on the channel space that (a) respects the democracy (equivariant), (b)
consumes only the total weight — the completeness/sum-reading engine that forced Σ channel α = 1,
and (c) is a nonzero idempotent (a projector — the fixed point of totalization). REFRAMING lens:
the field computes critical exponents with an RG-flow machinery tower. Here the exponent is READ
OFF the fold's own measure: equivariance + sum-reading + idempotence pins the operator UNIQUELY to
the rank-1 totalization projector J/42, whose per-channel weight IS the banked α*=1/42. The wall
(compute a critical exponent) dissolves into: it equals the already-banked channel share.

S3 RECONCILE. Arc target (G2, universality) ALIGNS with the theory-native beat. Proceed.

S4 ANTI-BULLSHIT GATE (in writing):
1. FOLD-CAUSAL: fold looks back → cannot distinguish its channels (self-blindness) → the 42
   channels carry ONE uniform weight (democracy = permutation symmetry) → the linearized
   totalization at the fixed point commutes with that symmetry (equivariant), consumes only the
   total (sum-reading — the SAME completeness that gave Σα=1), and is a projector (idempotent
   fixed point) → those three conditions force it to be J/42 uniquely → its per-channel weight is
   1/42 = the banked α*. Each arrow forced; no "the RG theory says we now need…".
2. DISSOLUTION: STANDARD version = derive a critical exponent by solving an RG fixed-point flow and
   linearizing (a heavy analytic tower). What the theory DOES: the exponent is the entry of the
   unique equivariant sum-reading projector = the banked channel share, a one-line reading of a
   banked measure. Genuine dissolution.
3. GOAL-WORDS-REMOVABLE: delete "critical/universality/exponent/RG/totalization" — a genuine
   theory-native reason survives: "the unique permutation-equivariant, sum-reading, nonzero
   idempotent operator on the banked 42-channel space is (1/42)·(all-ones), whose entry is the
   banked couplingWeight." Pure linear algebra + the banked channel count/weight.
4. STANDARD-MATH TEMPTATION a saturated worker would pick: "state the abstract RG eigenvalue
   spectrum λ_n=−n/(84π) as a generic operator-ladder theorem" (free-floating over an arbitrary
   space, physics-words-removable trivially because it has none). REJECTED — the marquee is stated
   ABOUT the banked objects (imChannelCount(finrank ℚ ImO), couplingWeight, alphaStar) and the
   84π/λ_n reading is carried as the mechanism-grade prose flag + the exact rational numerator
   identity 84 = 2/α* = 2·(channel count), a THEOREM about the banked count.
5. HONESTY: the exponent 1/42 is NOT asserted — it FALLS OUT of the rank-1 forcing
   (idempotent + sum-reading kills the identity part, nonzero fixes the scale). If it did not, the
   node would block; it does, cleanly. The λ_n=−n/(84π) full ladder over Cut is a bigger build
   (flagged prose + the numerator theorem), NOT claimed as a Lean eigenvalue theorem here.

## TARGET (the marquee J-G2 universality joint)
On the banked channel space (dimension = imChannelCount(finrank ℚ ImO) = 42):
- `Equivariant M := ∀ σ i j, M (σ i)(σ j) = M i j` (channel democracy).
- `SumReading M := ∀ v w, Σv = Σw → M.mulVec v = M.mulVec w` (completeness / totalization engine).
- `chanTot N := all-ones matrix`; `chanProj N := (1/N)•chanTot N` (the totalization projector).
- Commutant: Equivariant ⟹ M = (d−o)•1 + o•chanTot (d=diag, o=offdiag const).  [probed ✓]
- SumReading kills the identity part: SumReading(c•1+e•J) ⟹ c=0.  [probed ✓]
- Idempotent + nonzero forces the scale: chanProj idempotent; (1/N)²·N=1/N.  [probed ✓ cand_sq]
- UNIQUENESS: Equivariant ∧ SumReading ∧ idempotent ∧ ≠0 ⟹ M = chanProj N.
- ★ MARQUEE: at banked N, chanProj entry = 1/42 = couplingWeight = alphaStar (critical exponent =
  channel share). Cross-tie theorem: (84:ℚ) = 2/alphaStar = 2·(imChannelCount(finrank ℚ ImO)).
- Prose flag (mechanism-grade): the full relevant-direction spectrum λ_n=−n/(84π) is the same 84π
  scale-tower numerator (arc B, N329/N334) — one number, two regimes.

GRADE: theorem (b=1/42 falls out cleanly + the exact 84=2/α* numerator identity); the λ_n ladder
over Cut = mechanism-grade prose flag.

## W8 COSTUME (C399): a WRONG claim must fail.
- The critical exponent is NOT the wrong 1/49 (diagonal-not-dropped count): chanProj entry ≠ 1/49.
- The identity IS sum-reading would be false (one_not_sumReading bites): the identity part is
  genuinely killed, not vacuously.
- 84 ≠ 2·49 (the wrong channel count).

## GUARDS: foundations-only ⊆ {propext,Classical.choice,Quot.sound}; ℚ ground / banked objects,
no Mathlib-ℝ as content (Matrix/Fin/Perm pure machinery); words-removable; NOT free-floating
(marquee type names imChannelCount(finrank ℚ ImO), couplingWeight, alphaStar). Namespace
Phys.Algebra.Universality; unique names (chanTot/chanProj/Equivariant/SumReading — Jall collides,
avoided). ONE commit (new module). Import into Phys.lean + Audits/AxiomAudit.lean.
