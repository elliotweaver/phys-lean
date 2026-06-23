# N13 PREREG — THE ℝ FIELD: cone ring laws → CommRing Cut → inverse → Field + IsStrictOrderedRing
*Frozen BEFORE compute. THE ONE LAW: if it fights, the framing is wrong, not the theory —
reframe through the positive cone (Born = self-overlap = positivity), do NOT inflate
maxHeartbeats, do NOT weaken, do NOT bridge.*

## TARGET
Make the banked `ContinuumQ.Cut` (over the DERIVED ℚ `Phys.Foundation.Q`) a LINEARLY ORDERED
FIELD with the lub property: `[CommRing Cut]` → `[Field Cut]` + `[IsStrictOrderedRing Cut]`,
with the banked `completion_coherence_closed` supplying the lub. NO posited ℝ, NO
`import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to GET it.

## BANKED API (verified W6 — inherited tree builds clean, ~6s cached)
- N10 `ContinuumDerived` (ns `ContinuumQ`): `Cut`, `Cut.le/le_def/lt_def/ext'/le_total`,
  `PartialOrder Cut`, `Qcut a = {q|q<a}`, `completion_coherence_closed`, `sqrt2`.
- N11 `ContinuumField`: `Add Cut`/`add_S`, `Zero=Qcut 0`/`zero_S`, `Neg Cut`/`neg_S`, `approx`
  (Archimedean lever), `add_neg_self`, `AddCommGroup Cut`, `LinearOrder Cut`,
  `IsOrderedAddMonoid Cut`, `Qcut_add`/`Qcut_strictMono`, `zero_lt_sqrt2`, `Q.instArchimedean`.
- N12 `ContinuumFieldMul`: `mulNonnegS`/`mulNonnegGather`/`pmul`/`pmul_S`/`pmul_comm`;
  `instMul` (SIGN EXTENSION via `if 0≤x then (if 0≤y then pmul x y else -(pmul x (-y))) else …`),
  `instOne = Qcut 1`, `mul_of_nonneg` (0≤x,0≤y ⟹ x*y=pmul x y); `sqrt2_S_nonneg`,
  `sq_dense`, `heron`/`heron_inv`/`heron_gap`; CAPSTONE `pmul_sqrt2_sqrt2`/`sqrt2_mul_sqrt2`.

## THE ROUTE (reframe-through-the-cone FIRST — THE ONE LAW)
The positive cone is where Born=positivity lives; pmul is the TRUE product only on the cone.
The sign extension reduces every product to the cone via the banked negation + LinearOrder.
So: prove the ring laws ON THE CONE (genuine math content), then lift to all of `Cut` via two
SIGN-HOMOMORPHISM lemmas `neg_mul`/`mul_neg` (which collapse the 8-case sign explosion to a
few rewrites + the cone lemma). Brute coordinate-bashing the sign cases is a SMELL (W9.4).

PHASE 1 (cheap cone algebra):
  - `pmul_zero : pmul x 0 = 0`, `zero_pmul : pmul 0 x = 0` (0=Qcut 0; existential collapses)
  - `pmul_nonneg : 0≤x → 0≤y → 0 ≤ pmul x y` (lets the sign-`if`s resolve)
  - `pmul_one_cone : 0≤x → pmul x 1 = x` (1=Qcut 1; nomax up-step supplies the decomposition,
    mirror N11 `zero_add'`)
PHASE 2 (the genuine hard content — attack THROUGH the cone, never coordinate-bash):
  - `pmul_assoc_cone` (recover a4 dir-1 via nlinarith; dir-2 symmetric)
  - `pmul_distrib_cone : 0≤x→0≤y→0≤z → pmul x (y+z) = pmul x y + pmul x z` (USE banked add_S +
    mulNonnegS; the fiddliest classically — the cone keeps it tractable)
PHASE 3 (sign extension — lift cone laws to all Cut):
  - `mul_zero`/`zero_mul`, `mul_one`/`one_mul`
  - `neg_mul : (-x)*y = -(x*y)`, `mul_neg : x*(-y) = -(x*y)` (by_cases on 0≤x,0≤y,0≤-x,0≤-y;
    edge x=0 closes via mul_zero/pmul_zero)
  - `mul_comm` (sign-extended from pmul_comm), `mul_assoc` (8 sign cases reduced via
    neg_mul/mul_neg/pmul_nonneg to pmul_assoc_cone), `left_distrib`/`right_distrib`
    (reduced to pmul_distrib_cone)
