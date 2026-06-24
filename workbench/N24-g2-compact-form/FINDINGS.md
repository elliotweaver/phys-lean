# N24 FINDINGS — workbench measurements (W6/W9), reconnaissance NOT the deliverable.

## Numerics re-verified (W6, exact-rational)
- workbench/N23-g2-compact-form/route_probe.py re-run: orbit-span 7 from every imaginary unit;
  generated associative algebra in End(ImO) = full 49-dim (Burnside ⟹ absolutely irreducible);
  Killing K block-diagonal 7×[[-16,±8],[±8,-16]]; τ(i,j)=tr(ρDi ρDj)=(1/4)K (the 7-rep trace
  form is proportional to Killing).
- /tmp/skewcheck.py: c_l(z)=c0(z·star e_l); all 14 derivations skew (M=-Mᵀ in the std coord basis);
  B(D,D)=tr(M²)=-Σ M_ij² (sample k); reQ(Dx·star y)+reQ(Dy·star x)=0; reQ(Dx·y)+reQ(x·Dy)=0;
  c_k(De_l)+c_l(De_k)=0.

## THE TRUNK DISSOLUTION (the route, THE ONE LAW)
The compact signature (invariant C, the ticket's feared 14×14 W9 beast) DISSOLVES: derivations
are skew-adjoint for the positive-definite Born form (banked N17 `deriv_skew_polar` +
N18 `deriv_maps_im`). So the DEFINING (8-dim, cheap) trace form B(D,E)=tr_O(D∘E) satisfies
B(D,D) = -Σ_j g(D bО_j, D bО_j) ≤ 0, = 0 ⟺ D=0. Negative-definite ⟹ nondegenerate. We use the
CHEAP 8-dim defining trace form (NOT the 14×14 adjoint Killing), and definiteness = skew-adjointness
+ sum-of-squares positivity, NO nested determinant. Semisimplicity (B) follows FREE from
nondegeneracy via Mathlib `LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate`.

## Lean MEASUREMENTS (all GREEN, each ≪ 90s KILL budget) — scratch/probe{1..6}.lean
- probe1: `LieModule.toEnd ℚ derivationLieQ (O ℚ) x m = (x:End) m` is `rfl`; trace reduction
  `trace f = Σ_i bO.repr (f (bO i)) i` via `trace_eq_matrix_trace` + `toMatrix_apply`. (9s)
- probe2: `coordO` linear equiv from the 8 banked functionals (left_inv by structure destructure);
  `gForm_self_sum_sq` (needs CD.add_re/im in simp set); `coord_eq_g0` orthonormality. (8s)
- probe5: ★ `gForm_skew_Z` abstract skew-adjointness g(Dx,y)+g(x,Dy)=0 — structural, via
  `deriv_skew_polar` + `deriv_maps_im` + reQ_star/add/neg + two conjugate-reversals + linarith. (8s)
- probe6: ★ orthonormality bridge `coord_eq_gForm : coordO z j = gForm z (bO j)` (fin_cases j);
  trace reduction `trace_eq_sum_coord : trace f = Σ_j coordO (f (bO j)) j`
  (`Module.Basis.coe_ofEquivFun` / `ofEquivFun_repr_apply`, NOT `ofEquivFun_apply`). (12s)

## API names pinned
- `Module.Basis.ofEquivFun` (not `Basis.ofEquivFun` namespace), `coe_ofEquivFun`, `ofEquivFun_repr_apply`.
- `LinearMap.trace_eq_matrix_trace ℚ b`, `Matrix.trace`, `Matrix.diag_apply`, `LinearMap.toMatrix_apply`.
- `LieModule.traceForm ℚ derivationLieQ (O ℚ)`, `traceForm_apply_apply`, `traceForm_lieInvariant`,
  `traceForm_isSymm` (.isRefl), `LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate`.
- `derivationLieQ` auto-gets `LieRingModule`/`LieModule ℚ` over `O ℚ` (LieSubalgebra.lieRingModule/lieModule).

## ROUTE TAKEN
Bank in `Phys/Algebra/DerivationCompact.lean`: coordO/bO, gForm + orthonormality, skew-adjointness,
trace = -Σ sq (negative semidef), definiteness (B(D,D)=0 ⟹ D=0), nondegeneracy, and — stretch —
semisimplicity via the InvariantForm bridge. Costume C44: nonzero witness in the radical / B(wit,wit)=0
must FAIL (B(wit,wit) = -4 < 0). Irreducibility (A) + simplicity (D) + automorphism Lie GROUP childed N25.
