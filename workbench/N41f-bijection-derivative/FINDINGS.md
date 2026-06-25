# N41f FINDINGS — run 182

## OUTCOME: DECOMPOSED. Part 1 (the automorphism) BANKED; Part 2 (the derivative) childed as N41g.

## PART 1 — THE BIJECTION / Cut-side ≃ₗ[Cut]/IsAlgAutCut AUTOMORPHISM — BANKED ✓

Built `Phys/Algebra/DerivationOAutomorphism.lean` (12 decls, foundations-only
{propext,Classical.choice,Quot.sound}, committed 8bff5f6). The MEASURE confirmed the matrix-transport
route closes cheaply:

- `coordOCut_expO` (the W9-exposed crux, the tsum intertwining): MEASURED at 8s in scratch. The
  continuous Cut-linear `coordOCut` commutes with the banked-summable `tsum` (HasSum.map ×2, uniqueness
  of sums). Dead, no W9 risk.
- `expOLin` (composition route): manifestly Cut-linear `coordOCut.symm ∘ₗ mulVecLin (expMap M) ∘ₗ
  coordOCut`, equal to `expO` by `coordOCut_expO`. The Cut-linearity comes FOR FREE from the coordinate
  frame — no direct tsum-additivity argument needed.
- `expOEquiv` (the bijection): `LinearEquiv.ofLinear (expOLin D') (expOLin (-D'))`, the two composition
  identities collapsing through `Matrix.mulVec_mulVec` + `derivMatrix_neg` to the banked N40
  `expMap_mul_neg`/`expMap_neg_mul`. The inverse of the flow IS the flow of the negated derivation.
- `expO_one` (unital): `deriv_one_eq_zero` (`D 1 = 0` from `D 1 = D(1·1) = 2 D 1`) kills every higher
  term; only the n=0 term `(1/0!)•1 = 1` survives.
- `expOEquiv_isAlgAut` (THE HEADLINE): `IsAlgAutCut (expOEquiv D')` = multiplicative (banked N41e
  `expO_mul`) + unital. The literal Der(𝕆)→Aut(𝕆) at the group end.

Whole production file: 20s. NO content trap (only banked Phys import; HasDerivAt/NormedSpace appear only
in negating prose). NO bridge.

## PART 2 — d/dt exp(tD)|₀ = D — GENUINE HARD CORE, CHILDED N41g

MEASURED: the difference quotient `(expO (t•D) x − x)/t → D x` as `t → 0` is a `Tendsto` over the
filter `𝓝[≠] 0` on a CONTINUOUS parameter `t : Cut`. The reduction is clear:
  - `(t•D').restrictScalars ℤ ^ n) x = t^n • (D'^n x)` (via `smul_pow`, MEASURED clean), so
    `expO (t•D) x = ∑' n, (t^n/n!)•(D'^n x)`: n=0 → x (cancels), n=1 → t•(D x), tail O(t²).
  - In coordinates: `coordOCut (expO (t•D) x) = expMap (t • derivMatrix D') *ᵥ coordOCut x`, reducing
    the whole thing to the ENTRYWISE matrix-exponential derivative `d/dt expMap(tM)|₀ = M`.

THE GENUINE OBSTRUCTION (why it is its own node, NOT a cheap closer): the banked trunk-native limit
infrastructure over the derived ℝ `Cut` is SEQUENCE-only (`cut_tendsto_atTop_ciSup`/`ciInf`/`isLUB`,
`tendsto_const_nhds`, the N37 Cauchy-completeness — all `atTop` over ℕ). There is NO banked
continuous-parameter `𝓝[≠] 0` difference-quotient / function-limit-at-a-point machinery, and NO banked
remainder-tail bound `∑_{n≥2} t^n M^n/n! = O(t²)` with the order-topology squeeze. Building that
trunk-native continuous-limit + tail-squeeze infrastructure (NOT Mathlib `HasDerivAt`, an
ℝ/`NormedField`-valued-derivative CONTENT TRAP) is a substantial dedicated analytic node.

This is W1 "Mathlib/our-library lacks the structure → BUILD it" + W3/W9 "decompose aggressively,
finalize early with turns to spare" — NOT a fight with the theory (THE ONE LAW): the reduction is
clean; the missing piece is genuinely-new continuous-limit infrastructure over the derived continuum.
Childed as N41g onto the chain tail.