PHASE 4: assemble `CommRing Cut` (banked addCommGroup + the above). ← FIRST BANKABLE INCREMENT.
PHASE 5 (if turns remain; else child N14): the INVERSE of a positive cut
  `(x⁻¹).S q := q ≤ 0 ∨ ∃ r, ¬x.S r ∧ 0 < r ∧ q < 1/r` (reflect-and-reciprocate, the
  multiplicative SWAP one level up, mirroring N9's q/p swap); `mul_inv_cancel` for positive cuts
  (the approx/Archimedean eternal-approach lever again); sign-extend ⟹ `Field Cut`. With
  `mul_pos` (positive-cone product positivity) ⟹ `IsStrictOrderedRing Cut`.

## GO / NO-GO
GO when: a foundations-only bankable ordered-field structure on `Cut` over the derived ℚ lands —
at MINIMUM `CommRing Cut`, ideally `[Field Cut][LinearOrder Cut][IsStrictOrderedRing Cut]` — with
`#print axioms ⊆ {propext, Classical.choice, Quot.sound}`, a costume that BITES, gate D0–D6 green,
LEDGER+ROADMAP updated. OR an honest W3 decomposition: CommRing Cut banked + commit, inverse/Field
childed onto the chain tail, completed as "decomposed".
NO-GO / KILL: see below. Failure / silent scope-reduction / bridge / posited-or-imported ℝ are
NOT on the menu.

## KILL BUDGET (W9 — compile cost; N11/N12 showed this construction is LIGHT ~6–9s/file)
- Per-obligation KILL: **90s**. Any single lemma/instance exceeding 90s to elaborate = INSTRUMENT
  failure → STOP, measure the smallest sub-obligation, decompose; do NOT inflate maxHeartbeats.
- ≥2 runs of a tactic ending at full budget banking nothing = W9 wall → reframe through the cone.
- If the cone distributive law "fights" → the cut-shape / positivity framing is wrong, NOT the
  theory (THE ONE LAW). Return to the trunk's positivity; do NOT coordinate-bash.
- BANK-AS-YOU-GO (W9.8): the instant a lemma compiles clean → production file + commit. CommRing
  is the natural freeze point. Reserve last ~400s of the turn budget for the bank ceremony + W3
  decomposition (commit safe part, child remainder, link tail, complete) — NEVER run out mid-task.

## ANTI-CIRCLING LOG (routes attempted + outcome)
- (start) inherited tree verified clean W6 (~6s cached). Scratch a3/a4 recovered.
- PHASE 1+2 cone lemmas (nonneg_iff, exists_pos_mem, zero_le_pmul, pmul_zero/zero_pmul,
  pmul_one_cone, pmul_assoc_cone, pmul_distrib_cone) ELABORATE CLEAN, ~7s
  (workbench/N13-real-field/scratch/ring_cone.lean). Distrib done via max-with-positive-witness
  (FORWARD) + max-of-x-approximants (REVERSE) — NO coordinate bash. KILL budget untouched.
- PHASE 3 sign extension: route = four `mul_eq` lemmas (mul_nn/np/pn/nnn) absorbing the x=0
  boundary via pmul_zero/zero_pmul, then neg_mul/mul_neg (homomorphism), then comm/assoc(8
  cases→pmul_assoc_cone)/distrib(reduce to pmul_distrib_cone, WLOG x≥0 via neg_mul). NO maxHeartbeats.
- PHASE 4 `CommRing Cut` BANKED (commit 0bf0e0e, `ContinuumFieldRing.lean`). Run 108 timed out on
  ITERATION budget (90/90 agent turns), NOT a compile wall — it had ALSO written the full PHASE-5
  inverse→Field→IsStrictOrderedRing derivation into scratch/inv_cancel.lean (0 sorry) but ran out of
  turns before the bank ceremony. ⟹ START-OF-RUN RECOVERY (W9): run 109's first production act.
- PHASE 5 (run 109) RECOVERED scratch/inv_cancel.lean → `Phys/Foundation/ContinuumFieldInverse.lean`.
  W9 "0 sorry ≠ proven" check: the file ELABORATED with ONE instance-synthesis gap — `of_mul_pos`
  needs `[ZeroLEOneClass Cut]` + `[Nontrivial Cut]`; added `instZeroLEOneClass`/`instNontrivial`
  (instance forms of the banked `zero_le_one'`/`zero_ne_one'`). Then ELABORATES CLEAN (~6s, well under
  the 90s KILL). pinvS/pinv/pinvGather, mul_approx (C6 ratio form), pmul_pinv_cancel, isField/field,
  mul_pos, isStrictOrderedRing, sqrt2_inv_mul_sqrt2 — all `[propext, Classical.choice, Quot.sound]`.
  Costume C32 (inverse cancellation `√2·√2⁻¹` contains 1 → false core `1<1`) bites. Gate D0–D6 green,
  32/32 costumes, 375 theorems audited. ℝ rung = LINEARLY ORDERED FIELD WITH LUB over the derived ℚ.
  GO criterion MET (full `[Field Cut][LinearOrder Cut][IsStrictOrderedRing Cut]`). NO W9 pressure
  anywhere; the construction stayed LIGHT exactly as N11/N12 predicted.
