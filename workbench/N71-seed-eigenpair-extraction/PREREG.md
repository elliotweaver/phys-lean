# N71 PREREG — THE SEED EIGENPAIR EXTRACTION (the genuine VECTOR eigen-equation that drives the N70 deflation induction)

FROZEN BEFORE COMPUTE.

## The gap (MEASURE-FIRST priority (i))
N68 banked the eigenblock QUADRATIC READER `specOpN_read : EvC (specOpN l u (u k)) (u k) = l k`
— the scalar/quadratic-form value at an eigenblock. The chain has NEVER banked the genuine
VECTOR eigen-equation `specOpN l u (u k) = (l k) • (u k)`. N70's deflation engine
(`deflateC_eigen_kills`, `deflateC_image_orth`) BOTH take `g u = l • u` (the vector eigen-equation)
as an UNFULFILLED hypothesis — nothing in N49–N70 produces a concrete operator satisfying it. So
N70's deflation engine, though proved, has never FIRED on a concrete operator. This node produces
that vector eigen-equation (the SEED eigenpair) and FIRES the N70 deflation engine non-vacuously
on N69's concrete coordinate operator `txMix`.

## GO / NO-GO
GO if, over the derived ℝ `Cut` + the terminal algebra `O Cut`, forward from banked N63–N70:
 (1) `specOpN_eigen` — the GENERAL vector eigen-equation: for an EvC-orthonormal family,
     `specOpN l u (u k) = (l k) • (u k)`. The seed when the eigenbasis is known. NEW (chain had
     only the quadratic reader).
 (2) `txMix_eigen_mixA/mixB/mixW3` — the concrete eigenpairs of N69's coordinate operator:
     `txMix mixA = 9•mixA`, `txMix mixB = 4•mixB`, `txMix mixW3 = 25•mixW3` (genuine vector form,
     NOT the quadratic reader).
 (3) `txMix_isEvCSymm` — `txMix` is EvC-self-adjoint (through `txMix_eq_specOpN`).
 (4) `txMix_deflate_kills_mixA` — N70 `deflateC_eigen_kills` FIRES: `deflateC txMix 9 mixA mixA = 0`,
     now NON-VACUOUS (the eigen-equation hypothesis is SATISFIED by (2)).
 (5) `txMix_deflate_image_orth` — N70 `deflateC_image_orth` FIRES: `EvC mixA (deflateC txMix 9 mixA w)=0`
     for ALL w, NON-VACUOUS — the EvC-orthogonal complement of mixA is an invariant subspace.
 (6) `txMix_deflate_eigen_mixB` — THE INDUCTIVE DESCENT realized: after peeling mixA, mixB SURVIVES
     as an eigenpair of the deflated operator: `deflateC txMix 9 mixA mixB = 4•mixB` (via
     `deflateC_txMix_fst : deflateC txMix 9 mixA = specOpN ![0,4,25] mix3` + `specOpN_eigen`).
NO-GO → honest W1 dissolution ticket + block.

## KILL budget (W9)
KILL = 30s per single obligation. All proofs are short structural rewrites over banked lemmas
(`specOpN_apply` + `Finset.sum_eq_single` + the orthonormality matrix; `deflateC_*` direct
application). NO brute normalizer over expanded coordinates, NO inflated maxHeartbeats,
NO native_decide. If any single obligation exceeds 30s → INSTRUMENT failure, measure/decompose.

## Costume C102
Bites a WRONG eigen-equation reading: `txMix mixA = (7:Cut) • mixA` (the WRONG eigenvalue 7 for the
mixA direction whose true eigenvalue is 9). Reading off the mixA eigenblock via the banked
`specOpN_read`/`mix3_orthonormal` forces `9 = 7`. False numeric `9 = 7` — DISTINCT from the whole
banked battery (8=4 … 36=64, 36=25, 0=3, 9=4, 9=10, …; verified `9 = 7` free).

## Physics-words-removable
Delete eigen/eigenvalue/eigenvector/eigenpair/spectral/deflation/peel/Lorentz/...: what remains is
pure linear algebra over `Cut`/`O Cut` — `specOpN l u (u k) = l k • u k` for `EvC (u i)(u j)=δᵢⱼ`;
`txMix mixA = 9•mixA` etc.; `deflateC txMix 9 mixA mixA = 0`; `EvC mixA (deflateC txMix 9 mixA w)=0`;
`deflateC txMix 9 mixA mixB = 4•mixB`. No theorem STATEMENT needs a physics word.

## W1 heavy remainder → childed N72
Producing the seed eigenpair from an ARBITRARY operator with NO given eigenbasis (the
characteristic-equation / fixed-point root-finding route over `Cut`) + assembling the full induction
over `deflateC` to general n + the global polar/KAK assembly + connectedness + the global reverse KAK
surjectivity + the full Spin(9)→SO(9) exhaustion. Mathlib has no analogue over `Cut`.
