# PREREG — N242 THE EXPLICIT OPPOSITE CHARGE EIGENVALUES (±i) of the two triplets
# frozen BEFORE production compute. task t_79d71d83. gather-side hypercharge front, under the LOCK.

## THE FRONT (owner-authorized, gather-native, NOT the parked ascent)
N240 banked chargeOp = crossOp u1 with chargeOp² = ⟨u1,y⟩•u1 − y (a complex structure on
V = 3 ⊕ 3̄). N241 banked that crossOpO u1 = JO on V, EXCHANGES Uhol ↔ Uah, squares to −id.
The DESTINATION: make the ±i eigenvalue structure EXPLICIT — the opposite numeric charge
eigenvalues of the two triplets, DERIVED from the gather obstruction.

## THE DECIDED TARGET (ONE target, no menu)
The MINIMAL POLYNOMIAL of the restricted REAL charge operator chargeOpV := (crossOpO u1)|_Vsub
is minpoly ℚ chargeOpV = X² + 1, whose two roots are the OPPOSITE pair ±i (named ONLY as the
roots — the derived complex unit ±J of Dbl ℚ, J²=−1). The charge operator carries NO rational
eigenvalue (the field is on the imaginary axis); its eigenvalues are the explicit opposite pair
±i. This is the honest "explicit ±i eigenvalue realization": V and chargeOp stay DERIVED REAL
objects, ±i is named as the roots of the minpoly (the blessed metalanguage), NO ℚ[i]-as-ground,
NO TensorProduct (measured ABSENT from Phys — complexification-via-tensor would be heavy new
machinery + the unearned-import risk the ticket warns against).

## UNEARNED-IMPORT WARNING LIGHT — cleared
- Algebra ℚ (Dbl ℚ) is NOT banked (measured: synthInstanceFailed) and NO TensorProduct exists in
  Phys. So a complexification V ⊗ ℚ[i] route is NOT available cheaply AND would risk building the
  derivation OVER ℚ[i] as ground — the exact trap. REJECTED.
- The minpoly route keeps chargeOpV : Module.End ℚ Vsub as a DERIVED REAL operator on the banked
  real 6-space Vsub. ℚ[X] is the metalanguage (polynomial machinery on the derived operator, like
  Fin-arity or propext). ±i appears ONLY as "the roots of X²+1" = ±J, the derived Dbl ℚ complex
  unit. This is naming eigenvalues of a derived real operator, NOT content over ℚ[i]. CLEARED.

## FREE-FLOATING / UNBROKEN check (SOUL rail)
Every headline TYPE mentions the banked tower objects: chargeOpV is built from crossOpO u1 (N223)
restricted to Vsub (N42c); minpoly ℚ chargeOpV = X²+1 is ABOUT the concrete gather charge operator
on the banked real V, NOT a generic "complex structure has ±i eigenvalues" over an arbitrary
module. Extends the strand N240 + N241 + N42c. NOT a fork.

## PLANNED PRODUCTION DECLS (Phys/Algebra/TowerGatherForcedChargeEigenvalues.lean)
- Vsub_map_crossOpO         : Vsub.map (crossOpO u1) = Vsub  (from N241 map-equalities + N42c sup)
- crossOpO_u1_mapsTo_Vsub   : ∀ v ∈ Vsub, crossOpO u1 v ∈ Vsub
- chargeOpV                 : Module.End ℚ Vsub := (crossOpO u1).restrict …  (THE restricted op)
- chargeOpV_coe             : subtype-native coe
- chargeOpV_sq              : chargeOpV.comp chargeOpV = −id  (the complex structure on V)
- chargeOpV_aeval           : aeval chargeOpV (X²+1) = 0
- chargeOpV_monic_wit       : (X²+1).Monic
- chargeOpV_integral        : IsIntegral ℚ chargeOpV
- charge_poly_no_root       : ∀ q:ℚ, ¬ IsRoot (X²+1) q  (fold self-overlap positivity q²+1 ≥ 1 > 0)
- charge_poly_natDegree     : (X²+1).natDegree = 2
- charge_poly_irreducible   : Irreducible (X²+1)  (degree-2 no-root, SpecificDegree)
- nontrivial_Vsub           : Nontrivial Vsub  (finrank 6 > 0)
- ★ chargeOpV_minpoly       : minpoly ℚ chargeOpV = X²+1   (THE HEADLINE: the ±i eigenvalue poly)
- ★ chargeOpV_no_rational_eigenvalue : ∀ μ:ℚ, ¬ HasEigenvalue chargeOpV μ  (no real charge value)
- Dbl_J_root / Dbl_negJ_root: (±J)²+1 = 0 in Dbl ℚ   (the roots ARE the derived complex unit ±i)
- Dbl_J_ne_negJ             : J ≠ −J  (the two eigenvalues are opposite AND distinct — W8 teeth)
- forced_charge_eigenvalues_structure : capstone bundling all headlines

## W8 ANTI-VACUITY (costume C273)
Anchor: min 273 (natDegree (minpoly ℚ chargeOpV)) = 2  (TRUE, via chargeOpV_minpoly).
BOGUS: = 273. Reduces to false numeric 2 = 273. Pair (273, 2) fresh, RHS 273 distinct.
Teeth in-module: Dbl_J_ne_negJ (opposite, distinct), chargeOpV_no_rational_eigenvalue (genuinely
on the imaginary axis, no real value), chargeOpV_sq (nonzero complex structure).

## W9 MEASURE-FIRST — DONE (all before production)
- probe6 (full spine incl. minpoly = X²+1, irreducibility, no-eigenvalue) compiled EXIT 0 in 24s.
- probe7 (±J roots, J ≠ −J) compiled EXIT 0 in 9s.
- Every lever pointwise-banked; NO coordinate bash, NO maxHeartbeats raise, NO TensorProduct.
- KILL = 90s/obligation. Nothing approaches it (whole spine < 30s). Whole-module olean est. ~15s.

## STANDARD (words-removable)
Delete "charge/hypercharge/eigenvalue-as-charge/particle/antiparticle/triplet/i": over ℚ and
O ℚ = CD (H ℚ), the restriction of the endomorphism crossOpO u1 to the span Vsub has minimal
polynomial X²+1, which is irreducible over ℚ (no rational root, q²+1 > 0) so the operator has no
rational eigenvalue; the two roots of X²+1 are ±J for the derived Dbl ℚ unit J (J²=−1), opposite
and distinct. No theorem statement needs a physics word.

## GO/NO-GO
GO: probe6 + probe7 both EXIT 0, all names free (grep 0), costume next C273. All satisfied.
NO-GO triggers (none hit): any obligation > 90s; any need for Algebra ℚ (Dbl ℚ) / TensorProduct as
CONTENT; any drift into End ℚ (End ℚ ImO) / the 2401-dim ascent arena.
