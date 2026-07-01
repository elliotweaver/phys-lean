# N223 PREREG — THE CROSS PRODUCT REALIZES THE FUNDAMENTAL 7 INSIDE so(7): crossOp is a g₂-equivariant map 7 → so(7) ⊂ End(7)

## Node context
Gather front under the OVERNIGHT PRIORITY LOCK (ROADMAP §lock, in force). Chain stays on the
gather. N222 banked: the gluing-obstruction cocycle (= the associator) is a g₂-equivariant map
INTO the fundamental 7-rep ImO (valued in the 7, kills the trivial rep, imRep-intertwiner).

N223 takes the frontier's TOP-NAMED cut (ROADMAP §N222 forward frontier): the DUAL/ADJOINT
direction — the **14 = adjoint g₂ inside so(7)**, via the Clebsch–Gordan content of the cross
product `octCross` as a g₂-module map. The concrete, banked-tower realization:

The cross-product operator on the fundamental 7,
    crossOp a : ImO → ImO,  y ↦ octCross a y   (for a ∈ ImO),
is (1) a genuine ℚ-linear endomorphism of the banked 7-rep ImO, (2) **SKEW-ADJOINT for the Born
form** — it lands in so(7) = skewAdjoint(ImO) — and (3) a **g₂-INTERTWINER**: the adjoint action
of imRep D on crossOp a is crossOp (D a). So the fundamental 7 embeds g₂-equivariantly into
so(7) ⊂ End(7): the arena in which so(7) = g₂(14) ⊕ 7 lives, opened concretely on the banked tower.

This is the ADJOINT face of N222: N222 = "the obstruction's VALUES live in the 7"; N223 = "the 7
itself sits inside the skew endomorphisms so(7), g₂-equivariantly, via the cross product" — the map
that supplies the Λ²(7) = 14 ⊕ 7 decomposition. Genuinely NEW (grep 0 hits for crossOp / imRep skew
/ so7 in the banked tree).

## Why this is on-strand (FREE-FLOATING check, SOUL rail)
Every headline is stated ON O ℚ / ImO referencing banked octCross (N206), imRep (N22),
gForm (N17), assoc3 (N209), octCross_deriv_leibniz / derivationLieQ_octCross_leibniz (N207).
The magnitude theorems are LITERALLY about the banked tower objects. Not carrier-agnostic.

## The forced derivation (all prerequisites BANKED — no new ground)
1. **crossOp maps ImO→ImO, ℚ-linear.** octCross a y ∈ ImO for a,y imaginary (octCross_mem_ImO N206);
   octCross a (·) is ℚ-linear in the 2nd slot (octCross def = a*y + gForm a y • 1; mul + gForm
   bilinear via gForm_add_right/gForm_smul_right N26). Build crossOp a : Module.End ℚ ImO by
   .restrict of the End ℚ (O ℚ) map, exactly as imRepFun does.
2. **SKEW-ADJOINT (the so(7) fact).** For a,y,z ∈ ImO:
      gForm (octCross a y) z = assoc3 z a y   [assoc3 z a y := gForm z (octCross a y), gForm_symm]
                             = − assoc3 y a z  [assoc3 total antisymmetry: swap first↔last is odd]
                             = − gForm (octCross a z) y ... careful; use assoc3_swap on the right slots.
   Concretely: gForm(octCross a y) z + gForm y (octCross a z) = 0  ⟺  crossOp a skew for gForm.
   PROVED from assoc3 total antisymmetry (assoc3_cyclic + assoc3_swap_yz + assoc3_swap_xy, N209).
   → crossOp a ∈ skewAdjoint for the Born bilinear form on ImO (build the form; or state the
   raw skew identity gForm(crossOp a y)z + gForm y (crossOp a z)=0, tower-concrete, physics-free).
3. **g₂-INTERTWINER (the equivariance that makes it a g₂-module map).**
      imRep D (crossOp a y) = crossOp (D a) y + crossOp a (imRep D y)
   i.e. as operators on ImO: ⁅imRep D, crossOp a⁆ = crossOp (D a).
   PROVED from derivationLieQ_octCross_leibniz (N207): D(octCross a y)=octCross(Da)y+octCross a(Dy),
   restricted to ImO. This is the statement that a ↦ crossOp a is a g₂-module homomorphism
   7 → so(7) (adjoint action on the target).
4. **W8 NON-VACUITY.** crossOp is NONZERO: crossOp u1 u2 = octCross u1 u2 ≠ 0 (banked
   octCross u1 u2 has gForm = 1, ≠ 0). And the intertwiner is genuine at witnessLieQ / D0E.
5. **Capstone** cross_seven_in_so7_structure: bundles linear-endo + skew (so7) + g₂-intertwiner
   + non-vacuity on O ℚ / ImO.

## Costume C255 (must BITE)
The cross-product operator is genuinely skew: gForm(crossOp a y)z = −gForm y(crossOp a z), so the
"symmetric part" / trace-like real invariant is 0. A bogus claim that crossOp has a nonzero
symmetric (non-skew) part / is NOT valued in so(7) forces 0 = 255 in ℚ. Dash-free signature
"0 = 255"; RHS 255 fresh vs C252=252/C253=253/C254=254.

## W9 cost budget + KILL
Expected LIGHT (all levers are banked bounded identities; assoc3 antisymmetry is banked, no
degree-4 ring). KILL = 90s / obligation. If any single obligation exceeds 90s → measure/decompose,
never grind. Probes must be clean < ~15s each.

## Route-finding fallback
If skew-adjointness needs a not-yet-banked bilinear-form packaging, state the RAW skew identity
(gForm-level, tower-concrete) rather than importing Mathlib's skewAdjoint submodule as content —
the raw identity IS the so(7) membership and needs no new structure.
