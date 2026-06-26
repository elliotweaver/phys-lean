# N70 PREREG — THE DEFLATION / PEEL-OFF ENGINE (the inductive step of spectral existence)

FROZEN before compute. KILL classifies a fight as INSTRUMENT failure (W9), not theory.

## TARGET (the immediately-bankable structural escalation; W1/W9 MEASURE-FIRST priority (i))
The heavy frontier — FULL n-dim spectral existence for an ARBITRARY operator, the GLOBAL
polar/KAK assembly, connectedness, the GLOBAL reverse KAK surjectivity, the Spin(9)→SO(9)
exhaustion — needs group-manifold machinery Mathlib lacks over `Cut`. Per W3, that heavy
remainder is CHILDED N71. THIS node banks the roadmap's named priority-(i) lever:

  THE DEFLATION / PEEL-OFF ENGINE — the inductive STEP of the spectral existence theorem.
  Given an EvC-self-adjoint operator `g` and an eigenpair `(l, u)` with `u` an EvC-unit
  (`EvC u u = 1`, `g u = l • u`), the deflated operator `deflateC g l u := g - l • projC u`:
    (1) is still EvC-self-adjoint,
    (2) ANNIHILATES the peeled eigenvector (`deflateC g l u u = 0`),
    (3) has its ENTIRE IMAGE EvC-orthogonal to `u` (`∀ w, EvC u (deflateC g l u w) = 0`)
        — so the EvC-orthogonal complement of `u` is invariant and the recursion stays inside
        a strictly smaller space.
  These three ARE the complete inductive step of the spectral theorem: peel one eigenpair,
  restrict to its EvC-orthogonal complement, recurse. N63–N69 banked the FORWARD direction
  (a given/constructed eigen-family ⇒ the diagonal operator + its root); deflation is the
  REVERSE engine (an operator + one eigenpair ⇒ a strictly smaller operator), the missing
  half of the existence proof.
  Plus the concrete RANK-n reduction: deflating the rank-n spectral operator at its k-th
  eigenpair zeroes coefficient k (`deflateC (specOpN l u)(l k)(u k) = specOpN (update l k 0) u`),
  turning the crank rank-n → rank-(n-1); concretely on N69's coordinate witness
  `deflateC txMix 9 mixA = specOpN ![0,4,25] mix3`.

## GO / NO-GO
GO if, over the DERIVED ℝ `Cut` + the terminal algebra `O Cut`, foundations-only
[propext, Classical.choice, Quot.sound], with NO posited operator calculus / NO Mathlib
spectral theorem / NO Mathlib ℝ/ℂ as content / NO bridge:
  - deflateC defined from banked `projC`/`EvC`; deflateC_apply.
  - deflateC_isEvCSymm  (self-adjointness preserved — via IsEvCSymm_sub).
  - deflateC_eigen_kills (annihilates the eigenvector for a unit eigenpair).
  - deflateC_image_orth  (image EvC-orthogonal to u — the recursion enabler).
  - the concrete rank-3 reduction on txMix: deflateC txMix 9 mixA = specOpN ![0,4,25] mix3.
  - (headline, attempt) general deflateC_specOpN (rank-n peel-off via Function.update).
  - costume C101 bites a WRONG deflation (claims deflation leaves eigenvalue 3 at mixA
    instead of 0) → reduces to false numeric `0 = 3` (DISTINCT from banked C84..C100).
  - STANDARD: unbroken / complete / physics-words-removable.
NO-GO / DECOMPOSE if the general `deflateC_specOpN` (Function.update + Finset sub) fights:
  keep the abstract trio (isEvCSymm/kills/image_orth — already FULLY general for any operator
  + eigenpair) + the concrete rank-3 reduction `deflateC_txMix_fst` (via Fin.sum_univ_three +
  abel, NO update); the abstract trio IS the general inductive step. Bank that; the rank-n
  update form is optional hardening.

## KILL (W9 instrument budget)
Each obligation is pure linear algebra + ordered-field arithmetic over `Cut` — the same engine
as N56–N69 (all compiled <15s cold). KILL = 30s / obligation. If any single obligation exceeds
30s, it is an INSTRUMENT failure: STOP, do not inflate maxHeartbeats, decompose / reframe
through banked identities (abel/module over the projection basis, not coordinate expansion).
NO native_decide, NO inflated maxHeartbeats, NO monolithic brute on expanded coordinates.

## ANTI-VACUITY (W8)
The costume MUST fail to compile, reducing to `0 = 3` (distinct from every banked false numeric).
The positive witness `deflateC_txMix_fst` is non-vacuous: it genuinely zeroes the mixA
eigenvalue of the 10-dim-mixing coordinate witness txMix (N69), reducing its effective rank.

## PHYSICS-WORDS-REMOVABLE
Delete "Lorentz/boost/spectral/eigen*/deflation/peel-off/diagonal/orthonormal/self-adjoint/
positive-semidefinite/isometry/rank/dimension/recursion": what remains is pure math about
`EvC`, `projC`, `specOpN`, `txMix`, `mix3`, `mixA` over the derived `Cut` + `O Cut` — the
linear map `deflateC g l u := g - l • projC u` is EvC-symmetric when g is, sends u to 0 when
`g u = l•u` and `EvC u u = 1`, has image EvC-orthogonal to u, and deflates the spectral sum
by zeroing one coefficient. No theorem STATEMENT needs a physics word.

## BOARD
Single-flight (W4): child N71 (heavy remainder) onto the chain tail, link parent=N70, complete
N70. idempotency-key: phys-novelty-N71-full-ndim-existence-global-polar-kak-connectedness-reverse-surjectivity-spin9.
