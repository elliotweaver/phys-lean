# N207 FINDINGS — DERIVATION-INVARIANCE OF THE 7-DIM CROSS PRODUCT (front b, GO)

## Measure verdict (W9, all under 9s, foundations-only)
- Main theorem `octCross_deriv_leibniz` (abstract IsDerivQ D): clean 8.7s, foundations-only.
- Witness coord `octCross_deriv_witness_coord = -1`: clean ~9s.
- All 5 decls foundations-only [propext, Classical.choice, Quot.sound] vs the built olean.

## Why NOT a mechanical Leibniz restatement (W8 non-vacuity / non-triviality)
`octCross x y = x·y + (gForm x y)•1`. Acting with D:
- the product term gives Leibniz `D(x·y) = D x · y + x · D y`;
- the correction term `(gForm x y)•1` maps to `(gForm x y)•(D 1) = 0` (derivQ_one);
- BUT reassembling the RHS `octCross (D x) y + octCross x (D y)` produces an EXTRA correction
  `(gForm (D x) y + gForm x (D y))•1`, which vanishes ONLY by SKEW-ADJOINTNESS `gFormQ_skew`
  (N24/N26): `gForm (D x) y + gForm x (D y) = 0`.
So the invariance is the JUNCTION of two distinct banked invariances — the MULTIPLICATIVE
Leibniz law (N16) AND the METRIC skew-adjointness (N24) — combined into one. If D were NOT
skew-adjoint the identity would be FALSE; it is not a single-rule consequence.

## The connection (the deliverable)
`derivationLieQ_octCross_leibniz`: every element of the banked Lie algebra
`derivationLieQ = Der(O ℚ) = g₂` (N16–N21, carrier of the gauge arc) is a cross-product
derivation. The two faces of the exceptional structure — the octonion product (N205 commutator)
and the antisymmetric vector product (N206 octCross) — share the SAME infinitesimal symmetry
algebra g₂. One symmetry algebra, two faces.

## Wiring + gate
Production: Phys/Algebra/OctonionCrossProductDerivation.lean (5 decls).
Phys.lean L248 import; Audits/AxiomAudit.lean import + 5 #print lines at end.
Costume C239 (1 = 207): genuine coord -1, bogus 207 → ⊢ -1 = 207, exit 1 (bites).
Full Phys build green (3641 jobs).
