# N228 PREREG — THE FINER SPLIT 28 = 1 ⊕ 27: the traceless-symmetric 27 as the g₂-complement of ℚ·id inside selfAdj

## Front chosen (from N227 forward frontier, first option, ALL prereqs banked)
Under the OVERNIGHT LOCK (stay on the gather). N227 banked `End ℚ ImO = Sym²7 (28) ⊕ Λ²7 (21 = so(7))`
with the trivial rep `1 = ℚ·id` isolated (`one_mem_selfAdj`, `one_adEnd_zero`), `finrank_selfAdj_eq_28`,
`selfAdj_adEnd_inv`. The LAST irreducible piece of `7⊗7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` is the traceless-symmetric
**27** — the g₂-complement of the trivial line inside the symmetric 28. This node builds it.

## Objects (all derived / banked / Mathlib-machinery, NO posit)
- `trivialLine := ℚ ∙ (1 : Module.End ℚ ImO)` — the trivial rep line (dim 1).
- `tracelessSym := bornBil.selfAdjointSubmodule ⊓ LinearMap.ker (LinearMap.trace ℚ ImO)` — the 27.
- trace functional = Mathlib `LinearMap.trace ℚ ImO : End ℚ ImO →ₗ[ℚ] ℚ` (MACHINERY on derived ImO).

## The forced derivation (structural, no coordinates)
1. `trace_one_eq_seven`: `trace ℚ ImO 1 = 7` via Mathlib `trace_one` + banked `finrank_ImO = 7`.
2. `one_ne_zero_End`: `(1 : End ℚ ImO) ≠ 0` (else trace 1 = 0 = 7, char 0 contradiction).
3. `finrank_trivialLine = 1` via `finrank_span_singleton (one_ne_zero_End)`.
4. `trivialLine ≤ selfAdj` (`one_mem_selfAdj` + span_le).
5. `trivial_tracefree_disjoint`: `trivialLine ⊓ tracelessSym = ⊥`. A `c•1` with `trace(c•1)=0` gives
   `7c = 0` ⇒ `c = 0` (char 0). So the line meets ker(trace) only at 0.
6. `trivial_tracefree_span`: `trivialLine ⊔ tracelessSym = selfAdj`. For self-adjoint φ with trace t:
   `φ = (t/7)•1 + (φ − (t/7)•1)`; first ∈ trivialLine; second is self-adjoint (self-adj closed under
   sub/smul, 1 self-adj) AND traceless (`t − (t/7)·7 = 0`), so ∈ tracelessSym. Hence selfAdj ≤ L ⊔ T;
   reverse ≤ from L ≤ selfAdj and T ≤ selfAdj. ⇒ the internal direct sum `selfAdj = 1 ⊕ 27`.
7. `finrank_tracelessSym = 27` via `finrank_sup_add_finrank_inf_eq` on (trivialLine, tracelessSym):
   `finrank(L⊔T) + finrank(L⊓T) = finrank L + finrank T` ⇒ `28 + 0 = 1 + finrank T` ⇒ `27`.
8. `tracelessSym_adEnd_inv`: g₂-stable. `X ∈ selfAdj ⇒ adEnd D X ∈ selfAdj` (banked `selfAdj_adEnd_inv`);
   `X ∈ ker(trace) ⇒ trace(adEnd D X) = trace ⁅imRep D, X⁆ = 0` (Mathlib `trace_lie`) ⇒ adEnd D X ∈ ker.
9. `trivialLine_adEnd_inv`: `adEnd D` kills the line (`one_adEnd_zero` + span) ⇒ ⊆ trivialLine.
10. Non-vacuity: `one_mem_trivialLine`; `finrank_tracelessSym = 27 > 0` (the 27 is nonzero).
11. Capstone `traceless_sym_27_structure`: bundles isCompl-within-selfAdj (L⊓T=⊥, L⊔T=selfAdj) + dims
    (1, 27, 28) + both g₂-submodules.

## Physics-words-removable
Delete g₂/so(7)/trivial-rep/traceless/27/metric/trace-as-physics: over derived ℚ and O ℚ = CD(H ℚ),
for ImO and the nondegenerate symmetric bornBil, the line `ℚ∙1` and the intersection
`selfAdj ⊓ ker(trace)` are disjoint, span selfAdj, have finrank 1 and 27, and both are stable under
`X ↦ ⁅imRep D, X⁆`. No theorem STATEMENT needs a physics word.

## W9 cost budget + KILL
LIGHT node (like N227): all obligations structural over banked facts + trace/finrank MACHINERY,
NO coordinate ring, NO degree-4 expansion. KILL: if ANY single obligation needs a coordinate
expansion or a `ring`/`decide` over expanded O ℚ, STOP — it means the framing drifted (it should
not; every step is a Mathlib trace/finrank lemma). Expected full Phys build ≈ 25s. maxHeartbeats:
default proof-search; keep the N227 synthInstance.maxHeartbeats ceiling (instance diamond, NOT a
proof-search raise) if the IsAdjointPair/End instances need it.

## Costume
C260 (`TowerGatherTracelessSym27WrongValueCostume`): the traceless-symmetric side GENUINELY has
finrank 27; a bogus claim it is some other value forces `27 = 260` in ℕ. RHS 260 fresh.

## Measure-first (this probe)
Confirm: `trace_one`+`finrank_ImO` gives 7; `finrank_span_singleton` applies to End ℚ ImO;
`trace_lie` closes the ker(trace) g₂-invariance; `finrank_sup_add_finrank_inf_eq` gives 27. Then write.
