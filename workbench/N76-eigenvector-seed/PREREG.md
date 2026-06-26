# N76 PREREG — THE EIGENVECTOR HALF OF THE 3-DIM SEED (frozen before productionization)

## NODE
N76: the eigenVECTOR half of the seed eigenpair the N70/N74 deflation descent consumes —
given the cubic-root eigenvalue λ (N75 `cut_cubic_has_root`), a NONZERO vector v with T v = λ v.
Over the derived ℝ `Cut` and the terminal algebra `O Cut` (STVC = Cut × Cut × O Cut, 10-dim).

## THE W1 REFRAME (THE ONE LAW) — the trunk dissolves it
N75 banked the EIGENVALUE half: every monic cubic over Cut has a root (cut_cubic_has_root, via the
same IVT engine that built N57 cutSqrt, escalated degree-2→odd). The EIGENVECTOR half is NOT a
determinant-cofactor coordinate grind. It DISSOLVES through Mathlib's general eigenspace machinery
APPLIED TO THE DERIVED FIELD `Cut` (STANDARD §3: Mathlib as MACHINERY on a DERIVED object):
  `Module.End.hasEigenvalue_iff_isRoot_charpoly` : f.HasEigenvalue μ ↔ f.charpoly.IsRoot μ
  `HasEigenvalue.exists_hasEigenvector`         : HasEigenvalue ⟹ ∃ nonzero eigenvector
A root of the characteristic polynomial ⟹ the eigenspace is nonzero ⟹ a nonzero eigenvector
exists. The eigenvalue is supplied by N75 (the cubic root); the eigenvector is the nonzero kernel
element this machinery produces. NO posited operator calculus, NO Mathlib ℝ/ℂ as content — the
field IS the derived Cut, the machinery is the metalanguage.

## PREREQUISITE LEVER (built here, foundations-only): Module.Finite Cut STVC
STVC = Cut × Cut × O Cut. `Module.Free Cut STVC` and `Nontrivial STVC` already resolve;
`Module.Finite Cut STVC` does NOT (only `Module Cut (O Cut)` is registered, not its finiteness).
Built via the structural product equivalences (mirroring DerivationFinrank's ℚ route, over Cut):
  dblProdEquivCut : Dbl Cut ≃ₗ[Cut] Cut × Cut
  hProdEquivCut   : H Cut ≃ₗ[Cut] Dbl Cut × Dbl Cut
  oProdEquivCut   : O Cut ≃ₗ[Cut] H Cut × H Cut
  ⟹ instFinite{Dbl,H,O}Cut, ⟹ Module.Finite Cut STVC by infer_instance.
The finite-dimensionality the charpoly route REQUIRES — DERIVED structurally (2→4→8), no coord basis.

## GO / NO-GO
GO if ALL of:
  (G1) `dim3_has_eigenvector` : ∀ T : End Cut (Fin 3 → Cut), ∃ lam v, v ≠ 0 ∧ T v = lam • v
       — NON-VACUOUS (natDegree = 3 DERIVED from finrank, not assumed) seed at dimension 3,
       eigenvalue = N75 cubic root.  [MEASURED CLEAN 7.7s]
  (G2) `stvc_eigenvector_of_charpoly_root` : ∀ T λ, T.charpoly.IsRoot λ → ∃ v ≠ 0, T v = λ • v
       — the eigenvalue→eigenvector closure over the 10-dim STVC.  [MEASURED CLEAN]
  (G3) `monic_cubic_poly_has_root` : the genuine N75 joint (monic deg-3 poly → root via
       cut_cubic_has_root).  [MEASURED CLEAN 7.5s]
  (G4) all foundations-only [propext, Classical.choice, Quot.sound], gate D0-D6 green,
       costume C107 bites a WRONG eigenvalue/eigenvector claim with a DISTINCT false numeric.

NO-GO / W1 dissolution-ticket-and-block if the full existence ∀ g ∃ c u, g = specOpN c u
(assembling seed + N74 iterated descent) genuinely resists — that is the GLOBAL remainder,
explicitly childed, NOT ground here.

## KILL BUDGET (W9)
KILL = 45s/obligation. Every probe measured ≤ 9s. If any production obligation exceeds 45s it is
an INSTRUMENT failure → measure/decompose, NOT a longer grind. No inflated maxHeartbeats, no
native_decide, no monolithic brute. (None approached — all levers ≤ 9s.)

## SCOPE THIS NODE BANKS vs CHILDS
BANKS: Module.Finite Cut STVC (+ the 3 product equivs), monic_cubic_poly_has_root (N75 joint),
dim3_has_eigenvector (NON-VACUOUS seed eigenvector at dim 3), stvc_eigenvector_of_charpoly_root
(eigenvalue→eigenvector closure over STVC). This COMPLETES the seed eigenPAIR (N75 eigenvalue +
N76 eigenvector).
CHILDS N77: the FULL existence ∀ g, ∃ c u, g = specOpN c u (seed + N74 iterated descent assembled),
the GLOBAL polar/KAK assembly, connectedness, the GLOBAL reverse KAK surjectivity, the full
Spin(9)→SO(9) exhaustion — the genuine global group-manifold remainder.

## WORDS-REMOVABLE
Delete "Lorentz/eigen*/seed/spectral/Spin/SO(9)/isometry/dimension/rank/characteristic": the
statements stand as pure math — over the derived complete ordered field Cut and the CD-double³
O Cut, the product space STVC is a finite-dim Cut-vector space, every monic degree-3 polynomial
over Cut has a root, every endomorphism of a 3-dim Cut-space has a nonzero v with T v = λ v, and
any charpoly root of an endomorphism of STVC yields a nonzero v with T v = λ v.
