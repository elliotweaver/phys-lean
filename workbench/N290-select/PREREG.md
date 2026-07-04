# N290 — PREREG: THE FAMILY-INVARIANT CORE OF THE MATTER ARENA IS THE SCALAR-UNIT LINE

## TARGET (theory-native, selected via SELECT S1–S4, anti-bullshit gate passed)
The joint kernel of the derived family-rotation `so(3)` {famA, famB, famC} (N288/N289) acting on the
maximal Hermitian octonionic Jordan arena `H₃(O ℚ) = J₃(O ℚ)` (N267) is EXACTLY the scalar-unit line
`span{(1 : Matrix (Fin 3)(Fin 3)(O ℚ))}` = ℚ·id, dimension 1. Equivalently: the family symmetry
FIXES only the arena's identity; the traceless 26-dim arena (where ALL generation content lives) has
NO nonzero family-invariant direction — the fold's self-blindness at the family level.

## THE STAR / ARC
Advances ★4 (family replication — the invariant structure of the family symmetry). The arena-level
twin of the banked gauge-neutral-core arc (N252 unique colour-fixed axis, N266 colour-neutral core,
N271 joint colour∧isospin core = span{1}). The continuous twin of N275's discrete "no fixed root"
A₂ ceiling: the family so(3) fixes only the unit, so a mass/mixing texture (★5) needs a
symmetry-BREAKING derived object, DERIVED not posited.

## MEASURED (workbench/N290-select/, exact-Fraction octonion, all reproduced):
- dim joint-kernel {famA,famB,famC} on the 27-dim Hermitian arena = 1 = span{Dg0+Dg1+Dg2}=span{I}.
- A PAIR {famA,famB} already forces it (minimal instrument).
- famX = adE(ocRM Kx) (N289 `collapse`), Ka=comm(pB,pC), Kb=comm(pC,pA), Kc=comm(pA,pB), 0/±1.
- famX(1) = adE(ocRM Kx)(1) = ocRM Kx·1 − 1·ocRM Kx = 0 (⊇ trivial; derivations kill the unit).
- ⊆: famA M=0 forces M 1 2 = 0, M 1 1 = M 0 0; famB M=0 forces M 0 1 = 0, M 2 2 = M 0 0 (and the
  Hermitian reconstruction forces the sub-diagonal). Combined + herm ⇒ M = ocR(M 0 0)·id.
- Casimir spectrum {0×1, −2×21, −6×5} (module = 1 ⊕ 5 ⊕ 21) — SCOPE-OUT (only the CORE is banked).
- Full-space (72-dim) joint kernel is 8-dim (=O·id); Hermitian restriction collapses to 1-dim (ℚ·id).

## PLAN (all coordinate-free via N289 banked levers, NO octonion coordinate bash)
1. `mul_ocR_one : z * ocR 1 = z` (helper; via ocR_comm + ocR_one_mul).
2. `famInvariant := ⨅ (three joint kernels)` OR the Submodule `{M | famA M = 0 ∧ famB M = 0 ∧ famC M = 0}`.
   Frame as: the family-invariant HERMITIAN core. Carrier: work on the Hermitian subspace
   (M with Mᴴ = M), matching the banked derH3/N286 pattern; the arena IS the Hermitian arena.
3. Entry-extraction lemmas from `famX M = 0` (via famX_eq_adE `collapse` + hKa/hKb constant matrices
   + entry simp with ocR_zero/ocR_one_mul/mul_ocR_one): fam_kills forces the off-diagonals to 0 and
   the diagonals equal.
4. `⊇`: `1 ∈ core` — famX(1)=0 (adE(K)(1)=0 by mul_one/one_mul).
5. `⊆`: for M ∈ core with Mᴴ=M, herm_eq_Hm + extractions ⇒ M = Hm d d d 0 0 0 = ocR d • id ∈ span{1}.
6. Capstone `family_invariant_core_eq_span_one`: the joint kernel (Hermitian) = span{1}, dim 1.
   W8 non-vacuity: `1 ≠ 0` in the arena (a genuine 1-dim, not ⊥) AND the traceless part carries none
   (a concrete traceless Hermitian element, e.g. slotA 1 or Dg 1 (-1) 0, is NOT family-invariant —
   famC(slotA 1) = -slotB 1 ≠ 0). Carry `jordan_fails_H4` in the capstone TYPE (cap-forced order 3).

## COST BUDGET + KILL
Whole olean target ≤ ~60s (matches N289 ~13s + entry-extraction lemmas). KILL: if any single
extraction lemma's simp does not reduce to a 0/±1-linear relation within a bounded probe (~90s), the
instrument is wrong — reframe via `adE_ocRM_entry` structural lemma (the ∑ K•M form), do NOT grind.
No maxHeartbeats beyond 1.2M (matching N289). NO native_decide, NO octonion coordinate ring.

## COSTUME C319
Bites at the core non-triviality / exactness: a WRONG reading (the core is bigger than span{1} / the
family fixes a traceless direction / the arena has a family-invariant generation direction) reduces
through the banked extraction to a false numeric `1 = 319`. Certificate candidate:
`reQ ((famC (slotA 1)) 0 2) = -1` (famC(slotA 1) = -slotB 1, entry (0,2) = -1 ≠ 0, so slotA 1 ∉ core)
tied to `1 = 319`. Pair (319, 1) fresh.

## STANDARD
UNBROKEN (innerMul N274, slotA/B/C N267, famX_eq_adE/collapse/ocRM N289, herm_eq_Hm N286,
jordan_fails_H4 N5). COMPLETE (foundations-only [propext,Classical.choice,Quot.sound], no sorry/
axiom/native_decide). WORDS-REMOVABLE (delete family/generation/flavour: joint kernel of the 3-dim
Lie algebra span{innerMul...} on the order-3 Hermitian octonionic matrix algebra = scalar-unit line).
NOT free-floating (types cite banked innerMul/slotA/B/C/Hm on Matrix(Fin 3)(Fin 3)(O ℚ); capstone
carries jordan_fails_H4). ANTI-VACUITY (C319 bites; the traceless arena carries no invariant).
