# N212 PREREG — frozen GO/NO-GO + KILL before compute

## FIRST ACT (required): ROADMAP §N211-superseded frontier re-read + front specification

The frontier names the NAMED ASCENT for the 11×-deferred hypercharge front (a structural
ceiling, NOT a menu item): the rank-2 `g₂` as currently carried has NO room for an independent
`Y` direction that is FORCED rather than posited. The frontier's strongest candidate (front a):
the exceptional Jordan algebra `J₃(O)` — the home where electric charge / hypercharge becomes a
FORCED EIGENVALUE rather than a posited convention — declared as a possibly-multi-node staircase.

## WHAT IS ALREADY BANKED on J₃(O) (W4.5 — grep verified, do NOT re-pin)

N5 banks the FULL Hermitian Jordan tower (`Phys/Algebra/JordanTower.lean` +
`Phys/Algebra/HermitianJordan/*`):
  - the CARRIER `Hm d0 d1 d2 a b c` (general Hermitian 3×3 over `O ℚ`), the zero-diag core
    `Xz a b c`, the real diagonal `Dg e0 e1 e2 = diagonal (ocR ·)`, the unit diagonals
    `Du0/Du1/Du2 = diagonal ![1,0,0]/![0,1,0]/![0,0,1]`;
  - the symmetric (Jordan) bracket `jb A B = A*B + B*A` and the defect `jdef`;
  - the order-3 Jordan identity `jdef_H3` / `jordan_cap_pinned_at_three` and the n≥4 cap
    `jordan_fails_H4`; the one-cause link `jordan_cap_iff_nonassoc`;
  - the ℚ-module action `qMod` (`r • x = ocR r * x`, `qsmul_def`), transport levers
    `tr_l : ocR r * x = r•x`, `tr_r : x * ocR r = r•x`, `tr_sl`, `tr_sr`;
  - `ocR` centrality/nuclearity (`ocR_comm`, `ocR_assocL/M/R`, `ocR_star`);
  - `Dg_eq_smul : Dg d0 d1 d2 = d0•Du0 + d1•Du1 + d2•Du2`;
  - `jb_add_left`, `jb_add_right`, `jb_smul_left`, `jb_smul_right` (Linear.lean / PieceBfinal.lean).

⟹ The carrier + product + commutativity + a non-vacuity witness would be a **RE-PIN of N5**
(W8 — REJECT). The smallest GENUINELY-NEW forward step on the named ascent is the NEXT structure:
the **Peirce / weight grading** of the diagonal idempotent frame — which is NOT banked anywhere
(grep `peirce|idempotent|frame_|weight_grad|eigenvalue|Cartan|jordan_trace` in Phys/HermitianJordan
returns NOTHING). This is precisely "the forced eigenvalue where charge lives".

## THE TARGET (GENUINELY NEW): THE FORCED WEIGHT GRADING OF THE DIAGONAL CARTAN FRAME ON J₃(O)

