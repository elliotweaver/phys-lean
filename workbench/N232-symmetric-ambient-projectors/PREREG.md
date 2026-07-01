# N232 — PREREG: the SYMMETRIC-SIDE ambient refinement

## Target (single, decided; no menu)
Complete the FULL FOUR-WAY g₂-equivariant resolution of the identity on `End ℚ ImO`
(the 7⊗7 = 49 arena) by lifting N228's symmetric-side submodules `trivialLine`/`tracelessSym`
to AMBIENT projectors `projTrivial`/`proj27` — the symmetric partner of what N231 did on the
skew side (proj7/proj14). Result:

    projTrivial : End ℚ ImO → End ℚ ImO   range = trivialLine (1),   idempotent, g₂-equivariant
    proj27      : End ℚ ImO → End ℚ ImO   range = tracelessSym (27),  idempotent, g₂-equivariant
    projTrivial + proj27 = projSym                    (refines N230's symmetric retraction)
    ★★ projTrivial X + proj27 X + proj7 X + proj14 X = X   (FOUR-WAY: 1 ⊕ 27 ⊕ 7 ⊕ 14 = 49)
    all pairwise compositions among {projTrivial, proj27, proj7, proj14} vanish (orthogonality)

## THE TRUNK-NATIVE DESIGN (the key move — dissolves the hard classical fact)
Naive design would set `projTrivial X := (trace X / 7) • 1`, whose "kills so(7)" step needs the
classical fact "skew-adjoint w.r.t. a symmetric nondegenerate form ⟹ traceless" — NOT banked,
a genuine side-quest (potential W1).

Instead FACTOR THROUGH the banked `projSym` (N230):

    projTrivial X := (trace (projSym X) / 7) • 1
      := smulRight ((7⁻¹) • (trace ℚ ImO ∘ₗ projSym)) (1 : End ℚ ImO)

Then EVERY hard step becomes FREE from banked facts:
- kills so(7):  X skew ⟹ projSym X = 0 (banked projSym_apply_skew) ⟹ trace 0 = 0 ⟹ 0•1 = 0.
- kills tracelessSym: X ∈ tracelessSym ⟹ projSym X = X (projSym_apply_self) AND trace X = 0 ⟹ 0.
- fixes 1: projSym 1 = 1 (one_mem_selfAdj) ⟹ (trace 1 /7)•1 = (7/7)•1 = 1 (trace_one_eq_seven).
- fixes trivialLine: linear + projTrivial 1 = 1.
- idempotent: projTrivial X ∈ trivialLine, projTrivial fixes trivialLine.
- range = trivialLine: image is c•1; fixes trivialLine so ⊇.
- g₂-equivariance: BOTH sides = 0.  projTrivial(adEnd D X) = (trace(adEnd D (projSym X))/7)•1
  = (trace ⁅imRep D, projSym X⁆ /7)•1 = 0 (trace_lie);  adEnd D (projTrivial X) = adEnd D (c•1)
  = c • adEnd D 1 = c • 0 = 0 (one_adEnd_zero).

`proj27 := projSym − projTrivial`:
- range = tracelessSym: proj27 X ∈ selfAdj (projSym X + c•1 both self-adj) AND trace(proj27 X)=0
  (trace(projSym X) − trace(c•1) = trace(projSym X) − c·7 = trace(projSym X) − trace(projSym X) = 0).
- fixes tracelessSym: projSym X = X, projTrivial X = 0 ⟹ proj27 X = X.
- idempotent, equivariant (difference of two equivariant maps), finrank 27 (finrank_tracelessSym_eq_27).

FOUR-WAY: projTrivial X + proj27 X = projSym X, and N231 projSym_add_proj7_add_proj14 gives
projSym X + proj7 X + proj14 X = X.

## Prereqs (all banked)
N228: trivialLine, tracelessSym, trace_one_eq_seven, one_ne_zero_End, finrank_trivialLine,
  finrank_tracelessSym_eq_27, trivialLine_le_selfAdj, tracelessSym_le_selfAdj, one_mem_trivialLine.
N227: one_mem_selfAdj, one_adEnd_zero, selfAdjointSubmodule/skewAdjointSubmodule bornBil.
N230: projSym, projSym_apply_self, projSym_apply_skew, projSym_apply_mem, projSym_projSym,
  projSym_equivariant, projSym_add_projSo7.
N231: proj7, proj14, proj7_apply_self, proj7_apply_mem, proj14_apply_self, proj14_apply_mem,
  proj7_apply_adj, proj14_apply_fun, projSym_add_proj7_add_proj14, crossEmb_range_le_so7',
  imRep_range_le_so7.
Mathlib: LinearMap.trace / trace_lie / trace_one, smulRight, finrank_span_singleton.

## Compile-cost budget (W9)
N231 probe compiled standalone 23.6s. This node is structurally identical (same import graph +
purely structural proofs factoring through banked projSym — NO coordinate/ring expansion). KILL:
if the probe or any single obligation exceeds ~5 min, that is an instrument wall → measure/decompose.
Keep the inherited `set_option synthInstance.maxHeartbeats 1000000` (instance-diamond ceiling for the
ℚ-End synthesis, NOT a proof-search raise) — do NOT raise maxHeartbeats.

## Costume (next id C264)
proj27's range GENUINELY has finrank 27 (finrank_proj27_range); a bogus collapse forces 27 = 264 in ℕ.
Pair (264, 27) fresh; RHS 264 distinct from every prior right-hand value.

## STANDARD check to apply before complete
UNBROKEN (imports only banked N231 + N228 + Mathlib trace machinery on derived objects); COMPLETE
(#print axioms ⊆ foundations, no sorry/axiom/native_decide, no maxHeartbeats proof raise);
PHYSICS-WORDS-REMOVABLE (delete trivial-rep/traceless/g₂/projector: pure statement about
trace/projSym/idempotent/range on derived ℚ, O ℚ = CD (H ℚ)); FREE-FLOATING: every headline TYPE
mentions banked tower objects (projSym/proj7/proj14/trivialLine/tracelessSym/adEnd/bornBil/ImO/
derivationLieQ) — projTrivial/proj27 the CONCRETE ambient retractions, not carrier-agnostic.
