# N229 PREREG — the g₂-equivariant projector End ℚ ImO → so(7) along Sym²7

## Front chosen (of the roadmap's WIDEST list, under the OVERNIGHT GATHER LOCK)
The **g₂-equivariant projector End ℚ ImO → so(7) along Sym²7** — the retraction of the full
endomorphism space (7⊗7 = 49) onto the banked so(7) (= Λ²7 = 21, N225/N227), COMMUTING with the
adjoint g₂-action `adEnd D`. This is the first roadmap-listed front ("EITHER the g₂-equivariant
projector End ℚ ImO → so(7) along Sym²7 (selfSkew_isCompl.projection, the retraction of End onto
the banked so(7), commuting with adEnd D)").

It is ONE LEVEL UP from N226 (which projected *within* ⁅so(7)⁆ onto crossEmb(7) via comap/subtype
juggling): here the projector is a clean self-map of `End ℚ ImO`, no subtype gymnastics — it
retracts the whole 49 onto the 21 so(7) along the symmetric 28.

## Why on-target / not a fork (SOUL free-floating rail)
Every headline TYPE mentions the banked tower objects: `bornBil` (N223/N225), its
`skewAdjointSubmodule` (= so(7)) and `selfAdjointSubmodule` (= Sym²7, N227), `adEnd D` (N227),
`derivationLieQ` (N22), `ImO` (N22). The projector is built from `selfSkew_isCompl` (N227) via
Mathlib's `IsCompl.projection` as MACHINERY. Nothing carrier-agnostic; nothing posited. Extends
the strand (7⊗7 g₂-module decomposition arc N225→N226→N227→N228), does not fork.

## Obligations (measured BEFORE committing — W9)
The whole construction was measured by compiling `probe1.lean` standalone against the built
oleans: **22.5 s, EXIT 0, no errors, no warnings.** Every obligation closes via the banked
`selfSkew_isCompl` + `skewAdj_adEnd_inv` + `selfAdj_adEnd_inv` + `finrank_so7_eq_21` and Mathlib's
`IsCompl.projection` API (`projection_isIdempotentElem`, `projection_range`, `projection_ker`,
`projection_apply_left`, `projection_apply_eq_zero_iff`, `projection_apply_mem`). No coordinate
`ring`/`decide`; no proof-search heartbeat raise. The only `set_option` is the N227/N228
`synthInstance.maxHeartbeats 1000000` for the ℚ-End instance diamond (an INSTANCE ceiling, allowed
— not a proof-search raise).

Declarations (all foundations-only, confirmed by the clean compile):
- `skewSelf_isCompl` — so(7) complementary to Sym²7 (`selfSkew_isCompl.symm`).
- `projSo7 : Module.End ℚ (Module.End ℚ ImO)` — the projector (self-map).
- `projSo7_idem` — idempotent.
- `projSo7_range = skewAdjointSubmodule bornBil` (= so(7)).
- `projSo7_ker = selfAdjointSubmodule bornBil` (= Sym²7).
- `finrank_projSo7_range = 21` — the projector lands ONTO the FULL 21-dim so(7).
- `projSo7_apply_skew` / `projSo7_apply_self` — fixes so(7), kills Sym²7.
- `projSo7_apply_mem`, `projSo7_projSo7` — image in so(7), idempotence pointwise.
- ★★★ `projSo7_equivariant` — `projSo7 (adEnd D X) = adEnd D (projSo7 X)`: the projector
  COMMUTES with the g₂-action (genuine morphism of g₂-modules).
- capstone `end_projection_so7_structure` — bundles idempotent + range + ker + finrank 21 +
  equivariance.

## Cost budget / KILL
Whole file measured at ~22 s standalone. KILL: if the production build of this single module
exceeds ~5 min, or any single obligation is individually shown to blow up, STOP and decompose —
but the probe already compiled whole in 22 s, so no decomposition is anticipated.

## Costume
C261 = `21 = 261`: the projector's range is GENUINELY the full 21-dim so(7)
(`finrank_projSo7_range = 21`); a bogus claim that the retraction lands on something of a
different dimension forces `21 = 261` in ℕ. Pair (261, 21) fresh (RHS 261 > all prior RHS).

## Words-removable
Delete g₂/so(7)/Sym²7/projector: over derived ℚ and O ℚ = CD(H ℚ), for `End ℚ ImO` with the Born
form's skew and self submodules (complementary, N227), the `IsCompl.projection` onto the skew side
is idempotent, has range the skew submodule (finrank 21), kernel the self submodule, and commutes
with `X ↦ ⁅imRep D, X⁆`. No theorem statement needs a physics word.