The three diagonal unit idempotents `E0=Du0, E1=Du1, E2=Du2` form a complete orthogonal frame
(resolution of identity `E0+E1+E2 = 1`). The off-diagonal `(0,1)`-slot `Xz a 0 0` (the Hermitian
matrix with octonion `a` at `(0,1)`, `star a` at `(1,0)`, else 0) is a SIMULTANEOUS EIGENVECTOR
of the frame's Jordan-multiplication operators `A ↦ jb E_k A`:
  - `jb E0 (Xz a 0 0) = Xz a 0 0`   (unscaled eigenvalue 1 — slot in E0's support)
  - `jb E1 (Xz a 0 0) = Xz a 0 0`   (unscaled eigenvalue 1 — slot in E1's support)
  - `jb E2 (Xz a 0 0) = 0`          (eigenvalue 0 — slot ANNIHILATED by E2, NOT in its support)

⭐ THE HEADLINE — the FORCED WEIGHT (the linear functional charge descends from):
  `jb (Dg t0 t1 t2) (Xz a 0 0) = (t0 + t1) • (Xz a 0 0)`
The `(0,1)`-slot carries weight **`t0 + t1`** under the diagonal Cartan `diag(t0,t1,t2)` — a
FORCED eigenvalue (a linear functional of the Cartan), NOT a posited convention. The three
off-diagonal slots carry weights `(t0+t1), (t1+t2), (t0+t2)` — the root/weight pattern in which
electric charge becomes a forced eigenvalue. THIS is the "room for an independent direction" the
rank-2 `g₂` lacked: the rank-2 diagonal Cartan of `J₃(O)` supplies a 2-parameter family of forced
weights (the trace-zero hyperplane is the genuine charge space).

## GO / NO-GO

GO iff ALL hold (frozen):
  1. The three unit-eigenvalue lemmas `jb E_k (Xz a 0 0) = (Xz a 0 0 | 0)` close cheaply
     (matrix-entry computation, `Matrix.ext` + `fin_cases` + `simp`, NO octonion-coordinate ring).
  2. The headline `jb (Dg t0 t1 t2)(Xz a 0 0) = (t0+t1)•(Xz a 0 0)` closes STRUCTURALLY through
     the banked `Dg_eq_smul` + `jb_add_left` + `jb_smul_left` + the three unit lemmas
     (NO coordinate ring — the W1 reframe, mirroring N211's gForm_comp dissolution).
  3. Frame facts (`frame_sum : E0+E1+E2 = 1`, `jb_Du0_Du0 = 2•E0` idempotent, `jb_Du0_Du1 = 0`
     orthogonality) close cheaply — they give the grading its structural meaning (a genuine frame).
  4. W8 non-vacuity WITH TEETH: a concrete coordinate witness whose value is the genuine weight
     `t0+t1` and is distinguishable from wrong functionals; the E2-annihilation contrast.
  5. Foundations-only `[propext, Classical.choice, Quot.sound]`, all names collision-free.

NO-GO / REJECT (look WIDER) iff:
  - any obligation needs an inflated `maxHeartbeats` / monolithic coordinate ring (W9 — a slot
    computation must be a clean diagonal-mult `simp`, NOT a degree-4 brute);
  - the weight grading turns out to be a mechanical re-statement of `Dg_eq_smul` with no new
    relational content (W8) — GUARD: the eigenvalue/annihilation pattern (E2 kills the slot, E0/E1
    don't) is the genuine Peirce content, NOT present in `Dg_eq_smul`;
  - it is a re-pin of N5's carrier/product/cap.

## KILL (instrument budget, W9)

Per obligation: 120 s wall / 400000 heartbeats. If a slot lemma or the headline exceeds it,
STOP — it means a coordinate ring crept in; reframe through the banked structural levers
(`Dg_eq_smul`/`jb_smul_left`/`jb_add_left`) instead. Never inflate the ceiling and wait.

## NON-VACUITY / COSTUME (C244)

Witness: `((jb (Dg 2 3 0) (Xz (1:O ℚ) 0 0)) 0 1).re.re.re = 5` — the `(0,1)`-slot weight under
`diag(2,3,0)` is genuinely `2+3 = 5` (distinguishes the SUM functional from product 6 / t0=2 /
t1=3 / max=3). Costume C244 claims `= 212` (wrong reading of the weight), forcing `5 = 212` in ℚ.
ERE `= 212` — fresh, distinct from the banked battery (… C242 =210, C243 =211).

## PHYSICS-WORDS-REMOVABLE

Delete 'Jordan / Peirce / weight / charge / hypercharge / Cartan / idempotent / frame / eigenvalue
/ root / J₃(O) / exceptional': what remains is — over the derived field ℚ and the Cayley–Dickson
double `O ℚ = CD (H ℚ)`, for the symmetric bracket `jb A B = A·B + B·A` on `Matrix (Fin 3) (Fin 3)
(O ℚ)`, the diagonal units `diagonal ![1,0,0]` etc. satisfy `jb (diagonal ![1,0,0]) (Xz a 0 0) =
Xz a 0 0`, `jb (diagonal ![0,0,1]) (Xz a 0 0) = 0`, and `jb (Dg t0 t1 t2)(Xz a 0 0) = (t0+t1) •
(Xz a 0 0)`; pure matrix algebra over the derived field. No theorem statement needs a physics word.

## DECISION: GO (front a — the named-ascent forward step, the forced weight grading on J₃(O)).
