# N249 PREREG — FAITHFULNESS of the induced colour su(3)-rep (colourRepV INJECTIVE)

Frozen BEFORE production compute. Gather-side, owner-authorized under the LOCK
(ROADMAP owner authorization 2026-07-01: gauge-looking results from the gather object,
incl. hypercharge, are welcome; the FORBIDDEN thing is the invariant-tower ASCENT method
only — NOT resumed here).

## THE ONE TARGET (self-authored, worker-body STEP 5, no menu)
`colourRepV_faithful : Function.Injective colourRepV`
(equivalently `LinearMap.ker (colourRepV.toLinearMap) = ⊥`).

PINS N248's induced rep as a genuine FAITHFUL su(3)-module: NO nonzero colour element
acts as the zero endomorphism on the charged matter Vsub. su(3) embeds faithfully into
the ℂ-linear endomorphisms of the charged 6-space (those commuting with chargeOpV).
This is a GENUINE FORWARD pinning (the DEFINING classification fact of a faithful rep) —
N248 gave only nontriviality of ONE witness (colourRepV_ne_zero); injectivity (NO nonzero
element → 0) was NEVER stated. NOT a re-pin.

## THE ROUTE (N248 colourRepV_ne_zero generalized DI → arbitrary D; THE ONE LAW / no bash)
Reduce via `injective_iff_map_eq_zero` (LinearMap coercion of the LieHom). Suppose
`colourRepV D = 0` for `D : colourCentralizer`. Then EXACTLY as N248 step 1-4, generalizing:
1. imRep (D:derivationLieQ) vanishes on `range chargeOp` (via range_chargeOp_map_eq_Vsub + colourRepV_coe).
2. imRep (D:derivationLieQ) kills sgl (`colour_kills_sgl (D:derivationLieQ) D.2`).
3. imRep (D:derivationLieQ) = 0 on `ker chargeOp ⊔ range chargeOp = ⊤` (ker_sup_range_chargeOp, chargeOp_ker) → imRep D = 0.
4. (D:derivationLieQ) = 0 by faithfulness of the 7-rep (imRep_injective).
5. D = 0 in colourCentralizer (Subtype.ext).

All 5 levers are banked theorems (N248/N245/N244/N22). Pure structural — NO coordinate bash.

## GO / NO-GO
- GO iff the probe (injective_iff_map_eq_zero form + the 5-step body) elaborates net-of-import ≤ ~40s.
- NO-GO → if the LieHom→LinearMap coercion for injective_iff_map_eq_zero resists, try
  `LinearMap.ker_eq_bot` on colourRepV.toLinearMap, or the direct `intro D E h` + subtraction.
  These are INSTRUMENT choices (W5), not target weakening. The TARGET (Injective) is fixed.

## KILL CLASSES (any → STOP, reframe; do NOT grind)
- K1 net-of-import compile of the injectivity probe > 90s → instrument wall (W9); the proof is
  structural (5 banked levers, no ring/decide/simp-blowup) so this would signal a typeclass-synthesis
  trap (subtype depth, N248 note) → route via Vsub/LinearMap coercion, NOT nested subtypes.
- K2 any need to raise maxHeartbeats above default → STOP (W9 signature).
- K3 the reduction fails because a lever's TYPE differs from N248's usage → re-check banked signature,
  do NOT invent a hypothesis.
- K4 finding the target needs an unbanked fact → NAME it, child a gather-side route-finding node
  (NOT the ascent), block.

## COMPILE-COST BUDGET
Imports ~30-50s here. Net-of-import target ≤ 40s (this is a single structural theorem; the module
already has all levers imported via N248 tail). KILL at 90s net-of-import.

## COSTUME (next id C280)
Anchor on a genuine quantitative fact in the FAITHFUL-EMBEDDING role. Candidate:
`finrank_colourCentralizer_eq_eight = 8` (the DOMAIN of the faithful embedding — the full dim-8
su(3) that embeds injectively). Pair (280, 8) — RHS 280 fresh; LHS finrank_colourCentralizer
in a NEW role (the faithful-embedding domain dimension, distinct from C278's use in the
reductive-gauge-Lie dimension 9=1+8). Bites: `min 280 (finrank colourCentralizer.toSubmodule) = 8`,
bogus claims = 280, reduces to 8 = 280 (false). Confirm RHS 280 distinct from all prior.

## W8 NON-VACUITY
The rep is genuinely faithful AND genuinely nontrivial (already have colourRepV_ne_zero, N248):
image = the FULL dim-8 su(3) embedded, NOT collapsed to 0. Costume must BITE.

## STANDARD
unbroken (imports only banked N248 tail + levers) / complete (#print axioms ⊆ {propext,
Classical.choice, Quot.sound}, no sorry/axiom/native_decide) / physics-words-removable
(delete colour/su(3)/faithful/charge: `colourRepV` injective is pure algebra — a Lie hom whose
kernel is ⊥). Gate-green NECESSARY not SUFFICIENT (W7).

## COMPLEX-FIELD WARNING (as N242-N248): keep everything DERIVED REAL; no ℚ[i]-as-ground;
Algebra ℚ (Dbl ℚ) NOT banked; TensorProduct absent. Faithful su(3)-module = the REAL statement
`Function.Injective colourRepV`.
