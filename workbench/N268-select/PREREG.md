# PREREG — N268: THE DERIVED GAUGE ACTS ON THE MAXIMAL MATTER ARENA BY JORDAN
# DERIVATIONS, IDENTICALLY ACROSS THE THREE CAP-FORCED COPIES — FAMILY UNIVERSALITY FORCED.

FROZEN BEFORE PRODUCTION COMPUTE. Node selected via SELECT S1–S5 (comments 124–127 on
t_2eda74a8), anti-bullshit gate passed IN FULL incl. the free-floating/generic confrontation.

## TARGET (the ★1↔★4 joint; names the ★2/★5 breaking-blocker)
The derived gauge `Der(O ℚ) = g₂` (N6/N201, contains the banked colour su(3) + electroweak
factors) acts entrywise on the maximal matter arena `J₃(O ℚ) = H₃(O ℚ)` (N5/N267) BY
JORDAN-ALGEBRA DERIVATIONS — a genuine symmetry of the arena — fixing the real diagonal and
carrying each of the three matter-carrier slots (N267) by the IDENTICAL rule
`jAct D (slotX v) = slotX (D v)`. So the three cap-forced copies are MUTUALLY ISOMORPHIC
gauge-modules, each ≅ the ONE g₂-irreducible fundamental (N234). Family universality FORCED;
count 3 cap-forced.

Production file: `Phys/Algebra/OctonionJordanGaugeUniversality.lean` (namespace `Phys.Algebra.HJ`).

## THE FREE-FLOATING GROUNDING (the rail — decisive)
The generic mechanism (`jAct_mul`: a ring derivation lifts to a matrix derivation; `jAct_jb`:
Jordan-derivation corollary; single-entry intertwiners) is a SUPPORTING INGREDIENT, NOT the
headline. The HEADLINE is the octonion-SPECIFIC JOINT, false for associative/commutative
coordinate rings:
  (i)  exactly THREE copies, cap-forced (N267 `jordan_cap_pinned_at_three`, via
       `jordan_cap_iff_nonassoc` — associative ring: every order Jordan, no cap, count C(n,2));
  (ii) each copy the ONE g₂-IRREDUCIBLE fundamental (N234 `no_proper_invariant_ImO` — commutative
       ring: Der = 0, no nontrivial irreducible fundamental);
  (iii) the gauge is `g₂ = Der(O ℚ)` itself (the SAME simple algebra containing colour/electroweak).
Words-removable: delete gauge/family/generation/matter/universality/colour → "Der(O ℚ) acts
entrywise on H₃(O ℚ) as a Jordan-bracket derivation, annihilating the diagonal, carrying each of
the three slots by the identical rule slotX∘D; the imaginary fundamental is irreducible; exactly
three slots because the Jordan identity holds at order 3, fails at order 4" — a real theorem, the
CONJUNCTION carrier-specific.

## DECLS (ALL de-risked EXIT 0 foundations-only this run, probes 1b + 2)
- `derivQ_star_comm` — a derivation commutes with conjugation (trace_id + derivQ_one + derivQ_maps_im).
- `jAct` — the entrywise gauge action `M.map (D·)`.
- `jAct_add`, `jAct_smul_matrix` — ℚ-linearity in the matrix argument.
- `jAct_mul` — the matrix Leibniz law (SUPPORTING mechanism).
- `jAct_jb` — ★ jAct D is a DERIVATION of the Jordan bracket (the gauge = Jordan derivations).
- `jAct_slotA` / `jAct_slotB` / `jAct_slotC` — the three slot intertwiners, IDENTICAL form (universality).
- `jAct_Dg` — the diagonal is gauge-fixed (= 0).
- `jAct_Hm` — the full arena decomposition under the action.
- W8 `jAct_witness_ne_zero` — a derived-gauge element genuinely moves a slot (non-vacuity).
- capstone `gauge_family_universality` — bundles: (jAct_jb) ∧ (three identical intertwiners) ∧
  (diagonal gauge-fixed) ∧ (arena decomposition) ∧ (count 3 cap-forced, N267) ∧
  (fundamental irreducible, N234) ∧ non-vacuity.

## COST BUDGET / KILL (W9)
Whole node is SHORT structural rewrites over banked objects (entrywise `Matrix.map` + per-entry
`fin_cases <;> simp` + `Finset.sum` Leibniz + `abel`). Probes: probe1b 23s, probe2 8.6s (net of
import). KILL: if any single obligation exceeds ~60s net-of-import or needs `maxHeartbeats` raise
or any octonion coordinate `decide`/`native_decide`, STOP and reframe (ONE LAW). NO coordinate bash.

## INSTANCE NOTE
Use the GLOBAL `instModuleQO` (NO `qMod` local override): the N267 slot/Hm/Dg/Xz defs use no `•`
(pure matrix constructors), so importing under the global instance typechecks the derivation
lemmas (`derivQ_one`/`derivQ_maps_im`). `ocR r = r • 1` closes by `ext <;> simp [ocR]`.

## SCOPE — HONESTY CLAUSE
Banks: the derived-gauge Jordan-derivation ACTION on the arena + the three-fold identical-intertwiner
UNIVERSALITY + the diagonal gauge-fixing + the tie to the cap-forced count (N267) and the g₂-irreducible
fundamental (N234) + non-vacuity ONLY. NOT "= three physical generations with identical SM quantum
numbers" (removable prose); NOT the masses/mixings (★5); NOT the mixing angle (★2 — this NAMES its
blocker, does not force the T₃-split); NOT which "3" maps to families; NOT a full gauge-module iso as a
bundled Mathlib `LinearEquiv` object (the intertwiner-level universality is the honest content).

## COSTUME
C299 — bite at the universality/action witness (a WRONG reading — the gauge does not act by
derivations / the three copies carry DIFFERENT actions / a slot is not an intertwiner / the diagonal
is not gauge-fixed — reduces to a false numeric). Pair (299, k) fresh, RHS 299 distinct.
