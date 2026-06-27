# N103 PREREG — THE CONVERSE GENERATION ON A PRODUCT-OF-HALF-TURNS COMPACT ROTATION

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure, not theory failure.

## TARGET (ROADMAP §N103 FORWARD FRONTIER, priority (i) — the immediately-bankable next
   structural piece, NO topology)

The CONVERSE GENERATION for a CONCRETE compact rotation that is a PRODUCT of two half-turns —
`genTwoPlaneLin u w = biMulLin w w * biMulLin u u` (N100). Extend N102 (single-generator
half-turn → itself) and N101 (boost → id) to a NONTRIVIAL TWO-GENERATOR WORD.

THE THEORY-NATIVE LEVER (the KAK structure, no operator topology, THE ONE LAW):
- Let A := biMulLin u u, B := biMulLin w w (two two-sided half-turns, unit-imaginary u, w).
- Each half-turn is EvC-SELF-ADJOINT (N102 `biMulLin_imag_isEvCAdjoint_self`) AND an
  INVOLUTION A∘A = id, B∘B = id (N102 `biMulLin_imag_involutive`).
- The product g := B∘A (= genTwoPlaneLin u w as a Module.End, defeq `biMulLin w w * biMulLin u u`).
- Its EvC-adjoint: h := A∘B (the adjoint composes contravariantly, `IsEvCAdjoint.comp`:
  IsEvCAdjoint (B∘A) (A∘B) from B self-adjoint, A self-adjoint).
- The polar positive part: p = h∘g = (A∘B)∘(B∘A) = A∘(B∘B)∘A = A∘id∘A = A∘A = id.
  ⇒ g is EvC-ORTHOGONAL (g*∘g = id).
- p = id INJECTIVE ⇒ by `op_sqrt_unique_of_injective` (N93) the spectral root specOpN(cutSqrt∘c)uu
  = id, so (p^{1/2})⁻¹ = id, and the compact part k := g∘(p^{1/2})⁻¹ = g∘id = g ITSELF.
- g = genTwoPlaneLin u w is a TWO-GENERATOR biMulLin WORD ∈ genIsomMonoidLin
  (`genTwoPlaneLin_mem_genLin`, already banked, mul_mem of two subset_closure generators).
- Bridged: endToFunEnd k = endToFunEnd g ∈ genIsomMonoidC2 (N100 transport
  `endToFunEnd_genIsomMonoidLin_mem_gen2` / `genTwoPlaneLin_mem_gen2`).

This DISCHARGES the converse generation `qvIsomMonoidC ≤ genIsomMonoidC2` on a concrete
genuinely-COMPACT MULTI-GENERATOR (a 2-plane rotation product), the genuinely NEW step past
N102's single generator.

## DECLS TO BANK (production, Phys/Algebra/LorentzContinuumGenerationConverseCompactWord.lean)
1. `genTwoPlaneLin_isQvIsomC` — the product g = genTwoPlaneLin u w is a QvC-isometry
   (composition of two QvC-isometries, via isQvIsomC_comp through the bridge OR directly).
2. `genTwoPlaneLin_isEvCAdjoint` — IsEvCAdjoint (genTwoPlaneLin u w) (genTwoPlaneLin w u)
   [adjoint of B∘A is A∘B = biMulLin u u * biMulLin w w = genTwoPlaneLin w u].
3. ★★ `genTwoPlaneLin_compact_part_eq_self` — THE CONVERSE CORE: p = h∘g = id (EvC-orthogonal),
   spectral root = id, compact part k = g itself.
4. `genTwoPlaneLin_compact_part_mem_genLin` — k (= g) ∈ genIsomMonoidLin (two-generator word).
5. ★★ `genTwoPlaneLin_compact_part_mem_gen2` — bridged compact part ∈ genIsomMonoidC2.
6. ★ W8 `genTwoPlaneLin_e2je2_compact_part_real_coord` — the concrete e₂,ιe₂ rotation product's
   compact part (= itself) FIXES the real axis (0,0,1), reading deep coord re.re.re = 1
   (vs a single half-turn negating it to −1, N102). TEETH.

## KEY OBLIGATION TO MEASURE FIRST (the only nontrivial algebra)
The positive part p = h∘g = (A∘B)∘(B∘A) collapses to id. In Lean:
  (biMulLin u u ∘ biMulLin w w) ∘ (biMulLin w w ∘ biMulLin u u) = id
using B∘B = id (biMulLin_imag_involutive for w) and A∘A = id (for u), comp_assoc.
This is a clean structural rewrite, NOT a coordinate brute. MEASURE it closes < 30s.

The adjoint p = h∘g must MATCH the specOpN c uu from isometry_compact_part_isQvIsom applied to
(hgisom, hgadj). Same pattern as N102 `biMulLin_imag_compact_part_eq_self`: obtain the spectral
data, show specOpN c uu = id via heq + (h∘g = id), then root uniqueness.

## GO / NO-GO
- GO: the obligation p = h∘g = id closes by structural comp rewriting (each piece < 30s), the
  N102 compact_part_eq_self pattern transports verbatim with g = genTwoPlaneLin, h = its adjoint.
- NO-GO → DECOMPOSE: if the adjoint composition or the specOpN-matching fights, bank whatever
  compiles (e.g. genTwoPlaneLin_isEvCAdjoint + the p=id collapse) and child the remainder.
- HONEST W1 BLOCK: only if the EvC-orthogonality lever itself fails (it should not — it is the
  N102 self-adjoint+involution facts composed). Do NOT touch operator topology / SO(9) here.

## KILL BUDGET (W9)
- KILL per obligation: 90s. Any single tactic > 90s = INSTRUMENT failure → measure/decompose,
  do NOT inflate maxHeartbeats, do NOT grind.
- `lake build Phys` cached replay expected ~5-35s when oleans warm.
- Gate D5 costume battery ~10-11 min (134→135 costumes parallel x8), D6 axiom audit ~6-11 min
  cold. Run gate in BACKGROUND. Checkpoint ~50% turns; finalize with turns to spare.

## COSTUME C135 (W8 — MUST BITE, false numeric DISTINCT from C115 1=7 … C134 −1=41)
A WRONG product-rotation compact-part coordinate claim: the e₂,ιe₂ rotation PRODUCT's compact
part (= itself) FIXES (0,0,1) reading re.re.re = 1, NOT −1 / NOT some other value. The bogus
costume asserts a WRONG reading, forcing e.g. `1 = 43` (distinct from all banked values). Reuse
banked objects only.

## STANDARD (applied at finalize)
- UNBROKEN: every object from N93/N94/N100/N102 + derived ℝ Cut + O Cut. Nothing posited.
- COMPLETE: #print axioms ⊆ {propext, Classical.choice, Quot.sound}, verified vs built olean.
- PHYSICS-WORDS-REMOVABLE: delete rotation/half-turn/isometry/compact/orthogonal/KAK/Spin/SO —
  remains pure linear algebra over Cut: a product of two EvC-self-adjoint involutions is
  EvC-orthogonal, its inverse-spectral-root-of-square is id, it equals its own compact part,
  lies in the generated submonoid, bridges into the target submonoid.
