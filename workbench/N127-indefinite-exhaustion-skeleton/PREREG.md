# N127 — PREREG (frozen before banking)

## NODE SPECIFICATION (against what the chain ACTUALLY produced)
N125 banked the ANISOTROPIC peel oracle `houseHolderM_oracle`: a BvC-isometry T with a moved v
whose DIFFERENCE a := Tv−v is anisotropic (BvC a a ≠ 0) admits ONE reflection houseHolderM a
that GROWS the fixed subspace (finrank fixSubmoduleM T < finrank fixSubmoduleM (R·T)).
N126 banked `houseHolderM_null_peel_back`: a BvC-isometry with anisotropic moved v is peeled
BACK by ≤ 2 reflections even when Tv−v is null — but ONLY as a send-back R(Tv)=v, NOT as a
fixed-subspace growth.

ROADMAP §N127 priority (i): THE INDEFINITE FINRANK-STRONG-RECURSION ASSEMBLY — adapt N123's
abstract Cartan–Dieudonné descent (`reflection_exhaustion` over 8-dim O Cut) to the indefinite
signature over the 10-dim STVC, where the local peel is N125's single reflection (anisotropic
difference).

### MEASURE-FIRST FINDING (by HAND, NOT guessing — the priority-(i) KEY MEASURE):
Does the N126 two-reflection composite GROW the fixed subspace? For a T-fixed u and the composite
R = houseHolderM v ∘ houseHolderM (Tv+v): R fixes u iff u is BvC-orthogonal to BOTH v and Tv+v.
A T-fixed u satisfies BvC a u = 0 (a := Tv−v, the N125 ortho fact) but NOT necessarily BvC v u = 0
(equivalently BvC(Tv+v) u = 0). So the subset-inclusion fixSubmoduleM T ⊆ fixSubmoduleM(R·T)
**FAILS** for the two-reflection (null) case — the reflections disturb previously-fixed vectors not
orthogonal to v. The null/totally-isotropic peel needs the classical dimension-RESTRICTION recursion
(fix an anisotropic vector, restrict to its non-degenerate orthogonal complement), NOT the
fixed-subspace-growth recursion. This is the HEAVY remainder (childed N128).

### THE IMMEDIATELY-BANKABLE STRUCTURAL PIECE (this node, N127):
The indefinite finrank-strong-recursion SKELETON over STVC + the concrete reduction via N125's
anisotropic oracle. It REDUCES the full SO⁺(1,9) exhaustion to a SINGLE crisp remaining question
(every non-identity BvC-isometry has SOME moved vector with anisotropic difference) — the indefinite
analogue of N123's skeleton, with the same shape, dimension 10 instead of 8.

## GO / NO-GO (frozen)
- GO if: the skeleton `reflection_exhaustion_M` (every BvC-isometry ∈ Submonoid.closure refl given
  the peel oracle) + the base case `isom_fix_full_eq_id_M` (finrank=10 ⟹ id) + the concrete
  anisotropic reduction `reflection_exhaustion_M_aniso` (plug in houseHolderM_oracle) all compile
  clean, foundations-only, with a genuinely-indefinite W8 witness; costume C159 (1=127) bites a
  wrong indefinite-exhaustion/finrank claim.
- NO-GO if: the skeleton resists (it should not — it is N123's structure over dim 10). Then honest
  W1 dissolution ticket + block.

## KILL BUDGET (W9 — instrument failure threshold)
- Each obligation: 90s isolated-typecheck KILL. probe1 (skeleton + reduction) MEASURED 43s, probe2
  (W8 witness) 31s — both well under. NO inflated maxHeartbeats, NO native_decide, NO brute.
- If any production obligation exceeds 90s: declare INSTRUMENT failure, decompose, do NOT grind.

## WHAT IS CHILDED (N128): the oracle discharge — the genuine heavy group-manifold core:
EITHER (a) prove every non-identity BvC-isometry has a moved vector with anisotropic difference
(the totally-isotropic existence question: does a T≠id with EVERY moved v null exist over Cut?),
OR (b) the dimension-restriction recursion for the totally-isotropic case (a null v plus an
anisotropic auxiliary in its span, restrict to the orthogonal complement). Plus the boost/rotation
block decomposition (iii) and operator topology over Cut (iv).
