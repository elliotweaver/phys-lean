# N25 PREREG — frozen GO/NO-GO + KILL (compact-form completion, increment 3)

Frozen before production Lean. Base: clean tree at N24 (f059974), no inherited WIP
(git status clean; W6 crime-scene N/A). `lake build Phys` green (6.5s).

## TARGET (ranked by tractability, decided by MEASUREMENT not guess)

The ticket lists three invariants. Decision rule: bank the cleanest FIRST (W9.8), child
the multi-run ones.

(B′) SEMISIMPLICITY — `LieAlgebra.IsSemisimple ℚ derivationLieQ`.
  Mathlib entry: `LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate`
  on `Φ := LieModule.traceForm ℚ derivationLieQ (O ℚ)`. Inputs:
    • nondegenerate — BANKED N24 `traceForm_nondegenerate`.
    • `Φ.lieInvariant L` — FREE `LieModule.traceForm_lieInvariant`.
    • `Φ.IsRefl` — FREE `(LieModule.traceForm_isSymm …).isRefl`.
    • `Module.Finite ℚ derivationLieQ` — from `finrank_derivationQ_eq_14` (finite).
    • ★ THE ONLY HARD INPUT: `hL : ∀ I : LieIdeal ℚ derivationLieQ, IsAtom I → ¬IsLieAbelian I`.

  ★ THE THEORY-NATIVE ROUTE for hL (NOT the false "abelian ⊆ radical" Killing argument —
  the ticket's explicit warning; for the negative-DEFINITE module form the radical is 0):
  the contradiction comes from the trace-form INVARIANCE + negative-DEFINITENESS, via an
  atom dichotomy. Let I be an abelian atom (assume for contradiction).
    KEY LEMMA (bracket-trace vanishing): for a : L and y,z ∈ I with I abelian,
      B(⁅a,y⁆, z) = B(a, ⁅y,z⁆)   [`traceForm_apply_lie_apply`]
                  = B(a, 0) = 0    [⁅y,z⁆ ∈ ⁅I,I⁆ = ⊥ since I abelian].
    ⁅⊤,I⁆ ≤ I (ideal), and IsAtom I ⟹ ⁅⊤,I⁆ = ⊥ ∨ ⁅⊤,I⁆ = I.
    CASE ⁅⊤,I⁆ = I: every z ∈ I lies in ⁅⊤,I⁆ = span{⁅a,y⁆}, so B(z,z)=0 by the key
      lemma + linearity (span_induction). Neg-definite (`traceForm_self_eq_zero`) ⟹ z=0
      ⟹ I = ⊥. Contradiction (atom ≠ ⊥).
    CASE ⁅⊤,I⁆ = ⊥: I ⊆ center. Take 0≠z∈I; z ∈ center AND z ∈ ⊤ = ⁅⊤,⊤⁆ = lcs 1
      (PERFECTNESS N23). `traceForm_apply_eq_zero_of_mem_lcs_of_mem_center` ⟹ B(z,z)=0
      ⟹ z=0. Contradiction.

  ★ BONUS STANDALONE: `LieAlgebra.center ℚ derivationLieQ = ⊥` (perfect + neg-definite via
  the lcs-center lemma). Genuinely valuable structural fact; bank it first as a clean lever.

(A) IRREDUCIBILITY of the faithful 7-rep `imRep` on `ImO` — needs LieRingModule/LieSubmodule
  instance setup on the abstract 7-space `ImO` (N23 flagged multi-run). → CHILD unless the
  setup measures cheap.

(D) SIMPLICITY — `LieAlgebra.IsSimple ℚ derivationLieQ`. From semisimple (B′) + a single
  simple factor. Likely needs (A). → CHILD.

## GO / NO-GO
GO if a bounded probe shows the four FREE inputs + center=⊥ + the bracket-trace lemma each
elaborate ≤ 60s. Bank center=⊥ and semisimplicity THIS node if hL assembles within turn
budget; child A and D.

NO-GO (→ W3 decompose, child remainder): if hL assembly exceeds budget after banking the
clean levers (center=⊥, the FREE inputs, the key lemma). Commit what compiled; child the rest.

## KILL (compile-cost budget, W9)
- Per-obligation KILL: 90s. Any single declaration exceeding 90s ⟹ INSTRUMENT failure;
  STOP, measure smallest sub-obligation, decompose. NEVER inflate maxHeartbeats.
- Turn-budget checkpoint: at ~55% of turns, FINALIZE (commit banked levers + child + complete).
  The recurring N17/N22/N23/N24 failure was timing out on ITERATION budget before banking.
- Prefer structural/representation routes over coordinate expansion. No determinant.

## ANTI-VACUITY (W8)
New costume MUST bite: a WRONG invariant — e.g. asserting `IsLieAbelian derivationLieQ`
(contradicts banked `derivationLieQ_not_lieAbelian`), or a fake abelian atom, must FAIL to
compile. Reuse banked structures only — no fresh table.

## PHYSICS-WORDS-REMOVABLE
Delete "g₂/gauge/compact/exceptional": the theorem remains a complete proof that the 14-dim
Lie algebra of Leibniz-derivations of the Cayley–Dickson double-of-a-double-of-a-double of ℚ
is semisimple (and has trivial centre). No theorem STATEMENT needs a physics word.
