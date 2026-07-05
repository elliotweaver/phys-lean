N305 — THE ℤ₃ SELF-BLIND GENERATION CYCLE AND ITS FORCED BORN-WEIGHT SPLIT (seed targets T1+T2)

SEEDED NODE (owner-authorized flavor route, docs/SEED_FLAVOR_SELF_BLINDNESS.md; SELECT S1–S4 in
comments 247/249; discipline UNCHANGED — every value a DERIVED landing, no empirical inputs).

TARGET (T1 + T2, together — the first beat of the self-blindness route).
Over the derived arena H₃(O ℚ) = Matrix (Fin 3)(Fin 3)(O ℚ) and its three CAP-FORCED primitive
idempotents `Eidem i` (N300, `sum_Eidem : E₀+E₁+E₂=1`), with the S₃ Jordan-automorphism action
`pconj σ (Eidem i) = Eidem (σ.symm i)` (N300):

 T1 — THE ℤ₃ GENERATION CYCLE (structural, NO numbers). The fold's founding move (self-look-back →
     the MISS) reappears at the generation level: a generation is a probe blind to itself.
   · `gcyc := finRotate 3` — the derived generation cycle; order 3 (`gcyc³=1`, `gcyc≠1`),
     FIXED-POINT-FREE (`∀i, gcyc i ≠ i` — self-blindness: the cycle sees no generation as itself).
   · `Eidem` INJECTIVE (the three idempotents are genuinely distinct generation-carriers).
   · The cycle acts on the idempotents: `pconj gcyc (Eidem i) = Eidem (gcyc.symm i)` (from N300).
   · `gen_no_fixed : pconj gcyc (Eidem i) ≠ Eidem i` — the cycle fixes NO generation (self-blind).
   · `unity_fixed : pconj gcyc 1 = 1` — the democratic/Unity gather IS cycle-invariant (the DC mode).
   · `see_others : E(gcyc i) + E(gcyc(gcyc i)) = 1 − Eidem i` — GROUNDING: the self-blind "see the
     other two" sum equals the complement of self on the banked idempotents (ties the seeing operator
     to the banked generation objects; NOT free-floating).

 T2 — THE SELF-BLIND SEEING OPERATOR FORCES THE BORN WEIGHTS (the first DERIVED value). The
     coefficient-space seeing operator on the 3 generations (each sees the n−1=2 others, is blind to
     itself) is `seeMat = Jall − 1` over ℚ (diagonal 0 = self-blindness). Its spectral projectors:
   · `see_diag_zero : seeMat i i = 0` and `see_trace_zero : trace seeMat = 0` (self-blindness).
   · Democratic/Unity projector `Pdem = (1/3)Jall` and "others" projector `Poth = 1 − (1/3)Jall`:
     idempotent, orthogonal, `Pdem + Poth = 1`; `seeMat·Pdem = 2•Pdem`, `seeMat·Poth = (−1)•Poth`
     (eigenvalues +2 on Unity, −1 on others — the self-sees-two-others reading).
   · `tr Pdem = 1`, `tr Poth = 2` → normalized Born weights `1/3` (Unity) and `2/3` (others).
   · ★★★ THE FORCED VALUE (T2 headline, DERIVED not asserted): the normalized weight killing the
     self-view balance is UNIQUE — `w0+w1=1 ∧ w0·2+w1·(−1)=0 ⟹ w1 = 2/3 ∧ w0 = 1/3` (a `linarith`
     landing). And the general-n form `w0·(n−1)+w1·(−1)=0 ⟹ w1 = (n−1)/n`. So the self-seen "other"
     fraction `T = (n−1)/n = 2/3` for n=3 is FORCED by (self-blindness: balance=0) + (normalization:
     Σw=1) — a Born counting fact of self-blindness. NO empirical number; the value FALLS OUT.

 W8 NON-VACUITY: `gen_no_fixed` (the cycle genuinely moves each idempotent — nonzero motion) and the
     weight `2/3 ≠ 1/3` (the split is genuinely nontrivial, not a degenerate collapse). Costume C334
     bites at a WRONG born fraction / a claim the cycle fixes a generation.

 CAPSTONE `generation_cycle_born_split_structure` carries `jordan_fails_H4` (N5) in the TYPE (the cap
     forcing exactly 3) to keep it grounded on the octonion-specific arena, NOT carrier-agnostic.

DISCIPLINE / GUARDS (seed §4). G1: the 2/3 and 1/3 are PROVED uniqueness landings, never premises.
G2: no measured mass/coupling anywhere. G4: no cycle-form ansatz here (that is T3, downstream) — this
node derives only the cycle STRUCTURE (T1) and the Born-COUNTING split (T2), both forced. G5:
physics-words-removable (delete generation/mass/Koide/flavor/Born — pure statement about the ℤ₃
Jordan-automorphism cycle on the cap-forced idempotents + the unique normalized spectral split of the
diagonal-zero symmetric operator over ℚ). G6: foundations-only ⊆ {propext,Classical.choice,Quot.sound}.
G7 (ONE LAW): if a link fights, reframe/block — never posit.

WHAT "DONE" REQUIRES. New leaf module Phys/Algebra/OctonionJordanGenerationCycleBornSplit.lean, ns
Phys.Algebra.HJ; all decls foundations-only; the ℤ₃ cycle facts + the projector algebra + the forced
2/3 uniqueness + non-vacuity + capstone. Costume C334 that a WRONG born fraction / cycle-fixes-a-
generation FAILS. Gate-fast D0–D6 GREEN. STANDARD met (unbroken/complete/words-removable/not-free-
floating: T1 types cite banked Eidem/pconj/gcyc on Matrix(Fin 3)(Fin 3)(O ℚ); T2 the ℚ seeMat split
is the coefficient-space shadow, grounded to the idempotents via `see_others`).

DEPENDENCY. N300 (Eidem, sum_Eidem, pconj_Eidem, pconj) + N5 (jordan_fails_H4). PURELY ALGEBRAIC over
ℚ / Fin 3 combinatorics; no octonion coordinate blowup (idempotents are 0/1 diagonal; seeMat over ℚ).

COST BUDGET / KILL (W9). All three de-risk probes built clean & light (ProbeN305 7.3s, ProbeN305b 22s,
ProbeN305c 32s), NO native_decide, NO coordinate-decide, NO maxHeartbeats raise. KILL: if the
production olean exceeds ~90s or any single obligation needs a maxHeartbeats raise, STOP and
measure/decompose (it must not) — the whole node is Fin-3/ℚ small algebra, so a blow-up means a wrong
framing. Expected olean ≤ 40s.

ONE-SUCCESSOR RAIL. The single successor is a DIRECTED child toward the next seed target T3 (the cycle
FORM of the amplitudes — the ℤ₃-Fourier structure Unity-DC + one cycle mode, with the √2 from the T2
self=other balance), childed on the tail. Run the pre-complete fork check (exactly 1 non-terminal
successor). NOT a generic SELECTION ticket (the seed's T1→T8 ordering is the route).

max_retries=25, --max-runtime 120m, --workspace dir:/Users/elliotweaver/phys-lean, assignee phys-novelty.
