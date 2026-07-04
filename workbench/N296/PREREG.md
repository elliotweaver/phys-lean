# N296 — PREREG (route-finder: SELECT confirmed the handed-forward target)

## DECISION (fresh-context SELECT, anti-bullshit gate passed IN FULL — comments 223/224)
**N296 — THE f₄-EQUIVARIANCE OF THE SPECTRUM-MOVING SECTOR: the third bracket relation
[f₄, L₀] ⊆ L₀ that closes the Z₂-graded Lie structure of e₆ = f₄ ⊕ L₀; the mass-texture
module IS the derived matter arena (A ↦ Lmul A is an f₄-module intertwiner, FORCED by the
derivation Leibniz law).**

The ticket's leading target (bank the e₆ = f₄ ⊕ L₀ bracket relations / the equivariance
`⁅T, Lmul A⁆ = Lmul (T A)`) ALIGNS with the theory-native beat (S3, no redirect). The
equivariance is the W9-free FORCED core: it is exactly `hT.2` (the Leibniz law of
`IsHermJordanDerivQ`) rearranged. This completes the graded triple:
- `[f₄,f₄] ⊆ f₄` — banked (derH3 is a LieSubalgebra, N285/286).
- `[L₀,L₀] ⊆ f₄` — banked (N295 `spectrum_movers_close_into_derH3`: `⁅Lmul A,Lmul B⁆=innerMul A B∈derH3`).
- `[f₄,L₀] ⊆ L₀` — THIS node (`⁅T, Lmul A⁆ B = Lmul (T A) B` for `T∈derH3`, Hermitian A,B).

## MEASUREMENTS (workbench/N296/probe1.py, exact-Fraction octonion + numpy, EXIT 0)
- dim f₄ = 52 (revalidated).
- EQUIVARIANCE: `⁅D, Lmul A⁆ B = Lmul (D A) B` for D∈f₄ basis, Hermitian A,B — residual 5.8e-14.
- NON-VACUITY: `famC(slotA 1) = −slotB 1` (residual 0.0); `⁅famC, Lmul(slotA 1)⁆(1) =
  Lmul(−slotB 1)(1) = −2·slotB 1`, norm 2.0 ≠ 0 — the family derivation genuinely MOVES the mover.
- f₄ kills the linear trace (max|jTr(D A)| = 2.4e-15) → L₀ is an f₄-submodule (the traceless
  refinement; CHILDED — needs "derH3 kills jTr" which is not cheaply banked).

## DE-RISK (workbench/N296/ProbeN296.lean, `$LAKE env lean`, EXIT 0 — ~37s LIGHT)
P1 `probe_equivariance`: `⁅T, Lmul A⁆ B = Lmul (T A) B` from `Ring.lie_def` + `hT.2 A B hA hB` + `abel`.
P2 `probe_family`: the concrete famC action via `probe_equivariance _ famC_mem_derH3 slotA_one_herm hB` + `famC_slotA`.
P3 `probe_nonvac`: `⁅famC, Lmul(slotA 1)⁆ 1 ≠ 0` via `probe_family 1` + `Lmul_one` + `slotB_entry` + `reQ_add`.
All banked-lever, W9-free (NO native_decide, NO octonion coordinate ring, NO maxHeartbeats raise).

## SCOPE (banked-lever, W9-free, forward, non-vacuous)
BANK (Phys/Algebra/OctonionJordanSpectrumMovingSectorEquivariance.lean, ns Phys.Algebra.HJ):
1. `spectrum_sector_equivariance` — `⁅T, Lmul A⁆ B = Lmul (T A) B` for `T∈derH3`, Hermitian A,B
   (the third bracket relation `[f₄,L₀]⊆L₀`; A↦Lmul A is an f₄-module intertwiner, FORCED by Leibniz).
2. `family_moves_mover` — the concrete family action `⁅famC, Lmul (slotA 1)⁆ B = Lmul (−slotB 1) B`
   for Hermitian B (via 1 + famC_mem_derH3 + famC_slotA).
3. `family_moves_mover_ne` — non-vacuity `⁅famC, Lmul (slotA 1)⁆ 1 ≠ 0` (the family derivation MOVES
   the spectrum-mover — the module is nontrivial; L₀ is not a trivial f₄-module).
4. capstone `spectrum_sector_graded_module` — bundles the equivariance ∀T∈derH3 ∀ Herm A,B ∧ the two
   banked graded relations ([L₀,L₀]⊆f₄ via spectrum_movers_close_into_derH3; [f₄,f₄]⊆f₄ via
   hermJordanDerivQ_bracket) ∧ the concrete family action ∧ non-vacuity ∧ jordan_fails_H4 in the TYPE.

CHILD (the ONE successor, a directed route-finder): the full e₆ = f₄ ⊕ L₀ dim-78 reduced structure
algebra as a bundled LieSubalgebra + the jTr/jS spectrum-GRADING (the dilation eigenvalue spectrum
of the L₀ action on the invariant tower = the mass-texture module's weight structure). The
equivariance is the module intertwiner; the bundled LieSubalgebra + the weight grading need the
78-dim span handle / the "derH3 kills jTr" traceless refinement.

NOT banked: the full bundled e₆ LieSubalgebra (childed); the traceless L₀ submodule refinement
(childed — needs "derH3 kills jTr"); the ★5 mass texture VALUE (route-not-yet-found — the e₆ weight
grading is the named ascent toward it); the ★2 mixing VALUE (route-not-yet-found); "= physical
Yukawa/mass module" (removable prose).

## COSTUME
Next BID C325. Bites at the family-moves-mover non-triviality: e.g.
`reQ ((⁅famC, Lmul (slotA 1)⁆ 1) 0 2) = −2` (via family_moves_mover + Lmul_one + slotB_entry;
a WRONG reading — the family derivation FIXES the mover / L₀ is a trivial f₄-module / [f₄,L₀]=0 /
the equivariance is vacuous — reduces to `2 = 325` or the min-packaged false numeric).
Pair fresh, RHS 325 distinct from every prior.

## FILE
Phys/Algebra/OctonionJordanSpectrumMovingSectorEquivariance.lean (ns Phys.Algebra.HJ)
