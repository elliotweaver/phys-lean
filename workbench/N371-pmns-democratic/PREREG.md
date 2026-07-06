# PREREG — N371 (arc-F F5): the PMNS trimaximal column + tri-bimaximal leading-order structure

## TARGET (selected via SELECT S1–S5, anti-bullshit gate passed IN FULL, comments 275–276)
The neutrino mixing completion (§F5). Two theorem-grade cores + one leading-order structural theorem:

**CORE 1 (theorem-grade, from N336).** The massless neutrino's PMNS column is TRIMAXIMAL. The
banked self-blind democratic direction `selfDir=(1,1,1)` (N336 `selfDir_zero_mode`, the m₁=0
zero-mode) has equal normalized Born component-weight `1/3` on every flavor — the column is exactly
equipartitioned. `demColumnWeight α = 1/3`; the three sum to 1 (unitarity).

**CORE 2 (theorem-grade).** The LARGE-vs-SMALL dichotomy. The trimaximal weight `1/3` is strictly
LARGER than each banked CKM Born-weight angle (N343 `sinSq12/23/13_hi`) — the theory-native reason
lepton mixing is large where quark mixing is small: the ν frame is DEMOCRATIC (self-blind, m₁=0),
the quark frames HIERARCHICAL. Same frame-overlap machinery, different frame.

**STRUCTURAL (leading-order, flagged).** The full tri-bimaximal PMNS matrix from magic + μτ symmetry.
A μτ-symmetric magic real-symmetric operator `muTauMagic a b c d = !![a,b,b; b,c,d; b,d,c]` over the
derived ℝ Cut has the TBM Fourier eigenvectors:
  - `tbmV2=(1,1,1)` (= `selfDir`, trimaximal), eigenvalue `a+2b`, when magic `a+b=c+d`  [DERIVED from N336]
  - `tbmV1=(2,−1,−1)` (solar), eigenvalue `a−b`, when magic
  - `tbmV3=(0,1,−1)` (atmospheric, bimaximal), eigenvalue `c−d`, from μτ alone
These give the exact rational PMNS |U|² weights: reactor `sin²θ₁₃=0`, atmospheric `sin²θ₂₃=1/2`
(maximal), solar `sin²θ₁₂=1/3` — the tri-bimaximal angles, √ dissolving through Born-square (as N343).
Non-vacuity: eigenvalues distinct (mass splitting), trimaximal can be massless (a+2b=0, ties N336),
orthonormal Fourier modes.

## GRADE (carry honestly, seed §F5 HONEST GRADE)
- CORE 1 + CORE 2 (trimaximal column = self-blind direction; large-vs-small vs banked CKM):
  THEOREM-GRADE, foundations-only over Cut, grounded on N336 selfDir + N343 CKM angles.
- The TBM completion: LEADING-ORDER. `magic` is DERIVED (the trimaximal eigenvector IS the N336
  massless self-direction). `μτ (2↔3) exchange` symmetry is the leading-order structural input —
  the 3 generations are the hierarchical cascade rungs ℂ→ℍ→𝕆 (not literally 2↔3-symmetric), so the
  μτ-symmetric operator is a leading-order model whose eigenvectors are the TBM Fourier modes.
  Built as a CONDITIONAL theorem (given the μτ-magic structure, the eigenvectors/angles follow).
- m₁=0 / normal ordering: re-exported from N336 (`self_generation_massless`). The standing DESI
  Σm_ν fight + the joint kill-line: REMOVABLE PROSE only, NEVER fit.

## DISCIPLINE
- No empirical PMNS angle / Σm_ν / decimal in any proof (G1/G2). Comparison = removable prose.
- Physics-words-removable (G5): every theorem pure Cut-matrix analysis (self-direction weights,
  magic+μτ eigenvectors, rational fractions).
- Foundations-only ⊆ {propext, Classical.choice, Quot.sound} (G6). Ground field = derived Cut.
  NO Mathlib-ℝ as content; Matrix is MACHINERY.
- NOT free-floating: CORE types cite banked `selfDir` (N336) + `sinSqMix mass1/2/0` (N343); the TBM
  trimaximal eigenvector IS `selfDir`. Grounded on the tower.
- W8 costume C396: a wrong claim (trimaximal weight ≠ 1/3, or ν angle not large vs CKM) must bite.

## COMPILE-COST BUDGET / KILL (W9)
All obligations are `simp <;> linarith/ring/norm_num` over 3×3 Cut matrices with Fin.sum_univ_three
— bounded, no coordinate blowup. probe.lean (~9.5s) + probe2.lean both EXIT 0. KILL: if any single
obligation exceeds ~60s or needs maxHeartbeats raise, STOP and decompose. Expected olean LIGHT ~15s.

## ONE-SUCCESSOR RAIL
When F5 lands: ONE directed child toward F6 (the dissolution theorems + the arc-G G1 handoff), OR a
decompose-remainder child. Fork check before complete.
