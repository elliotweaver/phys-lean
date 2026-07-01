# N231 PREREG — THE AMBIENT g₂-EQUIVARIANT PROJECTORS ONTO THE FUNDAMENTAL 7 AND ADJOINT 14

## Front chosen (measure-first, W4.5 look WIDEST, under the OVERNIGHT LOCK — gather side)

The FIRST-named §N230-superseded gather front: lift N226's `projFun` (the projector *within* the
`↥so(7)` subtype onto the fundamental 7 `funIn` along the adjoint 14 `adjIn`) to genuine **ambient
projectors on `End ℚ ImO`**, refining N229's `projSo7` (the whole-End→so(7) retraction) into the
`so(7) = 14 ⊕ 7` ambient idempotent pair — the skew-side mirror of what N228→N230 set up on the
symmetric side. Then bank the resulting THREE-WAY RESOLUTION OF IDENTITY on `End ℚ ImO`:

    projSym X + proj7 X + proj14 X = X     ( Sym²7 (28) ⊕ 7 ⊕ 14 = 49 ).

This stays on the gather (the `7⊗7` arena of the gluing obstruction), extends the strand concretely
on the banked tower, is genuinely NEW (N226 lived in the subtype; the AMBIENT idempotents onto
`range crossEmb` and `range imRepL` are new objects), and sets up N232 (the symmetric-side ambient
refinement P₁/P₂₇ completing the full four-way `1 ⊕ 7 ⊕ 14 ⊕ 27`).

## Objects (derived, not posited — all on the banked tower)

- `projSo7cod := LinearMap.codRestrict skewAdjointSubmodule projSo7 projSo7_apply_mem`
  : `End ℚ ImO →ₗ ↥so(7)` — corestriction of N229's `projSo7` to its range so(7).
- ⭐ `proj7 := so(7).subtype ∘ₗ projFun ∘ₗ projSo7cod : Module.End ℚ (Module.End ℚ ImO)` —
  THE AMBIENT PROJECTOR onto the fundamental 7 `range crossEmb`, along `Sym²7 ⊕ (adjoint 14)`.
- `proj14 := projSo7 - proj7` — THE AMBIENT PROJECTOR onto the adjoint 14 `range imRepL`.

## Claims to bank
1. `proj7_idem` / `proj14_idem` — idempotent (via projFun_projFun, projSo7 idempotence).
2. `proj7_range = range crossEmb` (map/comap subtype + `crossEmb_range_le_so7'`), `finrank = 7`.
   `proj14_range = range imRepL`, `finrank = 14`.
3. `proj7_apply_mem` (image in `range crossEmb`), `proj14_apply_mem` (image in so(7)).
4. `proj7_add_proj14 : proj7 X + proj14 X = projSo7 X` (refines the skew side).
5. ORTHOGONALITY `proj7_proj14`/`proj14_proj7 = 0`; and with projSym:
   `projSym_proj7 = 0`, `proj7_projSym = 0`, `projSym_proj14 = 0`, `proj14_projSym = 0`.
6. ⭐⭐⭐ g₂-EQUIVARIANCE `proj7_equivariant`/`proj14_equivariant`
   (projSo7_equivariant + projFun_equivariant + adSo7_coe/adEnd_apply correspondence).
7. ⭐⭐ THE THREE-WAY RESOLUTION `projSym_add_proj7_add_proj14 : projSym X + proj7 X + proj14 X = X`
   (= projSym + projSo7 = id, via `projSym_add_projSo7`, N230).
8. capstone `ambient_fund_adjoint_projection_structure`.

## Words-removable
Delete g₂/so(7)/fundamental/adjoint/projector: over derived ℚ and `O ℚ = CD(H ℚ)`, for
`ImO = ker(star+1)`, the Born form `bornBil`, `imRep`, `crossEmb`: the ambient idempotent
`subtype∘projFun∘codRestrict projSo7` has range `range crossEmb` (finrank 7), the difference
`projSo7 − proj7` has range `range imRepL` (finrank 14), they are orthogonal, sum to `projSo7`,
each commutes with `X↦⁅imRep D,X⁆`, and together with `projSym` resolve the identity. No physics word
in any statement.

## W9 cost budget / KILL
LIGHT expected — all structural over banked idempotents + Mathlib codRestrict/subtype/map_comap.
NO coordinate ring, NO degree-4 expansion. KILL: if the probe's proj7 idempotence/equivariance
exceeds ~60s or needs a maxHeartbeats proof-search raise (kept N227-N230 synthInstance ceiling only),
STOP and decompose. Measure proj7 (hardest: subtype lift) in probe1 BEFORE writing production.

## Costume
C263 = 7 = 263 (proj7's range GENUINELY finrank 7; a bogus collapse forces 7 = 263 in ℕ).
Pair (263,7) fresh; RHS 263 distinct from every prior right-hand value.

## Next
Child N232 (single-flight tail): the symmetric-side ambient refinement (P₁ trivial-line / P₂₇
traceless-27 via trace) completing the full FOUR-WAY resolution `1 ⊕ 7 ⊕ 14 ⊕ 27 = id`.
