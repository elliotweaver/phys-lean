# N244 PREREG — THE FORCED EIGENSPACE DECOMPOSITION of the fundamental 7

## FRONT (owner-authorized gather-side, under the LOCK; NOT the ascent method)
Turn the banked spectral polynomial `minpoly ℚ chargeOp = X³+X` (N243) into the EXPLICIT
direct-sum eigen-decomposition it forces: the charge-operator kernel is EXACTLY the 1-dim singlet
direction (`ker chargeOp = span{sgl}`, dim 1 — the charge-0 direction EXHAUSTED), and its
complement is the banked real 6-space `Vsub` on which `chargeOp` restricts to the invertible
complex structure `chargeOpV` (no charge-0 direction there: `ker chargeOpV = ⊥`). So
`ImO = singlet ⊕ Vsub = 1 ⊕ (3 ⊕ 3̄)` as chargeOp-invariant eigenpieces, DERIVED from the spectrum.

## GO / NO-GO
- GO if the ⊆ spine (`ker chargeOp ≤ span{sgl}`) closes cheaply from banked `chargeOp_sq_coe`
  (N240) with NO coordinate bash and NO new subtype-of-subtype layer.
- NO-GO / reframe (W5) if closing the kernel identification forces positing a decomposition,
  normalizing, or building over ℚ[i] / TensorProduct. Never weaken below `ker chargeOp = span{sgl}`
  dim 1 + Vsub complement.

## DELIVERABLE (magnitude theorem TYPE mentions banked tower objects — chargeOp/sgl/Vsub/ImO/chargeOpV)
1. `sgl_mem_ker`            : sgl ∈ ker chargeOp                     (from chargeOp_kills_singlet)
2. `span_sgl_le_ker`        : span{sgl} ≤ ker chargeOp
3. `ker_le_span_sgl`        : ker chargeOp ≤ span{sgl}              (THE SPINE — chargeOp_sq_coe)
4. `chargeOp_ker`           : ker chargeOp = span{sgl}              (le_antisymm)
5. `chargeOp_eigenspace_zero`: eigenspace chargeOp 0 = span{sgl}    (eigenspace_zero + 4)
6. `finrank_ker_chargeOp`   : finrank ℚ (ker chargeOp) = 1          (finrank_span_singleton sgl_ne_zero)
7. `ker_chargeOp_map_eq_singlet`: (ker chargeOp).map ImO.subtype = singlet   (banked O ℚ-level)
8. `chargeOpV_ker`          : ker chargeOpV = ⊥                     (chargeOpV_sq: complement no neutral dir)
9. `forced_charge_eigenspace_structure` — capstone bundling 4/6/7/8 + banked
   singlet_disj_Vsub + singlet_sup_Vsub_eq_ImO + chargeOpV_sq (ImO = 1 ⊕ 6, complex structure on the 6).

## SPINE (⊆ direction, MEASURE — do not trust as proof, W9)
y ∈ ker ⟹ chargeOp y = 0 ⟹ chargeOp(chargeOp y) = 0; chargeOp_sq_coe y gives
(chargeOp² y : Oℚ) = ⟨u1,y⟩•u1 − y = 0 ⟹ (y:Oℚ) = ⟨u1,y⟩•u1 = ⟨u1,y⟩•(sgl:Oℚ) ⟹ y = ⟨u1,y⟩•sgl ∈ span{sgl}.

## KILL CLASSES (instrument-wall aborts, W9)
- KILL-1: any single obligation net-of-import > 90s → decompose or reframe (NOT a longer grind).
- KILL-2: reaching for `ring`/`decide`/monolithic `simp` over O ℚ coordinates → STOP; the trunk
  (chargeOp_sq_coe collapse) must dissolve it, no coordinate bash.
- KILL-3: any drift into the two-level End-of-End space or ℚ[i]/TensorProduct → STOP, reframe.

## COMPILE-COST BUDGET
Imports (via N243) alone ~26s baseline. Net-of-import per obligation target < 30s; whole-module
production olean target < 60s. If the whole module exceeds ~90s net, decompose. NO maxHeartbeats raise.

## COSTUME (next id C275)
`min 275 (finrank ℚ (LinearMap.ker chargeOp)) = 1` genuinely (BECAUSE ker = span{sgl}, dim 1);
BOGUS claim = 275 reduces to false `1 = 275`. Manifest row `1 = 275`. Fresh pair (distinct from
8=271, 0=272, 2=273, 3=274). Bites on the NEW dim-1 kernel fact (no other neutral direction).

## STANDARD (docs/STANDARD §1-2)
- UNBROKEN: extends N240/N242/N243/N42c; Mathlib (ker/eigenspace/finrank/span) as machinery only.
- COMPLETE: #print axioms ⊆ {propext, Classical.choice, Quot.sound}; no sorry/axiom/native_decide.
- WORDS-REMOVABLE: delete charge/singlet/triplet/neutral/eigenspace/i — the pure statement
  `ker (crossOp u1 on ImO) = span{sgl}`, dim 1, `ker chargeOpV = ⊥`, and `singlet ⊕ Vsub = ImO`
  stands as algebra. W8: costume bites + finrank=1 non-vacuous + ker chargeOpV=⊥ complementary.
- COMPLEX FIELD METALANGUAGE: chargeOp/ImO/Vsub stay derived REAL; no Algebra ℚ (Dbl ℚ), no ℚ[i].

## NEXT NODE (decide at end): the forced eigenspace decomposition is the platform for the
explicit invariant/covariant reading of the branching — to be decided from what N244 forces.
