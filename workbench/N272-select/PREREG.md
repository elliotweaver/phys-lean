# N272 — PREREGISTRATION (the arena's Jordan product cyclically weaves the three cap-forced generations)

## TARGET (locked, SELECT S1–S4 in the ticket thread, comments 143–146)
THE MAXIMAL MATTER ARENA'S OWN JORDAN PRODUCT COUPLES THE THREE CAP-FORCED GENERATIONS CYCLICALLY.

The maximal Hermitian octonionic Jordan arena `J₃(O ℚ)` carries EXACTLY 3 position-disjoint
matter-carrier copies (N267: `slotA`/`slotB`/`slotC` at (0,1)/(0,2)/(1,2)); the derived gauge acts
on them IDENTICALLY and is family-symmetry-BLIND (N268 `jAct`, per-slot/diagonal). THIS node banks
the ONLY derived structure that is NOT blind: the arena's OWN symmetric (Jordan) product `jb` weaves
two DISTINCT generations into the THIRD, carried by an octonion product of their carriers.

## THE DELIVERABLES (production file: Phys/Algebra/OctonionJordanGenerationCoupling.lean, ns Phys.Algebra.HJ)

(A) THE CYCLIC COUPLING LAWS (measured clean, workbench/N272-select/probe_intercopy.lean, EXIT 0):
    jb (slotA a) (slotB b) = slotC (star a * b)     -- gen_A ∘ gen_B → gen_C
    jb (slotB b) (slotC c) = slotA (b * star c)     -- gen_B ∘ gen_C → gen_A
    jb (slotC c) (slotA a) = slotB (a * c)          -- gen_C ∘ gen_A → gen_B
  Route: `Matrix.ext; fin_cases i <;> fin_cases j <;> simp [jb, slotA, slotB, slotC, Xz, Matrix.mul_apply, Matrix.add_apply]`.

(B) W8 NON-VACUITY + DIVISION-VALUEDNESS: the coupling into the third copy is NONZERO for nonzero
  inputs — via banked `octMul_ne_zero` / no-zero-divisors (N265). A genuine coupling into a DIFFERENT
  copy (not self, not 0). Costume C303 should bite here (a wrong value fails to compile).

(C) THE MOAT TIE (the octonion anchor — the load-bearing non-free-floating content):
  the reQ trace-contraction of the same-slot woven pair reproduces the diagonal cubic-norm cross-term
    reQ (Matrix.trace (jb (slotC x) (slotC c))) = 2 * reQ (x * star c)
  (trace picks the two nonzero diagonal entries x·star c, star x·c; reQ_mul_comm + reQ_star collapse both);
  and the FULL TRIANGLE contraction ties to the banked gauge-invariant cubic-norm cross-term
    2·reQ((a·c)·star b)  (jN, N215; jN_aut_invariant, N269)
  via octonion trace-associativity reQ_mul_assoc3 (N210, FALSE at sedenions).
  ⚠ INSTRUMENT NOTE (W9): the `!![...]` matrix-entry extraction did not fire under a plain `simp only`
    with cons_val lemmas in the probe — use the banked frame-weight idiom (`Matrix.ext; fin_cases` to
    expose entries, or the entry lemmas the banked HermitianJordan files use). NOT a math wall.

(D) THE CAPSTONE carries the octonion joint (NOT the bare law): `jordan_cap_pinned_at_three`
  (exactly-3, cap-forced) ∧ the coupling laws ∧ the moat tie (C) ∧ non-vacuity (B). TYPE mentions the
  banked `slotA/B/C`, `jb`, `O ℚ`, `jN` cross-term — NOT carrier-agnostic.

## SCOPE / HONESTY (FREE-FLOATING RAIL)
Banks (A)+(B)+(C)+(D) ONLY. The bare coupling law holds for any *-ring 3×3 matrix units → DEMOTED
to a supporting ingredient (exactly like N268's generic jAct_mul); the HEADLINE is the octonion joint
(C)+(D). NOVELTY claimed ONLY for: the forced inter-generation coupling IS the arena's own product
(the field's separately-posited Yukawa/mixing sector dissolved into existing structure) + the moat
anchor. NEVER for "= CKM/PMNS / physical Yukawa / mass ratios" (removable prose; ★5 stays OPEN).
If (C)'s full-triangle form exceeds a bounded budget on the entry extraction: bank (A)+(B)+the
same-slot tie + child the full-triangle tie (bank-as-you-go, W9.8). No new axiom, no external number.

## FALSIFIERS (W8)
- costume C303 bites (a wrong coupling value / wrong sign fails to compile);
- the coupling is genuinely CROSS-slot (lands in a DIFFERENT copy) and NONZERO — not self, not 0;
- moat tie: the scalar contraction is the octonion cross-term, invoking N210 (falsifies free-floating).

## STARS
Advances ★5 (mass/mixing texture — the forced inter-generation coupling, the structure a texture lives
on) and ★4 (the structure of the three copies, deepening N267/N268). Serves the ★2 named ascent
(the only family-symmetry-non-blind structure). Does NOT claim ★5's texture values or ★2's angle.

## DISCIPLINE
Foundations-only [propext, Classical.choice, Quot.sound]; NO sorry/axiom/native_decide/maxHeartbeats
raise; independent #print axioms audit vs the built olean; gate-fast D0–D6 ONCE (never block-wait).
Wire: Phys.lean, Audits/AxiomAudit.lean (append new lines), costume manifest + C303. Docs: LEDGER row,
ROADMAP N272 LANDED, CONSTELLATION ★5/★4. Next costume id after: C304.
