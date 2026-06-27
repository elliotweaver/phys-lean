# N84 PREREG — frozen before compute

## MEASURE-FIRST conclusion
The full existence `∀ g, ∃ c u, g = specOpN c u` is a finrank-decreasing deflation
induction on `finrank (uPerp u)`. At each rung it must re-seed an eigenvector INSIDE the
EvC-orthogonal complement `uPerp u`. N79 banked that re-seed only for ODD finrank
(`deflateRestrict_odd_reseed`, via `dim_odd_has_eigenvector`). N83 banked the seed
`cut_selfadj_has_eigenvalue` only on the *whole* `STVC`, not on a submodule. The last
missing lever for the induction to close at BOTH parities is:

  the self-adjoint REAL-EIGENVALUE SEED for an operator on a SUBMODULE `W ≤ STVC` that is
  self-adjoint w.r.t. the AMBIENT EvC form on coercions.

This is exactly the hypothesis shape `deflateRestrict_isEvCSymm` already produces, so it
re-seeds `deflateRestrict` unconditionally (no parity split) — the obstruction N78–N83
worked to remove on STVC, now lifted to every submodule rung.

## TARGET (this node N84)
1. `submodule_selfadj_has_eigenvalue {W : Submodule Cut STVC} (T : Module.End Cut W)
     (hT : ∀ p q : W, EvC (T p : STVC) (q : STVC) = EvC (p : STVC) (T q : STVC)) :
     ∃ μ : Cut, T.HasEigenvalue μ`
   Proof = the N83 seed argument lifted to W: by_contra → charpoly (over W) has no root →
   `cut_no_root_factors_negDisc` (general poly over Cut) → pure neg-disc-quadratic product;
   but each factor `T*T+b•T+c•1` is INJECTIVE on W (complete-the-square on the AMBIENT EvC of
   coercions: `EvC(↑(T(Tv)))(↑v) = EvC(↑(Tv))(↑(Tv))` by hT, then α+bβ+cγ>0 by Cauchy–Schwarz
   `EvC_nonneg` + `EvC_eq_zero_iff` + neg-disc) hence a unit; Cayley–Hamilton makes the unit
   product = 0 — contradiction.
2. `deflateRestrict_reseed` — the UNCONDITIONAL (any-parity) re-seed corollary: drops the
   `Odd` hypothesis from N79 `deflateRestrict_odd_reseed`, instantiating (1) at `W = uPerp u`,
   `T = deflateRestrict`, `hT = deflateRestrict_isEvCSymm`.

## GO / NO-GO
GO if: probe of `submodule_selfadj_has_eigenvalue` compiles foundations-only; the
complete-the-square injectivity ports with the same nlinarith as N78 `selfadj_negDisc_quad_pos`;
production lands + costume C115 bites + gate green — with turns to spare.
NO-GO / DECOMPOSE: if the coercion bookkeeping or Cayley–Hamilton-on-W resists, bank the
injectivity sub-lemma (`submodule_negDisc_quad_injective`) alone + child the seed assembly.
Child N85 = the finrank-decreasing existence induction + assembly into `specOpN c u`.

## KILL budget (W9)
Per-obligation KILL = 180s wall on any single `lake env lean` probe. `lake build Phys` is
cached ~5–35s. If any one obligation exceeds 180s → INSTRUMENT failure: measure/decompose,
do NOT raise maxHeartbeats, do NOT re-run the same monolith. Checkpoint (commit production +
wiring) at ~50% turns; run gate in BACKGROUND; child + complete with turns to spare.

## Costume C115 (W8)
A WRONG submodule-seed / re-seed claim must FAIL to compile, reducing to a false numeric
DISTINCT from the banked battery (… C113 1=15, C114 2=5). Plan: pin a concrete eigenvalue/
finrank fact and assert a bogus value → forced false equation (e.g. `3 = 7`).

## Physics-words-removable
Delete eigen*/seed/self-adjoint/spectral/deflation/re-seed/Lorentz/Spin/SO(9)/isometry →
pure statement: for a finite-dim `Cut`-submodule `W ≤ STVC` and a `Cut`-endomorphism `T`
symmetric w.r.t. the ambient positive-definite form `EvC` on coercions, the charpoly of `T`
has a root in `Cut`. Pure linear-algebra / field math over the derived ℝ `Cut`.
