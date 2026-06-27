# N87 PREREG — THE RESOLUTION-OF-IDENTITY → THE OPERATOR INVERSE (p^{1/2})⁻¹ → THE COMPACT PART k*k = 1

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## TARGET (W3 immediately-bankable structural pieces, MEASURE-FIRST priority (i)→(ii))
Over the derived ℝ `Cut` + the terminal algebra `O Cut`, on the banked N49–N86:

1. **resolution_of_identity** (existence form, the id-trick): `∃ n (u : Fin n → STVC),
   (∀ i j, EvC (u i)(u j) = δᵢⱼ) ∧ ∑ i, projC (u i) = LinearMap.id`.
   ROUTE: `id` is EvC-self-adjoint (`IsEvCSymm LinearMap.id`, trivial); apply N85
   `stvc_selfadj_specExists` → `id = specOpN l u` for an orthonormal `u`; the diagonal reader
   `specOpN_read horth k` reads `l k = EvC (specOpN l u (u k)) (u k) = EvC (id (u k)) (u k)
   = EvC (u k)(u k) = 1`; so `id = specOpN (fun _ => 1) u = ∑ projC u_i`. NO spanning argument.

2. **specOpN_one_eq_sum_projC**: `specOpN (fun _ => (1:Cut)) u = ∑ i, projC (u i)`. (Trivial:
   `1 • projC = projC`.) The bridge from the spectral operator to the projector sum.

3. **specOpN_comp_two** (the TWO-family composition law, generalizing N68 `specOpN_comp` which
   is `l = m`): for an EvC-orthonormal family `u`,
   `(specOpN l u).comp (specOpN m u) = specOpN (fun i => l i * m i) u`.
   ROUTE: same as `specOpN_comp` but two distinct eigenvalue families; `specOpN_EvC_read` collapse.

4. **specOpN_left_inverse / specOpN_right_inverse / specOpN_inverse** (the OPERATOR INVERSE,
   parameterized by the resolution hypothesis): given orthonormal `u` with
   `∑ i, projC (u i) = LinearMap.id` and `∀ i, c i ≠ 0`,
   `(specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) = LinearMap.id` AND the reverse.
   ROUTE: `specOpN_comp_two` → `specOpN (fun i => c i * (c i)⁻¹) u = specOpN (fun _ => 1) u`
   via `mul_inv_cancel₀ (hc i)` → `= ∑ projC u_i = id` (the resolution hypothesis).

## STRETCH (bank if light, else child the global remainder)
5. **specOpN_inv_op_sqrt_exists** / the strict-positive operator inverse of `(p^{1/2})`: for an
   injective `g`, `p = g*g` has all eigenvalues `> 0` (N86 `specExists_eigen_pos`), so
   `p^{1/2} = specOpN (cutSqrt∘c) u` is invertible (each `cutSqrt (c i) > 0 ≠ 0`) PROVIDED the
   resolution holds for the g-family. **The spanning lemma** (every maximal orthonormal family
   resolves the identity) is the genuine remainder — if it resists, child it.
6. The compact part `k := g·(p^{1/2})⁻¹` with `k*k = 1`; CONNECTEDNESS; the GLOBAL reverse KAK
   surjectivity; the `Spin(9)→SO(9)` exhaustion — childed onto the chain tail.

## GO / NO-GO
- GO if obligations 1–4 compile clean foundations-only. They are the resolution-of-identity +
  the operator inverse, the immediately-bankable W3 structural pieces toward `(p^{1/2})⁻¹`.
- Bank 5 if the spanning/g-family resolution probes light; else child.

## KILL (INSTRUMENT budget)
- KILL = 180s per single obligation in a bounded probe. If any one obligation exceeds 180s it is
  an INSTRUMENT failure (W9), NOT a theory failure — MEASURE the smallest sub-obligation,
  DECOMPOSE, or reframe through the trunk. Do NOT inflate maxHeartbeats. Do NOT grind.
- ANTI-TIMEOUT (W9): bank-as-you-go — production + commit the instant obligations 1–4 compile;
  run the gate in BACKGROUND; child + complete with turns to spare.

## NON-VACUITY (W8)
Costume C118 must bite a WRONG operator-inverse / resolution claim, reducing to a false numeric
DISTINCT from the banked battery (… C115 1=7, C116 4=13, C117 36=9). Candidate: a WRONG inverse
eigenvalue — `specOpN c u ∘ specOpN c' u` reading a wrong product at an eigenblock (e.g. claiming
the inverse of eigenvalue 5 is c' with 5·c' = 1 but asserting 5·c' = 1 forces a wrong integer),
or the resolution-of-identity read wrong (a non-unit eigenvalue forced to 1).

## WORDS-REMOVABLE (the test)
Delete Lorentz/spectral/eigen*/orthonormal/diagonal/projection/inverse/resolution-of-identity/
compact/isometry/polar/KAK/Spin/SO(9)/adjoint/positive-definite/self-adjoint → the statements must
stand as pure linear algebra over the derived complete ordered field `Cut` and the
positive-definite symmetric form `EvC`: for an EvC-orthonormal family `{u i}`, the projector sum
`∑ projC u_i` equals `id` (for the family `stvc_selfadj_specExists` returns on `id`), the two
spectral operators compose by pointwise eigenvalue product, and the reciprocal-eigenvalue operator
is a two-sided inverse when no eigenvalue vanishes.
